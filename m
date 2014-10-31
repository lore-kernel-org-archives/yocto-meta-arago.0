Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 851D8529D9
	for <meta-arago@arago-project.org>;
	Fri, 31 Oct 2014 15:48:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9VFmBd7025686
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 10:48:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VFmBDj009564
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 10:48:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 31 Oct 2014 10:48:11 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9VFm89f012302;	Fri, 31 Oct 2014 10:48:10 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Oct 2014 21:13:11 +0530
Message-ID: <1414770194-24178-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1414770194-24178-1-git-send-email-a0393906@ti.com>
References: <1414770194-24178-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master v3 1/4] wayland: Introduce 1.3.0 for DRM based backend
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
X-List-Received-Date: Fri, 31 Oct 2014 15:48:12 -0000
Content-Type: text/plain

This recipe is coming from oe-core

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/wayland/wayland_1.3.0.bb      |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
new file mode 100644
index 0000000..212e08a
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
+SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
+
+SRC_URI_append_class-native = " file://just-scanner.patch"
+
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native libffi-native"
+DEPENDS = "expat libffi wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# Wayland installs a M4 macro for other projects to use, which uses the target
+# pkg-config to find files.  Replace pkg-config with pkg-config-native.
+do_install_append_class-native() {
+  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
+      -e 's,$PKG_CONFIG,pkg-config-native,g' \
+      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
+}
-- 
1.7.9.5


