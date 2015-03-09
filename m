Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8454A529AF
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2015 13:02:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t29D2RrN013710
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 08:02:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29D2QRF022373
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 08:02:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 08:02:26 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29D2Q74022342;
	Mon, 9 Mar 2015 08:02:26 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YUxKE-0001S9-Cj;
	Mon, 09 Mar 2015 09:02:26 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Mar 2015 09:02:18 -0400
Message-ID: <1425906138-5552-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425906138-5552-1-git-send-email-j-stiffler@ti.com>
References: <1425906138-5552-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] amsdk-av-files: Remove older version.
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
X-List-Received-Date: Mon, 09 Mar 2015 13:02:28 -0000
Content-Type: text/plain

* Old version is a subset of the latest version.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.1.bb           |   40 --------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
deleted file mode 100644
index e23fdf3..0000000
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "AMSDK multimedia support files"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
-LICENSE = "CC-BY-NC-ND-3.0"
-SECTION = "multimedia"
-LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=5f25f2753d6294d6b3ecac61d2f64146"
-PR = "r2"
-
-COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm|ti43x|omap-a15)"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-VIDEO_FILES = "video_480p "
-VIDEO_FILES_append_am37x-evm   = "video_vga_r"
-VIDEO_FILES_append_beagleboard = "video_vga"
-VIDEO_FILES_append_am3517-evm  = "video_wqvga"
-VIDEO_FILES_append_am335x-evm  = "video_wvga \
-				                  video_wqvga"
-VIDEO_FILES_append_dra7xx  = "video_wvga"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/564/5179/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
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
-SRC_URI[avfilestarball.md5sum] = "19d254541f7c050d6220bd11249c1e8c"
-SRC_URI[avfilestarball.sha256sum] = "5b81f49a305c3c88a6e33834d30561e8c16a534f9dcd10d31b348fd0031b2a74"
-- 
1.7.9.5


