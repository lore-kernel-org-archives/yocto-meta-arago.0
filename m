Return-Path: <r-donadkar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0219CC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:56:07 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6476.1783511764101045836
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 04:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VKiZGKEA;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NuxzaT44;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-donadkar@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BR6262186092
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jul 2026 06:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=gtrLWV+oX6a0d
	uQouLhtakL6UnAyQcQbIgiOeYz2Gt0=; b=VKiZGKEAO5wKAU+74ApWhDdvuPpHc
	xM7qbUo3USbr6oSRqUbtPB3dlO2Tr6TzC4KbGuCi3h7RvYUWXwPi0oXlJ+zNDAvW
	9OOiBymkCnB9QrseJ/XpWdeNgAly29THXpvTDpSzPHxv63MQWCX5YX+H+gOtxErK
	arKF6MTYC5+D5Nc44sZM2oAbxZPZa2Jxj+nwJL/3TlZ/7ADR15nxNGxRCFNVCIEy
	GOFvzBJduFVu92kr90/t7nwIUK0TAQynr/LMLI8Xc2lF6bNPLXQegqmhxMpcYTZ2
	euvZFmTHD7YC2KQCXdJLYLqvOWSldAr7zV0ez/B88OanOdt0RfP2gg0jQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f9kuarmfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 06:56:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggt+tbEZiDoBQ+3J5UzbzAvLw60o7AMS7EqacfKJ2ex1oMmYPae3Xe6xKID4OrTqFz29jNOtBJijLhlIJolW/w9EJRcUpYMeqhuF1nvIxX89BbU6otH26yXwh8m44sCEtUFFzyildPlCFtAzQUdwV3JStyTQe+pQJfNvXzLUYbWslW7Z3TDZUtJnHLzqf0ISDpb6Svl+nUXL4/jjnaPa9vsbA85nyF11kEXTDSbSCbg6bNaG4JJ8ibbOWevY0YOOGBY4fGk4JFIBNQFTwz0qt/BDn8k/gTdyxFpGa9G7OH4CGHuNIaolBdOG1anQRviFLDE7UJAr+cNk9kaOqyzuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtrLWV+oX6a0duQouLhtakL6UnAyQcQbIgiOeYz2Gt0=;
 b=iRrFCrRAifLehSAWyc38nyR8+NW1q04cdvJaJeTQfZJy94tMIfKJtefms/JtWhVj8UEMjFsIwE3wAhwatr2MEUUSPTQjknnD2ynrjbvXuuJvOU6eQDVw16fnlBsWIWF4vJo2+zRSDjUabIgUdEMWGgh8CY3nptQpDCVg2Pc97lS9YgAY7ZlGuVlZV4mGF/k7dYLNfk5Q6tZGrrIfbDuGTZh+AFaxbyenNHbhTsyEDoKNPxc5ngtqIs2XlJNxb5vT0DpnNiCxlv0jaDQSGtUZ0oJeGYJHrkzTmkW5MZnsiH9KmR+CF32xK5cFlD/L34Qi+03krCslb6K0IW4VhQ0eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtrLWV+oX6a0duQouLhtakL6UnAyQcQbIgiOeYz2Gt0=;
 b=NuxzaT44bHUXUKFAqwdgBW8ycCUsLsS9XhgTNpqCjuQwnE1DeH6j3L3cZO3GgcT1KFFXddmDjrMK9UqdPx/khZxeYLJfhBjRb7ZMM+h3ZCSXS7EBb3VJV0hbc2EIikdX6U7SRIKQD6XICIQp/gE3o8Aokk87pbtHtfN4I16fuIU=
Received: from BN0PR04CA0157.namprd04.prod.outlook.com (2603:10b6:408:eb::12)
 by CH4PR10MB8049.namprd10.prod.outlook.com (2603:10b6:610:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 11:55:55 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::61) by BN0PR04CA0157.outlook.office365.com
 (2603:10b6:408:eb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 11:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Wed, 8 Jul 2026 11:55:55 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 06:55:55 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 06:55:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 06:55:54 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668BtqAa2105290;
	Wed, 8 Jul 2026 06:55:53 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, <devarsht@ti.com>
Subject: [PATCH v2] yavta: Add patches form embedded metadata capture
Date: Wed, 8 Jul 2026 17:25:52 +0530
Message-ID: <20260708115552.2277504-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CH4PR10MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd452cf-2d9a-4fdf-ca25-08dedce7de20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10063799003|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LmlwCuH1TpchqRd7x93s0qv+b+r8MzsPGNBqVl49Y896VEq484FMvFF6onfFgt29b2yXFFQi0ZmqrTTOh+RqX/lg0gSViIf3xbtQH9/sxPUGQd81qWKlFcVeQkTJnG4GEg2STYTVs64+LC1p1FAV/zynOJO4e9obYpkydr2fwuJJBNIDUXaui5pRU6/JgozYRaIHtNsrVzE2SO5+4O2aExiSTB28cfU2ewboDudXl9wbpzbGcmhq2crUSCL4pMauXeLmjr7ESrjHNAx38tnzeuEqMqDj5xpkUVDdZLy88vN69XgCM9oGmqJmoYoR3KGKNgFSGTdAJpSCtqVghmE+4BPWBktsdMZyr4zWoXgMHfpPvBTcnmq6JnwoIU2nic3asMG92CgaLLX5SVE3eljZu25AF3413r/sf/DOh0MJ8t1m+R4wl5VLB+Ng3U1GERCQ64MIgvUu1k6bQ3HNjYbvoAbCGUvoW4k+O1y4qGuKdca2mTsm3auE8/RyqO+pf9XEyJ3tVfb9wE3M6if1LG4ThkdDS/EekjdnBt90z+asOJZVP/yLC5yxfLxL0br2tFC1nOGUscmN0aGQdPOSjZVU0b2qeTmc/tGZ7tC4qGbA3XO/eRm/jXdwH1+Wx8o1wy4tevk31fxcz5dGdfGPdeqCHbUxtgBYxlQehbjvoHPc+fsrmXQONh5HE8wTbTu/hteFUN5FvOgbMiMENx/MwyJrdw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10063799003)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YELItfRBrtcnWhur7ovHwj0qveAsvik0tKsrJ5xGLrRYp302HlNuL/oXV3pyk82DdlqiU2MI/gPPTr0uGOBFHmO0A6ByhvmtMJ5bJbRvSY8NyAFaT1Di82Hegbnj5RaRqjOo86rmCMF4Gx8L2GiAru0eFpVYVquPc9jSYvV7W6KpLQ6v/pTK3dDoeQs1DhHJFkUQMo8FGxvb7uL+lhehPJPGqa/0iDUcgqEzwQ2eRNIS8XPVzqfGJxo6Ihm8y0YyE58F2GU3T7BnV+Htk50QLkMWrRQEOfOAF+FP0Uns6rOJmTs5XD6M0iytpghHffb6RQkDo65kqAJcReIDfITth7qC5e5PDKDnJPjeH2ufa2d00nQ//bnPh4e91ZcdljjSb5FO6gmHTsEeVutn12jx3pm2+v5L40l2jaY4hyAyIt1U+F8ALPcvB4VKLiSl6Tiv
X-Exchange-RoutingPolicyChecked: 
	QhHUuy5bGPWbg+9Y0N0bkwvOE1+R0ij9TUanMQLf2VVJFqn6Bng8ZDBJhxSdxuIxduUgmFFK0S+2QSWv6hwd4hwwgKKpVXHm7uTWA1+nceobzy2d4Erme1/AXMtud15mloLWMP/5WLegZ2cgq3rM2SWsqidgpexhchRbntzCTr6AsIW/OZUQwb3zfc7EVo45o/sM2GWpjisP53WHhbwG5nQQfmvt19aTN6MNxr8MfyLVs0TemvbBBHQHq2LaTte13rKimZAivREzWJmJD9p6q8gbX7dZoJ+fpBGBc3n7W71fHMjynJh5EReTWCZEp3PeUhEaI39NudanJc0/bEYULw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:55:55.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd452cf-2d9a-4fdf-ca25-08dedce7de20
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8049
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX66X4wCmPLg+F
 IPWyp9pTmetnN3ZCbElNKEd/7KcgVy10S8bm+k25GeJvE+RgqRk235G3nGPQrzSa2F6PhAP0Y+F
 kHV1vo6pdtZCN7/Xpqs80ZTgaECh5JM=
X-Proofpoint-ORIG-GUID: HlO2hYCrY8xhmOoGDt9n92nytai3FZkQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX/YNfKK3IAJm7
 v0vaHeGc4v5ARzi4oOJYfUyS8A/sft6vEe34zjtYACrdhOwnMUoFlukBC/Ns9ZeBqveNp16LMjp
 ny/5dtThpoFzd4FlOfSrCSgxeeozkiq+jZsLV8lwQKW64lXbGVjgamdUAsCSk3X6JlWyQ5hkbmx
 issZRwsBOgH0o0JbmeeXOnQD0rjCRjCdICXT+1YSwHpGZIQzDnVBqY5Kj07htc0ZOSEu5hDaL5E
 IePFPGPxbgGWye34cKACBHONEd5XzlYw5B6rMt6u7DjfC1ycUf7gvmUgoYNmRth8dHMxrAdvWsd
 KGgTl8xfFtEtAx6syTqXytqMcG7CA13ccJL0Y1tHPqKYb7BqgYZS+OXySX+DvxeKlm8r0qZLevM
 mr3jXqtbURBPeDTWaeAmDdRwp4Us51bvrPta2DslVmZbglyc9lRtkZAxkYYYjnVcYPAGHi++6E9
 Cqh8zHFnef1kaOeCQHA==
X-Proofpoint-GUID: HlO2hYCrY8xhmOoGDt9n92nytai3FZkQ
X-Authority-Analysis: v=2.4 cv=GtJyPE1C c=1 sm=1 tr=0 ts=6a4e3ad2 cx=c_pps
 a=23BBZRleo/1KOgyGqX6yRw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=rkecna9rPX2fP1VOdTkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080116
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 11:56:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17583

Add patches on top of yavta to capture metadata from sensors
like IMX219.

This patches are not added in upstream yavta yet because
embedded data support is not yet functional in the mainline
Linux kernel

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../v4l2apps/yavta-arago.inc                  | 10 +++
 .../yavta/0001-Update-kernel-headers.patch    | 89 +++++++++++++++++++
 ...et-and-get-metadata-width-and-height.patch | 52 +++++++++++
 ...support-for-generic-metadata-formats.patch | 42 +++++++++
 .../yavta/0004-Add-metadata-layout-ctrl.patch | 31 +++++++
 .../v4l2apps/yavta_%.bbappend                 |  4 +
 6 files changed, 228 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc
new file mode 100644
index 00000000..ca04b36d
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/yavta:"
+
+SRC_URI:append = " \
+    file://0001-Update-kernel-headers.patch \
+    file://0002-Set-and-get-metadata-width-and-height.patch \
+    file://0003-Add-support-for-generic-metadata-formats.patch \
+    file://0004-Add-metadata-layout-ctrl.patch \
+"
+
+PR:append = ".arago0"
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
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
new file mode 100644
index 00000000..602fd07f
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
@@ -0,0 +1,4 @@
+YAVTA_ARAGO = ""
+YAVTA_ARAGO:arago = "yavta-arago.inc"
+
+require ${YAVTA_ARAGO}
-- 
2.34.1


