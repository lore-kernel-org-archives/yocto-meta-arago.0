Return-Path: <poojaprajod@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5BBB552AF5
	for <meta-arago@arago-project.org>;
	Fri, 27 Jan 2017 12:02:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0RC2DeA003218
	for <meta-arago@arago-project.org>; Fri, 27 Jan 2017 06:02:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0RC2D1J005466
	for <meta-arago@arago-project.org>; Fri, 27 Jan 2017 06:02:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 Jan 2017 06:02:12 -0600
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0RC29g0020872;	Fri, 27 Jan 2017 06:02:12 -0600
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jan 2017 17:32:05 +0530
Message-ID: <1485518525-30230-3-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485518525-30230-1-git-send-email-a0132412@ti.com>
References: <1485518525-30230-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [PATCH 3/3] gstreamer: Remove gst 1.6 recipe
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
X-List-Received-Date: Fri, 27 Jan 2017 12:02:13 -0000
Content-Type: text/plain

Remove gst 1.6 recipe since the gstreamer version
is upgraded to gst 1.8

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../gstreamer1.0-plugins-bad_1.6.3.bbappend        | 43 ----------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
deleted file mode 100644
index 7ceb1b3..0000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
+++ /dev/null
@@ -1,43 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PACKAGECONFIG = "faad"
-
-# gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
-PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
-
-DEPENDS_append_omap-a15 = " \
-    libdce \
-    libdrm \
-"
-
-DEPENDS_append_ti43x = " \
-    libdrm \
-"
-
-DEPENDS_append_ti33x = " \
-    libdrm \
-"
-
-SRC_URI_append_ti43x = " \
-    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
-"
-
-SRC_URI_append_ti33x = " \
-    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BRANCH ?= "master"
-
-SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;branch=${BRANCH} \
-          "
-
-S = "${WORKDIR}/git"
-
-SRCREV_omap-a15 = "07050013051af00828be115eb7bce0fc08abb79f"
-SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
-
-PR = "r24"
-- 
1.9.1


