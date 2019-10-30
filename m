Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id B321B52A4C
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtwF0122951
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465358;
	bh=g6hqY97NnT01NeWeVevm6/1vko8se1mcQYPJkU/ozW0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hVbGWms2BRdzYp57JmXf8gedSsMwCquedHsTtzhndAb0b1mUExov8vfkMIvJiEZaY
	q9uqD4U4BFXB2raqw5vyC6Zr2JT7boFe8Wvl/ifFtV9xx/R1Loeg+6f9Heahw5Hi32
	IA0/QXnLRJ0cUF7uxTUhZj70ScIixG4nKKcPjfi0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UJtwIk046719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:45 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwq112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:48 -0400
Message-ID: <20191030195550.17767-6-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 5/7] img-pvr-sdk: Add DRM(GBM)-based GPU demos
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:23 -0000
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


