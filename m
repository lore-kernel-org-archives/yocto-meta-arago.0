Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3B9BA529F3
	for <meta-arago@arago-project.org>;
	Fri, 27 Jul 2018 16:09:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6RG95cV104780
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532707745;
	bh=sMi4yFQMAsul7zuC9EPntreW31DkVhPNkL19yeC7Cig=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l0aWWtatla1aB8twElkHrflfbe/b68Q7rdU+hkglVQicaV3TwmYoFfqTcYH2DCHIq
	3IB4FzMZdU//XkJnJ0ywtWCAU96Fxuu3tko24z0SsMGZSkZhF/PvuHcWb3DTmY9XEl
	9ItlZ7iRkxKJ9fwDLEbPetEnwcLW5ci/wA/WZjdU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG953R030480
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 27 Jul 2018 11:09:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 27 Jul 2018 11:09:04 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG94Kn017026
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:04 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jul 2018 12:08:56 -0400
Message-ID: <1532707738-28510-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
References: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/4] img-pvr-sdk: add k3 support
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
X-List-Received-Date: Fri, 27 Jul 2018 16:09:13 -0000
Content-Type: text/plain

note: The Wayland-based example applications should be re-enabled for arm64
      devices when they are available.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 15cf41f..aeba9d0 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,36 +7,40 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "f09e59b2467cb0a5b88b6329fe35527cf65ed6e9"
+SRCREV = "3e5c2fa3458a8cae4b6b8d62391fc32b708a2ed4"
 
-PR = "r11"
+PR = "r12"
 
-COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
+COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
 S = "${WORKDIR}/git"
+SRC_DIR = "arm"
+SRC_DIR_k3 = "arm64"
 
 do_install () {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}/opt/img-powervr-sdk
-    cp ${CP_ARGS} ${S}/targetfs/PVRHub ${D}/opt/img-powervr-sdk
-    cp ${CP_ARGS} ${S}/targetfs/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
+    cp ${CP_ARGS} ${S}/targetfs/${SRC_DIR}/PVRHub ${D}/opt/img-powervr-sdk
+    cp ${CP_ARGS} ${S}/targetfs/${SRC_DIR}/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
 
     install -d ${D}${bindir}/SGX/demos/Raw/
     install -d ${D}${bindir}/SGX/demos/Wayland/
 
-    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
-    install -m 755 ${S}/targetfs/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
-
-    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2Navigation ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
-    install -m 755 ${S}/targetfs/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
+
+    if [ SRC_DIR == "arm" ] ; then
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Navigation ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Wayland/
+        install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2FilmTV ${D}${bindir}/SGX/demos/Wayland/
+    fi
 }
 
 RDEPENDS_${PN} = "ti-sgx-ddk-um"
-- 
1.9.1


