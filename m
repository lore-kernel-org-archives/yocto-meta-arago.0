Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 86543520E2
	for <meta-arago@arago-project.org>;
	Wed, 28 Aug 2019 20:16:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SKFeSF088820
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2019 15:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567023340;
	bh=3BQnmwODSiBFbh7WoT0cUVeQyE+PH69Ode/5isO2jx4=;
	h=From:To:CC:Subject:Date;
	b=aBy+IqjUhdeeWZmMl517hYdcmB2hVyooGTBm/ZqnbNu9MFOFT399BGkYnM+Ofk2SK
	6wF5wkYLFbFpE4MakkfKdRkJ6FVUYMUaxWd0A13xx1dsvk1PDQxzc1nwhlWaSIit+0
	ZGlr0S/qaUXNTk0MWClgEdPPXlpHO4kD+Kv9qiJQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SKFeOh000391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2019 15:15:40 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 28 Aug 2019 15:15:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 28 Aug 2019 15:15:39 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SKFerB105905;
	Wed, 28 Aug 2019 15:15:40 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x7SKFdZ07049; Wed, 28 Aug 2019 15:15:39 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
Date: Wed, 28 Aug 2019 15:17:35 -0500
Message-ID: <20190828201735.11392-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] img-pvr-sdk: Add arm64 wayland demos bins
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
X-List-Received-Date: Wed, 28 Aug 2019 20:16:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 40 ++++++++++++++-----
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 9e189095..2d7676b2 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,9 +7,9 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "7af5846a0989a1475548ca05f6984c817fb76adc"
+SRCREV = "e76ae77b27ef570e7b8494c3d7067fd3d72b5976"
 
-PR = "r15"
+PR = "r16"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
@@ -26,14 +26,14 @@ do_install () {
     install -d ${D}${bindir}/SGX/demos/Raw/
     install -d ${D}${bindir}/SGX/demos/Wayland/
 
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
+    if [ ${SRC_DIR} == "arm" ]; then
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
 
-    if [ ${SRC_DIR} == "arm" ] ; then
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
@@ -41,6 +41,28 @@ do_install () {
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
     fi
+
+    if [ ${SRC_DIR} == "arm64" ]; then
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
+
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRCamera ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingPVRUtils ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESIntroducingUIRenderer ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation2D ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESNavigation3D ${D}${bindir}/SGX/demos/Wayland/
+        cp -r ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Assets_OpenGLESParticleSystem ${D}${bindir}/SGX/demos/Wayland/
+    fi
 }
 
 RDEPENDS_${PN} = "ti-sgx-ddk-um"
-- 
2.23.0


