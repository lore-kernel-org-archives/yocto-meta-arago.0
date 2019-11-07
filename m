Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 18D99529D4
	for <meta-arago@arago-project.org>;
	Thu,  7 Nov 2019 05:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 234A040BFB;
	Thu,  7 Nov 2019 05:09:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nyt_CgP_r6kO; Thu,  7 Nov 2019 05:09:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C5ED840B37;
	Thu,  7 Nov 2019 05:09:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7FD2F170390;
	Thu,  7 Nov 2019 00:09:46 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  7 Nov 2019 00:09:46 -0500
Message-Id: <1573103386-8597-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] packagegroup-*-graphics*: cleanup
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
X-List-Received-Date: Thu, 07 Nov 2019 05:11:11 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  | 12 +++---
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb | 22 ++++------
 .../packagegroup-arago-tisdk-graphics.bb           | 50 +++++++++-------------
 3 files changed, 34 insertions(+), 50 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 486d080..8f6d112 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,17 +1,15 @@
 DESCRIPTION = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
+inherit machine_features_check
 
-GRAPHICS_RDEPENDS = "${PREFERRED_PROVIDER_virtual/gpudriver}-src"
-
-GRAPHICS_RDEPENDS_append_omap-a15 = "\
-    ti-gc320-driver-src \
-"
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 RDEPENDS_${PN} = "\
-    ${GRAPHICS_RDEPENDS} \
+    ${PREFERRED_PROVIDER_virtual/gpudriver}-src \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-driver-src', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index cea4c7a..63cd882 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,25 +1,21 @@
 DESCRIPTION = "Task to install graphics binaries on sdk target"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
+inherit machine_features_check
 
-GRAPHICS_RDEPENDS = "\
-    ${PREFERRED_PROVIDER_virtual/libgbm}-dev \
-    libdrm-dev \
-    wayland-dev \
-    weston-dev \
-    ${PREFERRED_PROVIDER_virtual/egl}-dev \
-    ${PREFERRED_PROVIDER_virtual/gpudriver}-dev \
-"
-GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-dev"
+REQUIRED_MACHINE_FEATURES = "gpu"
 
-GRAPHICS_RDEPENDS_append_omap-a15 = "\
-    ti-gc320-libs-dev \
+GRAPHICS_RDEPENDS = "\
 "
 
 RDEPENDS_${PN} = "\
-    ${GRAPHICS_RDEPENDS} \
+    libegl-dev \
+    libdrm-dev \
+    wayland-dev \
+    weston-dev \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 02404bc..37e1606 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,49 +1,39 @@
-DESCRIPTION = "Task to install graphics binaries"
+DESCRIPTION = "Task to install graphics packages"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
+inherit machine_features_check
 
-GRAPHICS_WAYLAND = "\
-    weston \
+REQUIRED_MACHINE_FEATURES = "gpu"
+
+GFX_WAYLAND = "\
     weston-init \
     weston-examples \
     wayland-ivi-extension \
 "
 
-GRAPHICS_WAYLAND_append_omap-a15 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
-"
-
-GRAPHICS_WAYLAND_append_k3 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
-"
-
-GRAPHICS_RDEPENDS = "\
-    ${PREFERRED_PROVIDER_virtual/libgbm} \
-    ${PREFERRED_PROVIDER_virtual/egl} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','glmark2','',d)} \
-"
-GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km"
-
-GRAPHICS_DISPLAY_UTILS = "\
+GFX_CHROMIUM = ""
+GFX_CHROMIUM_append_omap-a15 = "\
+    chromium-wayland \
 "
 
-GRAPHICS_DISPLAY_UTILS_append_omap-a15  = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-util-scripts','',d)} \
+GFX_CHROMIUM_append_k3 = "\
+    chromium-wayland \
 "
 
-GRAPHICS_RDEPENDS_append_omap-a15 = "\
-    ti-gc320-tests \
-    ti-gc320-driver \
-    ti-gc320-libs  \
+GFX_UTILS = ""
+GFX_UTILS_append_omap-a15  = "\
+    glsdk-util-scripts \
 "
 
 RDEPENDS_${PN} = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WAYLAND}", '', d)} \
-    ${GRAPHICS_RDEPENDS} \
-    ${GRAPHICS_DISPLAY_UTILS} \
+    libegl \
+    glmark2 \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_CHROMIUM}", '', d)} \
+    ${GFX_UTILS} \
 "
-- 
2.7.4


