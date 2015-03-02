Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6574A529A9
	for <meta-arago@arago-project.org>;
	Mon,  2 Mar 2015 10:53:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t22ArlQH020960
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2015 04:53:47 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t22ArkXK012387
	for <meta-arago@arago-project.org>; Mon, 2 Mar 2015 04:53:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 Mar 2015 04:53:46 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t22ArVrf022266;
	Mon, 2 Mar 2015 04:53:45 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Mar 2015 16:23:27 +0530
Message-ID: <1425293607-5918-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425293607-5918-1-git-send-email-a0393906@ti.com>
References: <1425293607-5918-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Mar 2015 00:46:54 +0000
Subject: [meta-arago 3/3] gstreamer1.0-plugins-bad: Add various features
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
X-List-Received-Date: Mon, 02 Mar 2015 10:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following feature will be enabled by this patch
 * Add GST DRM Buffer Pool suppport.
 * Add support for waylandsink to accept NV12 buffers.
   This is required for interworking with TI specific GST plugins
   for hardware acclerated encode/decode
 * Add support for KMS Sink.
   This is required for customers who will need native rendering
   support without the use of wayland (wayland-sink)
 * Fix incorrect dependency on dri2 for the wayland sink.
 * Increase the rank for vc1parse and jpegparse.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../0001-Added-GstDRMBufferPool-support.patch      |  774 +++++++++++
 ...odified-waylandsink-to-accept-NV12-format.patch | 1017 ++++++++++++++
 .../0003-Added-KMSsink-support.patch               | 1457 ++++++++++++++++++++
 ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 +
 ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 +
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   12 +
 6 files changed, 3340 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
new file mode 100644
index 0000000..c7015b2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
@@ -0,0 +1,774 @@
+From 1df02c3320d74c0f36e0ea7021b033da5d4d891e Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Thu, 11 Dec 2014 15:42:39 +0530
+Subject: [PATCH] Added GstDRMBufferPool support
+
+GstDRMBufferPool enabled creation of a bufferpool with extended features.
+The pool stores the element that created it, device for drm allocation,
+height, width and size of buffers.
+All the buffers allocated are through drm. The buffers have dmabuf, crop
+and video metadata set.
+---
+ configure.ac                                      |    6 +
+ gst-libs/gst/Makefile.am                          |    2 +-
+ gst-libs/gst/drm/Makefile.am                      |   36 ++
+ gst-libs/gst/drm/gstdrmbufferpool.c               |  434 +++++++++++++++++++++
+ gst-libs/gst/drm/gstdrmbufferpool.h               |  138 +++++++
+ pkgconfig/Makefile.am                             |    3 +
+ pkgconfig/gstreamer-drm-uninstalled.pc.in         |   12 +
+ pkgconfig/gstreamer-drm.pc.in                     |   12 +
+ pkgconfig/gstreamer-plugins-bad-uninstalled.pc.in |    2 +-
+ 9 files changed, 643 insertions(+), 2 deletions(-)
+ create mode 100644 gst-libs/gst/drm/Makefile.am
+ create mode 100644 gst-libs/gst/drm/gstdrmbufferpool.c
+ create mode 100644 gst-libs/gst/drm/gstdrmbufferpool.h
+ create mode 100644 pkgconfig/gstreamer-drm-uninstalled.pc.in
+ create mode 100644 pkgconfig/gstreamer-drm.pc.in
+
+diff --git a/configure.ac b/configure.ac
+index 8f1a4cb..edf8ea8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -457,6 +457,9 @@ AC_ARG_WITH([egl-window-system],
+               [EGL_WINDOW_SYSTEM="$withval"],
+               [EGL_WINDOW_SYSTEM="auto"])
+ 
++dnl *** gst-libs/gst/egl ***
++PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=yes, HAVE_KMS=no)
++
+ if test x"$EGL_WINDOW_SYSTEM" = x"auto"; then
+   dnl Mali
+   old_LIBS=$LIBS
+@@ -2404,6 +2407,7 @@ gst/yadif/Makefile
+ gst-libs/Makefile
+ gst-libs/gst/Makefile
+ gst-libs/gst/basecamerabinsrc/Makefile
++gst-libs/gst/drm/Makefile
+ gst-libs/gst/egl/Makefile
+ gst-libs/gst/insertbin/Makefile
+ gst-libs/gst/interfaces/Makefile
+@@ -2523,6 +2527,8 @@ pkgconfig/gstreamer-plugins-bad.pc
+ pkgconfig/gstreamer-plugins-bad-uninstalled.pc
+ pkgconfig/gstreamer-codecparsers.pc
+ pkgconfig/gstreamer-codecparsers-uninstalled.pc
++pkgconfig/gstreamer-drm.pc
++pkgconfig/gstreamer-drm-uninstalled.pc
+ pkgconfig/gstreamer-insertbin.pc
+ pkgconfig/gstreamer-insertbin-uninstalled.pc
+ pkgconfig/gstreamer-egl.pc
+diff --git a/gst-libs/gst/Makefile.am b/gst-libs/gst/Makefile.am
+index 1d6cc35..b915d07 100644
+--- a/gst-libs/gst/Makefile.am
++++ b/gst-libs/gst/Makefile.am
+@@ -2,7 +2,7 @@ if HAVE_EGL
+ EGL_DIR = egl
+ endif
+ 
+-SUBDIRS = interfaces basecamerabinsrc codecparsers \
++SUBDIRS = interfaces basecamerabinsrc codecparsers drm \
+ 	 insertbin uridownloader mpegts $(EGL_DIR)
+ 
+ noinst_HEADERS = gst-i18n-plugin.h gettext.h glib-compat-private.h
+diff --git a/gst-libs/gst/drm/Makefile.am b/gst-libs/gst/drm/Makefile.am
+new file mode 100644
+index 0000000..4808009
+--- /dev/null
++++ b/gst-libs/gst/drm/Makefile.am
+@@ -0,0 +1,36 @@
++
++lib_LTLIBRARIES = libgstdrm-@GST_API_VERSION@.la
++
++CLEANFILES = $(BUILT_SOURCES)
++
++libgstdrm_@GST_API_VERSION@_la_SOURCES = \
++	gstdrmbufferpool.c
++
++libgstdrm_@GST_API_VERSION@includedir = \
++	$(includedir)/gstreamer-@GST_API_VERSION@/gst/drm
++
++libgstdrm_@GST_API_VERSION@include_HEADERS = \
++	gstdrmbufferpool.h
++
++libgstdrm_@GST_API_VERSION@_la_CFLAGS = \
++	$(DRM_CFLAGS) \
++	$(OMAPDRM_CFLAGS) \
++	$(GST_PLUGINS_BAD_CFLAGS) \
++	$(GST_PLUGINS_BASE_CFLAGS) \
++	-DGST_USE_UNSTABLE_API \
++	$(GST_CFLAGS)
++
++libgstdrm_@GST_API_VERSION@_la_LIBADD = \
++	$(DRM_LIBS) \
++	-lgstdmabuf-@GST_API_VERSION@ \
++	$(GST_PLUGINS_BASE_LIBS) \
++	$(GST_BASE_LIBS) \
++	$(GST_LIBS) \
++	-lgstdmabuf-@GST_API_VERSION@
++
++libgstdrm_@GST_API_VERSION@_la_LDFLAGS = \
++	$(DRM_LDFLAGS) \
++	$(GST_LIB_LDFLAGS) \
++	$(GST_ALL_LDFLAGS) \
++	$(GST_LT_LDFLAGS)
++
+diff --git a/gst-libs/gst/drm/gstdrmbufferpool.c b/gst-libs/gst/drm/gstdrmbufferpool.c
+new file mode 100644
+index 0000000..6ac8044
+--- /dev/null
++++ b/gst-libs/gst/drm/gstdrmbufferpool.c
+@@ -0,0 +1,434 @@
++/*
++ * GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *  Rob Clark <rob.clark@linaro.org>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++/**
++ * SECTION:GstDRMBufferPool
++ * @short_description: GStreamer DRM buffer pool support
++ *
++ * Since: 1.2.?
++ */
++
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <string.h>
++
++#include <gst/dmabuf/dmabuf.h>
++
++#include "gstdrmbufferpool.h"
++
++GST_DEBUG_CATEGORY (drmbufferpool_debug);
++#define GST_CAT_DEFAULT drmbufferpool_debug
++
++static GstFlowReturn gst_drm_alloc_new_buffer (GstBufferPool * pool, GstBuffer ** buffer,
++    GstBufferPoolAcquireParams * params);
++
++
++#define gst_drm_buffer_pool_parent_class parent_class
++G_DEFINE_TYPE (GstDRMBufferPool, gst_drm_buffer_pool, GST_TYPE_BUFFER_POOL);
++
++
++/**
++ * gst_drm_buffer_pool_set_config:
++ * @pool: a #GstBufferPool
++ * @config: a #GstStructure
++ *
++ * Parses the @config to retrieve the caps that is set by gst_buffer_pool_config_set_params().
++ * This caps is then parsed to retrieve the video info. This function can be called to
++ * change the caps of the buffer pool. 
++ * 
++ * Returns: the boolean value, TRUE for success and FALSE in case of an errors
++ *
++ * Since: 1.2.?
++ */
++
++gboolean
++gst_drm_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
++{
++  GstDRMBufferPool *drmpool = GST_DRM_BUFFER_POOL (pool);
++  GstCaps *caps;
++
++  /* get the caps param already set in the config */
++  if (!gst_buffer_pool_config_get_params (config, &caps, NULL, NULL, NULL))
++    goto wrong_config;
++
++  if (caps == NULL)
++    goto no_caps;
++
++  /* now parse the caps from the config to get the video info */
++  if (!gst_video_info_from_caps (&drmpool->info, caps))
++    goto wrong_caps;
++
++  GST_LOG_OBJECT (pool, "%dx%d, caps %" GST_PTR_FORMAT, drmpool->info.width, drmpool->info.height,
++      caps);
++
++  /* Set caps related variables of the pool */
++  drmpool->caps = gst_caps_ref (caps);
++  drmpool->width = drmpool->info.width;
++  drmpool->height = drmpool->info.height;
++
++  return GST_BUFFER_POOL_CLASS (parent_class)->set_config (pool, config);
++
++  /* ERRORS */
++wrong_config:
++  {
++    GST_WARNING_OBJECT (pool, "invalid config");
++    return FALSE;
++  }
++no_caps:
++  {
++    GST_WARNING_OBJECT (pool, "no caps in config");
++    return FALSE;
++  }
++wrong_caps:
++  {
++    GST_WARNING_OBJECT (pool,
++        "failed getting geometry from caps %" GST_PTR_FORMAT, caps);
++    return FALSE;
++  }
++}
++
++
++/**
++ * gst_drm_buffer_pool_initialize:
++ * @pool: a #GstBufferPool
++ * @element: a #GstElement
++ * @fd: a file descriptor
++ * @caps: a #GstCaps
++ * @size: the padded size of buffers
++ *
++ * Initializes the device related info. Sets the params for buffer pool config.
++ * Sets the config of the pool by calling gst_buffer_pool_set_config(). 
++ * 
++ *
++ * Since: 1.2.?
++ */
++
++
++void
++gst_drm_buffer_pool_initialize (GstDRMBufferPool * self,
++    GstElement * element, int fd, GstCaps * caps, guint size)
++{
++  GstStructure *conf;
++
++  /* store the element that requested for the pool */
++  if(element)
++   self->element = gst_object_ref (element);
++
++  /* initialize device info */
++  self->fd = fd;
++  self->dev = omap_device_new (fd);
++
++  /* Padded size of buffers. Can be used for testing requested-buffer-size vs obtained-buffer-size */
++  self->size = size;
++ 
++
++  /* get the present config of the buffer pool */
++  conf = gst_buffer_pool_get_config (GST_BUFFER_POOL(self));
++  if(conf == NULL) {
++   GST_WARNING_OBJECT(self, "NULL config obtained after get_config on the pool");
++   }
++
++  /* set the config params : caps, size of the buffers, min number of buffers,
++     max number of buffers (0 for unlimited) */
++  gst_buffer_pool_config_set_params (conf, caps, size, 0, 0);
++  if(conf == NULL){
++    GST_WARNING_OBJECT(self, "NULL config after set_params");
++   }
++
++  /* set config of the pool */
++  gst_buffer_pool_set_config (GST_BUFFER_POOL(self), conf);
++
++}
++
++
++/**
++ * gst_drm_buffer_pool_new:
++ * @element: a #GstElement
++ * @fd: a file descriptor
++ * @caps: a #GstCaps
++ * @size: the padded size of buffers
++ *
++ * Creates a GstDRMBufferPool and initializes it through gst_drm_buffer_pool_initialize()
++ *
++ * Returns: the #GstDRMBufferPool created and initialized.
++ *
++ * Since: 1.2.?
++ */
++
++GstDRMBufferPool *
++gst_drm_buffer_pool_new (GstElement * element,
++    int fd, GstCaps * caps, guint size)
++{
++  GstDRMBufferPool *self = g_object_new (GST_TYPE_DRM_BUFFER_POOL, NULL);
++
++  GST_DEBUG_OBJECT (element,
++      "Creating DRM buffer pool with caps %" GST_PTR_FORMAT, caps);
++
++  gst_drm_buffer_pool_initialize (self, element, fd, caps, size);
++  
++  return self;
++}
++
++
++/**
++ * gst_drm_buffer_pool_size:
++ * @self: a #GstDRMBufferPool
++ *
++ * Obtain the padded size of buffers set during bufferpool creation
++ *
++ * Returns: the size of individual buffers within the bufferpool.
++ *
++ * Since: 1.2.?
++ */
++
++guint
++gst_drm_buffer_pool_size (GstDRMBufferPool * self)
++{
++  return self->size;
++}
++
++
++/**
++ * gst_drm_buffer_pool_check_caps:
++ * @self: a #GstDRMBufferPool
++ * @caps: a #GstCaps
++ *
++ * Check if the @caps and the caps of the @self is strictly equal
++ *
++ * Returns: the boolean value obtained from gst_caps_is_strictly_equal()
++ *
++ * Since: 1.2.?
++ */
++
++gboolean
++gst_drm_buffer_pool_check_caps (GstDRMBufferPool * self, GstCaps * caps)
++{
++  return gst_caps_is_strictly_equal (self->caps, caps);
++}
++
++
++/**
++ * gst_drm_buffer_pool_destroy:
++ * @self: a #GstDRMBufferPool
++ *
++ * destroy existing bufferpool by gst_object_unref()
++ *
++ * Since: 1.2.?
++ */
++
++void
++gst_drm_buffer_pool_destroy (GstDRMBufferPool * self)
++{
++  g_return_if_fail (self);
++
++  GST_DEBUG_OBJECT (self->element, "destroy pool (contains: %d buffers)",
++      self->nbbufs);
++
++ /* Sets the buffer pool active to FALSE. Unrefs the buffer pool.
++    If the the ref_count becomes zero, all buffers are freed and the bufferpool is destroyed */  
++ if(GST_OBJECT_REFCOUNT(self)) {
++  gst_buffer_pool_set_active (GST_BUFFER_POOL(self), FALSE);
++  gst_object_unref (self);
++  }
++}
++
++
++
++/**
++ * gst_drm_buffer_pool_get:
++ * @self: a #GstDRMBufferPool
++ * @force_alloc: a boolean indicating if a buffer should be acquired from already queued buffers of pool.
++ *
++ * Get a buffer from the #GstDRMBufferPool
++ *
++ * Returns: the #GstBuffer
++ *
++ * Since: 1.2.?
++ */
++
++GstBuffer *
++gst_drm_buffer_pool_get (GstDRMBufferPool * self, gboolean force_alloc)
++{
++  GstBuffer *buf = NULL; 
++  g_return_val_if_fail (self, NULL);
++
++  /* Set the buffer pool to active so that acquire_buffer() is not blocked */
++  gst_buffer_pool_set_active (GST_BUFFER_POOL(self), TRUE);
++
++  /* re-use a buffer off the queued buffers of pool if any are available */
++  if (!force_alloc) {
++     gst_buffer_pool_acquire_buffer (GST_BUFFER_POOL (self), &buf, NULL);
++  } else {
++     GST_BUFFER_POOL_CLASS(GST_DRM_BUFFER_POOL_GET_CLASS (self))->alloc_buffer(GST_BUFFER_POOL (self), &buf, NULL);
++
++  }
++    
++  /* Set the buffer pool active to FALSE */
++  gst_buffer_pool_set_active (GST_BUFFER_POOL(self), FALSE);
++    
++  GST_LOG_OBJECT (self->element, "returning buf %p", buf);
++
++  return GST_BUFFER (buf);
++}
++
++
++/**
++ * gst_drm_buffer_pool_put:
++ * @self: a #GstDRMBufferPool
++ * @force_alloc: a boolean indicating if a buffer should be acquired from already queued buffers of pool.
++ *
++ * Get a buffer from the #GstDRMBufferPool
++ *
++ * Returns: the boolean value corresponding to success (TRUE)
++ *
++ * Since: 1.2.?
++ */
++gboolean
++gst_drm_buffer_pool_put (GstDRMBufferPool * self, GstBuffer * buf)
++{
++  gboolean reuse = gst_buffer_pool_is_active (GST_BUFFER_POOL (self));
++   if(reuse){
++       gst_buffer_pool_release_buffer(GST_BUFFER_POOL(self) , buf);
++   }
++  return reuse;
++}
++
++static void
++gst_drm_buffer_pool_finalize (GObject * pool)
++{
++  GstDRMBufferPool *self = GST_DRM_BUFFER_POOL (pool);
++  GST_DEBUG_OBJECT (self->element, "finalize");
++
++  if (self->caps)
++    gst_caps_unref (self->caps);
++  if (self->element)
++    gst_object_unref (self->element);
++  if (self->dev)
++   omap_device_del (self->dev);
++  G_OBJECT_CLASS (gst_drm_buffer_pool_parent_class)->finalize(pool);
++}
++
++static void
++gst_drm_buffer_pool_class_init (GstDRMBufferPoolClass * klass)
++{
++  GObjectClass *object_class;
++  GstBufferPoolClass *bclass = GST_BUFFER_POOL_CLASS (klass);
++  GST_DEBUG_CATEGORY_INIT (drmbufferpool_debug, "drmbufferpool", 0,
++      "DRM buffer pool");
++  parent_class = g_type_class_peek_parent (klass);
++  object_class = G_OBJECT_CLASS (klass);
++  bclass->set_config = gst_drm_buffer_pool_set_config;
++  bclass->alloc_buffer = gst_drm_alloc_new_buffer;
++  object_class->finalize = gst_drm_buffer_pool_finalize;
++}
++
++static void
++gst_drm_buffer_pool_init (GstDRMBufferPool * self)
++{
++#ifndef GST_DISABLE_GST_DEBUG
++  self->nbbufs = 0;
++#endif /* DEBUG */
++}
++
++/**
++ * gst_drm_alloc_new_buffer:
++ * @bufpool: a #GstBufferPool
++ * @buffer: a pointer to #GstBuffer
++ * @params: a #GstBufferPoolAcquireParams
++ *
++ * Allocate a new buffer to the #GstDRMBufferPool
++ *
++ * Returns: the #GstFlowReturn
++ *
++ * Since: 1.2.?
++ */
++static GstFlowReturn
++gst_drm_alloc_new_buffer (GstBufferPool * bufpool, GstBuffer ** buffer,
++    GstBufferPoolAcquireParams * params)
++{
++
++  /* create a buffer with ref_count = 1 */
++  GstBuffer *buf = gst_buffer_new ();
++  GstDRMBufferPool *pool = GST_DRM_BUFFER_POOL(bufpool);
++  GstVideoCropMeta *crop;
++  GstMetaDmaBuf *dmabuf;
++  GstVideoMeta *videometa;
++
++  /* TODO: if allocation could be handled via libkms then this
++   * bufferpool implementation could be completely generic..
++   * otherwise we might want some support for various different
++   * drm drivers here:
++   */
++
++  struct omap_bo *bo = omap_bo_new (pool->dev, pool->size, OMAP_BO_WC);
++  if (!bo) {
++    GST_WARNING_OBJECT (pool->element, "Failed to create bo");
++    return GST_FLOW_ERROR;;
++  }
++
++  /* allocating a memory to the buffer we created */
++  gst_buffer_append_memory (buf,
++      gst_memory_new_wrapped (GST_MEMORY_FLAG_NO_SHARE, omap_bo_map (bo),
++          pool->size, 0, pool->size, NULL, NULL));
++  
++  /* Adding the necessary metadatas with initialization*/
++
++  dmabuf = gst_buffer_add_dma_buf_meta (GST_BUFFER (buf), omap_bo_dmabuf (bo));
++  if(!dmabuf){
++    GST_DEBUG_OBJECT (pool, "Failed to add dmabuf meta to buffer");
++  }
++
++  videometa = gst_buffer_add_video_meta(buf,GST_VIDEO_FRAME_FLAG_NONE, GST_VIDEO_INFO_FORMAT(&pool->info), pool->width, pool->height);
++  if(!videometa){
++    GST_DEBUG_OBJECT (pool, "Failed to add video meta to buffer");
++  }
++
++  crop = gst_buffer_add_video_crop_meta(buf);
++  if(!crop){
++    GST_DEBUG_OBJECT (pool, "Failed to add crop meta to buffer");
++  } else {
++  crop->x = 0;
++  crop->y = 0;
++  crop->height = pool->height;
++  crop->width = pool->width;
++  }
++
++  /* Pointer to the buffer (passed as argument) should now point to the buffer we created */
++  *buffer = buf;
++
++#ifndef GST_DISABLE_GST_DEBUG
++      {
++        GST_DEBUG_OBJECT (pool, "Creating new buffer (living buffer: %i)",
++            ++pool->nbbufs);
++      }
++#endif
++
++  return GST_FLOW_OK;
++
++}
++
+diff --git a/gst-libs/gst/drm/gstdrmbufferpool.h b/gst-libs/gst/drm/gstdrmbufferpool.h
+new file mode 100644
+index 0000000..a9f3fba
+--- /dev/null
++++ b/gst-libs/gst/drm/gstdrmbufferpool.h
+@@ -0,0 +1,138 @@
++/*
++ * GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *  Rob Clark <rob.clark@linaro.org>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++#ifndef __GSTDRMBUFFERPOOL_H__
++#define __GSTDRMBUFFERPOOL_H__
++
++#include <gst/gst.h>
++#include <gst/video/gstvideometa.h>
++G_BEGIN_DECLS
++
++/* TODO replace dependency on libdrm_omap w/ libdrm.. the only thing
++ * missing is way to allocate buffers, but this should probably be
++ * done via libdrm?
++ *
++ * NOTE: this dependency is only for those who want to subclass us,
++ * so we could perhaps move the struct definitions into a separate
++ * header or split out private ptr and move that into the .c file..
++ */
++#include <stdint.h>
++#include <omap_drm.h>
++#include <omap_drmif.h>
++
++#define GST_TYPE_DRM_BUFFER_POOL (gst_drm_buffer_pool_get_type())
++#define GST_IS_DRM_BUFFER_POOL(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_DRM_BUFFER_POOL))
++#define GST_DRM_BUFFER_POOL(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_DRM_BUFFER_POOL, GstDRMBufferPool))
++#define GST_DRM_BUFFER_POOL_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_DRM_BUFFER_POOL, GstDRMBufferPoolClass))
++#define GST_DRM_BUFFER_POOL_CLASS(klass)   (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_DRM_BUFFER_POOL, GstDRMBufferPoolClass))
++
++
++typedef struct _GstDRMBufferPool GstDRMBufferPool;
++typedef struct _GstDRMBufferPoolClass GstDRMBufferPoolClass;
++
++
++/*
++ * GstDRMBufferPool:
++ */
++
++struct _GstDRMBufferPool {
++  GstBufferPool parent;
++
++  int fd;
++  struct omap_device *dev;
++
++  /* output (padded) size including any codec padding: */
++  guint size;
++  gint width, height;
++
++  /* Video info obtained from caps */
++  GstVideoInfo info;
++  
++  GstCaps         *caps;
++  GstElement      *element;  /* the element that owns us.. */
++
++#ifndef GST_DISABLE_GST_DEBUG
++  guint            nbbufs;
++#endif /* DEBUG */
++
++  /* TODO add reserved */
++};
++
++struct _GstDRMBufferPoolClass {
++  GstBufferPoolClass klass;
++
++  /* allow the subclass to allocate it's own buffers that extend
++   * GstDRMBuffer:
++   */
++  GstFlowReturn  (*alloc_buffer)(GstBufferPool * pool, GstBuffer ** buffer,
++    GstBufferPoolAcquireParams * params);
++
++  /* The a buffer subclass should not override finalize, as that
++   * would interfere with reviving the buffer and returning to the
++   * pool.  Instead you can implement this vmethod to cleanup a
++   * buffer.
++   */
++  void (*buffer_cleanup)(GstDRMBufferPool * pool, GstBuffer *buf);
++
++  /* Called when a buffer is added back to the pool after its last
++   * ref has been removed.
++   */
++  void (*buffer_pooled)(GstDRMBufferPool * pool, GstBuffer *buf);
++
++  /* TODO add reserved */
++};
++
++GType gst_drm_buffer_pool_get_type (void);
++
++void gst_drm_buffer_pool_initialize (GstDRMBufferPool * self,
++    GstElement * element, int fd, GstCaps * caps, guint size);
++
++/* to set/change the config of pool */
++gboolean gst_drm_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config);
++
++/* create a new drm buffer pool */
++GstDRMBufferPool * gst_drm_buffer_pool_new (GstElement * element,
++    int fd, GstCaps * caps, guint size);
++
++/* unref the drm buffer pool */
++void gst_drm_buffer_pool_destroy (GstDRMBufferPool * self);
++
++/* size of buffers in the pool */
++guint gst_drm_buffer_pool_size (GstDRMBufferPool * self);
++
++/* check the present caps of the pool */
++gboolean gst_drm_buffer_pool_check_caps (GstDRMBufferPool * self,
++    GstCaps * caps);
++
++/* get a buffer from the pool */
++GstBuffer * gst_drm_buffer_pool_get (GstDRMBufferPool * self,
++    gboolean force_alloc);
++
++/* release a buffer to the pool */
++gboolean gst_drm_buffer_pool_put (GstDRMBufferPool * self, GstBuffer * buf);
++
++G_END_DECLS
++
++#endif /* __GSTDRMBUFFERPOOL_H__ */
+diff --git a/pkgconfig/Makefile.am b/pkgconfig/Makefile.am
+index 430e123..3fde657 100644
+--- a/pkgconfig/Makefile.am
++++ b/pkgconfig/Makefile.am
+@@ -3,12 +3,14 @@
+ pcverfiles =  \
+ 	gstreamer-plugins-bad-@GST_API_VERSION@.pc \
+ 	gstreamer-codecparsers-@GST_API_VERSION@.pc \
++        gstreamer-drm-@GST_API_VERSION@.pc \
+ 	gstreamer-insertbin-@GST_API_VERSION@.pc \
+ 	gstreamer-mpegts-@GST_API_VERSION@.pc
+ 
+ pcverfiles_uninstalled = \
+ 	gstreamer-plugins-bad-@GST_API_VERSION@-uninstalled.pc \
+ 	gstreamer-codecparsers-@GST_API_VERSION@-uninstalled.pc \
++        gstreamer-drm-@GST_API_VERSION@-uninstalled.pc \
+ 	gstreamer-insertbin-@GST_API_VERSION@-uninstalled.pc \
+ 	gstreamer-mpegts-@GST_API_VERSION@-uninstalled.pc
+ 
+@@ -36,6 +38,7 @@ CLEANFILES = $(pcverfiles) $(pcverfiles_uninstalled)
+ pcinfiles = \
+            gstreamer-plugins-bad.pc.in gstreamer-plugins-bad-uninstalled.pc.in \
+            gstreamer-codecparsers.pc.in gstreamer-codecparsers-uninstalled.pc.in \
++           gstreamer-drm.pc.in gstreamer-drm-uninstalled.pc.in \
+            gstreamer-insertbin.pc.in gstreamer-insertbin-uninstalled.pc.in \
+            gstreamer-egl.pc.in gstreamer-egl-uninstalled.pc.in \
+            gstreamer-mpegts.pc.in gstreamer-mpegts-uninstalled.pc.in
+diff --git a/pkgconfig/gstreamer-drm-uninstalled.pc.in b/pkgconfig/gstreamer-drm-uninstalled.pc.in
+new file mode 100644
+index 0000000..fc0e3f2
+--- /dev/null
++++ b/pkgconfig/gstreamer-drm-uninstalled.pc.in
+@@ -0,0 +1,12 @@
++prefix=
++exec_prefix=
++libdir=${pcfiledir}/../gst-libs/gst/drm
++includedir=${pcfiledir}/../gst-libs
++
++Name: GStreamer DRM buffer pool, Uninstalled
++Description: DRM buffer pool for GStreamer elements, uninstalled
++Requires: gstreamer-@GST_MAJORMINOR@ gstreamer-base-@GST_MAJORMINOR@
++Version: @VERSION@
++Libs: -L${libdir} ${libdir}/libgstdrm-@GST_MAJORMINOR@.la
++Cflags: -I${includedir}
++
+diff --git a/pkgconfig/gstreamer-drm.pc.in b/pkgconfig/gstreamer-drm.pc.in
+new file mode 100644
+index 0000000..8182b4f
+--- /dev/null
++++ b/pkgconfig/gstreamer-drm.pc.in
+@@ -0,0 +1,12 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@/gstreamer-@GST_MAJORMINOR@
++
++Name: GStreamer DRM buffer pool
++Description: DRM buffer pool for GStreamer elements
++Requires: gstreamer-@GST_MAJORMINOR@ gstreamer-base-@GST_MAJORMINOR@
++Version: @VERSION@
++Libs: -L${libdir} -lgstdrm-@GST_MAJORMINOR@
++Cflags: -I${includedir}
++
+diff --git a/pkgconfig/gstreamer-plugins-bad-uninstalled.pc.in b/pkgconfig/gstreamer-plugins-bad-uninstalled.pc.in
+index 6fcf773..ed0e5b0 100644
+--- a/pkgconfig/gstreamer-plugins-bad-uninstalled.pc.in
++++ b/pkgconfig/gstreamer-plugins-bad-uninstalled.pc.in
+@@ -10,5 +10,5 @@ Name: GStreamer Bad Plugin libraries, Uninstalled
+ Description: Streaming media framework, bad plugins libraries, uninstalled
+ Version: @VERSION@
+ Requires: gstreamer-@GST_API_VERSION@
+-Libs: -L@abs_top_builddir@/gst-libs/gst/basecamerabinsrc -L@abs_top_builddir@/gst-libs/gst/codecparsers -L@abs_top_builddir@/gst-libs/gst/egl -L@abs_top_builddir@/gst-libs/gst/insertbin -L@abs_top_builddir@/gst-libs/gst/interfaces -L@abs_top_builddir@/gst-libs/gst/mpegts -L@abs_top_builddir@/gst-libs/gst/signalprocessor -L@abs_top_builddir@/gst-libs/gst/video
++Libs: -L@abs_top_builddir@/gst-libs/gst/basecamerabinsrc -L@abs_top_builddir@/gst-libs/gst/codecparsers -L@abs_top_builddir@/gst-libs/gst/drm -L@abs_top_builddir@/gst-libs/gst/egl -L@abs_top_builddir@/gst-libs/gst/insertbin -L@abs_top_builddir@/gst-libs/gst/interfaces -L@abs_top_builddir@/gst-libs/gst/mpegts -L@abs_top_builddir@/gst-libs/gst/signalprocessor -L@abs_top_builddir@/gst-libs/gst/video
+ Cflags: -I@abs_top_srcdir@/gst-libs -I@abs_top_builddir@/gst-libs
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
new file mode 100644
index 0000000..875ff0b
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
@@ -0,0 +1,1017 @@
+From 4aba7f1afbd6c364e649f4c0e539c9a93d59bce6 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Fri, 12 Dec 2014 12:57:22 +0530
+Subject: [PATCH] Modified waylandsink to accept NV12 format
+
+Wayland sink now accepts NV12 format buffers. A support function gst_wl_buffer_priv
+has been added to check if it is a buffer with GstMetaDmabuf metadata set and
+create a wl_buffer. A hashtable is also maintained with GstMetaDmabuf fd as key
+---
+ configure.ac                 |    6 +-
+ ext/wayland/Makefile.am      |   11 +-
+ ext/wayland/gstwaylandsink.c |  203 +++++++++++++++++--
+ ext/wayland/gstwaylandsink.h |   18 ++
+ .../ext/wayland/gstwlbufferpriv.c                  |  156 ++++++++++++++
+ .../ext/wayland/gstwlbufferpriv.h                  |   56 +++++
+ .../ext/wayland/wayland-drm-client-protocol.h      |  213 ++++++++++++++++++++
+ .../ext/wayland/wayland-drm-protocol.c             |   74 +++++++
+ 8 files changed, 717 insertions(+), 20 deletions(-)
+ create mode 100644 ext/wayland/gstwlbufferpriv.c
+ create mode 100644 ext/wayland/gstwlbufferpriv.h
+ create mode 100644 ext/wayland/wayland-drm-client-protocol.h
+ create mode 100644 ext/wayland/wayland-drm-protocol.c
+
+diff --git a/configure.ac b/configure.ac
+index edf8ea8..b94bd5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1219,8 +1219,10 @@ AG_GST_CHECK_FEATURE(DIRECTFB, [directfb], dfbvideosink , [
+ dnl **** Wayland ****
+ translit(dnm, m, l) AM_CONDITIONAL(USE_WAYLAND, true)
+ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
+-  PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.0.0, [
+-    HAVE_WAYLAND="yes" ], [ HAVE_WAYLAND="no"
++  PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.0.0 dri2 libdrm libdrm_omap, [
++     AC_SUBST(DRM_CFLAGS)
++     AC_SUBST(DRM_LIBS)
++     HAVE_WAYLAND="yes" ], [ HAVE_WAYLAND="no"
+   ])
+ ])
+ 
+diff --git a/ext/wayland/Makefile.am b/ext/wayland/Makefile.am
+index e8edf73..2c7a12f 100644
+--- a/ext/wayland/Makefile.am
++++ b/ext/wayland/Makefile.am
+@@ -1,12 +1,15 @@
+ plugin_LTLIBRARIES = libgstwaylandsink.la
+ 
+-libgstwaylandsink_la_SOURCES =  gstwaylandsink.c waylandpool.c
++libgstwaylandsink_la_SOURCES =  gstwaylandsink.c waylandpool.c gstwlbufferpriv.c wayland-drm-protocol.c
+ libgstwaylandsink_la_CFLAGS = $(GST_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) \
+-                               $(WAYLAND_CFLAGS)
++                                $(GST_PLUGINS_BAD_CFLAGS) \
++                               $(WAYLAND_CFLAGS) $(DRM_CFLAGS)
+ libgstwaylandsink_la_LIBADD = $(GST_PLUGINS_BASE_LIBS) \
+                                -lgstvideo-$(GST_API_VERSION) \
+-                               $(WAYLAND_LIBS)
++                               $(WAYLAND_LIBS) \
++                               -lgstdmabuf-$(GST_API_VERSION) \
++                               $(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la
+ libgstwaylandsink_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
+ libgstwaylandsink_la_LIBTOOLFLAGS = $(GST_PLUGIN_LIBTOOLFLAGS)
+ 
+-noinst_HEADERS = gstwaylandsink.h waylandpool.h
++noinst_HEADERS = gstwaylandsink.h waylandpool.h gstwlbufferpriv.h  wayland-drm-client-protocol.h
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index cabf310..bb7d838 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -41,6 +41,13 @@
+ #endif
+ 
+ #include "gstwaylandsink.h"
++#include "gstwlbufferpriv.h"
++
++#include <wayland-client-protocol.h>
++#include "wayland-drm-client-protocol.h"
++
++#include <linux/input.h>
++
+ 
+ /* signals */
+ enum
+@@ -60,9 +67,9 @@ GST_DEBUG_CATEGORY (gstwayland_debug);
+ #define GST_CAT_DEFAULT gstwayland_debug
+ 
+ #if G_BYTE_ORDER == G_BIG_ENDIAN
+-#define CAPS "{xRGB, ARGB}"
++#define CAPS "{xRGB, ARGB, NV21}"
+ #else
+-#define CAPS "{BGRx, BGRA}"
++#define CAPS "{BGRx, BGRA, NV12, I420, YUY2, UYVY}"
+ #endif
+ 
+ static GstStaticPadTemplate sink_template = GST_STATIC_PAD_TEMPLATE ("sink",
+@@ -181,6 +188,15 @@ gst_wayland_sink_class_init (GstWaylandSinkClass * klass)
+           G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+ }
+ 
++/* Free function for key destruction for the hashtable we are using*/ 
++static void
++wlbufferpriv_free_func (GstWLBufferPriv *priv)
++{
++  wl_buffer_destroy (priv->buffer);
++  omap_bo_del (priv->bo);
++  g_free(priv);
++}
++
+ static void
+ gst_wayland_sink_init (GstWaylandSink * sink)
+ {
+@@ -188,7 +204,10 @@ gst_wayland_sink_init (GstWaylandSink * sink)
+   sink->window = NULL;
+   sink->shm_pool = NULL;
+   sink->pool = NULL;
+-
++  sink->drm_pool = NULL;
++  /* Initialising the hastable for storing map between dmabuf fd and GstWLBufferPriv */
++  sink->wlbufferpriv = g_hash_table_new_full (g_direct_hash, g_direct_equal,
++      NULL, (GDestroyNotify) wlbufferpriv_free_func);
+   g_mutex_init (&sink->wayland_lock);
+ }
+ 
+@@ -230,6 +249,9 @@ destroy_display (struct display *display)
+   if (display->shm)
+     wl_shm_destroy (display->shm);
+ 
++  if (display->drm)
++    wl_drm_destroy (display->drm);
++
+   if (display->shell)
+     wl_shell_destroy (display->shell);
+ 
+@@ -280,6 +302,14 @@ gst_wayland_sink_finalize (GObject * object)
+     destroy_display (sink->display);
+   if (sink->shm_pool)
+     shm_pool_destroy (sink->shm_pool);
++  if (sink->drm_pool) {
++    gst_drm_buffer_pool_destroy (sink->drm_pool);
++    sink->drm_pool = NULL;
++  }
++  if (sink->wlbufferpriv){
++    g_hash_table_destroy (sink->wlbufferpriv);
++    sink->wlbufferpriv = NULL;
++  }
+ 
+   g_mutex_clear (&sink->wayland_lock);
+ 
+@@ -318,6 +348,56 @@ struct wl_shm_listener shm_listenter = {
+   shm_format
+ };
+ 
++/* For wl_drm_listener */
++static void
++drm_handle_device (void *data, struct wl_drm *drm, const char *device)
++{
++  struct display *d = data;
++  drm_magic_t magic;
++
++  d->fd = open (device, O_RDWR | O_CLOEXEC);
++  if (d->fd == -1) {
++    GST_ERROR ("could not open %s: %m", device);
++    // XXX hmm, probably need to throw up some error now??
++    return;
++  }
++
++  drmGetMagic (d->fd, &magic);
++  wl_drm_authenticate (d->drm, magic);
++}
++
++
++static void
++drm_handle_format (void *data, struct wl_drm *drm, uint32_t format)
++{
++  struct display *d = data;
++  GST_DEBUG ("got format: %" GST_FOURCC_FORMAT, GST_FOURCC_ARGS (format));
++  if (d->drm_format_count < 50) {
++    d->drm_formats[d->drm_format_count++] = format;
++  } else {
++    GST_WARNING ("drm_handle_formats (no room for more formats): %" 
++                GST_FOURCC_FORMAT, GST_FOURCC_ARGS (format));
++  }
++}
++
++static void
++drm_handle_authenticated (void *data, struct wl_drm *drm)
++{
++  struct display *d = data;
++  GST_DEBUG ("authenticated");
++  d->dev = omap_device_new (d->fd);
++  d->authenticated = 1;
++  GST_DEBUG("drm_handle_authenticated: dev: %p, d->authenticated: %d\n", d->dev, d->authenticated);
++}
++
++static const struct wl_drm_listener drm_listener = {
++  drm_handle_device,
++  drm_handle_format,
++  drm_handle_authenticated
++};
++
++
++
+ static void
+ registry_handle_global (void *data, struct wl_registry *registry,
+     uint32_t id, const char *interface, uint32_t version)
+@@ -332,6 +412,9 @@ registry_handle_global (void *data, struct wl_registry *registry,
+   } else if (strcmp (interface, "wl_shm") == 0) {
+     d->shm = wl_registry_bind (registry, id, &wl_shm_interface, 1);
+     wl_shm_add_listener (d->shm, &shm_listenter, d);
++  } else if (strcmp (interface, "wl_drm") == 0) {
++    d->drm = wl_registry_bind (registry, id, &wl_drm_interface, 1);
++    wl_drm_add_listener (d->drm, &drm_listener, d);
+   }
+ }
+ 
+@@ -351,13 +434,14 @@ create_display (void)
+     free (display);
+     return NULL;
+   }
++  display->authenticated = 0;
+ 
+   display->registry = wl_display_get_registry (display->display);
+   wl_registry_add_listener (display->registry, &registry_listener, display);
+ 
+   wl_display_roundtrip (display->display);
+-  if (display->shm == NULL) {
+-    GST_ERROR ("No wl_shm global..");
++  if (display->shm == NULL && display->drm == NULL) {
++    GST_ERROR ("No wl_shm global and wl_drm global..");
+     return NULL;
+   }
+ 
+@@ -384,6 +468,61 @@ gst_wayland_sink_format_from_caps (uint32_t * wl_format, GstCaps * caps)
+   return (*wl_format != -1);
+ }
+ 
++static void
++wait_authentication (GstWaylandSink * sink)
++{
++  GST_DEBUG_OBJECT (sink, "Before wait aunthenticated value is %d : \n", sink->display->authenticated );
++  while (!sink->display->authenticated) {
++    GST_DEBUG_OBJECT (sink, "waiting for authentication");
++    wl_display_roundtrip (sink->display->display);
++  }
++  GST_DEBUG_OBJECT (sink, "After wait aunthenticated value is %d : \n", sink->display->authenticated );
++}
++
++/* create a drm buffer pool if the video format is NV12 */
++static gboolean
++create_pool (GstWaylandSink * sink, GstCaps * caps)
++{
++
++  GstVideoInfo info;
++
++  wait_authentication (sink);
++
++  while (!sink->display->authenticated) {
++    GST_DEBUG_OBJECT (sink, "not authenticated yet");
++  }
++
++  if (!gst_video_info_from_caps (&info, caps))
++    goto invalid_format;
++
++  
++
++  if (sink->drm_pool) {
++    GST_INFO_OBJECT (sink, "recreating pool");
++    gst_drm_buffer_pool_destroy (sink->drm_pool);
++    sink->drm_pool = NULL;
++  }
++
++  sink->video_width = info.width;
++  sink->video_height = info.height;
++
++  sink->drm_pool = gst_drm_buffer_pool_new (GST_ELEMENT (sink),
++      sink->display->fd, caps, info.size);
++  if(sink->drm_pool){
++    return TRUE;
++   }
++  else {
++    return FALSE;
++   }
++
++invalid_format:
++  {
++    GST_DEBUG_OBJECT (sink,
++        "Could not locate image format from caps %" GST_PTR_FORMAT, caps);
++    return FALSE;
++  }
++}
++
+ static gboolean
+ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+ {
+@@ -393,6 +532,7 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+   GstStructure *structure;
+   static GstAllocationParams params = { 0, 0, 0, 15, };
+   guint size;
++ GstVideoFormat fmt;
+ 
+   sink = GST_WAYLAND_SINK (bsink);
+ 
+@@ -401,15 +541,23 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+   if (!gst_video_info_from_caps (&info, caps))
+     goto invalid_format;
+ 
++  fmt = GST_VIDEO_INFO_FORMAT(&info);
++  if (fmt == GST_VIDEO_FORMAT_NV12 ||  fmt == GST_VIDEO_FORMAT_I420 || fmt == GST_VIDEO_FORMAT_YUY2 || fmt == GST_VIDEO_FORMAT_UYVY){
++    create_pool(sink, caps);
++    return TRUE;
++  } 
++
+   if (!gst_wayland_sink_format_from_caps (&sink->format, caps))
+     goto invalid_format;
+ 
++
+   if (!(sink->display->formats & (1 << sink->format))) {
+     GST_DEBUG_OBJECT (sink, "%s not available",
+         gst_wayland_format_to_string (sink->format));
+     return FALSE;
+   }
+ 
++
+   sink->video_width = info.width;
+   sink->video_height = info.height;
+   size = info.size;
+@@ -417,6 +565,7 @@ gst_wayland_sink_set_caps (GstBaseSink * bsink, GstCaps * caps)
+   /* create a new pool for the new configuration */
+   newpool = gst_wayland_buffer_pool_new (sink);
+ 
++
+   if (!newpool) {
+     GST_DEBUG_OBJECT (sink, "Failed to create new pool");
+     return FALSE;
+@@ -532,6 +681,7 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
+ {
+   GstWaylandSink *sink = GST_WAYLAND_SINK (bsink);
+   GstBufferPool *pool;
++  GstDRMBufferPool *drm_pool;
+   GstStructure *config;
+   GstCaps *caps;
+   guint size;
+@@ -562,6 +712,7 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
+     gst_structure_free (config);
+   }
+ 
++
+   if (pool == NULL && need_pool) {
+     GstVideoInfo info;
+ 
+@@ -583,7 +734,6 @@ gst_wayland_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
+     gst_query_add_allocation_pool (query, pool, size, 2, 0);
+     gst_object_unref (pool);
+   }
+-
+   return TRUE;
+ 
+   /* ERRORS */
+@@ -624,35 +774,54 @@ static const struct wl_callback_listener frame_callback_listener = {
+   frame_redraw_callback
+ };
+ 
++
+ static GstFlowReturn
+ gst_wayland_sink_render (GstBaseSink * bsink, GstBuffer * buffer)
+ {
+   GstWaylandSink *sink = GST_WAYLAND_SINK (bsink);
+   GstVideoRectangle src, dst, res;
+-  GstBuffer *to_render;
++  GstBuffer *to_render = NULL;
+   GstWlMeta *meta;
+   GstFlowReturn ret;
+   struct window *window;
+   struct display *display;
+-
++  GstWLBufferPriv *priv;
++  GstMapInfo mapsrc;
++  
+   GST_LOG_OBJECT (sink, "render buffer %p", buffer);
+-  if (!sink->window)
+-    create_window (sink, sink->display, sink->video_width, sink->video_height);
++  if (!sink->window){
++    gint video_width = sink->video_width;
++    gint video_height = sink->video_height;
++    GstVideoCropMeta* crop = gst_buffer_get_video_crop_meta (buffer);
++    if(crop){
++       if (crop->width) {
++         video_width = crop->width;
++       } 
++      if (crop->height) {  
++         video_height = crop->height;
++       }
++    }
++    create_window (sink, sink->display, video_width, video_height);
++   }
+ 
+   window = sink->window;
+   display = sink->display;
+ 
+   meta = gst_buffer_get_wl_meta (buffer);
++  priv = gst_wl_buffer_priv (sink, buffer);
+ 
+   if (window->redraw_pending) {
+     wl_display_dispatch (display->display);
+   }
+ 
++  
+   if (meta && meta->sink == sink) {
+     GST_LOG_OBJECT (sink, "buffer %p from our pool, writing directly", buffer);
+     to_render = buffer;
++  } else if(priv) {
++    to_render = buffer;
++    GST_LOG_OBJECT (sink, " priv buffer %p from drm pool, writing directly", buffer);
+   } else {
+-    GstMapInfo src;
+     GST_LOG_OBJECT (sink, "buffer %p not from our pool, copying", buffer);
+ 
+     if (!sink->pool)
+@@ -665,9 +834,9 @@ gst_wayland_sink_render (GstBaseSink * bsink, GstBuffer * buffer)
+     if (ret != GST_FLOW_OK)
+       goto no_buffer;
+ 
+-    gst_buffer_map (buffer, &src, GST_MAP_READ);
+-    gst_buffer_fill (to_render, 0, src.data, src.size);
+-    gst_buffer_unmap (buffer, &src);
++    gst_buffer_map (buffer, &mapsrc, GST_MAP_READ);
++    gst_buffer_fill (to_render, 0, mapsrc.data, mapsrc.size);
++    gst_buffer_unmap (buffer, &mapsrc);
+ 
+     meta = gst_buffer_get_wl_meta (to_render);
+   }
+@@ -679,7 +848,13 @@ gst_wayland_sink_render (GstBaseSink * bsink, GstBuffer * buffer)
+ 
+   gst_video_sink_center_rect (src, dst, &res, FALSE);
+ 
++  /* display the buffer stored in priv, if the buffer obtained returns a priv */
++  if(priv){
++   wl_surface_attach (sink->window->surface, priv->buffer, res.x, res.y);
++  } else {
+   wl_surface_attach (sink->window->surface, meta->wbuffer, 0, 0);
++  }
++  
+   wl_surface_damage (sink->window->surface, 0, 0, res.w, res.h);
+   window->redraw_pending = TRUE;
+   window->callback = wl_surface_frame (window->surface);
+diff --git a/ext/wayland/gstwaylandsink.h b/ext/wayland/gstwaylandsink.h
+index cb3383e..b3fbbac 100644
+--- a/ext/wayland/gstwaylandsink.h
++++ b/ext/wayland/gstwaylandsink.h
+@@ -39,9 +39,11 @@
+ #include <gst/video/video.h>
+ #include <gst/video/gstvideosink.h>
+ #include <gst/video/gstvideometa.h>
++#include <gst/drm/gstdrmbufferpool.h>
+ 
+ #include <wayland-client.h>
+ 
++
+ #define GST_TYPE_WAYLAND_SINK \
+ 	    (gst_wayland_sink_get_type())
+ #define GST_WAYLAND_SINK(obj) \
+@@ -62,7 +64,19 @@ struct  display
+   struct wl_compositor *compositor;
+   struct wl_shell *shell;
+   struct wl_shm *shm;
++  struct wl_drm *drm;
+   uint32_t formats;
++
++  uint32_t drm_formats[50];
++  int drm_format_count;
++  /* the drm device.. needed for sharing direct-render buffers..
++   * TODO nothing about this should really be omapdrm specific.  But some
++   * of the code, like hashtable of imported buffers in libdrm_omap should
++   * be refactored out into some generic libdrm code..
++   */
++  struct omap_device *dev;
++  int fd;
++  int authenticated;
+ };
+ 
+ struct window
+@@ -99,6 +113,10 @@ struct _GstWaylandSink
+ 
+   GstBufferPool *pool;
+ 
++  /* for NV12 buffers on wl_drm_buffer */
++  GstDRMBufferPool *drm_pool;
++  GHashTable *wlbufferpriv;
++
+   GMutex wayland_lock;
+ 
+   gint video_width;
+diff --git a/ext/wayland/gstwlbufferpriv.c b/ext/wayland/gstwlbufferpriv.c
+new file mode 100644
+index 0000000..07fdf70
+--- /dev/null
++++ b/ext/wayland/gstwlbufferpriv.c
+@@ -0,0 +1,156 @@
++/*
++ * GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *  Rob Clark <rob.clark@linaro.org>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <stdint.h>
++#include <gst/gst.h>
++#include <gst/dmabuf/dmabuf.h>
++#include <gst/video/gstvideometa.h>
++
++#include <omap_drm.h>
++#include <omap_drmif.h>
++
++#include "gstwaylandsink.h"
++#include "gstwlbufferpriv.h"
++#include "wayland-drm-client-protocol.h"
++
++
++/* Create planar wl_buffer that can be given to waylandsink.
++ * Crop info is also used */
++static int
++create_wl_buffer (GstWLBufferPriv * priv, GstWaylandSink * sink,
++    GstBuffer * buf)
++{
++  GstVideoCropMeta *crop;
++  gint video_width = sink->video_width;
++  gint video_height = sink->video_height;
++
++  /* TODO get format, etc from caps.. and query device for
++   * supported formats, and make this all more flexible to
++   * cope with various formats:
++   */
++  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
++  uint32_t name;
++
++  /* note: wayland and mesa use the terminology:
++   *    stride - rowstride in bytes
++   *    pitch  - rowstride in pixels
++   */
++  uint32_t strides[3] = {
++    GST_ROUND_UP_4 (sink->video_width), GST_ROUND_UP_4 (sink->video_width), 0,
++  };
++  uint32_t offsets[3] = {
++    0, strides[0] * sink->video_height, 0
++  };
++
++  crop = gst_buffer_get_video_crop_meta (buf);
++  if (crop) {
++    guint left, top;
++    left = crop->y;
++    top = crop->x;
++
++    offsets[0] = left;
++    offsets[1] += (video_width * top / 2) + left;
++    if(crop->width)
++     video_width = crop->width;
++  }
++
++  if (omap_bo_get_name (priv->bo, &name)) {
++    GST_WARNING_OBJECT (sink, "could not get name");
++    return -1;
++  }
++
++ GST_LOG_OBJECT (sink,"width = %d , height = %d , fourcc = %d ",  video_width, video_height, fourcc );
++
++  priv->buffer = wl_drm_create_planar_buffer (sink->display->drm, name,
++      video_width, video_height, fourcc,
++      offsets[0], strides[0],
++      offsets[1], strides[1],
++      offsets[2], strides[2]);
++
++  GST_DEBUG_OBJECT (sink, "create planar buffer: %p (name=%d)",
++      priv->buffer, name);
++
++  return priv->buffer ? 0 : -1;
++}
++
++
++/**
++ * gst_wl_buffer_priv:
++ * @sink: a #GstWaylandSink
++ * @buf: a pointer to #GstBuffer
++ *
++ * Checks if the @buf has a GstMetaDmaBuf metadata set. If it doesn't we return a NULL
++ * indicating its not a dmabuf buffer. We maintain a hashtable with dmabuf fd as key and 
++ * the GstWLBufferPriv structure as value
++ *
++ * Returns: the #GstWLBufferPriv
++ *
++ * Since: 1.2.?
++ */
++GstWLBufferPriv *
++gst_wl_buffer_priv (GstWaylandSink * sink, GstBuffer * buf)
++{
++  
++    GstMetaDmaBuf *dmabuf = gst_buffer_get_dma_buf_meta (buf);
++    GstWLBufferPriv *priv;
++    int fd,fd_copy;
++
++    /* if it isn't a dmabuf buffer that we can import, then there
++     * is nothing we can do with it:
++     */
++    if (!dmabuf) {
++      GST_DEBUG_OBJECT (sink, "not importing non dmabuf buffer");
++      return NULL;
++    }
++    fd = gst_dma_buf_meta_get_fd (dmabuf);
++    fd_copy =fd;
++
++     /* lookup the hashtable with fd as key. If present return bo & buffer structure */
++    priv = g_hash_table_lookup (sink->wlbufferpriv, (gpointer)fd_copy);
++    if(priv) {
++       return priv;
++     }
++
++    priv = g_malloc0 (sizeof (GstWLBufferPriv));
++    priv->bo = omap_bo_from_dmabuf (sink->display->dev, fd);
++
++    if (create_wl_buffer (priv, sink, buf)) {
++      GST_WARNING_OBJECT (sink, "could not create framebuffer: %s",
++          strerror (errno));
++      g_free(priv);
++      return NULL;
++    }
++
++    /* if fd not present, write to hash table fd and the corresponding priv. */
++    g_hash_table_insert(sink->wlbufferpriv, (gpointer)fd_copy, priv);    
++    
++   
++  return priv;
++}
++
+diff --git a/ext/wayland/gstwlbufferpriv.h b/ext/wayland/gstwlbufferpriv.h
+new file mode 100644
+index 0000000..fbce4a2
+--- /dev/null
++++ b/ext/wayland/gstwlbufferpriv.h
+@@ -0,0 +1,56 @@
++/*
++ * GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *  Rob Clark <rob.clark@linaro.org>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++#ifndef __GSTWLBUFFERPRIV_H__
++#define __GSTWLBUFFERPRIV_H__
++
++#include <stdint.h>
++#include <gst/gst.h>
++
++#include <omap_drm.h>
++#include <omap_drmif.h>
++
++#include <wayland-client.h>
++
++G_BEGIN_DECLS
++
++
++typedef struct
++{
++  struct omap_bo *bo;
++  struct wl_buffer *buffer;
++
++}GstWLBufferPriv;
++
++
++GType gst_wl_buffer_priv_get_type (void);
++
++/* Returns a GstWLBufferPriv, if it has a dmabuf fd meatadata */
++GstWLBufferPriv * gst_wl_buffer_priv (GstWaylandSink *sink, GstBuffer * buf);
++
++G_END_DECLS
++
++
++#endif /* __GSTWLBUFFERPRIV_H__ */
+diff --git a/ext/wayland/wayland-drm-client-protocol.h b/ext/wayland/wayland-drm-client-protocol.h
+new file mode 100644
+index 0000000..7ddb614
+--- /dev/null
++++ b/ext/wayland/wayland-drm-client-protocol.h
+@@ -0,0 +1,213 @@
++/* 
++ * Copyright © 2008-2011 Kristian Høgsberg
++ * Copyright © 2010-2011 Intel Corporation
++ * 
++ * Permission to use, copy, modify, distribute, and sell this
++ * software and its documentation for any purpose is hereby granted
++ * without fee, provided that\n the above copyright notice appear in
++ * all copies and that both that copyright notice and this permission
++ * notice appear in supporting documentation, and that the name of
++ * the copyright holders not be used in advertising or publicity
++ * pertaining to distribution of the software without specific,
++ * written prior permission.  The copyright holders make no
++ * representations about the suitability of this software for any
++ * purpose.  It is provided "as is" without express or implied
++ * warranty.
++ * 
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
++ * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
++ * THIS SOFTWARE.
++ */
++
++#ifndef DRM_CLIENT_PROTOCOL_H
++#define DRM_CLIENT_PROTOCOL_H
++
++#ifdef  __cplusplus
++extern "C" {
++#endif
++
++#include <stdint.h>
++#include <stddef.h>
++#include "wayland-util.h"
++
++struct wl_client;
++struct wl_resource;
++
++struct wl_drm;
++
++extern const struct wl_interface wl_drm_interface;
++
++#ifndef WL_DRM_ERROR_ENUM
++#define WL_DRM_ERROR_ENUM
++enum wl_drm_error {
++	WL_DRM_ERROR_AUTHENTICATE_FAIL = 0,
++	WL_DRM_ERROR_INVALID_FORMAT = 1,
++	WL_DRM_ERROR_INVALID_NAME = 2,
++};
++#endif /* WL_DRM_ERROR_ENUM */
++
++#ifndef WL_DRM_FORMAT_ENUM
++#define WL_DRM_FORMAT_ENUM
++enum wl_drm_format {
++	WL_DRM_FORMAT_C8 = 0x20203843,
++	WL_DRM_FORMAT_RGB332 = 0x38424752,
++	WL_DRM_FORMAT_BGR233 = 0x38524742,
++	WL_DRM_FORMAT_XRGB4444 = 0x32315258,
++	WL_DRM_FORMAT_XBGR4444 = 0x32314258,
++	WL_DRM_FORMAT_RGBX4444 = 0x32315852,
++	WL_DRM_FORMAT_BGRX4444 = 0x32315842,
++	WL_DRM_FORMAT_ARGB4444 = 0x32315241,
++	WL_DRM_FORMAT_ABGR4444 = 0x32314241,
++	WL_DRM_FORMAT_RGBA4444 = 0x32314152,
++	WL_DRM_FORMAT_BGRA4444 = 0x32314142,
++	WL_DRM_FORMAT_XRGB1555 = 0x35315258,
++	WL_DRM_FORMAT_XBGR1555 = 0x35314258,
++	WL_DRM_FORMAT_RGBX5551 = 0x35315852,
++	WL_DRM_FORMAT_BGRX5551 = 0x35315842,
++	WL_DRM_FORMAT_ARGB1555 = 0x35315241,
++	WL_DRM_FORMAT_ABGR1555 = 0x35314241,
++	WL_DRM_FORMAT_RGBA5551 = 0x35314152,
++	WL_DRM_FORMAT_BGRA5551 = 0x35314142,
++	WL_DRM_FORMAT_RGB565 = 0x36314752,
++	WL_DRM_FORMAT_BGR565 = 0x36314742,
++	WL_DRM_FORMAT_RGB888 = 0x34324752,
++	WL_DRM_FORMAT_BGR888 = 0x34324742,
++	WL_DRM_FORMAT_XRGB8888 = 0x34325258,
++	WL_DRM_FORMAT_XBGR8888 = 0x34324258,
++	WL_DRM_FORMAT_RGBX8888 = 0x34325852,
++	WL_DRM_FORMAT_BGRX8888 = 0x34325842,
++	WL_DRM_FORMAT_ARGB8888 = 0x34325241,
++	WL_DRM_FORMAT_ABGR8888 = 0x34324241,
++	WL_DRM_FORMAT_RGBA8888 = 0x34324152,
++	WL_DRM_FORMAT_BGRA8888 = 0x34324142,
++	WL_DRM_FORMAT_XRGB2101010 = 0x30335258,
++	WL_DRM_FORMAT_XBGR2101010 = 0x30334258,
++	WL_DRM_FORMAT_RGBX1010102 = 0x30335852,
++	WL_DRM_FORMAT_BGRX1010102 = 0x30335842,
++	WL_DRM_FORMAT_ARGB2101010 = 0x30335241,
++	WL_DRM_FORMAT_ABGR2101010 = 0x30334241,
++	WL_DRM_FORMAT_RGBA1010102 = 0x30334152,
++	WL_DRM_FORMAT_BGRA1010102 = 0x30334142,
++	WL_DRM_FORMAT_YUYV = 0x56595559,
++	WL_DRM_FORMAT_YVYU = 0x55595659,
++	WL_DRM_FORMAT_UYVY = 0x59565955,
++	WL_DRM_FORMAT_VYUY = 0x59555956,
++	WL_DRM_FORMAT_AYUV = 0x56555941,
++	WL_DRM_FORMAT_NV12 = 0x3231564e,
++	WL_DRM_FORMAT_NV21 = 0x3132564e,
++	WL_DRM_FORMAT_NV16 = 0x3631564e,
++	WL_DRM_FORMAT_NV61 = 0x3136564e,
++	WL_DRM_FORMAT_YUV410 = 0x39565559,
++	WL_DRM_FORMAT_YVU410 = 0x39555659,
++	WL_DRM_FORMAT_YUV411 = 0x31315559,
++	WL_DRM_FORMAT_YVU411 = 0x31315659,
++	WL_DRM_FORMAT_YUV420 = 0x32315559,
++	WL_DRM_FORMAT_YVU420 = 0x32315659,
++	WL_DRM_FORMAT_YUV422 = 0x36315559,
++	WL_DRM_FORMAT_YVU422 = 0x36315659,
++	WL_DRM_FORMAT_YUV444 = 0x34325559,
++	WL_DRM_FORMAT_YVU444 = 0x34325659,
++};
++#endif /* WL_DRM_FORMAT_ENUM */
++
++struct wl_drm_listener {
++	/**
++	 * device - (none)
++	 * @name: (none)
++	 */
++	void (*device)(void *data,
++		       struct wl_drm *wl_drm,
++		       const char *name);
++	/**
++	 * format - (none)
++	 * @format: (none)
++	 */
++	void (*format)(void *data,
++		       struct wl_drm *wl_drm,
++		       uint32_t format);
++	/**
++	 * authenticated - (none)
++	 */
++	void (*authenticated)(void *data,
++			      struct wl_drm *wl_drm);
++};
++
++static inline int
++wl_drm_add_listener(struct wl_drm *wl_drm,
++		    const struct wl_drm_listener *listener, void *data)
++{
++	return wl_proxy_add_listener((struct wl_proxy *) wl_drm,
++				     (void (**)(void)) listener, data);
++}
++
++#define WL_DRM_AUTHENTICATE	0
++#define WL_DRM_CREATE_BUFFER	1
++#define WL_DRM_CREATE_PLANAR_BUFFER	2
++
++static inline void
++wl_drm_set_user_data(struct wl_drm *wl_drm, void *user_data)
++{
++	wl_proxy_set_user_data((struct wl_proxy *) wl_drm, user_data);
++}
++
++static inline void *
++wl_drm_get_user_data(struct wl_drm *wl_drm)
++{
++	return wl_proxy_get_user_data((struct wl_proxy *) wl_drm);
++}
++
++static inline void
++wl_drm_destroy(struct wl_drm *wl_drm)
++{
++	wl_proxy_destroy((struct wl_proxy *) wl_drm);
++}
++
++static inline void
++wl_drm_authenticate(struct wl_drm *wl_drm, uint32_t id)
++{
++	wl_proxy_marshal((struct wl_proxy *) wl_drm,
++			 WL_DRM_AUTHENTICATE, id);
++}
++
++static inline struct wl_buffer *
++wl_drm_create_buffer(struct wl_drm *wl_drm, uint32_t name, int32_t width, int32_t height, uint32_t stride, uint32_t format)
++{
++	struct wl_proxy *id;
++
++	id = wl_proxy_create((struct wl_proxy *) wl_drm,
++			     &wl_buffer_interface);
++	if (!id)
++		return NULL;
++
++	wl_proxy_marshal((struct wl_proxy *) wl_drm,
++			 WL_DRM_CREATE_BUFFER, id, name, width, height, stride, format);
++
++	return (struct wl_buffer *) id;
++}
++
++static inline struct wl_buffer *
++wl_drm_create_planar_buffer(struct wl_drm *wl_drm, uint32_t name, int32_t width, int32_t height, uint32_t format, int32_t offset0, int32_t stride0, int32_t offset1, int32_t stride1, int32_t offset2, int32_t stride2)
++{
++	struct wl_proxy *id;
++
++	id = wl_proxy_create((struct wl_proxy *) wl_drm,
++			     &wl_buffer_interface);
++	if (!id)
++		return NULL;
++
++	wl_proxy_marshal((struct wl_proxy *) wl_drm,
++			 WL_DRM_CREATE_PLANAR_BUFFER, id, name, width, height, format, offset0, stride0, offset1, stride1, offset2, stride2);
++
++	return (struct wl_buffer *) id;
++}
++
++#ifdef  __cplusplus
++}
++#endif
++
++#endif
+diff --git a/ext/wayland/wayland-drm-protocol.c b/ext/wayland/wayland-drm-protocol.c
+new file mode 100644
+index 0000000..939af53
+--- /dev/null
++++ b/ext/wayland/wayland-drm-protocol.c
+@@ -0,0 +1,74 @@
++/* 
++ * Copyright © 2008-2011 Kristian Høgsberg
++ * Copyright © 2010-2011 Intel Corporation
++ * 
++ * Permission to use, copy, modify, distribute, and sell this
++ * software and its documentation for any purpose is hereby granted
++ * without fee, provided that\n the above copyright notice appear in
++ * all copies and that both that copyright notice and this permission
++ * notice appear in supporting documentation, and that the name of
++ * the copyright holders not be used in advertising or publicity
++ * pertaining to distribution of the software without specific,
++ * written prior permission.  The copyright holders make no
++ * representations about the suitability of this software for any
++ * purpose.  It is provided "as is" without express or implied
++ * warranty.
++ * 
++ * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
++ * FITNESS, IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
++ * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
++ * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
++ * THIS SOFTWARE.
++ */
++
++#include <stdlib.h>
++#include <stdint.h>
++#include "wayland-util.h"
++
++#define ARRAY_LENGTH(a) (sizeof (a) /sizeof (a)[0])
++
++extern const struct wl_interface wl_buffer_interface;
++extern const struct wl_interface wl_buffer_interface;
++
++static const struct wl_interface *types[] = {
++	NULL,
++	&wl_buffer_interface,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	&wl_buffer_interface,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++	NULL,
++};
++
++static const struct wl_message wl_drm_requests[] = {
++	{ "authenticate", "u", types + 0 },
++	{ "create_buffer", "nuiiuu", types + 1 },
++	{ "create_planar_buffer", "nuiiuiiiiii", types + 7 },
++};
++
++static const struct wl_message wl_drm_events[] = {
++	{ "device", "s", types + 0 },
++	{ "format", "u", types + 0 },
++	{ "authenticated", "", types + 0 },
++};
++
++WL_EXPORT const struct wl_interface wl_drm_interface = {
++	"wl_drm", 1,
++	ARRAY_LENGTH(wl_drm_requests), wl_drm_requests,
++	ARRAY_LENGTH(wl_drm_events), wl_drm_events,
++};
++
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
new file mode 100644
index 0000000..8c19fa6
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
@@ -0,0 +1,1457 @@
+From efe7189ee13e78664bbe373c6fd890280c9dee50 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Fri, 12 Dec 2014 13:28:10 +0530
+Subject: [PATCH] Added KMSsink support
+
+---
+ configure.ac               |   12 +
+ sys/Makefile.am            |   10 +-
+ sys/kms/Makefile.am        |   29 +
+ sys/kms/gstdrmutils.c      |  292 +++++++++
+ sys/kms/gstdrmutils.h      |   40 ++
+ sys/kms/gstkmsbufferpriv.c |  124 ++++
+ sys/kms/gstkmsbufferpriv.h |   64 ++
+ sys/kms/gstkmssink.c       |  682 ++++++++++++++++++++++
+ sys/kms/gstkmssink.h       |   91 +++
+ 9 files changed, 1342 insertions(+), 2 deletions(-)
+ create mode 100644 sys/kms/Makefile.am
+ create mode 100644 sys/kms/gstdrmutils.c
+ create mode 100644 sys/kms/gstdrmutils.h
+ create mode 100644 sys/kms/gstkmsbufferpriv.c
+ create mode 100644 sys/kms/gstkmsbufferpriv.h
+ create mode 100644 sys/kms/gstkmssink.c
+ create mode 100644 sys/kms/gstkmssink.h
+
+diff --git a/configure.ac b/configure.ac
+index b94bd5d..8cdf972 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1400,6 +1400,16 @@ AG_GST_CHECK_FEATURE(KATE, [Kate], kate, [
+   AC_SUBST(TIGER_LIBS)
+ ],,,[AM_CONDITIONAL(USE_TIGER, false)])
+ 
++dnl *** kms ***
++translit(dnm, m, l) AM_CONDITIONAL(USE_KMS, true)
++AG_GST_CHECK_FEATURE(KMS, [kmssink], kms, [
++  PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=yes, HAVE_KMS=no)
++  PKG_CHECK_MODULES(LIBDCE, [libdce >= 1.0.0], HAVE_KMS=yes, HAVE_KMS=no)
++  AC_SUBST(DRM_CFLAGS)
++  AC_SUBST(DRM_LIBS)
++])
++
++
+ dnl *** ladspa ***
+ translit(dnm, m, l) AM_CONDITIONAL(USE_LADSPA, true)
+ AG_GST_CHECK_FEATURE(LADSPA, [ladspa], ladspa, [
+@@ -2212,6 +2222,7 @@ AM_CONDITIONAL(USE_GSM, false)
+ AM_CONDITIONAL(USE_HLS, false)
+ AM_CONDITIONAL(USE_KATE, false)
+ AM_CONDITIONAL(USE_TIGER, false)
++AM_CONDITIONAL(USE_KMS, false)
+ AM_CONDITIONAL(USE_LADSPA, false)
+ AM_CONDITIONAL(USE_LV2, false)
+ AM_CONDITIONAL(USE_LIBMMS, false)
+@@ -2439,6 +2450,7 @@ sys/osxvideo/Makefile
+ sys/qtwrapper/Makefile
+ sys/mfc/Makefile
+ sys/shm/Makefile
++sys/kms/Makefile
+ sys/uvch264/Makefile
+ sys/vcd/Makefile
+ sys/vdpau/Makefile
+diff --git a/sys/Makefile.am b/sys/Makefile.am
+index b1abda6..b87a1ca 100644
+--- a/sys/Makefile.am
++++ b/sys/Makefile.am
+@@ -106,6 +106,12 @@ else
+ PVR_DIR=
+ endif
+ 
++if USE_KMS
++KMS_DIR=kms
++else
++KMS_DIR=
++endif
++
+ if USE_SHM
+ SHM_DIR=shm
+ else
+@@ -166,9 +172,9 @@ else
+ MFC_DIR=
+ endif
+ 
+-SUBDIRS = $(ACM_DIR) $(ANDROID_MEDIA_DIR) $(APPLE_MEDIA_DIR) $(AVC_DIR) $(BLUEZ_DIR) $(D3DVIDEOSINK_DIR) $(DECKLINK_DIR) $(DIRECTDRAW_DIR) $(DIRECTSOUND_DIR) $(DIRECTSHOW_DIR) $(DVB_DIR) $(FBDEV_DIR) $(LINSYS_DIR) $(OPENSLES_DIR) $(OSX_VIDEO_DIR) $(PVR_DIR) $(QT_DIR) $(SHM_DIR) $(UVCH264_DIR) $(VCD_DIR) $(VDPAU_DIR) $(WININET_DIR) $(WINSCREENCAP_DIR) $(WASAPI_DIR) $(MFC_DIR)
++SUBDIRS = $(ACM_DIR) $(ANDROID_MEDIA_DIR) $(APPLE_MEDIA_DIR) $(AVC_DIR) $(BLUEZ_DIR) $(D3DVIDEOSINK_DIR) $(DECKLINK_DIR) $(DIRECTDRAW_DIR) $(DIRECTSOUND_DIR) $(DIRECTSHOW_DIR) $(DVB_DIR) $(FBDEV_DIR) $(LINSYS_DIR) $(OPENSLES_DIR) $(OSX_VIDEO_DIR) $(PVR_DIR) $(QT_DIR) $(KMS_DIR) $(SHM_DIR) $(UVCH264_DIR) $(VCD_DIR) $(VDPAU_DIR) $(WININET_DIR) $(WINSCREENCAP_DIR) $(WASAPI_DIR) $(MFC_DIR)
+ 
+ DIST_SUBDIRS = acmenc acmmp3dec androidmedia applemedia applemedia-nonpublic avc bluez d3dvideosink decklink directdraw directsound dvb linsys fbdev dshowdecwrapper dshowsrcwrapper dshowvideosink \
+-		opensles osxvideo pvr2d qtwrapper shm uvch264 vcd vdpau wasapi wininet winks winscreencap mfc
++		opensles osxvideo pvr2d qtwrapper kms shm uvch264 vcd vdpau wasapi wininet winks winscreencap mfc
+ 
+ include $(top_srcdir)/common/parallel-subdirs.mak
+diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am
+new file mode 100644
+index 0000000..035efef
+--- /dev/null
++++ b/sys/kms/Makefile.am
+@@ -0,0 +1,29 @@
++plugin_LTLIBRARIES = libgstkmssink.la
++
++libgstkmssink_la_SOURCES = \
++	gstkmssink.c \
++	gstkmsbufferpriv.c \
++	gstdrmutils.c
++
++libgstkmssink_la_CFLAGS = \
++	$(GST_PLUGINS_BAD_CFLAGS) \
++	$(GST_PLUGINS_BASE_CFLAGS) \
++	$(GST_BASE_CFLAGS) \
++	$(LIBDCE_CFLAGS) \
++	$(GST_CFLAGS) \
++	$(DRM_CFLAGS)
++
++libgstkmssink_la_LIBADD = \
++	$(GST_PLUGINS_BASE_LIBS) \
++	$(GST_BASE_LIBS) \
++	$(GST_LIBS) \
++	$(LIBDCE_LIBS) \
++	$(DRM_LIBS) \
++	-lgstvideo-$(GST_API_VERSION) \
++	-lgstdmabuf-$(GST_API_VERSION) \
++	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la
++
++libgstkmssink_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
++libgstkmssink_la_LIBTOOLFLAGS = --tag=disable-static
++
++noinst_HEADERS = gstkmssink.h gstdrmutils.h gstkmsbufferpriv.h
+diff --git a/sys/kms/gstdrmutils.c b/sys/kms/gstdrmutils.c
+new file mode 100644
+index 0000000..d7a8dd6
+--- /dev/null
++++ b/sys/kms/gstdrmutils.c
+@@ -0,0 +1,292 @@
++/* GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ */
++
++#include <gst/gst.h>
++#include "gstdrmutils.h"
++
++GST_DEBUG_CATEGORY_EXTERN (gst_debug_kms_sink);
++#define GST_CAT_DEFAULT gst_debug_kms_sink
++
++void
++gst_drm_connector_cleanup (int fd, struct connector *c)
++{
++  if (c->connector) {
++    drmModeFreeConnector (c->connector);
++    c->connector = NULL;
++  }
++  if (c->encoder) {
++    drmModeFreeEncoder (c->encoder);
++    c->encoder = NULL;
++  }
++  if (c->fb_id) {
++    drmModeRmFB (fd, c->fb_id);
++    c->fb_id = 0;
++  }
++  if (c->fb_bo) {
++    omap_bo_del (c->fb_bo);
++    c->fb_bo = NULL;
++  }
++}
++
++static gboolean
++gst_drm_connector_find_mode_and_plane_helper (int fd,
++    struct omap_device *dev, int width, int height,
++    drmModeRes * resources, drmModePlaneRes * plane_resources,
++    struct connector *c, drmModePlane ** out_plane)
++{
++  int i, best_area = 0, ret;
++
++  /* free old stuff: */
++  if (*out_plane) {             /* TODO maybe move into 'struct connector'?? */
++    drmModeFreePlane (*out_plane);
++    *out_plane = NULL;
++  }
++  gst_drm_connector_cleanup (fd, c);
++
++  /* First, find the connector & mode */
++  c->connector = drmModeGetConnector (fd, c->id);
++  if (!c->connector)
++    goto error_no_connector;
++
++  if (!c->connector->count_modes)
++    goto error_no_mode;
++
++  /* just look for the highest resolution: */
++  for (i = 0; i < c->connector->count_modes; i++) {
++    drmModeModeInfo *mode = &c->connector->modes[i];
++    int area = mode->hdisplay * mode->vdisplay;
++
++    if (area > best_area) {
++      c->mode = mode;
++      best_area = area;
++    }
++  }
++
++  if (c->mode == NULL) {
++    /* XXX: just pick the first available mode. Not sure this is correct... */
++    c->mode = &c->connector->modes[0];
++#if 0
++    goto error_no_mode;
++#endif
++  }
++
++  /* Now get the encoder */
++  c->encoder = drmModeGetEncoder (fd, c->connector->encoder_id);
++  if (!c->encoder)
++    goto error_no_encoder;
++
++  if (c->crtc == -1)
++    c->crtc = c->encoder->crtc_id;
++
++  /* and figure out which crtc index it is: */
++  c->pipe = -1;
++  for (i = 0; i < resources->count_crtcs; i++) {
++    if (c->crtc == (int) resources->crtcs[i]) {
++      c->pipe = i;
++      break;
++    }
++  }
++
++  if (c->pipe == -1)
++    goto error_no_crtc;
++
++  *out_plane = NULL;
++  for (i = 0; i < plane_resources->count_planes; i++) {
++    drmModePlane *plane = drmModeGetPlane (fd, plane_resources->planes[i]);
++    if (plane->possible_crtcs & (1 << c->pipe)) {
++      *out_plane = plane;
++      break;
++    }
++  }
++
++  if (*out_plane == NULL)
++    goto error_no_plane;
++
++  c->fb_bo = omap_bo_new (dev, best_area * 2, OMAP_BO_WC);
++  if (c->fb_bo) {
++    uint32_t fourcc = DRM_FORMAT_RGB565;
++    uint32_t handles[4] = { omap_bo_handle (c->fb_bo) };
++    uint32_t pitches[4] = { c->mode->hdisplay * 2 };
++    uint32_t offsets[4] = { 0 };
++    ret = drmModeAddFB2 (fd, c->mode->hdisplay, c->mode->vdisplay,
++        fourcc, handles, pitches, offsets, &c->fb_id, 0);
++    if (ret) {
++      /* TODO */
++    }
++  }
++
++  /* now set the desired mode: */
++  ret = drmModeSetCrtc (fd, c->crtc, c->fb_id, 0, 0, &c->id, 1, c->mode);
++  if (ret) {
++    /* TODO */
++  }
++
++  return TRUE;
++
++fail:
++  gst_drm_connector_cleanup (fd, c);
++
++  return FALSE;
++
++error_no_connector:
++  GST_DEBUG ("could not get connector %s", strerror (errno));
++  goto fail;
++
++error_no_mode:
++  GST_DEBUG ("could not find mode %dx%d (count_modes %d)",
++      width, height, c->connector->count_modes);
++  goto fail;
++
++error_no_encoder:
++  GST_DEBUG ("could not get encoder: %s", strerror (errno));
++  goto fail;
++
++error_no_crtc:
++  GST_DEBUG ("couldn't find a crtc");
++  goto fail;
++
++error_no_plane:
++  GST_DEBUG ("couldn't find a plane");
++  goto fail;
++}
++
++gboolean
++gst_drm_connector_find_mode_and_plane (int fd,
++    struct omap_device *dev, int width, int height,
++    drmModeRes * resources, drmModePlaneRes * plane_resources,
++    struct connector *c, drmModePlane ** out_plane)
++{
++  int i;
++  gboolean found = FALSE;
++
++  /* First, find the connector & mode */
++  if (c->id == 0) {
++    /* Any connector */
++    GST_DEBUG ("Any connector, %d available", resources->count_connectors);
++    for (i = 0; i < resources->count_connectors; i++) {
++      GST_DEBUG ("  %d", resources->connectors[i]);
++    }
++    for (i = 0; i < resources->count_connectors; i++) {
++      GST_DEBUG ("Trying connector %d: %d", i, resources->connectors[i]);
++      c->id = resources->connectors[i];
++      if (gst_drm_connector_find_mode_and_plane_helper (fd, dev, width, height,
++              resources, plane_resources, c, out_plane)) {
++        GST_DEBUG ("Found suitable connector");
++        found = TRUE;
++        break;
++      }
++      GST_DEBUG ("Connector not suitable");
++    }
++  } else {
++    /* A specific connector */
++    GST_DEBUG ("Connector %d", c->id);
++    found =
++        gst_drm_connector_find_mode_and_plane_helper (fd, dev, width, height,
++        resources, plane_resources, c, out_plane);
++  }
++
++  return found;
++}
++
++/* table nicked off libdrm's modetest.c */
++/* *INDENT-OFF* */
++static const struct {
++  int type_id;
++  const char *type_name;
++} connector_type_names[] = {
++  { DRM_MODE_CONNECTOR_Unknown, "unknown" },
++  { DRM_MODE_CONNECTOR_VGA, "VGA" },
++  { DRM_MODE_CONNECTOR_DVII, "DVI-I" },
++  { DRM_MODE_CONNECTOR_DVID, "DVI-D" },
++  { DRM_MODE_CONNECTOR_DVIA, "DVI-A" },
++  { DRM_MODE_CONNECTOR_Composite, "composite" },
++  { DRM_MODE_CONNECTOR_SVIDEO, "s-video" },
++  { DRM_MODE_CONNECTOR_LVDS, "LVDS" },
++  { DRM_MODE_CONNECTOR_Component, "component" },
++  { DRM_MODE_CONNECTOR_9PinDIN, "9-pin-DIN" },
++  { DRM_MODE_CONNECTOR_DisplayPort, "displayport" },
++  { DRM_MODE_CONNECTOR_HDMIA, "HDMI-A" },
++  { DRM_MODE_CONNECTOR_HDMIB, "HDMI-B" },
++  { DRM_MODE_CONNECTOR_TV, "TV" },
++  { DRM_MODE_CONNECTOR_eDP, "embedded-displayport" },
++};
++/* *INDENT-ON* */
++
++gboolean
++gst_drm_connector_find_mode_and_plane_by_name (int fd,
++    struct omap_device * dev, int width, int height,
++    drmModeRes * resources, drmModePlaneRes * plane_resources,
++    struct connector * c, const char *name, drmModePlane ** out_plane)
++{
++  int i, n;
++  char tmp[64];
++  const char *type_name;
++  int found[G_N_ELEMENTS (connector_type_names)] = { 0 };
++
++  /* Find connector from name */
++  for (i = 0; i < resources->count_connectors; i++) {
++    GST_DEBUG ("Trying connector %d: %d", i, resources->connectors[i]);
++    c->id = resources->connectors[i];
++    c->connector = drmModeGetConnector (fd, c->id);
++    if (!c->connector)
++      continue;
++
++    /* Find type name from this connector */
++    for (n = 0; n < G_N_ELEMENTS (connector_type_names); n++)
++      if (connector_type_names[n].type_id == c->connector->connector_type)
++        break;
++    if (n == G_N_ELEMENTS (connector_type_names))
++      continue;
++
++    type_name = connector_type_names[n].type_name;
++    GST_DEBUG ("Connector %d has type %s", i, type_name);
++    ++found[n];
++
++    drmModeFreeConnector (c->connector);
++    c->connector = NULL;
++
++    /* Try a few different matches, such as modetest and xrandr
++       output, and also a indexless one matching first found */
++    snprintf (tmp, sizeof (tmp), "%s-%u", type_name, found[n]);
++    if (!g_ascii_strcasecmp (tmp, name))
++      goto found;
++    snprintf (tmp, sizeof (tmp), "%s%u", type_name, found[n]);
++    if (!g_ascii_strcasecmp (tmp, name))
++      goto found;
++    if (!g_ascii_strcasecmp (name, type_name))
++      goto found;
++
++    continue;
++
++  found:
++    if (gst_drm_connector_find_mode_and_plane_helper (fd, dev, width, height,
++            resources, plane_resources, c, out_plane)) {
++      GST_DEBUG ("Found suitable connector");
++      return TRUE;
++    }
++    GST_DEBUG ("Connector not suitable");
++  }
++
++  return FALSE;
++}
+diff --git a/sys/kms/gstdrmutils.h b/sys/kms/gstdrmutils.h
+new file mode 100644
+index 0000000..053a245
+--- /dev/null
++++ b/sys/kms/gstdrmutils.h
+@@ -0,0 +1,40 @@
++#ifndef __GST_DRMUTILS_H__
++#define __GST_DRMUTILS_H__
++
++#include <stdio.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++#include <unistd.h>
++#include <assert.h>
++#include <xf86drmMode.h>
++#include <omap_drm.h>
++#include <omap_drmif.h>
++#include <drm_fourcc.h>
++#include <gst/gst.h>
++
++struct connector {
++	uint32_t id;
++	char mode_str[64];
++	drmModeConnector *connector;
++	drmModeModeInfo *mode;
++	drmModeEncoder *encoder;
++	uint32_t fb_id;
++	struct omap_bo *fb_bo;
++	int crtc;
++	int pipe;
++};
++
++void gst_drm_connector_cleanup (int fd, struct connector * c);
++gboolean gst_drm_connector_find_mode_and_plane (int fd,
++    struct omap_device * dev, int width, int height,
++    drmModeRes * resources, drmModePlaneRes * plane_resources,
++    struct connector *c, drmModePlane ** out_plane);
++gboolean gst_drm_connector_find_mode_and_plane_by_name (int fd,
++    struct omap_device *dev, int width, int height,
++    drmModeRes * resources, drmModePlaneRes * plane_resources,
++    struct connector *c, const char *name,
++    drmModePlane ** out_plane);
++
++#endif /* __GST_DRMUTILS_H__ */
+diff --git a/sys/kms/gstkmsbufferpriv.c b/sys/kms/gstkmsbufferpriv.c
+new file mode 100644
+index 0000000..ffa7e46
+--- /dev/null
++++ b/sys/kms/gstkmsbufferpriv.c
+@@ -0,0 +1,124 @@
++/*
++ * GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *  Rob Clark <rob.clark@linaro.org>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include <stdint.h>
++#include <gst/gst.h>
++#include <gst/dmabuf/dmabuf.h>
++
++#include <omap_drm.h>
++#include <omap_drmif.h>
++#include <xf86drmMode.h>
++
++#include "gstkmssink.h"
++#include "gstkmsbufferpriv.h"
++
++static int
++create_fb (GstKMSBufferPriv * priv, GstKMSSink * sink)
++{
++  /* TODO get format, etc from caps.. and query device for
++   * supported formats, and make this all more flexible to
++   * cope with various formats:
++   */
++  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
++
++  uint32_t handles[4] = {
++    omap_bo_handle (priv->bo), omap_bo_handle (priv->bo),
++  };
++  uint32_t pitches[4] = {
++    GST_ROUND_UP_4 (sink->input_width), GST_ROUND_UP_4 (sink->input_width),
++  };
++  uint32_t offsets[4] = {
++    0, pitches[0] * sink->input_height
++  };
++
++  return drmModeAddFB2 (priv->fd, sink->input_width, sink->input_height,
++      fourcc, handles, pitches, offsets, &priv->fb_id, 0);
++}
++
++/**
++ * gst_kms_buffer_priv:
++ * @sink: a #GstKMSSink
++ * @buf: a pointer to #GstBuffer
++ *
++ * Checks if the @buf has a GstMetaDmaBuf metadata set. If it doesn't we return a NULL
++ * indicating its not a dmabuf buffer. We maintain a hashtable with dmabuf fd as key and 
++ * the GstKMSBufferPriv structure as value
++ *
++ * Returns: the #GstKMSBufferPriv
++ *
++ * Since: 1.2.?
++ */
++GstKMSBufferPriv *
++gst_kms_buffer_priv (GstKMSSink * sink, GstBuffer * buf)
++{
++    GstMetaDmaBuf *dmabuf = gst_buffer_get_dma_buf_meta (buf);
++
++
++    struct omap_bo *bo;
++    int fd;
++    int fd_copy;
++    GstKMSBufferPriv * priv;
++
++    /* if it isn't a dmabuf buffer that we can import, then there
++     * is nothing we can do with it:
++     */
++   
++    if (!dmabuf) {
++      GST_DEBUG_OBJECT (sink, "not importing non dmabuf buffer");
++      return NULL;
++    }
++
++    fd_copy = gst_dma_buf_meta_get_fd (dmabuf);
++
++    /* lookup the hashtable with fd as key. If present return bo & buffer structure */
++    priv = g_hash_table_lookup (sink->kmsbufferpriv, (gpointer)fd_copy);
++    if(priv) {
++       return priv;
++     }
++
++    priv = g_malloc0 (sizeof (GstKMSBufferPriv));
++    bo = omap_bo_from_dmabuf (sink->dev, fd_copy);
++    fd = sink->fd;
++
++      priv->bo = bo;
++      priv->fd = fd;
++
++    if (create_fb (priv, sink)) {
++      GST_WARNING_OBJECT (sink, "could not create framebuffer: %s",
++          strerror (errno));
++      g_free(priv);
++      return NULL;
++    }
++
++    /* if fd not present, write to hash table fd and the corresponding priv. */
++    g_hash_table_insert(sink->kmsbufferpriv, (gpointer)fd_copy, priv); 
++   
++  
++  return priv;
++}
+diff --git a/sys/kms/gstkmsbufferpriv.h b/sys/kms/gstkmsbufferpriv.h
+new file mode 100644
+index 0000000..a1070da
+--- /dev/null
++++ b/sys/kms/gstkmsbufferpriv.h
+@@ -0,0 +1,64 @@
++/*
++ * GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *  Rob Clark <rob.clark@linaro.org>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
++ */
++
++#ifndef __GSTKMSBUFFERPRIV_H__
++#define __GSTKMSBUFFERPRIV_H__
++
++#include <stdint.h>
++#include <gst/gst.h>
++
++G_BEGIN_DECLS
++
++/*
++ * per-buffer private data so kmssink can attach a drm_framebuffer
++ * handle (fb_id) to a buffer, which gets deleted when the buffer
++ * is finalized
++ */
++
++#define GST_TYPE_KMS_BUFFER_PRIV      \
++  (gst_kms_buffer_priv_get_type ())
++#define GST_KMS_BUFFER_PRIV(obj)      \
++  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_KMS_BUFFER_PRIV, GstKMSBufferPriv))
++#define GST_IS_KMS_BUFFER_PRIV(obj)     \
++  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_KMS_BUFFER_PRIV))
++
++
++typedef struct
++{
++  struct omap_bo *bo;
++  int fd;
++  uint32_t fb_id;
++}GstKMSBufferPriv;
++
++
++GType gst_kms_buffer_priv_get_type (void);
++
++/* Returns a GstKMSBufferPriv, if it has a dmabuf fd metadata */
++GstKMSBufferPriv * gst_kms_buffer_priv (GstKMSSink *sink, GstBuffer * buf);
++
++G_END_DECLS
++
++
++#endif /* __GSTKMSBUFFERPRIV_H__ */
+diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
+new file mode 100644
+index 0000000..b9c9095
+--- /dev/null
++++ b/sys/kms/gstkmssink.c
+@@ -0,0 +1,682 @@
++/* GStreamer
++ * Copyright (C) 2012 Texas Instruments
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ */
++
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
++
++#include "gstkmssink.h"
++#include "gstkmsbufferpriv.h"
++
++#include <libdce.h>
++#include <omap_drm.h>
++#include <omap_drmif.h>
++#include <xf86drmMode.h>
++
++GST_DEBUG_CATEGORY (gst_debug_kms_sink);
++#define GST_CAT_DEFAULT gst_debug_kms_sink
++
++G_DEFINE_TYPE (GstKMSSink, gst_kms_sink, GST_TYPE_VIDEO_SINK);
++
++static void gst_kms_sink_reset (GstKMSSink * sink);
++
++static GstStaticPadTemplate gst_kms_sink_template_factory =
++GST_STATIC_PAD_TEMPLATE ("sink",
++    GST_PAD_SINK,
++    GST_PAD_ALWAYS,
++    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("NV12"))
++    );
++
++enum
++{
++  PROP_0,
++  PROP_PIXEL_ASPECT_RATIO,
++  PROP_FORCE_ASPECT_RATIO,
++  PROP_SCALE,
++  PROP_CONNECTOR,
++  PROP_CONNECTOR_NAME,
++};
++
++static inline void
++display_bufs_queue (GstKMSSink * sink, GstBuffer * buf)
++{
++  int i;
++  for (i = 0; i < (NUM_DISPLAY_BUFS - 1); i++)
++    gst_buffer_replace (&sink->display_bufs[i], sink->display_bufs[i + 1]);
++  gst_buffer_replace (&sink->display_bufs[i], buf);
++}
++
++static inline void
++display_bufs_free (GstKMSSink * sink)
++{
++  int i;
++  for (i = 0; i < NUM_DISPLAY_BUFS; i++)
++    gst_buffer_replace (&sink->display_bufs[i], NULL);
++}
++
++static gboolean
++gst_kms_sink_calculate_aspect_ratio (GstKMSSink * sink, gint width,
++    gint height, gint video_par_n, gint video_par_d)
++{
++  guint calculated_par_n;
++  guint calculated_par_d;
++
++  if (!gst_video_calculate_display_ratio (&calculated_par_n, &calculated_par_d,
++          width, height, video_par_n, video_par_d, 1, 1)) {
++    GST_ELEMENT_ERROR (sink, CORE, NEGOTIATION, (NULL),
++        ("Error calculating the output display ratio of the video."));
++    return FALSE;
++  }
++  GST_DEBUG_OBJECT (sink,
++      "video width/height: %dx%d, calculated display ratio: %d/%d",
++      width, height, calculated_par_n, calculated_par_d);
++
++  /* now find a width x height that respects this display ratio.
++   * prefer those that have one of w/h the same as the incoming video
++   * using wd / hd = calculated_pad_n / calculated_par_d */
++
++  /* start with same height, because of interlaced video */
++  /* check hd / calculated_par_d is an integer scale factor, and scale wd with the PAR */
++  if (height % calculated_par_d == 0) {
++    GST_DEBUG_OBJECT (sink, "keeping video height");
++    GST_VIDEO_SINK_WIDTH (sink) = (guint)
++        gst_util_uint64_scale_int (height, calculated_par_n, calculated_par_d);
++    GST_VIDEO_SINK_HEIGHT (sink) = height;
++  } else if (width % calculated_par_n == 0) {
++    GST_DEBUG_OBJECT (sink, "keeping video width");
++    GST_VIDEO_SINK_WIDTH (sink) = width;
++    GST_VIDEO_SINK_HEIGHT (sink) = (guint)
++        gst_util_uint64_scale_int (width, calculated_par_d, calculated_par_n);
++  } else {
++    GST_DEBUG_OBJECT (sink, "approximating while keeping video height");
++    GST_VIDEO_SINK_WIDTH (sink) = (guint)
++        gst_util_uint64_scale_int (height, calculated_par_n, calculated_par_d);
++    GST_VIDEO_SINK_HEIGHT (sink) = height;
++  }
++  GST_DEBUG_OBJECT (sink, "scaling to %dx%d",
++      GST_VIDEO_SINK_WIDTH (sink), GST_VIDEO_SINK_HEIGHT (sink));
++
++  return TRUE;
++}
++
++static gboolean
++gst_kms_sink_setcaps (GstBaseSink * bsink, GstCaps * caps)
++{
++  GstKMSSink *sink;
++  gboolean ret = TRUE;
++  gint width, height;
++  gint fps_n, fps_d;
++  gint par_n, par_d;
++  GstVideoFormat format;
++  GstVideoInfo info;
++
++  sink = GST_KMS_SINK (bsink);
++
++  ret = gst_video_info_from_caps (&info, caps);
++  format = GST_VIDEO_INFO_FORMAT(&info);
++  width = GST_VIDEO_INFO_WIDTH(&info);
++  height = GST_VIDEO_INFO_HEIGHT(&info);
++  fps_n = GST_VIDEO_INFO_FPS_N(&info);
++  fps_d = GST_VIDEO_INFO_FPS_D(&info);
++  par_n = GST_VIDEO_INFO_PAR_N(&info);
++  par_d = GST_VIDEO_INFO_PAR_D(&info);
++
++  if (!ret)
++    return FALSE;
++
++  if (width <= 0 || height <= 0) {
++    GST_ELEMENT_ERROR (sink, CORE, NEGOTIATION, (NULL),
++        ("Invalid image size."));
++    return FALSE;
++  }
++
++  sink->format = format;
++  sink->par_n = par_n;
++  sink->par_d = par_d;
++  sink->src_rect.x = sink->src_rect.y = 0;
++  sink->src_rect.w = width;
++  sink->src_rect.h = height;
++  sink->input_width = width;
++  sink->input_height = height;
++
++  if (!sink->pool || !gst_drm_buffer_pool_check_caps (sink->pool, caps)) {
++    int size;
++
++    if (sink->pool) {
++      gst_drm_buffer_pool_destroy (sink->pool);
++      sink->pool = NULL;
++    }
++
++    size = GST_VIDEO_INFO_SIZE(&info);
++    sink->pool = gst_drm_buffer_pool_new (GST_ELEMENT (sink),
++        sink->fd, caps, size);
++  }
++
++  sink->conn.crtc = -1;
++  sink->plane = NULL;
++
++  return TRUE;
++}
++
++static void
++gst_kms_sink_get_times (GstBaseSink * bsink, GstBuffer * buf,
++    GstClockTime * start, GstClockTime * end)
++{
++  GstKMSSink *sink;
++
++  sink = GST_KMS_SINK (bsink);
++
++  if (GST_BUFFER_PTS_IS_VALID (buf)) {
++    *start = GST_BUFFER_PTS (buf);
++    if (GST_BUFFER_DURATION_IS_VALID (buf)) {
++      *end = *start + GST_BUFFER_DURATION (buf);
++    } else {
++      if (sink->fps_n > 0) {
++        *end = *start +
++            gst_util_uint64_scale_int (GST_SECOND, sink->fps_d, sink->fps_n);
++      }
++    }
++  }
++}
++
++static GstFlowReturn
++gst_kms_sink_show_frame (GstVideoSink * vsink, GstBuffer * inbuf)
++{
++  GstKMSSink *sink = GST_KMS_SINK (vsink);
++  GstBuffer *buf = NULL;
++  GstKMSBufferPriv *priv;
++  GstFlowReturn flow_ret = GST_FLOW_OK;
++  int ret;
++  gint width, height;
++  GstVideoRectangle *c = &sink->src_rect;
++
++ GstVideoCropMeta* crop = gst_buffer_get_video_crop_meta (inbuf);
++ if (crop){
++  c->y = crop->y;
++  c->x = crop->x;
++
++ if (crop->width >= 0) {
++     width = crop->width;
++ }
++ else {
++     width = GST_VIDEO_SINK_WIDTH (sink);
++  }
++ if (crop->height >= 0){
++        height = crop->height;
++ }
++ else {
++        height = GST_VIDEO_SINK_HEIGHT (sink);
++  }
++}
++
++
++ c->w = width;
++ c->h = height;
++
++
++if (!gst_kms_sink_calculate_aspect_ratio (sink, width, height,
++              sink->par_n, sink->par_d))
++  GST_DEBUG_OBJECT (sink, "calculate aspect ratio failed");
++
++
++  GST_INFO_OBJECT (sink, "enter");
++
++  if (sink->conn.crtc == -1) {
++    GstVideoRectangle dest = { 0 };
++
++    if (sink->conn_name) {
++      if (!gst_drm_connector_find_mode_and_plane_by_name (sink->fd,
++              sink->dev, sink->src_rect.w, sink->src_rect.h,
++              sink->resources, sink->plane_resources, &sink->conn,
++              sink->conn_name, &sink->plane))
++        goto connector_not_found;
++    } else {
++      sink->conn.id = sink->conn_id;
++      if (!gst_drm_connector_find_mode_and_plane (sink->fd,
++              sink->dev, sink->src_rect.w, sink->src_rect.h,
++              sink->resources, sink->plane_resources, &sink->conn,
++              &sink->plane))
++        goto connector_not_found;
++    }
++
++    dest.w = sink->conn.mode->hdisplay;
++    dest.h = sink->conn.mode->vdisplay;
++    gst_video_sink_center_rect (sink->src_rect, dest, &sink->dst_rect,
++        sink->scale);
++  }
++
++  priv = gst_kms_buffer_priv (sink, inbuf);
++  if (priv) {
++    buf = gst_buffer_ref (inbuf);
++  } else {
++    GST_LOG_OBJECT (sink, "not a KMS buffer, slow-path!");
++    buf = gst_drm_buffer_pool_get (sink->pool, FALSE);
++    if (buf) {
++      GST_BUFFER_PTS (buf) = GST_BUFFER_PTS (inbuf);
++      GST_BUFFER_DURATION (buf) = GST_BUFFER_DURATION (inbuf);
++      gst_buffer_copy_into (buf, inbuf, GST_BUFFER_COPY_DEEP, 0 ,-1);
++      priv = gst_kms_buffer_priv (sink, buf);
++    }
++    if (!priv)
++      goto add_fb2_failed;
++  }
++
++  ret = drmModeSetPlane (sink->fd, sink->plane->plane_id,
++      sink->conn.crtc, priv->fb_id, 0,
++      sink->dst_rect.x, sink->dst_rect.y, sink->dst_rect.w, sink->dst_rect.h,
++      sink->src_rect.x << 16, sink->src_rect.y << 16,
++      sink->src_rect.w << 16, sink->src_rect.h << 16);
++  if (ret)
++    goto set_plane_failed;
++
++  display_bufs_queue (sink, buf);
++
++out:
++  GST_INFO_OBJECT (sink, "exit");
++  if (buf)
++    gst_buffer_unref (buf);
++  return flow_ret;
++
++add_fb2_failed:
++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
++      (NULL), ("drmModeAddFB2 failed: %s (%d)", strerror (errno), errno));
++  flow_ret = GST_FLOW_ERROR;
++  goto out;
++
++set_plane_failed:
++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
++      (NULL), ("drmModeSetPlane failed: %s (%d)", strerror (errno), errno));
++  flow_ret = GST_FLOW_ERROR;
++  goto out;
++
++connector_not_found:
++  GST_ELEMENT_ERROR (sink, RESOURCE, NOT_FOUND,
++      (NULL), ("connector not found", strerror (errno), errno));
++  goto out;
++}
++
++
++static gboolean
++gst_kms_sink_event (GstBaseSink * bsink, GstEvent * event)
++{
++  GstKMSSink *sink = GST_KMS_SINK (bsink);
++
++  switch (GST_EVENT_TYPE (event)) {
++    default:
++      break;
++  }
++  if (GST_BASE_SINK_CLASS (gst_kms_sink_parent_class)->event)
++    return GST_BASE_SINK_CLASS (gst_kms_sink_parent_class)->event (bsink,
++        event);
++  else
++    return TRUE;
++}
++
++static void
++gst_kms_sink_set_property (GObject * object, guint prop_id,
++    const GValue * value, GParamSpec * pspec)
++{
++  GstKMSSink *sink;
++
++  g_return_if_fail (GST_IS_KMS_SINK (object));
++
++  sink = GST_KMS_SINK (object);
++
++  switch (prop_id) {
++    case PROP_FORCE_ASPECT_RATIO:
++      sink->keep_aspect = g_value_get_boolean (value);
++      break;
++    case PROP_SCALE:
++      sink->scale = g_value_get_boolean (value);
++      break;
++    case PROP_CONNECTOR:
++      sink->conn_id = g_value_get_uint (value);
++      break;
++    case PROP_CONNECTOR_NAME:
++      g_free (sink->conn_name);
++      sink->conn_name = g_strdup (g_value_get_string (value));
++      break;
++    case PROP_PIXEL_ASPECT_RATIO:
++    {
++      GValue *tmp;
++
++      tmp = g_new0 (GValue, 1);
++      g_value_init (tmp, GST_TYPE_FRACTION);
++
++      if (!g_value_transform (value, tmp)) {
++        GST_WARNING_OBJECT (sink, "Could not transform string to aspect ratio");
++      } else {
++        sink->par_n = gst_value_get_fraction_numerator (tmp);
++        sink->par_d = gst_value_get_fraction_denominator (tmp);
++        GST_DEBUG_OBJECT (sink, "set PAR to %d/%d", sink->par_n, sink->par_d);
++      }
++      g_free (tmp);
++    }
++      break;
++    default:
++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
++      break;
++  }
++}
++
++static void
++gst_kms_sink_get_property (GObject * object, guint prop_id,
++    GValue * value, GParamSpec * pspec)
++{
++  GstKMSSink *sink;
++
++  g_return_if_fail (GST_IS_KMS_SINK (object));
++
++  sink = GST_KMS_SINK (object);
++
++  switch (prop_id) {
++    case PROP_FORCE_ASPECT_RATIO:
++      g_value_set_boolean (value, sink->keep_aspect);
++      break;
++    case PROP_SCALE:
++      g_value_set_boolean (value, sink->scale);
++      break;
++    case PROP_CONNECTOR:
++      g_value_set_uint (value, sink->conn.id);
++      break;
++    case PROP_PIXEL_ASPECT_RATIO:
++    {
++      char *v = g_strdup_printf ("%d/%d", sink->par_n, sink->par_d);
++      g_value_take_string (value, v);
++      break;
++    }
++    default:
++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
++      break;
++  }
++}
++
++static void
++gst_kms_sink_reset (GstKMSSink * sink)
++{
++  GST_DEBUG_OBJECT (sink, "reset");
++
++  if (sink->fd != -1) {
++    gst_drm_connector_cleanup (sink->fd, &sink->conn);
++  }
++  memset (&sink->conn, 0, sizeof (struct connector));
++
++  if (sink->pool) {
++    gst_drm_buffer_pool_destroy (sink->pool);
++    sink->pool = NULL;
++  }
++
++  if (sink->plane) {
++    drmModeFreePlane (sink->plane);
++    sink->plane = NULL;
++  }
++
++  if (sink->plane_resources) {
++    drmModeFreePlaneResources (sink->plane_resources);
++    sink->plane_resources = NULL;
++  }
++
++  if (sink->resources) {
++    drmModeFreeResources (sink->resources);
++    sink->resources = NULL;
++  }
++
++  display_bufs_free (sink);
++
++  if (sink->dev) {
++    dce_deinit (sink->dev);
++    sink->dev = NULL;
++    sink->fd = -1;
++  }
++
++  sink->par_n = sink->par_d = 1;
++  sink->src_rect.x = 0;
++  sink->src_rect.y = 0;
++  sink->src_rect.w = 0;
++  sink->src_rect.h = 0;
++  sink->input_width = 0;
++  sink->input_height = 0;
++  sink->format = GST_VIDEO_FORMAT_UNKNOWN;
++
++  memset (&sink->src_rect, 0, sizeof (GstVideoRectangle));
++  memset (&sink->dst_rect, 0, sizeof (GstVideoRectangle));
++}
++
++static gboolean
++gst_kms_sink_start (GstBaseSink * bsink)
++{
++  GstKMSSink *sink;
++
++  sink = GST_KMS_SINK (bsink);
++
++  sink->dev = dce_init ();
++  if (sink->dev == NULL)
++    goto device_failed;
++  else
++    sink->fd = dce_get_fd ();
++
++  sink->resources = drmModeGetResources (sink->fd);
++  if (sink->resources == NULL)
++    goto resources_failed;
++
++  sink->plane_resources = drmModeGetPlaneResources (sink->fd);
++  if (sink->plane_resources == NULL)
++    goto plane_resources_failed;
++
++  return TRUE;
++
++fail:
++  gst_kms_sink_reset (sink);
++  return FALSE;
++
++device_failed:
++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
++      (NULL), ("omap_device_new failed"));
++  goto fail;
++
++resources_failed:
++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
++      (NULL), ("drmModeGetResources failed: %s (%d)", strerror (errno), errno));
++  goto fail;
++
++plane_resources_failed:
++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
++      (NULL), ("drmModeGetPlaneResources failed: %s (%d)",
++          strerror (errno), errno));
++  goto fail;
++}
++
++static gboolean
++gst_kms_sink_stop (GstBaseSink * bsink)
++{
++  GstKMSSink *sink;
++
++  sink = GST_KMS_SINK (bsink);
++  gst_kms_sink_reset (sink);
++
++  return TRUE;
++}
++
++static GstFlowReturn
++gst_kms_sink_buffer_alloc (GstBaseSink * bsink, guint64 offset, guint size,
++    GstCaps * caps, GstBuffer ** buf)
++{
++  GstKMSSink *sink;
++  GstFlowReturn ret = GST_FLOW_OK;
++
++  sink = GST_KMS_SINK (bsink);
++
++  GST_DEBUG_OBJECT (sink, "begin");
++
++  if (G_UNLIKELY (!caps)) {
++    GST_WARNING_OBJECT (sink, "have no caps, doing fallback allocation");
++    *buf = NULL;
++    ret = GST_FLOW_OK;
++    goto beach;
++  }
++
++  GST_LOG_OBJECT (sink,
++      "a buffer of %d bytes was requested with caps %" GST_PTR_FORMAT
++      " and offset %" G_GUINT64_FORMAT, size, caps, offset);
++
++  /* initialize the buffer pool if not initialized yet */
++  if (G_UNLIKELY (!sink->pool || gst_drm_buffer_pool_size (sink->pool) != size)) {
++    GstVideoFormat format;
++    gint width, height;
++    GstVideoInfo info;
++
++    if (sink->pool) {
++      GST_INFO_OBJECT (sink, "in buffer alloc, pool->size != size");
++      gst_drm_buffer_pool_destroy (sink->pool);
++      sink->pool = NULL;
++    }
++
++    gst_video_info_from_caps (&info, caps);
++    format = GST_VIDEO_INFO_FORMAT(&info);
++    width = GST_VIDEO_INFO_WIDTH(&info);
++    height = GST_VIDEO_INFO_HEIGHT(&info);
++    size = GST_VIDEO_INFO_SIZE(&info);
++    sink->pool = gst_drm_buffer_pool_new (GST_ELEMENT (sink),
++        sink->fd, caps, size);
++  }
++  *buf = GST_BUFFER_CAST (gst_drm_buffer_pool_get (sink->pool, FALSE));
++
++beach:
++  return ret;
++}
++
++static void
++gst_kms_sink_finalize (GObject * object)
++{
++  GstKMSSink *sink;
++
++  sink = GST_KMS_SINK (object);
++  gst_kms_sink_reset (sink);
++  g_free (sink->conn_name);
++  if (sink->kmsbufferpriv){
++    g_hash_table_destroy (sink->kmsbufferpriv);
++    sink->kmsbufferpriv = NULL;
++}
++
++  G_OBJECT_CLASS (gst_kms_sink_parent_class)->finalize (object);
++}
++
++static void
++kmsbufferpriv_free_func (GstKMSBufferPriv *priv)
++{
++  drmModeRmFB (priv->fd, priv->fb_id);
++  omap_bo_del (priv->bo);
++  g_free(priv);
++}
++
++
++static void
++gst_kms_sink_init (GstKMSSink * sink)
++{
++  sink->fd = -1;
++  gst_kms_sink_reset (sink);
++  sink->kmsbufferpriv = g_hash_table_new_full (g_direct_hash, g_direct_equal,
++      NULL, (GDestroyNotify) kmsbufferpriv_free_func);
++}
++
++static void
++gst_kms_sink_class_init (GstKMSSinkClass * klass)
++{
++  GObjectClass *gobject_class;
++  GstElementClass *gstelement_class;
++  GstBaseSinkClass *gstbasesink_class;
++  GstVideoSinkClass *videosink_class;
++
++  gobject_class = (GObjectClass *) klass;
++  gstelement_class = (GstElementClass *) klass;
++  gstbasesink_class = (GstBaseSinkClass *) klass;
++  videosink_class = (GstVideoSinkClass *) klass;
++
++  gobject_class->finalize = gst_kms_sink_finalize;
++  gobject_class->set_property = gst_kms_sink_set_property;
++  gobject_class->get_property = gst_kms_sink_get_property;
++
++  g_object_class_install_property (gobject_class, PROP_FORCE_ASPECT_RATIO,
++      g_param_spec_boolean ("force-aspect-ratio", "Force aspect ratio",
++          "When enabled, reverse caps negotiation (scaling) will respect "
++          "original aspect ratio", FALSE,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++  g_object_class_install_property (gobject_class, PROP_PIXEL_ASPECT_RATIO,
++      g_param_spec_string ("pixel-aspect-ratio", "Pixel Aspect Ratio",
++          "The pixel aspect ratio of the device", "1/1",
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++  g_object_class_install_property (gobject_class, PROP_SCALE,
++      g_param_spec_boolean ("scale", "Scale",
++          "When true, scale to render fullscreen", FALSE,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++  g_object_class_install_property (gobject_class, PROP_CONNECTOR,
++      g_param_spec_uint ("connector", "Connector",
++          "DRM connector id (0 for automatic selection)", 0, G_MAXUINT32, 0,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS | G_PARAM_CONSTRUCT));
++  g_object_class_install_property (gobject_class, PROP_CONNECTOR_NAME,
++      g_param_spec_string ("connector-name", "Connector name",
++          "DRM connector name (alternative to the connector property, "
++          "use $type$index, $type-$index, or $type)", "",
++          G_PARAM_WRITABLE | G_PARAM_STATIC_STRINGS));
++
++  gst_element_class_set_details_simple (gstelement_class,
++      "Video sink", "Sink/Video",
++      "A video sink using the linux kernel mode setting API",
++      "Alessandro Decina <alessandro.d@gmail.com>");
++
++  gst_element_class_add_pad_template (gstelement_class,
++      gst_static_pad_template_get (&gst_kms_sink_template_factory));
++
++  gstbasesink_class->set_caps = GST_DEBUG_FUNCPTR (gst_kms_sink_setcaps);
++  gstbasesink_class->get_times = GST_DEBUG_FUNCPTR (gst_kms_sink_get_times);
++  gstbasesink_class->event = GST_DEBUG_FUNCPTR (gst_kms_sink_event);
++  gstbasesink_class->start = GST_DEBUG_FUNCPTR (gst_kms_sink_start);
++  gstbasesink_class->stop = GST_DEBUG_FUNCPTR (gst_kms_sink_stop);
++
++  /* disable preroll as it's called before GST_CROP_EVENT has been received, so
++   * we end up configuring the wrong mode... (based on padded caps)
++   */
++  gstbasesink_class->preroll = NULL;
++  videosink_class->show_frame = GST_DEBUG_FUNCPTR (gst_kms_sink_show_frame);
++}
++
++static gboolean
++plugin_init (GstPlugin * plugin)
++{
++  if (!gst_element_register (plugin, "kmssink",
++          GST_RANK_PRIMARY + 1, GST_TYPE_KMS_SINK))
++    return FALSE;
++
++  GST_DEBUG_CATEGORY_INIT (gst_debug_kms_sink, "kmssink", 0, "kmssink element");
++
++  return TRUE;
++}
++
++GST_PLUGIN_DEFINE (GST_VERSION_MAJOR,
++    GST_VERSION_MINOR,
++    kms,
++    "KMS video output element",
++    plugin_init, VERSION, GST_LICENSE, GST_PACKAGE_NAME, GST_PACKAGE_ORIGIN)
+diff --git a/sys/kms/gstkmssink.h b/sys/kms/gstkmssink.h
+new file mode 100644
+index 0000000..6c312bb
+--- /dev/null
++++ b/sys/kms/gstkmssink.h
+@@ -0,0 +1,91 @@
++/* GStreamer
++ *
++ * Copyright (C) 2012 Texas Instruments 
++ * Copyright (C) 2012 Collabora Ltd
++ *
++ * Authors:
++ *  Alessandro Decina <alessandro.decina@collabora.co.uk>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Library General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Library General Public License for more details.
++ *
++ * You should have received a copy of the GNU Library General Public
++ * License along with this library; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 02111-1307, USA.
++ */
++
++#ifndef __GST_KMS_SINK_H__
++#define __GST_KMS_SINK_H__
++
++#include <gst/video/video.h>
++#include <gst/video/gstvideosink.h>
++#include <gst/drm/gstdrmbufferpool.h>
++
++#include <stdio.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++#include <unistd.h>
++#include <assert.h>
++
++#include "gstdrmutils.h"
++
++G_BEGIN_DECLS
++#define GST_TYPE_KMS_SINK \
++  (gst_kms_sink_get_type())
++#define GST_KMS_SINK(obj) \
++  (G_TYPE_CHECK_INSTANCE_CAST((obj), GST_TYPE_KMS_SINK, GstKMSSink))
++#define GST_KMS_SINK_CLASS(klass) \
++  (G_TYPE_CHECK_CLASS_CAST((klass), GST_TYPE_KMS_SINK, GstKMSSinkClass))
++#define GST_IS_KMS_SINK(obj) \
++  (G_TYPE_CHECK_INSTANCE_TYPE((obj), GST_TYPE_KMS_SINK))
++#define GST_IS_KMS_SINK_CLASS(klass) \
++  (G_TYPE_CHECK_CLASS_TYPE((klass), GST_TYPE_KMS_SINK))
++typedef struct _GstKMSSink GstKMSSink;
++typedef struct _GstKMSSinkClass GstKMSSinkClass;
++
++#define NUM_DISPLAY_BUFS 4
++
++struct _GstKMSSink
++{
++  GstVideoSink videosink;
++  gint input_width, input_height;
++  GstVideoFormat format;
++  gint par_n, par_d;
++  gint fps_n, fps_d;
++  gboolean keep_aspect;
++  GstVideoRectangle src_rect;
++  GstVideoRectangle dst_rect;
++  int fd;
++  struct omap_device *dev;
++  drmModeRes *resources;
++  drmModePlaneRes *plane_resources;
++  struct connector conn;
++  uint32_t conn_id;
++  char *conn_name;
++  drmModePlane *plane;
++  GstDRMBufferPool *pool;
++  GHashTable *kmsbufferpriv;
++  /* current displayed buffer and last displayed buffer: */
++  GstBuffer *display_bufs[NUM_DISPLAY_BUFS];
++  gboolean scale;
++};
++
++struct _GstKMSSinkClass
++{
++  GstVideoSinkClass parent_class;
++};
++
++GType gst_kms_sink_get_type (void);
++
++G_END_DECLS
++#endif /* __GST_KMS_SINK_H__ */
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
new file mode 100644
index 0000000..8c2e887
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
@@ -0,0 +1,26 @@
+From dbaac14600fd88988aa676634849b137376de397 Mon Sep 17 00:00:00 2001
+From: Karthik Ramanan <a0393906@ti.com>
+Date: Thu, 15 Jan 2015 12:47:31 +0530
+Subject: [PATCH] waylandsink: Removed dependency on dri2
+
+Signed-off-by: Karthik Ramanan <a0393906@ti.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3db68f..2741824 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1219,7 +1219,7 @@ AG_GST_CHECK_FEATURE(DIRECTFB, [directfb], dfbvideosink , [
+ dnl **** Wayland ****
+ translit(dnm, m, l) AM_CONDITIONAL(USE_WAYLAND, true)
+ AG_GST_CHECK_FEATURE(WAYLAND, [wayland sink], wayland , [
+-  PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.0.0 dri2 libdrm libdrm_omap, [
++  PKG_CHECK_MODULES(WAYLAND, wayland-client >= 1.0.0 libdrm libdrm_omap, [
+      AC_SUBST(DRM_CFLAGS)
+      AC_SUBST(DRM_LIBS)
+      HAVE_WAYLAND="yes" ], [ HAVE_WAYLAND="no"
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
new file mode 100644
index 0000000..8ae79b5
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
@@ -0,0 +1,54 @@
+From 7083e7ee50130bf41a0ec0d1634577d4bf9ef9cf Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Wed, 4 Feb 2015 18:12:58 +0530
+Subject: [PATCH] vc1parse and jpegparse : Fixes plugin ranks
+
+Fix plugin ranks so that they are picked by playbin
+---
+ gst/jpegformat/gstjpegformat.c |    2 +-
+ gst/jpegformat/gstjpegparse.c  |    2 +-
+ gst/videoparsers/plugin.c      |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gst/jpegformat/gstjpegformat.c b/gst/jpegformat/gstjpegformat.c
+index b410466..ecb9311 100644
+--- a/gst/jpegformat/gstjpegformat.c
++++ b/gst/jpegformat/gstjpegformat.c
+@@ -30,7 +30,7 @@
+ static gboolean
+ plugin_init (GstPlugin * plugin)
+ {
+-  if (!gst_element_register (plugin, "jpegparse", GST_RANK_NONE,
++  if (!gst_element_register (plugin, "jpegparse", GST_RANK_PRIMARY + 2,
+           GST_TYPE_JPEG_PARSE))
+     return FALSE;
+   if (!gst_element_register (plugin, "jifmux", GST_RANK_SECONDARY,
+diff --git a/gst/jpegformat/gstjpegparse.c b/gst/jpegformat/gstjpegparse.c
+index 9983f32..04d5b91 100644
+--- a/gst/jpegformat/gstjpegparse.c
++++ b/gst/jpegformat/gstjpegparse.c
+@@ -156,7 +156,7 @@ gst_jpeg_parse_class_init (GstJpegParseClass * klass)
+ 
+   gst_element_class_set_static_metadata (gstelement_class,
+       "JPEG stream parser",
+-      "Video/Parser",
++      "Codec/Parser/Video",
+       "Parse JPEG images into single-frame buffers",
+       "Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>");
+ 
+diff --git a/gst/videoparsers/plugin.c b/gst/videoparsers/plugin.c
+index 485b0ed..a85550c 100644
+--- a/gst/videoparsers/plugin.c
++++ b/gst/videoparsers/plugin.c
+@@ -48,7 +48,7 @@ plugin_init (GstPlugin * plugin)
+   ret |= gst_element_register (plugin, "pngparse",
+       GST_RANK_PRIMARY, GST_TYPE_PNG_PARSE);
+   ret |= gst_element_register (plugin, "vc1parse",
+-      GST_RANK_NONE, GST_TYPE_VC1_PARSE);
++      GST_RANK_PRIMARY + 2, GST_TYPE_VC1_PARSE);
+ 
+   return ret;
+ }
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
new file mode 100644
index 0000000..77e8b16
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
@@ -0,0 +1,12 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PACKAGECONFIG = "faad wayland"
+
+SRC_URI_append = " \
+        file://0001-Added-GstDRMBufferPool-support.patch \
+        file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
+        file://0003-Added-KMSsink-support.patch \
+        file://0004-waylandsink-Removed-dependency-on-dri2.patch \
+        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
+
+PR = "r9"
-- 
1.7.9.5


