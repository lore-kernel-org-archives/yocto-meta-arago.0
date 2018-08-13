Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D09FB529DC
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2018 18:54:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7DIsPr2035822
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2018 13:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534186465;
	bh=l99mdlHaIulyGfsObztAU5pnH+urMeo2ll9lNctCFGc=;
	h=From:To:Subject:Date;
	b=qyN4q0H6HFJ/lXClLobjbfhVmuecD/Up63XFw/Sq1wO85CkstoNDvaStGPi7+BmRm
	dhwK+aqoq93omg6mJhWbZO7mqZXA/BBpDi+4fLhL5xfc3dB662P3tIOu1/RXc64TEq
	RNvorFAMvJgeJ2If0XODseHPFAjSj7DljLc/MlrQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7DIsPRI016912
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2018 13:54:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 13 Aug 2018 13:54:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 13 Aug 2018 13:54:25 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7DIsONe011691
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2018 13:54:24 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2018 14:54:20 -0400
Message-ID: <1534186460-6199-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] img-pvr-sdk: fix SRC_DIR condition
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
X-List-Received-Date: Mon, 13 Aug 2018 18:54:33 -0000
Content-Type: text/plain

It should be ${SRC_DIR} instead of SRC_DIR

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index aeba9d0..9c563d2 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -9,7 +9,7 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
 SRCREV = "3e5c2fa3458a8cae4b6b8d62391fc32b708a2ed4"
 
-PR = "r12"
+PR = "r13"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
@@ -33,7 +33,7 @@ do_install () {
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/NullWS/OGLES2FilmTV ${D}${bindir}/SGX/demos/Raw/
 
-    if [ SRC_DIR == "arm" ] ; then
+    if [ ${SRC_DIR} == "arm" ] ; then
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Wayland/
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2Coverflow ${D}${bindir}/SGX/demos/Wayland/
         install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Wayland/
-- 
1.9.1


