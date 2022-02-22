Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.9804.1645512118278206028
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 22:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pathpartnertech.com header.s=google header.b=pWMWMTKK;
 spf=pass (domain: pathpartnertech.com, ip: 209.85.210.181, mailfrom: sidraya.bj@pathpartnertech.com)
Received: by mail-pf1-f181.google.com with SMTP id x18so10999312pfh.5
        for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 22:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id
         :content-transfer-encoding;
        bh=6RH/bOdIQeqhsnIfdjgmYXQbCMUELJjP9H0gObnRNeQ=;
        b=pWMWMTKKiZRq1IizGwttvIYFk9naSwWD9vfLfEcr7hPmb70IIVgH/Ur3pb9ov5jySB
         v4rWoOVrRBqaFPKpYjMHdTDiyRHnol2RAJcE9Jd0oNsLPBNaJzZpclWyF/gFqr7GE9wH
         bbGYBbLrWaZhzhUyqvlnQh6u1LYCkMlrpgeeMKCH9LBtOvDRzPv07roODfOXbEPpFJu3
         L8TkMHzObn9WQzyOwkHZPUoqLs5X+oly5zZCo7K9UnHN1Tdq/d9VlXYhogRNbMg+T3tk
         6+nQ61syvU4UPhMBqAxMG4fvl12RXMGRfArBQX9sN1arw6liZ+EtvySauwLvUBNidXvF
         ruIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :content-transfer-encoding;
        bh=6RH/bOdIQeqhsnIfdjgmYXQbCMUELJjP9H0gObnRNeQ=;
        b=q8S+Ipsh1ycRW5VEkU+HCzH7WXLVfOR4sQjrcSx3OotkOUIN4Ky5lPqIF5hoEVyhCV
         FQRWvQgE27MwrvdyJLu7AEqHXuEEfSviRYH9I7uMPjr8buyL+voxqliGHqo7i3WFpVx1
         wQ/NEvsC9vZY6nLKu+35R7D86ygVaNKQ9zWluogvOSvLD3g88liw0jGN8urQX2x9L60v
         ybGoHNbqoiYC+b6A+l+oJwkP69TOiFCaTjQwO7HCR/cJkqKGUxLJrl+HmhGjh3hCzkhs
         bop3gE2DNlsW2AiAkWeX4XIJ9ytBNPcHDtpdeAMI3VVqylKW78xpP/8N1Eegbt6QAgSg
         goLw==
MIME-Version: 1.0
X-Gm-Message-State: AOAM532IreZFr2tMG84zPQ86LLDtYxGHCI8CnVmojhgRa+YUwpj8l7t7
	QU9jVhgNboFKkz8VA1/ZCoagZjFLbZCffKznMHO985Vkeffkqv454pelnaPOTNbCQnSfP+ssZyG
	qlAHo4CMzYJ/AEyQ0U439IcJiMG6MfvchxAk=
X-Google-Smtp-Source: ABdhPJwFkOVzl0cj0ityPlfez7QNCASlUAMzC/KaTZnNoogLLa21tdaqzBRvnU/NktdW1e+twX1pqA==
X-Received: by 2002:a63:ea07:0:b0:372:f0e9:50b9 with SMTP id c7-20020a63ea07000000b00372f0e950b9mr18762951pgi.566.1645512117637;
        Mon, 21 Feb 2022 22:41:57 -0800 (PST)
Return-Path: <sidraya.bj@pathpartnertech.com>
Received: from localhost.localdomain ([103.117.236.138])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090a459100b001b93ef45c13sm1276303pjg.55.2022.02.21.22.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:41:57 -0800 (PST)
From: "Sidraya Jayagond" <sidraya.bj@pathpartnertech.com>
To: meta-arago@lists.yoctoproject.org
Cc: praneeth@ti.com,
	d-huang@ti.com,
	detheridge@ti.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [dunfell PATCH v2] gstreamer1.0-plugins-good: v4l2bufferpool: Set Video Meta to Imported Buffers
Date: Tue, 22 Feb 2022 12:11:45 +0530
Message-Id: <20220222064145.8043-1-sidraya.bj@pathpartnertech.com>
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
 ...l-Set-Video-Meta-to-Imported-Buffers.patch | 58 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.pa=
tch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch b/m=
eta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/000=
1-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
new file mode 100644
index 00000000..59d9080c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood/0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch
@@ -0,0 +1,58 @@
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
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1723#n=
ote_1266433
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
