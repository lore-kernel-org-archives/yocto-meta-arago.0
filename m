Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B02BC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:35:35 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70585.1783002929005781149
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 07:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FoTNJzrx;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=h4m2PVBT;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E1tCI2618134;
	Thu, 2 Jul 2026 09:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=oA/7tyRv93kPi
	m2t5BPdBLndX9kcZ0UmCQGkybTiXGM=; b=FoTNJzrxfICEZ9kpuTcxTmpM0MI92
	Q8GEE9iFFpxg/O71EsZUDNHlb52AclU/DTwTCrXGJX9XkTYaCatbs9m0EiJHIkzO
	nCYtIf2BKr96pUw/PXfWvQFg3V8pqGSWTK0GqoPV94sRYvKIith2iptNcNTMBXLJ
	D571mRCC/KUJanxSxyHcMls7k7Q1r0RZ2ZTdF3FiUzwmgK2i1bLNRMazcygf1R53
	oT+3CLGg/xcXbE2CaLLkGzBIt5/u7eWO9XUL1puf6kA8ZweRSknR8YhjPlBFfZy0
	08/A7j3Nr42soLs5PcLfk7VlrxQ+2nFWQa9ut0D/renZy3KJ4UtTrqcSQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011011.outbound.protection.outlook.com [40.93.194.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5fvykds5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 09:35:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYSdFOdFvMVaIyLLs6tmMNqa0UgytNqnjmxwaS+PR697CEaYzCXi1tl5Q0H2TRjTO6Y5ra3RslcZ1oGCNkh+0UVCrsx9aJ0e38djQ5TIu5dJLr1mr/40jrGpTbSP8EcSGI7RVC7/Td+ap3vqULhROWp7OEsmITtyVEUrF9bDWKuK3bNlIrxVlZ0ehlr5/9greXY0CE5a027jVDZJexErq8pdduSrRMeRdgSHSp26cm+esf+Qpr7k5mwUVcWI4FS6HOkDPyIQadDSsnpbWEvTtL3SrBKdwjcorCntoCCfgnvKmysoNHDF5PCX/lH02fD3tF9uq4d1MHMPjCVU2HiyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA/7tyRv93kPim2t5BPdBLndX9kcZ0UmCQGkybTiXGM=;
 b=pxs70oTOI3L8WNIQ/4L9m3T9mPrOLB5sD1lry72mKqm+nfDV15skRLbxWhTakp4iQZbWWZnBY0Jm6viRMueVHk0IuCnFBGd1nC5ZbZ/J3wEssVnIDol5Qf2V+Kpcg6Z/iyKEbueatO8mH5dPAB2P82ymntP6Ny8mhnP5QS437/qZ4XxFkagfmXe3Q+IaAE6ZHG0cJ9kMeP3poCKqGdqU0hEu+dUNWQf+6zhlNAWTxO5RHJyqzMexMJlrMOmtH3HZPejQMusW39BnZiHAx9Hi84y+8z5ply2X+g1E2UfTGnmKtwz+tlDqihRIM2UYVeUrPLDKwymbc2Opfp4rMmTTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA/7tyRv93kPim2t5BPdBLndX9kcZ0UmCQGkybTiXGM=;
 b=h4m2PVBT7Q1R2gCwjLdisQ0ErLQPVVo3L+3w6P7v37CWYjf6JNIofyyVHfQzNuFioq/bga/9Es/MRrISOIJSfJncIEQzMb68Tnny1WMwPKJvwxC8GP4Ax4PkFmDsAvNFYLg5XmxIoaFY8CaLgI5uJwKTlpFLUkXgXEVNmlctJ6o=
Received: from SJ0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:a03:33e::23)
 by BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:35:23 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::89) by SJ0PR03CA0048.outlook.office365.com
 (2603:10b6:a03:33e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Thu, 2
 Jul 2026 14:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 14:35:22 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 09:35:21 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 09:35:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 09:35:21 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 662EZLpV4170999;
	Thu, 2 Jul 2026 09:35:21 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/wrynose][PATCH]  packagegroup-arago-addons-sdk-target: Remove ti-rpmsg-char-staticdev
Date: Thu, 2 Jul 2026 09:35:19 -0500
Message-ID: <20260702143519.495226-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|BN0PR10MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d09e467-b1bd-45ed-6ffd-08ded8472612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	acCxC1Ogs4pdIFi0yJWICZCjh9rV24s7NuT/azd7N5Jb1Kc6+XxjaEJmDvuI+OafXCcByIcLJN4kfxWQiM5cM5BOCgyBarsZhhj2+jsPVNYll6Ni9db/D7Ith34Uu3LMWpc752Mrmv9Tf5TsGESu4IkpN+N6Ykjfxg1YmBhcA8NiLaPfmFy2CXJl7UbMtmEMYt5FXwVFGCLdn36Ep3eRHXadnImzI/R6cTD0fpYSMk/+HzOQ/Fhhs8QWreXpaQD7MZV3Div8I3Y6KnJGb7OQdLXzSkoyKsNMNhWDi0CQpzvHvb4hAu5WIfbOxeZfACrShmU5ViMpL6LYTXxc5Vy3liPk6H2qQZO87vn6vdLEGJW57PyE0oQD+xxlNI/HLnP0zks89TGFz38X51p+7+uRWWdxDSYaEJt+/eBA8gOatidAvALENY74tqFvqQUqFWwI+6IKy9UFEzmApZAF0SUZEGgYvSpcX+yAvoaYZ482qaqZds5BZ6ctLi4MGRIpLkDxYVnB0yuUfWmL8PabdDn6BxJVEo8LeXEn23Tz7S5z0BIlxWh52UlXky3PV22ryQa61e7/fnudRUwNBvTLDWUxoZSBUf8+FLdi84NE+oawmAMrUbmJ4s9PFXIZ5alXZbsUKdtgnZViZ0GRS8oaIKFKNfkwgw4mNME6/KeY6VzFF9S7pTtqPTI9tw/oq1ikt9+/ZrmoJ1haOdNu4HEgK2QIyA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AhuRGkRFx122i/96zqV5hITNiRc8TPRygfkB2f/PMJ59QA+jDv/cXhtkJ4Weu7xeKU395CR4hcsSk8HEHwxdGqVTPLDuOVHg4WxIQKW/ZGU8KPwIcoG9Qd/hUNYszPw2bxFkeBqbsL9efmP+NUE2ybSj65YmMak1/TpVi7S2se4R67grBle0t7SZ5zVQ4MM3bwyExWNBm2r5TsvVZ+7P/BlHA0g/HXC0nAzRw3BYbGkQREEnUFnGYrUd5nHSnUjDpUoejosTts0pCVLt3AHIv/T41Vc3hAxAPFZd9NRYRZIyxs1CD/D3kfdvKo4KsIZ1hj0lY1ld/yv77WuNGyKmem3d0g50XWieim/FZkDGKU7E9m/PFLTuEYgc9c/TAhWWR7RSt1OMY0w55ESQ+MAERMT63mTZZVGWD52FAuOunJ/w0m8zYeI7NwPyb4uFDmNI
X-Exchange-RoutingPolicyChecked: 
	UHULPCuofAXw10Ntyo/k5FYXrc5cCLlHKQItQPdf1D/TOkjdeT1nm0Wd1wcq9S7SpeuAfF2C+wqieqLRiPq74uS+ZoA33/Vale1j4OfGZoNncke8tbiSLVTgrH+kcgwNa9xLTqCJ6WBIDyqtyCam8wvvilC0jklGce9EiHZxS+BpjSAOv06kQlyQWFs/Z+K7OodfASsawrUs3PmZTqaUpXn2x4zJpCTdMnU/Fsz0piy1/QFC8c9cfFpZF7m2m5HuXxJa1qGULnBUR7QdBie3Uv3cs60Bzvke9IhZ+ExlmOlWsHHZuzZqR3Xqg18DDtO7Ry9zKOZpsROYFz03ZgjU9Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:35:22.4901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d09e467-b1bd-45ed-6ffd-08ded8472612
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4901
X-Proofpoint-ORIG-GUID: -2QydFQexk7jYXTe6QaP2V_uq_4FJ9la
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MyBTYWx0ZWRfX+f8BKIt0Ku1w
 KaPZ1cfW+4p94faU7TduxCWCRmfq+tpotvE+NRGqDaLJX2N0OMPdpXu2Sfn5FGg2m+Slt9ywnFC
 XN5NwDpq+im2n7IlnETKniTm5Y3DLhimO4FRAtBCcplwKwJ12kyal88jiHKu6mPZq5UyP1L34z7
 zhs+t31qYsCejtsV1n67oDvnbnf2uISj1ZRooGpyKf45c2mpM4oiMm7IytGNJj/R13BaKXbKtcj
 xSKWnaiVYlCoNUYSojGrPxzBKMrovtH5S8z1VPcng5GcH2u7Sx/LShEgYuvSfAu/W/9ulo759VN
 ytpfzRd/9MXBGnLWNRZxI3mfRm/QIHQtvK0Q5IKFCgIoyvUJq3+heqSUUBPrCCIfohjjWVj0yQ9
 BVesViZBq8d/9b6Z6jx3rIbyJUCyvrE3D0u5t9ufjK0+VFweY2oUCclGy4BXvgXyLTcq5kX4ymp
 G+JxhV12F5E4yMjlZXw==
X-Proofpoint-GUID: -2QydFQexk7jYXTe6QaP2V_uq_4FJ9la
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MyBTYWx0ZWRfXzx3LTBeqMHfO
 K54RMDWrzCxy1CrUmuNHjiabdkL/wPoBw9bzIhIPEJlvZPwyouIBomm/1U4pOlbTYGJO+2rrN2b
 tu5ET4MBcVWtSmlWq4YXMOWNhjspwTc=
X-Authority-Analysis: v=2.4 cv=T+q8ifKQ c=1 sm=1 tr=0 ts=6a46772f cx=c_pps
 a=Rayal3q6byrlEF75E5QjMQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=-6jaxMPFkQFkYEKZHnAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020153
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Jul 2026 14:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17579

The ti-rpmsg-char project will only produce dynamic libraries by default
going forward (like most other libraries packages), so the -staticdev
package will be empty and not produced. Remove the dependency on that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-addons-sdk-target.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
index ae8f063f..71c844d1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-addons-sdk-target.bb
@@ -22,7 +22,6 @@ UTILS:append:am57xx = " can-utils-dev \
 UTILS:append:k3 = "\
 	can-utils-dev \
 	ti-rpmsg-char-dev \
-	ti-rpmsg-char-staticdev \
 "
 
 EXTRA_PACKAGES = ""
-- 
2.39.2


