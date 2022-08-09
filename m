Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F70C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 19:10:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.15985.1660072239565731131
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 12:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V5oNAJvG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 279JAcWI107409
	for <meta-arago@lists.yoctoproject.org>; Tue, 9 Aug 2022 14:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660072238;
	bh=IsgvtKmQzObsoiFpQC+Kd2XuFMT1WUmSGQtYChmBvSU=;
	h=From:To:CC:Subject:Date;
	b=V5oNAJvGMJxReJNJTQU6f3+/mhc58p/+DLaedd/IhSRsyX/3Jvff49hkYN1muXTjJ
	 ChF8BsSx/kgNB0swoTMzkyiaBiMRy+oMfqcXTPrhyYQYo06KoeDF2iji6+tjntW9Re
	 4iGoiWHPUT7qAdlRideozwOXrkWo36N4KdYciCcc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 279JAc7l115914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 9 Aug 2022 14:10:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Aug 2022 14:10:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 9 Aug 2022 14:10:38 -0500
Received: from res.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 279JAcJm026695;
	Tue, 9 Aug 2022 14:10:38 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [kirkstone/master][PATCH] img-pvr-sdk: Drop img-pvr-sdk and update
 matrix
Date: Tue, 9 Aug 2022 14:10:35 -0500
Message-ID: <20220809191035.30906-1-rs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Aug 2022 19:10:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13976

The img-pvr-sdk package currently ships dated demos and pvr tools. Instead of
packaging these ourselves, we should redirect users to to the latest versions
published by Imagination to prevent things like PVRTune server-GUI mismatch.

Matrix-gui has been updated to not depend on img-pvr-sdk demos and the
img-pvr-sdk package directory and bitbake recipe has been removed.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb        |  4 -
 .../matrix/matrix-gui-3d-demos_2.0.bb         | 49 ++---------
 .../matrix/matrix-gui-apps-git.inc            |  2 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 83 -------------------
 4 files changed, 7 insertions(+), 131 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 361bd04b..3d9ebdf3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -69,10 +69,6 @@ MATRIX_TOUCH_APPS = " \
 "
 
 MATRIX_GPU_DEMOS = " \
-    matrix-3d-demo-chameleon \
-    matrix-3d-demo-coverflow \
-    matrix-3d-demo-navigation \
-    matrix-3d-demo-exampleui \
     matrix-3d-demo-kmscube \
 "
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 2c2aef82..a834fbbf 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -16,15 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 #       into the same layer as libgles this may be acceptable, or perhaps
 #       we can use an RRECOMMENDS instead.
 
-PACKAGES = "matrix-3d-demo-chameleon \
-            matrix-3d-demo-coverflow \
-            matrix-3d-demo-film      \
-            matrix-3d-demo-lantern   \
-            matrix-3d-demo-skull     \
-            matrix-3d-demo-shaders   \
-            matrix-3d-demo-vase      \
-            matrix-3d-demo-navigation   \
-            matrix-3d-demo-exampleui    \
+PACKAGES = " \
 "
 
 PACKAGES:append:omap-a15 = " \
@@ -53,44 +45,15 @@ do_install:prepend() {
 
 3D_DEMOS_RDEPENDS_MATRIX = "matrix-gui-apps-images matrix-gui-submenus-3d"
 3D_DEMOS_RDEPENDS = "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:omap-a15 = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS:ti43x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS:ti33x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS:k3       = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-
-RDEPENDS:matrix-3d-demo-chameleon = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-coverflow = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-film      = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-lantern   = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-skull     = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-shaders   = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-vase      = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-navigation    = "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-exampleui     = "${3D_DEMOS_RDEPENDS}"
+3D_DEMOS_RDEPENDS:omap-a15 = "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:ti43x    = "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:ti33x    = "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:k3       = "${3D_DEMOS_RDEPENDS_MATRIX}"
+
 RDEPENDS:matrix-3d-demo-kmscube       = "${3D_DEMOS_RDEPENDS_MATRIX} kmscube"
 #RDEPENDS:matrix-3d-demo-kmscubevideo  = "${3D_DEMOS_RDEPENDS_MATRIX} omapdrmtest"
 RDEPENDS:matrix-3d-demo-kmscubevideo  = "${3D_DEMOS_RDEPENDS_MATRIX}"
 
 # Split the matrix files by 3d demos
-FILES:matrix-3d-demo-chameleon = "${MATRIX_APP_DIR}/3d_chameleon/*"
-FILES:matrix-3d-demo-coverflow = "${MATRIX_APP_DIR}/3d_coverflow/*"
-FILES:matrix-3d-demo-film      = "${MATRIX_APP_DIR}/3d_film/*"
-FILES:matrix-3d-demo-lantern   = "${MATRIX_APP_DIR}/3d_lantern/*"
-FILES:matrix-3d-demo-skull     = "${MATRIX_APP_DIR}/3d_skull/*"
-FILES:matrix-3d-demo-shaders   = "${MATRIX_APP_DIR}/3d_shaders/*"
-FILES:matrix-3d-demo-vase      = "${MATRIX_APP_DIR}/3d_vase/*"
-FILES:matrix-3d-demo-navigation       = "${MATRIX_APP_DIR}/3d_navigation/*"
-FILES:matrix-3d-demo-exampleui        = "${MATRIX_APP_DIR}/3d_exampleui/*"
 FILES:matrix-3d-demo-kmscube          = "${MATRIX_APP_DIR}/3d_kmscube/*"
 FILES:matrix-3d-demo-kmscubevideo     = "${MATRIX_APP_DIR}/3d_kmscubevideo/*"
-
-# Split the ${bindir} files by 3d demos
-FILES:matrix-3d-demo-chameleon += "${bindir}/runOGLES2ChameleonMan.sh"
-FILES:matrix-3d-demo-coverflow += "${bindir}/runOGLES2Coverflow.sh"
-FILES:matrix-3d-demo-film      += "${bindir}/runOGLESFilmTV.sh"
-FILES:matrix-3d-demo-lantern   += "${bindir}/runOGLES2MagicLantern.sh"
-FILES:matrix-3d-demo-skull     += "${bindir}/runOGLESEvilSkull.sh"
-FILES:matrix-3d-demo-shaders   += "${bindir}/runOGLES2Shaders.sh"
-FILES:matrix-3d-demo-vase      += "${bindir}/runOGLESVase.sh"
-FILES:matrix-3d-demo-navigation      += "${bindir}/runOGLES2Navigation.sh"
-FILES:matrix-3d-demo-exampleui       += "${bindir}/runOGLES2ExampleUI.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index fb61b340..0074242e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "976e775a1275198d3391018ce8115a66d00120a2"
+SRCREV = "0d947fece94dd56784775d1e550464ed7a5a3888"
 BRANCH = "master"
 INC_PR = "r76"
 
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
deleted file mode 100644
index d855d191..00000000
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ /dev/null
@@ -1,83 +0,0 @@
-DESCRIPTION = "Imagination PowerVR SDK binaries/examples"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
-
-CLEANBROKEN = "1"
-
-BRANCH = "master"
-
-SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "e52592c843ad16be31db411b85c4059d82c4a6b9"
-
-PR = "r19"
-
-COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
-
-S = "${WORKDIR}/git"
-SRC_DIR = "arm"
-SRC_DIR:k3 = "arm64"
-
-do_install () {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}/opt/img-powervr-sdk
-    cp ${CP_ARGS} ${S}/targetfs/${SRC_DIR}/PVRHub ${D}/opt/img-powervr-sdk
-    cp ${CP_ARGS} ${S}/targetfs/${SRC_DIR}/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
-
-    install -d ${D}${bindir}/SGX/demos/Raw/
-    install -d ${D}${bindir}/SGX/demos/Wayland/
-    install -d ${D}${bindir}/SGX/demos/DRM/
-
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
-
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Navigation ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
-
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2Coverflow ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2ExampleUI ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2Navigation ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2MagicLantern ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2FilmTV ${D}${bindir}/SGX/demos/DRM/
-}
-
-do_install:append:j7 () {
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
-
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
-}
-
-
-RDEPENDS:${PN} = "libegl"
-
-INHIBIT_PACKAGE_STRIP = "1"
-
-INSANE_SKIP:${PN} += "dev-so staticdev already-stripped ldflags file-rdeps"
-
-FILES:${PN} += " \
-    /opt/img-powervr-sdk/* \
-"
-- 
2.17.1


