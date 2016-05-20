Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id CCB2552AC9
	for <meta-arago@arago-project.org>;
	Fri, 20 May 2016 13:01:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4KD1ULt029686
	for <meta-arago@arago-project.org>; Fri, 20 May 2016 08:01:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4KD1UXV014286
	for <meta-arago@arago-project.org>; Fri, 20 May 2016 08:01:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 May 2016 08:01:30 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4KD1SGL017830;
	Fri, 20 May 2016 08:01:29 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 May 2016 18:31:05 +0530
Message-ID: <1463749265-16509-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libav: Remove deprecated recipe
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
X-List-Received-Date: Fri, 20 May 2016 13:01:31 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-multimedia/libav/libav_9.16.bbappend   | 40 ----------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
deleted file mode 100644
index dc8977a..0000000
--- a/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
+++ /dev/null
@@ -1,40 +0,0 @@
-PR_append = ".arago0"
-
-PACKAGECONFIG := "${@oe_filter_out('x264','${PACKAGECONFIG}', d)}"
-LICENSE_FLAGS = ""
-
-# Disable features that have potential commercial licensing restrictions
-EXTRA_OECONF += "\
-    --disable-encoder=libmp3lame \
-    --disable-decoder=mp3 \
-    --disable-decoder=mp3adu \
-    --disable-decoder=mp3adufloat \
-    --disable-decoder=mp3float \
-    --disable-decoder=mp3on4 \
-    --disable-decoder=mp3on4float \
-    --disable-muxer=mp3 \
-    --disable-demuxer=mp3 \
-    --disable-bsf=mp3_header_decompress \
-    --disable-bsf=mp3_header_compress   \
-                                 \
-    --disable-encoder=mpeg2video \
-    --disable-decoder=mpeg2video \
-    --disable-hwaccel=mpeg2_vaapi \
-    --disable-hwaccel=mpeg2_dxva2 \
-    --disable-muxer=mpeg2dvd \
-    --disable-muxer=mpeg2svcd \
-    --disable-muxer=mpeg2video \
-    --disable-muxer=mpeg2vob \
-                            \
-    --disable-encoder=ac3_fixed \
-    --disable-encoder=ac3 \
-    --disable-decoder=ac3 \
-    --disable-decoder=eac3 \
-    --disable-demuxer=ac3 \
-    --disable-demuxer=eac3 \
-    --disable-demuxer=dts \
-    --disable-muxer=ac3 \
-    --disable-muxer=eac3 \
-    --disable-muxer=dts \
-    --disable-parser=ac3 \
-"
-- 
1.9.1


