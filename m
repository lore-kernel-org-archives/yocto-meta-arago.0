Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 378A252A14
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 13:55:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrxeE063449
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572357239;
	bh=g6hqY97NnT01NeWeVevm6/1vko8se1mcQYPJkU/ozW0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PucDqWFWSZly/LD2YxO0RLqfBEMrNipTCVJkvC/+9dX1Lo4MtmS0jrthisWyylQTS
	WV7ThfXe3/wfU1IElmQCvUhwgxgoJ9k8jzIAAZHN/xewZvYA/omqDOdlX6yFj5IVge
	Tc+YtmDvbNZ4TAr6WpoEFna+1bgIdwpad8FGkqHg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrxh8028869
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:59 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 08:53:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 08:53:46 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrvlc002718
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Oct 2019 09:53:47 -0400
Message-ID: <20191029135349.31792-6-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135349.31792-1-e-ruei1@ti.com>
References: <20191029135349.31792-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 5/7] img-pvr-sdk: Add DRM(GBM)-based GPU demos
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
X-List-Received-Date: Tue, 29 Oct 2019 13:55:21 -0000
Content-Type: text/plain

- bump SRCREV to pick up the GPU demos rebuilt against the latest
  EGL/GLES libraries
- Add DRM-base demos for full-screen operation
- cleanup the do_install operation

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 71 ++++++++++---------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 98fb6e00..7cdc6183 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,9 +7,9 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "e76ae77b27ef570e7b8494c3d7067fd3d72b5976"
+SRCREV = "bb8b74cdd1323e76697b3eb2258f863b15fee287"
 
-PR = "r17"
+PR = "r18"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
@@ -25,6 +25,7 @@ do_install () {
 
     install -d ${D}${bindir}/SGX/demos/Raw/
     install -d ${D}${bindir}/SGX/demos/Wayland/
+    install -d ${D}${bindir}/SGX/demos/DRM/
 
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
@@ -33,38 +34,44 @@ do_install () {
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
 
-    if [ ${SRC_DIR} == "arm" ]; then
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Navigation ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
-    fi
-
-    if [ ${SRC_DIR} == "arm64" ]; then
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
-        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
-
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
-        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
-    fi
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Navigation ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
+
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/DRM/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2Coverflow ${D}${bindir}/SGX/demos/DRM/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2ExampleUI ${D}${bindir}/SGX/demos/DRM/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2Navigation ${D}${bindir}/SGX/demos/DRM/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2MagicLantern ${D}${bindir}/SGX/demos/DRM/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2FilmTV ${D}${bindir}/SGX/demos/DRM/
 }
 
+do_install_append_j7-evm () {
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
+
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
+    cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
+}
+
+
 RDEPENDS_${PN} = "ti-sgx-ddk-um"
 RDEPENDS_${PN}_j7-evm = "ti-img-rogue-umlibs"
 
-- 
2.17.1


