Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B22D552A65
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 18:38:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALIc6Pm020325
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 12:38:06 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALIc6w9029303
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 12:38:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 21 Nov 2013 12:38:06 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALIc3YC009044;
	Thu, 21 Nov 2013 12:38:05 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Nov 2013 13:39:53 -0600
Message-ID: <1385062793-17425-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] gst-plugins-bad: fix gstfbdevsink to avoid segfault
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
X-List-Received-Date: Thu, 21 Nov 2013 18:38:07 -0000
Content-Type: text/plain

* On OMAP devices with omapdss if the xres doesn't match the
  physically allocated buffer size a segmentation fault will be
  thrown.  this patch fixes the gstfbdevsink to handle this case
  and properly compute the bytes per pixel value.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...ink-fixing-calculation-of-bytes-per-pixel.patch |   52 ++++++++++++++++++++
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    5 +-
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch
new file mode 100644
index 0000000..0b417db
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch
@@ -0,0 +1,52 @@
+From 76fc77de1d38b6a41585898e16dc259bbfbb50d3 Mon Sep 17 00:00:00 2001
+From: Darren Etheridge <detheridge@ti.com>
+Date: Wed, 20 Nov 2013 15:23:51 -0600
+Subject: [PATCH] sys/fbdevsink:  fixing calculation of bytes per pixel
+
+Original method will only work where there xres is identical to the
+physically allocated buffer size.  On omapdss this is unlikely to be true
+because of the way buffers are allocated out of a much larger buffer in
+3 dimensions - meaning there often be a stride (or pitch) for each line.
+Changing the method of figuring out the bytes per pixel to a method that
+should work in all circumstances.
+
+Signed-off-by: Darren Etheridge <detheridge@ti.com>
+---
+ sys/fbdev/gstfbdevsink.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/sys/fbdev/gstfbdevsink.c b/sys/fbdev/gstfbdevsink.c
+index 7878fbf..aacef5e 100644
+--- a/sys/fbdev/gstfbdevsink.c
++++ b/sys/fbdev/gstfbdevsink.c
+@@ -213,7 +213,26 @@ gst_fbdevsink_setcaps (GstBaseSink * bsink, GstCaps * vscapslist)
+   gst_structure_get_int (structure, "height", &fbdevsink->height);
+ 
+   /* calculate centering and scanlengths for the video */
+-  fbdevsink->bytespp = fbdevsink->fixinfo.line_length / fbdevsink->varinfo.xres;
++  switch(fbdevsink->varinfo.bits_per_pixel) {
++    case 8:
++      fbdevsink->bytespp = 1;
++      break;
++    case 15:
++    case 16:
++      fbdevsink->bytespp = 2;
++      break;
++    case 24:
++      fbdevsink->bytespp = 3;
++      break;
++    case 32:
++      fbdevsink->bytespp = 4;
++      break;
++    default:
++      /* other bit depths are not supported */
++      g_warning ("unsupported bit depth: %d\n",
++          fbdevsink->varinfo.bits_per_pixel);
++      return FALSE;
++  }
+ 
+   fbdevsink->cx = ((int) fbdevsink->varinfo.xres - fbdevsink->width) / 2;
+   if (fbdevsink->cx < 0)
+-- 
+1.8.3.2
+
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 8cee785..f40fe85 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,9 +1,10 @@
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
+SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch \
+            file://0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch"
 
 PACKAGECONFIG = "bzip curl faad"
 
-- 
1.7.0.4


