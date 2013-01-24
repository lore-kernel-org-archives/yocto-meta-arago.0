Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 9EE6152A57
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:32 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so9898034oag.10
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cC6N5KAG6er+J+r5R79ncvspUqUxEELw0PIj0BGwP/A=;
	b=Q+9zFTN99t6Mjgm3tsigxAtp2pTm/vTKSlJbTGdP1SFOp4ZdBlYVRKCEtlYQpuZtst
	by1mcr/h8rqA0iYgCdzrDR9BlkwCibtURpFJzTmVS0aoty9HqBH/xKuzxqYXVmlrPECm
	1JMRYyUeHrNkz+B9FvKEKh2s1Pt9tyspSNSft+/kAwiQiKQTqSH0/A7+0/wCFx8Vv5cs
	LTVdm7lloPB33//GErZnLXEidT4fZctwc/vXYqYbFX4iJEr2L93neuq3xuZmtEEkkczJ
	XDHCd/xwj4wLmksH0QMFiBSHC5TqjQOPdoz0FCnUwIA7AyKbrjAruNB5BE3x51Lo6tMU
	PCSA==
X-Received: by 10.60.154.169 with SMTP id vp9mr1520124oeb.109.1359037292077;
	Thu, 24 Jan 2013 06:21:32 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:31 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:07 -0600
Message-Id: <1359037281-12610-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 33/47] libav: Disable any mp3 or mpeg2 related features
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:32 -0000

* Disable any features based on mpeg2 or mp3

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-multimedia/libav/libav_0.7.4.bbappend  |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend
new file mode 100644
index 0000000..525b546
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend
@@ -0,0 +1,25 @@
+PR_append = "-arago0"
+
+# Disable features that have potential commercial licensing restrictions
+EXTRA_OECONF += "\
+    --disable-encoder=libmp3lame \
+    --disable-decoder=mp3 \
+    --disable-decoder=mp3adu \
+    --disable-decoder=mp3adufloat \
+    --disable-decoder=mp3float \
+    --disable-decoder=mp3on4 \
+    --disable-decoder=mp3on4float \
+    --disable-muxer=mp3 \
+    --disable-demuxer=mp3 \
+    --disable-bsf=mp3_header_decompress \
+    --disable-bsf=mp3_header_compress   \
+                                 \
+    --disable-encoder=mpeg2video \
+    --disable-decoder=mpeg2video \
+    --disable-hwaccel=mpeg2_vaapi \
+    --disable-hwaccel=mpeg2_dxva2 \
+    --disable-muxer=mpeg2dvd \
+    --disable-muxer=mpeg2svcd \
+    --disable-muxer=mpeg2video \
+    --disable-muxer=mpeg2vob \
+"
-- 
1.7.0.4


