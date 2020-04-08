Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0467C52A29
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 20:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5CFEB40C1D;
	Wed,  8 Apr 2020 20:34:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vlos5lDOHIrg; Wed,  8 Apr 2020 20:34:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45162409DE;
	Wed,  8 Apr 2020 20:34:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 800BE16E1CC;
	Wed,  8 Apr 2020 16:34:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  8 Apr 2020 16:34:12 -0400
Message-Id: <1586378052-32886-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] gst-plugins-ti: remove old versions for gstreamer 0.1
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Apr 2020 20:36:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gst-plugins-ti/gst-plugins-ducati_git.bb          | 10 ----------
 .../gst-plugins-ti/gst-plugins-ti.inc                 | 19 -------------------
 .../gst-plugins-ti/gst-plugins-vpe_git.bb             | 11 -----------
 3 files changed, 40 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
deleted file mode 100644
index 0ecbd6e..0000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ducati_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "GStreamer elements to use the multimedia accelerators available on some TI parts"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-
-require gst-plugins-ti.inc
-
-PR = "${INC_PR}.1"
-SRCREV = "6ca21aa3ec8b88b051013af503ef6b702d3c5477"
-
-SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc
deleted file mode 100644
index e0c2c78..0000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-ti.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-# Include file for common build settings for TI GStreamer plugins
-DEPENDS += "gstreamer gst-plugins-base gst-plugins-bad libdrm libdce"
-
-inherit autotools pkgconfig gettext
-
-INC_PR = "r0"
-
-S = "${WORKDIR}/git"
-
-do_configure() {
-	cd ${S}
-	chmod +x autogen.sh
-	./autogen.sh --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr
-}
-
-EXTRA_OECONF += "--enable-maintainer-mode"
-EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wno-deprecated-declarations'"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
deleted file mode 100644
index 85a2ce8..0000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gst-plugins-vpe_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "GStreamer elements to use the Video Processing Engine (VPE) found on some TI devices"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-
-require gst-plugins-ti.inc
-
-PR = "${INC_PR}.1"
-SRCREV = "b14e905feee2470952184f570f97deeb8e88b619"
-
-SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git"
-- 
2.7.4


