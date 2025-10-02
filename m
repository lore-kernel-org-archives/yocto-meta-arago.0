Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6AFCCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:43:58 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.9382.1759412630897895960
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EYDJ8rYv;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DhoEe3347101;
	Thu, 2 Oct 2025 08:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759412630;
	bh=+jNuTXgLL32hT1WNSp3H2wcuU7mzGkGkVGJbX5j/uYA=;
	h=From:To:CC:Subject:Date;
	b=EYDJ8rYvf9yn2IlGc/FPE7XJFPxfCvp0VAVq6Buf+2NYGv+FJ1GIssbV1b3W7q9eL
	 sCNWAWc5lN4VUIxRWLEWyhwEj3oMuhkoOu3IANxTMvUcAOfZUsFZIxyPA3FJpE0df2
	 qyFISM7in1gcZgB7eyco7A+66bu88LcudZhbyhYc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DhoIr465745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:43:50 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:43:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:43:49 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DhnJG1908767;
	Thu, 2 Oct 2025 08:43:49 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Thu, 2 Oct 2025 08:43:48 -0500
Message-ID: <20251002134349.1818652-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16666

This allowed use of a proprietary HEVC/H.265 decoder for ARM A15 cores
back when the open source decoders built into gstreamer were not mature.
This is no longer the case and this plugin is not maintained nor
is it buildable with the latest gstreamer. Remove this plugin.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-gst-sdk-target.bb      |  4 ---
 .../packagegroups/packagegroup-arago-gst.bb   |  4 ---
 ...01-Switch-submodule-common-to-github.patch | 26 --------------
 ...e.ac-stop-using-export-symbols-regex.patch | 32 -----------------
 .../gstreamer1.0-plugins-hevc_git.bb          | 34 -------------------
 5 files changed, 100 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
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
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
deleted file mode 100644
index 551ef9c2..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc/0001-Switch-submodule-common-to-github.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d85ca8e83ea0537fd74d8bea3c358a3edddb87ac Mon Sep 17 00:00:00 2001
-From: Daniel Schultz <d.schultz@phytec.de>
-Date: Tue, 6 Aug 2024 11:26:55 +0200
-Subject: [PATCH] Switch submodule common to github
-
-The freedesktop.org URL is currently not available. Therefore, this
-plugin won't build. Use the official GStreamer mirror on GitHub.
-
-Upstream-Status: Pending
-
-Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
----
- .gitmodules | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/.gitmodules b/.gitmodules
-index a6b1eda..80ffbc5 100644
---- a/.gitmodules
-+++ b/.gitmodules
-@@ -1,3 +1,3 @@
- [submodule "common"]
-	path = common
--	url = git://anongit.freedesktop.org/gstreamer/common
-+	url = https://github.com/GStreamer/common
---
-2.34.1
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
index 7021e144..00000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
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


