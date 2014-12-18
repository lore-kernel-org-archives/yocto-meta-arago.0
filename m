Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 5D17D52079
	for <meta-arago@arago-project.org>;
	Thu, 18 Dec 2014 23:48:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGS00DSRY4FNT50@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 18 Dec 2014 17:48:18 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=bEYIsxH5p_7uDo8BHR0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EAE42200F0;	Thu,
	18 Dec 2014 18:48:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 18 Dec 2014 18:48:14 -0500
Message-id: <1418946494-12775-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] gst*-mm-accel: unify naming so dependant libs don't need be machine-specific
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
X-List-Received-Date: Thu, 18 Dec 2014 23:48:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since both mainline gstreamer and mm-accel versions are ABI compatible, it
should be possible to avoid making dependant libraries machine-specific by
unifying the gst names.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend     |  4 +---
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb            | 12 ++++++++++--
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb           | 10 +++++++++-
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb           | 10 +++++++++-
 .../gstreamer/gst-plugins-package-mm-accel.inc               |  2 +-
 .../gstreamer/gstreamer-mm-accel_0.10.36.bb                  |  8 ++++++++
 6 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend
index 9f75d92..26bda41 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend
@@ -1,7 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 	file://GraphicsSurfaceToken.h.patch \
@@ -9,4 +7,4 @@ SRC_URI += " \
 	file://WebCore.pri.patch \
 "
 
-PR_append = "-arago3"
+PR_append = "-arago4"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
index e00e919..e8fa1be 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
@@ -3,11 +3,14 @@
 require recipes-multimedia/gstreamer/gst-plugins-bad_${PV}.bb
 
 require gstreamer-mm-accel.inc
-require gst-plugins-package-mm-accel.inc
+#require gst-plugins-package-mm-accel.inc
 
 DESCRIPTION = "GStreamer bad plugins that use multimedia accelerators found on \
                TI devices"
 
+PN = "gst-plugins-bad"
+B = "${S}"
+
 # Set PROVIDES and RPROVIDES values so that the base recipe names can still
 # be used and PREFERRED_PROVIDER can be used to pick between them.
 PROVIDES += "gst-plugins-bad"
@@ -23,7 +26,7 @@ RCONFLICTS_${PN}-meta += "gst-plugins-bad-meta"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS += "omap5-sgx-ddk-um-linux libdce libdrm wayland"
+DEPENDS += "virtual/libgles2 virtual/egl libdce libdrm wayland"
 
 SRCREV = "a9510bef52331fee9a23a5c955dbf76ac210056a"
 SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
@@ -33,7 +36,12 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF += " --disable-pvr"
 
 do_configure_prepend() {
+	cd ${S}
 	autopoint -f
 }
 
+do_install_prepend() {
+	cd ${S}
+}
+
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-bad-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
index 33f82b0..0748a58 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
@@ -3,11 +3,14 @@
 require recipes-multimedia/gstreamer/gst-plugins-base_${PV}.bb
 
 require gstreamer-mm-accel.inc
-require gst-plugins-package-mm-accel.inc
+#require gst-plugins-package-mm-accel.inc
 
 DESCRIPTION = "GStreamer base plugins that use multimedia accelerators found \
                on TI devices"
 
+PN = "gst-plugins-base"
+B = "${S}"
+
 # Set PROVIDES and RPROVIDES values so that the base recipe names can still
 # be used and PREFERRED_PROVIDER can be used to pick between them.
 PROVIDES += "gst-plugins-base"
@@ -29,9 +32,14 @@ SRCREV = "3427e885daa749275e07339d3633b83c717aa419"
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
+	cd ${S}
 	autopoint -f
 }
 
+do_install_prepend() {
+	cd ${S}
+}
+
 EXTRA_OECONF +="--disable-ivorbis "
 
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-base-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
index ad071ec..dcce5fd 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
@@ -3,11 +3,14 @@
 require recipes-multimedia/gstreamer/gst-plugins-good_${PV}.bb
 
 require gstreamer-mm-accel.inc
-require gst-plugins-package-mm-accel.inc
+#require gst-plugins-package-mm-accel.inc
 
 DESCRIPTION = "GStreamer good plugins that use multimedia accelerators found \
                on TI devices"
 
+PN = "gst-plugins-good"
+B = "${S}"
+
 # Set PROVIDES and RPROVIDES values so that the base recipe names can still
 # be used and PREFERRED_PROVIDER can be used to pick between them.
 PROVIDES += "gst-plugins-good"
@@ -33,7 +36,12 @@ SRC_URI_append = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffe
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
+	cd ${S}
 	autopoint -f
 }
 
+do_install_prepend() {
+	cd ${S}
+}
+
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-good-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
index a1c81f3..b7b5a50 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
@@ -10,7 +10,7 @@ python split_gstreamer10_packages () {
     postinst = d.getVar('plugin_postinst', True)
     glibdir = d.getVar('libdir', True)
 
-    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s-mm-accel', 'gstreamer %s library', extra_depends='', allow_links=True, hook=gst_lib_hook)
+    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True, hook=gst_lib_hook)
     do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
index 8cfbd05..f50d0a3 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
@@ -6,6 +6,9 @@ require recipes-multimedia/gstreamer/gstreamer_${PV}.bb
 
 DESCRIPTION = "GStreamer that use multimedia accelerators found on TI devices"
 
+PN = "gstreamer"
+B = "${S}"
+
 # Set PROVIDES and RPROVIDES values so that the base recipe names can still
 # be used and PREFERRED_PROVIDER can be used to pick between them.
 PROVIDES += "gstreamer"
@@ -27,7 +30,12 @@ SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
+	cd ${S}
 	autopoint -f
 }
 
+do_install_prepend() {
+	cd ${S}
+}
+
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gstreamer-${PV}"
-- 
2.2.0


