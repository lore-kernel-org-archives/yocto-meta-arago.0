Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE42CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:50:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34944.1792417848868940149
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 06:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OyC+FEn8;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Ujl61Hz5;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JBUrwH3096127;
	Mon, 19 Oct 2026 08:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=KZl38VjL8W3kI
	pQvdeCaJPF5VZQOOUWYzBd/yO34oEQ=; b=OyC+FEn8FdXqL5wvhXFhRWlCaoYU8
	qaZ7nl2Mj6rIUJ0NjqbdbcNC+CJcfAAfOYzA/KJm7PyykUCTE/AUa92y9Yx5Po7E
	IO1Vpyldi+Iku4x6STJrjAE5cILdWwxFmVDlLpcHiZQL/5BGDdskksN3u2iHhs2/
	KK4eBMZp2586wxDmooTGWNegUpjEIdewEodMGjjCv/cBPpV5QzQxmOMw9Po0qvHj
	Sxng6KLtRvcD56rZKChuITfxFHp/vWEbjd8iNuU32Ha5q3ibeGm3iRIbxasATaMS
	hiXx3R04OeQBis1BUUPhnpRbcnxnAajKakrF5c9q1WzsKI6wCu92vIs2Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010060.outbound.protection.outlook.com [52.101.61.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hdjda8vm1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:50:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiwfVoLnSP+rNrXdlpx32K9+iijjh9JCrS/IgaRDur8iaKvZ51XX9wDByQlRgyCP4sAHp5J6PqxxqZxWl94HC2yrGwjLZxawcYBPEIGDCBtAx+LW/aEtZjGim2iyUN4o4TzOoVoyMaZxZM9fOaAfygF8Mf/Mc9ckd/0XFVfInAFgZN1hTe88vewaZBYDRT5uu3voLxtLCco23a93X2aAoKAbciYpmxZlqsX9XaUz/VpCNypJcwiiJStUzn2b8wUp0Q4gQER2jKt5GQSg7qJC5SpkqhSvYHi2AtKWwczHQsxRzG+pvPbEMpd8PoGxOIRnOJ1vJmSl/fybf1ua2gxR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZl38VjL8W3kIpQvdeCaJPF5VZQOOUWYzBd/yO34oEQ=;
 b=T76LrJZrS+2zoiTUeZcYqu1uJbjoD++CkzKYUkzt1tV3snryk3rN8vge79MnYdlZ7WpE60P01GuxuntHg/So4XoQ16feZ3TvAAHr/9kqtmN1C17C33o1TM43cRNtO7TjSWSBIwDyMNY+b/pcxnv3YxCPYQTkxt+8arWvfi7cbBVIbGwuLK8bDaLPFXJkRsLrxsDz4Zij+OFFUCcx/9/LUgR/tngw2KXWxhx8JQLH5oeF7QfJQx/3rR0Hvg1SgbD91alKDi2aeJfVc4pLXbNqTFwxRAOsJQOVMegPE3ouUoljYvzrS60U9psJoIi8Imw2gQT2b6LRY06+Fjvkhlf4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZl38VjL8W3kIpQvdeCaJPF5VZQOOUWYzBd/yO34oEQ=;
 b=Ujl61Hz50Rj3kq9WO+ph8dqH1mw4U0GChg5qa0yRqBRkTQqeexizROPAMjyRXAKEoAERVSCUhgHjpwvH6ptVbgAwYjzeIoihNIckgWdW9s8tTqJCPlcYQ1ku3WNPxivW2aw3JlcY3eXe4E6Y4EdyAeT8ycobxj2v83s1gt6m3dY=
Received: from BN0PR07CA0003.namprd07.prod.outlook.com (2603:10b6:408:141::15)
 by DS3PR10MB997749.namprd10.prod.outlook.com (2603:10b6:8:345::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 13:49:58 +0000
Received: from IA0PEPF0000003E.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::1e) by BN0PR07CA0003.outlook.office365.com
 (2603:10b6:408:141::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 13:49:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 IA0PEPF0000003E.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 13:49:56 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 08:49:45 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 08:49:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 08:49:44 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JDnhwe2908125;
	Mon, 19 Oct 2026 08:49:44 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <j-sahu@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
Date: Mon, 19 Oct 2026 19:19:21 +0530
Message-ID: <20261019134921.3848478-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003E:EE_|DS3PR10MB997749:EE_
X-MS-Office365-Filtering-Correlation-Id: f47a6e33-2c43-409f-0f92-08df2de7dc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cZ6S1BX2zUW2a4FIxd4jivh4k5cqHBRiXmAWCSoo4s7Ef6T08xS509NwkmJZtPtEogC59z8rssQCB1uRq3r9pGnu25CUYpsujPU+Z3jC30/MxHc69Zkv4fN609ys4NsGrPRKlCjETrC1Pt3nIDML40hS1mvvHeQE3B5QRn1pt0CXJHGW5pzqR/4IcNUvuVCMIzqsJgsxs+f0e4rs7otPc6QmJCD3j7HVjefklyMAhQ/VLyKCFqMaJBiuQmROxQA/mLmdeg5Z61KmLQ7YUdeqkCJLu0Kna/u0CrhB9gMFpC/mIj8aOvGIRHkf4g0syk0EB5q6FdrQogBXPv4Fum1wA/Qa9gDRdJoiPdXSGvUEMHNLrDl/MDiV+tHDTjb0OyijLbY8A59lLXWCDhl9uyvIANwBsAy7acBUWUt66pDm4VxUyVImCzrzw7uwHyvNGjnKS54hzWZzt1Eyis/wlSxK8cEFJtaY1QFYWDkSILBpX4aWAejCTGnoB6tKcjuMn5zva5XM7iEm8X5Nv4QXmsg93Y08+R04R53R8STYHZP3C01k8LxFXZOU8Rzl9ZKlNW7t8HLh6z4RKT/qyk1W3aarDchkhSi2vR/gwFWIEBUqPCWd8ROaLhW7a2ZVpK+XmJYlyT1sYDJPGi9mK10OGVZmkyUYuFThFbVqCwzDdv9SVXGTAX69JOtAW98VnpegnOQXSLZO1QiSrBScncc/4lKu8Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	smkvxPI0NnpihOs7P29xsLRFNcMSJOV2eGdoKughyN6l1hKFDXrqmqZeNV7Zqw109ckkd/H/H9YUqig0VYc7OyrETnrsHanWoUzGSxen/1Na7LcfAdUj2N2AGVMaW7MkVgpbqvg8KrpflYYElC0CCQ7/Zdyz8C9au1iNAMls31Nu416+Rx5BVVe9vADXIU5fPz92ecxKlEzQqFmVtoLTx08pHJ1uMO09hOt4Yelb+U6Po/ypmJcVodp9Py7rN8uztfYzAxvgAUhc67psIceaP7X1s3mb5rtqkxYnnigWk0RSV5zr0e1Ygrqm1wNAtsll4K9exbKtD56kqArdWz0Rx7DBhPQvyECcLnaPdbH9vi0+oFYHu8JWp58VCvD2CFCCi4iMM2zgYUes7VpDDD4hLRL/Q3vPOIdwTuRl2r/nxHUNhC7u+oBH9xLOIW2GTEQy
X-Exchange-RoutingPolicyChecked: 
	rI64WW+kDWwpAUetGEHUvY+1w52GFsbQEsV8jCusYTOM70elizQyWhYAKcUEYn2Bl108VxFmgKcpgxnHwgO4q1YLKhqPWl2GOUlbKmo5h4tgMyOqH7w1pfMQY6qbdLOqZkuSfaTsUcGi4dY027x1eaIgpcehRFguQlgpYBdDcqGGqdyV0a3ZvoPmmEtN3dMU72GF+v2809QZ/mQfK98H+hfB8rpNGqSjTLk2ykwWuLftFzOvLbw1v8EJWXLVe9L/2LG61FUdicq/6UEifLe3ACiLpIjq3OUE9OlQoDIE4CQKgMg9wddut2eTlgiIjXvb5a/oshT3A3Vc97SRrMve/w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 13:49:56.9759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47a6e33-2c43-409f-0f92-08df2de7dc8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	IA0PEPF0000003E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997749
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX9bBwroGwpgrP
 pz8wDgn++DMqyjOP+GktMCq378AgYivH6SLmde8gErp5I/BlV8ca1wO0wcQOGTJpnPA1JltpnRG
 cnFiez/yyJonJn24btGaG0wGQmoALavni9OgjlJPQPBhKH+nC4PiyaRhen3s47raxV7qJv9diRl
 KdaALku2QeEpMxuPQ0mOaLBsCkHRBBU3kFS00c8uCSB/O/mvUqaE0CRQgQtyimBn7CVkQhzN1k7
 ns4x+ubAfiS9Bd6fOEM4hgvQZoXl8GDiaCSR/1iNHZtioSiLm5c3eFKOzhNe0Rs+HjW3IS9jQvN
 xcIGlDujbOqilgN7TimcZetb29uO+2LoUxESAMLEUOV+eWcHnzuOzqC8J5NANVK37tFdOulKmzK
 +pNcS08kut00194/blEsQp9ZUKiHPRkZfLPbIHUTf+ulVq0eN7dfkclHh88NQ3Zl4vZ/6PYSBPQ
 CkjseUipvrh36HeFjsQ==
X-Proofpoint-GUID: ZKVz9CXm52y99YC2glLtM-INJpe0VEue
X-Authority-Analysis: v=2.4 cv=HPNWhYtv c=1 sm=1 tr=0 ts=6ad62036 cx=c_pps
 a=p/cDci9/Gahjm/bBNnPm7Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=ZLDYKbl1NCBlcxUBIgoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXzJGcwuV5pMEa
 jmt4YXeF7JVfeZvpLpA5oHWhlhvevd7+gXBxa0BbGfeBRo0Up7TdC6+pFTSdjAeApHJo3cz53Ao
 q+x024NKJ5tOwD5pbe20e9pdgkfA19Q=
X-Proofpoint-ORIG-GUID: ZKVz9CXm52y99YC2glLtM-INJpe0VEue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 13:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17743

Configure PipeWire metadata to statically initialize default audio
targets sink and source at daemon startup, by leveraging WirePlumber's
find-selected-default-node hook priority.
Also update audio format to 16-bit signed little-endian and
audio position.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-ti.inc                  |  3 +++
 .../am62dxx-evm/90-pipewire-sink.conf         |  3 ++-
 .../am62dxx-evm/91-pipewire-source.conf       |  3 ++-
 .../am62dxx-evm/92-pipewire-defaults.conf     | 24 +++++++++++++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf

diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
index 65a82671..e6a92202 100644
--- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc
@@ -6,15 +6,18 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
 SRC_URI:append:am62dxx-evm = " \
     file://90-pipewire-sink.conf \
     file://91-pipewire-source.conf \
+    file://92-pipewire-defaults.conf \
 "
 
 do_install:append:am62dxx-evm() {
     install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
     install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
     install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+    install -m 0644 ${UNPACKDIR}/92-pipewire-defaults.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
 }
 
 FILES:${PN}:append:am62dxx-evm = " \
     ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
     ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
+    ${sysconfdir}/pipewire/pipewire.conf.d/92-pipewire-defaults.conf \
 "
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
index 857c344e..bd91a9a7 100644
--- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
@@ -11,7 +11,8 @@ context.objects = [
             api.alsa.path          = "hw:AM62D2EVM,0"
             audio.rate             = 48000
             audio.channels         = 8
-            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+            audio.format           = "S16LE"
+            audio.position         = [ FL FR RL RR FC LFE SL SR ]
         }
     }
 ]
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
index ac7635de..467ae525 100644
--- a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
@@ -11,7 +11,8 @@ context.objects = [
             api.alsa.path          = "hw:AM62D2EVM,0"
             audio.rate             = 48000
             audio.channels         = 8
-            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+            audio.format           = "S16LE"
+            audio.position         = [ FL FR RL RR FC LFE SL SR ]
         }
     }
 ]
diff --git a/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
new file mode 100644
index 00000000..fac730b1
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/92-pipewire-defaults.conf
@@ -0,0 +1,24 @@
+# Default target nodes for AM62D.
+
+context.objects = [
+    {
+        factory = metadata
+        args = {
+            metadata.name = default
+            metadata.values = [
+                {
+                    key = "default.configured.audio.sink"
+                    value = {
+                        name = "alsa_audio_sink"
+                    }
+                }
+                {
+                    key = "default.configured.audio.source"
+                    value = {
+                        name = "alsa_audio_source"
+                    }
+                }
+            ]
+        }
+    }
+]
-- 
2.34.1


