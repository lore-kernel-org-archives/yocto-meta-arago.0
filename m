Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885E0EC1425
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 18:06:23 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.647.1772561173715530109
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 10:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BTzXk780;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.70, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuJdPHJHEFRzXLW81+pQu/36fVzIef4LIJxku0OgjYAZu7ICoHpsySTfh3lNpEjAPmQJzr4BetOgPe2dFTA7Ph3VLti9NqbUGcDO8Pa15hNIfjQoKV1QemAj1UhdAFunLVhS2lR2xZZ2g0BgoB1885Fn6iYG6t6OblJveZJ2Dqez9y6NgfAMpG+SdNQ8/AJcfpk8CIWiX78PAKp2wG3M0IJUDcdrVRnFOO26FF37G8ie1ieI1MbJ6Akz/DMIF1pEe8TekrodWTDB6dDSZqzLagNv0UpQu8wPJV7wTKXkBrNO3gOrmydo8B7R+sNV8ZVKbviWqU45/kxQEU/HCDYsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1F6Ds2qKdjJPiEFOagmrqzVQsNf2BoMKA79rC0nFZg=;
 b=Vg6MHvz2xxaHUYE6cagHq2DMAsQcismpm43icpbqgKRla3hGeR77U/l/RohChwB3DV/fDfPT3GyrObYgOkbtRDVzYjuQKV+nGJV6gVfE7veNguVx2DYfRwP2jASzI5A0e45iyyZVlIcJHFsX7rYevNDmLhw10myge501+xY3CGGRTyyPEFh83I0eDJ/5mQlMQqzbJIjT4GmNNm5bhVvdN8vuyIkUz6n+ajRQBq2KHDj0qUZktDL8PvF7UMxEzHL02y9L783yZkqLkjzcbXdeN2TtU3UGmDPdxeIlQ9N0Z//tTE/vPKj1mXK8Q1n6JPeql5if2cxOqFcd1NrtYsJGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1F6Ds2qKdjJPiEFOagmrqzVQsNf2BoMKA79rC0nFZg=;
 b=BTzXk7809/axENMc9288S9TsGOA6CTQYPZ8SQy0H+rdzGarzthVYJEstVVLLoR8/h69x08Qy/dOis4262NkDJ8fklF6Jz04OI0D1b1Qpuh3BvaHjyGOLV24k2xzaSwi3zySn/hlXIez7tStGzB97xRH88m76WqOBIqfjFY4WVp8=
Received: from DS7PR03CA0304.namprd03.prod.outlook.com (2603:10b6:8:2b::16) by
 PH0PR10MB997595.namprd10.prod.outlook.com (2603:10b6:510:381::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:06:11 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::b6) by DS7PR03CA0304.outlook.office365.com
 (2603:10b6:8:2b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 18:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 18:06:10 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:06:07 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 12:06:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 12:06:07 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623I679R3073526;
	Tue, 3 Mar 2026 12:06:07 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vxU8F-00000001fDC-1k42;
	Tue, 03 Mar 2026 12:06:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3 1/2] ti-test: Break into multiple packagegroups
Date: Tue, 3 Mar 2026 12:06:06 -0600
Message-ID: <20260303180607.396737-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|PH0PR10MB997595:EE_
X-MS-Office365-Filtering-Correlation-Id: 0020346b-3001-4cd8-0fd5-08de794f8ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	4cqF5epSjqCJhj5PsOw+OqxCzI87tf6aSV7dB5QZc5qhWIMhoMdigjI/iQerW4eJFKslq+7y3z5XMOsE2ZVNXinzlLRbPiqguCuwZnTHhH6/NfQ0gSEQhZ7FUHEjvPKz4VjlxMrecgyRX2NOXb3aF+sVVXSSCQdcT6mgq1rhRpoGpVcEhIAaU1fGTh+sp/egkxiDFZU+l/huXxvOQNtj13Sf0YV8K+fxxgvybnqz8AIzT4DZiSK1yuQR05+puXf7/YNBLlYyBHjjXukiqRUQGcNEyK5sw/jYo9MFr2/EPwc+7OAi60qcbVFbH6ZNiOZiteH7/VLlRskuSDhR5yO4pVnG0Al9qZVdVxT7omUc7UP0VSQtXDa7BVW1+XOT/QBBGlvfR3nc8GlBIZXSqeucty5sMZlZRuBR0NXJ9u7SA11PZx0Wm5YszF6LATg8ELxtXMhrK2nNuUhJ7ECcbv9RC6gcZf+yQ2RAkwqJGQw8+e7SGKQp6DDSDk0rOspF2bKM94L1KK1LC2NARDtVB9b3YoQpihPdlZCXUxTzvBmXOgsbR/YOkgPWftwFyLZPPMm9likZEVY6Zw3g/K8Ga0ObRPCMkd0zWXyuVJIkMkUTVz/pOym9d7K4ohyK9u74kDQzng7t++hmOt50gil3rD1LpakhDeyNWbgPybuXQrFXDSDYFh+joo2jreHcGVU8kX4XvY85ZGnLvPpqKpvilaRU2AD6wyLYc4C/BpwMjNZBfnfdtx62tlI/QC++xhytz6xzWJeDIJu4SasCy292k2J+C9ewZmO/vv/61hAtO3jipMrAaKwtlE6j4EXHSpj91Zvp
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	38GRHZE2yqGMDYGeEGqu5qMRkOyMr5+xUbFLgvvoYPWQlbL8tGJh5TXEgNRRsQNUQmS7Vo2y9ritGrX1u6FCKq54jlEsBjLZ8x3DMiFKncI/sO/75B8JNInb1w1SVDTyM3sxMLfWqFtlGgHF9iv87112LI6H1tKiWMdwlQau/Y4MpCnDtCparclH042MitafcCb4+beCGd+/DeQ1j2X2r4Kz1gVhUXP7CuJ/e8iM4Ss1tirQIVvhE//Qzo1rmrytKAxTAD4vuSGWVeCLkshf5qfVUgPxdiUH0I7L+qfK81BYS1aIM2siBiy0Io5Wz2K8qRmTwuXloAC+kmfmHMrO0PDt//Ky8Dc9qJL1nO+l/WnYhZSA6elkDg7hN8PZgK1c06iNSRT4IToyyIDcFKfgFlW5VfLJ8Q2RGs/mYdUJnONN5qNv4U/cGRQY1/AZTO4k
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:06:10.0966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0020346b-3001-4cd8-0fd5-08de794f8ca1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997595
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 18:06:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17209

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
v3: No change.
v2: No change.

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


