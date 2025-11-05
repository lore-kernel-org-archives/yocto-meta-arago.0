Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9141CCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:07:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13291.1762358864230607529
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 08:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FgKl/SOQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.40, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nev10nHNetMmSTLKOULDRnv5zDAqR9f0RBJiWw6J2v2VF49d00zl3Uzk6/pXLL49W2fFP+DDDbFMzj58gh9GdWkEx2/UOlCossdV9FUCNXAuSapB56LBIbUdLuuGAfhon6o99/W13txejssxAdqP/qW05iTFkemZFQFvhpP9ZdC/fVaOkpApBEV0h5e6koNuUtX1QUenk9GdQOX73OSO1vLYFQMDq9NQY1EyFyE9fy73+I2nVbZVHKILD1shrUpmpJs6QNiogwGhZwHOq9lkE36p1Izt27Y+XiMEwh0QHmhNhqk1Vmbix8JwEWkXiPj/6Isti9v5pAxo9hLJJkjBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3zcZpw/yomDwPyotp1KksoL2+cWZhvvcsTxoA6yFtY=;
 b=jRniLgQ/zMEijyGwn+LPi4v5HcNIUCcaMPo85/QhLSN//VF5EwfwmKwEpGmUSoDBbmCHRKT9yODIASEJQi0NbR1OHXdhg0w3pJBVgaT32yLyAoT8lY44zX9FNbHG7KBVlty2BUQ2V6YV0yvNNXz5rZOE+HbN4h0rKCEqODsgvfsLzIT0NsvbrziGL+1m+4sj/Lkn7PfQLiQ+6G5pov6JIDDM0yabNJIpwJ86Sl16r2W7uFSCYvoDcCHWxhSyX2L3qFbCuuufObKG6LW1IQE0PTJqdA+LPrqr4ZdimKB5RwRf2qPfpUwOkD/14WsiPTYbUGtdf34OB0LqISp7GKedaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3zcZpw/yomDwPyotp1KksoL2+cWZhvvcsTxoA6yFtY=;
 b=FgKl/SOQuF/6fpFhBZXLXi/Pz75ePAuyzoeC8tq6ZB3le5nNfV62oPmqohG5O64IapX60tzN/uyS1zvcCc0EjRFHuQnx8ju/QgHqQFXQiXmlfHWp7MK4jUrIgW7+LxB3RB/4FY2OoMg8vVJJkCRCJuv1489Nrf0kBBGm9wfGDXM=
Received: from MN2PR18CA0024.namprd18.prod.outlook.com (2603:10b6:208:23c::29)
 by BN0PR10MB4838.namprd10.prod.outlook.com (2603:10b6:408:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 16:07:38 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::c9) by MN2PR18CA0024.outlook.office365.com
 (2603:10b6:208:23c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 16:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 16:07:38 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:07:35 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:07:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 10:07:35 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5G7Z3M3974157;
	Wed, 5 Nov 2025 10:07:35 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vGg2p-0006Hx-FR; Wed, 05 Nov 2025 10:07:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 3/3] packagegroup-arago-tisdk-graphics*: Add DISTRO_FEATURE check for some packages
Date: Wed, 5 Nov 2025 10:07:35 -0600
Message-ID: <20251105160735.24123-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251105160735.24123-1-reatmon@ti.com>
References: <20251105160735.24123-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|BN0PR10MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: 267933e6-4081-48d9-1a2e-08de1c8570f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qI+6X7F6z5ZhrCrlhAceAJmblQAO/UM/oZutfattruKwXfnCv7ZB9f35HwCY?=
 =?us-ascii?Q?vD+VmGZ8EHwTXv23Y/9VkdBzsy0Y3YZgH9F4MUMHJFKp4jkI8u9MPtGqxhHC?=
 =?us-ascii?Q?e5fukjE+88wMINcvkBcbe9I1vlhjpgb1OnrTUxn3dLkyPIuFBlCvN4onNgo5?=
 =?us-ascii?Q?KAO78z6S4EkpM2VDw0U5GM3b6/q42WUPx24wpjCIFEtnnaEm74I29wRg1OYR?=
 =?us-ascii?Q?D+xYGjgW/PNlt9YA5FK99SNIYaD8uPRpMsC6Og7TkO+IQfixBbnr0B3wE6Nl?=
 =?us-ascii?Q?N442gx2fLH4I+4OaKWdxeDdkvz2UpVCPd9mkfdZqDCHJOaHiY/rh/qWdHaBo?=
 =?us-ascii?Q?YaPfmb9Y944ARtRuIbbBQsZC4ib/oxtLNTw83PpBxIm1LUwa2s4jJ3Awvqxt?=
 =?us-ascii?Q?9YVEJZ3D9Ygz3YXabErWjzaZO4ZMxHfi4hrvYumMJdJUnX66QvkU32gwFQGC?=
 =?us-ascii?Q?dAtZ/t+W4TGmS2Sor6aS2FzZbVqJ2uhPTtF9ayV4hMLinO4sAJL6Eb7daLPM?=
 =?us-ascii?Q?ttEEV+aaQjj8WNzK1aFmHtSEzCtQMwcgMdZEiR1Nl1eJOW9ViiViYyqPqSa2?=
 =?us-ascii?Q?wMtMhuq8lVviKHo8+HmcKL17YGcsGdr9PU2nQEpdzq+QpnHxgzD6esfeBZ6T?=
 =?us-ascii?Q?X0+lcLwgyQQOme/UB9xI0MeWhR/FmvQAOZ9JCcvDDCZzN4BUyNYIo3kpmUHd?=
 =?us-ascii?Q?dAdmqyVqhOS+3uK7cjg5Q+j4KHz6ugPZX7Xih78Tt46ejNJ5VIJq/lAGXUut?=
 =?us-ascii?Q?9/qEnXRAczzO9I5o88On2G3VZAeJ3ISWdVeeDVEqzegvXUjuiIPycEtKcUcb?=
 =?us-ascii?Q?4qVx3bg795SM+/YLZhdgAaiY+EDgdcOf8VGTYMMc6zzwpIY80g6P4ipBWs8S?=
 =?us-ascii?Q?4PWm7Dc992wq4o/WCgF3kJImCrs/3W0DghxZFy0mNoZDzO6iKhZ2IGyIJG27?=
 =?us-ascii?Q?d990m/Sa3aG5sH9lRXn9UuZCr9WNN4/na1lzNM/XnzxUdYQ3w9ftVFlo9qSF?=
 =?us-ascii?Q?0NDuvqPtebK7CekwPHmbSt7R4NEdJih7eX6cfH2aftTwInR+mUnrYjfJgVy3?=
 =?us-ascii?Q?mmJ3zR0nRWq0OcmRpYZsCa/MJfqSo0MulVv2fnnIOb7SGuxqjvSLgzmSp2SI?=
 =?us-ascii?Q?z2ql+5faPS0uJhstzQAGSSpc62PpPNPI8enujV2MACofco7MMGY71WpIQlOT?=
 =?us-ascii?Q?1hc1SuTWOS+4OUciA4degkStpWY0aScWVzk2jpySlwmmXUFdX0EEcWXDPJo5?=
 =?us-ascii?Q?MmEEpmv4C5rVqj+ya4vZLsHL6FQE2oEBYYKOAxED+ERdbLDGEiNNsabhWT92?=
 =?us-ascii?Q?WHM2L7B9/M/0hEaDF8onNudVv2IqfR5ozRmBDXTAyhin3qyM0MaSBojkje0r?=
 =?us-ascii?Q?x9KX/O9kCTMSbbwpVKNWtsVAX8ECczu4YMXFFrW1WSVseTCqv8nmznG63cKa?=
 =?us-ascii?Q?gZiMCZ+aztYnjC6UsUbFgM+k1XON+uWzCbgGJDRyOsSb7/uLZWKWuERWo6qd?=
 =?us-ascii?Q?b4+8ytskK2Gc+YW6x2wTTrYNjw3SvyYYtMVHn7YqD95fCBAlZx+lJQGv9pYO?=
 =?us-ascii?Q?q86bPog3+pgsa1vSE+Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:07:38.3428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 267933e6-4081-48d9-1a2e-08de1c8570f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4838
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 16:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16723

Create new variables to group packages that depends on "opengl".  Then
add a DISTRO_FEATURE check to include the new variables.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb | 14 +++++++++++---
 .../packagegroup-arago-tisdk-graphics.bb           |  8 ++++++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 675e4e10..8f760119 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -6,17 +6,25 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-RDEPENDS:${PN} = "\
+OPENGL_DEV = "\
     libegl-dev \
     libgl-dev \
     libgles1-dev \
     libgles2-dev \
-    libdrm-dev \
+"
+
+WAYLAND_DEV = "\
     wayland-dev \
     weston-dev \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
+"
+
+RDEPENDS:${PN} = "\
+    libdrm-dev \
     libsdl2-dev \
     ktx-software-dev \
     nlohmann-json-dev \
     stb-dev \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_DEV}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${WAYLAND_DEV}', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 52557e5c..9860037f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -11,10 +11,14 @@ GFX_WAYLAND = "\
     weston-examples \
 "
 
-RDEPENDS:${PN} = "\
+OPENGL_PKGS = "\
     libegl \
     glmark2 \
     kmscube \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
+"
+
+RDEPENDS:${PN} = "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', "${OPENGL_PKGS}", '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
 "
-- 
2.17.1


