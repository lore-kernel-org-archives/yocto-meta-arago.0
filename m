Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 8093852A67
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2012 02:50:48 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so5172471oag.38
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2012 18:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ezPMeyfhvnfKmc1nGZUjOIAhhsmbV99lmARbdKK0o3w=;
	b=ASb8Xydbx24R1rwdgPRPHI8GswtZS4CPxeKWCp3mwImpyDBlNyxqimqMsuWU3AlW+9
	hj1dPpCLw3PkecHwgtqhmgPWFzRhIIQvaWiRdjFXloVlWxwWMZ3WCRfWpqOp2+GVAqtc
	Cj+8pTmv7VYvZaFMk/hodlxYIuFVgmf9qq9lToHgBGVlJiQsEWjRsjOC75S9RPMRbbqH
	gqU96eOPwrZrJY5si9smOP/9FouA5D+sRSpR0Rge6chIRxhcg6nj4ktHcXdgcAXGVowP
	PcYRiZk31yrcq2Uf+QBjqKiyW7dUa3Tpnnjot5BaoKAXHmS9+mslMgFJTnxTUrONGcx+
	TYpQ==
Received: by 10.182.156.99 with SMTP id wd3mr12360138obb.15.1353379847397;
	Mon, 19 Nov 2012 18:50:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m6sm9221572oem.10.2012.11.19.18.50.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 18:50:46 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Nov 2012 20:50:42 -0600
Message-Id: <1353379842-15721-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/5 v2] libav: Disable any mp3 or mpeg2 feature
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
X-List-Received-Date: Tue, 20 Nov 2012 02:50:49 -0000

* Disable any feature based on mpeg2 or mp3

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Add space between the end of the below statements and the backslash
--disable-hwaccel=mpeg2_vaapi
--disable-hwaccel=mpeg2_dxva2
Without the space these statements were considered to be one giant statement
which caused configure to ignore it.

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


