Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F3790529A4
	for <meta-arago@arago-project.org>;
	Wed,  3 Dec 2014 13:06:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB3D65Cc021638
	for <meta-arago@arago-project.org>; Wed, 3 Dec 2014 07:06:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB3D65nJ014323
	for <meta-arago@arago-project.org>; Wed, 3 Dec 2014 07:06:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Dec 2014 07:06:04 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB3D64Ed011596;
	Wed, 3 Dec 2014 07:06:04 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Xw9d6-0005OO-F1;
	Wed, 03 Dec 2014 08:06:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Dec 2014 08:05:53 -0500
Message-ID: <1417611953-20698-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] gst-plugins: Use 'gitsm' fetcher for submodule support.
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
X-List-Received-Date: Wed, 03 Dec 2014 13:06:06 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  |    3 +--
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb |    3 +--
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb |    3 +--
 .../gstreamer/gstreamer-mm-accel_0.10.36.bb        |    3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
index 6eb7bc1..e00e919 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
@@ -26,14 +26,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS += "omap5-sgx-ddk-um-linux libdce libdrm wayland"
 
 SRCREV = "a9510bef52331fee9a23a5c955dbf76ac210056a"
-SRC_URI = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
+SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += " --disable-pvr"
 
 do_configure_prepend() {
-	git submodule init && git submodule update
 	autopoint -f
 }
 
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
index 1de5e6c..33f82b0 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
@@ -23,13 +23,12 @@ RCONFLICTS_${PN}-meta += "gst-plugins-base-meta"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
+SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
 SRCREV = "3427e885daa749275e07339d3633b83c717aa419"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	git submodule init && git submodule update
 	autopoint -f
 }
 
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
index 31456af..ad071ec 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
@@ -23,7 +23,7 @@ RCONFLICTS_${PN}-meta += "gst-plugins-good-meta"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
+SRC_URI = "gitsm://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
 SRCREV = "a44097d542f2bf219ac9dc3ef2372e58d769a8f9"
 
 # Fix compile errors with recent kernels
@@ -33,7 +33,6 @@ SRC_URI_append = " file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffe
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	git submodule init && git submodule update
 	autopoint -f
 }
 
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
index d3db41e..8cfbd05 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
@@ -21,13 +21,12 @@ RCONFLICTS_${PN}-dbg += "gstreamer-dbg"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
+SRC_URI = "gitsm://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
 SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	git submodule init && git submodule update
 	autopoint -f
 }
 
-- 
1.7.9.5


