Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ED63552AC4
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2015 17:52:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NHq6jS013734
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 12:52:06 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NHq2YZ027566
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 12:52:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 12:52:03 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3NHq3hX025503;	Thu, 23 Apr 2015 12:52:03 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YlLIB-0003QW-Ez;
	Thu, 23 Apr 2015 13:52:03 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Apr 2015 13:51:59 -0400
Message-ID: <1429811520-11202-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] amsdk-av-files: Add package version 1.3.
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
X-List-Received-Date: Thu, 23 Apr 2015 17:52:07 -0000
Content-Type: text/plain

* In this package, the YUV file format has been changed to NV12 for
  ducati encoding.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.3.bb           |   44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb
new file mode 100644
index 0000000..143224b
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.3.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "AMSDK multimedia support files"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
+SECTION = "multimedia"
+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=9254447a504d2179d83a6bc9e2c28142"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "(omap3|ti33x|ti43x|omap-a15)"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+VIDEO_FILES = "video_480p "
+
+VIDEO_FILES_append_am37x-evm   = "video_vga_r"
+VIDEO_FILES_append_beagleboard = "video_vga"
+VIDEO_FILES_append_am3517-evm  = "video_wqvga"
+VIDEO_FILES_append_ti33x       = "video_wvga \
+                                  video_wqvga"
+VIDEO_FILES_append_dra7xx      = "video_wvga \
+                                  video_1080p \
+                                  video_720p \
+                                  video_yuv"
+ 
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1271/7720/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
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
+SRC_URI[avfilestarball.md5sum] = "3f930cd873bc55bfd52a09b85f567d0c"
+SRC_URI[avfilestarball.sha256sum] = "b389b732df409546c0aba6464a5b0815647d8fa24020c4bede823cbe26337c06"
-- 
1.7.9.5


