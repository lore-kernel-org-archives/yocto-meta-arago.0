Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A16A8529D8
	for <meta-arago@arago-project.org>;
	Mon, 25 Sep 2017 15:58:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8PFwGsl009889
	for <meta-arago@arago-project.org>; Mon, 25 Sep 2017 10:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506355096;
	bh=WvAdhabAYmq4uJzuhy1XQD4fUX4YxkyIjG/owlAATkg=;
	h=From:To:CC:Subject:Date;
	b=AqjZwKc1FWWfNesW7E6zBfgSOG8u4y5uqCevBOPs53QMHRAzzEV16E4Iv8t48Hvid
	WLeztZARynTLKl2r7ja5n9cJVsItiUWUvmAVBdvs3YkVx3gOB6xV4eWrwqtSD4Gn3y
	kC2CvmU0PJCTSStcGlE5sKttMDUOkm1KzXD8pWUU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PFwG52005632
	for <meta-arago@arago-project.org>; Mon, 25 Sep 2017 10:58:16 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 25 Sep 2017 10:58:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 25 Sep 2017 10:58:16 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PFwEmH009086;
	Mon, 25 Sep 2017 10:58:15 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Sep 2017 21:28:12 +0530
Message-ID: <1506355092-186743-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] gst1.0-plugins-bad: Fix scaling with padded video
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
X-List-Received-Date: Mon, 25 Sep 2017 15:58:16 -0000
Content-Type: text/plain

Along with this bug fix, the patches that were part of the
recipe have now been merged. The fix was introduced on top
of these patches.

Bumping the SRCREV and cleaning up the private patches

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...waylandsink-add-input-format-I420-support.patch | 89 --------------------
 .../0001-kmssink-remove-DCE-dependencies.patch     | 96 ----------------------
 .../0002-kmssink-add-YUYV-support.patch            | 81 ------------------
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        | 12 +--
 4 files changed, 3 insertions(+), 275 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
deleted file mode 100644
index c4bf4b1..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstwaylandsink-add-input-format-I420-support.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 4d04ea92f196b9e0880917cf029a95c9ebef0ea9 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 22 Feb 2017 10:49:01 -0500
-Subject: [PATCH] gstwaylandsink: add input format I420 support
-
-The software-based video decoder produces the output in I420 format. To display
-the output without additional ARM MHz consumed in video format conversion,
-the function gst_wl_memory_construct_wl_buffer is enhanced to support I420 format.
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- ext/wayland/wldrm.c | 41 ++++++++++++++++++++++++++++++++++-------
- 1 file changed, 34 insertions(+), 7 deletions(-)
-
-diff --git a/ext/wayland/wldrm.c b/ext/wayland/wldrm.c
-index 8f2c393..cb2b0f2 100644
---- a/ext/wayland/wldrm.c
-+++ b/ext/wayland/wldrm.c
-@@ -5,33 +5,60 @@
- #include <omap_drmif.h>
- #include <wayland-client.h>
- 
-+GST_DEBUG_CATEGORY_EXTERN (gstwayland_debug);
-+#define GST_CAT_DEFAULT gstwayland_debug
-+
-+
- struct wl_buffer *
- gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
-     const GstVideoInfo * info)
- {
-   gint video_width = GST_VIDEO_INFO_WIDTH (info);
-   gint video_height = GST_VIDEO_INFO_HEIGHT (info);
-+  GstVideoFormat format = GST_VIDEO_INFO_FORMAT (info);
-   int fd = -1;
-   struct omap_bo *bo;
-   struct wl_buffer *buffer;
--
--  /* TODO get format, etc from caps.. and query device for
--   * supported formats, and make this all more flexible to
--   * cope with various formats:
--   */
--  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
-+  uint32_t fourcc;
-   uint32_t name;
-   /* note: wayland and mesa use the terminology:
-    *    stride - rowstride in bytes
-    *    pitch  - rowstride in pixels
-    */
-   uint32_t strides[3] = {
--    GST_ROUND_UP_4 (video_width), GST_ROUND_UP_4 (video_width), 0,
-+    GST_ROUND_UP_4 (video_width), 0, 0,
-   };
-   uint32_t offsets[3] = {
-     0, strides[0] * video_height, 0
-   };
- 
-+  if (format == GST_VIDEO_FORMAT_NV12)
-+  {
-+    /* NV12 */
-+    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
-+    strides[1] = GST_ROUND_UP_4 (video_width);
-+  }
-+  else if(format == GST_VIDEO_FORMAT_I420)
-+  {
-+    /* YUV420 */
-+    fourcc = GST_MAKE_FOURCC ('Y', 'U', '1', '2');
-+    strides[1] = strides[2] = GST_ROUND_UP_4 (video_width/2);
-+    offsets[2] = offsets[1] + strides[1] * video_height/2;
-+  }
-+  else
-+  {
-+
-+    GST_DEBUG ("Unsupported video format: %d", format);
-+    /*
-+     * There are two xRGB frames with width and height = 1 required in the begining of a video stream.
-+     * If we consider them as errot, then it will case libwayland-clent.so crashes
-+     * due to invalid error handling.
-+     * Consider them as NV12 until we can figure out a better solution
-+     */
-+    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
-+    strides[1] = GST_ROUND_UP_4 (video_width);
-+  }
-+
-   fd = gst_fd_memory_get_fd (mem);
- 
-   if (fd < 0 ) {
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
deleted file mode 100644
index e050e08..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-kmssink-remove-DCE-dependencies.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 6b04eb39296caec717d310872c1f0acfa85c5ae7 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 15 Mar 2017 09:08:13 -0400
-Subject: [PATCH 1/2] kmssink: remove DCE dependencies
-
-Replace DCE related API calls to libdrm and omapdrm API calls
-to decouple DCE from kmssink
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- configure.ac         |  1 -
- sys/kms/Makefile.am  |  2 --
- sys/kms/gstkmssink.c | 17 +++++++++++++----
- 3 files changed, 13 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2e0d1f3..2b1ecaa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2119,7 +2119,6 @@ dnl *** kms ***
- translit(dnm, m, l) AM_CONDITIONAL(USE_KMS, true)
- AG_GST_CHECK_FEATURE(KMS, [kmssink], kms, [
-   PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=yes, HAVE_KMS=no)
--  PKG_CHECK_MODULES(LIBDCE, [libdce >= 1.0.0], HAVE_KMS=yes, HAVE_KMS=no)
-   AC_SUBST(DRM_CFLAGS)
-   AC_SUBST(DRM_LIBS)
- ])
-diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am
-index 6d56073..cc7353e 100644
---- a/sys/kms/Makefile.am
-+++ b/sys/kms/Makefile.am
-@@ -9,7 +9,6 @@ libgstkmssink_la_CFLAGS = \
- 	$(GST_PLUGINS_BAD_CFLAGS) \
- 	$(GST_PLUGINS_BASE_CFLAGS) \
- 	$(GST_BASE_CFLAGS) \
--	$(LIBDCE_CFLAGS) \
- 	$(GST_CFLAGS) \
- 	$(DRM_CFLAGS)
- 
-@@ -17,7 +16,6 @@ libgstkmssink_la_LIBADD = \
- 	$(GST_PLUGINS_BASE_LIBS) \
- 	$(GST_BASE_LIBS) \
- 	$(GST_LIBS) \
--	$(LIBDCE_LIBS) \
- 	$(DRM_LIBS) \
- 	-lgstvideo-$(GST_API_VERSION) \
- 	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la
-diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
-index 17e6407..9795bdf 100644
---- a/sys/kms/gstkmssink.c
-+++ b/sys/kms/gstkmssink.c
-@@ -31,7 +31,6 @@
- #include "gstkmssink.h"
- #include "gstkmsbufferpriv.h"
- 
--#include <libdce.h>
- #include <omap_drm.h>
- #include <omap_drmif.h>
- #include <xf86drmMode.h>
-@@ -516,13 +515,18 @@ gst_kms_sink_start (GstBaseSink * bsink)
- 
-   sink = GST_KMS_SINK (bsink);
- 
--  drm_dev = dce_init ();
-+  drm_fd = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
-+  if(drm_fd == NULL)
-+    goto drm_failed;
-+  else {
-+    drm_dev = omap_device_new(drm_fd);
-+  }
-+
-   if (drm_dev == NULL)
-     goto device_failed;
-   else {
-+    sink->fd = drm_fd;
-     sink->dev = drm_dev;
--    sink->fd = dce_get_fd ();
--    drm_fd = dce_get_fd ();
-   }
- 
-   sink->resources = drmModeGetResources (sink->fd);
-@@ -539,6 +543,11 @@ fail:
-   gst_kms_sink_reset (sink);
-   return FALSE;
- 
-+drm_failed:
-+  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
-+      (NULL), ("drmOpen failed"));
-+  goto fail;
-+
- device_failed:
-   GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
-       (NULL), ("omap_device_new failed"));
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
deleted file mode 100644
index a5791cc..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From af348c890c04ce9626d411055aae0974f410219f Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 14 Mar 2017 17:24:07 -0400
-Subject: [PATCH 2/2] kmssink: add YUYV support
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- sys/kms/gstkmsbufferpriv.c | 32 +++++++++++++++++++++++++++-----
- sys/kms/gstkmssink.c       |  2 +-
- 2 files changed, 28 insertions(+), 6 deletions(-)
-
-diff --git a/sys/kms/gstkmsbufferpriv.c b/sys/kms/gstkmsbufferpriv.c
-index 172a4c3..57c01f8 100644
---- a/sys/kms/gstkmsbufferpriv.c
-+++ b/sys/kms/gstkmsbufferpriv.c
-@@ -41,22 +41,44 @@
- static int
- create_fb (GstKMSBufferPriv * priv, GstKMSSink * sink)
- {
-+
-   /* TODO get format, etc from caps.. and query device for
-    * supported formats, and make this all more flexible to
-    * cope with various formats:
-    */
--  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
--
-+  GstVideoFormat format = sink->format;
-+  uint32_t fourcc;
-   uint32_t handles[4] = {
--    omap_bo_handle (priv->bo), omap_bo_handle (priv->bo),
-+    omap_bo_handle (priv->bo),
-   };
-   uint32_t pitches[4] = {
--    GST_ROUND_UP_4 (sink->input_width), GST_ROUND_UP_4 (sink->input_width),
-+    GST_ROUND_UP_4 (sink->input_width),
-   };
-   uint32_t offsets[4] = {
--    0, pitches[0] * sink->input_height
-+    0,
-   };
- 
-+  /**
-+   * Only two formats are supported:
-+   * AM3/4: YUYV
-+   * AM5: NV12, YUYV
-+   */
-+  if(format == GST_VIDEO_FORMAT_YUY2)
-+  {
-+    /* YUYV */
-+    fourcc = GST_MAKE_FOURCC ('Y', 'U', 'Y', 'V');
-+    pitches[0] = GST_ROUND_UP_4 (sink->input_width*2);
-+  }
-+  else
-+  {
-+    /* NV12 */
-+    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
-+    handles[1] = omap_bo_handle (priv->bo);
-+    pitches[1] = GST_ROUND_UP_4 (sink->input_width);
-+    offsets[1] = pitches[0] * sink->input_height;
-+  }
-+
-+
-   return drmModeAddFB2 (priv->fd, sink->input_width, sink->input_height,
-       fourcc, handles, pitches, offsets, &priv->fb_id, 0);
- }
-diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
-index 9795bdf..b36d88f 100644
---- a/sys/kms/gstkmssink.c
-+++ b/sys/kms/gstkmssink.c
-@@ -50,7 +50,7 @@ static GstStaticPadTemplate gst_kms_sink_template_factory =
- GST_STATIC_PAD_TEMPLATE ("sink",
-     GST_PAD_SINK,
-     GST_PAD_ALWAYS,
--    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("NV12"))
-+    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("{NV12,YUY2}"))
-     );
- 
- enum
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index f82507f..f732a02 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -20,15 +20,9 @@ DEPENDS_append_ti33x = " \
 "
 
 SRC_URI_append_omap-a15 = " \
-    file://0001-kmssink-remove-DCE-dependencies.patch \
-    file://0002-kmssink-add-YUYV-support.patch \
-    file://0001-gstwaylandsink-add-input-format-I420-support.patch \
 "
 
 SRC_URI_append_ti43x = " \
-    file://0001-kmssink-remove-DCE-dependencies.patch \
-    file://0002-kmssink-add-YUYV-support.patch \
-    file://0001-gstwaylandsink-add-input-format-I420-support.patch \
 "
 
 SRC_URI_append_ti33x = " \
@@ -44,8 +38,8 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
 
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
-SRCREV_ti43x = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
+SRCREV_omap-a15 = "3a5a7f778b3c3259faab04748e7b10f0fd696aab"
+SRCREV_ti43x = "3a5a7f778b3c3259faab04748e7b10f0fd696aab"
 SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
 
-PR = "r25"
+PR = "r27"
-- 
1.9.1


