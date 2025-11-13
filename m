Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71F1CDB464
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:50:34 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5638.1763074227204253697
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 14:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wpHEMAJ/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.0, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nzq+rpASM/pcIRs7Jg57g6biXkP7poeFYDlOD81hTkzs990JK9zOvb2TRwiQLIu1ZnU7N4cX8zvFC8eLFSkHKoJDFXf2iOy5XzUXUHiHT7/n6fX7hq0s+6ocRqr3od6PnGbZTIgd3oYwT15ck4PojBtIl9ixZ+MbC4rWCi8bsAHNW0s063P+gwndJThB9svNF4UnbQJ+9imuOBpW5tBugxaa6wC6vxQDL+Ps8HX/5WunFW2kOGYoAB9kGUVz5rqHzcoRx8iKXiwxZZLd1hP3t/igs354eKqzpwAs2bQr811euYMLamD8LgH4NvY0ph/M5tzFeIJIVsEXXKQDLnW9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcJ/ab7qfNGvuFXE5lgPt/OpZyNX2iXGjT04Bsxdq90=;
 b=L5RvUG662b6m+HICmVqAQkYzoUgQ8BZ1NW5P50ISe3ONw6UmIJ6zYoTMWt7mVV3hWNqdGQVgQw/VpJiZAhOZ6ZqdBeAwmRgmvx9ppIW2M6Mco55YS1PBrkzYs7pMblWeAvzzusMp4cj64Up0BxTgQeB+5dW1WGRRUxGNT5TUkZad8QNxky9vqu7XhCxNix+a6mkfWA/qvPoTExFjRgb/meS5Wd3tEQ2M876VlI2110QOy3FlPfsd8FOwLb7flIib9/dd+nS3X/RZRfcjWA1OSeafwoC1RhDsiAxoDqpCLEl0n5qAwN9oCslCBAxe6205S3G0rzeEtQ8RuOGYfEUOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcJ/ab7qfNGvuFXE5lgPt/OpZyNX2iXGjT04Bsxdq90=;
 b=wpHEMAJ/TBFGcYehBs0BmWL8+wuGwlA8GizdKEKzG8aZoppN/KN0yNF8jTuNB87HaUNBPsVHPEb2KPMhgkehFUgUXxsOX9HTb8xwTN7WC2QjzUsrvlul8S1EbzaW7YQqkmMTaHsxihMLSiLZcjmn5a2xlDi56XTxTp1caXQd64I=
Received: from DS7PR06CA0027.namprd06.prod.outlook.com (2603:10b6:8:54::6) by
 DS3PR10MB997702.namprd10.prod.outlook.com (2603:10b6:8:346::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 22:50:24 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::76) by DS7PR06CA0027.outlook.office365.com
 (2603:10b6:8:54::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 22:50:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 22:50:23 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 16:50:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 16:50:18 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADMoI591018061;
	Thu, 13 Nov 2025 16:50:18 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJg8w-00060Y-J2; Thu, 13 Nov 2025 16:50:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 10/10] v4l-utils: Do the version bump in a yocto-check-layer compliant manner
Date: Thu, 13 Nov 2025 16:50:17 -0600
Message-ID: <20251113225017.22994-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251113225017.22994-1-reatmon@ti.com>
References: <20251113225017.22994-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DS3PR10MB997702:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c9a8ab-32f6-4e14-77bc-08de230707a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vtHKTLo8SuN/FwMpIR7WjS23osbO0e4cFe9qFPjKEfCJ01p+Qccqi3/XDcbh?=
 =?us-ascii?Q?lFO7sWrEakDlzuUc3uLjchfnzeLnS3oqVun3qorOVdNoaXn/c7zrD8c25i9t?=
 =?us-ascii?Q?cfAL4UxHLKT/ad+C69O0EqGhAvOCZTuUTOYuHsyUAZKjIstpcMs/BZdu6uAS?=
 =?us-ascii?Q?qLYbtPOvydA+rk1WpmBz5PJadDDGbBQPA9YtpnXVXRa5dgI64m5HeTErjSP9?=
 =?us-ascii?Q?OXVqqmfCWOWBUEJntbNFMNJkBR6BfeqrM7yq52INwzwwDiMe3LGrIafUpWU0?=
 =?us-ascii?Q?XkMaZaGAzFCb6gg4JNSFQw40/XvQ21lADE4pgwLsq3FxkCXaAXFTIXAgprJs?=
 =?us-ascii?Q?iJiFkfhOCKmlXopq2AdrD5iwN+mFsi2BbnuAJB+JtW8g2kGjsT/Z7BSnUmrV?=
 =?us-ascii?Q?w3Q8PiZ2+nukhXdlXDSpREtOwOMkIBm0vD6mHgL3zv1TeerowvpxK0j3QRfn?=
 =?us-ascii?Q?vautRasO0w/5Lib2PhtTIFc6tzAi0hvWtNnSFBbef4wvks4TRTEsm/fboIoR?=
 =?us-ascii?Q?SqPUNrlxt3EOPPhjOs5LP+L1Cs/66+X2eEF1MBVqYzEoHi5pGwIQU8wdgeP/?=
 =?us-ascii?Q?JX/acJ4WqirMDBkw4rlbWJBZHK4pAHtQXhakSoqUz693fW2q7C/XstQ5bCGa?=
 =?us-ascii?Q?YPtqIMGaU32vrzTbRzmlS3wtjy2fQ6AUzdLJV1LwbJ5hka0j7DsHji2h8LEw?=
 =?us-ascii?Q?FgXR77BwZJBV3uEV1DwQ2uC7P95bGRalNaB1NIbfV2geNGvo1xdNx3ipcELG?=
 =?us-ascii?Q?iXv+us7i+i4vXeP3WNDzXkBetp56HUCwnogagMZo+7L0xjhOg96ogaXCKAAZ?=
 =?us-ascii?Q?CYUar5zyp9/h8gwkHyB85hmFjhjSsKAy6soi5az5herGyrf2QuksriJuJeZY?=
 =?us-ascii?Q?s5QOyqKEZh1sJpYeGTcvgPzLezr1gde9CPEb5m361J0cnM16YMWdUgFeHfBg?=
 =?us-ascii?Q?QD5C61mfVyWUY1DH6awF5z4VnxTVQKWaxt6UrTN9yJUm4rtgSxGyDqlnI6nj?=
 =?us-ascii?Q?PMy89V6hz4oipuGLF9aBGFPilnU48NOyGyDqkmNtB/PZ3vatL+dtv5E4ttfg?=
 =?us-ascii?Q?2EH53WTm0e5LoeeghugZby2GSZr+H+H8rnPc10t7rNnd/U9ieDidnrxylI4+?=
 =?us-ascii?Q?OrFOi6fedXDM6kTmfyiC3Vi9wPjc9pgROHffINyWory3gi3vaaGlAyVDOM9a?=
 =?us-ascii?Q?CTwdV8hrKblpqyWrKVzLbCRHPwXl8ocQvWYOyVFGyaACw7qbTqUDgHZMTDgA?=
 =?us-ascii?Q?XKowh2GP08KSMqLrL+9A3nfOvR0PwTVOS577YETIa+swtwTehwfjMofj/t6l?=
 =?us-ascii?Q?tCt0QKJqtQiW/432Lz9pcTCo42FpfnihhVbNGmyDi73CWg670K9DeSbyW7DW?=
 =?us-ascii?Q?jxWvVlyob3Hd2RWmkIXU/u3OkkYNMPMlyAQcWoKz5c9MVo1wqNejV8PCBoSx?=
 =?us-ascii?Q?oKbNti9UAmsp3756zpd7kwRv+oeqTr+15L7zChw9LqJdVL/Nf7EDJ1sb4zqz?=
 =?us-ascii?Q?WBHQICIOsnerMizyy5yXUZs7BhOLXxbfMVLmcBhxDBxsH+HMv9DIBTcXNP/R?=
 =?us-ascii?Q?JpTt4uWcW2XgbvTtlWE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:50:23.2378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c9a8ab-32f6-4e14-77bc-08de230707a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997702
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Nov 2025 22:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16759

Yocto Project Compatibility requires that including a layer in a build
not change recipes in other layers.  In this case, we were providing a
newer version of a recipe that another layer provides.

The proper way of doing this is to create a bbappend and only change the
minimal things needed to perform your changes.  Additionally, to pass
the yocto-check-layer the bbappend needs to be wrapped in a manner that
only applies your changes in the event that you are making use of your
layer.  For Arago, that means only if we are building Arago.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../v4l2apps/v4l-utils-arago.inc              | 16 ++++
 .../v4l2apps/v4l-utils_%.bbappend             |  4 +
 .../v4l2apps/v4l-utils_1.28.1.bb              | 86 -------------------
 3 files changed, 20 insertions(+), 86 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc
new file mode 100644
index 00000000..652314b9
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils-arago.inc
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/v4l-utils:"
+
+PV = "1.28.1+git"
+
+# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
+# both 32 and 64 bit file APIs.  But it does not handle the time side?
+# Needs further investigation
+GLIBC_64BIT_TIME_FLAGS = ""
+
+SRC_URI = "\
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
+    file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
+    file://0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
+"
+
+SRCREV = "757acdaec187d51803c2957d36df3d717a3529da"
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
new file mode 100644
index 00000000..250bcb18
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
@@ -0,0 +1,4 @@
+V4L_UTILS_ARAGO = ""
+V4L_UTILS_ARAGO:arago = "v4l-utils-arago.inc"
+
+require ${V4L_UTILS_ARAGO}
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
deleted file mode 100644
index 6f5707da..00000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ /dev/null
@@ -1,86 +0,0 @@
-SUMMARY = "v4l2 and IR applications"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
-                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
-PROVIDES = "libv4l media-ctl"
-
-DEPENDS = "jpeg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
-           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
-
-DEPENDS:append:libc-musl = " argp-standalone"
-DEPENDS:append:class-target = " udev"
-LDFLAGS:append = " -pthread"
-# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
-# both 32 and 64 bit file APIs.  But it does not handle the time side?
-# Needs further investigation
-GLIBC_64BIT_TIME_FLAGS = ""
-
-inherit meson gettext pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[qv4l2] = ",-Dqv4l2=disabled"
-PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
-PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
-
-SRC_URI = "\
-    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
-    file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
-    file://0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
-"
-
-SRCREV = "757acdaec187d51803c2957d36df3d717a3529da"
-
-PV .= "+git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
-
-# Disable the erroneous installation of gconv-modules that would break glib
-# like it is done in Debian and ArchLinux.
-EXTRA_OEMESON += "-Dgconv=disabled"
-
-VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
-
-PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
-
-RPROVIDES:${PN}-dbg += "libv4l-dbg"
-
-FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
-FILES:qv4l2 = "\
-    ${bindir}/qv4l2 \
-    ${datadir}/applications/qv4l2.desktop \
-    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
-"
-FILES:qvidcap = "\
-    ${bindir}/qvidcap \
-    ${datadir}/applications/qvidcap.desktop \
-    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
-"
-
-FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
-RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
-RDEPENDS:qv4l2 += "\
-    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
-RDEPENDS:qvidcap += "\
-    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
-
-FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-
-FILES:${PN} = "${bindir} ${sbindir}"
-
-FILES:libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
-                 ${libdir}/libdvbv5*${SOLIBS} \
-                 ${libdir}/libv4l/*-decomp \
-                 ${libdir}/libv4l2tracer.so \
-"
-
-FILES:libv4l-dev += "${includedir} ${libdir}/pkgconfig \
-                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
-                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-
-PARALLEL_MAKE:class-native = ""
-BBCLASSEXTEND = "native"
-- 
2.17.1


