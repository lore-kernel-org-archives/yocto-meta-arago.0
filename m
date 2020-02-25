Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AF38C529A5
	for <meta-arago@arago-project.org>;
	Tue, 25 Feb 2020 04:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5A3E540C2F;
	Tue, 25 Feb 2020 04:44:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EDWVjpAtjWkd; Tue, 25 Feb 2020 04:44:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DEF040C26;
	Tue, 25 Feb 2020 04:44:34 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E8E10161A11;
	Mon, 24 Feb 2020 23:44:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Feb 2020 23:44:29 -0500
Message-Id: <1582605871-34892-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH v2 1/3] packagegroup-*-graphics*: cleanup
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
X-List-Received-Date: Tue, 25 Feb 2020 04:46:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  | 15 +++----
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb | 24 ++++-------
 .../packagegroup-arago-tisdk-graphics.bb           | 47 ++++++----------------
 3 files changed, 27 insertions(+), 59 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index e669765..675c756 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -1,17 +1,14 @@
-DESCRIPTION = "Task to install graphics sources in SDK"
+SUMMARY = "Task to install graphics sources in SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup machine_features_check
 
-GRAPHICS_RDEPENDS = "${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}-src','',d)}"
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
index f4652d5..96a5bd9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -1,25 +1,17 @@
-DESCRIPTION = "Task to install graphics binaries on sdk target"
+SUMMARY = "Task to install graphics packages on sdk target"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup machine_features_check
 
-GRAPHICS_RDEPENDS = "\
-    ${PREFERRED_PROVIDER_virtual/libgbm}-dev \
+REQUIRED_MACHINE_FEATURES = "gpu"
+
+RDEPENDS_${PN} = "\
+    libegl-dev \
     libdrm-dev \
     wayland-dev \
     weston-dev \
-    ${PREFERRED_PROVIDER_virtual/egl}-dev \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}-dev','',d)} \
-"
-GRAPHICS_RDEPENDS_remove_j7-evm = "ti-sgx-ddk-km-dev"
-
-GRAPHICS_RDEPENDS_append_omap-a15 = "\
-    ti-gc320-libs-dev \
-"
-
-RDEPENDS_${PN} = "\
-    ${GRAPHICS_RDEPENDS} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 72f3efe..131ec71 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,48 +1,27 @@
-DESCRIPTION = "Task to install graphics binaries"
+SUMMARY = "Task to install graphics packages"
 LICENSE = "MIT"
 PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup
+inherit packagegroup machine_features_check
 
-#    wayland-ivi-extension
-GRAPHICS_WAYLAND = "\
-    weston \
+REQUIRED_MACHINE_FEATURES = "gpu"
+
+GFX_WAYLAND = "\
     weston-init \
     weston-examples \
 "
 
-#GRAPHICS_WAYLAND_append_omap-a15 = "\
-#    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
-#"
-
-#GRAPHICS_WAYLAND_append_k3 = "\
-#    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
-#"
-
-GRAPHICS_RDEPENDS = "\
-    ${PREFERRED_PROVIDER_virtual/libgbm} \
-    ${PREFERRED_PROVIDER_virtual/egl} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','glmark2','',d)} \
-"
-
-GRAPHICS_DISPLAY_UTILS = "\
-"
-
-GRAPHICS_DISPLAY_UTILS_append_omap-a15  = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-util-scripts','',d)} \
-"
-
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
+    ${GFX_UTILS} \
 "
-- 
2.7.4


