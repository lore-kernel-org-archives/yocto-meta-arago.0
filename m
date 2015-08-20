Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id DDCC552AB7
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2015 00:36:05 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC00BZGUZOIM20@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 19 Aug 2015 19:35:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=USUiUNHtF2CYj4wFm4QA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5321B161B86;	Wed,
	19 Aug 2015 20:35:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2015 20:35:39 -0400
Message-id: <1440030941-20751-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1440030941-20751-1-git-send-email-denis@denix.org>
References: <1440030941-20751-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 6/8] Revert "gstreamer: update from 1.2.3 to 1.4.5, disable local patches for now"
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
X-List-Received-Date: Thu, 20 Aug 2015 00:36:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit b204f6c2372dfafc09c09610f3aad56f3f421763.
---
 ....bbappend => gstreamer1.0-libav_1.2.3.bbappend} |  0
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        | 23 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.4.5.bbappend        | 23 ----------------------
 ...nd => gstreamer1.0-plugins-base_1.2.3.bbappend} |  0
 ...nd => gstreamer1.0-plugins-good_1.2.3.bbappend} |  2 +-
 .../gstreamer1.0-plugins-good_1.4.5.bbappend       |  6 ------
 6 files changed, 24 insertions(+), 30 deletions(-)
 rename meta-arago-distro/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.5.bbappend => gstreamer1.0-libav_1.2.3.bbappend} (100%)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
 copy meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.4.5.bbappend => gstreamer1.0-plugins-base_1.2.3.bbappend} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.4.5.bbappend => gstreamer1.0-plugins-good_1.2.3.bbappend} (55%)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bbappend
rename to meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
new file mode 100644
index 0000000..2e91320
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -0,0 +1,23 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PACKAGECONFIG = "faad"
+
+PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
+
+DEPENDS_append_omap-a15 = " \
+    libdce \
+    libdrm \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI_append = " \
+        file://0001-Added-GstDRMBufferPool-support.patch \
+        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
+        file://0003-Added-KMSsink-support.patch \
+        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
+        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
+        file://0006-GstDRMBufferPool-support-fix.patch \
+"
+
+PR_append = "-arago3"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
deleted file mode 100644
index 14bf998..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PACKAGECONFIG = "faad"
-
-PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-
-DEPENDS_append_omap-a15 = " \
-    libdce \
-    libdrm \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-#SRC_URI_append = " \
-#        file://0001-Added-GstDRMBufferPool-support.patch \
-#        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
-#        file://0003-Added-KMSsink-support.patch \
-#        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
-#        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch \
-#        file://0006-GstDRMBufferPool-support-fix.patch \
-#"
-
-PR_append = "-arago3"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
similarity index 100%
copy from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend
copy to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
similarity index 55%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
index ce821cc..0548aa9 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " \
-        file://0001-Added-GstMetaDmaBuf-features.patch"
+        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
 
 PR_append = "-arago0"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend
deleted file mode 100644
index 682ecc8..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-#SRC_URI_append = " \
-#        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
-
-PR_append = "-arago0"
-- 
2.2.0


