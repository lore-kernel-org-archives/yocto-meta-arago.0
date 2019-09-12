Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1016052A48
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2ACB640C0B;
	Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RnN8k0oMS1nQ; Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1440840C13;
	Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 26D821741FF;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:20 -0400
Message-Id: <1568302717-46518-16-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 15/32] weston: our patches need rebasing for 7.0.0, disable for now
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston_7.0.0.bbappend | 42 +++++++++++-----------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
index 1bdcf7e..5e15bb6 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
@@ -1,6 +1,4 @@
-# When configured for fbdev compositor, make it the default
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/libgbm mtdev"
+PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/libgbm mtdev"
 
 PR_append = ".arago34"
 
@@ -8,24 +6,24 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-SRC_URI += " \
-        file://0002-weston-Allow-visual_id-to-be-0.patch \
-        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
-        file://0004-weston-Fix-touch-screen-crash-issue.patch \
-        file://0005-weston-drm-fix-dual-display-issue.patch \
-        file://0001-protocol-add-weston-debug.xml.patch \
-        file://0002-libweston-add-weston_debug-API-and-implementation.patch \
-        file://0003-compositor-add-option-to-enable-weston_debug.patch \
-        file://0004-clients-add-weston-debug.patch \
-        file://0005-compositor-offer-logs-via-weston-debug.patch \
-        file://0006-xwm-dump_property-to-use-FILE-internally.patch \
-        file://0007-xwm-move-FILE-to-the-callers-of-dump_property.patch \
-        file://0008-xwm-convert-WM_DEBUG-into-a-weston-debug-scope.patch \
-        file://0009-compositor-protocol-logger.patch \
-        file://0010-compositor-Add-weston_layer_mask_is_infinite.patch \
-        file://0011-compositor-Add-scene-graph-debug-scope.patch \
-        file://0012-compositor-drm-Add-backend-pointer-to-drm_output.patch \
-        file://0013-compositor-drm-Add-drm-backend-log-debug-scope.patch \
-"
+#SRC_URI += " \
+#        file://0002-weston-Allow-visual_id-to-be-0.patch \
+#        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
+#        file://0004-weston-Fix-touch-screen-crash-issue.patch \
+#        file://0005-weston-drm-fix-dual-display-issue.patch \
+#        file://0001-protocol-add-weston-debug.xml.patch \
+#        file://0002-libweston-add-weston_debug-API-and-implementation.patch \
+#        file://0003-compositor-add-option-to-enable-weston_debug.patch \
+#        file://0004-clients-add-weston-debug.patch \
+#        file://0005-compositor-offer-logs-via-weston-debug.patch \
+#        file://0006-xwm-dump_property-to-use-FILE-internally.patch \
+#        file://0007-xwm-move-FILE-to-the-callers-of-dump_property.patch \
+#        file://0008-xwm-convert-WM_DEBUG-into-a-weston-debug-scope.patch \
+#        file://0009-compositor-protocol-logger.patch \
+#        file://0010-compositor-Add-weston_layer_mask_is_infinite.patch \
+#        file://0011-compositor-Add-scene-graph-debug-scope.patch \
+#        file://0012-compositor-drm-Add-backend-pointer-to-drm_output.patch \
+#        file://0013-compositor-drm-Add-drm-backend-log-debug-scope.patch \
+#"
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4


