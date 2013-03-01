Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id 393E752AB6
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:11:10 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id h1so4994008oag.3
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=l5eMwihJsuxke8lYRiVBywxH3gMSe6qon/2IvpjwMno=;
	b=xsE2tFuNTKzlwW4q71kNy+e3LXen1Obo5J8l9qHG8hyaeIgILArXw2j6dbwnK83CUx
	WZk/fwsVIcZhq5GhaW/Lyk//1h1KoaNX56PG0RulgyXs8kwkHVEopCxYCaZL7vIO49fr
	ez5nZymFJ7dCltE4bvGe5NF/YRPBhqLg64kIk2albEbYSAsW0VP3v8SyjXgu9+BV9atZ
	wuJQ36D/JR1en+xUtX8ARQgbLMdzVpVOpD4vGbS2iVNhR0Gxc81tnwSSMSfJmc3SRyvx
	cO+m8bVBCbe+B+sQu+kPKUesZK2q21EfZb/2l9BF5FdFVv4Yqk49nP3ToYAqaSGBUnPe
	TPOw==
X-Received: by 10.60.170.101 with SMTP id al5mr7292137oec.48.1362107469912;
	Thu, 28 Feb 2013 19:11:09 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.11.07
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:11:08 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:45 -0600
Message-Id: <1362107447-11234-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362107447-11234-1-git-send-email-fcooper@ti.com>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 7/9] libav: Remove AC3 and DTS
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
X-List-Received-Date: Fri, 01 Mar 2013 03:11:10 -0000

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


