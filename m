Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 5CCDE52A00
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 20:56:56 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2031827obb.38
	for <meta-arago@arago-project.org>;
	Fri, 05 Oct 2012 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4nFfI16Arp67gDpT1l2tUi571XVQB2gkIyLMN/Kw53I=;
	b=hzF6GRT1aM1KAeMrDzpfar36+AjVS7IgWzshIl7I7OuqcQt84JP8z/y9xGv3ZdMCgr
	SShaYhMymzCiRvmnd/A1UbJJ27cXEEeVui9lH2SkHsK+sHedTxZdyQShafnOgkMGHoXp
	EHVFAW4ApY4d95W94vxlPDWJHA4CC7ogisQa6sdUVSO7CRNij2fycFIlBysH2omSAFxo
	ljHeHIP33LViDVamiPcMjPHnxcwVCcDM2Za26xRUnAiYDR1TX5+G/FmTrmkb3U5Iltt+
	6Y6hA1pdW8ekAtzgqPSWZSvLbED/f65+rzTs0teU62jYcFlzv2TbKQs7XSpaWOTaD5oc
	eqog==
Received: by 10.60.27.6 with SMTP id p6mr7902081oeg.37.1349470615366;
	Fri, 05 Oct 2012 13:56:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id h2sm10400939obn.11.2012.10.05.13.56.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 13:56:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 16:25:28 -0500
Message-Id: <1349472329-1054-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/2 v2] gst-plugins-bad: Add patch to fix depth value in gstfbdevsink
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
X-List-Received-Date: Fri, 05 Oct 2012 20:56:56 -0000

* Port patch from Arago.
* Gstreamer plugin adds the length of alpha data for 16bit RGB data format
  which could yield wrong results.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Split the adding of the faad2 and libfaad into a seperate patch.

 ...k-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch |   29 ++++++++++++++++++++
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    7 ++++-
 2 files changed, 35 insertions(+), 1 deletions(-)
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
index 52739e4..0c7035b 100644
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
@@ -6,3 +9,5 @@ EXTRA_OECONF += "--disable-rsvg"
 
 # Build all the various plugins
 EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
+
+SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
-- 
1.7.0.4


