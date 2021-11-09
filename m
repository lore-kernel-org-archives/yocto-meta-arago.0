Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4550.1636499744092102509
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 15:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6AB0940C88;
	Tue,  9 Nov 2021 23:15:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XL7dKIZdXMdH; Tue,  9 Nov 2021 23:15:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 280D140C60;
	Tue,  9 Nov 2021 23:15:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E6A9D1746B5; Tue,  9 Nov 2021 18:15:34 -0500 (EST)
Date: Tue, 9 Nov 2021 18:15:34 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: sidraya.bj@pathpartnertech.com, meta-arago@lists.yoctoproject.org,
	yogeshs@ti.com, d-huang@ti.com, prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	Angela Stegmaier <angelabaker@ti.com>
Subject: Re: [PATCH] [gst-plugins-good 1.16.3]v4l2h264enc:Add Extended controls support for H264 encoder
Message-ID: <20211109231534.GL10132@denix.org>
References: <20211109124335.27834-1-sidraya.bj@pathpartnertech.com>
 <bd106d23-45d9-0bf6-56c0-5d32ca1440f9@ti.com>
MIME-Version: 1.0
In-Reply-To: <bd106d23-45d9-0bf6-56c0-5d32ca1440f9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2021 at 05:10:25PM -0600, Bajjuri, Praneeth wrote:
> 
> 
> On 11/9/2021 6:43 AM, sidraya.bj@pathpartnertech.com wrote:
> >From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> >
> 
> Looks like you are subscribed now , The patch is not seen in the
> mailing list though. Please resubmit.
> 
> 
> >Add extended controls such as video bitrate,
> >gopsize and iperiod for H264 encoder.
> 
> If this for dunfell branch only? If so please mention clearly in the
> subject

It is not specifically for dunfell - it is not even an OE/Yocto patch. It is a 
patch against gst-plugins-good version 1.16.3, which is clearly mentioned, per 
earlier request.


> How about the recipe update at
> meta-arago-extras/recipes-multimedia/gstreamer/ ? Is there anything
> need to be done here?
> 
> >
> 
> If this work is based on the original author as seen here:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arago/commit/?h=dunfell&id=a5fef8b361f06ebe18871bde853c854614d900c1
> 
> Please add/retain authorship accordingly and add Signed-off-by
> 
> >Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> 
> 
> >---
> >Raised merge-request to upstream and still discussion is in progress.
> >
> >Working on to add following controls to complete the upstream of the patch.
> >1. GOP clousre.
> >2. Add and expose controls of VBR and CBR.
> >
> >Currently backported this patch to 1.16.3 version, As it requires
> >to be in dunfell baseline for TI SDK.
> >
> >Following is the link of merge-request for reference.
> >https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1010
> 
> Are you planning to address the review comments anytime soon? The
> upstream thread is untouched since 4 months so just checking.
> 
> >
> >  sys/v4l2/gstv4l2h264enc.c | 136 +++++++++++++++++++++++++++++++++++++-
> >  sys/v4l2/gstv4l2h264enc.h |   4 ++
> >  2 files changed, 138 insertions(+), 2 deletions(-)
> >
> >diff --git a/sys/v4l2/gstv4l2h264enc.c b/sys/v4l2/gstv4l2h264enc.c
> >index ee160b3a0..61ed9a813 100644
> >--- a/sys/v4l2/gstv4l2h264enc.c
> >+++ b/sys/v4l2/gstv4l2h264enc.c
> >@@ -47,6 +47,9 @@ enum
> >  {
> >    PROP_0,
> >    V4L2_STD_OBJECT_PROPS,
> >+  PROP_BITRATE,
> >+  PROP_GOPSIZE,
> >+  PROP_I_PERIOD,
> >  /* TODO add H264 controls
> >   * PROP_I_FRAME_QP,
> >   * PROP_P_FRAME_QP,
> >@@ -74,18 +77,54 @@ enum
> >  #define gst_v4l2_h264_enc_parent_class parent_class
> >  G_DEFINE_TYPE (GstV4l2H264Enc, gst_v4l2_h264_enc, GST_TYPE_V4L2_VIDEO_ENC);
> >+#define DEFAULT_PROP_BITRATE 	(500 * 1000)
> >+#define DEFAULT_PROP_GOPSIZE 	(1800)
> >+#define DEFAULT_PROP_I_PERIOD 	(30)
> >+
> >  static void
> >  gst_v4l2_h264_enc_set_property (GObject * object,
> >      guint prop_id, const GValue * value, GParamSpec * pspec)
> >  {
> >-  /* TODO */
> >+
> >+  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
> >+
> >+  switch (prop_id) {
> >+    case PROP_BITRATE:
> >+      self->bitrate = g_value_get_uint (value);
> >+      break;
> >+    case PROP_GOPSIZE:
> >+      self->gopsize = g_value_get_uint (value);
> >+      break;
> >+    case PROP_I_PERIOD:
> >+      self->iperiod = g_value_get_uint (value);
> >+      break;
> >+    default:
> >+      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> >+      break;
> >+  }
> >  }
> >  static void
> >  gst_v4l2_h264_enc_get_property (GObject * object,
> >      guint prop_id, GValue * value, GParamSpec * pspec)
> >  {
> >-  /* TODO */
> >+
> >+  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
> >+
> >+  switch (prop_id) {
> >+    case PROP_BITRATE:
> >+      g_value_set_uint (value, self->bitrate);
> >+      break;
> >+    case PROP_GOPSIZE:
> >+      g_value_set_uint (value, self->gopsize);
> >+      break;
> >+    case PROP_I_PERIOD:
> >+      g_value_set_uint (value, self->iperiod);
> >+      break;
> >+    default:
> >+      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> >+      break;
> >+  }
> >  }
> >  static gint
> >@@ -270,6 +309,81 @@ v4l2_level_to_string (gint v4l2_level)
> >  static void
> >  gst_v4l2_h264_enc_init (GstV4l2H264Enc * self)
> >  {
> >+  /* Initializing H264 encoder extended controls parameter
> >+   * with default values */
> >+  self->bitrate = DEFAULT_PROP_BITRATE;
> >+  self->gopsize = DEFAULT_PROP_GOPSIZE;
> >+  self->iperiod = DEFAULT_PROP_I_PERIOD;
> >+}
> >+
> >+static void
> >+gst_v4l2_h264_enc_get_ctrls (GstV4l2Object * v4l2object)
> >+{
> >+  struct v4l2_ext_controls ctrls;
> >+  struct v4l2_ext_control controls[3];
> >+  guint i;
> >+
> >+  memset (&ctrls, 0, sizeof (ctrls));
> >+  memset (controls, 0, sizeof (controls));
> >+
> >+  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
> >+  ctrls.count = 3;
> >+  ctrls.controls = controls;
> >+
> >+  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
> >+  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
> >+  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
> >+
> >+  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_G_EXT_CTRLS, &ctrls)) {
> >+    GST_DEBUG_OBJECT (v4l2object, "Failed to get extended "
> >+        "controls for H264 encoder");
> >+    return;
> >+  } else {
> >+    GST_LOG_OBJECT (v4l2object, "Extended controls "
> >+        "for H264 encoder bitrate=[%d] gopsize=[%d] iperiod=[%d]",
> >+        controls[0].value, controls[1].value, controls[2].value);
> >+  }
> >+}
> >+
> >+static void
> >+gst_v4l2_h264_enc_set_ctrls (GstV4l2Object * v4l2object, guint bitrate,
> >+    guint gop_size, guint i_period)
> >+{
> >+  struct v4l2_ext_controls ctrls;
> >+  struct v4l2_ext_control controls[3];
> >+  guint i;
> >+
> >+  memset (&ctrls, 0, sizeof (ctrls));
> >+  memset (controls, 0, sizeof (controls));
> >+
> >+  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
> >+  ctrls.count = 3;
> >+  ctrls.controls = controls;
> >+
> >+  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
> >+  controls[0].value = gop_size;
> >+  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
> >+  controls[1].value = bitrate;
> >+  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
> >+  controls[2].value = i_period;
> >+
> >+  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_S_EXT_CTRLS, &ctrls)) {
> >+    GST_DEBUG_OBJECT (v4l2object, "Failed to set extended "
> >+        "controls for encoder");
> >+    return;
> >+  }
> >+}
> >+
> >+static gboolean
> >+gst_v4l2_h264_enc_start (GstV4l2VideoEnc * v4l2enc)
> >+{
> >+  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (v4l2enc);
> >+
> >+  gst_v4l2_h264_enc_set_ctrls (v4l2enc->v4l2output, self->bitrate,
> >+      self->gopsize, self->iperiod);
> >+  gst_v4l2_h264_enc_get_ctrls (v4l2enc->v4l2output);
> >+
> >+  return GST_VIDEO_ENCODER_CLASS (parent_class)->start (v4l2enc);
> >  }
> >  static void
> >@@ -278,12 +392,14 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
> >    GstElementClass *element_class;
> >    GObjectClass *gobject_class;
> >    GstV4l2VideoEncClass *baseclass;
> >+  GstVideoEncoderClass *video_encoder_class;
> >    parent_class = g_type_class_peek_parent (klass);
> >    element_class = (GstElementClass *) klass;
> >    gobject_class = (GObjectClass *) klass;
> >    baseclass = (GstV4l2VideoEncClass *) (klass);
> >+  video_encoder_class = (GstVideoEncoderClass *) klass;
> >    GST_DEBUG_CATEGORY_INIT (gst_v4l2_h264_enc_debug, "v4l2h264enc", 0,
> >        "V4L2 H.264 Encoder");
> >@@ -297,8 +413,24 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
> >        GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_set_property);
> >    gobject_class->get_property =
> >        GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_get_property);
> >+  video_encoder_class->start = GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_start);
> >    baseclass->codec_name = "H264";
> >+  g_object_class_install_property (gobject_class, PROP_BITRATE,
> >+      g_param_spec_uint ("bitrate", "Bitrate", "Bitrate in bit/sec",
> >+          50 * 1000, 100 * 1000 * 1000, DEFAULT_PROP_BITRATE,
> >+          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> >+
> >+  g_object_class_install_property (gobject_class, PROP_GOPSIZE,
> >+      g_param_spec_uint ("gop-size", "Gop size", "Size of a group of "
> >+          "picture starting with an IDR frame",
> >+          1, 7200, DEFAULT_PROP_GOPSIZE,
> >+          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> >+
> >+  g_object_class_install_property (gobject_class, PROP_I_PERIOD,
> >+      g_param_spec_uint ("i-period", "I period", "I Frame Period",
> >+          1, 600, DEFAULT_PROP_I_PERIOD,
> >+          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> >    baseclass->profile_cid = V4L2_CID_MPEG_VIDEO_H264_PROFILE;
> >    baseclass->profile_to_string = v4l2_profile_to_string;
> >    baseclass->profile_from_string = v4l2_profile_from_string;
> >diff --git a/sys/v4l2/gstv4l2h264enc.h b/sys/v4l2/gstv4l2h264enc.h
> >index 3bfa34346..9f8f7e120 100644
> >--- a/sys/v4l2/gstv4l2h264enc.h
> >+++ b/sys/v4l2/gstv4l2h264enc.h
> >@@ -42,6 +42,10 @@ typedef struct _GstV4l2H264EncClass GstV4l2H264EncClass;
> >  struct _GstV4l2H264Enc
> >  {
> >    GstV4l2VideoEnc parent;
> >+  /*H264 Extended Controls */
> >+  guint bitrate;
> >+  guint gopsize;
> >+  guint iperiod;
> >  };
> >  struct _GstV4l2H264EncClass
> >
> 
