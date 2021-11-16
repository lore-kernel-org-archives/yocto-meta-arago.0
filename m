Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.487.1637094917443571516
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 12:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: pathpartnertech.com, ip: 198.47.23.249, mailfrom: sidraya.bj@pathpartnertech.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGKZBIa033869;
	Tue, 16 Nov 2021 14:35:11 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGKZBcr089854
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 14:35:11 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 14:35:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 14:35:11 -0600
Received: from sidraya-laptopU.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGKZ75R057339;
	Tue, 16 Nov 2021 14:35:08 -0600
From: sidraya.bj@pathpartnertech.com
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <yogeshs@ti.com>, <praneeth@ti.com>, <d-huang@ti.com>,
        <prashanth.ka@pathpartnertech.com>, <praveen.ap@pathpartnertech.com>,
        Sidraya
	<sidraya.bj@pathpartnertech.com>
Subject: [PATCH] [dunfell][gst-plugins-good 1.16.3] Avoiding Failure to allocate required memory error.
Date: Wed, 17 Nov 2021 02:05:02 +0530
Message-ID: <20211116203502.2750-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Sidraya <sidraya.bj@pathpartnertech.com>

max variable is setting 32 constant which
leads to following error
"ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
Failed to allocate required memory."

Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 ...-Failure-to-allocate-required-memory.patch | 35 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
new file mode 100644
index 00000000..2467977e
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
@@ -0,0 +1,35 @@
+From 356b8a2bbfef8e05ea3f8757e6bd357c268ad748 Mon Sep 17 00:00:00 2001
+From: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+Date: Wed, 10 Mar 2021 16:31:38 +0530
+Subject: [PATCH] [gst-plugins-good 1.16.3] Avoiding Failure to allocate required memory error.
+
+max variable is setting 32 which leads to following error
+"ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
+Failed to allocate required memory."
+
+Upstream-Status: Pending
+
+Signed-off-by: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
+---
+ sys/v4l2/gstv4l2videodec.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2videodec.c b/sys/v4l2/gstv4l2videodec.c
+index adb620d79..c1deb8896 100644
+--- a/sys/v4l2/gstv4l2videodec.c
++++ b/sys/v4l2/gstv4l2videodec.c
+@@ -611,10 +611,9 @@ gst_v4l2_video_dec_handle_frame (GstVideoDecoder * decoder,
+     if (!gst_buffer_pool_is_active (pool)) {
+       GstStructure *config = gst_buffer_pool_get_config (pool);
+       guint min = MAX (self->v4l2output->min_buffers, GST_V4L2_MIN_BUFFERS);
+-      guint max = VIDEO_MAX_FRAME;
+ 
+       gst_buffer_pool_config_set_params (config, self->input_state->caps,
+-          self->v4l2output->info.size, min, max);
++		      self->v4l2output->info.size, min, 2);
+ 
+       /* There is no reason to refuse this config */
+       if (!gst_buffer_pool_set_config (pool, config))
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
index 0c6dc81b..11513f2f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
@@ -9,6 +9,7 @@ SRC_URI += " \
     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
     file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
     file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch \
+    file://0001-Avoiding-Failure-to-allocate-required-memory.patch \
 "
 
 PR_append = ".arago3"
-- 
2.25.1

