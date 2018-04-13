Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 822DF52A12
	for <meta-arago@arago-project.org>;
	Fri, 13 Apr 2018 01:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2698720BBA;
	Fri, 13 Apr 2018 01:09:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LAKPcFPjcHph; Fri, 13 Apr 2018 01:09:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E70D52017D;
	Fri, 13 Apr 2018 01:09:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5FD331633B1;
	Thu, 12 Apr 2018 21:09:49 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Apr 2018 21:09:47 -0400
Message-Id: <1523581788-42355-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] glfw: update to the latest 3.2.1+fixes
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
X-List-Received-Date: Fri, 13 Apr 2018 01:09:54 -0000

Drop 0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch

Patch CMakeList.txt to not check for Wayland-Egl library, as provided by SGX libgles

Rename from glfw3 to glfw as that's its name - http://www.glfw.org/

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../point-cloud-viewer/point-cloud-viewer_2.0.bb   |  2 +-
 ...ist.txt-remove-check-for-Wayland-Egl-prov.patch | 27 ++++++++++++++++++++++
 .../{glfw3/glfw3_git.bb => glfw/glfw_git.bb}       | 10 ++++----
 ...IR-prefix-for-WaylandProtocols_PKGDATADIR.patch | 11 ---------
 4 files changed, 33 insertions(+), 17 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
 rename meta-arago-extras/recipes-graphics/{glfw3/glfw3_git.bb => glfw/glfw_git.bb} (66%)
 delete mode 100644 meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
index 9d3b99e..0119cb4 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "7b25a185122ed739eab040b77f101f866d33f77c4f64cae95d60213787
 
 S = "${WORKDIR}/${PN}-${PV}"
 
-RDEPENDS_${PN} = "glfw3 opencv"
+RDEPENDS_${PN} = "glfw opencv"
 
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch b/meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
new file mode 100644
index 0000000..6116fc1
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glfw/glfw/0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch
@@ -0,0 +1,27 @@
+From c6e30af80018f7a6fc7b8b0e810718f4bd646cf6 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 12 Apr 2018 12:29:39 -0400
+Subject: [PATCH] HACK: CMakeList.txt: remove check for Wayland-Egl, provided
+ by SGX libs
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1f5d6ef..eaf780f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -266,7 +266,7 @@ if (_GLFW_WAYLAND)
+     find_package(ECM REQUIRED NO_MODULE)
+     list(APPEND CMAKE_MODULE_PATH "${ECM_MODULE_PATH}")
+ 
+-    find_package(Wayland REQUIRED Client Cursor Egl)
++    find_package(Wayland REQUIRED Client Cursor)
+     find_package(WaylandScanner REQUIRED)
+     find_package(WaylandProtocols 1.12 REQUIRED)
+ 
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb b/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
similarity index 66%
rename from meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
rename to meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
index 5736594..6c1206c 100644
--- a/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
+++ b/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
@@ -2,16 +2,16 @@ SUMMARY = "GLFW cross platform graphics framework"
 DESCRIPTION = "A multi-platform library for OpenGL and OpenGLES, window and input"
 HOMEPAGE = "http://glfw.org/"
 LICENSE = "Zlib & Libpng"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=352912f8ce21ff7d8b592a4edbe48f50"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=90c6dd54408744b0f8a55f2a6c7ad870"
 
-PV = "3.2"
+PV = "3.2.1+git${SRCPV}"
 PR = "r0"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/glfw/glfw.git;branch=${BRANCH}"
-SRCREV = "f6ec835599123c3c970d34534ed7ddc69a1fc6af"
+SRCREV = "0a3c4f5d80b041ee1a12c8da3503653d98bd1a15"
 
-SRC_URI += "file://0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch"
+SRC_URI += "file://0001-HACK-CMakeList.txt-remove-check-for-Wayland-Egl-prov.patch"
 
 DEPENDS = "extra-cmake-modules glib-2.0 virtual/libgles2 virtual/egl weston wayland wayland-native wayland-protocols"
 
@@ -21,4 +21,4 @@ inherit cmake pkgconfig
 
 EXTRA_OECMAKE += "-DGLFW_USE_WAYLAND=ON -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF"
 
-FILES_${PN} += "/usr/lib/cmake/*"
+FILES_${PN}-dev += "${libdir}/cmake"
diff --git a/meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch b/meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
deleted file mode 100644
index fce7a45..0000000
--- a/meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff --git a/CMake/modules/FindWaylandProtocols.cmake b/CMake/modules/FindWaylandProtocols.cmake
-index 8eb83f2..1e64fa9 100644
---- a/CMake/modules/FindWaylandProtocols.cmake
-+++ b/CMake/modules/FindWaylandProtocols.cmake
-@@ -22,5 +22,5 @@ find_package_handle_standard_args(WaylandProtocols
- )
- 
- set(WAYLAND_PROTOCOLS_FOUND ${WaylandProtocols_FOUND})
--set(WAYLAND_PROTOCOLS_PKGDATADIR ${WaylandProtocols_PKGDATADIR})
-+set(WAYLAND_PROTOCOLS_PKGDATADIR $ENV{PKG_CONFIG_SYSROOT_DIR}/${WaylandProtocols_PKGDATADIR})
- set(WAYLAND_PROTOCOLS_VERSION ${WaylandProtocols_VERSION})
-- 
2.7.4


