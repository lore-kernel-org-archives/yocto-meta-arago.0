Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id C7A0352A0B
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 04:32:21 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLE00HUO4KZTT10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 Mar 2015 23:32:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=-bHgd1t7x4iItbqxGGMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8692720154;	Wed,
	18 Mar 2015 00:31:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 18 Mar 2015 00:31:46 -0400
Message-id: <1426653106-24291-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1426653106-24291-1-git-send-email-denis@denix.org>
References: <1426653106-24291-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] conf/arago, packagegroup-*-gst*: switch gstreamer from 0.10 over to 1.x
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
X-List-Received-Date: Wed, 18 Mar 2015 04:32:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  5 +----
 .../conf/distro/include/arago-prefs.inc            | 13 -------------
 .../packagegroup-arago-gst-sdk-target.bb           | 12 ++++++------
 .../packagegroups/packagegroup-arago-gst.bb        | 22 +++++++++++-----------
 4 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1c14e6f..8d09b7b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -36,9 +36,6 @@ PACKAGECONFIG_pn-weston = "fbdev launch libinput"
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples"
 
-# Configure gstreamer-0.10.x as a dependency instead of gstreamer-1.x
-PACKAGECONFIG_pn-qtwebkit = "gstreamer010 qtlocation qtmultimedia qtsensors"
-
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
@@ -87,4 +84,4 @@ ENTERPRISE_DISTRO = "1"
 # disable by default the codecs in libav that causes issues with shipping an
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
-LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
+LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index fa7a83c..023be46 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -114,19 +114,6 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
-PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
-PREFERRED_PROVIDER_gstreamer-dbg = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dbg', 'gstreamer-dbg', d)}"
-PREFERRED_PROVIDER_gst-plugins-bad = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel', 'gst-plugins-bad', d)}"
-PREFERRED_PROVIDER_gst-plugins-bad-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-dev', 'gst-plugins-bad-dev', d)}"
-PREFERRED_PROVIDER_gst-plugins-bad-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-meta', 'gst-plugins-bad-meta', d)}"
-PREFERRED_PROVIDER_gst-plugins-base = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel', 'gst-plugins-base', d)}"
-PREFERRED_PROVIDER_gst-plugins-base-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel-dev', 'gst-plugins-base-dev', d)}"
-PREFERRED_PROVIDER_gst-plugins-base-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel-meta', 'gst-plugins-base-meta', d)}"
-PREFERRED_PROVIDER_gst-plugins-good = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel', 'gst-plugins-good', d)}"
-PREFERRED_PROVIDER_gst-plugins-good-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel-dev', 'gst-plugins-good-dev', d)}"
-PREFERRED_PROVIDER_gst-plugins-good-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel-meta', 'gst-plugins-good-meta', d)}"
-
 def filter_out(f, str, d):
     from re import match
     return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index bed3e18..e31bb2c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
 RDEPENDS_${PN} = "\
-    gstreamer-dev \
-    gst-plugins-base-dev \
-    gst-plugins-good-dev \
-    gst-plugins-bad-dev \
-    gst-ffmpeg-dev \
+    gstreamer1.0-dev \
+    gstreamer1.0-plugins-base-dev \
+    gstreamer1.0-plugins-good-dev \
+    gstreamer1.0-plugins-bad-dev \
+    gstreamer1.0-libav-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index b12687f..cdef377 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,27 +1,27 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GSTREAMER = " \
-    gstreamer \
-    gst-plugins-base \
-    gst-plugins-good \
-    gst-plugins-bad \
-    gst-plugins-base-meta \
-    gst-plugins-good-meta \
-    gst-plugins-bad-meta \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-base \
+    gstreamer1.0-plugins-good \
+    gstreamer1.0-plugins-bad \
+    gstreamer1.0-plugins-base-meta \
+    gstreamer1.0-plugins-good-meta \
+    gstreamer1.0-plugins-bad-meta \
 "
 
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-ducati', '', d)}"
-GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', ' gst-plugins-vpe', '', d)}"
+GSTREAMER_ACCEL_MM_omap-a15 = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer1.0-plugins-ducati', '', d)}"
+GSTREAMER_ACCEL_MM_append_dra7xx = "${@base_contains('MACHINE_FEATURES', 'mmip', ' gstreamer1.0-plugins-vpe', '', d)}"
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER} \
     ${GSTREAMER_ACCEL_MM} \
-    gst-ffmpeg \
+    gstreamer1.0-libav \
     "
-- 
2.2.0


