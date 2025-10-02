Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05635CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:37:48 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.8622.1759412258391385141
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QM/HkVei;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592Dbav62841005;
	Thu, 2 Oct 2025 08:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759412256;
	bh=Ex0UD71dpjyq2cmvDPHeJmqeAP6OJDYyycbf4vhLlCw=;
	h=From:To:CC:Subject:Date;
	b=QM/HkVei3pEUWRPFoSePEXUNK2ej1CXCZpJ3WwV6LjPOj9horonvhbKtwY5FKZjgq
	 uXVm/F2f/Y5wvbid9Pzye+kv8V0LIJY3hMKD91X3zTD5mMgsQ42rKGCX1BCHYI1ai3
	 LMRyXVWAT5l7ORXagb0HmKJGHjnN7uIxcThoQ/K4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592Dba72463138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:37:36 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:37:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:37:36 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592Dbajn2160756;
	Thu, 2 Oct 2025 08:37:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap][PATCH 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Thu, 2 Oct 2025 08:37:34 -0500
Message-ID: <20251002133735.1817686-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:37:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16661

This allowed use of a proprietary HEVC/H.265 decoder for ARM A15 cores
back when the open source decoders built into gstreamer were not mature.
This is no longer the case and this plugin is not maintained nor
is it buildable with the latest gstreamer. Remove this plugin.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-gst-sdk-target.bb      |  4 ---
 .../packagegroups/packagegroup-arago-gst.bb   |  4 ---
 ...e.ac-stop-using-export-symbols-regex.patch | 32 -----------------
 .../gstreamer1.0-plugins-hevc_git.bb          | 36 -------------------
 4 files changed, 76 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 5555d360..e52bd49a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -15,10 +15,6 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS:append:arago = " gstreamer1.0-libav-dev"
 
-#    gstreamer1.0-plugins-hevc-dev 
-GSTREAMER_DEPS:append:dra7xx = " \
-"
-
 RDEPENDS:${PN} = " \
     ${GSTREAMER_DEPS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 685b8c55..2a4bc0eb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -18,10 +18,6 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS:append:arago = " gstreamer1.0-libav"
 
-#    gstreamer1.0-plugins-hevc 
-GSTREAMER_DEPS:append:dra7xx = " \
-"
-
 GSTREAMER_ACCEL_MM = ""
 #GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
 #GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
deleted file mode 100644
index e3df61ac..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-configure.ac-stop-using-export-symbols-regex.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0fcda9d85c96d5c39dffe21d3bdf01a038b911c9 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 22 Jan 2019 20:39:15 -0500
-Subject: [PATCH] configure.ac: stop using -export-symbols-regex
-
-The old regex is no longer correct for GStreamer 1.14.
-
-Bug-Debian: https://bugs.debian.org/894642
-
-Upstream-Status: Inappropriate [arago specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fee3161..8159c60 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -81,7 +81,7 @@ fi
- AC_SUBST(plugindir)
- 
- dnl set proper LDFLAGS for plugins
--GST_PLUGIN_LDFLAGS="-module -avoid-version -export-symbols-regex '^[_]*gst_plugin_desc\$\$' $GST_ALL_LDFLAGS"
-+GST_PLUGIN_LDFLAGS="-module -avoid-version $GST_ALL_LDFLAGS"
- AC_SUBST(GST_PLUGIN_LDFLAGS)
- 
- AC_CONFIG_FILES([Makefile src/Makefile])
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
deleted file mode 100644
index d17cb4f2..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "GStreamer plugin for ARM HEVC decoder"
-HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-hevc"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-SRC_URI = "git://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;protocol=https;branch=master \
-           file://0001-configure.ac-stop-using-export-symbols-regex.patch \
-           file://0001-Switch-submodule-common-to-github.patch \
-"
-SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base hevc-arm-decoder gettext-native"
-
-inherit autotools-brokensep pkgconfig gettext
-
-PR = "r5"
-
-do_configure() {
-    cd ${S}
-    chmod +x autogen.sh
-    ./autogen.sh --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr
-}
-
-EXTRA_OECONF += "--enable-maintainer-mode"
-EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wno-deprecated-declarations'"
-CFLAGS += "-fcommon"
-
-FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES:${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
-FILES:${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
-
-INSANE_SKIP:${PN} = "textrel"
-- 
2.39.2


