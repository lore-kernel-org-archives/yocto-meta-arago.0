Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33319C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:11:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1633.1709665886167315008
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 11:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=II3BDhdH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425JBO3n110312;
	Tue, 5 Mar 2024 13:11:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709665884;
	bh=mqir/tF8hAcI46GuAK/TKThqj8lC4lvCTlExmZ3pWTo=;
	h=From:To:CC:Subject:Date;
	b=II3BDhdHNo8Rlck/DzOVZsXDXE5tx2+ORtFwwJeVI/kPWKyo6dcU38CEPUSFVR0Fw
	 Ca9m7fzd4hcnXJbh2e4xqe6M1xmLs7F/4Szfge2BtdgvEk6CjdTpUTAjoaoMYZ3rQ7
	 hngowWnA9i3PDpjdltq6n/osJMiJEWvBrEULrMAA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425JBO9c120579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 13:11:24 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 13:11:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 13:11:24 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425JBNot106440;
	Tue, 5 Mar 2024 13:11:23 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] dual-camera-demo: Remove this non-functioning demo
Date: Tue, 5 Mar 2024 13:11:23 -0600
Message-ID: <20240305191123.67829-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 19:11:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15219

This demo has not been maintained for years and is no longer functional.
Remove this demo.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../dual-camera-demo/desc_dual-camera.html    |  7 ---
 .../dual-camera-demo/dual-camera.desktop      | 10 ----
 .../dual-camera-demo/dual_camera_qt4.sh       | 10 ----
 .../dual-camera-demo/dual_camera_qt5.sh       | 13 -----
 .../dual-camera-demo/dual-camera-demo_1.0.bb  | 47 -------------------
 .../packagegroup-arago-tisdk-multimedia.bb    |  3 --
 6 files changed, 90 deletions(-)
 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/desc_dual-camera.html
 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual-camera.desktop
 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
 delete mode 100644 meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo_1.0.bb

diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/desc_dual-camera.html b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/desc_dual-camera.html
deleted file mode 100644
index e3269600..00000000
--- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/desc_dual-camera.html
+++ /dev/null
@@ -1,7 +0,0 @@
-<h1> Dual Camera Demo </h1>
-
-<p> This example demonstrates the dual camera capabilities of the VPFE and DSS.  If used on an AM437x GP EVM, two camera displays will be available.  Otherwise, one camera feed will be displayed. </p>
-<p>
-<span style="color:red">NOTE: Please make sure the camera module is inserted into AM437x GP EVM header for dual camera functionality. </span>
-</p>
-
diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual-camera.desktop b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual-camera.desktop
deleted file mode 100644
index e3544883..00000000
--- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual-camera.desktop
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/usr/bin/env xdg-open
-[Desktop Entry]
-Name=Dual Camera Demo
-GenericName=Demo App
-Icon=/usr/share/matrix-gui-2.0/apps/images/multimedia-icon.png
-Type=Application
-Exec=dual_camera.sh
-Categories=camera
-ProgramType=gui
-X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/dual-camera/desc_dual-camera.html
diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
deleted file mode 100644
index 6d9675db..00000000
--- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-/etc/init.d/matrix-gui-2.0 stop
-
-export TSLIB_TSDEVICE=/dev/input/touchscreen0
-export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
-
-dual_camera -qws
-
-/etc/init.d/matrix-gui-2.0 start
diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
deleted file mode 100644
index f01bea34..00000000
--- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-/etc/init.d/weston stop
-sleep 1
-
-echo 0 > /sys/class/graphics/fbcon/cursor_blink
-
-dual_camera -platform linuxfb
-
-echo 1 > /sys/class/graphics/fbcon/cursor_blink
-
-/etc/init.d/weston start
-sleep 1
diff --git a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo_1.0.bb
deleted file mode 100644
index 157e5602..00000000
--- a/meta-arago-demos/recipes-apps/dual-camera-demo/dual-camera-demo_1.0.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION = "Qt Dual Camera Demo"
-HOMEPAGE = "https://gitorious.org/dual-camera-demo/"
-SECTION = "multimedia"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
-
-DEPENDS += "libdrm cmem"
-require recipes-core/matrix/matrix-gui-paths.inc
-
-PR = "r20"
-
-BRANCH = "master"
-SRCREV = "3188b1eacb14dda0dcf3a58877962d86687b6d20"
-
-SRC_URI = "git://git.ti.com/git/sitara-linux/dual-camera-demo.git;protocol=https;branch=${BRANCH} \
-           file://desc_dual-camera.html \
-           file://dual_camera_qt5.sh \
-           file://dual_camera_qt4.sh \
-           file://dual-camera.desktop \
-"
-
-S = "${WORKDIR}/git"
-
-inherit qt5
-
-export SDK_PATH_TARGET='${STAGING_DIR_HOST}'
-
-# use the make targets already created in the Makefile.build files
-do_install() {
-    install -d ${D}/usr/bin
-    install -d ${D}${MATRIX_APP_DIR}/dual-camera
-    install dual_camera ${D}/usr/bin/dual_camera
-    install ${WORKDIR}/dual_camera_qt5.sh ${D}/usr/bin/dual_camera.sh
-    install ${WORKDIR}/desc_dual-camera.html ${D}/${MATRIX_APP_DIR}/dual-camera
-    install ${WORKDIR}/dual-camera.desktop ${D}/${MATRIX_APP_DIR}/dual-camera
-}
-
-PACKAGES += "matrix-gui-apps-dual-camera"
-
-RDEPENDS:${PN} += "libdrm libdrm-omap"
-
-RDEPENDS:matrix-gui-apps-dual-camera  = "matrix-gui-apps-images matrix-gui-submenus-camera ${PN}"
-
-# Add the matrix directory to the FILES
-FILES:${PN} = "/usr/bin/*"
-
-FILES:matrix-gui-apps-dual-camera = "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index b4148882..ba9ac544 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -14,16 +14,13 @@ MULTIMEDIA = " \
 
 MULTIMEDIA:omapl138 = ""
 
-DUAL_CAMERA_DEMO = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dual-camera-demo', '', d)}"
 IMAGE_GALLERY_DEMO = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'image-gallery', '', d)}"
 
 MULTIMEDIA:append:ti43x = " \
-    ${DUAL_CAMERA_DEMO} \
     ${IMAGE_GALLERY_DEMO} \
 "
 
 MULTIMEDIA:append:omap-a15 = " \
-    ${DUAL_CAMERA_DEMO} \
     ${IMAGE_GALLERY_DEMO} \
 "
 
-- 
2.39.2


