Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8C7EB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 08:50:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.13655.1686819014784041980
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 01:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gxMOZAQi;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-mantena@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35F8oALC103292;
	Thu, 15 Jun 2023 03:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686819010;
	bh=5x1RCwBCDPTYdT6TbHC8U7ieJs8WM5ZYicKk2cSP9eA=;
	h=From:To:CC:Subject:Date;
	b=gxMOZAQibyz9+MAbJnEoxmMH2OSmwMqyFpLr1/Jr0ihZEQXLbvkWrN1RdNZuJPa0m
	 m5vv0WXmENI0tKSic/U78siAAskB2i5TOCHCWOH2E337f761TylS9LwtMHvyGqSt+D
	 GkbdXk6LhsNBjejlIetdk7pX6qbuU9HAKQ2fzvKA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35F8oAr3017982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 03:50:10 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 03:50:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 03:50:10 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35F8o9JM029350;
	Thu, 15 Jun 2023 03:50:09 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <denis@denix.org>,
        <r-ravikumar@ti.com>, <p-mantena@ti.com>, <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH] receipes-multimedia: gstreamer: Add gstreamer patches
Date: Thu, 15 Jun 2023 14:20:07 +0530
Message-ID: <20230615085007.4569-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jun 2023 08:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14635

The specified gstreamer patches are needed to default the format for non
multiplanar formats as preference. Added handling of v4l2 buffer flags
in the plugin code. These patches are needed for working of dmabuf
import on the J721S2 and J784S4 which codec does not support dynamic
register of dma buffers.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
 ...l2-Changes-for-DMA-Buf-import-j721s2.patch | 139 ++++++++++++++++++
 ...ence-to-contiguous-format-if-support.patch |  51 +++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend |  18 +++
 3 files changed, 208 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
new file mode 100644
index 00000000..45ad91ee
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -0,0 +1,139 @@
+From b46a76bc1010aee88828eddcb4b3da01ce710b27 Mon Sep 17 00:00:00 2001
+From: Prasanth Babu Mantena <p-mantena@ti.com>
+Date: Wed, 7 Jun 2023 18:24:55 +0530
+Subject: [PATCH] v4l2: Changes for DMA Buf import j721s2
+
+Add checks to release the buffer to downstream pool when returned with
+error flag from the driver. This buffer which registered with driver is
+used a an offset buffer without any new allocation in downstram pool.
+
+Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
+---
+ sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
+ sys/v4l2/gstv4l2bufferpool.h |  2 ++
+ sys/v4l2/gstv4l2object.c     |  4 ++--
+ sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
+ 4 files changed, 32 insertions(+), 11 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
+index d85f036..e6a60dc 100644
+--- a/sys/v4l2/gstv4l2bufferpool.c
++++ b/sys/v4l2/gstv4l2bufferpool.c
+@@ -83,7 +83,7 @@ enum _GstV4l2BufferState
+ static void gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
+     GstBuffer * buffer, gboolean queued);
+ 
+-static gboolean
++gboolean
+ gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group)
+ {
+   GstMemory *mem = gst_buffer_peek_memory (buffer, 0);
+@@ -1638,11 +1638,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
+             gst_v4l2_allocator_reset_group (pool->vallocator, group);
+             /* queue back in the device */
+             if (pool->other_pool)
+-              ret = gst_v4l2_buffer_pool_prepare_buffer (pool, buffer, NULL);
+-            if (ret != GST_FLOW_OK ||
++	    {
++	      if(!(group->buffer.flags & V4L2_BUF_FLAG_ERROR))
++	              ret = gst_v4l2_buffer_pool_prepare_buffer (pool, buffer, NULL);
++	    }
++            if(!(group->buffer.flags & V4L2_BUF_FLAG_ERROR)) {
++	    if (ret != GST_FLOW_OK ||
+                 gst_v4l2_buffer_pool_qbuf (pool, buffer, group,
+                     NULL) != GST_FLOW_OK)
+               pclass->release_buffer (bpool, buffer);
++	    }
++	    else
++	    {
++                GST_BUFFER_FLAG_SET (buffer, GST_BUFFER_FLAG_TAG_MEMORY);
++                pclass->release_buffer (bpool, buffer);
++
++	    }
+           } else {
+             /* Simply release invalid/modified buffer, the allocator will
+              * give it back later */
+diff --git a/sys/v4l2/gstv4l2bufferpool.h b/sys/v4l2/gstv4l2bufferpool.h
+index 60340c2..cec4207 100644
+--- a/sys/v4l2/gstv4l2bufferpool.h
++++ b/sys/v4l2/gstv4l2bufferpool.h
+@@ -124,6 +124,8 @@ gboolean            gst_v4l2_buffer_pool_orphan  (GstV4l2Object * v4l2object);
+ 
+ void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2BufferPool *self);
+ 
++gboolean            gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group);
++
+ G_END_DECLS
+ 
+ #endif /*__GST_V4L2_BUFFER_POOL_H__ */
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index ee60540..e9026da 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -5040,7 +5040,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+   } else {
+     /* In this case we'll have to configure two buffer pool. For our buffer
+      * pool, we'll need what the driver one, and one more, so we can dequeu */
+-    own_min = obj->min_buffers + 1;
++    own_min = obj->min_buffers + 2;
+     own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
+ 
+     /* for the downstream pool, we keep what downstream wants, though ensure
+@@ -5050,7 +5050,7 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
+ 
+     /* To import we need the other pool to hold at least own_min */
+     if (obj_pool == pool)
+-      min += own_min;
++      min = own_min;
+   }
+ 
+   /* Request a bigger max, if one was suggested but it's too small */
+diff --git a/sys/v4l2/gstv4l2videodec.c b/sys/v4l2/gstv4l2videodec.c
+index 3042995..0e4ac09 100644
+--- a/sys/v4l2/gstv4l2videodec.c
++++ b/sys/v4l2/gstv4l2videodec.c
+@@ -536,6 +536,8 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
+   GstVideoCodecFrame *frame;
+   GstBuffer *buffer = NULL;
+   GstFlowReturn ret;
++  GstV4l2MemoryGroup *group;
++  int buffer_valid=0;
+ 
+   GST_LOG_OBJECT (decoder, "Allocate output buffer");
+ 
+@@ -558,6 +560,7 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
+ 
+     if (ret != GST_FLOW_OK)
+       goto beach;
++    buffer_valid = gst_v4l2_is_buffer_valid (buffer, &group);
+ 
+     GST_LOG_OBJECT (decoder, "Process output buffer");
+     {
+@@ -602,13 +605,18 @@ gst_v4l2_video_dec_loop (GstVideoDecoder * decoder)
+     if (oldest_frame)
+       gst_video_codec_frame_unref (oldest_frame);
+ 
+-    frame->duration = self->v4l2capture->duration;
+-    frame->output_buffer = buffer;
+-    buffer = NULL;
+-    ret = gst_video_decoder_finish_frame (decoder, frame);
++    if(!(buffer_valid && (group->buffer.flags & V4L2_BUF_FLAG_ERROR))) {
++	       frame->duration = self->v4l2capture->duration;
++               frame->output_buffer = buffer;
++               buffer = NULL;
++               ret = gst_video_decoder_finish_frame (decoder, frame);
++               if (ret != GST_FLOW_OK)
++                       goto beach;
++       }
++       else {
++               gst_buffer_unref (buffer);
++       }
+ 
+-    if (ret != GST_FLOW_OK)
+-      goto beach;
+   } else {
+     GST_WARNING_OBJECT (decoder, "Decoder is producing too many buffers");
+     gst_buffer_unref (buffer);
+-- 
+2.39.0
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
new file mode 100644
index 00000000..d41a61c7
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2-Give-preference-to-contiguous-format-if-support.patch
@@ -0,0 +1,51 @@
+From 0238a430b19e5302dc924321225a3e24778bd2b0 Mon Sep 17 00:00:00 2001
+From: Devarsh Thakkar <devarsht@xilinx.com>
+Date: Fri, 9 Mar 2018 10:30:47 -0800
+Subject: [PATCH] v4l2: Give preference to contiguous format if supported
+
+Currently gstreamer uses single format GST_VIDEO_FORMAT_NV12 for both
+NV12 (which uses single contiguous buffer for luma and chroma)
+and NV12M (uses two non-contiguous buffers for luma and chroma )
+and if device supports both NV12M and NV12 then it gives preference
+to NV12M over NV12.
+
+The logic to give preference to NV12 before NV12M whenever GST_VIDEO_FORMAT_NV12
+is set.
+
+Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
+Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index e9026da..ad9f630 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -1930,17 +1930,17 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
+   }
+ 
+ 
+-  /* Prefer the non-contiguous if supported */
+-  v4l2object->prefered_non_contiguous = TRUE;
++  /* Prefer the contiguous if supported */
++  v4l2object->prefered_non_contiguous = FALSE;
+ 
+-  if (fourcc_nc)
+-    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
++  if (fourcc)
++    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
+   else if (fourcc == 0)
+     goto unhandled_format;
+ 
+   if (fmt == NULL) {
+-    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
+-    v4l2object->prefered_non_contiguous = FALSE;
++    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
++    v4l2object->prefered_non_contiguous = TRUE;
+   }
+ 
+   if (fmt == NULL)
+-- 
+2.39.0
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
new file mode 100644
index 00000000..1c4c8515
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
@@ -0,0 +1,18 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI:append:j721s2 = " \
+    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+"
+
+SRC_URI:append:j784s4 = " \
+    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+"
+
+SRC_URI:append:am62axx = " \
+    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
+    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
+"
+
+PR:append = ".arago0"
-- 
2.39.0


