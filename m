Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id CEBED52A00
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 20:56:58 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2031827obb.38
	for <meta-arago@arago-project.org>;
	Fri, 05 Oct 2012 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WAz+WroNEACSFlBC2ZOBYcaVChBz+64FWJy5RU3eZJE=;
	b=DC6QfxFkjXaH6qNzsHuL5Qujsjnqf+7tBjZeoNO7AbKWlbXM7HqH6e750I5KcCDpT8
	3wtMPE40p2MML5puU1nipiCrrwWEGjo3v2Tl1qTQHmwAQgeSI1/u2br+c1FuC/tk8ocO
	hhLQ0QTKXFJp19a0BjZF2XeYUKReKBSMe2TuOc5XuIQL2RH530NlxXXRyXemDVN/+HNb
	R5z90OVJQC/7BKiJQltDigdt/h3dTRdNrXgqlIbuy0D5NrN9vfSCQiCpyCecvBTQaPEq
	uhQeasCq1FN6Aqu7skHrzEHp9Tj3s+4X3n25xPUhVZ+44cTaFHLPkA1L9bq8YC7ca6LH
	R2bw==
Received: by 10.60.13.41 with SMTP id e9mr8286505oec.15.1349470618586;
	Fri, 05 Oct 2012 13:56:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id h2sm10400939obn.11.2012.10.05.13.56.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 13:56:58 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 16:25:29 -0500
Message-Id: <1349472329-1054-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1349472329-1054-1-git-send-email-fcooper@ti.com>
References: <1349472329-1054-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 2/2] gst-plugins-bad: Add faad as a dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 20:56:59 -0000

* Add faad2 as a dependency and libfaad as a runtime dependency. This
  insures gst-plugins-bad-faad package is created. The gstreamer faad
  element is needed for the AAC related gstreamer demos.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 0c7035b..ba06fb4 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago1"
+PR_append = "-arago2"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -11,3 +11,7 @@ EXTRA_OECONF += "--disable-rsvg"
 EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
 
 SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
+
+# Add faad has a dependency to insure gst-plugins-bad-faad is built.
+DEPENDS += "faad2"
+RDEPENDS += "libfaad"
-- 
1.7.0.4


