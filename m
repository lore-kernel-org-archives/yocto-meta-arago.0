Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id D2E9352A6F
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 04:31:40 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2251875oag.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 20:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7Sn5YVfJKmXeVKHicxer/Y518r6ZX6NHwMTYsdoifJY=;
	b=Nb5tFLRm/6JDPKpJgclmjKkQPsaVYsY+Ny4zawBcELX7oe9woushJFdpgKbgUzQXdq
	O+eHDw/tEPxbXdld26ylc3sTBjigD2XpJeyybtfihwDtkTGl5vD3RV94v3lSywz+xZbj
	Ru6arRXa+EDMEd/1lcQlqIa21eAuPZxdxT1TKz0Yy+pGXY8pE3p8zUK+ITU+YuIn9SuJ
	YejHf+xA+cRkgz75+ZT9JIU85nO8qxAyhV3Kpmi+loqy7aWnO5WZ5tJxDrjWUDhG+gox
	oeMzXmvugyHY0xrNR4HJGiH2Qs/NbcVajF1pLWrkYjSssqWt45zmC42w9FuLMcdUBV3U
	+OTQ==
Received: by 10.182.69.50 with SMTP id b18mr2828481obu.75.1353040300568;
	Thu, 15 Nov 2012 20:31:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm481759oeb.3.2012.11.15.20.31.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 20:31:40 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 22:31:28 -0600
Message-Id: <1353040290-26030-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353040290-26030-1-git-send-email-fcooper@ti.com>
References: <1353040290-26030-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/5] gst-plugins-bad: Disable any feature based on mpeg2 or mp3
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
X-List-Received-Date: Fri, 16 Nov 2012 04:31:41 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 8b1e588..8ae8050 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -16,3 +16,9 @@ SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.pat
 # Add faad has a dependency to insure gst-plugins-bad-faad is built.
 DEPENDS += "faad2"
 RDEPENDS_${PN}-faad += "libfaad"
+
+# Disable features that have potential commercial licensing restrictions
+EXTRA_OECONF += "\
+    --disable-mpeg2enc \
+    --disable-acm \
+"
-- 
1.7.0.4


