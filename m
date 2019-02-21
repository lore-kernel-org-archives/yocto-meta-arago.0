Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C04A252A35
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2019 09:18:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1L9IjCf018360
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550740725;
	bh=6FijaC7Esx8eL80xXqz5vknWNljzeLIh3I+przx0KD4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ysHZVd0HvLbg5vzPtoH57040EcYV7vI/WML6OCkpasdsmKj1DIPDNP5vHQO0UNKgk
	LD37QhJrAP8ffN/aqkDWwo08++ndJHF8fT3IPudW3X40q+s6mfnbPMcZJ9lSbxcxQN
	wRZ2A+VK9JRsqJwm4Bw9YTx/hnq9gZBkL9zVkLno=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1L9IjIp080360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:45 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 21 Feb 2019 03:18:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 21 Feb 2019 03:18:45 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1L9IdpH009115;
	Thu, 21 Feb 2019 03:18:44 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Feb 2019 14:48:18 +0530
Message-ID: <1550740703-19443-4-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550740703-19443-1-git-send-email-x0038811@ti.com>
References: <1550740703-19443-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 3/8] gstreamer1.0*-bad: Enable kmssink with gst 1.14.4
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
X-List-Received-Date: Thu, 21 Feb 2019 09:18:48 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...-omapdrm-and-tidss-in-the-list-of-drivers.patch | 162 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.14.4.bbappend       |   8 +-
 2 files changed, 166 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
new file mode 100644
index 0000000..1a770ca
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
@@ -0,0 +1,162 @@
+From 2b80419b8c90523cf4cbe273f71bfc37d5fc2754 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Mon, 28 Jan 2019 13:45:08 +0530
+Subject: [PATCH 3/5] kmssink: Add omapdrm and tidss in the list of drivers
+
+In gstreamer-bad v1.14.4 kmssink plugin is available
+but omapdrm and tidss drivers are not added in the
+list of driver modules.
+
+DRM and DMABUF are treated differently by gstreamer
+eventhough they are based on fd allocator.
+GST1.14 has many changes to dmabuf allocator and
+hence DRM and DMABUF will be treated differently.
+
+Added support for DRM buffer importing. Without
+this addition, there will be frame-copy happens and
+slows down the playback.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ sys/kms/Makefile.am  |  1 +
+ sys/kms/gstkmssink.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 97 insertions(+), 1 deletion(-)
+
+diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am
+index f13ccc5..b4eab3a 100644
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
+index 1331883..f8f5b8a 100644
+--- a/sys/kms/gstkmssink.c
++++ b/sys/kms/gstkmssink.c
+@@ -169,7 +169,7 @@ kms_open (gchar ** driver)
+   static const char *drivers[] = { "i915", "radeon", "nouveau", "vmwgfx",
+     "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm",
+     "xlnx", "vc4", "meson", "sun4i-drm", "mxsfb-drm",
+-    "xilinx_drm",               /* DEPRECATED. Replaced by xlnx */
++    "xilinx_drm", "omapdrm", "tidss",               /* DEPRECATED. Replaced by xlnx */
+   };
+   int i, fd = -1;
+ 
+@@ -1201,7 +1201,99 @@ event_failed:
+     return FALSE;
+   }
+ }
++ static gboolean
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
++  kmsmem = (GstKMSMemory *) gst_kms_allocator_get_cached (mems[0]);
++  if (kmsmem) {
++    GST_LOG_OBJECT (self, "found KMS mem %p in DMABuf mem %p with fb id = %d",
++        kmsmem, mems[0], kmsmem->fb_id);
++    goto wrap_mem;
++  }
++
++  for (i = 0; i < n_planes; i++)
++    prime_fds[i] = gst_fd_memory_get_fd (mems[i]);
+ 
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
++  gst_kms_allocator_cache (self->allocator, mems[0], GST_MEMORY_CAST (kmsmem));
++
++wrap_mem:
++  *outbuf = gst_buffer_new ();
++  if (!*outbuf)
++    return FALSE;
++  gst_buffer_append_memory (*outbuf, gst_memory_ref (GST_MEMORY_CAST (kmsmem)));
++  gst_buffer_add_parent_buffer_meta (*outbuf, inbuf);
++
++  return TRUE;
++}
+ static gboolean
+ gst_kms_sink_import_dmabuf (GstKMSSink * self, GstBuffer * inbuf,
+     GstBuffer ** outbuf)
+@@ -1375,6 +1467,9 @@ gst_kms_sink_get_input_buffer (GstKMSSink * self, GstBuffer * inbuf)
+   if (gst_is_kms_memory (mem))
+     return gst_buffer_ref (inbuf);
+ 
++  if (gst_kms_sink_import_drmbuf (self, inbuf, &buf))
++    goto done;
++
+   if (gst_kms_sink_import_dmabuf (self, inbuf, &buf))
+     goto done;
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
index ce3a134..aa6d5fb 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
@@ -25,34 +25,34 @@ DEPENDS_append_k3 = " \
     libdrm \
 "
 
-#    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch \
 #    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
 #    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_ti43x = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
 "
 
 SRC_URI_append_ti33x = " \
     file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
 "
 
-#    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch \
 #    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
 #    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_omap-a15 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
 "
 
-#    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-driver-.patch \
 #    file://0004-waylandsink-Add-drm-support-in-waylandsink.patch
 #    file://0005-waylandsink-Add-input-device-support.patch
 SRC_URI_append_k3 = " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
     file://0002-parsers-bug-fixes-on-parsers.patch \
+    file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r8"
+PR = "r9"
-- 
1.9.1


