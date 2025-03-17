Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06B1C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:52:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.59559.1742233921414173425
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 10:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oCdphhMq;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-brnich@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HHq0t52841404
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 12:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742233920;
	bh=53wDahdHB+OyV3yzxInMrtoSe5ZbbnTcqdIlqJXfa6E=;
	h=From:To:CC:Subject:Date;
	b=oCdphhMqb2542OGomAt3HBc4b/GdjMmbQXOq6sxpbcmddFmo2VIUXkeGuLGx3Xyvv
	 Q9xrgrETvWCYwT1perPwI+h6lkDRpU6ogR0479sfdoX5vzKkTlSV9i30ST2gomf3Dm
	 6xZ3DfUc4JDIEcAGEiu5KGWJPmu85pNdNt33agX8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HHq0v3025101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 12:52:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 12:52:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 12:52:00 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HHq0jb073430;
	Mon, 17 Mar 2025 12:52:00 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        Darren
 Etheridge <detheridge@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2] gstreamer1.0-plugins-good: Add Patch to Support Cropping for JPEG Encoder
Date: Mon, 17 Mar 2025 12:52:00 -0500
Message-ID: <20250317175200.699949-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 17:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16056

The E5010 JPEG Encoder found on TI's am62a has the ability to only
encode a specific region using the V4L2 S_SELECTION IOCTL. This control
allows a cropping rectangle to be set where anything outside that region
will be ignored. Gstreamer did not have support for cropping.

This patch adds support at the gstreamer level by exposing a crop-bounds
control for the v4l2jpegenc element and updating the format accordingly
if a crop rectangle is being requested.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

V1 -> V2:
  - Rebase on scarthgap-wip
  - Add to all machines for consistency

Some example pipelines used for validation:

gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw, width=640, height=480, format=NV12 ! v4l2jpegenc 'crop-bounds=<400,80,240,400>' ! filesink location=small.jpeg

gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw, width=640, height=480, format=NV12 ! v4l2jpegenc 'crop-bounds=<100,40,540,440>' ! filesink location=medium.jpeg

gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw, width=640, height=480, format=NV12 ! v4l2jpegenc 'crop-bounds=<0,0,540,440>' ! filesink location=top_corner.jpeg

 ...support-for-cropping-in-JPEG-Encoder.patch | 287 ++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22-arago.inc  |   1 +
 2 files changed, 288 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch
new file mode 100644
index 00000000..c761314e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch
@@ -0,0 +1,287 @@
+From c997f3ee027da932cd8626dd50e86b9085c56b23 Mon Sep 17 00:00:00 2001
+From: Brandon Brnich <b-brnich@ti.com>
+Date: Mon, 10 Mar 2025 15:25:51 +0000
+Subject: [PATCH] v4l2jpegenc: Add support for cropping in JPEG Encoder
+
+V4L2 exposes control that allows users to set a cropping rectangle. This
+rectangle can be used to encode a specific region of interest.
+
+Add property to v4l2jpegenc to customize the region and update
+set_format function accordingly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Brandon Brnich <b-brnich@ti.com>
+---
+ sys/v4l2/gstv4l2jpegenc.c                 | 204 +++++++++++++++++-
+ sys/v4l2/gstv4l2jpegenc.h                 |   4 +
+ 2 files changed, 206 insertions(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2jpegenc.c b/sys/v4l2/gstv4l2jpegenc.c
+index eee7a67da5..43f76ec9f3 100644
+--- a/sys/v4l2/gstv4l2jpegenc.c
++++ b/sys/v4l2/gstv4l2jpegenc.c
+@@ -46,24 +46,210 @@ enum
+ {
+   PROP_0,
+   V4L2_STD_OBJECT_PROPS,
++  PROP_CROP_BOUNDS,
++  PROP_LAST
+   /* TODO */
+ };
+
+ #define gst_v4l2_jpeg_enc_parent_class parent_class
+ G_DEFINE_TYPE (GstV4l2JPEGEnc, gst_v4l2_jpeg_enc, GST_TYPE_V4L2_VIDEO_ENC);
+
++static void
++gst_v4l2_jpeg_enc_set_rect_value (GValue * value, struct v4l2_rect *rect)
++{
++  GValue val = { 0 };
++
++  g_value_init (&val, G_TYPE_INT);
++  g_value_reset (value);
++
++  g_value_set_int (&val, rect->left);
++  gst_value_array_append_value (value, &val);
++
++  g_value_set_int (&val, rect->top);
++  gst_value_array_append_value (value, &val);
++
++  g_value_set_int (&val, rect->width);
++  gst_value_array_append_value (value, &val);
++
++  g_value_set_int (&val, rect->height);
++  gst_value_array_append_value (value, &val);
++
++  g_value_unset (&val);
++}
++
+ static void
+ gst_v4l2_jpeg_enc_set_property (GObject * object,
+     guint prop_id, const GValue * value, GParamSpec * pspec)
+ {
+-  /* TODO */
++  GstV4l2JPEGEnc *v4l2jpegenc = GST_V4L2_JPEG_ENC (object);
++
++  if (!gst_v4l2_object_set_property_helper (v4l2jpegenc->parent.v4l2output,
++          prop_id, value, pspec)) {
++    switch (prop_id) {
++      case PROP_CROP_BOUNDS:
++        v4l2jpegenc->crop_bounds.left = g_value_get_int (gst_value_array_get_value (value, 0));
++        v4l2jpegenc->crop_bounds.top = g_value_get_int (gst_value_array_get_value (value, 1));
++        v4l2jpegenc->crop_bounds.width = g_value_get_int (gst_value_array_get_value (value, 2));
++        v4l2jpegenc->crop_bounds.height = g_value_get_int (gst_value_array_get_value (value, 3));
++        v4l2jpegenc->apply_crop_settings = TRUE;
++        break;
++      default:
++        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
++        break;
++    }
++  }
+ }
+
+ static void
+ gst_v4l2_jpeg_enc_get_property (GObject * object,
+     guint prop_id, GValue * value, GParamSpec * pspec)
+ {
+-  /* TODO */
++  GstV4l2JPEGEnc *v4l2jpegenc = GST_V4L2_JPEG_ENC (object);
++  guint i = 0;
++
++  if (!gst_v4l2_object_get_property_helper (v4l2jpegenc->parent.v4l2output,
++          prop_id, value, pspec)) {
++    switch (prop_id) {
++      case PROP_CROP_BOUNDS:
++        gst_v4l2_jpeg_enc_set_rect_value (value, &v4l2jpegenc->crop_bounds);
++        for (i = 0; i < gst_value_array_get_size (value); i++) {
++          GST_DEBUG_OBJECT(object, "entry %i is %i", i, gst_value_array_get_value (value, i));
++        }
++        break;
++      default:
++        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
++        break;
++    }
++  }
++
++}
++
++static gboolean
++gst_v4l2_encoder_cmd (GstV4l2Object * v4l2object, guint cmd, guint flags)
++{
++  struct v4l2_encoder_cmd ecmd = { 0, };
++
++  GST_DEBUG_OBJECT (v4l2object->element,
++      "sending v4l2 encoder command %u with flags %u", cmd, flags);
++
++  if (!GST_V4L2_IS_OPEN (v4l2object))
++    return FALSE;
++
++  ecmd.cmd = cmd;
++  ecmd.flags = flags;
++  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_ENCODER_CMD, &ecmd) < 0)
++    goto ecmd_failed;
++
++  return TRUE;
++
++ecmd_failed:
++  if (errno == ENOTTY) {
++    GST_INFO_OBJECT (v4l2object->element,
++        "Failed to send encoder command %u with flags %u for '%s'. (%s)",
++        cmd, flags, v4l2object->videodev, g_strerror (errno));
++  } else {
++    GST_ERROR_OBJECT (v4l2object->element,
++        "Failed to send encoder command %u with flags %u for '%s'. (%s)",
++        cmd, flags, v4l2object->videodev, g_strerror (errno));
++  }
++  return FALSE;
++}
++
++static GstFlowReturn
++gst_v4l2_video_enc_finish (GstVideoEncoder * encoder)
++{
++  GstV4l2VideoEnc *self = GST_V4L2_VIDEO_ENC (encoder);
++  GstFlowReturn ret = GST_FLOW_OK;
++
++  if (gst_pad_get_task_state (encoder->srcpad) != GST_TASK_STARTED)
++    goto done;
++
++  GST_DEBUG_OBJECT (self, "Finishing encoding");
++
++  /* drop the stream lock while draining, so remaining buffers can be
++   * pushed from the src pad task thread */
++  GST_VIDEO_ENCODER_STREAM_UNLOCK (encoder);
++
++  if (gst_v4l2_encoder_cmd (self->v4l2capture, V4L2_ENC_CMD_STOP, 0)) {
++    GstTask *task = encoder->srcpad->task;
++
++    /* Wait for the task to be drained */
++    GST_DEBUG_OBJECT (self, "Waiting for encoder stop");
++    GST_OBJECT_LOCK (task);
++    while (GST_TASK_STATE (task) == GST_TASK_STARTED)
++      GST_TASK_WAIT (task);
++    GST_OBJECT_UNLOCK (task);
++    ret = GST_FLOW_FLUSHING;
++  }
++
++  /* and ensure the processing thread has stopped in case another error
++   * occurred. */
++  gst_v4l2_object_unlock (self->v4l2capture);
++  gst_pad_stop_task (encoder->srcpad);
++  GST_VIDEO_ENCODER_STREAM_LOCK (encoder);
++
++  if (ret == GST_FLOW_FLUSHING)
++    ret = self->output_flow;
++
++  GST_DEBUG_OBJECT (encoder, "Done draining buffers");
++
++done:
++  return ret;
++}
++
++static gboolean
++gst_v4l2_video_jpeg_set_format (GstVideoEncoder * encoder,
++    GstVideoCodecState * state)
++{
++  gboolean ret = TRUE;
++  GstV4l2VideoEnc *self = GST_V4L2_VIDEO_ENC (encoder);
++  GstV4l2JPEGEnc *v4l2jpegenc = GST_V4L2_JPEG_ENC (encoder);
++  GstV4l2Error error = GST_V4L2_ERROR_INIT;
++  GstCaps *outcaps;
++  GstVideoCodecState *output;
++
++  GST_DEBUG_OBJECT (self, "Setting format: %" GST_PTR_FORMAT, state->caps);
++
++  if (self->input_state) {
++    if (gst_v4l2_object_caps_equal (self->v4l2output, state->caps)) {
++      GST_DEBUG_OBJECT (self, "Compatible caps");
++      return TRUE;
++    }
++
++    if (gst_v4l2_video_enc_finish (encoder) != GST_FLOW_OK)
++      return FALSE;
++
++    gst_v4l2_object_stop (self->v4l2output);
++    gst_v4l2_object_stop (self->v4l2capture);
++
++    gst_video_codec_state_unref (self->input_state);
++    self->input_state = NULL;
++  }
++
++  outcaps = gst_pad_get_pad_template_caps (encoder->srcpad);
++  outcaps = gst_caps_make_writable (outcaps);
++  output = gst_video_encoder_set_output_state (encoder, outcaps, state);
++  gst_video_codec_state_unref (output);
++
++  if (!gst_video_encoder_negotiate (encoder))
++    return FALSE;
++
++  if (!gst_v4l2_object_set_format (self->v4l2output, state->caps, &error)) {
++    gst_v4l2_error (self, &error);
++    return FALSE;
++  }
++
++  /* best effort */
++  if (v4l2jpegenc->apply_crop_settings)
++    gst_v4l2_object_set_crop (self->v4l2output, &v4l2jpegenc->crop_bounds);
++  else
++    gst_v4l2_object_setup_padding (self->v4l2output);
++
++  self->input_state = gst_video_codec_state_ref (state);
++
++  GST_DEBUG_OBJECT (self, "output caps: %" GST_PTR_FORMAT, state->caps);
++
++  return ret;
+ }
+
+ static void
+@@ -77,12 +263,14 @@ gst_v4l2_jpeg_enc_class_init (GstV4l2JPEGEncClass * klass)
+   GstElementClass *element_class;
+   GObjectClass *gobject_class;
+   GstV4l2VideoEncClass *baseclass;
++  GstVideoEncoderClass *video_encoder_class;
+
+   parent_class = g_type_class_peek_parent (klass);
+
+   element_class = (GstElementClass *) klass;
+   gobject_class = (GObjectClass *) klass;
+   baseclass = (GstV4l2VideoEncClass *) (klass);
++  video_encoder_class = (GstVideoEncoderClass *) klass;
+
+   GST_DEBUG_CATEGORY_INIT (gst_v4l2_jpeg_enc_debug, "v4l2jpegenc", 0,
+       "V4L2 JPEG Encoder");
+@@ -99,6 +287,18 @@ gst_v4l2_jpeg_enc_class_init (GstV4l2JPEGEncClass * klass)
+       GST_DEBUG_FUNCPTR (gst_v4l2_jpeg_enc_get_property);
+
+   baseclass->codec_name = "JPEG";
++  video_encoder_class->set_format =
++      GST_DEBUG_FUNCPTR (gst_v4l2_video_jpeg_set_format);
++
++  g_object_class_install_property (gobject_class, PROP_CROP_BOUNDS,
++      gst_param_spec_array ("crop-bounds", "Crop bounds",
++          "The bounding region for crop rectangles ('<x, y, width, height>').",
++          g_param_spec_int ("rect-value", "Rectangle Value",
++              "One of x, y, width or height value.", G_MININT, G_MAXINT, -1,
++              G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS),
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
++
+ }
+
+ /* Probing functions */
+diff --git a/sys/v4l2/gstv4l2jpegenc.h b/sys/v4l2/gstv4l2jpegenc.h
+index 8b6d0b7a64..59cad21e08 100644
+--- a/sys/v4l2/gstv4l2jpegenc.h
++++ b/sys/v4l2/gstv4l2jpegenc.h
+@@ -42,6 +42,10 @@ typedef struct _GstV4l2JPEGEncClass GstV4l2JPEGEncClass;
+ struct _GstV4l2JPEGEnc
+ {
+   GstV4l2VideoEnc parent;
++
++  struct v4l2_rect crop_bounds;
++  gboolean apply_crop_settings;
++
+ };
+
+ struct _GstV4l2JPEGEncClass
+--
+2.34.1
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22-arago.inc
index 34e79c6a..2175becf 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22-arago.inc
@@ -6,6 +6,7 @@ SRC_URI:append = " \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
+    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
 "
 
 PR:append = ".arago0"
-- 
2.34.1


