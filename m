Return-Path: <poojaprajod@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 08E9C5296D
	for <meta-arago@arago-project.org>;
	Tue, 16 May 2017 12:45:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4GCjEdE012768
	for <meta-arago@arago-project.org>; Tue, 16 May 2017 07:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494938714;
	bh=t/eCLzOcHql8yZQze5qTGlvz3f/oTvGI0dYV9DPw5vo=;
	h=From:To:CC:Subject:Date;
	b=sn441PVBS82/DZ8B5ZAABRNtoDgAlvAEYi4ad653GGTMdIiqm5OKGYnza/TldjMz4
	fdQCP/ZmmDTjQHbbqXuUWZpEJ73XhzcFPmkih3ATsdLg5O+fuQyvde42FXCR2LH8eN
	k2NfqGtLjkI7I/kdwU5YPavLpSB+RldueonIF1no=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4GCjEfN015849
	for <meta-arago@arago-project.org>; Tue, 16 May 2017 07:45:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 May 2017 07:45:14 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4GCjCpY006422;
	Tue, 16 May 2017 07:45:13 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 May 2017 18:15:08 +0530
Message-ID: <1494938708-143790-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-arago/morty] gstreamer1.0-plugins-bad: Fix gstwaylandsink scale-up issue for dra7xx
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
X-List-Received-Date: Tue, 16 May 2017 12:45:15 -0000
Content-Type: text/plain

Pick the patch:
1. 0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 ...aylandsink-Fix-scale-up-with-padded-video.patch | 39 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.8.3.bbappend        |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
new file mode 100644
index 0000000..cbedca7
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch
@@ -0,0 +1,39 @@
+From 20fd1ae415683168b2dc5ad707ea422c67429578 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Fri, 12 May 2017 16:12:55 +0530
+Subject: [gst-bad] gstwaylandsink: Fix scale up with padded video
+
+Usecases which expects waylandsink cropping support
+negotiates with padded height and width. After cropping,
+the destination viewport is set with the negotiated
+height and width which results in scaled up output.
+To fix this the args while setting dest viewport should
+be taken as the height and width present in the crop metadata
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ ext/wayland/wlwindow.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
+index f7e3324..decfdf8 100644
+--- a/ext/wayland/wlwindow.c
++++ b/ext/wayland/wlwindow.c
+@@ -278,7 +278,13 @@ gst_wl_window_resize_video_surface (GstWlWindow * window, gboolean commit)
+   gst_video_sink_center_rect (src, dst, &res, TRUE);
+ 
+   wl_subsurface_set_position (window->video_subsurface, res.x, res.y);
+-  wl_viewport_set_destination (window->video_viewport, res.w, res.h);
++
++  if (window->display->crop) {
++    wl_viewport_set_destination (window->area_viewport, window->display->crop->width,  window->display->crop->height);
++    wl_viewport_set_destination (window->video_viewport, window->display->crop->width,  window->display->crop->height);
++  } else {
++    wl_viewport_set_destination (window->video_viewport, res.w, res.h);
++  }
+ 
+   if (commit) {
+     wl_surface_damage (window->video_surface, 0, 0, res.w, res.h);
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
index 97753be..ff61132 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
@@ -44,8 +44,9 @@ SRC_URI_append_omap-a15 = " \
     file://0003-kmssink-add-YUYV-support.patch \
     file://0001-gstwaylandsink-add-input-format-I420-support.patch \
     file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
+    file://0006-gstwaylandsink-Fix-scale-up-with-padded-video.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r4"
+PR = "r5"
-- 
1.9.1


