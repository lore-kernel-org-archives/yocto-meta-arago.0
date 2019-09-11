Return-Path: <angelabaker@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4DA69520E2
	for <meta-arago@arago-project.org>;
	Wed, 11 Sep 2019 17:15:57 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BHEplv126538
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2019 12:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568222091;
	bh=jQQF6Eh7JHPmtEICcqrmMq0+ossGPBoqV4xhepxpplw=;
	h=From:To:CC:Subject:Date;
	b=JT9tNClyVV7crjO6OHsSdcxh6GH0lF1FdEGjYwrKOx0CFKetZHF5XzwkCPsx8ukf2
	7q1jaY/VhNxGfh9fTqCN8dX7AUjDQ22bPOatdBauYHuGt1nAsG6qx6g9w/GaJr0eQt
	nlMoxC5u4tvcN3KGw8DZPfGmB2hQXN3LMQ18ICmw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BHEp6Q085374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 11 Sep 2019 12:14:51 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 11 Sep 2019 12:14:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 11 Sep 2019 12:14:51 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BHEp05114856;
	Wed, 11 Sep 2019 12:14:51 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8BHEoZ25862; Wed, 11 Sep 2019 12:14:51 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Sep 2019 12:14:28 -0500
Message-ID: <1568222068-26699-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH v2] gstreamer1.0*-bad: waylandsink updates for k3 for drm buffers
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
X-List-Received-Date: Wed, 11 Sep 2019 17:15:57 -0000
Content-Type: text/plain

Few changes were needed to support HW decoder (v4l2videodec)
plugin striding and creation for drm buffers.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---

Changes in v2: Added missing "Upstream-Status" to patches

 ...-re-order-buffer-creation-for-drm-buffers.patch | 49 ++++++++++++++++++++++
 ...ink-Update-wldrm-NV12-offsets-and-strides.patch | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.14.4.bbappend       |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
new file mode 100644
index 0000000..18578a0
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
@@ -0,0 +1,49 @@
+From 6b57ad06b973cc8ad8263021a4060ac544b107fd Mon Sep 17 00:00:00 2001
+From: Angela Stegmaier <angelabaker@ti.com>
+Date: Wed, 7 Aug 2019 09:32:16 -0500
+Subject: [PATCH 1/2] waylandsink: re-order buffer creation for drm buffers
+
+We should first try to create the wl_buffer using drm api, and
+then only if it fails, try dmabuf and shm apis. This patch fixes
+the ordering so that the redundant creation does not happen.
+
+Upstream-Status: Pending
+
+Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
+---
+ ext/wayland/gstwaylandsink.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 19ecf4d..470e9d2 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -772,7 +772,13 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+       "display, creating it", buffer);
+ 
+   format = GST_VIDEO_INFO_FORMAT (&sink->video_info);
+-  if (gst_wl_display_check_format_for_dmabuf (sink->display, format)) {
++
++  if (gst_is_drm_memory (mem)) {
++     wbuf = gst_wl_drm_memory_construct_wl_buffer (mem, sink->display,
++         &sink->video_info);
++  }
++
++  if (!wbuf && gst_wl_display_check_format_for_dmabuf (sink->display, format)) {
+     guint i, nb_dmabuf = 0;
+ 
+     for (i = 0; i < gst_buffer_n_memory (buffer); i++)
+@@ -783,10 +789,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+       wbuf = gst_wl_linux_dmabuf_construct_wl_buffer (buffer, sink->display,
+           &sink->video_info);
+   }
+-  if (gst_is_drm_memory (mem)) {
+-     wbuf = gst_wl_drm_memory_construct_wl_buffer (mem, sink->display,
+-         &sink->video_info);
+-  }
+ 
+   if (!wbuf && gst_wl_display_check_format_for_shm (sink->display, format)) {
+     if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
new file mode 100644
index 0000000..ac9d57a
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
@@ -0,0 +1,44 @@
+From a801af7ec1744ea7b8edc4350e8fb0a23289e9c9 Mon Sep 17 00:00:00 2001
+From: Angela Stegmaier <angelabaker@ti.com>
+Date: Wed, 7 Aug 2019 09:42:09 -0500
+Subject: [PATCH 2/2] waylandsink: Update wldrm NV12 offsets and strides
+
+Stride may not be the same as width, as the wldrm was assuming.
+Update the NV12 offset and stride calculation to use the actual
+values from the video metadata.
+
+Upstream-Status: Pending
+
+Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
+---
+ ext/wayland/wldrm.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/ext/wayland/wldrm.c b/ext/wayland/wldrm.c
+index 9aca9d5..0b72896 100644
+--- a/ext/wayland/wldrm.c
++++ b/ext/wayland/wldrm.c
+@@ -38,7 +38,10 @@ gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
+   {
+     /* NV12 */
+     fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
+-    strides[1] = GST_ROUND_UP_4 (video_width);
++    strides[0] = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
++    strides[1] = GST_VIDEO_INFO_PLANE_STRIDE (info, 1);
++    offsets[0] = GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++    offsets[1] = GST_VIDEO_INFO_PLANE_OFFSET (info, 1);
+   }
+   else if(format == GST_VIDEO_FORMAT_I420)
+   {
+@@ -92,7 +95,7 @@ gst_wl_drm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
+     return NULL;
+   }
+ 
+-  req2.handle = req1.handle,
++  req2.handle = req1.handle;
+ 
+   ret = drmIoctl(display->fd, DRM_IOCTL_GEM_FLINK, &req2);
+   if (ret) {
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
index 70f5f9b..38f7e63 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
@@ -51,6 +51,8 @@ SRC_URI_append_k3 = " \
     file://0003-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch \
+    file://0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch \
+    file://0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


