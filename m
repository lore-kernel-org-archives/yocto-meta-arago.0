Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E7E95529AF
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2015 13:02:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t29D2P8V017592
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 08:02:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29D2OlJ022322
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 08:02:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 08:02:23 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29D2NHb016613;
	Mon, 9 Mar 2015 08:02:23 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YUxKB-0001S6-HG;
	Mon, 09 Mar 2015 09:02:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Mar 2015 09:02:17 -0400
Message-ID: <1425906138-5552-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] amsdk-av-files: Upgrade to latest version with HEVC content.
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
X-List-Received-Date: Mon, 09 Mar 2015 13:02:26 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.2.bb           |   44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
new file mode 100644
index 0000000..258c7b4
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.2.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "AMSDK multimedia support files"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
+SECTION = "multimedia"
+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=9254447a504d2179d83a6bc9e2c28142"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "(omap3evm|am37x-evm|am3517-evm|am389x-evm|beagleboard|am335x-evm|ti43x|omap-a15)"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+VIDEO_FILES = "video_480p "
+VIDEO_FILES_append_am37x-evm   = "video_vga_r"
+VIDEO_FILES_append_beagleboard = "video_vga"
+VIDEO_FILES_append_am3517-evm  = "video_wqvga"
+VIDEO_FILES_append_am335x-evm  = "video_wvga \
+				                  video_wqvga"
+VIDEO_FILES_append_dra7xx  = "video_wvga \
+                                                  video_1080p \
+                                                  video_720p \
+                                                  video_yuv"
+ 
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1251/7520/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
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
+SRC_URI[avfilestarball.md5sum] = "c4c849cf6c16e4898869264bbd05fd5d"
+SRC_URI[avfilestarball.sha256sum] = "287cc95a68befa594b8b9a8514c57240620d535b2b99c6d3e1f91bc278ef37ef"
+
-- 
1.7.9.5


