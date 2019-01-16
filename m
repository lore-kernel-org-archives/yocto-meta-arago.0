Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3025852968
	for <meta-arago@arago-project.org>;
	Wed, 16 Jan 2019 20:49:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0GKnWqW056581
	for <meta-arago@arago-project.org>; Wed, 16 Jan 2019 14:49:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1547671772;
	bh=L8tuENnnpwGyyVF6CjiihvegmDrewb9i6tbYyraNaaY=;
	h=From:To:Subject:Date;
	b=Jp1Z3JvanWULkI0CnW4VDwfXc7iJlLEJVIX/7MFNrNs7exdXqxFjwOV51TrDaZDeJ
	pumvxZ7xLBmmyTYPDcqTA1adBJJABWjkYNaufQe28Jrpv/eoHUSfBk8VTUsC+pVorj
	DRcs8rUTlMDeKgeihdZsTdxHhYqcRZ6h41Tm0L9c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0GKnWfG086718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 16 Jan 2019 14:49:32 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 16 Jan 2019 14:49:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 16 Jan 2019 14:49:32 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0GKnVTJ018674
	for <meta-arago@arago-project.org>; Wed, 16 Jan 2019 14:49:31 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Jan 2019 15:49:28 -0500
Message-ID: <1547671768-3782-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] gstreamer1.0-plugins-bad: update patches for AM654x support
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
X-List-Received-Date: Wed, 16 Jan 2019 20:49:46 -0000
Content-Type: text/plain

- add tidss for AM6/7 support
- add missing include files for wyalnadsink DRM support

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-omapdrm-and-tidss-in-the-list-of-driver-.patch | 166 +++++++++++++++++++++
 ...0005-waylandsink-Add-input-device-support.patch |  23 +--
 .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   8 +-
 3 files changed, 183 insertions(+), 14 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch
new file mode 100644
index 0000000..e7d9af4
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch
@@ -0,0 +1,166 @@
+From e7869b0fd95f906742e4e99dd9046ffd460d91bf Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Wed, 16 Jan 2019 14:38:59 -0500
+Subject: [PATCH 3/5] kmssink: Add omapdrm and tidss in the list of driver
+ modules
+
+In gstreamer-bad v1.12.2 kmssink plugin is available but omapdrm
+and tidss driver are not added in the list of driver module.
+
+DRM and DMABUF are treated differently by gstreamer
+eventhough they are based on fd allocator.
+GST1.12 has many changes to dmabuf allocator and
+hence DRM and DMABUF will be treated differently.
+
+Added support for DRM buffer importing. Without
+this addition, there will be frame-copy happens and
+slows down the playback.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ sys/kms/Makefile.am  |   1 +
+ sys/kms/gstkmssink.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 101 insertions(+), 1 deletion(-)
+
+diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am
+index a97cad1..063f5ef 100644
+--- a/sys/kms/Makefile.am
++++ b/sys/kms/Makefile.am
+@@ -23,6 +23,7 @@ libgstkms_la_LIBADD = 			\
+ 	$(GST_ALLOCATORS_LIBS)			\
+ 	$(GST_LIBS) 				\
+ 	$(KMS_DRM_LIBS) 			\
++	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la \
+ 	$(NULL)
+ 
+ libgstkms_la_LDFLAGS = 			\
+diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
+index d19e19e..24551e4 100644
+--- a/sys/kms/gstkmssink.c
++++ b/sys/kms/gstkmssink.c
+@@ -85,7 +85,8 @@ static int
+ kms_open (gchar ** driver)
+ {
+   static const char *drivers[] = { "i915", "radeon", "nouveau", "vmwgfx",
+-    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm"
++    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm",
++    "omapdrm", "tidss"
+   };
+   int i, fd = -1;
+ 
+@@ -1041,6 +1042,100 @@ set_cached_kmsmem (GstMemory * mem, GstMemory * kmsmem)
+ }
+ 
+ static gboolean
++gst_kms_sink_import_drmbuf (GstKMSSink * self, GstBuffer * inbuf,
++    GstBuffer ** outbuf)
++{
++  gint prime_fds[GST_VIDEO_MAX_PLANES] = { 0, };
++  GstVideoMeta *meta;
++  guint i, n_mem, n_planes;
++  GstKMSMemory *kmsmem;
++  guint mems_idx[GST_VIDEO_MAX_PLANES];
++  gsize mems_skip[GST_VIDEO_MAX_PLANES];
++  GstMemory *mems[GST_VIDEO_MAX_PLANES];
++
++  if (!self->has_prime_import)
++    return FALSE;
++
++  /* This will eliminate most non-dmabuf out there */
++  if (!gst_is_drm_memory (gst_buffer_peek_memory (inbuf, 0)))
++    return FALSE;
++
++  n_planes = GST_VIDEO_INFO_N_PLANES (&self->vinfo);
++  n_mem = gst_buffer_n_memory (inbuf);
++  meta = gst_buffer_get_video_meta (inbuf);
++
++  GST_TRACE_OBJECT (self, "Found a drmbuf with %u planes and %u memories",
++      n_planes, n_mem);
++
++  /* We cannot have multiple dmabuf per plane */
++  if (n_mem > n_planes)
++    return FALSE;
++  g_assert (n_planes != 0);
++
++  /* Update video info based on video meta */
++  if (meta) {
++    GST_VIDEO_INFO_WIDTH (&self->vinfo) = meta->width;
++    GST_VIDEO_INFO_HEIGHT (&self->vinfo) = meta->height;
++
++    for (i = 0; i < meta->n_planes; i++) {
++      GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i) = meta->offset[i];
++      GST_VIDEO_INFO_PLANE_STRIDE (&self->vinfo, i) = meta->stride[i];
++    }
++  }
++
++  /* Find and validate all memories */
++  for (i = 0; i < n_planes; i++) {
++    guint length;
++
++    if (!gst_buffer_find_memory (inbuf,
++            GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i), 1,
++            &mems_idx[i], &length, &mems_skip[i]))
++      return FALSE;
++
++    mems[i] = gst_buffer_peek_memory (inbuf, mems_idx[i]);
++
++    /* adjust for memory offset, in case data does not
++     * start from byte 0 in the dmabuf fd */
++    mems_skip[i] += mems[i]->offset;
++
++    /* And all memory found must be dmabuf */
++    if (!gst_is_drm_memory (mems[i]))
++      return FALSE;
++  }
++
++  kmsmem = (GstKMSMemory *) get_cached_kmsmem (mems[0]);
++  if (kmsmem) {
++    GST_LOG_OBJECT (self, "found KMS mem %p in DMABuf mem %p with fb id = %d",
++        kmsmem, mems[0], kmsmem->fb_id);
++    goto wrap_mem;
++  }
++
++  for (i = 0; i < n_planes; i++)
++    prime_fds[i] = gst_fd_memory_get_fd (mems[i]);
++
++  GST_LOG_OBJECT (self, "found these prime ids: %d, %d, %d, %d", prime_fds[0],
++      prime_fds[1], prime_fds[2], prime_fds[3]);
++
++  kmsmem = gst_kms_allocator_dmabuf_import (self->allocator, prime_fds,
++      n_planes, mems_skip, &self->vinfo);
++  if (!kmsmem)
++    return FALSE;
++
++  GST_LOG_OBJECT (self, "setting KMS mem %p to DMABuf mem %p with fb id = %d",
++      kmsmem, mems[0], kmsmem->fb_id);
++  set_cached_kmsmem (mems[0], GST_MEMORY_CAST (kmsmem));
++
++wrap_mem:
++  *outbuf = gst_buffer_new ();
++  if (!*outbuf)
++    return FALSE;
++  gst_buffer_append_memory (*outbuf, gst_memory_ref (GST_MEMORY_CAST (kmsmem)));
++  gst_buffer_add_parent_buffer_meta (*outbuf, inbuf);
++  gst_buffer_copy_into (*outbuf, inbuf, GST_BUFFER_COPY_METADATA, 0, -1);
++
++  return TRUE;
++}
++static gboolean
+ gst_kms_sink_import_dmabuf (GstKMSSink * self, GstBuffer * inbuf,
+     GstBuffer ** outbuf)
+ {
+@@ -1151,6 +1246,10 @@ gst_kms_sink_get_input_buffer (GstKMSSink * self, GstBuffer * inbuf)
+     return gst_buffer_ref (inbuf);
+ 
+   buf = NULL;
++  if (gst_kms_sink_import_drmbuf (self, inbuf, &buf))
++    return buf;
++
++  buf = NULL;
+   if (gst_kms_sink_import_dmabuf (self, inbuf, &buf))
+     return buf;
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch
index 49a2e04..5f82059 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch
@@ -1,6 +1,6 @@
-From ca8350db8bcf3179ebe52f54f27209046f62f8c5 Mon Sep 17 00:00:00 2001
+From df5bc9b78b4a1d6437ce2fab971680fe0a49928a Mon Sep 17 00:00:00 2001
 From: Ramprasad N <x0038811@ti.com>
-Date: Tue, 27 Mar 2018 18:29:45 +0530
+Date: Wed, 16 Jan 2019 14:47:01 -0500
 Subject: [PATCH 5/5] waylandsink: Add input device support
 
 Remove wldispay.h and wlwindow.h to avoid
@@ -13,14 +13,14 @@ Signed-off-by: Ramprasad N <x0038811@ti.com>
  ext/wayland/gstwaylandsink.h              |   3 +-
  ext/wayland/wlbuffer.c                    |   2 +-
  ext/wayland/wlbuffer.h                    |  67 -------
- ext/wayland/wldisplay-wlwindow-wlbuffer.h | 227 +++++++++++++++++++++++
+ ext/wayland/wldisplay-wlwindow-wlbuffer.h | 229 +++++++++++++++++++++++
  ext/wayland/wldisplay.c                   | 294 +++++++++++++++++++++++++++++-
  ext/wayland/wldisplay.h                   | 101 ----------
  ext/wayland/wldrm.c                       |   2 +-
  ext/wayland/wlshmallocator.h              |   2 +-
- ext/wayland/wlwindow.c                    |   5 +-
+ ext/wayland/wlwindow.c                    |   6 +-
  ext/wayland/wlwindow.h                    |  93 ----------
- 12 files changed, 526 insertions(+), 275 deletions(-)
+ 12 files changed, 529 insertions(+), 275 deletions(-)
  delete mode 100644 ext/wayland/wlbuffer.h
  create mode 100644 ext/wayland/wldisplay-wlwindow-wlbuffer.h
  delete mode 100644 ext/wayland/wldisplay.h
@@ -155,10 +155,10 @@ index cbb50f7..0000000
 -#endif /* __GST_WL_BUFFER_H__ */
 diff --git a/ext/wayland/wldisplay-wlwindow-wlbuffer.h b/ext/wayland/wldisplay-wlwindow-wlbuffer.h
 new file mode 100644
-index 0000000..c5d8ae5
+index 0000000..a89d0c0
 --- /dev/null
 +++ b/ext/wayland/wldisplay-wlwindow-wlbuffer.h
-@@ -0,0 +1,227 @@
+@@ -0,0 +1,229 @@
 +/* GStreamer Wayland video sink
 + *
 + * Copyright (C) 2014 Collabora Ltd.
@@ -186,6 +186,8 @@ index 0000000..c5d8ae5
 +#include <stdlib.h>
 +#include <stdio.h>
 +#include <gst/video/video.h>
++#include <gst/gstbuffer.h>
++#include <gst/drm/gstdrmallocator.h>
 +#include <wayland-client.h>
 +#include "viewporter-client-protocol.h"
 +#include "linux-dmabuf-unstable-v1-client-protocol.h"
@@ -863,10 +865,10 @@ index 07ae17f..2860fc3 100644
  G_BEGIN_DECLS
  
 diff --git a/ext/wayland/wlwindow.c b/ext/wayland/wlwindow.c
-index 20ef8bb..116dc55 100644
+index 20ef8bb..125cc85 100644
 --- a/ext/wayland/wlwindow.c
 +++ b/ext/wayland/wlwindow.c
-@@ -24,9 +24,8 @@
+@@ -24,9 +24,9 @@
  #include <config.h>
  #endif
  
@@ -874,10 +876,11 @@ index 20ef8bb..116dc55 100644
 +#include "wldisplay-wlwindow-wlbuffer.h"
  #include "wlshmallocator.h"
 -#include "wlbuffer.h"
++#include "wldrm.h"
  
  GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
  #define GST_CAT_DEFAULT gstwayland_debug
-@@ -120,6 +119,8 @@ gst_wl_window_new_internal (GstWlDisplay * display, GMutex * render_lock)
+@@ -120,6 +120,8 @@ gst_wl_window_new_internal (GstWlDisplay * display, GMutex * render_lock)
  
    window->area_surface = wl_compositor_create_surface (display->compositor);
    window->video_surface = wl_compositor_create_surface (display->compositor);
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
index 0c9263d..fcdb58c 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
@@ -28,7 +28,7 @@ DEPENDS_append_k3 = " \
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
+    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch  \
 "
@@ -40,7 +40,7 @@ SRC_URI_append_ti33x = " \
 SRC_URI_append_omap-a15 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
+    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch  \
 "
@@ -48,11 +48,11 @@ SRC_URI_append_omap-a15 = " \
 SRC_URI_append_k3 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
-    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
+    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch  \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r6"
+PR = "r7"
-- 
1.9.1


