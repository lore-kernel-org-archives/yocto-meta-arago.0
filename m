Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3F2FF52987
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2015 10:24:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6RAOqsa020006
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 05:24:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RAOqWt005320
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 05:24:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Jul 2015 05:24:52 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RAOhEB009742;
	Mon, 27 Jul 2015 05:24:51 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Jul 2015 15:54:40 +0530
Message-ID: <1437992680-17958-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437992680-17958-1-git-send-email-a0393906@ti.com>
References: <1437992680-17958-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [daisy, master 2/2] gstreamer1.0-plugins-good: optimize delay in v4l2src
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
X-List-Received-Date: Mon, 27 Jul 2015 10:24:53 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...0002-gstv4l2src-Optimize-delay-in-capture.patch |   31 ++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    5 ++--
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
1.7.9.5


