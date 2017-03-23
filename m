Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 6B08C52A2E
	for <meta-arago@arago-project.org>;
	Thu, 23 Mar 2017 17:26:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2NHQ4Df007400
	for <meta-arago@arago-project.org>; Thu, 23 Mar 2017 12:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490289964;
	bh=O0nGIKF5fyLL/EaC1nQT22N49TOnWWlqx93P/0tulM4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cQnmG2+wSJpQC46swncolC3tv6nmXJ/XN6/91tBoQxOfQ9dbISsC3OAMfXfldby6I
	0vq88HSyrLymGXJiBoli5qlxNAjYebOuMNP3DojRm5E60mj/bh0C3VJTrF7zt9h8SW
	TO1Md6MY6Oqdye/ftq3Yw0ZOjRZSund9wfkbnVf4=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2NHPxF7010638
	for <meta-arago@arago-project.org>; Thu, 23 Mar 2017 12:25:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Mar 2017 12:25:58 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2NHPw6t025879	for <meta-arago@arago-project.org>;
	Thu, 23 Mar 2017 12:25:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Mar 2017 13:25:51 -0400
Message-ID: <1490289952-52560-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1490289952-52560-1-git-send-email-e-ruei1@ti.com>
References: <1490289952-52560-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty][PATCH 2/3] gstreamer1.0-plugins-bad: kmssink: add YUYV(YUY2) support
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
X-List-Received-Date: Thu, 23 Mar 2017 17:26:14 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0003-kmssink-add-YUYV-support.patch            | 81 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.8.3.bbappend        |  2 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch
new file mode 100644
index 0000000..a57a0bb
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-add-YUYV-support.patch
@@ -0,0 +1,81 @@
+From 11a3ff4b9451f12374006f853ef5736f5d098932 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 14 Mar 2017 17:24:07 -0400
+Subject: [PATCH 3/3] kmssink: add YUYV support
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
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
index 29c72b0..d420ac0 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
@@ -25,6 +25,7 @@ SRC_URI_append_ti43x = " \
     file://0003-gstkmssink-Add-support-for-KMS-based-sink.patch \
     file://0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch \
     file://0002-kmssink-remove-DCE-dependencies.patch \
+    file://0003-kmssink-add-YUYV-support.patch \
 "
 
 SRC_URI_append_ti33x = " \
@@ -37,6 +38,7 @@ SRC_URI_append_omap-a15 = " \
     file://0003-gstkmssink-Add-support-for-KMS-based-sink.patch \
     file://0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch \
     file://0002-kmssink-remove-DCE-dependencies.patch \
+    file://0003-kmssink-add-YUYV-support.patch \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


