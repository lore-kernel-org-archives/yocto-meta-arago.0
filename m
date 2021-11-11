Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.5231.1636662334847368547
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 12:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DFD0540A47;
	Thu, 11 Nov 2021 20:25:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9XjtaoUM4cG; Thu, 11 Nov 2021 20:25:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3B4040952;
	Thu, 11 Nov 2021 20:25:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02DD91746C3; Thu, 11 Nov 2021 15:25:27 -0500 (EST)
Date: Thu, 11 Nov 2021 15:25:27 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org, prashanth.ka@pathpartnertech.com
Subject: Re: [dunfell PATCHv2] gstreamer1.0-plugins-good: backported Extended controls support for H264 encoder.
Message-ID: <20211111202527.GQ10132@denix.org>
References: <20211111201917.4840-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211111201917.4840-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 11, 2021 at 02:19:17PM -0600, praneeth@ti.com wrote:
> From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> 
> Add patch of extended controls such as video bitrate,
> gopsize and iperiod for H264 encoder.
> 
> Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good]

Upstream-Status is a required field in the patch itself, right where I 
commented it before.


> Review comments recieved for including GOP Closure and
> expose controls of VBR and CBR and they are not addressed in upstream yet.
> 
> Once they are addressed and upstream accepts the patch,
> Will send a incremental fix to supported branches including dunfell.
> 
> Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> [praneeth@ti.com: update commitmsg on Upstream-Status]
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  meta-arago-distro/README                      |   2 +-
>  ...-1.16.3-v4l2h264enc-Add-Extended-con.patch | 237 ++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |   1 +
>  3 files changed, 239 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch
> 
> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
> index 39acade7..eac451c0 100644
> --- a/meta-arago-distro/README
> +++ b/meta-arago-distro/README
> @@ -26,7 +26,7 @@ URI: https://github.com/meta-qt5/meta-qt5
>  branch: dunfell
>  revision: HEAD
>  
> -URI: git://arago-project.org/git/meta-arago
> +URI: git://git.yoctoproject.org/meta-arago

This should be a separate patch.


>  branch: dunfell
>  revision: HEAD
>  layers: meta-arago-extras
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch
> new file mode 100644
> index 00000000..9358bd87
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch
> @@ -0,0 +1,237 @@
> +From 72ce7eb2c17f3dd6b4653985f5660692b88ac54f Mon Sep 17 00:00:00 2001
> +From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
> +Date: Tue, 2 Nov 2021 19:12:48 +0530
> +Subject: [PATCH] [gst-plugins-good 1.16.3]v4l2h264enc:Add Extended controls
> + support for H264 encoder
> +
> +Add extended controls such as video bitrate,
> +gopsize and iperiod for H264 encoder.
> +
> +Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>

Should be here:

Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1010]


> +---
> +Raised merge-request to upstream and still discussion is in progress.
> +
> +Working on to add following controls to complete the upstream of the patch.
> +1. GOP clousre.
> +2. Add and expose controls of VBR and CBR.
> +
> +Currently backported this patch to 1.16.3 version, As it requires
> +to be in dunfell baseline for TI SDK.
> +
> +Following is the link of merge-request for reference.
> +https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1010
> +
> + sys/v4l2/gstv4l2h264enc.c | 136 +++++++++++++++++++++++++++++++++++++-
> + sys/v4l2/gstv4l2h264enc.h |   4 ++
> + 2 files changed, 138 insertions(+), 2 deletions(-)
> +
> +diff --git a/sys/v4l2/gstv4l2h264enc.c b/sys/v4l2/gstv4l2h264enc.c
> +index ee160b3a0..61ed9a813 100644
> +--- a/sys/v4l2/gstv4l2h264enc.c
> ++++ b/sys/v4l2/gstv4l2h264enc.c
> +@@ -47,6 +47,9 @@ enum
> + {
> +   PROP_0,
> +   V4L2_STD_OBJECT_PROPS,
> ++  PROP_BITRATE,
> ++  PROP_GOPSIZE,
> ++  PROP_I_PERIOD,
> + /* TODO add H264 controls
> +  * PROP_I_FRAME_QP,
> +  * PROP_P_FRAME_QP,
> +@@ -74,18 +77,54 @@ enum
> + #define gst_v4l2_h264_enc_parent_class parent_class
> + G_DEFINE_TYPE (GstV4l2H264Enc, gst_v4l2_h264_enc, GST_TYPE_V4L2_VIDEO_ENC);
> +
> ++#define DEFAULT_PROP_BITRATE 	(500 * 1000)
> ++#define DEFAULT_PROP_GOPSIZE 	(1800)
> ++#define DEFAULT_PROP_I_PERIOD 	(30)
> ++
> + static void
> + gst_v4l2_h264_enc_set_property (GObject * object,
> +     guint prop_id, const GValue * value, GParamSpec * pspec)
> + {
> +-  /* TODO */
> ++
> ++  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
> ++
> ++  switch (prop_id) {
> ++    case PROP_BITRATE:
> ++      self->bitrate = g_value_get_uint (value);
> ++      break;
> ++    case PROP_GOPSIZE:
> ++      self->gopsize = g_value_get_uint (value);
> ++      break;
> ++    case PROP_I_PERIOD:
> ++      self->iperiod = g_value_get_uint (value);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> + }
> +
> + static void
> + gst_v4l2_h264_enc_get_property (GObject * object,
> +     guint prop_id, GValue * value, GParamSpec * pspec)
> + {
> +-  /* TODO */
> ++
> ++  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
> ++
> ++  switch (prop_id) {
> ++    case PROP_BITRATE:
> ++      g_value_set_uint (value, self->bitrate);
> ++      break;
> ++    case PROP_GOPSIZE:
> ++      g_value_set_uint (value, self->gopsize);
> ++      break;
> ++    case PROP_I_PERIOD:
> ++      g_value_set_uint (value, self->iperiod);
> ++      break;
> ++    default:
> ++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> ++      break;
> ++  }
> + }
> +
> + static gint
> +@@ -270,6 +309,81 @@ v4l2_level_to_string (gint v4l2_level)
> + static void
> + gst_v4l2_h264_enc_init (GstV4l2H264Enc * self)
> + {
> ++  /* Initializing H264 encoder extended controls parameter
> ++   * with default values */
> ++  self->bitrate = DEFAULT_PROP_BITRATE;
> ++  self->gopsize = DEFAULT_PROP_GOPSIZE;
> ++  self->iperiod = DEFAULT_PROP_I_PERIOD;
> ++}
> ++
> ++static void
> ++gst_v4l2_h264_enc_get_ctrls (GstV4l2Object * v4l2object)
> ++{
> ++  struct v4l2_ext_controls ctrls;
> ++  struct v4l2_ext_control controls[3];
> ++  guint i;
> ++
> ++  memset (&ctrls, 0, sizeof (ctrls));
> ++  memset (controls, 0, sizeof (controls));
> ++
> ++  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
> ++  ctrls.count = 3;
> ++  ctrls.controls = controls;
> ++
> ++  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
> ++  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
> ++  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
> ++
> ++  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_G_EXT_CTRLS, &ctrls)) {
> ++    GST_DEBUG_OBJECT (v4l2object, "Failed to get extended "
> ++        "controls for H264 encoder");
> ++    return;
> ++  } else {
> ++    GST_LOG_OBJECT (v4l2object, "Extended controls "
> ++        "for H264 encoder bitrate=[%d] gopsize=[%d] iperiod=[%d]",
> ++        controls[0].value, controls[1].value, controls[2].value);
> ++  }
> ++}
> ++
> ++static void
> ++gst_v4l2_h264_enc_set_ctrls (GstV4l2Object * v4l2object, guint bitrate,
> ++    guint gop_size, guint i_period)
> ++{
> ++  struct v4l2_ext_controls ctrls;
> ++  struct v4l2_ext_control controls[3];
> ++  guint i;
> ++
> ++  memset (&ctrls, 0, sizeof (ctrls));
> ++  memset (controls, 0, sizeof (controls));
> ++
> ++  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
> ++  ctrls.count = 3;
> ++  ctrls.controls = controls;
> ++
> ++  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
> ++  controls[0].value = gop_size;
> ++  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
> ++  controls[1].value = bitrate;
> ++  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
> ++  controls[2].value = i_period;
> ++
> ++  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_S_EXT_CTRLS, &ctrls)) {
> ++    GST_DEBUG_OBJECT (v4l2object, "Failed to set extended "
> ++        "controls for encoder");
> ++    return;
> ++  }
> ++}
> ++
> ++static gboolean
> ++gst_v4l2_h264_enc_start (GstV4l2VideoEnc * v4l2enc)
> ++{
> ++  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (v4l2enc);
> ++
> ++  gst_v4l2_h264_enc_set_ctrls (v4l2enc->v4l2output, self->bitrate,
> ++      self->gopsize, self->iperiod);
> ++  gst_v4l2_h264_enc_get_ctrls (v4l2enc->v4l2output);
> ++
> ++  return GST_VIDEO_ENCODER_CLASS (parent_class)->start (v4l2enc);
> + }
> +
> + static void
> +@@ -278,12 +392,14 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
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
> +   GST_DEBUG_CATEGORY_INIT (gst_v4l2_h264_enc_debug, "v4l2h264enc", 0,
> +       "V4L2 H.264 Encoder");
> +@@ -297,8 +413,24 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
> +       GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_set_property);
> +   gobject_class->get_property =
> +       GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_get_property);
> ++  video_encoder_class->start = GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_start);
> +
> +   baseclass->codec_name = "H264";
> ++  g_object_class_install_property (gobject_class, PROP_BITRATE,
> ++      g_param_spec_uint ("bitrate", "Bitrate", "Bitrate in bit/sec",
> ++          50 * 1000, 100 * 1000 * 1000, DEFAULT_PROP_BITRATE,
> ++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++  g_object_class_install_property (gobject_class, PROP_GOPSIZE,
> ++      g_param_spec_uint ("gop-size", "Gop size", "Size of a group of "
> ++          "picture starting with an IDR frame",
> ++          1, 7200, DEFAULT_PROP_GOPSIZE,
> ++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> ++
> ++  g_object_class_install_property (gobject_class, PROP_I_PERIOD,
> ++      g_param_spec_uint ("i-period", "I period", "I Frame Period",
> ++          1, 600, DEFAULT_PROP_I_PERIOD,
> ++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
> +   baseclass->profile_cid = V4L2_CID_MPEG_VIDEO_H264_PROFILE;
> +   baseclass->profile_to_string = v4l2_profile_to_string;
> +   baseclass->profile_from_string = v4l2_profile_from_string;
> +diff --git a/sys/v4l2/gstv4l2h264enc.h b/sys/v4l2/gstv4l2h264enc.h
> +index 3bfa34346..9f8f7e120 100644
> +--- a/sys/v4l2/gstv4l2h264enc.h
> ++++ b/sys/v4l2/gstv4l2h264enc.h
> +@@ -42,6 +42,10 @@ typedef struct _GstV4l2H264EncClass GstV4l2H264EncClass;
> + struct _GstV4l2H264Enc
> + {
> +   GstV4l2VideoEnc parent;
> ++  /*H264 Extended Controls */
> ++  guint bitrate;
> ++  guint gopsize;
> ++  guint iperiod;
> + };
> +
> + struct _GstV4l2H264EncClass
> +--
> +2.17.1
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> index e2ddbc27..0c6dc81b 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
> @@ -8,6 +8,7 @@ SRC_URI += " \
>      file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
>      file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
>      file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
> +    file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch \
>  "
>  
>  PR_append = ".arago3"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
