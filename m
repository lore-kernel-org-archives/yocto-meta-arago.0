Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 658A552AC4
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2015 17:52:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NHq8FT018235
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 12:52:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NHq7oN018166
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 12:52:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 12:52:06 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3NHq60J027525;	Thu, 23 Apr 2015 12:52:07 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YlLIE-0003lw-QG;
	Thu, 23 Apr 2015 13:52:06 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Apr 2015 13:52:00 -0400
Message-ID: <1429811520-11202-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429811520-11202-1-git-send-email-j-stiffler@ti.com>
References: <1429811520-11202-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] amsdk-av-files: Remove version 1.2
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
X-List-Received-Date: Thu, 23 Apr 2015 17:52:09 -0000
Content-Type: text/plain

* This version is obsolete.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.2.bb           |   44 --------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
deleted file mode 100644
index 9d38ec1..0000000
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
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
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1251/7520/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
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
-SRC_URI[avfilestarball.md5sum] = "c4c849cf6c16e4898869264bbd05fd5d"
-SRC_URI[avfilestarball.sha256sum] = "287cc95a68befa594b8b9a8514c57240620d535b2b99c6d3e1f91bc278ef37ef"
-- 
1.7.9.5


