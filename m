Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id D7F4F52A72
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2015 00:36:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC008LVUZOU940@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 19 Aug 2015 19:35:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=7qQRNRuSVjtZ-F-FqvUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 646A6161B88;	Wed,
	19 Aug 2015 20:35:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2015 20:35:41 -0400
Message-id: <1440030941-20751-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1440030941-20751-1-git-send-email-denis@denix.org>
References: <1440030941-20751-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 8/8] gstreamer1.0-plugins-good: optimize delay in v4l2src
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
X-List-Received-Date: Thu, 20 Aug 2015 00:36:04 -0000

From: Karthik Ramanan <a0393906@ti.com>

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...0002-gstv4l2src-Optimize-delay-in-capture.patch | 31 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |  5 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
new file mode 100644
index 0000000..07c2f24
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
@@ -0,0 +1,31 @@
+From e989ef6143b222df6eb79bab626fc972d6513ead Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Wed, 4 Mar 2015 16:40:26 +0530
+Subject: [PATCH 2/2] gstv4l2src: Optimize delay in capture
+
+This patch reduces the delay in capture by reducing
+the S_FMT ioctls for determining whether its interlaced capture.
+It assumes capture is not interlaced if driver is vip
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ sys/v4l2/gstv4l2object.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index c3ed422..77d75c2 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -1706,6 +1706,9 @@ gst_v4l2_object_probe_caps_for_format_and_size (GstV4l2Object * v4l2object,
+      * causes expensive and slow USB IO, so don't probe them for interlaced
+      */
+     interlaced = FALSE;
++  } else if (!strcmp ((char *) v4l2object->vcap.driver, "vip")) {
++    /* Interlaced detection using VIDIOC_TRY/S_FMT */
++    interlaced = FALSE;
+   } else {
+     /* Interlaced detection using VIDIOC_TRY/S_FMT */
+     if (!gst_v4l2_object_get_nearest_size (v4l2object, pixelformat,
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
index 0548aa9..6b8df1d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
@@ -1,6 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " \
-        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
+        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch \
+        file://0002-gstv4l2src-Optimize-delay-in-capture.patch"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
2.2.0


