Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7669D529DF
	for <meta-arago@arago-project.org>;
	Fri, 13 Apr 2018 01:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F9532017D;
	Fri, 13 Apr 2018 01:09:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GviYEX31itNy; Fri, 13 Apr 2018 01:09:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EA40F2098D;
	Fri, 13 Apr 2018 01:09:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 63AB216342E;
	Thu, 12 Apr 2018 21:09:49 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Apr 2018 21:09:48 -0400
Message-Id: <1523581788-42355-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523581788-42355-1-git-send-email-denys@ti.com>
References: <1523581788-42355-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] gstreamer1.0-plugins-*: update to 1.12.4
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
X-List-Received-Date: Fri, 13 Apr 2018 01:09:54 -0000

0004-waylandsink-Add-drm-support-in-waylandsink.patch had to be modified
to apply against the new code base.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...aylandsink-Add-drm-support-in-waylandsink.patch | 74 +++++++++++-----------
 ...nd => gstreamer1.0-plugins-bad_1.12.4.bbappend} |  0
 ...d => gstreamer1.0-plugins-good_1.12.4.bbappend} |  0
 3 files changed, 38 insertions(+), 36 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.2.bbappend => gstreamer1.0-plugins-bad_1.12.4.bbappend} (100%)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.2.bbappend => gstreamer1.0-plugins-good_1.12.4.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
index 2f0eae4..6c7cbca 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-drm-support-in-waylandsink.patch
@@ -1,4 +1,4 @@
-From a26880618a302269542abffc8f4db9ac08e6c2e7 Mon Sep 17 00:00:00 2001
+From 1a496c2256339b7e4baa6cf213557a8ba76a339c Mon Sep 17 00:00:00 2001
 From: Ramprasad N <x0038811@ti.com>
 Date: Mon, 26 Feb 2018 09:50:41 +0530
 Subject: [PATCH 4/5] waylandsink: Add drm support in waylandsink
@@ -15,16 +15,17 @@ Following features are also added
    when propose_allocation is called
 
 Signed-off-by: Ramprasad N <x0038811@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  ext/wayland/Makefile.am      |  11 +++-
- ext/wayland/gstwaylandsink.c |  90 +++++++++++++++++++++++++++++++--
+ ext/wayland/gstwaylandsink.c |  88 ++++++++++++++++++++++++++++++--
  ext/wayland/gstwaylandsink.h |   3 ++
  ext/wayland/wldisplay.c      |  58 +++++++++++++++++++++-
  ext/wayland/wldisplay.h      |   8 +++
  ext/wayland/wldrm.c          | 116 +++++++++++++++++++++++++++++++++++++++++++
  ext/wayland/wldrm.h          |  21 ++++++++
- ext/wayland/wlwindow.c       |  56 +++++++++++++++++++--
- 8 files changed, 351 insertions(+), 12 deletions(-)
+ ext/wayland/wlwindow.c       |  57 +++++++++++++++++++--
+ 8 files changed, 351 insertions(+), 11 deletions(-)
  create mode 100644 ext/wayland/wldrm.c
  create mode 100644 ext/wayland/wldrm.h
 
@@ -80,7 +81,7 @@ index 8442dbd..02fd83a 100644
  	wldisplay.h \
  	wlwindow.h \
 diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
-index 46a710f..4d365f2 100644
+index dc5a064..2abe351 100644
 --- a/ext/wayland/gstwaylandsink.c
 +++ b/ext/wayland/gstwaylandsink.c
 @@ -46,6 +46,7 @@
@@ -173,23 +174,21 @@ index 46a710f..4d365f2 100644
          GST_OBJECT_UNLOCK (sink);
  
          if (error) {
-@@ -460,8 +499,13 @@ gst_wayland_create_pool (GstWaylandSink * sink, GstCaps * caps)
- 
+@@ -462,8 +501,12 @@ gst_wayland_create_pool (GstWaylandSink * sink, GstCaps * caps)
    structure = gst_buffer_pool_get_config (pool);
    gst_buffer_pool_config_set_params (structure, caps, size, 2, 0);
--  gst_buffer_pool_config_set_allocator (structure, gst_wl_shm_allocator_get (),
--      NULL);
-+
+ 
+-  alloc = gst_wl_shm_allocator_get ();
 +  if(sink->display->use_drm)
-+      gst_buffer_pool_config_set_allocator (structure, gst_drm_allocator_get (),
-+	  NULL);
++    alloc = gst_drm_allocator_get ();
 +  else
-+      gst_buffer_pool_config_set_allocator (structure, gst_wl_shm_allocator_get (),
-+	  NULL);
- 
++    alloc = gst_wl_shm_allocator_get ();
+   gst_buffer_pool_config_set_allocator (structure, alloc, NULL);
++
    if (!gst_buffer_pool_set_config (pool, structure)) {
      g_object_unref (pool);
-@@ -471,17 +515,36 @@ gst_wayland_create_pool (GstWaylandSink * sink, GstCaps * caps)
+     pool = NULL;
+@@ -473,17 +516,36 @@ gst_wayland_create_pool (GstWaylandSink * sink, GstCaps * caps)
    return pool;
  }
  
@@ -226,7 +225,7 @@ index 46a710f..4d365f2 100644
    /* extract info from caps */
    if (!gst_video_info_from_caps (&sink->video_info, caps))
      goto invalid_format;
-@@ -489,6 +552,12 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+@@ -491,6 +553,12 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
    format = GST_VIDEO_INFO_FORMAT (&sink->video_info);
    sink->video_info_changed = TRUE;
  
@@ -239,7 +238,7 @@ index 46a710f..4d365f2 100644
    /* create a new pool for the new caps */
    if (sink->pool)
      gst_object_unref (sink->pool);
-@@ -497,6 +566,7 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+@@ -499,6 +567,7 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
    use_dmabuf = gst_caps_features_contains (gst_caps_get_features (caps, 0),
        GST_CAPS_FEATURE_MEMORY_DMABUF);
  
@@ -247,28 +246,29 @@ index 46a710f..4d365f2 100644
    /* validate the format base on the memory type. */
    if (use_dmabuf) {
      if (!gst_wl_display_check_format_for_dmabuf (sink->display, format))
-@@ -531,6 +601,7 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
-   GstBufferPool *pool = NULL;
+@@ -534,6 +603,7 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
    gboolean need_pool;
+   GstAllocator *alloc;
  
 +
    gst_query_parse_allocation (query, &caps, &need_pool);
  
    if (need_pool)
-@@ -540,8 +611,11 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
+@@ -543,8 +613,12 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
      gst_query_add_allocation_pool (query, pool, sink->video_info.size, 2, 0);
      g_object_unref (pool);
    }
+-  alloc = gst_wl_shm_allocator_get ();
 +  if(sink->display->use_drm)
-+     gst_query_add_allocation_param (query, gst_drm_allocator_get (), NULL);
++    alloc = gst_drm_allocator_get ();
 +  else
-+     gst_query_add_allocation_param (query, gst_wl_shm_allocator_get (), NULL);
- 
--  gst_query_add_allocation_param (query, gst_wl_shm_allocator_get (), NULL);
++    alloc = gst_wl_shm_allocator_get ();
+   gst_query_add_allocation_param (query, alloc, NULL);
++
    gst_query_add_allocation_meta (query, GST_VIDEO_META_API_TYPE, NULL);
+   g_object_unref (alloc);
  
-   return TRUE;
-@@ -604,6 +678,9 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+@@ -608,6 +682,9 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
    g_mutex_lock (&sink->render_lock);
  
    GST_LOG_OBJECT (sink, "render buffer %p", buffer);
@@ -278,7 +278,7 @@ index 46a710f..4d365f2 100644
  
    if (G_UNLIKELY (!sink->window)) {
      /* ask for window handle. Unlock render_lock while doing that because
-@@ -668,6 +745,11 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+@@ -672,6 +749,11 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
            &sink->video_info);
    }
  
@@ -603,7 +603,7 @@ index 0000000..c6b4ae1
 +
 +#endif /* __GST_WL_DRM_H__ */
 diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
-index d08ed87..20ef8bb 100644
+index c64c77a..36cb634 100644
 --- a/ext/wayland/wlwindow.c
 +++ b/ext/wayland/wlwindow.c
 @@ -137,6 +137,16 @@ gst_wl_window_new_internal (GstWlDisplay * display, GMutex * render_lock)
@@ -658,16 +658,18 @@ index d08ed87..20ef8bb 100644
    } else {
      gst_video_sink_center_rect (src, dst, &res, FALSE);
    }
-@@ -353,12 +383,20 @@ gst_wl_window_update_borders (GstWlWindow * window)
- 
+@@ -355,13 +385,22 @@ gst_wl_window_update_borders (GstWlWindow * window)
    /* draw the area_subsurface */
    gst_video_info_set_format (&info, format, width, height);
+ 
+-  alloc = gst_wl_shm_allocator_get ();
 -
--  buf = gst_buffer_new_allocate (gst_wl_shm_allocator_get (), info.size, NULL);
 +  if(!window->display->use_drm)
-+      buf = gst_buffer_new_allocate (gst_wl_shm_allocator_get (), info.size, NULL);
++    alloc = gst_wl_shm_allocator_get ();
 +  else
-+      buf = gst_buffer_new_allocate (gst_drm_allocator_get (), info.size, NULL);
++    alloc = gst_drm_allocator_get ();
+   buf = gst_buffer_new_allocate (alloc, info.size, NULL);
++
    gst_buffer_memset (buf, 0, 0, info.size);
 -  wlbuf =
 -      gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
@@ -684,7 +686,7 @@ index d08ed87..20ef8bb 100644
    gwlbuf = gst_buffer_add_wl_buffer (buf, wlbuf, window->display);
    gst_wl_buffer_attach (gwlbuf, window->area_surface);
  
-@@ -371,8 +409,16 @@ void
+@@ -375,8 +414,16 @@ void
  gst_wl_window_set_render_rectangle (GstWlWindow * window, gint x, gint y,
      gint w, gint h)
  {
@@ -702,5 +704,5 @@ index d08ed87..20ef8bb 100644
    window->render_rectangle.y = y;
    window->render_rectangle.w = w;
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bbappend
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bbappend
-- 
2.7.4


