Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C3ACA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 10:24:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4464.1790677489519912224
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 03:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aN2vOSjZ;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=raf8PGR6;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68T7UVMN431257
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 05:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=vb7xRY13tTske
	G/0U+L0zRt5YGVm3DtIZieeOBOdld8=; b=aN2vOSjZFSMcX5WARcnLSCDOai6r8
	W7fOj3hTKIv17gUaQaQgzF758DR2PitqkOsf2s+E1Np21g5enl5POOJgFZtz+V9f
	9cHmcbd0Ky50BflnpBmhXq0FB42ZqEwuv514xWO3ZapXPhRE+sMtQa2/3fQ3MCNB
	85M+Y6cT+Ax6MQr46bwbkmt+r3RfRSpCJfTLZljko6DD12bQftQ+tdpfpeAECowy
	FhPaAVsJbhZ+AT9fIO4+uEkTwIo8fmjL1vrDh+1vdLyvFwm21A3nNTS80Sr3ojbE
	+9Pf2crc8L0uF/V0ZEULlY7IoHKvcd/mhP9Yj38TiC+rhk2ffNTDFnVjg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6b5hp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 05:24:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fusXGjTOiQBfmBb9cz5jRs9ZMr/z/MrxTyEVfdjLQD9Y/SRxpLzImFgWCJ61fGVQ4JcRpXnButNL7urYZbELRlAmQXGsovjDgnDbcUKTjD6f8seIzEPLbm3jbnRhyOT+EKTUNAXqh1NqJ1Nd/WVNFoBPxswSVMVtvggQlFpZ4zjr/u0x96kMManvQP1qZ17+lDrVfMRK0qukEjd4V0+orH925OiTkO/OXzO+KJeYn9JC+fCdVzUiCrgVaf09n7U7PWJ0/7fsBiPDyQAHDnm1dcWPiQ5M//+soOS9y+rvK85Z6rvVn1RyOQloXBxfKCyHn272XEny5nng4T8W4vBu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb7xRY13tTskeG/0U+L0zRt5YGVm3DtIZieeOBOdld8=;
 b=KSm0FD9gssaWfDE/+BPKMqcloz3hls6J+gLN/HldiTOnBU3sk1dQArYk08riDBC/fwFkVeF7NfYnRLTPTv1KOfY+TLJZFI96BTUWO4ZeHM0yLFAKjX3mFY6fs182toD9m1F+PY34CXoip3BvOCfH6ZjIAkBU7ncjuJ2g2t5fnyc4yZxA+B5lXMk1MyKKLzE9+GkOsS8lUAjwbCTBDZ24+xsLTxdsNo/2mTho+LJpnk7byD5+Pobo8QKuJeLq01X/293wfmmCyJNHj2iOz/a7uj7Yedm/RF9oHL/G2uepxNG2sAqnahsLj31XZu1yfrdID+vuYwovTplCQ9YKN7m+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vb7xRY13tTskeG/0U+L0zRt5YGVm3DtIZieeOBOdld8=;
 b=raf8PGR6/G+H98cTgPVBymarl1nmHr8a1ox/NxAeST3PRecB9BEr13i44TUtEZYaa/8bSh60atWcH+1hfVBQrn27YaajnhCChBJfUlBgg2kXdqWuEMPlWScfDAt2UhevKmdSQy+z8FgroaUpCmD7TE1XrjLLv/hZE//CdNd4llk=
Received: from CH0PR03CA0221.namprd03.prod.outlook.com (2603:10b6:610:e7::16)
 by SA1PR10MB997607.namprd10.prod.outlook.com (2603:10b6:806:4b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 10:24:45 +0000
Received: from LV8PEPF0000005E.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::2e) by CH0PR03CA0221.outlook.office365.com
 (2603:10b6:610:e7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 10:24:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000005E.mail.protection.outlook.com (10.167.245.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 10:24:45 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 05:24:40 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 05:24:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 05:24:39 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TAObk4811210;
	Tue, 29 Sep 2026 05:24:38 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <p-gupta5@ti.com>, <s-kapoor@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.02.02 release config for J721S2/J742S2/J721E
Date: Tue, 29 Sep 2026 15:54:36 +0530
Message-ID: <20260929102436.618115-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005E:EE_|SA1PR10MB997607:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d9de50-5d27-4c0b-7ce3-08df1e13e215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|3023799007|6133799003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VWhoC3aBD2UpBCcbKV4505PtvmN5A5mzEk/44bEXjpqdG/Q/eAyY7pFe0ICYmCXvFQX1fPcw5cTaNU+gBfV2jts5K+9oWtZ2q7Xsg+Per/Go9tDQ5rh6uvHQlaBu9I44STK7V5mA+sf3ASQopNxKxATj2wA7kwMsa8AO31inlrSHNPhLi5eVmb60qv7tMp51jn/7HVS+6mhmqAQuC/rUeiaetJ6AAlYopztoozcmhWl/SdYer3R/3zdgWW2rLPEMY9W4s/rXDVE7XouLU4LbUVI53OqeoC/d58fQ0VOFgQtCXWfKMZozsjKe2I9PhsTkpM4uJjjyAmnXzVp2J5/AO7/jSf6TjKerX4smyHNh+BIF7wfCPzXh79KKt+mv3EDxxbjQT5GO7UzqwAMMZF4CePVACL/St63atD1ISHS0TXmocJPHIt6lPqRm+zjaiCeo4IYDFgMIusKLHFejs88Cun1hrvw9T7TXA/qQleY6u8MUREeGDRUb92dFffPA0mBMlcc2vBpQtRibqAcOSamhLv5Metra6oz0xrAqX0xZbhA45qPHlTJVkoClTzssBv1vgQ1AvA1fvuvQf42wfMqds9VpYqTX8jYAg0Uyk71rv/lztaHyygOv1RAtuLAVh8Dn2MzYNuE7eYsloV6/Ips69g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(3023799007)(6133799003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m0pq+Iy+4Ny1UwrFb2TiF4/AWM1res8Weex6dgzNil0Xju8i933dZ2gDNB4onJzQ6AKFIhkYln+PzlHQ5N2J+sAST7PYT43VTrinqjwbXtzQpIB6PGHfgCHJjeJZxz3WRVJLtg/a1CTVwvQe9egcZgqM5x81cJGrCTfTDohWe7Xu9PeF2r3FfGJ49ym95GZgy9ZkUAiEFTcT2K9EWqN5j9f1LX83t/EMEDFe+OHHa2nD3W0o5nH5mEHfMulz8t8iBOG71OZuEGa84zx8lhtomc71527/d0Rr4Ik8nt50nJBgnkvDgt08K8fE+G8U0NbzskYyAAfI9arGnxLoaSUKoWrsvJE9cQ0v3LqW52Uv/mNHdGSfShBNnTecZO9ritbZn5P0bHQaNFUJnmKuzfFBMl4N5U/R4WqkWbzJX7WFJ4Lf8wQuy+eH2BSBGXyJhx98
X-Exchange-RoutingPolicyChecked: 
	RPGMJEuUfqFjNQ1hltJmTq8O3xJ/c3femIGOqBG6wZEyjwkJFQLQeanlBNVfDS2OHm7ATfFbZhwAS4af3ZrhIA1pG7fVwf8iKs03nm4uZpqV927ZbjjW9QaYb8qyRPXN5+08qTtS3XJ3bMq4MjWNLAmg/zC2EVIsq3jxFCISlf/e0IXizmfz4z4RO8VVuPlEdsM5Aji2Gl1UxzK4BRqrQwYqYzdBsOlb/FxdboAu3rBOlVR86GSv/WU3D0QaHLfK9GaIYI7TkII5ihD4CWya7fvSDDxPJ4wzrpG12lNtIwCO1XIet/zTo70t773XbOrZ0oB7B3rp09OpIlOXMP7j3Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 10:24:45.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d9de50-5d27-4c0b-7ce3-08df1e13e215
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF0000005E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997607
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfXxXzHUDFVYxnT
 /MsAcBC/VzRGtXmm7ThZCnghHMVjlEpoX16uOAQ8iWkRe7dt285bPPJ5oqTv3VMyoWDvK38PLul
 lDgcKPgb6mJa9UoaUO7u9Fhv5dsj6WE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX7qorGvh3dpoR
 eIr6OmUPdrck0ZWoxNQJ6Ax6dzSEmLCHAor69688UG+QquIVTm/EbtHKpO5F8QZEexrL2xdKPnI
 OgMvGAHxcbjEPD3+4DQjuMKSUM1TZu3D0sk5PkY0iXhOrSZ0q9eiy4KkFHvF8AEmibufI5ng1A4
 5rSH8I6yCLcjlWrgmH4wvYQDP3PdWDnOuym/rzMXsHOMH0ZNAc0WjguT3EC7syTwc6nySZsxN7a
 /Kt7xzbiVdpSC5KQzKfDdnEGwILr7zs3kf8MKgy/XPtA7LAsWwus1gwj0Iwl/5qs+WtaEqBVkw3
 iu3PLoT6/PloiAsjOc6mU1htiAn5drgl3ZmhMlb996hoSjcuCCunkCwOFv0x2fETGSwqhzl3DH4
 xbJ3rh5ZmGXc0hSumX2RzcJAA1iJvpLRVGvgU1jmW0d3cwNBQbLSvRDoz+i+eFa908Ip2RjBSje
 zj+cN7zwpsQF+C5O4fQ==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abb91f0 cx=c_pps
 a=kGaFF29v6S4cQQ60M6zgkw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=9vKGkk8ZmcXlTsREfecA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: gFfni97nN3NI8x3Sb4pT4_iQy_n1LSy5
X-Proofpoint-ORIG-GUID: gFfni97nN3NI8x3Sb4pT4_iQy_n1LSy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290041
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 10:24:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17710

- Update the config for J742S2/J721E/J721S2 SOCs

Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
---
 .../processor-sdk-analytics-11.02.02-config.txt               | 4 ++--
 .../processor-sdk-analytics-11.02.02-config.yml               | 4 ++--
 .../processor-sdk-analytics-11.02.02-config.xml               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
index a880208..bef5076 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.txt
@@ -14,8 +14,8 @@ meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,045eb74bd9abe7d9ccf365a
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,cc29beb210ab94eacc53bbd67e287e4e33ede342,layers=
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,543550522f831479f07d332a40ba343c53ae1065,layers=meta
-meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,5fa4830828e5b14b9598948a2088adbbeed45642,layers=meta-ti-foundational
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,47437a7817c1f88213b1f27403b4b7966aaac813,layers=
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,3eea2c684b9fffb2c5dda40a569d63e9a0bd0e0e,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,5dc140cfd2ccd2b8175c123bae15b1c6d5a3ebeb,layers=
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
index 9b2cd7c..3b44144 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.yml
@@ -93,7 +93,7 @@ repos:
   meta-tisdk:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
-    commit: "5fa4830828e5b14b9598948a2088adbbeed45642"
+    commit: "3eea2c684b9fffb2c5dda40a569d63e9a0bd0e0e"
     path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
@@ -101,7 +101,7 @@ repos:
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
-    commit: "47437a7817c1f88213b1f27403b4b7966aaac813"
+    commit: "5dc140cfd2ccd2b8175c123bae15b1c6d5a3ebeb"
     path: "sources/meta-edgeai"
 
 local_conf_header:
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
index 50fae69..2c8043c 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.02-config.xml
@@ -71,12 +71,12 @@
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='5fa4830828e5b14b9598948a2088adbbeed45642'>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='3eea2c684b9fffb2c5dda40a569d63e9a0bd0e0e'>
             <layers>
                 <layer>meta-ti-foundational</layer>
             </layers>
         </repo>
-        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='47437a7817c1f88213b1f27403b4b7966aaac813'>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='5dc140cfd2ccd2b8175c123bae15b1c6d5a3ebeb'>
             <layers/>
         </repo>
     </repos>
-- 
2.34.1


