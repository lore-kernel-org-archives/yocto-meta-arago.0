Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 720D652092
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 19:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1963020C72;
	Fri, 14 Sep 2018 19:29:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mpQfCZUqjcjF; Fri, 14 Sep 2018 19:29:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DB65F20059;
	Fri, 14 Sep 2018 19:29:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3E7E1163639;
	Fri, 14 Sep 2018 15:29:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 14 Sep 2018 15:29:51 -0400
Message-Id: <1536953392-23125-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] glmark2: overlay version 2014.03 locally
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
X-List-Received-Date: Fri, 14 Sep 2018 19:30:04 -0000

Overlay older version 2014.03 from meta-oe before it got upgraded to 2017.07.
New version of glmark2 uses EGL 1.5 APIs that are not yet supported by our
SGX DDK 1.14 version.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ace-should-be-destoryed-after-the-wl_wind.patch | 34 ++++++++++++
 .../files/Fix-configure-for-sqrt-check.patch       | 13 +++++
 ...-packages-to-be-used-by-the-enabled-flavo.patch | 43 ++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb       | 60 ++++++++++++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb

diff --git a/meta-arago-extras/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch b/meta-arago-extras/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
new file mode 100644
index 0000000..4395081
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
@@ -0,0 +1,34 @@
+From 9c74ec83e2929b1d5ab65d5137b6ba42edeb332d Mon Sep 17 00:00:00 2001
+From: Yong Gan <b45748@freescale.com>
+Date: Tue, 27 Oct 2015 18:15:20 +0800
+Subject: [PATCH] Fix: wl_surface should be destoryed after the wl_window
+ destroyed.
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/issues/12]
+
+Signed-off-by: Yong Gan <b45748@freescale.com>
+
+---
+ src/native-state-wayland.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/native-state-wayland.cpp b/src/native-state-wayland.cpp
+index 41fc743..cdcdf34 100644
+--- a/src/native-state-wayland.cpp
++++ b/src/native-state-wayland.cpp
+@@ -56,10 +56,10 @@ NativeStateWayland::~NativeStateWayland()
+             wl_shell_surface_destroy(window_->shell_surface);
+         if (window_->opaque_reqion)
+             wl_region_destroy(window_->opaque_reqion);
+-        if (window_->surface)
+-            wl_surface_destroy(window_->surface);
+         if (window_->native)
+             wl_egl_window_destroy(window_->native);
++        if (window_->surface)
++            wl_surface_destroy(window_->surface);
+         delete window_;
+     }
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch b/meta-arago-extras/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
new file mode 100644
index 0000000..fde8238
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
@@ -0,0 +1,13 @@
+Index: git/wscript
+===================================================================
+--- git.orig/wscript	2016-07-29 13:15:44.954249796 -0500
++++ git/wscript	2016-07-29 15:52:06.196768865 -0500
+@@ -90,7 +90,7 @@
+         ctx.check_cxx(lib = lib, uselib_store = uselib)
+ 
+     # Check required functions
+-    req_funcs = [('memset', 'string.h', []) ,('sqrt', 'math.h', ['m'])]
++    req_funcs = [('memset', 'string.h', [])]
+     for func, header, uselib in req_funcs:
+         ctx.check_cxx(function_name = func, header_name = header,
+                       uselib = uselib, mandatory = True)
diff --git a/meta-arago-extras/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch b/meta-arago-extras/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
new file mode 100644
index 0000000..72b8deb
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/glmark2/files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
@@ -0,0 +1,43 @@
+From: Otavio Salvador <otavio@ossystems.com.br>
+Subject: [PATCH] build: Check packages to be used by the enabled flavors
+Organization: O.S. Systems Software LTDA.
+
+The packages shouldn't be dynamically detected otherwise the build
+predictability is lost. We now have all packages as mandatory but
+dependent of the flavors which use them.
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/8]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ wscript | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/wscript b/wscript
+index cab62a3..e7eaed0 100644
+--- a/wscript
++++ b/wscript
+@@ -121,13 +121,17 @@ def configure(ctx):
+                 ('mirclient','mirclient', '0.13', list_contains(ctx.options.flavors, 'mir')),
+                 ('wayland-client','wayland-client', None, list_contains(ctx.options.flavors, 'wayland')),
+                 ('wayland-egl','wayland-egl', None, list_contains(ctx.options.flavors, 'wayland'))]
+-    for (pkg, uselib, atleast, mandatory) in opt_pkgs:
++    for (pkg, uselib, atleast, check) in opt_pkgs:
++        # Check packages required by the flavors
++        if not check:
++            continue
++
+         if atleast is None:
+             ctx.check_cfg(package = pkg, uselib_store = uselib,
+-                          args = '--cflags --libs', mandatory = mandatory)
++                          args = '--cflags --libs', mandatory = True)
+         else:
+             ctx.check_cfg(package = pkg, uselib_store = uselib, atleast_version=atleast,
+-                          args = '--cflags --libs', mandatory = mandatory)
++                          args = '--cflags --libs', mandatory = True)
+ 
+ 
+     # Prepend CXX flags so that they can be overriden by the
+-- 
+2.4.6
+
diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
new file mode 100644
index 0000000..85d7bf1
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
@@ -0,0 +1,60 @@
+SUMMARY = "OpenGL (ES) 2.0 benchmark"
+DESCRIPTION = "glmark2 is a benchmark for OpenGL (ES) 2.0. \
+It uses only the subset of the OpenGL 2.0 API that is compatible with OpenGL ES 2.0."
+HOMEPAGE = "https://launchpad.net/glmark2"
+BUGTRACKER = "https://bugs.launchpad.net/glmark2"
+
+LICENSE = "GPLv3+ & SGIv1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
+
+DEPENDS = "libpng jpeg"
+
+PV = "2014.03+${SRCPV}"
+
+COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
+
+SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
+    file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
+    file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
+    file://Fix-configure-for-sqrt-check.patch \
+"
+SRCREV = "9b1070fe9c5cf908f323909d3c8cbed08022abe8"
+
+S = "${WORKDIR}/git"
+
+inherit waf pkgconfig
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl x11-gles2', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
+                  drm-gl drm-gles2"
+
+# Enable C++11 features
+CXXFLAGS += "-std=c++11"
+
+PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
+PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
+PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
+PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm"
+PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
+PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
+
+python __anonymous() {
+    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
+    flavors = []
+    if "x11-gles2" in packageconfig:
+        flavors.append("x11-glesv2")
+    if "x11-gl" in packageconfig:
+        flavors.append("x11-gl")
+    if "wayland-gles2" in packageconfig:
+        flavors.append("wayland-glesv2")
+    if "wayland-gl" in packageconfig:
+        flavors.append("wayland-gl")
+    if "drm-gles2" in packageconfig:
+        flavors.append("drm-glesv2")
+    if "drm-gl" in packageconfig:
+        flavors.append("drm-gl")
+    if flavors:
+        d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
+}
+
-- 
2.7.4


