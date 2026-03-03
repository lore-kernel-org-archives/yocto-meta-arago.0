Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C71CEDA69F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:48:40 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23263.1772556516914430110
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 08:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KavKDWen;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnbJvCHOpiLIu1pEtlMOwAQ3XzRS4eKqvnOiC+J3EdaAC0ZNB5786a91hXn/cwfGDJoocsKWqLuRatD1EDSKBC7jnpK9VaLRSjnFYWRilxf4jyC7fFkYphHg7xCiO03pzr33C2UdTSYKL6FkIvP8ZOtfuuCGQfwEfaigSXshNHjA85TAMpi4ixbuAr2Ns+RfFsNaQMMkX7nWmq4DPH74xAFUKhLktho5fjBxxHQjYx1UXnTQkFgY8MA6OYXlNQf/4L6PGxGZ0nEMHGedaHWKXD+KM0AV8awP3xlgp5lqRHAzXqt3fJVMzymvtOmnEqcxMi3AyNywVonYAzWAxASQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqbvvXWfEp1j2wEBuCa9Hjti9jLqAw5qAbFon9Xc4CM=;
 b=okPP7a23hUWAernpox30mftkoqMC4eqbbzHI5LzxgCRCiBb5HMpg1F5poZUALXYzMCf0R1+ohf7X8lfPkq87aB5mCJfOwecbeh4dy/BjP5fdy+66DjksBQa/yHIvasiaKwNMjR2Ey9WKcnxkdD8Jm3MhepX8S8UZ4SGpPun+ru28mFcuhawMrwFzwOtHb1Xgwkk3VoGC0wPDNxnmLX6LqKxUYusJvRSwb8erWfZNEWTK5X1C50Y2GHhimX8f7RQNN8YVzrRqiHLqEivyhmVA97yLc0mOxDvOp3BDMlw8D27PzL3RyT5EZed0NWNVXuaLkyuHSxAcS2B3AD+yOd7HOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqbvvXWfEp1j2wEBuCa9Hjti9jLqAw5qAbFon9Xc4CM=;
 b=KavKDWenvaNuvJWnlwGIaBQ0H8xg6momK6kBM7ubxOkHCZUhqov1eedQOry4NLrZbzjB4tV+qbL/dQTWcXt1VoRaM1mX9vc4ViRJLNgg2z+UQZ3EE1u/h2rQMreORk+lQ8Q5JMPXOId10UhjWXlVKtgrnWu0X/HZkigYSPUpGnk=
Received: from PH8PR21CA0017.namprd21.prod.outlook.com (2603:10b6:510:2ce::17)
 by SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:48:32 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::52) by PH8PR21CA0017.outlook.office365.com
 (2603:10b6:510:2ce::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.2 via Frontend Transport; Tue, 3
 Mar 2026 16:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:48:31 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:48:30 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 10:48:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 10:48:29 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623GmTTX2962889;
	Tue, 3 Mar 2026 10:48:29 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vxSv7-00000001Fud-3pgD;
	Tue, 03 Mar 2026 10:48:29 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] ti-test: Break into multiple packagegroups
Date: Tue, 3 Mar 2026 10:48:28 -0600
Message-ID: <20260303164829.299398-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SJ0PR10MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfccfb9-7e36-410f-3cc3-08de7944b3a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	EfwDQ1FTGfsvSVCDYLNtruxgor4nJKtcbYHKX2JhBL/1Ft9i/uTK6Gnv0Yk4zMC7eRXUGm9we9eMmiibTpHd89QI9b3j2UWI0B/oyggPT1ruPDGucbBzpTckT6d97wy17vFybuWRn/RBzNitjMwQT8wqY29WdEeTmcdKpiXWVShWjb+xab+etNmaAEMY+eBLoTZ4vhP29jTSKy2DLVHhTIUPx9FuAZYF+2G9PUYHNcvjFz9kh7HDQ9K7E48ESxehtaM75LEqmHKIqd8dIiL5Lv43ngZ/VViU6j0jeI5O/23Uja/yGe/QhCt7hKp6EMxa/dM3/LoV6c0Wky1aOM/rXcdcr4stVdQUEmP2H6ZhUrm8appnkd5zMHa/0vkYsfyOC+zAv0HF+4DmeF7fPdmvtIrh9CVkBDNrPTIvs7PzqhSQeIkzY+385cmMR5mMyYXylaV11R0H18fAKiei0Z0viAfmXXGaTRx9NKaHw4rITO32dSTmKRoabeQrN3f0cYx8NcjoTzHt4dC1usUVQvFn2MuT+AOeEks+1obAt31IIi0nIKFEZpTwIl10J9RL2MpWQv4yM3+a5r73wnSKjs52OxC6A+jlXXiUruF2ZjjGcLxffNF0pghCY1OezIhMiNu5C9hWNK3tIrOKzF9nMsqKW3HwJg7gdQRI8zXHj8bzvl77sWVaF2bMNmA8YIffxklgPP2SN4Q24d281j/aSq3I4Hc4xm2kd2uSd1u+CxEpJGY5/fY0ikbXuXBMavHbK+EFKW9afxbN7TSkGkZ5qYOCVGlzsXgQ7tVpo5FZBYACHJhczsHJm/CI6Ip5SWLAqVI5
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZR+qFkyufoIVzOAAkgDoIVmZ6ke4d8vsbXFS6BK4dvFcpaCK8pwaqGfVoDPdPpUSiSPXNXHeM+k6e7xIwsqfVJPQF15Vzj4tCVxnEGJqRGb47eZCYC+F+d83fHgF1StScLy6zFTKOZA25b9mSyAbOeMxpD0PrzBNYI/SVR4Dto17KfFSry++2afTMxFyJ03zCQ8rcDOEAspvy2mPliHHQsa7XPf/ra2hO8eOkOw5GtoUujScQlk9mNfASQl1+HJr6fT3rxyYNi9PMhiy7cYXQN6GaBCEAVGmm9AWT+c1EGfB18sWq01ICq0rBjH+ZeJJ5V7OnE75RiAaISKokAnoSFvv/b2OfuqTbYuD28DcofYm0pEGv1uorvDIA6UeiD/qhCcFg1THv8tpwHPPXYHk+y8lM8XSxmfQgLQwSu1qQeDqQLuLmR6au5JegTrUCRmE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:48:31.0734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfccfb9-7e36-410f-3cc3-08de7944b3a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4752
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 16:48:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17200

To allow for tests to just pull in a smaller set of programs, break the
big ti-test package into multiple smaller ones based on functionality:

ti-test-audio
ti-test-graphics
ti-test-multimedia
ti-test-networking
ti-test-storage
ti-test-ti-tools

Installing ti-test will pull in ti-test-networking, ti-test-storage,
and ti-test-ti-tools.

Installing ti-test-extra will pull in ti-test-audio, ti-test-graphics,
and ti-test-multimedia.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     | 111 ++++++++++++------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index f2ae1aef..d3458b9d 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -5,27 +5,25 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
+PACKAGES +=3D " \
+    ${PN}-audio \
+    ${PN}-extras \
+    ${PN}-graphics \
+    ${PN}-multimedia \
+    ${PN}-networking \
+    ${PN}-storage \
+    ${PN}-ti-tools \
+"
+
 TI_TEST_BASE =3D "\
-    alsa-utils \
     bc \
     bonnie++ \
-    bridge-utils \
     cryptodev-tests \
     devmem2 \
     dma-heap-tests \
-    dosfstools \
-    ethtool \
     evtest \
-    fio \
     git \
-    gst-devtools \
-    hwspinlocktest \
-    hdparm \
     i2c-tools \
-    iozone3 \
-    iproute2-tc \
-    iproute2-devlink \
-    iperf3 \
     kernel-modules \
     kernel-selftest \
     kmsxx \
@@ -36,11 +34,7 @@ TI_TEST_BASE =3D "\
     lsof \
     media-ctl \
     memtester \
-    mstpd \
-    mtd-utils \
-    mtd-utils-ubifs \
     nbench-byte \
-    netperf \
     openntpd \
     ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
     pcitest \
@@ -48,7 +42,6 @@ TI_TEST_BASE =3D "\
     perf \
     powertop \
     procps \
-    pulseaudio-misc \
     rng-tools \
     rt-tests \
     rwmem \
@@ -56,20 +49,19 @@ TI_TEST_BASE =3D "\
     stream \
     stress \
     stress-ng \
-    strongswan \
-    tcpdump \
-    v4l-utils \
-    xdp-tools-arago \
-    yavta \
 "
=20
-TI_TEST_BASE:append:ti-soc =3D " \
-    mtd-utils-ubifs-tests \
+TI_TEST_BASE:append:armv7a =3D " \
+    cpuburn-neon \
 "
=20
-TI_TEST_EXTRAS_OPENGL =3D " \
-    piglit \
-    offscreendemo \
+TI_TEST_BASE:append:armv7ve =3D " \
+    cpuburn-neon \
+"
+
+TI_TEST_AUDIO =3D "\
+    alsa-utils \
+    pulseaudio-misc \
 "
=20
 TI_TEST_EXTRAS_OPENCL =3D " \
@@ -80,23 +72,56 @@ TI_TEST_EXTRAS =3D " \
     python3-pillow \
     pytesseract \
     python3-numpy \
-    wayland-utils \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_EXTRAS_OP=
ENGL}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
 "
=20
-TI_TEST_BASE:append:armv7a =3D " \
-    cpuburn-neon \
+TI_TEST_GRAPHICS_OPENGL =3D " \
+    piglit \
+    offscreendemo \
 "
=20
-TI_TEST_BASE:append:armv7ve =3D " \
-    cpuburn-neon \
+TI_TEST_GRAPHICS =3D " \
+    wayland-utils \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_GRAPHICS_=
OPENGL}', '', d)} \
+"
+
+TI_TEST_MULTIMEDIA =3D "\
+    gst-devtools \
+    v4l-utils \
+    yavta \
+"
+
+TI_TEST_NETWORKING =3D "\
+    bridge-utils \
+    ethtool \
+    iperf3 \
+    iproute2-tc \
+    iproute2-devlink \
+    mstpd \
+    netperf \
+    strongswan \
+    tcpdump \
+    xdp-tools-arago \
+"
+
+TI_TEST_STORAGE =3D "\
+    dosfstools \
+    fio \
+    hdparm \
+    iozone3 \
+    mtd-utils \
+    mtd-utils-ubifs \
+"
+
+TI_TEST_STORAGE:append:ti-soc =3D " \
+    mtd-utils-ubifs-tests \
 "
=20
 TI_TEST_TI_TOOLS =3D " \
     arm-benchmarks \
     arm-ddr-bandwidth \
     coremark \
+    hwspinlocktest \
     input-utils \
     ltp-ddt \
     openssl-perf \
@@ -164,13 +189,23 @@ TI_TEST_TI_TOOLS:append:omapl138 =3D " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test', =
d)} \
 "
=20
+RDEPENDS:${PN}-audio =3D "${TI_TEST_AUDIO}"
+RDEPENDS:${PN}-extras =3D "${TI_TEST_EXTRAS}"
+RDEPENDS:${PN}-graphics =3D "${TI_TEST_GRAPHICS}"
+RDEPENDS:${PN}-multimedia =3D "${TI_TEST_MULTIMEDIA}"
+RDEPENDS:${PN}-networking =3D "${TI_TEST_NETWORKING}"
+RDEPENDS:${PN}-storage =3D "${TI_TEST_STORAGE}"
+RDEPENDS:${PN}-ti-tools =3D "${TI_TEST_TI_TOOLS}"
+
 RDEPENDS:${PN} =3D "\
     ${TI_TEST_BASE} \
-    ${TI_TEST_TI_TOOLS} \
+    ${PN}-networking \
+    ${PN}-storage \
+    ${PN}-ti-tools \
 "
=20
-# Package group for things that should only be present in arago-default-im=
age
-PACKAGES +=3D " ${PN}-extras"
-RDEPENDS:${PN}-extras =3D "\
-    ${TI_TEST_EXTRAS} \
+RDEPENDS:${PN}-extras +=3D "\
+    ${PN}-audio \
+    ${PN}-graphics \
+    ${PN}-multimedia \
 "
--=20
2.43.0


