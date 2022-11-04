Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A77DC4708A
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.208.1667598073379364473
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D213F40D85
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpWF224UtEwQ for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BDF5040D7F
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 50574163677
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 01/14] img-pvr-sdk: Drop img-pvr-sdk and update matrix
Date: Fri,  4 Nov 2022 21:40:59 +0000
Message-Id: <20221104214112.1221365-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14098

From: Randolph Sapp <rs@ti.com>

The img-pvr-sdk package currently ships dated demos and pvr tools. Instea=
d of
packaging these ourselves, we should redirect users to to the latest vers=
ions
published by Imagination to prevent things like PVRTune server-GUI mismat=
ch.

Matrix-gui has been updated to not depend on img-pvr-sdk demos and the
img-pvr-sdk package directory and bitbake recipe has been removed.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroup-arago-tisdk-matrix.bb        |  4 -
 .../matrix/matrix-gui-3d-demos_2.0.bb         | 49 ++---------
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 83 -------------------
 3 files changed, 6 insertions(+), 130 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pv=
r-sdk_3.3.2.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-matrix.bb
index 361bd04b..3d9ebdf3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
@@ -69,10 +69,6 @@ MATRIX_TOUCH_APPS =3D " \
 "
=20
 MATRIX_GPU_DEMOS =3D " \
-    matrix-3d-demo-chameleon \
-    matrix-3d-demo-coverflow \
-    matrix-3d-demo-navigation \
-    matrix-3d-demo-exampleui \
     matrix-3d-demo-kmscube \
 "
=20
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 2c2aef82..a834fbbf 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -16,15 +16,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 #       into the same layer as libgles this may be acceptable, or perhap=
s
 #       we can use an RRECOMMENDS instead.
=20
-PACKAGES =3D "matrix-3d-demo-chameleon \
-            matrix-3d-demo-coverflow \
-            matrix-3d-demo-film      \
-            matrix-3d-demo-lantern   \
-            matrix-3d-demo-skull     \
-            matrix-3d-demo-shaders   \
-            matrix-3d-demo-vase      \
-            matrix-3d-demo-navigation   \
-            matrix-3d-demo-exampleui    \
+PACKAGES =3D " \
 "
=20
 PACKAGES:append:omap-a15 =3D " \
@@ -53,44 +45,15 @@ do_install:prepend() {
=20
 3D_DEMOS_RDEPENDS_MATRIX =3D "matrix-gui-apps-images matrix-gui-submenus=
-3d"
 3D_DEMOS_RDEPENDS =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:omap-a15 =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS:ti43x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS:ti33x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS:k3       =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-
-RDEPENDS:matrix-3d-demo-chameleon =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-coverflow =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-film      =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-lantern   =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-skull     =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-shaders   =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-vase      =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-navigation    =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS:matrix-3d-demo-exampleui     =3D "${3D_DEMOS_RDEPENDS}"
+3D_DEMOS_RDEPENDS:omap-a15 =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:ti43x    =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:ti33x    =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:k3       =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
+
 RDEPENDS:matrix-3d-demo-kmscube       =3D "${3D_DEMOS_RDEPENDS_MATRIX} k=
mscube"
 #RDEPENDS:matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX} =
omapdrmtest"
 RDEPENDS:matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
=20
 # Split the matrix files by 3d demos
-FILES:matrix-3d-demo-chameleon =3D "${MATRIX_APP_DIR}/3d_chameleon/*"
-FILES:matrix-3d-demo-coverflow =3D "${MATRIX_APP_DIR}/3d_coverflow/*"
-FILES:matrix-3d-demo-film      =3D "${MATRIX_APP_DIR}/3d_film/*"
-FILES:matrix-3d-demo-lantern   =3D "${MATRIX_APP_DIR}/3d_lantern/*"
-FILES:matrix-3d-demo-skull     =3D "${MATRIX_APP_DIR}/3d_skull/*"
-FILES:matrix-3d-demo-shaders   =3D "${MATRIX_APP_DIR}/3d_shaders/*"
-FILES:matrix-3d-demo-vase      =3D "${MATRIX_APP_DIR}/3d_vase/*"
-FILES:matrix-3d-demo-navigation       =3D "${MATRIX_APP_DIR}/3d_navigati=
on/*"
-FILES:matrix-3d-demo-exampleui        =3D "${MATRIX_APP_DIR}/3d_exampleu=
i/*"
 FILES:matrix-3d-demo-kmscube          =3D "${MATRIX_APP_DIR}/3d_kmscube/=
*"
 FILES:matrix-3d-demo-kmscubevideo     =3D "${MATRIX_APP_DIR}/3d_kmscubev=
ideo/*"
-
-# Split the ${bindir} files by 3d demos
-FILES:matrix-3d-demo-chameleon +=3D "${bindir}/runOGLES2ChameleonMan.sh"
-FILES:matrix-3d-demo-coverflow +=3D "${bindir}/runOGLES2Coverflow.sh"
-FILES:matrix-3d-demo-film      +=3D "${bindir}/runOGLESFilmTV.sh"
-FILES:matrix-3d-demo-lantern   +=3D "${bindir}/runOGLES2MagicLantern.sh"
-FILES:matrix-3d-demo-skull     +=3D "${bindir}/runOGLESEvilSkull.sh"
-FILES:matrix-3d-demo-shaders   +=3D "${bindir}/runOGLES2Shaders.sh"
-FILES:matrix-3d-demo-vase      +=3D "${bindir}/runOGLESVase.sh"
-FILES:matrix-3d-demo-navigation      +=3D "${bindir}/runOGLES2Navigation=
.sh"
-FILES:matrix-3d-demo-exampleui       +=3D "${bindir}/runOGLES2ExampleUI.=
sh"
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3=
.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.=
2.bb
deleted file mode 100644
index 7cd6d8c9..00000000
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ /dev/null
@@ -1,83 +0,0 @@
-DESCRIPTION =3D "Imagination PowerVR SDK binaries/examples"
-LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM =3D "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=3D=
46bcbfc69f8837c339e15fd4a5044a8c"
-
-CLEANBROKEN =3D "1"
-
-BRANCH =3D "master"
-
-SRC_URI =3D "git://git.ti.com/git/graphics/img-pvr-sdk.git;protocol=3Dht=
tps;branch=3D${BRANCH}"
-SRCREV =3D "e52592c843ad16be31db411b85c4059d82c4a6b9"
-
-PR =3D "r19"
-
-COMPATIBLE_MACHINE =3D "omap-a15|ti43x|ti33x|k3"
-
-S =3D "${WORKDIR}/git"
-SRC_DIR =3D "arm"
-SRC_DIR:k3 =3D "arm64"
-
-do_install () {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}/opt/img-powervr-sdk
-    cp ${CP_ARGS} ${S}/targetfs/${SRC_DIR}/PVRHub ${D}/opt/img-powervr-s=
dk
-    cp ${CP_ARGS} ${S}/targetfs/${SRC_DIR}/PVRScopeDeveloper ${D}/opt/im=
g-powervr-sdk
-
-    install -d ${D}${bindir}/SGX/demos/Raw/
-    install -d ${D}${bindir}/SGX/demos/Wayland/
-    install -d ${D}${bindir}/SGX/demos/DRM/
-
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGL=
ES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGL=
ES2Coverflow ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGL=
ES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGL=
ES2Navigation ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGL=
ES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGL=
ES2FilmTV ${D}${bindir}/SGX/demos/Raw/
-
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OG=
LES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OG=
LES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OG=
LES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OG=
LES2Navigation ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OG=
LES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OG=
LES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
-
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
ChameleonMan ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
Coverflow ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
ExampleUI ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
Navigation ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
MagicLantern ${D}${bindir}/SGX/demos/DRM/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
FilmTV ${D}${bindir}/SGX/demos/DRM/
-}
-
-do_install:append:j7 () {
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
-
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
-    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_Open=
GLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
-}
-
-
-RDEPENDS:${PN} =3D "libegl"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-
-INSANE_SKIP:${PN} +=3D "dev-so staticdev already-stripped ldflags file-r=
deps"
-
-FILES:${PN} +=3D " \
-    /opt/img-powervr-sdk/* \
-"
--=20
2.25.1


