Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A4F175299C
	for <meta-arago@arago-project.org>;
	Tue,  7 Jul 2015 11:46:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67BkW5Y008276
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 06:46:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67BkWM9014613
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 06:46:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 06:46:19 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67BkWXb022470;	Tue, 7 Jul 2015 06:46:32 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1ZCRKZ-00011M-Ka;
	Tue, 07 Jul 2015 07:46:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Jul 2015 07:46:25 -0400
Message-ID: <1436269586-3894-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] amsdk-av-files: Add version 1.4
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
X-List-Received-Date: Tue, 07 Jul 2015 11:46:34 -0000
Content-Type: text/plain

* Adds new "Tear of Steel" clip.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.4.bb           |   45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
new file mode 100644
index 0000000..0c3da61
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "AMSDK multimedia support files"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
+SECTION = "multimedia"
+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
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
+VIDEO_FILES_append_ti43x       = "video_wqvga"
+VIDEO_FILES_append_dra7xx      = "video_wvga \
+                                  video_1080p \
+                                  video_720p \
+                                  video_yuv"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1279/7769/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
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
+SRC_URI[avfilestarball.md5sum] = "29a2f8b5f41f49e30bbe9cf53eb06c5a"
+SRC_URI[avfilestarball.sha256sum] = "64dde10d03156d480c6f38494c9503e73878fa0a8d5009182ed43b0e926b5569"
-- 
1.7.9.5


