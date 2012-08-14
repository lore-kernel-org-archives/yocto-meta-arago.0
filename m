Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E371652986
	for <meta-arago@arago-project.org>;
	Tue, 14 Aug 2012 21:12:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7ELCjGP014514
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:12:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7ELCjFH001313
	for <meta-arago@arago-project.org>; Tue, 14 Aug 2012 16:12:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 14 Aug 2012 16:12:45 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7ELCj1G001277;	Tue, 14 Aug 2012 16:12:45 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T1OYq-0001Np-5H; Tue, 14 Aug 2012 16:22:00 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Aug 2012 16:21:57 -0500
Message-ID: <1344979318-5283-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] amsdk-av-files: Add TI audio and video files
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
X-List-Received-Date: Tue, 14 Aug 2012 21:12:46 -0000
Content-Type: text/plain

* Add various audio and video files which are used in multimedia demos.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.1.bb           |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
new file mode 100644
index 0000000..7c82a4a
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "AMSDK multimedia support files"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+LICENSE = "CC-BY-NC-ND-3.0"
+SECTION = "multimedia"
+PRIORITY = "optional"
+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=5f25f2753d6294d6b3ecac61d2f64146"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm)"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+VIDEO_FILES = "video_480p "
+VIDEO_FILES_append_am37x-evm   = "video_vga_r"
+VIDEO_FILES_append_beagleboard = "video_vga"
+VIDEO_FILES_append_am3517-evm  = "video_wqvga"
+VIDEO_FILES_append_am335x-evm  = "video_wvga \
+				                  video_wqvga"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/564/5179/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
+
+S = "${WORKDIR}/amsdk-av-files"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    install -d ${D}${datadir}/ti \
+       ${D}${datadir}/ti/audio \
+       ${D}${datadir}/ti/video
+    install -m 0644 ${S}/audio/* ${D}${datadir}/ti/audio/
+    for file in ${VIDEO_FILES}; do
+	install -m 0644 ${S}/${file}/* ${D}${datadir}/ti/video/
+    done
+}
+
+FILES_${PN} += "${datadir}/ti/*"
+
+SRC_URI[avfilestarball.md5sum] = "19d254541f7c050d6220bd11249c1e8c"
+SRC_URI[avfilestarball.sha256sum] = "5b81f49a305c3c88a6e33834d30561e8c16a534f9dcd10d31b348fd0031b2a74"
-- 
1.7.0.4


