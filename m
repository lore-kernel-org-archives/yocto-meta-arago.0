Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1A2C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 11:26:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.14249.1742729188551026840
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 23 Mar 2025 04:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W50Av1rj;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52NBQRE7685590
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Sun, 23 Mar 2025 06:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742729187;
	bh=ZIfsxNyzLkZZwPQNj1g4hZFSJsRBkTucKdlBnYHMa9w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=W50Av1rj2fwOzwIfja5G41WWAxEWl26IE5+VxJccQyiWirpcVUY0MkpUr4FeR+QKo
	 qoWxOyltPAG1EB3kOaOZz8Gdy89X114W2AZdDdwqgUaATN3BXUkEKtQLFqyabeh2mq
	 nYawyBU2WJnlOxj7mT2rAVW2FE5N4IjIc0qcxqX8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52NBQRHE122362
	for <meta-arago@lists.yoctoproject.org>; Sun, 23 Mar 2025 06:26:27 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 23
 Mar 2025 06:26:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 23 Mar 2025 06:26:27 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52NBQOu2026693;
	Sun, 23 Mar 2025 06:26:25 -0500
Message-ID: <3744bd78-8be5-4c63-82cf-a719f4bfd589@ti.com>
Date: Sun, 23 Mar 2025 16:56:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] gstreamer1.0-plugins-good:
 Add Patch to Support Cropping for JPEG Encoder
To: Brandon Brnich <b-brnich@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>
References: <20250317021455.576445-1-b-brnich@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250317021455.576445-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 23 Mar 2025 11:26:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16144

Hi Brandon,

Thanks for the patch.

On 17/03/25 07:44, Brandon Brnich wrote:
> The E5010 JPEG Encoder found on TI's am62a has the ability to only
> encode a specific region using the V4L2 S_SELECTION IOCTL. This control
> allows a cropping rectangle to be set where anything outside that region
> will be ignored. Gstreamer did not have support for cropping.
> 
> This patch adds support at the gstreamer level by exposing a crop-bounds
> control for the v4l2jpegenc element and updating the format accordingly
> if a crop rectangle is being requested.
> 
> Only add this patch to the am62a build as this is the only SoC that
> contains this IP.
> 

I don't think we follow the same policy for other gstreamer patches. If 
the patch itself is platform independent, then let's keep it for all 
platforms and upstream it.

> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
> 
> Some example pipelines used for validation:
> 
> gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw, width=640, height=480, format=NV12 ! v4l2jpegenc 'crop-bounds=<400,80,240,400>' ! filesink location=small.jpeg
> 
> gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw, width=640, height=480, format=NV12 ! v4l2jpegenc 'crop-bounds=<100,40,540,440>' ! filesink location=medium.jpeg
> 
> gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw, width=640, height=480, format=NV12 ! v4l2jpegenc 'crop-bounds=<0,0,540,440>' ! filesink location=top_corner.jpeg
> 
>   ...support-for-cropping-in-JPEG-Encoder.patch | 287 ++++++++++++++++++
>   .../gstreamer1.0-plugins-good_1.22.%.bbappend |   4 +
>   2 files changed, 291 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch
> new file mode 100644
> index 00000000..c761314e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch
> @@ -0,0 +1,287 @@
> +From c997f3ee027da932cd8626dd50e86b9085c56b23 Mon Sep 17 00:00:00 2001
> +From: Brandon Brnich <b-brnich@ti.com>
> +Date: Mon, 10 Mar 2025 15:25:51 +0000
> +Subject: [PATCH] v4l2jpegenc: Add support for cropping in JPEG Encoder
> +
> +V4L2 exposes control that allows users to set a cropping rectangle. This
> +rectangle can be used to encode a specific region of interest.
> +
> +Add property to v4l2jpegenc to customize the region and update
> +set_format function accordingly.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> +---
> + sys/v4l2/gstv4l2jpegenc.c                 | 204 +++++++++++++++++-
> + sys/v4l2/gstv4l2jpegenc.h                 |   4 +
> + 2 files changed, 206 insertions(+), 2 deletions(-)
> +
> +diff --git a/sys/v4l2/gstv4l2jpegenc.c b/sys/v4l2/gstv4l2jpegenc.c
> +index eee7a67da5..43f76ec9f3 100644
> +--- a/sys/v4l2/gstv4l2jpegenc.c
> ++++ b/sys/v4l2/gstv4l2jpegenc.c
> +@@ -46,24 +46,210 @@ enum
> + {
> +   PROP_0,
> +   V4L2_STD_OBJECT_PROPS,
> ++  PROP_CROP_BOUNDS,

Seems like this is similar to v4l2src crop-bounds property. Maybe from 
upstream POV, it would be better to see if this property could be shared 
between the two without code duplication.

> ++  PROP_LAST
> +   /* TODO */
> + };
> +
> + #define gst_v4l2_jpeg_enc_parent_class parent_class
> + G_DEFINE_TYPE (GstV4l2JPEGEnc, gst_v4l2_jpeg_enc, GST_TYPE_V4L2_VIDEO_ENC);
> +
> ++static void
> ++gst_v4l2_jpeg_enc_set_rect_value (GValue * value, struct v4l2_rect *rect)
> ++{
> ++  GValue val = { 0 };
> ++
> ++  g_value_init (&val, G_TYPE_INT);
> ++  g_value_reset (value);
> ++
> ++  g_value_set_int (&val, rect->left);
> ++  gst_value_array_append_value (value, &val);
> ++
> ++  g_value_set_int (&val, rect->top);
> ++  gst_value_array_append_value (value, &val);
> ++
> ++  g_value_set_int (&val, rect->width);
> ++  gst_value_array_append_value (value, &val);
> ++
> ++  g_value_set_int (&val, rect->height);
> ++  gst_value_array_append_value (value, &val);
> ++
> ++  g_value_unset (&val);
> ++}
> ++
> + static void
> + gst_v4l2_jpeg_enc_set_property (GObject * object,
> +     guint prop_id, const GValue * value, GParamSpec * pspec)
> + {
> +-  /* TODO */
> ++  GstV4l2JPEGEnc *v4l2jpegenc = GST_V4L2_JPEG_ENC (object);
> ++
> ++  if (!gst_v4l2_object_set_property_helper (v4l2jpegenc->parent.v4l2output,
> ++          prop_id, value, pspec)) {
> ++    switch (prop_id) {
> ++      case PROP_CROP_BOUNDS:
> ++        v4l2jpegenc->crop_bounds.left = g_value_get_int (gst_value_array_get_value (value, 0));
> ++        v4l2jpegenc->crop_bounds.top = g_value_get_int (gst_value_array_get_value (value, 1));
> ++        v4l2jpegenc->crop_bounds.width = g_value_get_int (gst_value_array_get_value (value, 2));
> ++        v4l2jpegenc->crop_bounds.height = g_value_get_int (gst_value_array_get_value (value, 3));
> ++        v4l2jpegenc->apply_crop_settings = TRUE;
> ++        break;
> ++      default:
> ++        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++        break;
> ++    }
> ++  }
> + }
> +
> + static void
> + gst_v4l2_jpeg_enc_get_property (GObject * object,
> +     guint prop_id, GValue * value, GParamSpec * pspec)
> + {
> +-  /* TODO */
> ++  GstV4l2JPEGEnc *v4l2jpegenc = GST_V4L2_JPEG_ENC (object);
> ++  guint i = 0;
> ++
> ++  if (!gst_v4l2_object_get_property_helper (v4l2jpegenc->parent.v4l2output,
> ++          prop_id, value, pspec)) {
> ++    switch (prop_id) {
> ++      case PROP_CROP_BOUNDS:
> ++        gst_v4l2_jpeg_enc_set_rect_value (value, &v4l2jpegenc->crop_bounds);
> ++        for (i = 0; i < gst_value_array_get_size (value); i++) {
> ++          GST_DEBUG_OBJECT(object, "entry %i is %i", i, gst_value_array_get_value (value, i));
> ++        }
> ++        break;
> ++      default:
> ++        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++        break;
> ++    }
> ++  }
> ++
> ++}
> ++
> ++static gboolean
> ++gst_v4l2_encoder_cmd (GstV4l2Object * v4l2object, guint cmd, guint flags)
> ++{
> ++  struct v4l2_encoder_cmd ecmd = { 0, };
> ++
> ++  GST_DEBUG_OBJECT (v4l2object->element,
> ++      "sending v4l2 encoder command %u with flags %u", cmd, flags);
> ++
> ++  if (!GST_V4L2_IS_OPEN (v4l2object))
> ++    return FALSE;
> ++
> ++  ecmd.cmd = cmd;
> ++  ecmd.flags = flags;
> ++  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_ENCODER_CMD, &ecmd) < 0)
> ++    goto ecmd_failed;
> ++

Is this change related to crop_bounds  ?

> ++  return TRUE;
> ++
> ++ecmd_failed:
> ++  if (errno == ENOTTY) {
> ++    GST_INFO_OBJECT (v4l2object->element,
> ++        "Failed to send encoder command %u with flags %u for '%s'. (%s)",
> ++        cmd, flags, v4l2object->videodev, g_strerror (errno));
> ++  } else {
> ++    GST_ERROR_OBJECT (v4l2object->element,
> ++        "Failed to send encoder command %u with flags %u for '%s'. (%s)",
> ++        cmd, flags, v4l2object->videodev, g_strerror (errno));
> ++  }
> ++  return FALSE;
> ++}
> ++
> ++static GstFlowReturn
> ++gst_v4l2_video_enc_finish (GstVideoEncoder * encoder)
> ++{
> ++  GstV4l2VideoEnc *self = GST_V4L2_VIDEO_ENC (encoder);
> ++  GstFlowReturn ret = GST_FLOW_OK;
> ++
> ++  if (gst_pad_get_task_state (encoder->srcpad) != GST_TASK_STARTED)
> ++    goto done;
> ++

What's all these code about ? doesn't seem to be related to cropping. 
Please send gstreamer patch separately, so that it is easier to review.

> ++  GST_DEBUG_OBJECT (self, "Finishing encoding");
> ++
> ++  /* drop the stream lock while draining, so remaining buffers can be
> ++   * pushed from the src pad task thread */
> ++  GST_VIDEO_ENCODER_STREAM_UNLOCK (encoder);
> ++
> ++  if (gst_v4l2_encoder_cmd (self->v4l2capture, V4L2_ENC_CMD_STOP, 0)) {
> ++    GstTask *task = encoder->srcpad->task;
> ++
> ++    /* Wait for the task to be drained */
> ++    GST_DEBUG_OBJECT (self, "Waiting for encoder stop");
> ++    GST_OBJECT_LOCK (task);
> ++    while (GST_TASK_STATE (task) == GST_TASK_STARTED)
> ++      GST_TASK_WAIT (task);
> ++    GST_OBJECT_UNLOCK (task);
> ++    ret = GST_FLOW_FLUSHING;
> ++  }
> ++
> ++  /* and ensure the processing thread has stopped in case another error
> ++   * occurred. */
> ++  gst_v4l2_object_unlock (self->v4l2capture);
> ++  gst_pad_stop_task (encoder->srcpad);
> ++  GST_VIDEO_ENCODER_STREAM_LOCK (encoder);
> ++
> ++  if (ret == GST_FLOW_FLUSHING)
> ++    ret = self->output_flow;
> ++
> ++  GST_DEBUG_OBJECT (encoder, "Done draining buffers");
> ++
> ++done:
> ++  return ret;
> ++}
> ++
> ++static gboolean
> ++gst_v4l2_video_jpeg_set_format (GstVideoEncoder * encoder,
> ++    GstVideoCodecState * state)
> ++{
> ++  gboolean ret = TRUE;
> ++  GstV4l2VideoEnc *self = GST_V4L2_VIDEO_ENC (encoder);
> ++  GstV4l2JPEGEnc *v4l2jpegenc = GST_V4L2_JPEG_ENC (encoder);
> ++  GstV4l2Error error = GST_V4L2_ERROR_INIT;
> ++  GstCaps *outcaps;
> ++  GstVideoCodecState *output;
> ++
> ++  GST_DEBUG_OBJECT (self, "Setting format: %" GST_PTR_FORMAT, state->caps);
> ++
> ++  if (self->input_state) {
> ++    if (gst_v4l2_object_caps_equal (self->v4l2output, state->caps)) {
> ++      GST_DEBUG_OBJECT (self, "Compatible caps");
> ++      return TRUE;
> ++    }
> ++
> ++    if (gst_v4l2_video_enc_finish (encoder) != GST_FLOW_OK)
> ++      return FALSE;
> ++
> ++    gst_v4l2_object_stop (self->v4l2output);
> ++    gst_v4l2_object_stop (self->v4l2capture);
> ++
> ++    gst_video_codec_state_unref (self->input_state);
> ++    self->input_state = NULL;
> ++  }
> ++
> ++  outcaps = gst_pad_get_pad_template_caps (encoder->srcpad);
> ++  outcaps = gst_caps_make_writable (outcaps);
> ++  output = gst_video_encoder_set_output_state (encoder, outcaps, state);
> ++  gst_video_codec_state_unref (output);
> ++
> ++  if (!gst_video_encoder_negotiate (encoder))
> ++    return FALSE;
> ++
> ++  if (!gst_v4l2_object_set_format (self->v4l2output, state->caps, &error)) {
> ++    gst_v4l2_error (self, &error);
> ++    return FALSE;
> ++  }
> ++
> ++  /* best effort */
> ++  if (v4l2jpegenc->apply_crop_settings)
> ++    gst_v4l2_object_set_crop (self->v4l2output, &v4l2jpegenc->crop_bounds);
> ++  else
> ++    gst_v4l2_object_setup_padding (self->v4l2output);
> ++
> ++  self->input_state = gst_video_codec_state_ref (state);
> ++
> ++  GST_DEBUG_OBJECT (self, "output caps: %" GST_PTR_FORMAT, state->caps);
> ++
> ++  return ret;
> + }
> +
> + static void
> +@@ -77,12 +263,14 @@ gst_v4l2_jpeg_enc_class_init (GstV4l2JPEGEncClass * klass)
> +   GstElementClass *element_class;
> +   GObjectClass *gobject_class;
> +   GstV4l2VideoEncClass *baseclass;
> ++  GstVideoEncoderClass *video_encoder_class;
> +
> +   parent_class = g_type_class_peek_parent (klass);
> +
> +   element_class = (GstElementClass *) klass;
> +   gobject_class = (GObjectClass *) klass;
> +   baseclass = (GstV4l2VideoEncClass *) (klass);
> ++  video_encoder_class = (GstVideoEncoderClass *) klass;
> +
> +   GST_DEBUG_CATEGORY_INIT (gst_v4l2_jpeg_enc_debug, "v4l2jpegenc", 0,
> +       "V4L2 JPEG Encoder");
> +@@ -99,6 +287,18 @@ gst_v4l2_jpeg_enc_class_init (GstV4l2JPEGEncClass * klass)
> +       GST_DEBUG_FUNCPTR (gst_v4l2_jpeg_enc_get_property);
> +
> +   baseclass->codec_name = "JPEG";
> ++  video_encoder_class->set_format =
> ++      GST_DEBUG_FUNCPTR (gst_v4l2_video_jpeg_set_format);
> ++
> ++  g_object_class_install_property (gobject_class, PROP_CROP_BOUNDS,
> ++      gst_param_spec_array ("crop-bounds", "Crop bounds",
> ++          "The bounding region for crop rectangles ('<x, y, width, height>').",
> ++          g_param_spec_int ("rect-value", "Rectangle Value",
> ++              "One of x, y, width or height value.", G_MININT, G_MAXINT, -1,
> ++              G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS),
> ++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++
> + }
> +
> + /* Probing functions */
> +diff --git a/sys/v4l2/gstv4l2jpegenc.h b/sys/v4l2/gstv4l2jpegenc.h
> +index 8b6d0b7a64..59cad21e08 100644
> +--- a/sys/v4l2/gstv4l2jpegenc.h
> ++++ b/sys/v4l2/gstv4l2jpegenc.h
> +@@ -42,6 +42,10 @@ typedef struct _GstV4l2JPEGEncClass GstV4l2JPEGEncClass;
> + struct _GstV4l2JPEGEnc
> + {
> +   GstV4l2VideoEnc parent;
> ++
> ++  struct v4l2_rect crop_bounds;
> ++  gboolean apply_crop_settings;

Why a boolean is needed ? If user set crop-bounds prop in cmdline then 
we apply crop-settings, so what's the rationale of having separate 
boolean prop ?

Regards
Devarsh

> ++
> + };
> +
> + struct _GstV4l2JPEGEncClass
> +--
> +2.34.1
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
> index 6eddc74f..702f537a 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.%.bbappend
> @@ -8,4 +8,8 @@ SRC_URI:append = " \
>       file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
>   "
>   
> +SRC_URI:append:am62axx-evm = " \
> +    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
> +"
> +
>   PR:append = ".arago0"

