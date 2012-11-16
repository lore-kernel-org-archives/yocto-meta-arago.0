Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 2347252A6F
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 04:31:40 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2249832obc.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 20:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KB5SWC9SvDFgKrVa33aKR5m/xkNJjzDOn1Dhg12o5Pw=;
	b=V7/O0Dq4l6tTb3mOO/mEd/KnLg/3104LnsA+XTv1Fj7eqZwUv/ICfPHe1qO/V/50KU
	k20ZpjKPvTN6fwIWSX+imZDb4MHoAZzjRBGpJ2FGcl9j9zqXBJ0nGsbXbaOIyvGPp7tu
	PF4HIL+/pkElblj0DcD5CLavETyKZ7SiP4bk7CuwcAtFXqzO7Y7+xO1GkysVtJ/WV9RD
	+mMwqM5WKZCnvSm2KpGs+ARNgdtkzKYcmua35holqO7dnMLdPKLu7fPkzJh9fufmRkCk
	fI/I96HTb0F8EurT/GQQeVN1me0kU5WpBral3OaT3M+9GgoUFQy/D+VvX7EHXfWRk3E0
	ZgxA==
Received: by 10.182.42.6 with SMTP id j6mr2855859obl.93.1353040299489;
	Thu, 15 Nov 2012 20:31:39 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm481759oeb.3.2012.11.15.20.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 20:31:39 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 22:31:27 -0600
Message-Id: <1353040290-26030-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353040290-26030-1-git-send-email-fcooper@ti.com>
References: <1353040290-26030-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/5] libav: Disable any mp3 or mpeg2 feature
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
X-List-Received-Date: Fri, 16 Nov 2012 04:31:40 -0000

* Disable any feature based on mpeg2 or mp3

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-multimedia/libav/libav_0.7.4.bbappend  |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_0.7.4.bbappend
new file mode 100644
index 0000000..cd431bc
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
+    --disable-hwaccel=mpeg2_vaapi\
+    --disable-hwaccel=mpeg2_dxva2\
+    --disable-muxer=mpeg2dvd \
+    --disable-muxer=mpeg2svcd \
+    --disable-muxer=mpeg2video \
+    --disable-muxer=mpeg2vob \
+"
-- 
1.7.0.4


