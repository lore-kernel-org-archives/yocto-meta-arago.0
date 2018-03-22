Return-Path: <x0038811@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8A3DE529D5
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:06:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M46v7Y024798
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691617;
	bh=IVTQCC+Wzxs/5vaYnbdBZ68HzGzOYdYxKhzbcSxFNAM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FC8NzhXf1f7aE7BK2dX8l3Wxy8jPTHDKicMKYI913QJYjfH/3nB6a9XSwtqDtFBXU
	5TN1gOg5wd9jj6AUkwjeKUKOGgiKFprNbLUK4EiG7U9XSFUJ3ElSkaCBuw7UwGJ+4m
	zRfMjCMZ9WCDMOr4eY0Y9aHsJYaMRa8VYzIforQg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46vA2014253
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:06:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:06:56 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAP028035;
	Wed, 21 Mar 2018 23:06:55 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:41 +0530
Message-ID: <1521691605-49259-6-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 5/9] gstreamer1.0*-bad: Enable kmssink with gst 1.12
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
X-List-Received-Date: Thu, 22 Mar 2018 04:06:59 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...Add-omapdrm-in-the-list-of-driver-modules.patch | 165 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   5 +-
 2 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
new file mode 100644
index 0000000..2e4965c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch
@@ -0,0 +1,165 @@
+From 4ef13bc433d218f2ebcbe2e9b7853d10d7b9acbc Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Tue, 6 Mar 2018 19:02:20 +0530
+Subject: [PATCH 3/5] kmssink: Add omapdrm in the list of driver modules
+
+In gstreamer-bad v1.12.2 kmssink plugin is available
+but omapdrm driver is not added in the list of driver
+module.
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
+index d19e19e..028bec6 100644
+--- a/sys/kms/gstkmssink.c
++++ b/sys/kms/gstkmssink.c
+@@ -85,7 +85,8 @@ static int
+ kms_open (gchar ** driver)
+ {
+   static const char *drivers[] = { "i915", "radeon", "nouveau", "vmwgfx",
+-    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm"
++    "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm",
++    "omapdrm"
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
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
index 437689f..f99b81d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bbappend
@@ -1,6 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGECONFIG = "faad"
+PACKAGECONFIG = "kms"
 
 # gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
 PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
@@ -22,6 +23,7 @@ DEPENDS_append_ti33x = " \
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
 "
 
 SRC_URI_append_ti33x = " \
@@ -30,8 +32,9 @@ SRC_URI_append_ti33x = " \
 SRC_URI_append_omap-a15 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0003-kmssink-Add-omapdrm-in-the-list-of-driver-modules.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r2"
+PR = "r3"
-- 
1.9.1


