Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 971525296F
	for <meta-arago@arago-project.org>;
	Mon, 17 Aug 2020 18:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 06B3140C36;
	Mon, 17 Aug 2020 18:40:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cCpN26-2cdWg; Mon, 17 Aug 2020 18:40:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E7A8740AB7;
	Mon, 17 Aug 2020 18:40:52 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3B80A17341D;
	Mon, 17 Aug 2020 14:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Aug 2020 14:40:51 -0400
Message-Id: <1597689651-14328-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] gstreamer1.0-plugins-bad: re-structure gstdrm and waylandsink patches
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
X-List-Received-Date: Mon, 17 Aug 2020 18:43:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

This helps with applying them only for platforms that have display and skipping
headless platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend       | 30 ++++++++++++----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 6722fca..0533294 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG_append = " faad kms"
 
-SRC_URI_append_ti43x = " \
+GSTDRM_WAYLANDSINK_PATCHES = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
@@ -11,26 +11,28 @@ SRC_URI_append_ti43x = " \
     file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
 "
 
+SRC_URI_append_ti43x = " \
+    ${GSTDRM_WAYLANDSINK_PATCHES} \
+"
+
 SRC_URI_append_ti33x = " \
     file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
 "
 
 SRC_URI_append_omap-a15 = " \
-    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
-    file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch \
-    file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
+    ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI_append_k3 = " \
-    file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
-    file://0002-parsers-Pick-bug-fixes-on-different-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
-    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
-    file://0005-waylandsink-Add-input-device-support.patch \
-    file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
+SRC_URI_append_am65xx = " \
+    ${GSTDRM_WAYLANDSINK_PATCHES} \
+"
+
+SRC_URI_append_j7-evm = " \
+    ${GSTDRM_WAYLANDSINK_PATCHES} \
+"
+
+SRC_URI_append_j7-hs-evm = " \
+    ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


