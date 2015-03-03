Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0E73252A62
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 15:59:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23FxZA7016088
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 09:59:35 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FxYgY021642
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 09:59:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Mar 2015 09:59:34 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FxUoJ010022;
	Tue, 3 Mar 2015 09:59:33 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Mar 2015 21:29:23 +0530
Message-ID: <1425398366-6614-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425398366-6614-1-git-send-email-a0393906@ti.com>
References: <1425398366-6614-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [meta-arago 2/4] gstreamer1.0-plugins-good: Add DMABuf support v4l2src
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
X-List-Received-Date: Tue, 03 Mar 2015 15:59:36 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |  298 ++++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    8 +
 2 files changed, 306 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
new file mode 100644
index 0000000..3913208
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
@@ -0,0 +1,298 @@
+From 25936e8f703ebe99c00e083cec317231b17d503b Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Thu, 29 Jan 2015 21:10:49 +0530
+Subject: [PATCH 1/2] Adds GST_V4L2_IO_DMABUF mode support in capture
+
+Enables v4l2src to accept pool from peer and allocate buffers from
+them in GST_V4L2_IO_DMABUF mode.
+---
+ sys/v4l2/Makefile.am         |    1 +
+ sys/v4l2/gstv4l2bufferpool.c |   93 +++++++++++++++++++++++++++++++++++-------
+ sys/v4l2/gstv4l2object.h     |    1 +
+ sys/v4l2/gstv4l2src.c        |   13 ++++--
+ 4 files changed, 90 insertions(+), 18 deletions(-)
+
+diff --git a/sys/v4l2/Makefile.am b/sys/v4l2/Makefile.am
+index da138ae..6ff4e18 100644
+--- a/sys/v4l2/Makefile.am
++++ b/sys/v4l2/Makefile.am
+@@ -37,6 +37,7 @@ libgstvideo4linux2_la_LIBTOOLFLAGS = $(GST_PLUGIN_LIBTOOLFLAGS)
+ libgstvideo4linux2_la_LIBADD =   $(GST_PLUGINS_BASE_LIBS) \
+ 				 -lgstallocators-$(GST_API_VERSION) \
+ 				 -lgstvideo-$(GST_API_VERSION) \
++				 -lgstdmabuf-$(GST_API_VERSION) \
+ 				 $(GST_BASE_LIBS) \
+ 				 $(GST_LIBS) \
+ 				 $(xv_libs) \
+diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
+index 463dd44..5a108eb 100644
+--- a/sys/v4l2/gstv4l2bufferpool.c
++++ b/sys/v4l2/gstv4l2bufferpool.c
+@@ -41,6 +41,7 @@
+ #include "gst/video/gstvideometa.h"
+ #include "gst/video/gstvideopool.h"
+ #include "gst/allocators/gstdmabuf.h"
++#include <gst/dmabuf/dmabuf.h>
+ 
+ #include <gstv4l2bufferpool.h>
+ 
+@@ -112,7 +113,16 @@ gst_v4l2_buffer_pool_free_buffer (GstBufferPool * bpool, GstBuffer * buffer)
+   switch (obj->mode) {
+     case GST_V4L2_IO_RW:
+     case GST_V4L2_IO_DMABUF:
++    {
++      GstV4l2Meta *meta;
++      gint index;
++
++      meta = GST_V4L2_META_GET (buffer);
++      g_assert (meta != NULL);
++      index = meta->vbuffer.index;
++      pool->buffers[index] = NULL;
+       break;
++    }
+     case GST_V4L2_IO_MMAP:
+     {
+       GstV4l2Meta *meta;
+@@ -147,6 +157,7 @@ gst_v4l2_buffer_pool_alloc_buffer (GstBufferPool * bpool, GstBuffer ** buffer,
+   GstV4l2Meta *meta;
+   GstV4l2Object *obj;
+   GstVideoInfo *info;
++  GstMetaDmaBuf *dmabuf;
+   guint index;
+ 
+   obj = pool->obj;
+@@ -168,7 +179,12 @@ gst_v4l2_buffer_pool_alloc_buffer (GstBufferPool * bpool, GstBuffer ** buffer,
+ 
+         memset (&create_bufs, 0, sizeof (struct v4l2_create_buffers));
+         create_bufs.count = 1;
+-        create_bufs.memory = V4L2_MEMORY_MMAP;
++        if (obj->mode == GST_V4L2_IO_MMAP)
++          create_bufs.memory = V4L2_MEMORY_MMAP;
++
++        if (obj->mode == GST_V4L2_IO_DMABUF)
++          create_bufs.memory = V4L2_MEMORY_DMABUF;
++
+         create_bufs.format.type = obj->type;
+ 
+         if (v4l2_ioctl (pool->video_fd, VIDIOC_G_FMT, &create_bufs.format) < 0)
+@@ -184,7 +200,24 @@ gst_v4l2_buffer_pool_alloc_buffer (GstBufferPool * bpool, GstBuffer ** buffer,
+         pool->buffers[pool->num_buffers - 1] = NULL;
+       }
+ #endif
+-      newbuf = gst_buffer_new ();
++      if (obj->externalpool && obj->mode==GST_V4L2_IO_DMABUF) {
++         GstFlowReturn ret = gst_buffer_pool_acquire_buffer (GST_BUFFER_POOL (obj->externalpool), &newbuf,
++           NULL);
++         if (ret != GST_FLOW_OK)
++           goto external_acquire_failed;
++         dmabuf = gst_buffer_get_dma_buf_meta (newbuf);
++
++        /* if it isn't a dmabuf buffer that we can import, then there
++         * is nothing we can do with it:
++         */
++         if (!dmabuf) {
++             GST_DEBUG_OBJECT (pool, "not importing non dmabuf buffer");
++             return GST_FLOW_ERROR;
++          }
++
++      } else {
++        newbuf = gst_buffer_new ();
++      }
+       meta = GST_V4L2_META_ADD (newbuf);
+ 
+       index = pool->num_allocated;
+@@ -194,8 +227,12 @@ gst_v4l2_buffer_pool_alloc_buffer (GstBufferPool * bpool, GstBuffer ** buffer,
+       memset (&meta->vbuffer, 0x0, sizeof (struct v4l2_buffer));
+       meta->vbuffer.index = index;
+       meta->vbuffer.type = obj->type;
+-      meta->vbuffer.memory = V4L2_MEMORY_MMAP;
+-
++      if (obj->mode == GST_V4L2_IO_MMAP)
++         meta->vbuffer.memory = V4L2_MEMORY_MMAP;
++      if (obj->mode == GST_V4L2_IO_DMABUF) {
++         meta->vbuffer.memory = V4L2_MEMORY_DMABUF;
++         meta->vbuffer.m.fd = gst_dma_buf_meta_get_fd (dmabuf);
++      }
+       if (v4l2_ioctl (pool->video_fd, VIDIOC_QUERYBUF, &meta->vbuffer) < 0)
+         goto querybuf_failed;
+ 
+@@ -220,6 +257,11 @@ gst_v4l2_buffer_pool_alloc_buffer (GstBufferPool * bpool, GstBuffer ** buffer,
+                 meta->mem, meta->vbuffer.length, 0, meta->vbuffer.length, NULL,
+                 NULL));
+       }
++     if (obj->externalpool && obj->mode==GST_V4L2_IO_DMABUF) {
++        meta->vbuffer.memory = V4L2_MEMORY_DMABUF;
++        meta->vbuffer.m.fd = gst_dma_buf_meta_get_fd (dmabuf);
++        goto skipped_native_dmabuf;
++     }
+ #if HAVE_DECL_V4L2_MEMORY_DMABUF
+       if (obj->mode == GST_V4L2_IO_DMABUF) {
+         struct v4l2_exportbuffer expbuf;
+@@ -237,6 +279,8 @@ gst_v4l2_buffer_pool_alloc_buffer (GstBufferPool * bpool, GstBuffer ** buffer,
+                 meta->vbuffer.length));
+       }
+ #endif
++
++skipped_native_dmabuf:
+       /* add metadata to raw video buffers */
+       if (pool->add_videometa && info->finfo) {
+         const GstVideoFormatInfo *finfo = info->finfo;
+@@ -328,6 +372,11 @@ mmap_failed:
+     errno = errnosave;
+     return GST_FLOW_ERROR;
+   }
++external_acquire_failed:
++  {
++    GST_WARNING ("External pool acquire failed ");
++    return GST_FLOW_ERROR;
++  }
+ #if HAVE_DECL_V4L2_MEMORY_DMABUF
+ expbuf_failed:
+   {
+@@ -407,7 +456,11 @@ gst_v4l2_buffer_pool_set_config (GstBufferPool * bpool, GstStructure * config)
+       memset (&breq, 0, sizeof (struct v4l2_requestbuffers));
+       breq.type = obj->type;
+       breq.count = num_buffers;
+-      breq.memory = V4L2_MEMORY_MMAP;
++      if (obj->mode == GST_V4L2_IO_MMAP)
++         breq.memory = V4L2_MEMORY_MMAP;
++
++      if (obj->mode == GST_V4L2_IO_DMABUF)
++         breq.memory = V4L2_MEMORY_DMABUF;
+ 
+       if (v4l2_ioctl (pool->video_fd, VIDIOC_REQBUFS, &breq) < 0)
+         goto reqbufs_failed;
+@@ -566,7 +619,11 @@ gst_v4l2_buffer_pool_free_buffers (GstV4l2BufferPool * pool)
+     memset (&breq, 0, sizeof (struct v4l2_requestbuffers));
+     breq.type = pool->obj->type;
+     breq.count = 0;
+-    breq.memory = V4L2_MEMORY_MMAP;
++    if (pool->obj->mode == GST_V4L2_IO_MMAP)
++      breq.memory = V4L2_MEMORY_MMAP;
++
++    if (pool->obj->mode == GST_V4L2_IO_DMABUF)
++      breq.memory = V4L2_MEMORY_DMABUF;
+     if (v4l2_ioctl (pool->video_fd, VIDIOC_REQBUFS, &breq) < 0) {
+       GST_ERROR_OBJECT (pool, "error releasing buffers: %s",
+           g_strerror (errno));
+@@ -732,12 +789,12 @@ gst_v4l2_buffer_pool_dqbuf (GstV4l2BufferPool * pool, GstBuffer ** buffer)
+ 
+   memset (&vbuffer, 0x00, sizeof (vbuffer));
+   vbuffer.type = obj->type;
+-#if HAVE_DECL_V4L2_MEMORY_DMABUF
++
++  if (obj->mode == GST_V4L2_IO_MMAP)
++    vbuffer.memory = V4L2_MEMORY_MMAP;
++
+   if (obj->mode == GST_V4L2_IO_DMABUF)
+     vbuffer.memory = V4L2_MEMORY_DMABUF;
+-  else
+-#endif
+-    vbuffer.memory = V4L2_MEMORY_MMAP;
+ 
+   GST_LOG_OBJECT (pool, "doing DQBUF");
+   if (v4l2_ioctl (pool->video_fd, VIDIOC_DQBUF, &vbuffer) < 0)
+@@ -779,10 +836,14 @@ gst_v4l2_buffer_pool_dqbuf (GstV4l2BufferPool * pool, GstBuffer ** buffer)
+    * no share, so if it's not there, it's not used at all.
+    */
+   if (obj->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+-    gst_buffer_remove_all_memory (outbuf);
+-    gst_buffer_append_memory (outbuf,
+-        gst_memory_new_wrapped (GST_MEMORY_FLAG_NO_SHARE,
+-            meta->mem, vbuffer.length, 0, vbuffer.bytesused, NULL, NULL));
++    if (obj->mode == GST_V4L2_IO_DMABUF) {
++      GST_LOG_OBJECT (pool, " Assuming size doesn't change");
++    } else {
++      gst_buffer_remove_all_memory (outbuf);
++      gst_buffer_append_memory (outbuf,
++          gst_memory_new_wrapped (GST_MEMORY_FLAG_NO_SHARE,
++              meta->mem, vbuffer.length, 0, vbuffer.bytesused, NULL, NULL));
++    }
+   }
+ 
+   GST_BUFFER_TIMESTAMP (outbuf) = timestamp;
+@@ -1207,6 +1268,10 @@ gst_v4l2_buffer_pool_process (GstV4l2BufferPool * pool, GstBuffer * buf)
+           /* capture into the buffer */
+           ret = gst_v4l2_do_read (pool, buf);
+           break;
++        case GST_V4L2_IO_DMABUF:
++            /* nothing, data was inside the buffer when we did _acquire() */
++          if (buf->pool == obj->externalpool)
++            goto done;
+ 
+         case GST_V4L2_IO_MMAP:
+         {
+diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
+index fbfff92..645e016 100644
+--- a/sys/v4l2/gstv4l2object.h
++++ b/sys/v4l2/gstv4l2object.h
+@@ -127,6 +127,7 @@ struct _GstV4l2Object {
+ 
+   /* optional pool */
+   GstBufferPool *pool;
++  GstBufferPool *externalpool;
+ 
+   /* the video device's capabilities */
+   struct v4l2_capability vcap;
+diff --git a/sys/v4l2/gstv4l2src.c b/sys/v4l2/gstv4l2src.c
+index 8e1b754..7a19e5f 100644
+--- a/sys/v4l2/gstv4l2src.c
++++ b/sys/v4l2/gstv4l2src.c
+@@ -467,6 +467,7 @@ gst_v4l2src_decide_allocation (GstBaseSrc * bsrc, GstQuery * query)
+   GstV4l2Src *src;
+   GstV4l2Object *obj;
+   GstBufferPool *pool;
++  GstBufferPool *externalpool;
+   guint size, min, max;
+   gboolean update;
+ 
+@@ -474,17 +475,17 @@ gst_v4l2src_decide_allocation (GstBaseSrc * bsrc, GstQuery * query)
+   obj = src->v4l2object;
+ 
+   if (gst_query_get_n_allocation_pools (query) > 0) {
+-    gst_query_parse_nth_allocation_pool (query, 0, &pool, &size, &min, &max);
++    gst_query_parse_nth_allocation_pool (query, 0, &externalpool, &size, &min, &max);
+     update = TRUE;
+   } else {
+-    pool = NULL;
++    externalpool = NULL;
+     min = max = 0;
+     size = 0;
+     update = FALSE;
+   }
+ 
+   GST_DEBUG_OBJECT (src, "allocation: size:%u min:%u max:%u pool:%"
+-      GST_PTR_FORMAT, size, min, max, pool);
++      GST_PTR_FORMAT, size, min, max, externalpool);
+ 
+   if (min != 0) {
+     /* if there is a min-buffers suggestion, use it. We add 1 because we need 1
+@@ -497,7 +498,7 @@ gst_v4l2src_decide_allocation (GstBaseSrc * bsrc, GstQuery * query)
+   /* select a pool */
+   switch (obj->mode) {
+     case GST_V4L2_IO_RW:
+-      if (pool == NULL) {
++      if (externalpool == NULL) {
+         /* no downstream pool, use our own then */
+         GST_DEBUG_OBJECT (src,
+             "read/write mode: no downstream pool, using our own");
+@@ -510,12 +511,16 @@ gst_v4l2src_decide_allocation (GstBaseSrc * bsrc, GstQuery * query)
+         /* use the bigest size, when we use our own pool we can't really do any
+          * other size than what the hardware gives us but for downstream pools
+          * we can try */
++        pool = externalpool;
+         size = MAX (size, obj->sizeimage);
+       }
+       break;
+     case GST_V4L2_IO_MMAP:
+     case GST_V4L2_IO_USERPTR:
+     case GST_V4L2_IO_DMABUF:
++      if (externalpool) {
++           obj->externalpool =  GST_BUFFER_POOL_CAST (externalpool);
++      }
+       /* in streaming mode, prefer our own pool */
+       pool = GST_BUFFER_POOL_CAST (obj->pool);
+       size = obj->sizeimage;
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
new file mode 100644
index 0000000..1d6ceb4
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " \
+        file://0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch"
+
+PR = "r2"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-- 
1.7.9.5


