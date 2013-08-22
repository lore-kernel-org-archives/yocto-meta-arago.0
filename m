Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B256C52A93
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 21:38:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MLceXx015169
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLceob028134
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 16:38:39 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLca8d016403;
	Thu, 22 Aug 2013 16:38:38 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2013 17:10:30 -0500
Message-ID: <1377209433-10830-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] gst-plugins-bad: Remove with-plugins from configuration
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
X-List-Received-Date: Thu, 22 Aug 2013 21:38:40 -0000
Content-Type: text/plain

* The with-plugins option restricts gst-plugins-bad from building any plugin
  beyond those specified.
* Remove this option to allow as many plugins as possible to be built.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 8ae8050..a13dd54 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -9,7 +9,7 @@ EXTRA_OECONF += "--disable-rsvg"
 
 # Remove the restriction of which plugins are built. Previously fbdevsink
 # was not built which is needed by the gstreamer demos included in the SDK.
-EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
+EXTRA_OECONF := "${@oe_filter_out('--with-plugins=wavpack,mpegvideoparse','${EXTRA_OECONF}', d)}"
 
 SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch"
 
-- 
1.7.0.4


