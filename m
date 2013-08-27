Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4583A52090
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 19:18:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RJI221007914
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJI2Sm022771
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 27 Aug 2013 14:18:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJHxop028646;
	Tue, 27 Aug 2013 14:18:00 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Aug 2013 14:51:27 -0500
Message-ID: <1377633092-29917-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/6 v2] gst-plugins-bad: Use new PACKAGECONFIG feature
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
X-List-Received-Date: Tue, 27 Aug 2013 19:18:04 -0000
Content-Type: text/plain

* Recent patch in oe-core allows certain features to be enabled or disabled
  based on the PACKAGECONFIG variable.
* Use this variable which will obsolete alot of the code in this bbappend while
  achieving the same result.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update patch tailored to recent change to base recipe in oe-core.


 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 8ae8050..8cee785 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,21 +1,11 @@
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-# Disable rsvg which caused gtk+ to be pulled in
-DEPENDS := "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
-EXTRA_OECONF += "--disable-rsvg"
-
-# Remove the restriction of which plugins are built. Previously fbdevsink
-# was not built which is needed by the gstreamer demos included in the SDK.
-EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
-
 SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
 
-# Add faad has a dependency to insure gst-plugins-bad-faad is built.
-DEPENDS += "faad2"
-RDEPENDS_${PN}-faad += "libfaad"
+PACKAGECONFIG = "bzip curl faad"
 
 # Disable features that have potential commercial licensing restrictions
 EXTRA_OECONF += "\
-- 
1.7.0.4


