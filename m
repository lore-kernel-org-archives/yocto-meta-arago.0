Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B7DC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:29:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12922.1788355768640417662
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UVnbDjBL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ABCg8a5A;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CVNPM2484024;
	Wed, 2 Sep 2026 08:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=02HYlxGynEl9+
	cTygOOkRctjxM+pRT4GfFW3ATr1K+w=; b=UVnbDjBL1nYElOc7ERY4oLcznqZI5
	08kqhXs/bCZ3IsZhBxwSSxQrizt2C8Kd+YmpMqMHguigyBpmvcD9c6KZNCND3nKp
	dmq8EnfPqjJyuE6vz5w+ljH9SUxUZJrzLVkKGPc800zlCbxyzPAnm41U03eLdhjJ
	HggvCqL/5AJnpK50HMSXEExbbwatO8ePPZTz6yLQIfm3bjhvfMCw6AOIahyQhRB6
	F/va3lJw2x10DkXc/gN/TNXraTVU6Iz1GB4infhNVFqZ8HW1v4KmhSiQ8cOQ0aM/
	iDnekjldMqcYZiZLtSskyrhbD8Xjc5Dx+BP6596zUS1UolXIYZmTstreA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ge8squy0r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:29:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX9sGlJqpKz/6SOQrGL1LVGcTFS8zyqgj5o++hHxw42XfkRwt/SoEENeBPskLDTxNNFHAgxjK3UtPOsAtVMaA+Gzo7vVtz37JiSGR6W/1Tnxsanr6gzikV1JlpgtqZSSir42cGlFZt32U/l8TuEjj6eB9UTNyliyqzNrWcKZDzoEdQ2ECpxHs3081B647joghHOvqmSKHJLYz5sw3LGUTpxs9347mwnCjg2NavZ2BYZyvNhHTNmUDM4MG5gtSyBeDbDdeuHW9qDpsWGHvW32IIZA5OWgVe50TS1KchChTFRHdd52KBILtsDDsBOb+vAmaDqmXwtNATN440sQX86LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02HYlxGynEl9+cTygOOkRctjxM+pRT4GfFW3ATr1K+w=;
 b=i/rxoScOsg+CcqN1HbHk5YliUJGuyf+2GSUDeM6YkXWkytvkP4PTXYISJTR3yMgmv0idwXf/JSvr5oBumCKUwEak2NlSbKGDyqyd/dJAvmBx44nv8irIIkbO/rDIgv7dTyalzghAwq4mpQUVEbLQYHqTqPWL8TlIKTk4gxuoqSRUOFQ6FvzvR4IydgFzXEoLIAMLii2epXgX1NRvzdjPmtSP2riroPiOLRlHr5tnDV0LyTr77t04jgJ1l6MdDV/8IpvL1SLndjKtZz2K+OWfAxuNEZfNbpUu4OBDEZ7sLKTGpFNR5d3yu1HP7CEzEWjg2mhN/sIByqI/dXkmYF/TBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02HYlxGynEl9+cTygOOkRctjxM+pRT4GfFW3ATr1K+w=;
 b=ABCg8a5Afo7dY5PtUgCYoC7jv9xwkcabgoa35hX3AXJH2F4P/1TDX/kUhDiuMzmG9RSRbDbs9zIfOCFiN3Hf+XrryIQKRM+DipnLw6Jwc3qbl/hzOKdX0lY/4bApIADZ9vbEkW8Ec+QrUz0w32Rqv+EB/TyhUGRVojgHNWo9Zf8=
Received: from DS1P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::14) by
 MN6PR10MB8167.namprd10.prod.outlook.com (2603:10b6:208:4f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:29:23 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:44c:cafe::46) by DS1P220CA0027.outlook.office365.com
 (2603:10b6:8:44c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:29:22 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:28:42 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:28:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:28:42 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682DSdvH681184;
	Wed, 2 Sep 2026 08:28:40 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [PATCH] recipes-core/images: Build ti-core-initramfs alongside tisdk images
Date: Wed, 2 Sep 2026 18:58:38 +0530
Message-ID: <20260902132838.2135551-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|MN6PR10MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: ab69cd9f-a181-4971-c095-08df08f6335a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|13003099007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nfngWQPFxFfZxRsHCo9/MIjcieZ5ngz/t6f9Ykx41gZnqmgpHZv8bm6C6bmrSyxfqys9meYSwQp2sS4pXcl0LoAilH65CDQHsKznCyfLyhqGtfAX3c5zQNGxulaPP/LjqTECadRTxF8r3rvZnRP8RG8EPaZY6b0NrEaa0gWdvhwlgFTRYcjOnLq0LC1RlQ6oanJ05oitUrQpEOwoZiJ/HMajHVVX+tzKTHlsTAvs6k1ls8EQxJ51eMwxP01HTaxcSdhf04wZo6fJgD/xf0Xi9BnJGWQNbq+JXG0oIQFi5Ylaapj1knUm8Vouu2jUvQk0Z1wbYaQJd0yNlmwz40SwPDXcWpvlQjXbkzocTKLPOpM3Z2lH4izaj84gbGfbrvy/l7w27hKrhdb/V3bI8IwS/fPAQcUINBevHkEBsEWnrPlsAlUgHbOor5qhE5R+s24mETz/dHyMwmKOTp/OZ4M4RFF5thLeGFwTXrv2M4QC8rnFntQocFDPfbrNw88NX40H5WTUpq6DNEesQt2mOSQhwiAp+rUtxfVBAT61CCwXArrTE1+ERvTlifAD7PM2y5q7i+RUtGu6ATqTEjOwHW6iPv4fae8oTadLRmAOKeHI9nezsC9T+pOmt/G/J0qd5MmqdO97TtjXxK9uajlar/B8+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eNzUmj+b2SerIRn6Nzu5cwxi5l8HO5JpK985h9lDTWbDDRcAhGGtVugImhoBSS0rGvUIav01NIPa6BLVaCS5li4cO6qqq5EX4ff+4Q94pTxv8vVJjQ7argxjF8Y5P9ylcz59PZd/7duLhC5gG7DqA15Uopk/eNo55+djYYYxc/47XUNLPAL9I8/YsECgQg9FvRQu3xHw/nSn3Bh1S1py4Qxauyg1jSPPaXSWBEvLAD0F+U5+U81mcqfUrkMB/h0jEDfa/v4XznrH/9rNuJxC/xw0HuogLEW8Xfqr8nzyFb2wGeA1M6pQJO2F3ufvCeDXAgiTLGNDfmwpgHy3ogPZ1CE0+2Jp5VWy4BD67T62kNCF1qiS1c8Bt4Dzwtu+P2eW/giN1T5ZTqhJ7pu80dC7U9J1jEJs8K+LnLbOVi4uvXtOKgRrNKEx48faP2KGnBNY
X-Exchange-RoutingPolicyChecked: 
	lleHHbUKnWI6TgFMZdowXrkCUb9G3y3FbP9lR9yyIVvypqEhMbx/V7fPG1MTBEz7QjiTJNi37ojRJp2SaprgY6gIS1Xvg/8biY31WiYR9s1EMA6TUPtEG4g12u066xn0xWzNfUHRE55ulSRc96Q6F6HL8tsgKKtTFaL3xlJlAdwhTaX02Si6nmjB8+P8cJT9sxyWB9UF4uTdpl58Ibu/b370U7JPG3G2154+3y7tq+JY/jIOss8wMtEPW8XNkasSGMPx6Xh2bqMSIZCP4TDcZlJZtb8rZ6dKtV4/cftVXTnKEuOZ7s+HiROpsM93zg6wZOtiq7BzzGq+5tvzmZZ3LQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:29:22.5113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab69cd9f-a181-4971-c095-08df08f6335a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8167
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX+2K5XAwxXDbm
 0mkj/e2msYzLJiwghaqROOW9lb2p9fl4OzyPjdKokCnRXbIH95NnKgtdzjW1KtKrnoRIVfr6+Na
 Vnj1G+tL7lSGXJoJIzcxa+z8G/3gfcA=
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a9824b6 cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=sZx6Jh3yVY5d41XZOmgA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: QTtkiyT8R0zFTfrVx5uXXBcAsGsyjgwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX6ysRmocarRoU
 KDoWVVCoDKbuGiUsQVp/TNTUcn2+PObEPU5DbTtZnccw1kk5Ss79ejwDDmR7WVbVNsNcJXMFGcd
 zZH/IDjI/zJyP+QskiG+tvN/F0f4v6UVLPrpaS0/698Te6tyoohjnIfZFnc9Rm6dUSxziECrY2s
 QuepVs9VS40c9A3CK0wfmOFPb455B5+e011KX78u78PjwgUQO6ysCr0Annv3yZyRQgkqX9zprGx
 ZfN+yKX26T/84HZCF7WGTPhgBMKItpXClF7mrtW/iDhKmc8JvVFg0Q9meOIuaM50/lE62civTxj
 D5rVJe6EsKrUOyXujDfwpM7Bu3nMkmLii9H7JS20lSoM4YRfQKY0vNAeLCq24oidPmpxh63UPZ7
 aK12MVveWDqJPhS4Nqz8rSrejFUMj63Wdy4fXf2iQ+wCZkg5l+gl0J3s727M1RV9SMGqT7p3Iop
 B0byHeVkDeaXrx9bfxQ==
X-Proofpoint-ORIG-GUID: QTtkiyT8R0zFTfrVx5uXXBcAsGsyjgwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020119
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17643

Neither image sets TI_CORE_INITRAMFS_KERNEL_MODULES or
TI_CORE_INITRAMFS_EXTRA_INSTALL for j722s, so the machine-wide
TI_CORE_INITRAMFS_ENABLED gate in meta-ti-bsp stays off by default for
this machine. Force ti-core-initramfs to build via an explicit
do_build dependency in arago-image.inc, the common include every
tisdk-*-image recipe require.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
This patch has a dependency on the following series: 
https://lists.yoctoproject.org/g/meta-ti/message/20235

 meta-arago-distro/recipes-core/images/arago-image.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 37b20850..398e299f 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -30,3 +30,7 @@ BAD_RECOMMENDATIONS += " \
 BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
 
 inherit core-image remove-net-rules
+
+# Force ti-core-initramfs to build alongside every image based on this common include.
+
+do_build[depends] += "ti-core-initramfs:do_image_complete"
-- 
2.34.1


