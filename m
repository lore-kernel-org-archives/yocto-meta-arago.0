Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 561CD52ADA
	for <meta-arago@arago-project.org>;
	Fri, 29 Apr 2016 22:46:29 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F00GI539G1U50@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Apr 2016 17:46:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=i3vjkGWEehO7jjUfOZgA:9
Received: by 100.15.86.14 with SMTP id 6cca91ae; Fri, 29 Apr 2016 22:46:28 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 69487161FCE;	Fri,
	29 Apr 2016 18:46:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Apr 2016 18:46:27 -0400
Message-id: <1461969987-32602-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf, packagegroup-*-gst, glsdk-example: simplify gstreamer dependencies
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
X-List-Received-Date: Fri, 29 Apr 2016 22:46:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since gstreamer 0.10 is now completely gone, no need to support both 0.10 and 1.x

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  5 ----
 .../packagegroup-arago-gst-sdk-target.bb           | 18 ++++-----------
 .../packagegroups/packagegroup-arago-gst.bb        | 27 ++++++----------------
 .../glsdk-example-apps/glsdk-example-apps.bb       |  2 +-
 4 files changed, 13 insertions(+), 39 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1d68622..409b96a 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -35,8 +35,6 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"
 # Set additional distro features
 DISTRO_FEATURES += "pam wayland opengl"
 
-# Set preferred gstreamer version (0.10 vs 1.0)
-GST_PROVIDER ?= "1.0"
 
 # Set preferred Qt version
 QT_PROVIDER ?= "qt5"
@@ -48,9 +46,6 @@ PACKAGECONFIG_pn-weston = "egl kms launch libinput"
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples"
 
-# Configure gstreamer dependency based on GST_PROVIDER
-PACKAGECONFIG_pn-qtwebkit = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer010', 'gstreamer', d)} qtlocation qtmultimedia qtsensors"
-
 # Add gstreamer in package configuration to enable video
 PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 8a331e4..84e7244 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,20 +1,12 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-GST_010_DEPS = " \
-    gstreamer-dev \
-    gst-plugins-base-dev \
-    gst-plugins-good-dev \
-    gst-plugins-bad-dev \
-    gst-ffmpeg-dev \
-"
-
-GST_1X_DEPS = " \
+GSTREAMER_DEPS = " \
     gstreamer1.0-dev \
     gstreamer1.0-plugins-base-dev \
     gstreamer1.0-plugins-good-dev \
@@ -22,14 +14,14 @@ GST_1X_DEPS = " \
     gstreamer1.0-libav-dev \
 "
 
-GST_1X_DEPS_append_dra7xx = " \
+GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc-dev \
 "
 
-GST_1X_DEPS_append_keystone = " \
+GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc-dev \
 "
 
 RDEPENDS_${PN} = " \
-    ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
+    ${GSTREAMER_DEPS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 0ba7423..75a2579 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,23 +1,12 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-GST_010_DEPS = " \
-    gstreamer \
-    gst-plugins-base \
-    gst-plugins-good \
-    gst-plugins-bad \
-    gst-plugins-base-meta \
-    gst-plugins-good-meta \
-    gst-plugins-bad-meta \
-    gst-ffmpeg \
-"
-
-GST_1X_DEPS = " \
+GSTREAMER_DEPS = " \
     gstreamer1.0 \
     gstreamer1.0-plugins-base \
     gstreamer1.0-plugins-good \
@@ -28,21 +17,19 @@ GST_1X_DEPS = " \
     gstreamer1.0-libav \
 "
 
-GST_1X_DEPS_append_dra7xx = " \
+GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc \
 "
 
-GST_1X_DEPS_append_keystone = " \
+GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc \
 "
 
-GST_PLUGINS_PREFIX = "${@base_conditional('GST_PROVIDER', '0.10', 'gst-plugins', 'gstreamer1.0-plugins', d)}"
-
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "${GST_PLUGINS_PREFIX}-ducati", '', d)}"
-GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " ${GST_PLUGINS_PREFIX}-vpe", '', d)}"
+GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS_${PN} = "\
-    ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
+    ${GSTREAMER_DEPS} \
     ${GSTREAMER_ACCEL_MM} \
     "
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 8feed34..b4efe08 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/glsdk"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148"
 
-DEPENDS = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer', 'gstreamer1.0', d)} libdrm ti-ipc"
+DEPENDS = "gstreamer1.0 libdrm ti-ipc"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
-- 
2.2.0


