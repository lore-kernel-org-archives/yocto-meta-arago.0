Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.7576.1636616794739479932
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 23:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=bkGkcjga;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.210.172, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pf1-f172.google.com with SMTP id c126so4995509pfb.0
        for <meta-arago@lists.yoctoproject.org>; Wed, 10 Nov 2021 23:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mLf9e6K6FrqzY0wDHB32asFQIJTD6IBqPLt3zsgEnWQ=;
        b=bkGkcjgaVT6Zi3S1dl8p+FSfMexakd+8EH0kF3d1XJI2mZyFi2HyNXkKXtICzmOSbG
         EInSLD8H1oLCfEEIiQIZfJ2pCt2xw8Hrh6hjD35fosQZ2I2AuWrilwEQMZ9nAmlJyduw
         18b6Xj5fXrrlCfIfGpdfhieit+G6uRUHyFPj87LCSxqPKKelfgX1WtIQAgj5l9NaouYx
         Zh0Lh1efpvOAz1taN40oZtI6ABG140aeTjMvXmzkuBtzd9o9UiGjdz0l7OQbL7MSfJju
         vBhixCF4QiQutlWBS4e+yGs3MQjdZwVY0FXvz8x1oOLE0DtAAlQNTQ/qrV3wFZzARne3
         aOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mLf9e6K6FrqzY0wDHB32asFQIJTD6IBqPLt3zsgEnWQ=;
        b=H9K+t8+E5OJ7SSyS4eiVE7tkkLGRhYHSvibgrK7MgV/Ei0Do8Mf+YZ3A8kpeOyZcbl
         k3fuHMFGMLcW0rN7G+Ad47TnL2CArXPt0o8yTG2kjpcLOTSWKEmom2mzp2v21DxcEZu3
         dOis4bpqU9+I1euw1y7vPVrRFWT+C62QqyUWBbhi0magcUxm5qsjEw2HHOvlqXDgoV80
         18p4fZ47/mvPfDivMa0bP6q0ySoba+qw6g6jF+7w7JCmREbR62ifYpxaF7CfNGs1vOOs
         Kn69/K+NL9s10niw53tKUtMsE8roE0DkHVtZV5YPs5ahLP11TZV/kQbT8uNBBDPmpVI5
         UuZg==
X-Gm-Message-State: AOAM531QsLzC/Tql+jiZkAMcPP4AcG7WC68udJN3a+3Pn2yK8By/BYf9
	d/CwVd06YPV+Lr8tNY8sqlClhuKyLwSALY++
X-Google-Smtp-Source: ABdhPJzr79pJFM9IrzmwW0Di+bHpCmiJuyCOQ4y7hB65aPdJyfBpOHhUBBg+Ogv2nqb5Yz1+M8NFHg==
X-Received: by 2002:a63:560b:: with SMTP id k11mr3369080pgb.374.1636616793987;
        Wed, 10 Nov 2021 23:46:33 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([103.117.236.138])
        by smtp.gmail.com with ESMTPSA id u6sm2041997pfg.157.2021.11.10.23.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 23:46:33 -0800 (PST)
From: sidraya.bj@pathpartnertech.com
To: meta-arago@lists.yoctoproject.org
Cc: denis@denix.org,
	yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
Subject: [PATCH] [dunfell]gstreamer1.0-plugins-good: backported Extended controls support for H264 encoder.
Date: Thu, 11 Nov 2021 13:15:51 +0530
Message-Id: <20211111074551.8071-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1

From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>

Add patch of extended controls such as video bitrate,
gopsize and iperiod for H264 encoder.

Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
---
Raised merge-request to upstream and still discussion is in progress.

Working on to add following controls to complete the upstream of the patch.
1. GOP clousre.
2. Add and expose controls of VBR and CBR.

Currently backported this patch to 1.16.3 version, As it requires
to be in dunfell baseline for TI SDK.

Following is the link of merge-request for reference.
https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1010

 ...-1.16.3-v4l2h264enc-Add-Extended-con.patch | 237 ++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch
new file mode 100644
index 00000000..9358bd87
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch
@@ -0,0 +1,237 @@
+From 72ce7eb2c17f3dd6b4653985f5660692b88ac54f Mon Sep 17 00:00:00 2001
+From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+Date: Tue, 2 Nov 2021 19:12:48 +0530
+Subject: [PATCH] [gst-plugins-good 1.16.3]v4l2h264enc:Add Extended controls
+ support for H264 encoder
+
+Add extended controls such as video bitrate,
+gopsize and iperiod for H264 encoder.
+
+Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+---
+Raised merge-request to upstream and still discussion is in progress.
+
+Working on to add following controls to complete the upstream of the patch.
+1. GOP clousre.
+2. Add and expose controls of VBR and CBR.
+
+Currently backported this patch to 1.16.3 version, As it requires
+to be in dunfell baseline for TI SDK.
+
+Following is the link of merge-request for reference.
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1010
+
+ sys/v4l2/gstv4l2h264enc.c | 136 +++++++++++++++++++++++++++++++++++++-
+ sys/v4l2/gstv4l2h264enc.h |   4 ++
+ 2 files changed, 138 insertions(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2h264enc.c b/sys/v4l2/gstv4l2h264enc.c
+index ee160b3a0..61ed9a813 100644
+--- a/sys/v4l2/gstv4l2h264enc.c
++++ b/sys/v4l2/gstv4l2h264enc.c
+@@ -47,6 +47,9 @@ enum
+ {
+   PROP_0,
+   V4L2_STD_OBJECT_PROPS,
++  PROP_BITRATE,
++  PROP_GOPSIZE,
++  PROP_I_PERIOD,
+ /* TODO add H264 controls
+  * PROP_I_FRAME_QP,
+  * PROP_P_FRAME_QP,
+@@ -74,18 +77,54 @@ enum
+ #define gst_v4l2_h264_enc_parent_class parent_class
+ G_DEFINE_TYPE (GstV4l2H264Enc, gst_v4l2_h264_enc, GST_TYPE_V4L2_VIDEO_ENC);
+
++#define DEFAULT_PROP_BITRATE 	(500 * 1000)
++#define DEFAULT_PROP_GOPSIZE 	(1800)
++#define DEFAULT_PROP_I_PERIOD 	(30)
++
+ static void
+ gst_v4l2_h264_enc_set_property (GObject * object,
+     guint prop_id, const GValue * value, GParamSpec * pspec)
+ {
+-  /* TODO */
++
++  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
++
++  switch (prop_id) {
++    case PROP_BITRATE:
++      self->bitrate = g_value_get_uint (value);
++      break;
++    case PROP_GOPSIZE:
++      self->gopsize = g_value_get_uint (value);
++      break;
++    case PROP_I_PERIOD:
++      self->iperiod = g_value_get_uint (value);
++      break;
++    default:
++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
++      break;
++  }
+ }
+
+ static void
+ gst_v4l2_h264_enc_get_property (GObject * object,
+     guint prop_id, GValue * value, GParamSpec * pspec)
+ {
+-  /* TODO */
++
++  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
++
++  switch (prop_id) {
++    case PROP_BITRATE:
++      g_value_set_uint (value, self->bitrate);
++      break;
++    case PROP_GOPSIZE:
++      g_value_set_uint (value, self->gopsize);
++      break;
++    case PROP_I_PERIOD:
++      g_value_set_uint (value, self->iperiod);
++      break;
++    default:
++      G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
++      break;
++  }
+ }
+
+ static gint
+@@ -270,6 +309,81 @@ v4l2_level_to_string (gint v4l2_level)
+ static void
+ gst_v4l2_h264_enc_init (GstV4l2H264Enc * self)
+ {
++  /* Initializing H264 encoder extended controls parameter
++   * with default values */
++  self->bitrate = DEFAULT_PROP_BITRATE;
++  self->gopsize = DEFAULT_PROP_GOPSIZE;
++  self->iperiod = DEFAULT_PROP_I_PERIOD;
++}
++
++static void
++gst_v4l2_h264_enc_get_ctrls (GstV4l2Object * v4l2object)
++{
++  struct v4l2_ext_controls ctrls;
++  struct v4l2_ext_control controls[3];
++  guint i;
++
++  memset (&ctrls, 0, sizeof (ctrls));
++  memset (controls, 0, sizeof (controls));
++
++  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
++  ctrls.count = 3;
++  ctrls.controls = controls;
++
++  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
++  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
++  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
++
++  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_G_EXT_CTRLS, &ctrls)) {
++    GST_DEBUG_OBJECT (v4l2object, "Failed to get extended "
++        "controls for H264 encoder");
++    return;
++  } else {
++    GST_LOG_OBJECT (v4l2object, "Extended controls "
++        "for H264 encoder bitrate=[%d] gopsize=[%d] iperiod=[%d]",
++        controls[0].value, controls[1].value, controls[2].value);
++  }
++}
++
++static void
++gst_v4l2_h264_enc_set_ctrls (GstV4l2Object * v4l2object, guint bitrate,
++    guint gop_size, guint i_period)
++{
++  struct v4l2_ext_controls ctrls;
++  struct v4l2_ext_control controls[3];
++  guint i;
++
++  memset (&ctrls, 0, sizeof (ctrls));
++  memset (controls, 0, sizeof (controls));
++
++  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
++  ctrls.count = 3;
++  ctrls.controls = controls;
++
++  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
++  controls[0].value = gop_size;
++  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
++  controls[1].value = bitrate;
++  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
++  controls[2].value = i_period;
++
++  if (v4l2object->ioctl (v4l2object->video_fd, VIDIOC_S_EXT_CTRLS, &ctrls)) {
++    GST_DEBUG_OBJECT (v4l2object, "Failed to set extended "
++        "controls for encoder");
++    return;
++  }
++}
++
++static gboolean
++gst_v4l2_h264_enc_start (GstV4l2VideoEnc * v4l2enc)
++{
++  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (v4l2enc);
++
++  gst_v4l2_h264_enc_set_ctrls (v4l2enc->v4l2output, self->bitrate,
++      self->gopsize, self->iperiod);
++  gst_v4l2_h264_enc_get_ctrls (v4l2enc->v4l2output);
++
++  return GST_VIDEO_ENCODER_CLASS (parent_class)->start (v4l2enc);
+ }
+
+ static void
+@@ -278,12 +392,14 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
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
+   GST_DEBUG_CATEGORY_INIT (gst_v4l2_h264_enc_debug, "v4l2h264enc", 0,
+       "V4L2 H.264 Encoder");
+@@ -297,8 +413,24 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
+       GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_set_property);
+   gobject_class->get_property =
+       GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_get_property);
++  video_encoder_class->start = GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_start);
+
+   baseclass->codec_name = "H264";
++  g_object_class_install_property (gobject_class, PROP_BITRATE,
++      g_param_spec_uint ("bitrate", "Bitrate", "Bitrate in bit/sec",
++          50 * 1000, 100 * 1000 * 1000, DEFAULT_PROP_BITRATE,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
++  g_object_class_install_property (gobject_class, PROP_GOPSIZE,
++      g_param_spec_uint ("gop-size", "Gop size", "Size of a group of "
++          "picture starting with an IDR frame",
++          1, 7200, DEFAULT_PROP_GOPSIZE,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
++  g_object_class_install_property (gobject_class, PROP_I_PERIOD,
++      g_param_spec_uint ("i-period", "I period", "I Frame Period",
++          1, 600, DEFAULT_PROP_I_PERIOD,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+   baseclass->profile_cid = V4L2_CID_MPEG_VIDEO_H264_PROFILE;
+   baseclass->profile_to_string = v4l2_profile_to_string;
+   baseclass->profile_from_string = v4l2_profile_from_string;
+diff --git a/sys/v4l2/gstv4l2h264enc.h b/sys/v4l2/gstv4l2h264enc.h
+index 3bfa34346..9f8f7e120 100644
+--- a/sys/v4l2/gstv4l2h264enc.h
++++ b/sys/v4l2/gstv4l2h264enc.h
+@@ -42,6 +42,10 @@ typedef struct _GstV4l2H264EncClass GstV4l2H264EncClass;
+ struct _GstV4l2H264Enc
+ {
+   GstV4l2VideoEnc parent;
++  /*H264 Extended Controls */
++  guint bitrate;
++  guint gopsize;
++  guint iperiod;
+ };
+
+ struct _GstV4l2H264EncClass
+--
+2.17.1
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
index e2ddbc27..0c6dc81b 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
@@ -8,6 +8,7 @@ SRC_URI += " \
     file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
     file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
+    file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch \
 "
 
 PR_append = ".arago3"
-- 
2.17.1

