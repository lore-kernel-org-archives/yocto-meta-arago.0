Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F26C55299C
	for <meta-arago@arago-project.org>;
	Tue,  7 Jul 2015 11:46:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67BkYSU014437
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 06:46:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67BkYCM014637
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 06:46:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 06:46:21 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67BkYWl025430;	Tue, 7 Jul 2015 06:46:34 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1ZCRKb-00011P-T0;
	Tue, 07 Jul 2015 07:46:33 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Jul 2015 07:46:26 -0400
Message-ID: <1436269586-3894-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1436269586-3894-1-git-send-email-j-stiffler@ti.com>
References: <1436269586-3894-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] amsdk-av-files: Remove version 1.3
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
X-List-Received-Date: Tue, 07 Jul 2015 11:46:35 -0000
Content-Type: text/plain

* This provides a subset of 1.4.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.3.bb           |   44 --------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb
deleted file mode 100644
index 143224b..0000000
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "AMSDK multimedia support files"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
-LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
-SECTION = "multimedia"
-LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=9254447a504d2179d83a6bc9e2c28142"
-PR = "r0"
-
-COMPATIBLE_MACHINE = "(omap3|ti33x|ti43x|omap-a15)"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-VIDEO_FILES = "video_480p "
-
-VIDEO_FILES_append_am37x-evm   = "video_vga_r"
-VIDEO_FILES_append_beagleboard = "video_vga"
-VIDEO_FILES_append_am3517-evm  = "video_wqvga"
-VIDEO_FILES_append_ti33x       = "video_wvga \
-                                  video_wqvga"
-VIDEO_FILES_append_dra7xx      = "video_wvga \
-                                  video_1080p \
-                                  video_720p \
-                                  video_yuv"
- 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1271/7720/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
-
-S = "${WORKDIR}/amsdk-av-files"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${datadir}/ti \
-       ${D}${datadir}/ti/audio \
-       ${D}${datadir}/ti/video
-    install -m 0644 ${S}/audio/* ${D}${datadir}/ti/audio/
-    for file in ${VIDEO_FILES}; do
-	install -m 0644 ${S}/${file}/* ${D}${datadir}/ti/video/
-    done
-}
-
-FILES_${PN} += "${datadir}/ti/*"
-
-SRC_URI[avfilestarball.md5sum] = "3f930cd873bc55bfd52a09b85f567d0c"
-SRC_URI[avfilestarball.sha256sum] = "b389b732df409546c0aba6464a5b0815647d8fa24020c4bede823cbe26337c06"
-- 
1.7.9.5


