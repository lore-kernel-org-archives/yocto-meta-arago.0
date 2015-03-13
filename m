Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8FC615297F
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 12:39:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DCdws3001974
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:39:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DCdv6O016420
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 07:39:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Mar 2015 07:39:57 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DCduW2024332;
	Fri, 13 Mar 2015 07:39:57 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YWOse-0007U9-DQ;
	Fri, 13 Mar 2015 08:39:56 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Mar 2015 08:39:52 -0400
Message-ID: <1426250392-28716-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426250392-28716-1-git-send-email-j-stiffler@ti.com>
References: <1426250392-28716-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] amsdk-av-files: Remove older version.
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
X-List-Received-Date: Fri, 13 Mar 2015 12:39:59 -0000
Content-Type: text/plain

* Old version is a subset of the latest version.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2: No change.

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


