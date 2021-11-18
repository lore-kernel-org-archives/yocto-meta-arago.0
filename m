Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.1798.1637213319936717614
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 21:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=YYIQwKIi;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.216.49, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pj1-f49.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so7231112pjb.2
        for <meta-arago@lists.yoctoproject.org>; Wed, 17 Nov 2021 21:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Ka4zZjnEIi3evC8oj0plJfB7CGTW6PUWzUzRwBoQn9U=;
        b=YYIQwKIiIaLZwsi/iwGEQRvITDsUzbbCmeXK5lGSPUHTqEwGLqYWRKHcH+zR1Fipam
         0qW7sXxiICW+0SAWxF8hTLcalA6vy9MXVPNQzJAjdCBZRTg0qf7bb+y5juMI6/Yp5f7a
         2t5kbD8XDLfKG9cPzdKsiPiRPXhmirOubuy5we9zy82XsOhXiFQf91ZEPSaGD0MwN1Z/
         rYYllRNp7wOLC+IIfqqfDxebSQ485RIVPCInPFu4UwneW8kuvLTNuvwDkfuE76l37f4U
         WYN21jysSzSEawLQW5tizPHcGBkpvBZCWv98zpaVOoulWw0SvgLVmyJU39xE0OsweAiz
         QNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ka4zZjnEIi3evC8oj0plJfB7CGTW6PUWzUzRwBoQn9U=;
        b=Xal2oO6JNCZByRwAZ2Nu9ge+kvJ4y/ZBVKD6G8BPoX5Gl/f1E/INSkHletzAiBF3/x
         u0RlHeZpirOrzYwcVzAulrx+5CHt6E/j6jhZyG/FsuaQji1MWzQw4Qo7O5PYTllDWgxb
         4juOadDydiqUIAVwOIGSW3U0aclGfse/XI+Ug5nH+jbYEGjVkp/eFAnxFxRHIOrXAyVA
         8rpBYyA+/3Vo13DjxX3c5zjc9IjgDaO3eKvmd/I2H38t4XNA3Oj/C39ar2Z+45w+dNNR
         Mr0oV083S9mTJxbY5PGNmes+pSlmfcEDpICjQa6vS9Cjmg5K+aqLerfbMKdzcexRqClO
         o4aw==
X-Gm-Message-State: AOAM531FNZ9Dp7JfIDPT2NgJFfrijXO/sd4WDT3mgE6A1mrFu/3/821V
	sply4RHY7776qdDZzj9jk3WVnjiNm18vYw==
X-Google-Smtp-Source: ABdhPJzIyn6Tmggut+Ui8vV095QjfJfbiWjR3If3yM8iwYjdupQVmREmnTTOupmexqenRbV6Ro9qpg==
X-Received: by 2002:a17:90a:6f61:: with SMTP id d88mr7327034pjk.109.1637213319047;
        Wed, 17 Nov 2021 21:28:39 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([49.207.219.77])
        by smtp.gmail.com with ESMTPSA id t4sm1494716pfq.163.2021.11.17.21.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 21:28:38 -0800 (PST)
From: sidraya.bj@pathpartnertech.com
To: meta-arago@lists.yoctoproject.org
Cc: denis@denix.org,
	yogeshs@ti.com,
	praneeth@ti.com,
	d-huang@ti.com,
	prashanth.ka@pathpartnertech.com,
	praveen.ap@pathpartnertech.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH v2] Avoiding Failure to allocate required memory error.
Date: Thu, 18 Nov 2021 10:58:28 +0530
Message-Id: <20211118052828.15859-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1

From: Sidraya <sidraya.bj@pathpartnertech.com>

max variable is setting 32 constant which
leads to following error
"ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
Failed to allocate required memory."

Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
Tested-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
Added Tested-by line

 ...-Failure-to-allocate-required-memory.patch | 34 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
new file mode 100644
index 00000000..f886f06b
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Avoiding-Failure-to-allocate-required-memory.patch
@@ -0,0 +1,34 @@
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
2.17.1

