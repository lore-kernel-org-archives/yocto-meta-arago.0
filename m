Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 994C452A78
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 15:26:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FQ4E2031150
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:26:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FQ4SI005389
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:26:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 10:26:04 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61FQ1Rs006118;	Tue, 1 Jul 2014 10:26:03 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Jul 2014 10:25:56 -0500
Message-ID: <1404228360-7510-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/5] gstreamer: make accelerated recipes instead of appends
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
X-List-Received-Date: Tue, 01 Jul 2014 15:26:05 -0000
Content-Type: text/plain

* Previously adding acceleration was done by appending the base
  GStreamer recipes to pull a new SRC_URI and make some other
  simple changes.
* Now there is a need to be able to control whether to use the
  accelerated version of GStreamer or not.
    * In this case we need to be able to control this because
      the foundation software for IPC is not yet in place to
      allow us to build accelerated GStreamer plugins among
      other packages.
* Instead, make a new package name for the GStreamer elements
  by appending -mm-accel to the recipe name and have these
  package PROVIDE and RPROVIDE the same packages as the base
  recipes.
    * This new recipe also requires the base recipe so that
      changes can be shared between them.
* The use of these -mm-accel recipes requires the MACHINE_FEATURES
  to specify mmip ability and the recipe checks if that is
  available in order to parse properly.
* Following patches will set the PREFERRED_PROVIDER for these
  elements also based on the mmip MACHINE_FEATURE.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  |   42 ++++++++++++++++++++
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   22 ----------
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb |   40 +++++++++++++++++++
 .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   20 ----------
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb |   42 ++++++++++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   23 -----------
 .../gstreamer/gstreamer-mm-accel_0.10.36.bb        |   33 +++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bbappend           |   14 -------
 8 files changed, 157 insertions(+), 79 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
new file mode 100644
index 0000000..7f0bd86
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
@@ -0,0 +1,42 @@
+# This recipe is not valid when not using accelerated multimedia IP
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('gst-plugins-bad needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
+}
+
+# Include the base gst-plugins-bad recipe since this recipe is heavily
+# derived from that one.
+require recipes-multimedia/gstreamer/gst-plugins-bad_${PV}.bb
+
+DESCRIPTION = "GStreamer bad plugins that use multimedia accelerators found on \
+               TI devices"
+
+# Set PROVIDES and RPROVIDES values so that the base recipe names can still
+# be used and PREFERRED_PROVIDER can be used to pick between them.
+PROVIDES += "gst-plugins-bad"
+RPROVIDES_${PN} += "gst-plugins-bad"
+RPROVIDES_${PN}-dev += "gst-plugins-bad-dev"
+RPROVIDES_${PN}-meta += "gst-plugins-bad-meta"
+
+DEPENDS += "omap5-sgx-ddk-um-linux libdce libdrm wayland"
+
+SRCREV = "f2df6f3b684f39500e22115b160191cef6d7dbaf"
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += " --disable-pvr"
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint -f
+}
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
+
+FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-bad-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
deleted file mode 100644
index 74cc9ce..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ /dev/null
@@ -1,22 +0,0 @@
-DEPENDS_append_omap-a15 = " omap5-sgx-ddk-um-linux libdce libdrm wayland "
-
-# Make MACHINE specific since we pull different sources per MACHINE
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR_append = "-arago1"
-
-SRCREV = "f2df6f3b684f39500e22115b160191cef6d7dbaf"
-SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
-
-S_omap-a15 = "${WORKDIR}/git"
-
-EXTRA_OECONF += " --disable-pvr"
-
-do_configure_prepend_omap-a15() {
-	git submodule init && git submodule update
-	autopoint -f
-}
-
-FILES_${PN} += "\
-                ${libdir}/*.so \
-                ${libdir}/gstreamer-0.10/*"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
new file mode 100644
index 0000000..3afb27d
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
@@ -0,0 +1,40 @@
+# This recipe is not valid when not using accelerated multimedia IP
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('gst-plugins-base needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
+}
+
+# Include the base gst-plugins-base recipe since this recipe is heavily
+# derived from that one.
+require recipes-multimedia/gstreamer/gst-plugins-base_${PV}.bb
+
+DESCRIPTION = "GStreamer base plugins that use multimedia accelerators found \
+               on TI devices"
+
+# Set PROVIDES and RPROVIDES values so that the base recipe names can still
+# be used and PREFERRED_PROVIDER can be used to pick between them.
+PROVIDES += "gst-plugins-base"
+RPROVIDES_${PN} += "gst-plugins-base"
+RPROVIDES_${PN}-dev += "gst-plugins-base-dev"
+RPROVIDES_${PN}-meta += "gst-plugins-base-meta"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
+SRCREV = "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint -f
+}
+
+EXTRA_OECONF +="--disable-ivorbis "
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
+
+FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-base-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
deleted file mode 100644
index 6691ee3..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-PR_append = "-arago1"
-
-# Make MACHINE specific since we pull different sources per MACHINE
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
-SRCREV = "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
-
-S_omap-a15 = "${WORKDIR}/git"
-
-do_configure_prepend_omap-a15() {
-	git submodule init && git submodule update
-	autopoint -f
-}
-
-EXTRA_OECONF +="--disable-ivorbis "
-
-FILES_${PN} += "\
-                ${libdir}/*.so \
-                ${libdir}/gstreamer-0.10/*"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
new file mode 100644
index 0000000..b83531f
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
@@ -0,0 +1,42 @@
+# This recipe is not valid when not using accelerated multimedia IP
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('gst-plugins-good needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
+}
+
+# Include the base gst-plugins-bad recipe since this recipe is heavily
+# derived from that one.
+require recipes-multimedia/gstreamer/gst-plugins-good_${PV}.bb
+
+DESCRIPTION = "GStreamer good plugins that use multimedia accelerators found \
+               on TI devices"
+
+# Set PROVIDES and RPROVIDES values so that the base recipe names can still
+# be used and PREFERRED_PROVIDER can be used to pick between them.
+PROVIDES += "gst-plugins-good"
+RPROVIDES_${PN} += "gst-plugins-good"
+RPROVIDES_${PN}-dev += "gst-plugins-good-dev"
+RPROVIDES_${PN}-meta += "gst-plugins-good-meta"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
+SRCREV = "733289614c50ff4e490d5a37ec4af3a540d1dfb9"
+
+# Fix compile errors with recent kernels
+SRC_URI_append = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
+                   file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint -f
+}
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
+
+FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gst-plugins-good-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
deleted file mode 100644
index fdd94e3..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-PR_append = "-arago1"
-
-# Make MACHINE specific since we pull different sources per MACHINE
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
-SRCREV = "733289614c50ff4e490d5a37ec4af3a540d1dfb9"
-
-# Fix compile errors with recent kernels
-SRC_URI_append_omap-a15 = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
-            file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
-
-S_omap-a15 = "${WORKDIR}/git"
-
-do_configure_prepend_omap-a15() {
-	git submodule init && git submodule update
-	autopoint -f
-}
-
-FILES_${PN} += "\
-                ${libdir}/*.so \
-                ${libdir}/gstreamer-0.10/*"
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
new file mode 100644
index 0000000..9dd929f
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
@@ -0,0 +1,33 @@
+# This recipe is not valid when not using accelerated multimedia IP
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('gstreamer needs dependencies derived from "mmip" flag in MACHINE_FEATURES')
+}
+
+# Include the base gst-plugins-bad recipe since this recipe is heavily
+# derived from that one.
+require recipes-multimedia/gstreamer/gstreamer_${PV}.bb
+
+DESCRIPTION = "GStreamer that use multimedia accelerators found on TI devices"
+
+# Set PROVIDES and RPROVIDES values so that the base recipe names can still
+# be used and PREFERRED_PROVIDER can be used to pick between them.
+PROVIDES += "gstreamer"
+RPROVIDES_${PN} += "gstreamer"
+RPROVIDES_${PN}-dev += "gstreamer-dev"
+RPROVIDES_${PN}-meta += "gstreamer-meta"
+
+SRC_URI = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
+SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint -f
+}
+
+FILESPATH .= ":${COREBASE}/meta/recipes-multimedia/gstreamer/gstreamer-${PV}"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
deleted file mode 100644
index 3c97b63..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-SRC_URI_omap-a15 = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
-SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
-
-# Make MACHINE specific since we pull different sources per MACHINE
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR_append = "-arago1"
-
-S_omap-a15 = "${WORKDIR}/git"
-
-do_configure_prepend_omap-a15() {
-	git submodule init && git submodule update
-	autopoint -f
-}
-- 
1.7.9.5


