Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6064AC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:51:22 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.367.1787896277963661734
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 22:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MTTna9fL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=LLNJdIM3;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67S2090P283466;
	Fri, 28 Aug 2026 00:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=x0owFcBUiuB6F
	/Qk+FLD5yPXlzorfNJ0NQolGkx8DBI=; b=MTTna9fLgB3N+nv5+K584rgpkRAWG
	oWjz1vYjip/iLBt1mr3/RVzLs2MfWZl2XJjElK0Fm/OpcI7Yg3mkkyOKKdiYcvbN
	gKhgAWiERueKdP8MP3+NO/U10+KemhLOzjOoXAMl7BvAByrjvV3LNkBt3P8vrve+
	hogUimiglZ6S8BNzst3xbLZ9rumgxMECOjxgfBibM8xOmKlasfblNDWPJ3t+H0gJ
	vrG9YHYlTvybXP3MxhGhSUySK6NYiPUhug9fEkcp5QYC/UhD89NnDewH6brv8IHw
	5l/Vmwywnv+PMQZhNBAQEuiFspBBO/7vAhr7rzzDA6Pzww+8IZt6wqCrA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gahg3f4pj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 00:51:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgzorDVQq3+bbIjHi9cp2EqcWG08vRm5rifmRjzVHenDFNO7X/jG6lxVbOkwSIGz2XF3Q6w1mTxRYdiBlCofC6v1HoKrZgjQ9aejYU1zz9v3GGVh2HAFJ1L1rtuFGmBAqRIUHCcOdkQ19qlimfDpTuw71/b8OjQTRRgbSutWeQWzxHyGuQSS3Ng4NxkGzukYIjW/eCLM7MVkjYjcID1QoxbOwLvVGene2CHmrNAwSyKoxUkGefIO248RUgpkfrOoLVjgvIM5PVXn2xtrsPAAOvyPSNj0VKdsXAzJjhlCf/2cLp4egiuApm95NKsZxnwgm6YlpVBABKWMerxgUAT+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0owFcBUiuB6F/Qk+FLD5yPXlzorfNJ0NQolGkx8DBI=;
 b=eWmNH4NY0xVm+ZOkkkS585VasbTWnQL2uqL96srfDPAb+Eq7lzgzxau1mafATajsBGQ9rlFKKgEOZrmIwEWCFPREaZyfjZi+ip/vgUQq89QqX87UrWhOdtRD0LevA2+9jjqhMAZ4fTRxellC0EJYyTg+aa1VbUFV4/iCy51bcRRs5aiOkbtfKuzAMBxUVAPrfJVH/aVhmNyYoyfRjfxR/TCbR9v7feIJ3RZ2EIbSJm3Soa+h42apsiq29ouTJhqy3CZK0KoBblAVm29MNK/BsOo1fxvsFXOV+AoKQ6tF1SuXW32llKKIaRyRIZ7Zw7WXvIQj56HVuYGEK8o4IlG6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0owFcBUiuB6F/Qk+FLD5yPXlzorfNJ0NQolGkx8DBI=;
 b=LLNJdIM3MpQO9CcOADuQ+QDUF105vHYuarbcmJKe9KG4JYIB5pA/WozVATPgBvxv77XpMynhZnYaibcxAPCYtJ3F7AWfOaIrbvgvaeo9ODKFy+QnCwxlvJF4JIvaN3ioWpPJLMw0kc8T0SDy+LvPTOGJUnWUKnZ/Mfy4KbHbO8U=
Received: from BN9PR03CA0602.namprd03.prod.outlook.com (2603:10b6:408:106::7)
 by BLAPR10MB4947.namprd10.prod.outlook.com (2603:10b6:208:326::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 05:51:14 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::4c) by BN9PR03CA0602.outlook.office365.com
 (2603:10b6:408:106::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 05:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 28 Aug 2026 05:51:12 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:50:42 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:50:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 00:50:42 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S5od6X3254751;
	Fri, 28 Aug 2026 00:50:40 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Subject: [meta-ti][scarthgap][PATCH 1/2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 11:20:33 +0530
Message-ID: <20260828055034.1106316-1-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BLAPR10MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: da4a1dd4-41a1-42a2-5e6b-08df04c85df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7yc0RRlag79T8bu3nQcWKdv68MQmP5YYUOkrtTUo78DiQO3coZvhRdOikqHOIbY3SLUh0WJThSLcVv9tWPYU6asCdPivr4Yrf6mOS0Wi2BC7/h3bNmPqnqSnwGb4I1IEUEimGM+YhkRXj1kJyMqwq7weMDlWASQkPLhD4ktppghpkoTyxxhfdt3SAjHmcH4dltgTQvWP/J9u52UEhHunWNnmvZMyyttc6c03Ht0jY+vVciBZyIg6ERhfhQEw+AV0oIV6zMUzV8p5jijsDWV1xQsKZpDSdSSOe1dGjqeV0vnzTdcxLfOK3gGcAaufQCUflfS57T9oG8il0XXXeSbn29RxBw/Z6QvvGw9JdnUH9YXURk8puO9h2/8tLENJ0/uyoJkm0UYpiLuAufpWaP9A1yfijZRI99ivqljlZblHohKxlHN9RkNvTbbXkEtPqf9Zc0jaZDJNofCjE6XCz4CEpBLoTWrefS4wHxZXSIdPIkQ40mQV5QM4hl9yC9ETqRDZYs5XRh6QxXCHQim/iEYRBl901KWSxkMGVCZLkeSWgCaS7fiwCrKADrIOCk1ZS3SsIoDj7kfXY2wBvurKw8LYwY+8xkdmmHW3xS/6oUx7urdQ2AORykU0Da26pnM1VXpXLapiPrcNNihwLkKG3lDr3nV5S6ObnqtC/8Wj2MMR1WzsjB6qbjplzcFU7sSYnFcz1eVcMB+9u22T56AU1/gmrA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EGFii3RvBkxX4YoBXC+KesdapANYt1ZcYHbBKd87YTHKzxzclIWuQPoR18XIhZMHQQwR+Eq7ACNONl6ii7hEGqxH3P8q2tYZsHVueTvJzJ874Rx03pu6CaHqrQiH5nEJ4cxMTKSN32Wio/uo0Hz1JZ0vErYMsI3k2PnB1rhxHNZpkVXaCLo2YBx2cNsXPxd5wqpzjGt71xr7zU1Ab6AqYEczOur0MEZwQIxBLrkZ/FIqj/sUDLrfQNkmY98OECxJqlqNxR7bnxOmQZ0YmuDOT11zBFzOMulTRkBq2ASD5Z4TMr1S3dRj6AZky4xdvqOa5yrG2I6Y3Zgk+OCBWuFA/S7KQnRsmsgZko9jzWEkMQjK/kTb9rImpxoQh8kYevaYd3zsUp3Qh04IQaRCnjAOK6Qw+NkNmtqIFSwOZr6AvAUqAeTTr0oM8ZJEK2V7hIBR
X-Exchange-RoutingPolicyChecked: 
	U3jrarLI0YrCjPOtFov7OAkF4imVXHQGHeUcECCoSBfkVjMm7GHK8q9ag185Bv0eT7uddvIRB2dikc+FzNMNbpyUsTllGnKJzvIr8i33/KSqMykkByzrrlZykOEWIuBQCSFgLh9y+GAUetx6SC2rV8iFHL80shrVYGRU5AJtfk0dexYf+6zYC2o6fvELf9fYLplbKr9/AXBBUfqV+gYY/B/LnTZ2W+afFTkDrOLKxMugdm/gn1Fzyj0w7SFbQ2T7RwRFHpg3BSYH9NKSqr0A22xDRu9sGa1q2ah0BDQyX5Jyzp02dYsfOmj5Fjz7x1u5AFH2zGItekvbqQzErl8xDQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 05:51:12.4653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4a1dd4-41a1-42a2-5e6b-08df04c85df0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4947
X-Proofpoint-GUID: 2wZ7nIQCb17wEGH0KxGpmOATOCGiVe3V
X-Authority-Analysis: v=2.4 cv=M4597Sws c=1 sm=1 tr=0 ts=6a9121d4 cx=c_pps
 a=fjiyZBo1bxGOeg3e+tCWfg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=T5wT6sVmLgvxjAWShZMA:9
X-Proofpoint-ORIG-GUID: 2wZ7nIQCb17wEGH0KxGpmOATOCGiVe3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OCBTYWx0ZWRfXw5ii8arLnzbD
 MZRSgDW1LVSodIaI40/3oGEbzZs9U0gDycQfSg1o4wWUvuTqMgCInSQqnkxDHIvY50aX6S9LELd
 JPcuQP4IJ4a0CvOXYJlYGf59TKKcnNiZNP2ffrFw3hLsNU7SsmGDXqHnb1VWoT9+3pzlIR8x9Mx
 5Rf3mNNoL5xlhEzXTjYtg48f25/pZoWjDara72g9HFbgL9q0e5ybN2oDhF1jbWOR+2x74JKOu4T
 cuyCxfT97ktrwTh3QLy92ZjHN84KyAbvRNg+KH0QcREc5mWx4dYDkNWwLH4sUUnPZ+Vby+60KOB
 cPG+uGkESMSbr2BiupwougfSa2+oVkkEZuYDYv/uj0GiSb7BKHaJESpC4k8hwasbLGNUrBoOPXM
 GO9UYPI3Uwzm7r4FJYwsffmAhQAxjPnJrBF/2NaQpsW9aApqjpTrUDIMQE1sZ9pgF+BdDwBKNr7
 CgynRfSu1W8JPxUWE0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OCBTYWx0ZWRfX2S1PLwoMa7sF
 zD8qr5m6LW0arSS/hFWR4BnVTQHU548zvKobVQPY6/VjIHvMr3Gehr/PPNA2tO8jvaZLpnmf/Ai
 4mSEiIw13dA7zU5DQIckH/W66fyAimI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280048
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 05:51:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17613

The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
downstream.The standard header provided by linux-libc-headers' wouldn't
have the custom changes.Copy it straight from the kernel's staged
source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
path instead, for userspace code that needs it.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
 .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb

diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
new file mode 100644
index 000000000..bf7dcc3a5
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
+DESCRIPTION = "Copies select uapi headers straight from the TI vendor kernel source \
+tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
+that needs them but can't rely on linux-libc-headers carrying TI-only additions."
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_install[depends] += "virtual/kernel:do_shared_workdir"
+
+do_install() {
+    install -d ${D}${includedir}/ti/linux
+    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
+}
+
-- 
2.34.1


