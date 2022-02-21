Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.8624.1645434820681356175
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 01:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=GsUnWtHO;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.214.175, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pl1-f175.google.com with SMTP id q1so3818800plx.4
        for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 01:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id
         :content-transfer-encoding;
        bh=1BcPm7NwT0iiDRLmHuRpAsd99Yc53ORrxUsKEw4G2C8=;
        b=GsUnWtHOIm7h7XSdmRh/DOTxkuRhSDmpqwDTHt7AbBmcltLDtifNGkw4zsyKNek47e
         JqMQXhFqwh3VbVPrWhTRUnl0VfYomdfu5stI1hMktYXtLC9BIHijQL3NLhcKPsuim7Db
         bW+xCpSsJb3MwA5+eDE6OOwsjbru4GE6n7iobNvs1lk/ou1JuglHyLyNWx10DU8j07/b
         IZOSWKcfwwv0qzwkC9ktBglKl7BlwPnJDdXVDLgyflXxQt6+mnB0TF7YjET182r+r0tK
         OiSnN2lcug+GLF4/uzjtNCUF6wIRvIEaqFFf/lhNSDAmbOA8cGV+62UG3l7LPrAqPr/k
         VFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :content-transfer-encoding;
        bh=1BcPm7NwT0iiDRLmHuRpAsd99Yc53ORrxUsKEw4G2C8=;
        b=Ma7vrOXwsDuziaE3q1EjOB+T1W/btjLT0Er5pBIMrA3zZKljS0w0uYt9UkOdDGn6bl
         6J/t5rvAz+6v4AINjPFXkROzMpiH5EXY6o+oFKWlMyhK/XB9FoShaUHulgctQA5S59fK
         CINqkJ5veMo7LqQ+IblArmRLaXZyn2wjmq9Lh++76oyukSV4EAkltAz7tVUrUvBnfNpv
         z6YMd6D0bXUeICgbB98/RCBsXgCXcomKt9exsrGfA8RaaGLpuZYzjVTEuwIb9S7n3Yqd
         WSf4Iponh/Kz4E7hHJ//c8ZKX4yU+dTGoGA8frknuxHic9zEW1kNbL0n8j/SeSrVbB8G
         EtsQ==
MIME-Version: 1.0
X-Gm-Message-State: AOAM533s6ekxXe1xF7t0XKwgQ/+Ws7tj2Nbx3SJS/vF3V1zRGY1phYpF
	wc2BYuju2yBnh/dJJUaOCLvq2S24zYipGaSxaBW8VXP9ieu92vAUC7aQaHuemvtD7JHwa+PD/i4
	L//Tt88q6AMJQmCVlSYS7X2IiTFJAY6o771Y=
X-Google-Smtp-Source: ABdhPJw/4VHRfG+qa5blmFyVEEDEdd5gul65W8dUQJqNHbIgKkjYg0onEo4hn4juP3nyDtRG6AB8BA==
X-Received: by 2002:a17:902:b597:b0:14f:3396:a7a5 with SMTP id a23-20020a170902b59700b0014f3396a7a5mr18249913pls.29.1645434819895;
        Mon, 21 Feb 2022 01:13:39 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([103.117.236.138])
        by smtp.gmail.com with ESMTPSA id t17-20020a17090b019100b001b9fbc9a0d6sm7008962pjs.41.2022.02.21.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 01:13:39 -0800 (PST)
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-arago@lists.yoctoproject.org
Cc: praneeth@ti.com,
	d-huang@ti.com,
	detheridge@ti.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [dunfell PATCH] gstreamer1.0-plugins-good: v4l2bufferpool: Set Video Meta to Imported Buffers
Date: Mon, 21 Feb 2022 14:43:27 +0530
Message-Id: <20220221091327.15343-1-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

From: Sidraya <sidraya.bj@pathpartnertech.com>

When importing dmabufs, the video meta is set on the dest
buffer, but not on the src buffer. In this case, the src
buffer is not made aware of the stride of the video buffer,
which is needed to properly display the buffer.

This is a result of the v4l2 plugin creating it's own
empty dmabuf pool of GstBuffers, and then assigning the
memory from the downstream GstBuffer. We then update the
video meta of the buffer in our pool, but not the downstream
pool.

The downstream pool buffer should be updated as well.

Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 ...l-Set-Video-Meta-to-Imported-Buffers.patch | 57 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.pa=
tch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch b/m=
eta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/000=
1-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
new file mode 100644
index 00000000..420044b1
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
@@ -0,0 +1,57 @@
+From e677028494081f93558d24b1f72da9e6835ef954 Mon Sep 17 00:00:00 2001
+From: Sidraya <sidraya.bj@pathpartnertech.com>
+Date: Mon, 18 Oct 2021 13:35:09 +0530
+Subject: [PATCH] v4l2bufferpool: Set Video Meta to Imported Buffers
+
+When importing dmabufs, the video meta is set on the dest
+buffer, but not on the src buffer. In this case, the src
+buffer is not made aware of the stride of the video buffer,
+which is needed to properly display the buffer.
+
+This is a result of the v4l2 plugin creating it's own
+empty dmabuf pool of GstBuffers, and then assigning the
+memory from the downstream GstBuffer. We then update the
+video meta of the buffer in our pool, but not the downstream
+pool.
+
+The downstream pool buffer should be updated as well.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
+---
+ sys/v4l2/gstv4l2bufferpool.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
+index 49f222b6e..f4d964b9e 100644
+--- a/sys/v4l2/gstv4l2bufferpool.c
++++ b/sys/v4l2/gstv4l2bufferpool.c
+@@ -330,6 +330,10 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2BufferPool=
 * pool,
+   GstMemory *dma_mem[GST_VIDEO_MAX_PLANES] =3D { 0 };
+   guint n_mem =3D gst_buffer_n_memory (src);
+   gint i;
++  GstV4l2Object *obj;
++  GstVideoInfo *info;
++  obj =3D pool->obj;
++  info =3D &obj->info;
+=20
+   GST_LOG_OBJECT (pool, "importing dmabuf");
+=20
+@@ -346,6 +350,13 @@ gst_v4l2_buffer_pool_import_dmabuf (GstV4l2BufferPool=
 * pool,
+           dma_mem))
+     goto import_failed;
+=20
++  /* add metadata to raw video buffers */
++  if (pool->add_videometa)
++    gst_buffer_add_video_meta_full (src, GST_VIDEO_FRAME_FLAG_NONE,
++        GST_VIDEO_INFO_FORMAT (info), GST_VIDEO_INFO_WIDTH (info),
++        GST_VIDEO_INFO_HEIGHT (info), GST_VIDEO_INFO_N_PLANES (info),
++        info->offset, info->stride);
++
+   gst_mini_object_set_qdata (GST_MINI_OBJECT (dest), GST_V4L2_IMPORT_QUAR=
K,
+       gst_buffer_ref (src), (GDestroyNotify) gst_buffer_unref);
+=20
+--=20
+2.17.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.16.%.bbappend
index 11513f2f..07cd08a7 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.16.%.bbappend
@@ -10,6 +10,7 @@ SRC_URI +=3D " \
     file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch=
 \
     file://0001-gst-plugins-good-1.16.3-v4l2h264enc-Add-Extended-con.patch=
 \
     file://0001-Avoiding-Failure-to-allocate-required-memory.patch \
+    file://0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch \
 "
=20
 PR_append =3D ".arago3"
--=20
2.17.1


--=20






This
message contains confidential information and is intended only=20
for the
individual(s) named. If you are not the intended
recipient, you are=20
notified that disclosing, copying, distributing or taking any
action in=20
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail=20
from your system. E-mail transmission
cannot be guaranteed to be secured or=20
error-free as information could be
intercepted, corrupted, lost, destroyed,=20
arrive late or incomplete, or contain
viruses. The sender therefore does=20
not accept liability for any errors or
omissions in the contents of this=20
message, which arise as a result of e-mail
transmission.
