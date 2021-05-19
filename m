Return-Path: <roopangkumar.patel@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 6526352B9E
	for <meta-arago@arago-project.org>;
	Wed, 19 May 2021 12:46:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14JCl8b7111191;
	Wed, 19 May 2021 07:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621428428;
	bh=cjL7+Zfy7yVnBscA5EmkZfhr4NrMYwLNF8M1YXXnLFY=;
	h=From:To:CC:Subject:Date;
	b=UQrzzA9KGgGScWOFZQtJaM+eIIM6mkZnNahHvyXBVRjW/L+jDmVODAshSbLPmXdqh
	CW9OQgcJQ+56/Kg6SA5ggQZVkm8cSjp4+zvktK0B5gCiH2vojtG4aM44jZc8bBBPS7
	6CWSSRE5ionbJ0GKeIskTjr+lQF9/tCpxPwem5yA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14JCl8PM021994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 May 2021 07:47:08 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 19 May 2021 07:47:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 19 May 2021 07:47:08 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14JCl0u3049233;
	Wed, 19 May 2021 07:47:02 -0500
From: <roopangkumar.patel@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Wed, 19 May 2021 18:16:42 +0530
Message-ID: <20210519124642.21701-1-roopangkumar.patel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 19 May 2021 16:22:25 +0000
Cc: praveen.ap@pathpartnertech.com, prashanth.amai@ti.com,
	Roopang Patel <roopangkumar.patel@ti.com>, sidraya.bj@pathpartnertech.com
Subject: [PATCH] v4l2 H264 encoder plugin changes
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
X-List-Received-Date: Wed, 19 May 2021 12:46:34 -0000
Content-Type: text/plain

From: Roopang Patel <roopangkumar.patel@ti.com>

Changes:
1) Given support of v4l2 extra controls such as
bitrate,gopsize and iperiod for H264 encoding and
also added as v4l2 H264 plugin properties to set and
get for dynamic value change.

2) We need to set these extra controls before the gstreamer
pipeline set format API invoke.so, we are setting extra
controls when the pipeline change the state
GST_STATE_CHANGE_READY_TO_PAUSED.
---
 sys/v4l2/gstv4l2h264enc.c | 135 +++++++++++++++++++++++++++++++++++++-
 sys/v4l2/gstv4l2h264enc.h |   9 +++
 2 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/sys/v4l2/gstv4l2h264enc.c b/sys/v4l2/gstv4l2h264enc.c
index ee160b3a0..169e6ae69 100644
--- a/sys/v4l2/gstv4l2h264enc.c
+++ b/sys/v4l2/gstv4l2h264enc.c
@@ -47,6 +47,9 @@ enum
 {
   PROP_0,
   V4L2_STD_OBJECT_PROPS,
+  PROP_BITRATE,
+  PROP_GOPSIZE,
+  PROP_I_PERIOD,
 /* TODO add H264 controls
  * PROP_I_FRAME_QP,
  * PROP_P_FRAME_QP,
@@ -78,14 +81,46 @@ static void
 gst_v4l2_h264_enc_set_property (GObject * object,
     guint prop_id, const GValue * value, GParamSpec * pspec)
 {
-  /* TODO */
+  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
+
+  switch(prop_id)
+  {
+    case PROP_BITRATE:{
+     self->bitrate = g_value_get_uint (value);
+    }break;
+    case PROP_GOPSIZE:{
+     self->gopsize = g_value_get_uint (value);
+    }break;
+    case PROP_I_PERIOD:{
+     self->iperiod = g_value_get_uint (value);
+    }break;
+    default:{
+     G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+    }break;
+  }
 }
 
 static void
 gst_v4l2_h264_enc_get_property (GObject * object,
     guint prop_id, GValue * value, GParamSpec * pspec)
 {
-  /* TODO */
+  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
+
+  switch(prop_id)
+  {
+    case PROP_BITRATE:{
+     g_value_set_uint (value, self->bitrate);
+    }break;
+    case PROP_GOPSIZE:{
+     g_value_set_uint (value, self->gopsize);
+    }break;
+    case PROP_I_PERIOD:{
+     g_value_set_uint (value, self->iperiod);
+    }break;
+    default:{
+     G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+    }break;
+  }
 }
 
 static gint
@@ -270,6 +305,82 @@ v4l2_level_to_string (gint v4l2_level)
 static void
 gst_v4l2_h264_enc_init (GstV4l2H264Enc * self)
 {
+  /* Initializing H264 encoder control parameter with
+  * default values */
+  self->bitrate = DEFAULT_PROP_BITRATE;
+  self->gopsize = DEFAULT_PROP_GOPSIZE;
+  self->iperiod = DEFAULT_PROP_I_PERIOD;
+}
+
+static void
+gst_v4l2_h264_enc_get_ctrls(GstV4l2Object * v4l2object)
+{
+  struct v4l2_ext_controls ctrls;
+  struct v4l2_ext_control controls[3];
+  guint i;
+
+  memset(&ctrls, 0, sizeof(ctrls));
+  memset(controls, 0, sizeof(controls));
+
+  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
+  ctrls.count = 3;
+  ctrls.controls = controls;
+
+  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
+  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
+  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
+
+  if (v4l2object->ioctl(v4l2object->video_fd, VIDIOC_G_EXT_CTRLS, &ctrls)) {
+    GST_DEBUG_OBJECT(v4l2object,"Failed to get extra "
+    "controls for H264 encoder");
+    return;
+  }
+}
+
+static void
+gst_v4l2_h264_enc_set_ctrls(GstV4l2Object * v4l2object, guint bitrate,
+							guint gop_size, guint i_period)
+{
+  struct v4l2_ext_controls ctrls;
+  struct v4l2_ext_control controls[3];
+  guint i;
+
+  memset(&ctrls, 0, sizeof(ctrls));
+  memset(controls, 0, sizeof(controls));
+
+  ctrls.which = V4L2_CTRL_WHICH_CUR_VAL;
+  ctrls.count = 3;
+  ctrls.controls = controls;
+
+  controls[0].id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
+  controls[0].value = gop_size;
+  controls[1].id = V4L2_CID_MPEG_VIDEO_BITRATE;
+  controls[1].value = bitrate;
+  controls[2].id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD;
+  controls[2].value = i_period;
+
+  if (v4l2object->ioctl(v4l2object->video_fd, VIDIOC_S_EXT_CTRLS, &ctrls)) {
+    GST_DEBUG_OBJECT(v4l2object,"Failed to set extra "
+    "controls for encoder");
+    return;
+  }
+}
+
+static GstStateChangeReturn
+gst_v4l2_h264_enc_change_state (GstElement * element,
+    GstStateChange transition)
+{
+  GstV4l2VideoEnc *parent = GST_V4L2_VIDEO_ENC (element);
+  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (element);
+
+  if(transition == GST_STATE_CHANGE_READY_TO_PAUSED)
+  {
+    gst_v4l2_h264_enc_set_ctrls(parent->v4l2output, self->bitrate,
+                                self->gopsize, self->iperiod);
+    gst_v4l2_h264_enc_get_ctrls(parent->v4l2output);
+  }
+
+  return GST_ELEMENT_CLASS (parent_class)->change_state (element, transition);
 }
 
 static void
@@ -278,12 +389,14 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
   GstElementClass *element_class;
   GObjectClass *gobject_class;
   GstV4l2VideoEncClass *baseclass;
+  GstVideoEncoderClass *video_encoder_class;
 
   parent_class = g_type_class_peek_parent (klass);
 
   element_class = (GstElementClass *) klass;
   gobject_class = (GObjectClass *) klass;
   baseclass = (GstV4l2VideoEncClass *) (klass);
+  video_encoder_class = (GstVideoEncoderClass *) klass;
 
   GST_DEBUG_CATEGORY_INIT (gst_v4l2_h264_enc_debug, "v4l2h264enc", 0,
       "V4L2 H.264 Encoder");
@@ -298,6 +411,9 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
   gobject_class->get_property =
       GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_get_property);
 
+  element_class->change_state =
+        GST_DEBUG_FUNCPTR (gst_v4l2_h264_enc_change_state);
+
   baseclass->codec_name = "H264";
   baseclass->profile_cid = V4L2_CID_MPEG_VIDEO_H264_PROFILE;
   baseclass->profile_to_string = v4l2_profile_to_string;
@@ -305,6 +421,21 @@ gst_v4l2_h264_enc_class_init (GstV4l2H264EncClass * klass)
   baseclass->level_cid = V4L2_CID_MPEG_VIDEO_H264_LEVEL;
   baseclass->level_to_string = v4l2_level_to_string;
   baseclass->level_from_string = v4l2_level_from_string;
+
+  g_object_class_install_property (gobject_class, PROP_BITRATE,
+    g_param_spec_uint ("bitrate", "Bitrate", "Bitrate in kbit/sec",
+    24000, 100 * 1000 * 1000, DEFAULT_PROP_BITRATE,
+    G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS ));
+
+  g_object_class_install_property (gobject_class, PROP_GOPSIZE,
+    g_param_spec_uint ("gopsize", "Gopsize", "IDR frame interval",
+    1,7200, DEFAULT_PROP_GOPSIZE,
+    G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS ));
+
+  g_object_class_install_property (gobject_class, PROP_I_PERIOD,
+    g_param_spec_uint ("iperiod", "Iperiod", "I Frame Period",
+    1,600, DEFAULT_PROP_I_PERIOD,
+    G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS ));
 }
 
 /* Probing functions */
diff --git a/sys/v4l2/gstv4l2h264enc.h b/sys/v4l2/gstv4l2h264enc.h
index 3bfa34346..370bcf535 100644
--- a/sys/v4l2/gstv4l2h264enc.h
+++ b/sys/v4l2/gstv4l2h264enc.h
@@ -39,9 +39,18 @@ G_BEGIN_DECLS
 typedef struct _GstV4l2H264Enc GstV4l2H264Enc;
 typedef struct _GstV4l2H264EncClass GstV4l2H264EncClass;
 
+#define DEFAULT_PROP_BITRATE 	(500 * 1000)
+#define DEFAULT_PROP_GOPSIZE 	(1800)
+#define DEFAULT_PROP_I_PERIOD 	(30)
+
 struct _GstV4l2H264Enc
 {
   GstV4l2VideoEnc parent;
+
+  /*H264 Extra Controls*/
+  guint bitrate;
+  guint gopsize;
+  guint iperiod;
 };
 
 struct _GstV4l2H264EncClass
-- 
2.17.1


