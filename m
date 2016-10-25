Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A683952A50
	for <meta-arago@arago-project.org>;
	Tue, 25 Oct 2016 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A9188204E0;
	Tue, 25 Oct 2016 19:56:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UKT6Gm4bp15l; Tue, 25 Oct 2016 19:56:13 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6B64820A48;
	Tue, 25 Oct 2016 19:56:12 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 7C22716217E;
	Tue, 25 Oct 2016 15:56:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 25 Oct 2016 15:56:09 -0400
Message-Id: <1477425370-21132-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477425370-21132-1-git-send-email-denis@denix.org>
References: <1477425370-21132-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] libav: remove bbappend to disable commercial codecs/features
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
X-List-Received-Date: Tue, 25 Oct 2016 19:56:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

New ffmpeg that replaced libav has comprehensive PACKAGECONFIG support and
doesn't seem to enable questinable codecs by default. Any future codec
configuration should be done with PACKAGECONFIG flags in distro config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
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
2.7.4


