Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 55CCA52AD2
	for <meta-arago@arago-project.org>;
	Mon,  3 Nov 2014 18:51:38 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH00JZV8DBIO40@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 12:51:27 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=V7nKCljn c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=CfzDKNUSVo0ZtIPmJkgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 72AB1201AD;	Mon,
	3 Nov 2014 13:51:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 13:51:09 -0500
Message-id: <1415040669-16780-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415040669-16780-1-git-send-email-denis@denix.org>
References: <1415040669-16780-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] gstreamer-mm-accel: improve packaging and avoid conflicts with non-accel version
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
X-List-Received-Date: Mon, 03 Nov 2014 18:51:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Split out and package all the libraries and plugins with the correct naming to
avoid conflicting with generic non-accel gstreamer version, when building for
multiple machines of the same architecture, but mixed "mmip" flag.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |  8 ++++++++
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  | 24 ++++++++++------------
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb | 24 ++++++++++------------
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb | 24 ++++++++++------------
 .../gstreamer/gst-plugins-package-mm-accel.inc     | 17 +++++++++++++++
 .../gstreamer/gstreamer-mm-accel.inc               |  9 ++++++++
 .../gstreamer/gstreamer-mm-accel_0.10.36.bb        | 19 +++++++++--------
 7 files changed, 77 insertions(+), 48 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 510ca3c..5e36740 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -111,9 +111,17 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 
 PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
+PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
+PREFERRED_PROVIDER_gstreamer-dbg = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dbg', 'gstreamer-dbg', d)}"
 PREFERRED_PROVIDER_gst-plugins-bad = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel', 'gst-plugins-bad', d)}"
+PREFERRED_PROVIDER_gst-plugins-bad-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-dev', 'gst-plugins-bad-dev', d)}"
+PREFERRED_PROVIDER_gst-plugins-bad-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-meta', 'gst-plugins-bad-meta', d)}"
 PREFERRED_PROVIDER_gst-plugins-base = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel', 'gst-plugins-base', d)}"
+PREFERRED_PROVIDER_gst-plugins-base-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel-dev', 'gst-plugins-base-dev', d)}"
+PREFERRED_PROVIDER_gst-plugins-base-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel-meta', 'gst-plugins-base-meta', d)}"
 PREFERRED_PROVIDER_gst-plugins-good = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel', 'gst-plugins-good', d)}"
+PREFERRED_PROVIDER_gst-plugins-good-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel-dev', 'gst-plugins-good-dev', d)}"
+PREFERRED_PROVIDER_gst-plugins-good-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel-meta', 'gst-plugins-good-meta', d)}"
 
 def filter_out(f, str, d):
     from re import match
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
index 7f0bd86..2f3a3a7 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
@@ -1,16 +1,10 @@
-# This recipe is not valid when not using accelerated multimedia IP
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('gst-plugins-bad needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
-}
-
 # Include the base gst-plugins-bad recipe since this recipe is heavily
 # derived from that one.
 require recipes-multimedia/gstreamer/gst-plugins-bad_${PV}.bb
 
+require gstreamer-mm-accel.inc
+require gst-plugins-package-mm-accel.inc
+
 DESCRIPTION = "GStreamer bad plugins that use multimedia accelerators found on \
                TI devices"
 
@@ -20,6 +14,14 @@ PROVIDES += "gst-plugins-bad"
 RPROVIDES_${PN} += "gst-plugins-bad"
 RPROVIDES_${PN}-dev += "gst-plugins-bad-dev"
 RPROVIDES_${PN}-meta += "gst-plugins-bad-meta"
+RREPLACES_${PN} += "gst-plugins-bad"
+RREPLACES_${PN}-dev += "gst-plugins-bad-dev"
+RREPLACES_${PN}-meta += "gst-plugins-bad-meta"
+RCONFLICTS_${PN} += "gst-plugins-bad"
+RCONFLICTS_${PN}-dev += "gst-plugins-bad-dev"
+RCONFLICTS_${PN}-meta += "gst-plugins-bad-meta"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "omap5-sgx-ddk-um-linux libdce libdrm wayland"
 
@@ -35,8 +37,4 @@ do_configure_prepend() {
 	autopoint -f
 }
 
-FILES_${PN} += "\
-                ${libdir}/*.so \
-                ${libdir}/gstreamer-0.10/*"
-
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-bad-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
index 3afb27d..bfd6b52 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
@@ -1,16 +1,10 @@
-# This recipe is not valid when not using accelerated multimedia IP
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('gst-plugins-base needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
-}
-
 # Include the base gst-plugins-base recipe since this recipe is heavily
 # derived from that one.
 require recipes-multimedia/gstreamer/gst-plugins-base_${PV}.bb
 
+require gstreamer-mm-accel.inc
+require gst-plugins-package-mm-accel.inc
+
 DESCRIPTION = "GStreamer base plugins that use multimedia accelerators found \
                on TI devices"
 
@@ -20,6 +14,14 @@ PROVIDES += "gst-plugins-base"
 RPROVIDES_${PN} += "gst-plugins-base"
 RPROVIDES_${PN}-dev += "gst-plugins-base-dev"
 RPROVIDES_${PN}-meta += "gst-plugins-base-meta"
+RREPLACES_${PN} += "gst-plugins-base"
+RREPLACES_${PN}-dev += "gst-plugins-base-dev"
+RREPLACES_${PN}-meta += "gst-plugins-base-meta"
+RCONFLICTS_${PN} += "gst-plugins-base"
+RCONFLICTS_${PN}-dev += "gst-plugins-base-dev"
+RCONFLICTS_${PN}-meta += "gst-plugins-base-meta"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
 SRCREV = "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
@@ -33,8 +35,4 @@ do_configure_prepend() {
 
 EXTRA_OECONF +="--disable-ivorbis "
 
-FILES_${PN} += "\
-                ${libdir}/*.so \
-                ${libdir}/gstreamer-0.10/*"
-
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-base-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
index b83531f..f4f24c6 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
@@ -1,16 +1,10 @@
-# This recipe is not valid when not using accelerated multimedia IP
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('gst-plugins-good needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
-}
-
 # Include the base gst-plugins-bad recipe since this recipe is heavily
 # derived from that one.
 require recipes-multimedia/gstreamer/gst-plugins-good_${PV}.bb
 
+require gstreamer-mm-accel.inc
+require gst-plugins-package-mm-accel.inc
+
 DESCRIPTION = "GStreamer good plugins that use multimedia accelerators found \
                on TI devices"
 
@@ -20,6 +14,14 @@ PROVIDES += "gst-plugins-good"
 RPROVIDES_${PN} += "gst-plugins-good"
 RPROVIDES_${PN}-dev += "gst-plugins-good-dev"
 RPROVIDES_${PN}-meta += "gst-plugins-good-meta"
+RREPLACES_${PN} += "gst-plugins-good"
+RREPLACES_${PN}-dev += "gst-plugins-good-dev"
+RREPLACES_${PN}-meta += "gst-plugins-good-meta"
+RCONFLICTS_${PN} += "gst-plugins-good"
+RCONFLICTS_${PN}-dev += "gst-plugins-good-dev"
+RCONFLICTS_${PN}-meta += "gst-plugins-good-meta"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
 SRCREV = "733289614c50ff4e490d5a37ec4af3a540d1dfb9"
@@ -35,8 +37,4 @@ do_configure_prepend() {
 	autopoint -f
 }
 
-FILES_${PN} += "\
-                ${libdir}/*.so \
-                ${libdir}/gstreamer-0.10/*"
-
 FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-good-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
new file mode 100644
index 0000000..a1c81f3
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
@@ -0,0 +1,17 @@
+python split_gstreamer10_packages () {
+    def gst_lib_hook(file, pkg, pattern, format, basename):
+        pkglist = " lib" + basename + " lib" + basename + "-0"
+        d.setVar("DEBIAN_NOAUTONAME_" + pkg, "1")
+        d.appendVar("RPROVIDES_" + pkg, pkglist)
+        d.appendVar("RREPLACES_" + pkg, pkglist)
+        d.appendVar("RCONFLICTS_" + pkg, pkglist)
+
+    gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
+    postinst = d.getVar('plugin_postinst', True)
+    glibdir = d.getVar('libdir', True)
+
+    do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s-mm-accel', 'gstreamer %s library', extra_depends='', allow_links=True, hook=gst_lib_hook)
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
+}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc
new file mode 100644
index 0000000..d9874b4
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc
@@ -0,0 +1,9 @@
+# This recipe is not valid when not using accelerated multimedia IP
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    pkgn = bb.data.getVar("PN", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('%s needs dependencies derived from "mmip" flag in MACHINE_FEATURES' % pkgn)
+}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
index 9dd929f..d3db41e 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
@@ -1,11 +1,4 @@
-# This recipe is not valid when not using accelerated multimedia IP
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('gstreamer needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
-}
+require gstreamer-mm-accel.inc
 
 # Include the base gst-plugins-bad recipe since this recipe is heavily
 # derived from that one.
@@ -18,7 +11,15 @@ DESCRIPTION = "GStreamer that use multimedia accelerators found on TI devices"
 PROVIDES += "gstreamer"
 RPROVIDES_${PN} += "gstreamer"
 RPROVIDES_${PN}-dev += "gstreamer-dev"
-RPROVIDES_${PN}-meta += "gstreamer-meta"
+RPROVIDES_${PN}-dbg += "gstreamer-dbg"
+RREPLACES_${PN} += "gstreamer"
+RREPLACES_${PN}-dev += "gstreamer-dev"
+RREPLACES_${PN}-dbg += "gstreamer-dbg"
+RCONFLICTS_${PN} += "gstreamer"
+RCONFLICTS_${PN}-dev += "gstreamer-dev"
+RCONFLICTS_${PN}-dbg += "gstreamer-dbg"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
 SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
-- 
2.1.2


