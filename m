Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gh0-f182.google.com (mail-gh0-f182.google.com
	[209.85.160.182])
	by arago-project.org (Postfix) with ESMTPS id 29FDF52A5D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:57 +0000 (UTC)
Received: by mail-gh0-f182.google.com with SMTP id z15so471672ghb.27
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=l5eMwihJsuxke8lYRiVBywxH3gMSe6qon/2IvpjwMno=;
	b=erI20CpsGlo+5g/RTU1a5Vqppylqci48FfvQXgbqXutmvXSuDuooAZw+oRkw0dzY82
	YENCVi/ieT0dZoFLV4PjboHTE8pmy+IJj0f7E9Mu8TSDPErh5RTdZCZSGFTsVDuqSwiX
	pYBRy3sxXLrUh6nEH8Do5DtzzPKC8sInMSr5MN8r4a8tirC//EpBiD/J+BKh3g3VHdGm
	iI7qG+0WY0oanFNu0B3ViYKD+ql8tQdjtVPKHwti6IfdQRsPc4xIHVxTfUa6rS9IBuoH
	38SZdJewfhTixmZu7BAI8Us2PpNseIPgkQydFN36qqzLpxwNV/u9wZUnr3k/b9nqYbWT
	ArAQ==
X-Received: by 10.236.57.10 with SMTP id n10mr17204542yhc.50.1361141636549;
	Sun, 17 Feb 2013 14:53:56 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:55 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:13 -0600
Message-Id: <1361141595-1687-18-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 18/20] libav: Remove AC3 and DTS
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:57 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Remove additional references to software that might have patent or license
  issues surrounding it.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-multimedia/libav/libav_0.8.3.bbappend  |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.3.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.3.bbappend
index 525b546..f33cc54 100644
--- a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.3.bbappend
+++ b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.3.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 # Disable features that have potential commercial licensing restrictions
 EXTRA_OECONF += "\
@@ -22,4 +22,16 @@ EXTRA_OECONF += "\
     --disable-muxer=mpeg2svcd \
     --disable-muxer=mpeg2video \
     --disable-muxer=mpeg2vob \
+                            \
+    --disable-encoder=ac3_fixed \
+    --disable-encoder=ac3 \
+    --disable-decoder=ac3 \
+    --disable-decoder=eac3 \
+    --disable-demuxer=ac3 \
+    --disable-demuxer=eac3 \
+    --disable-demuxer=dts \
+    --disable-muxer=ac3 \
+    --disable-muxer=eac3 \
+    --disable-muxer=dts \
+    --disable-parser=ac3 \
 "
-- 
1.7.0.4


