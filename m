Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5BE71529BF
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 22:04:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7GM4sEP005524
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7GM4rOD006576
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 Aug 2016 17:04:52 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7GM4pis018753;	Tue, 16 Aug 2016 17:04:52 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Aug 2016 18:04:47 -0400
Message-ID: <1471385087-22759-4-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471385087-22759-1-git-send-email-h-gou@ti.com>
References: <1471385087-22759-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] glfw3: add version 3.2
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
X-List-Received-Date: Tue, 16 Aug 2016 22:04:59 -0000
Content-Type: text/plain

* glfw3 is a multi-platform library for OpenGL, OpenGL ES, windown and input. It provides
  cross-platform graphics environment to create and setup context for OpenGL-enabled
  applications.
* Patch 0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
  is added to specify WaylandProtocols_PKGDATADIR with the correct prefix

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 ...IR-prefix-for-WaylandProtocols_PKGDATADIR.patch | 11 ++++++++++
 .../recipes-graphics/glfw3/glfw3_git.bb            | 24 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb

diff --git a/meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch b/meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
new file mode 100644
index 0000000..fce7a45
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glfw3/files/0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch
@@ -0,0 +1,11 @@
+diff --git a/CMake/modules/FindWaylandProtocols.cmake b/CMake/modules/FindWaylandProtocols.cmake
+index 8eb83f2..1e64fa9 100644
+--- a/CMake/modules/FindWaylandProtocols.cmake
++++ b/CMake/modules/FindWaylandProtocols.cmake
+@@ -22,5 +22,5 @@ find_package_handle_standard_args(WaylandProtocols
+ )
+ 
+ set(WAYLAND_PROTOCOLS_FOUND ${WaylandProtocols_FOUND})
+-set(WAYLAND_PROTOCOLS_PKGDATADIR ${WaylandProtocols_PKGDATADIR})
++set(WAYLAND_PROTOCOLS_PKGDATADIR $ENV{PKG_CONFIG_SYSROOT_DIR}/${WaylandProtocols_PKGDATADIR})
+ set(WAYLAND_PROTOCOLS_VERSION ${WaylandProtocols_VERSION})
diff --git a/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb b/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
new file mode 100644
index 0000000..5736594
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "GLFW cross platform graphics framework"
+DESCRIPTION = "A multi-platform library for OpenGL and OpenGLES, window and input"
+HOMEPAGE = "http://glfw.org/"
+LICENSE = "Zlib & Libpng"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=352912f8ce21ff7d8b592a4edbe48f50"
+
+PV = "3.2"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glfw/glfw.git;branch=${BRANCH}"
+SRCREV = "f6ec835599123c3c970d34534ed7ddc69a1fc6af"
+
+SRC_URI += "file://0001-add-PKG_CONFIG_SYSROOT_DIR-prefix-for-WaylandProtocols_PKGDATADIR.patch"
+
+DEPENDS = "extra-cmake-modules glib-2.0 virtual/libgles2 virtual/egl weston wayland wayland-native wayland-protocols"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += "-DGLFW_USE_WAYLAND=ON -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF"
+
+FILES_${PN} += "/usr/lib/cmake/*"
-- 
1.9.1


