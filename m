Return-Path: <r-donadkar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ACAC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:22:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5972.1783509731225198451
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 04:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=M8nNY8mj;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GdA+jVtf;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: r-donadkar@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668BCrpj1223569
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jul 2026 06:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=WKmX0zAUNgjRV
	3o5SpIfVcervNwj0m6JMH4xtREx2nA=; b=M8nNY8mjTpUT4og7cPhIOXiTdQEB2
	YTheKDRBiDyGIQTPBWK7VqdiSH8VOVH+6t19YCRwbbhj2OYpzbdAKnrpghrG2o2B
	1wuuHsFO0Q6XU+DYjVSRCB0xCyjWvu7ZL+4Ttv1T32sejgIuoCWaOcR2hUnOjnSG
	aqvd4RDRpc5Xnm3u5ij7BH//XekjK9tw/sd9diJiU0RhXb1kbuJt/iTvyITQTqEv
	PknIq/BSxwz6w35DR5EGhZVMHrU72j/wb67JV2VADUjgGzo2Bp8+qqguG+zAU+pg
	2XS+tyRpsPcQzrbiy63Pet1Z+fZFImjLGlfBXYbc0CB7PeprSEvoeeXjQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f9nft015x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 06:22:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvQyqM2yLhDXAcRQ6OOmGBXYALzlBekCxnzzSfhwRY9eBkwkuzW9FHT30DLf7zIR+ongpzYp7qi5kMqy7PNb/ifMRZ6vyDn8dxEpJWAflRrxiHhduo2PNfr3LIeCexiG1ldEh0Bf8Ls8rWkFe+MlVp1H0CIM1SW6RvmvoJPR4z7HjBCwcAMuZuYGXef06elPCk9BsSSTM3p2GIWoUH9ZzFBbbVysZm0DNgS8nwfxDBSXfs5bF2rBHajqyf5ArTX0Mmgofw8wvS067INDy2kyE1PbfNCd3IOZKknC+Gzied8uQ181rSWr6nTJCehvN6biznqwI3JTIndSl6mxYbpoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKmX0zAUNgjRV3o5SpIfVcervNwj0m6JMH4xtREx2nA=;
 b=pO8buOuLuacZg+smqcsdZWDFj/sX6FX7kZ7ephLE6XX0FWC58sd5IXsvSxo8IHPpkHegIMYkENZzTjumyGG88BEEKWodIdzxhEMEBWDpBVQgqNXCi3kugKRy3WBCUF10+Fz6oOpJpagy4/s/cZcix77QdCe8AdVWUeMQ0I5Js9kBaxYKbiNAT0FmQwyEtT6vy60DWeTDXLZOzh1wrpVLtK6E683qMtUdv99cUGMDyUAgcetHU2G6b45akQfPHYXZHSie3Qc2mJ45luK8sBbeSgI6G4KSijv4LD361IQ8TmaIfNEqnaIf/7QpatNZXZbrAq8wQg3Y+XkyvP8U90WqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKmX0zAUNgjRV3o5SpIfVcervNwj0m6JMH4xtREx2nA=;
 b=GdA+jVtfKbtZHy44wcaCCypQgOF2r4I21m0WJUbVDdNDSlqqGeDN13Yb4COLTVcmBwpD+Yyv7Cnzvql9hlufRb6S1jNhJFCRvRWqeZcfZkZAgt8GAqnu5Ft0URH/xvFg0+9VFA2MQWi2zR7VKuiX11VSJ7Xkdmpx6cGXVSTdrVI=
Received: from BN9P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::15)
 by DM4PR10MB6696.namprd10.prod.outlook.com (2603:10b6:8:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:22:04 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:13e:cafe::44) by BN9P220CA0010.outlook.office365.com
 (2603:10b6:408:13e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 8
 Jul 2026 11:22:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:22:02 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 06:21:21 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 06:21:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 06:21:21 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668BLJP32634790;
	Wed, 8 Jul 2026 06:21:20 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <devarsht@ti.com>
Subject: [PATCH] yavta: Add patches form embedded metadata capture
Date: Wed, 8 Jul 2026 16:51:18 +0530
Message-ID: <20260708112118.2275058-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DM4PR10MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: e44522bc-877e-4edc-34fc-08dedce32241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|3023799007|56012099006|10063799003;
X-Microsoft-Antispam-Message-Info: 
	CShqOM0piPnWsW3RjECjuvTq3cOUkHfhJRxBuajF+tMyw2KsSGq3QMNRL+0BNzZaRx+PsOrJllaMolOeFPdykbxZEbKse2ukQ2VELiKJZAkoLhsmoHKM031s9g10ReV407gEuTvb7NXRbYfObnJbTmt4rWyMOa2eP2HdjwsthbngITneurh6qKBWy+7tqha5fA0aZWJejA1KTq2z0YNtyvl/ozLm1YzgC3NvlVG7v5G8RLTKhPV6LZ1NwT4wvAoMfTSECcOp67fgcGaTbH7hLU7baniWVJS5Nn/rDjO5h9lxhclx+dpkkm8BIxwLU58XZUgYPbg+XmeKk/EzIENqGuib9fNExwlQ4cAvisxEhP3p2TspbdTRx+fs7F87V94yHMu//J7fqeRqj2CZvZVjVFe7qHhmpGK2m8rifNeaJxGNC0ihlPamcp4MBm8prRsHAQ8lfgKFSOLQgWVhdWa8zZbb1hlJPpKqR0+cveP67W0TTsJa5lh1uZH+lpRzGr6GD+T7M3d6KK3KM2zMlfHQoXv55LSNQNjBTZIaUwcAKW6tvQODL90tHv1PRePiybqApjsDhUnsAq58Nltia0SlKrf6oSzexwd4tbrGjmUVPMqxR6lpFNZD0w1HVS/ZnRtO/5X0B3su/jJw5v6b+I/mDxPt3lt1r+NAgg2QSt+pKfoeIn+sYw7Zcw6fCH67tS7wO8LCVAhrReuOXqj1YuF8MA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(3023799007)(56012099006)(10063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9wbW+Lz4ckNj2NlfXPUgkuRlce4IVMIoojIyYZCOutIcy/apv3pThirJiFNeNyekZYlwUAEp3RITX3CSDzD98pp54Ax11/UYhhZM/zam6FRWzz8/lxTdORjj49jquqZcjdyOb8ktpRuhGJEA2vmf34afiq7MWlhU/LXgl93B9iNrLHP9UprOXErqRx8wIRvz/QgDcy23ZhTRCGn393uBJ2RuPrMYmZHY0qf4jmqWRLwR5hgxut+CdZz8Q5Ps06SEGOWPRWV1r8+MoPk0xn89m+cjBaHlfujXazWHayksy3mE1gs5H3nCatDi39do/7tmknOJhiM8tBVsXuyo60qUU0Y8vfdl5pUHrLPtgjx8+kJJpx2bFuqUkqf8CoO0+sFswitZUiwSgL+sD3zZhjlZoTi6OozCxvbpP1ZHarw29zjWLtF0uMH1mWWxK6XdRPQw
X-Exchange-RoutingPolicyChecked: 
	ECclICht8yMjBZofCp++4PYaQy9VIvkjRrN34V5OXRwsdsrYoUmbMkXsEjRiMyUkEz5hFch90Fj9gW+eGRfbKP7HpKC9s1AouaIsAnABLQai6smLmdkEMD03Q8h+mANdImfaBSL6J5KoL18+v4Go+vXFCDE0dlxgx+WpOqmYjU9CX1Y8qisBCLY8a9y/FEu00SZl3iT0lIGNahQvpHU73ZkSJpgJwvZhyLx/cwfwns0WgnQQ8HUUU3WMNY4zOH2tlj3Rir+iCTDo29V5bj2FH2Xu1fsH3UTgZ9tNJKAhrq6b8BnIpblWjgeBw4TiQDJUBDXYttt2maxZpJj9iN6tAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:22:02.2360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e44522bc-877e-4edc-34fc-08dedce32241
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6696
X-Authority-Analysis: v=2.4 cv=AaOB2XXG c=1 sm=1 tr=0 ts=6a4e32e2 cx=c_pps
 a=Q/wuv1ctlB2aVCAjPXHW/g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=zpiXRNMHDdhXnHhP39sA:9
X-Proofpoint-GUID: Jlt4F1SDQBwaeI2p6b96-NkNGTip5AkB
X-Proofpoint-ORIG-GUID: Jlt4F1SDQBwaeI2p6b96-NkNGTip5AkB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX1z2GYfJQ6f8H
 skj2W5L5FC2jHpZURxolo0qrOkj5KBl4muwd5eCxiI6E7ifuNEf4sWjjt/07leyJkHK/totIFue
 qbxw5BhGtVUdAW2aTdpTRRHEXgovKl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX06VCdEFq6alh
 Szr/KbJL644Y7TpCMJAUtw3yTR5aHk+bu0Ewr3jr5f19cZqrDvJn0DOBSHV9J2IkQUEO5LBvn/L
 IakZX4kF4MYFCy3rDHhVN13xelG+o1lts1Ons9GSNKaPIQedYnSy8FnwGzzo24JcxM43dWGcmXb
 a4T4jJRINWdSaV+7MQVDpbmirQmLoQ6x7w4XuuCCnLwaifCZdYlSIOUsDSDCBmpg/1eipPOqGQh
 cJ12bjW10INQTNTzHUeAC1qJ79STCY1sl3X5O6ByCR1fCX3fVgSn1FozY5uATlw3gBkY8b9QtEk
 2OU6Ae4KRALyUEQfb0Fu0RbKL5kHMGnhJloWIoRH034xU1NAK5CuhsZTQBGSFeRu2m08ArQI/Rn
 Pjn6+t+GYSkZgPQt8M3glIqD0BD/ltsWSoMWzaR2KzdQ8q2+mKOFzzoLkH1CUHfjZhMQ0Qnb7Eu
 qKNvZBAlGgzn1OEhv8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080110
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 11:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17581

Add patches on top of yavta to capture metadata from sensors
like IMX219

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../yavta/0001-Update-kernel-headers.patch    | 89 +++++++++++++++++++
 ...et-and-get-metadata-width-and-height.patch | 52 +++++++++++
 ...support-for-generic-metadata-formats.patch | 42 +++++++++
 .../yavta/0004-Add-metadata-layout-ctrl.patch | 31 +++++++
 4 files changed, 214 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
new file mode 100644
index 00000000..6e798577
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
@@ -0,0 +1,89 @@
+From c4dd8eb96b5d6f6e791fc66752a97b362cd885f2 Mon Sep 17 00:00:00 2001
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+Date: Thu, 24 Aug 2023 10:57:07 +0300
+Subject: [PATCH 1/4] Update kernel headers
+
+Update kernel headers to v6.5 media tree + metadata patches.
+
+Upstream-Status: Pending
+Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
+Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
+---
+ include/linux/v4l2-controls.h |  1 -
+ include/linux/videodev2.h     | 23 ++++++++++++++++++++++-
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
+index 8a33537..150fa87 100644
+--- a/include/linux/v4l2-controls.h
++++ b/include/linux/v4l2-controls.h
+@@ -1208,7 +1208,6 @@ enum v4l2_jpeg_chroma_subsampling {
+ #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
+ #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+ 
+-
+ /* Image processing controls */
+ 
+ #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
+diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
+index 397a99e..bb2d05b 100644
+--- a/include/linux/videodev2.h
++++ b/include/linux/videodev2.h
+@@ -812,6 +812,18 @@ struct v4l2_pix_format {
+ #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
+ #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
+ 
++/*
++ * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
++ * adding new ones!
++ */
++#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
++#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
++#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
++#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
++#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'E', 'C', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
++#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
++#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'E', 'C', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
++
+ /* priv field value to indicates that subsequent fields are valid. */
+ #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
+ 
+@@ -842,6 +854,7 @@ struct v4l2_fmtdesc {
+ #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
+ #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
+ #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
++#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
+ 
+ 	/* Frame Size and frame rate enumeration */
+ /*
+@@ -1005,7 +1018,6 @@ struct v4l2_requestbuffers {
+  *			pointing to this plane
+  * @fd:			when memory is V4L2_MEMORY_DMABUF, a userspace file
+  *			descriptor associated with this plane
+- * @m:			union of @mem_offset, @userptr and @fd
+  * @data_offset:	offset in the plane to the start of data; usually 0,
+  *			unless there is a header in front of the data
+  * @reserved:		drivers and applications must zero this array
+@@ -2359,10 +2371,19 @@ struct v4l2_sdr_format {
+  * struct v4l2_meta_format - metadata format definition
+  * @dataformat:		little endian four character code (fourcc)
+  * @buffersize:		maximum size in bytes required for data
++ * @width:		number of data units of data per line (valid for line
++ *			based formats only, see format documentation)
++ * @height:		number of lines of data per buffer (valid for line based
++ *			formats only)
++ * @bytesperline:	offset between the beginnings of two adjacent lines in
++ *			bytes (valid for line based formats only)
+  */
+ struct v4l2_meta_format {
+ 	__u32				dataformat;
+ 	__u32				buffersize;
++	__u32				width;
++	__u32				height;
++	__u32				bytesperline;
+ } __attribute__ ((packed));
+ 
+ /**
+-- 
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
new file mode 100644
index 00000000..e08ff913
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
@@ -0,0 +1,52 @@
+From 94ea50843fa80fd91f8aa3ef3618310a53f40dc6 Mon Sep 17 00:00:00 2001
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+Date: Fri, 9 May 2025 18:43:38 +0300
+Subject: [PATCH 2/4] Set and get metadata width and height
+
+Support getting and setting the width and height fields of the metadata
+formats. This is required to capture line-based metadata e.g. from camera
+sensors.
+
+Upstream-Status: Pending
+Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
+Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
+---
+ yavta.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/yavta.c b/yavta.c
+index ba94bfa..25b95e7 100644
+--- a/yavta.c
++++ b/yavta.c
+@@ -889,13 +889,14 @@ static int video_get_format(struct device *dev)
+ 				fmt.fmt.pix_mp.plane_fmt[i].sizeimage);
+ 		}
+ 	} else if (video_is_meta(dev)) {
+-		dev->width = 0;
+-		dev->height = 0;
++		dev->width = fmt.fmt.meta.width;
++		dev->height = fmt.fmt.meta.height;
+ 		dev->num_planes = 1;
+ 
+-		printf("Meta-data format: %s (%08x) buffer size %u\n",
+-			v4l2_format_name(fmt.fmt.meta.dataformat), fmt.fmt.meta.dataformat,
+-					 fmt.fmt.meta.buffersize);
++		printf("Meta-data format: %s (%08x) %ux%u buffer size %u\n",
++		       v4l2_format_name(fmt.fmt.meta.dataformat),
++		       fmt.fmt.meta.dataformat, fmt.fmt.meta.width,
++		       fmt.fmt.meta.height, fmt.fmt.meta.buffersize);
+ 	} else {
+ 		dev->width = fmt.fmt.pix.width;
+ 		dev->height = fmt.fmt.pix.height;
+@@ -951,6 +952,8 @@ static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
+ 	} else if (video_is_meta(dev)) {
+ 		fmt.fmt.meta.dataformat = format;
+ 		fmt.fmt.meta.buffersize = buffer_size;
++		fmt.fmt.meta.width = w;
++		fmt.fmt.meta.height = h;
+ 	} else {
+ 		fmt.fmt.pix.width = w;
+ 		fmt.fmt.pix.height = h;
+-- 
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
new file mode 100644
index 00000000..3728e5b5
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
@@ -0,0 +1,42 @@
+From a4f5a948d05827d95ff2f73a997fd3cdba46d2bf Mon Sep 17 00:00:00 2001
+From: Sakari Ailus <sakari.ailus@linux.intel.com>
+Date: Thu, 24 Aug 2023 11:08:56 +0300
+Subject: [PATCH 3/4] Add support for generic metadata formats
+
+Upstream-Status: Pending
+Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
+Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
+---
+ yavta.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/yavta.c b/yavta.c
+index 25b95e7..6a494da 100644
+--- a/yavta.c
++++ b/yavta.c
+@@ -340,6 +340,7 @@ static const struct v4l2_format_info {
+ 	unsigned int fourcc;
+ 	unsigned char n_planes;
+ } pixel_formats[] = {
++	/* Pixel data formats */
+ 	{ "RGB332", V4L2_PIX_FMT_RGB332, 1 },
+ 	{ "RGB444", V4L2_PIX_FMT_RGB444, 1 },
+ 	{ "ARGB444", V4L2_PIX_FMT_ARGB444, 1 },
+@@ -424,6 +425,14 @@ static const struct v4l2_format_info {
+ 	{ "DV", V4L2_PIX_FMT_DV, 1 },
+ 	{ "MJPEG", V4L2_PIX_FMT_MJPEG, 1 },
+ 	{ "MPEG", V4L2_PIX_FMT_MPEG, 1 },
++	/* Metadata formats */
++	{ "GENERIC_8", V4L2_META_FMT_GENERIC_8, 1 },
++	{ "GENERIC_CSI2_10", V4L2_META_FMT_GENERIC_CSI2_10, 1 },
++	{ "GENERIC_CSI2_12", V4L2_META_FMT_GENERIC_CSI2_12, 1 },
++	{ "GENERIC_CSI2_14", V4L2_META_FMT_GENERIC_CSI2_14, 1 },
++	{ "GENERIC_CSI2_16", V4L2_META_FMT_GENERIC_CSI2_16, 1 },
++	{ "GENERIC_CSI2_20", V4L2_META_FMT_GENERIC_CSI2_20, 1 },
++	{ "GENERIC_CSI2_24", V4L2_META_FMT_GENERIC_CSI2_24, 1 },
+ };
+ 
+ static void list_formats(void)
+-- 
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
new file mode 100644
index 00000000..cf0a4bf9
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
@@ -0,0 +1,31 @@
+From 7d5fc4a3b0982fdc894c946d16fc7152d7da8b30 Mon Sep 17 00:00:00 2001
+From: Rishikesh Donadkar <r-donadkar@ti.com>
+Date: Tue, 7 Jul 2026 13:28:41 +0530
+Subject: [PATCH 4/4] Add metadata layout ctrl
+
+Add V4L2_CID_METADATA_LAYOUT ctrl
+
+Upstream-Status: Pending
+Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
+---
+ include/linux/v4l2-controls.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
+index 150fa87..32291d3 100644
+--- a/include/linux/v4l2-controls.h
++++ b/include/linux/v4l2-controls.h
+@@ -1208,6 +1208,10 @@ enum v4l2_jpeg_chroma_subsampling {
+ #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
+ #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+ 
++#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
++#define V4L2_METADATA_LAYOUT_CCS		1U
++
++
+ /* Image processing controls */
+ 
+ #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
+-- 
+2.34.1
+
-- 
2.34.1


