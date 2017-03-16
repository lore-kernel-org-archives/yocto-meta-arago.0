Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B098552A54
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 17:30:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GHTvt3028917
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 12:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489685397;
	bh=8JBgMXb9R+lY5809O6cilTeXzb1PmpCpIQ10eKCfUSc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hWWjK+JRCtxsupu6+/vdxOLNLh7u15MzMQVTG0I3/+fcz+glLa8AqLp/OujUMAy4e
	XJp8bKDMa6Bno4ISSOd3SiKF17knZrn3WJND93NeDI54SVFhObOWgOWQ38dTz/Gdy4
	c28TS6bLwhm5xYT7f6wmia3+7aXyo6EoMVA0mRQk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GHTq1d010827
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 12:29:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 12:29:52 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2GHTp12013751	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 12:29:52 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Mar 2017 13:29:36 -0400
Message-ID: <1489685377-53666-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489685377-53666-1-git-send-email-e-ruei1@ti.com>
References: <1489685377-53666-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [krogoth][PATCH 2/3] gstreamer1.0-plugins-bad: kmssink: add YUYV support
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
X-List-Received-Date: Thu, 16 Mar 2017 17:30:07 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0002-kmssink-add-YUYV-support.patch            | 81 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  2 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
new file mode 100644
index 0000000..a5791cc
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
@@ -0,0 +1,81 @@
+From af348c890c04ce9626d411055aae0974f410219f Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 14 Mar 2017 17:24:07 -0400
+Subject: [PATCH 2/2] kmssink: add YUYV support
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ sys/kms/gstkmsbufferpriv.c | 32 +++++++++++++++++++++++++++-----
+ sys/kms/gstkmssink.c       |  2 +-
+ 2 files changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/sys/kms/gstkmsbufferpriv.c b/sys/kms/gstkmsbufferpriv.c
+index 172a4c3..57c01f8 100644
+--- a/sys/kms/gstkmsbufferpriv.c
++++ b/sys/kms/gstkmsbufferpriv.c
+@@ -41,22 +41,44 @@
+ static int
+ create_fb (GstKMSBufferPriv * priv, GstKMSSink * sink)
+ {
++
+   /* TODO get format, etc from caps.. and query device for
+    * supported formats, and make this all more flexible to
+    * cope with various formats:
+    */
+-  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
+-
++  GstVideoFormat format = sink->format;
++  uint32_t fourcc;
+   uint32_t handles[4] = {
+-    omap_bo_handle (priv->bo), omap_bo_handle (priv->bo),
++    omap_bo_handle (priv->bo),
+   };
+   uint32_t pitches[4] = {
+-    GST_ROUND_UP_4 (sink->input_width), GST_ROUND_UP_4 (sink->input_width),
++    GST_ROUND_UP_4 (sink->input_width),
+   };
+   uint32_t offsets[4] = {
+-    0, pitches[0] * sink->input_height
++    0,
+   };
+ 
++  /**
++   * Only two formats are supported:
++   * AM3/4: YUYV
++   * AM5: NV12, YUYV
++   */
++  if(format == GST_VIDEO_FORMAT_YUY2)
++  {
++    /* YUYV */
++    fourcc = GST_MAKE_FOURCC ('Y', 'U', 'Y', 'V');
++    pitches[0] = GST_ROUND_UP_4 (sink->input_width*2);
++  }
++  else
++  {
++    /* NV12 */
++    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
++    handles[1] = omap_bo_handle (priv->bo);
++    pitches[1] = GST_ROUND_UP_4 (sink->input_width);
++    offsets[1] = pitches[0] * sink->input_height;
++  }
++
++
+   return drmModeAddFB2 (priv->fd, sink->input_width, sink->input_height,
+       fourcc, handles, pitches, offsets, &priv->fb_id, 0);
+ }
+diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
+index 9795bdf..b36d88f 100644
+--- a/sys/kms/gstkmssink.c
++++ b/sys/kms/gstkmssink.c
+@@ -50,7 +50,7 @@ static GstStaticPadTemplate gst_kms_sink_template_factory =
+ GST_STATIC_PAD_TEMPLATE ("sink",
+     GST_PAD_SINK,
+     GST_PAD_ALWAYS,
+-    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("NV12"))
++    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("{NV12,YUY2}"))
+     );
+ 
+ enum
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
index 2c903d4..317b19e 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
@@ -21,10 +21,12 @@ DEPENDS_append_ti33x = " \
 
 SRC_URI_append_omap-a15 = " \
     file://0001-kmssink-remove-DCE-dependencies.patch \
+    file://0002-kmssink-add-YUYV-support.patch \
 "
 
 SRC_URI_append_ti43x = " \
     file://0001-kmssink-remove-DCE-dependencies.patch \
+    file://0002-kmssink-add-YUYV-support.patch \
 "
 
 SRC_URI_append_ti33x = " \
-- 
1.9.1


