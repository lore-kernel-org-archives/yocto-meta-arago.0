Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 60A9C529E1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 21:43:06 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2059823obb.38
	for <meta-arago@arago-project.org>;
	Fri, 05 Oct 2012 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nK3O2w3R/GQXfJx1csR3oSnqHqYzVzLx1xVZ37lo3t8=;
	b=TVymaFzxVB2T+fa3F/fL2F79rkaaYJasiPoFR0QsWTDRto1pETBbTxckyB/2jLCkCn
	tcxr008yBnaaLreUVtkV095cvlE0LABHHiEt1VzKvcQxKIKio8VWY3ylNUFfewKBlT7Z
	tFo/p+yJTrXXZJ8eh33HPM0mk7a0rIvHj8eQvLs8igRsSTrXUvVKJDeEzsu5rBTKrYfD
	jbi+8C7ESiqAUTO3QMkcipHwWB+PfW54NsyCWTjqRigw0r3CioeP/6fCOCPcuN8MDWEu
	G/Z1ROyjXc0zBfVUlHCu/OGA32endsA/Jez/wS0s6OU2T7/60CJnW1d2jZXD+6o++FpS
	XCKA==
Received: by 10.60.32.176 with SMTP id k16mr1623851oei.130.1349473385905;
	Fri, 05 Oct 2012 14:43:05 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q1sm8183099oeg.3.2012.10.05.14.43.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 14:43:05 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 17:06:55 -0500
Message-Id: <1349474815-2491-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] gst-plugins-bad: Add faad as a dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 21:43:06 -0000

* Add faad2 as a dependency and libfaad as a runtime dependency. This
  insures gst-plugins-bad-faad package is created. The gstreamer faad
  element is needed for the AAC related gstreamer demos.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Fix RDEPENDS syntax

 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 17ce36e..8b1e588 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -12,3 +12,7 @@ EXTRA_OECONF += "--disable-rsvg"
 EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
 
 SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
+
+# Add faad has a dependency to insure gst-plugins-bad-faad is built.
+DEPENDS += "faad2"
+RDEPENDS_${PN}-faad += "libfaad"
-- 
1.7.0.4


