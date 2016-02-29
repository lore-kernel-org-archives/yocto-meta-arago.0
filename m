Return-Path: <anandb@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B694C5296D
	for <meta-arago@arago-project.org>;
	Mon, 29 Feb 2016 05:31:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1T5VKg3030813
	for <meta-arago@arago-project.org>; Sun, 28 Feb 2016 23:31:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1T5VKZf032509
	for <meta-arago@arago-project.org>; Sun, 28 Feb 2016 23:31:20 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 28 Feb 2016 23:31:19 -0600
Received: from uda0876520.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1T5VIha024263;	Sun, 28 Feb 2016 23:31:19 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Feb 2016 11:03:02 +0530
Message-ID: <1456723982-23673-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] img-pvr-sdk: SGX demo binaries for Wayland and DRM for all platforms
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
X-List-Received-Date: Mon, 29 Feb 2016 05:31:22 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               | 45 +++++++++-------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 90dd097..681ae71 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -4,19 +4,14 @@ LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8
 
 CLEANBROKEN = "1"
 
-BRANCH_omap-a15 = "master"
-BRANCH_ti33x = "am3/k4.1"
-BRANCH_ti43x = "am4/k4.1"
+BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
-SRCREV_ti33x = "ca2d479543fc6884818604b32a66de8ffc77145f"
-SRCREV_ti43x = "e4052bf874fce9d59c340ae1cda41a7391abcb1a"
+SRCREV = "76454a25e53e49986b013b1e2fce07be1c8315af"
 
-PR = "r6"
+PR = "r7"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
 
@@ -26,25 +21,21 @@ do_install () {
     cp -ar ${S}/targetfs/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
 
     install -d ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
-}
-
-do_install_append_omap-a15 () {
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
-}
-
-do_install_append_ti33x () {
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESEvilSkull ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESFilmTV ${D}${bindir}/SGX/demos/Raw/
-}
-
-do_install_append_ti43x () {
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
+    install -d ${D}${bindir}/SGX/demos/Wayland/
+
+    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
+
+    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2Navigation ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.9.1


