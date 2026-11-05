Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5724.1793911066680835844
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 12:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=gPVRkjGI;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=I3zp/tBS;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hgonq3093057;
	Thu, 5 Nov 2026 14:37:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=9fQ4X/QQKDW7V
	SwXZboXmwliIgV6rnpmuyHUTTuSh6Q=; b=gPVRkjGI8VvnAaRb4qIMOlS0hxioL
	XPxD2Dt52ODBXnBprKH+on6AjjIfO7HGZQn7jjrixOMhJs2n/yrIeL8cBkEqksA+
	6ziBD58zwM6BzoA9AuwX672sFiMod4/u1lJ8g4/dtWSojXkmFQ+/yZzxIb0QnjGO
	HV0WLiF8lDLkRNTNlEx0UdOSE9bbPoiz/P6Bv9TT6ruELq1gpgVO7N6yOZRPIDeq
	ZOSG8CRmMZvAu4ECSE3bUeIroElDYcLqZvMrnJpcRatw+arZrdFonujYIbQ2xGvi
	VuMqhfQZayVCengZ6tqmPNtq7Rww5sPOM/Ko2MoWtxFImNcBMnqnlDdSA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010051.outbound.protection.outlook.com [52.101.85.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9pkbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 14:37:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUbRbqFCpKD9oTNOm9KhAnCP3RXoacDYk4IhL0yVkQ6VVtF1Fp93WDWAJjMMDjlwz404T9o9Ia5UHOlcPd8GZ9RrYFoWZQk0Dxmp17VXK3C1Hg2dJLxKWVXUvyFF2lmUmNnACWT008fJe3v9wMN/Io4lwLe2BpDR7ChYcNgF+YeOKFtw92kBvq6XHkT4w5G5EaFPmtW21My0j5C0966foUhUc5oqA+R+jPqP+f9wHtP1Dat1wyYpUI7prApSP/keqb9l1JnZPcWSjs7pJoXjiyYYSfchuR0Qs9CxjWN78xmE6hjlujhmAEcx0p+H4/VjM8VWCl8ing4FuaQ+ievmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fQ4X/QQKDW7VSwXZboXmwliIgV6rnpmuyHUTTuSh6Q=;
 b=dEwIYiFS/LU7NVSrrl4aindouY7JmXbMz0yEXoy/dZDwAJtXAtIfN8m4iIZBMV5L5sdUtZ+AkLaZQfBkxzkJSFlySnwlyKlWxCuWa8sTgpq/rT+jt8Gc/jhjrNET/nHn06keiOE/HwuBK8WQ58/t0GQH2Svbb+ZDARUoe/tCwjzZmuu99MB2oXm8TnEpmPp+pnm0eWvMN0qMm559r/U1VAZ/j4RColv1Dw5sttUl/yMeJtm6HihUxJj+7OLnh+3LPZafctxpzwnmM1w7H0Kcbu+C0VRmYBECXcbOTG5xPWa+SnL2C2FhYc9GYsptDeLfh3IzWBjm0Lumdr/Rdshz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fQ4X/QQKDW7VSwXZboXmwliIgV6rnpmuyHUTTuSh6Q=;
 b=I3zp/tBSWiVrnMK66Vx3Cik0mspFpY6gn7oHn4242GLuL1Q2Zigp99hTrP+tAE/NozRRzIhnavp4FlKgDFD4b+JN9DkpFKDPgHkxgsF3Hw775a2mFgXswu569J5AeG0OFEO2Z5W5zINtgmj97vUaD22SVsSfd3oGZ7e153whZLY=
Received: from SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::28)
 by SA2PR10MB4427.namprd10.prod.outlook.com (2603:10b6:806:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:37:42 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::a9) by SJ0P220CA0018.outlook.office365.com
 (2603:10b6:a03:41b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:37:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 20:37:42 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:37:27 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:37:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 14:37:27 -0600
Received: from ula0226330.lan ([10.249.37.218])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5KbQgn828660;
	Thu, 5 Nov 2026 14:37:27 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] libdrm: Remove patch adding extra OMAP BO flags
Date: Thu, 5 Nov 2026 14:37:25 -0600
Message-ID: <20261105203726.1306888-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|SA2PR10MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 0355806c-a63b-4411-b09a-08df3b7ca3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|10067099003|18002099003|56012099006|5023799004|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: QboaglTRScOKbklpnFBCoyJY2ajV0Txjp1OcSYNxjJA1GLR8ZwW/mPdWqPKsMxLvOsygubfKzzRO90Uh1gpDPTI4PrXF4wp07923H3ph+ycOb2OKgusxsbkl/zGZWnOBWjsuuyzyWtugpB/i1HS4XRx1WV1CHEbgsgd+rnyQrpkvGhxhm0oE+OlLt+1Jh3uW8TXriQ7BAIpNfbJOir/G2dmF7T+tEnLwU6M04K4l49dxqZPOe8uXwX8tsewwIVSga4ij29fUfWKlqc38Q5LT7WN2+dnMJ2LR4P21ng5/ZovnetfL3QQmYUM9OIR6Xegj+eKLmCHGGeaMnCaahfRCFKkT9HdFDQumOitcdNhhjI0BrBgCZF5iCw1eYZZCaouXPJv0RBEovHAXsTyD8C9G+zswmDyOvRB7VDx/EfXEQEfsNMTw6OYin2kIe6d4XBRrkEFKub/ta2F9IvcdCNsPh0T1rxf0UwIjjGlDMGtMgZcVG3e1HNsvgsP9Eh8VUbxE1KCyo3U+EHXsyAlFI4OWDGXZd9aXKAhXSFjcJ7VXvlFZsxVvw0330+2yI6Q++Mg/6R6aiL77eaYS3DC17h7Enfoxi+CI6pTU7hGRGP5Z81Pns/ZDGeBtSXVAb6n1Y1J3g1vBa04je1wjtqYhJ6UmtEi7ttxubKWBSyGHBmKIbjeBNtQxufS24k6HGyKR1xZsLCCst2GSDBHQtYqDn8SsZA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EzPcXfXwQKrBbkmD+PjHxQxZt+suVWmLQdqERcA8GF9MbKAbFtQW1chD8XuS9W019Pn3XKSWzzuHHh2gjKOYsHA7R5sC85FsYM5hdGPZUGxvkaSHFK5z8OF3M2vK+PXtNmLS6sPeDg17Qe6lSq5ChzwYu3V5znqvBaI0IC7/1PgrwgrOnVmk7O+XRqYpJBBQq7uge8KCPBtAw5gAinBEZ6RliH0nt/3FCPLI64ECNlqQ6rdD99YZyghUD65RnQKmNjvN580mh8AifQnMOGYDJEGHC81By4KBeHoO1ir33g1gXLqyl7GN2wA2PpUdXkpgSmgELqzptmeHLa4BcGroftEfxVycNlGegR+l7xRrH+zx/5NQ38TLsLc8t5T7cDxAHLYWHIhOdBL/oCMw9ERCGrua6svrnmxXYMpkbYEkMPwspp5v5XiJL0SB6mPR9Yqa
X-Exchange-RoutingPolicyChecked: xqXN+U9UCmZPwFilIuZpCpTNINcdz/xp3BfWc5u/9HST9IeQLJRwQ6GXo7ze3Sm7JkXSow9gLrNxSKjAI5tzczSo2GLfyX/Afsing9rjk64oaG3vDZjjxdMDhQ1VHvXTX6xLqn1G80IcGMDNZEN9SKFtGzhLCsPkUCYWXTVZefmLqp2+ZYmWvc2cPR6CydqSzKXErNOa0UPu7kvfcTt/olXc9qUz1yRisSnsYODBepAiJ62uLULT+DSKdlVaNecFTmPIp3HCikB295oUqsbiz66TLo7znfvhBwSxR2Rgvb3beC4nS0fL+J9uWahZQAeXehdEHVMXcUf2VsKhInfuTA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:37:42.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0355806c-a63b-4411-b09a-08df3b7ca3e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4427
X-Proofpoint-ORIG-GUID: Oeb0ovH5HhLkf33NHjIly8OyvbFGi4n1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX28dPrMWtkhHa
 9eMYat+XURvKoZuraFCgpk/k/R7QCOnb+ZX+v7RpifHCV4GJfVSDoeWTycv87oDcDnBVRl5pXbD
 xtczrh8W6hOmHQ3woeObki7TixpO7NI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXyHoWTNDrhXs4
 Sc/kg4Xewa1s9gJzN8WNfUJXCn2M2t1tkZ+ztQLa6MX3YljhnnUEgInEToWVrSQqDafZrbDt+Yx
 jVXtHij347Huiv0fpT0tMjsDqQl6AwWwrJBoXn3eDnkLmlAWKtwYFahkzEOBPRXH9760HruLIkY
 ZMlQx63kbT010iVNouvb4tUDVSnv9XEWHYAHwLP4HCdmGdGPDEj6Fs7RJzHikUYe1xj5qodJXh9
 1b3YVy0E4eIHm2M7DEKKkMpNW58jp46V8yU4LeVSSmDhOY7GJpf3lISHYDDJh5VKlnDOQWQPVjj
 AxjUHZtVLVbUyDfYuQDYZYSlETPwIuPJK2uyk343BkZaNHyQngQvijGdRs+ae4zziOzXHVPiXYT
 hS56CUdAFdxsOCzRRR2lhz8qKQdS3l9w8Y2I02yVMJ2hYYmYhsl+oXh2PU5t4xkcPf/6RakrHta
 we08OvHMpOzYsB5TmDg==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aece919 cx=c_pps
 a=QABtpIB3qQ7RK8WoHHm5GQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=8e80D6Wf_GpMfTw1LOsA:9
X-Proofpoint-GUID: Oeb0ovH5HhLkf33NHjIly8OyvbFGi4n1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 20:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17764
Content-Type: text/plain; charset="utf-8"

These are not needed by any program currently built here, nor has any
recent TI kernel supported these in a long time. Changes to Linux UAPI
files should come from the Linux source currently in use. Remove these.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/drm/libdrm-arago.inc     |  1 -
 ...BO-flags-to-affect-buffer-allocation.patch | 56 -------------------
 2 files changed, 57 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
index 5b64677a..6703fd1d 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
@@ -2,7 +2,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/libdrm:"
 
 SRC_URI += " \
 file://0001-Add-option-to-run-a-test-indefinitely.patch \
-file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
 "
 
 PR:append = ".arago4"
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch
deleted file mode 100644
index 5daa9be2..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 9810d176a7947a6e8f432e1610da15937765fa06 Mon Sep 17 00:00:00 2001
-From: Tomi Valkeinen <tomi.valkeinen@ti.com>
-Date: Thu, 18 May 2017 10:37:11 +0300
-Subject: [PATCH] omap: add OMAP_BO flags to affect buffer allocation
-
-Import the kernel header changes from "drm/omap: add OMAP_BO flags to
-affect buffer allocation".
-
-On SoCs with TILER, we have to ways to allocate buffers: normal
-dma_alloc or via TILER (which basically functions as an IOMMU). TILER
-can map 128MB at a time, and we only map the TILER buffers when they are
-used (i.e. not at alloc time). If TILER is present, omapdrm always
-uses TILER.
-
-There are use cases that require lots of big buffers that are being used
-at the same time by different IPs. At the moment the userspace has a
-hard maximum of 128MB.
-
-This patch adds three new flags that can be used by the userspace to
-solve the situation:
-
-OMAP_BO_MEM_CONTIG: The driver will use dma_alloc to get the memory.
-This can be used to avoid TILER if the userspace knows it needs more
-than 128M of memory at the same time.
-
-OMAP_BO_MEM_TILER: The driver will use TILER to get the memory. There's
-nto much use for this flag at the moment, but it's here for
-completeness.
-
-OMAP_BO_MEM_PIN: The driver will pin the memory at alloc time, and keep
-it pinned. This can be used to 1) get an error at alloc time if TILER
-space is full, and 2) get rid of the constant pin/unpin operations which
-may have some effect on performance.
-
-If none of the flags are given, the behavior is the same as currently.
-
-Upstream-Status: Pending
-Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
----
- omap/omap_drm.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/omap/omap_drm.h b/omap/omap_drm.h
-index 9c6c0e4..d991b85 100644
---- a/omap/omap_drm.h
-+++ b/omap/omap_drm.h
-@@ -52,6 +52,9 @@ struct drm_omap_get_base {
- #define OMAP_BO_SCANOUT		0x00000001	/* scanout capable (phys contiguous) */
- #define OMAP_BO_CACHE_MASK	0x00000006	/* cache type mask, see cache modes */
- #define OMAP_BO_TILED_MASK	0x00000f00	/* tiled mapping mask, see tiled modes */
-+#define OMAP_BO_MEM_CONTIG	0x00000008	/* only use contiguous dma mem */
-+#define OMAP_BO_MEM_TILER	0x00000010	/* only use TILER mem */
-+#define OMAP_BO_MEM_PIN		0x00000020	/* pin the buffer when allocating */
- 
- /* cache modes */
- #define OMAP_BO_CACHED		0x00000000	/* default */
-- 
2.43.0

