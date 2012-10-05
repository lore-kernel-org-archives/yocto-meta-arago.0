Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id ADB2A529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:28:34 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1324691oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iAoIir2z0xWjrJVbsrjZK9j9AwafjHuI9pqtrpFVorc=;
	b=KBnXtUuLogTRdAinR9eM99ylZV6W+7C3/mfbGBhNNzx6LPggU3HJ8z7RTCTEC/UCKl
	/666fK+4Nw+nw7nPqAXuN1haXXCaiN4fwgMtO0BqdNJ953IVJptvJiFONkd9zcgKq5Mn
	1pbr+0oN+hLdIb1jtRVVB7PV9G+aaDI2iWE9Rnz/og4HDdt9h6ncKGndcuVoFJa6XMzR
	iyVlKYmWHLX1KLh+e2Uybyk1F5peF8HmSHC96XCI84tg/6/MGi6b1+dBM8ektBYSPTna
	lrC9lgWFzRh6M+ZIA6yDBbxIiyWDeZmnVWaig/4h1Y1EA/Aayn46fMgMhl5PJVQdlsg5
	hC2A==
Received: by 10.182.69.73 with SMTP id c9mr6292515obu.33.1349418514074;
	Thu, 04 Oct 2012 23:28:34 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id bp7sm8732140obc.12.2012.10.04.23.28.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:28:33 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:56:55 -0500
Message-Id: <1349420215-22226-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gst-plugins-bad: Add patch to fix depth value in gstfbdevsink
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
X-List-Received-Date: Fri, 05 Oct 2012 06:28:34 -0000

* Port patch from Arago.
* Gstreamer plugin adds the length of alpha data for 16bit RGB data format
  which could yield wrong results.
* Add faad2 as a dependency and libfaad as a runtime dependency. This insures
  gst-plugins-bad-faad package is created. The gstreamer faad element is needed
  for the AAC related gstreamer demos.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...k-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch |   29 ++++++++++++++++++++
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   10 ++++++-
 2 files changed, 38 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch
new file mode 100644
index 0000000..5905591
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch
@@ -0,0 +1,29 @@
+From ec785d544f417aa2d88f8803e4392ff02ab424ae Mon Sep 17 00:00:00 2001
+From: Punya Prakash <pprakash@ti.com>
+Date: Fri, 4 Nov 2011 13:03:57 -0500
+Subject: [PATCH]  gstfbdevsink: Fix depth value for GST_VIDEO_CAPS_RGB_15
+
+RGB color format does not have any alpha components, adding alpha length to depth could yield wrong results.
+
+Upstream-Status: Pending
+
+Signed-off-by: Punya Prakash <pprakash@ti.com>
+---
+ sys/fbdev/gstfbdevsink.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/sys/fbdev/gstfbdevsink.c b/sys/fbdev/gstfbdevsink.c
+index 8925f3d..568f091 100644
+--- a/sys/fbdev/gstfbdevsink.c
++++ b/sys/fbdev/gstfbdevsink.c
+@@ -185,8 +185,7 @@ gst_fbdevsink_getcaps (GstBaseSink * bsink)
+       "bpp", G_TYPE_INT, fbdevsink->varinfo.bits_per_pixel,
+       "depth", G_TYPE_INT, fbdevsink->varinfo.red.length +
+       fbdevsink->varinfo.green.length +
+-      fbdevsink->varinfo.blue.length +
+-      fbdevsink->varinfo.transp.length,
++      fbdevsink->varinfo.blue.length,
+       "endianness", G_TYPE_INT, endianness,
+       "red_mask", G_TYPE_INT, rmask,
+       "green_mask", G_TYPE_INT, gmask, "blue_mask", G_TYPE_INT, bmask, NULL);
+-- 
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 52739e4..d6c8ef5 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,4 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 # Disable rsvg which caused gtk+ to be pulled in
 DEPENDS := "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
@@ -6,3 +9,8 @@ EXTRA_OECONF += "--disable-rsvg"
 
 # Build all the various plugins
 EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
+
+SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
+
+DEPENDS += "faad2"
+RDEPENDS += "libfaad"
-- 
1.7.0.4


