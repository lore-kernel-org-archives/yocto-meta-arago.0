Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 1DA5252AC3
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsKaL012304
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046060;
	bh=C3vXLfdO9xQ8JkiJ0wZznnDn71/YXULKjytx6EtJwpA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Nf7Pi0Pbm7lfjjIxASTpdHNtfRTGJG6PzX39QBEgEgB/QwF0XTcFkgS15fSzAWuJo
	mbtIKskKstN1CpssqOUOlKYKtRslZOKmf/qGR23tzYyDUuJyryh7idon3BtusqqohC
	ao7EU1LB5h38ZQBJsZ5f7tCnblKfCmjA/QorFzDw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsJuJ018741
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSI013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:09 -0400
Message-ID: <1507046051-57949-22-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 21/23] packagegroup-arago-tisdk-matrix: remove unsupported matrix-gui demos for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:21 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bbappend       | 52 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index 3b4e7aa..0d904ca 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -1,29 +1,67 @@
-PR_append = "-tisdk52"
+PR_append = "-tisdk53"
 
 MATRIX_SGX_DEMOS_remove_omap-a15 = " \
     matrix-3d-demo-kmscubevideo \
 "
 
+MATRIX_SGX_DEMOS_remove = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-3d-demo-kmscube','',d)}      \
+"
+
+MATRIX_OPENCL_APPS_remove_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-video-analytics-opencv-opencl-opengl-demo','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-dlp3dscanner','',d)} \
+"
+
+MATRIX_OPENCV_ARM_ONLY_APPS_remove = " \
+     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-barcoderoi','',d)} \
+     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-simplepeopletracking','',d)} \
+"
+
+MATRIX_OPENCV_OPENCL_APPS_remove = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-barcoderoi-f2f','',d)} \
+"
+
+MATRIX_OPENCV_OPENCL_APPS_remove_omap-a15 = " \
+     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-barcoderoi','',d)} \
+     ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-machinevision-demo-simplepeopletracking','',d)} \
+"
 MATRIX_COMMON_APPS_remove = " \
     matrix-gui-oprofile-demos \
 "
 MATRIX_APPS_append_ti33x = " \
-    matrix-hmi-demo-evse            \
-    matrix-hmi-demo-protection-relays \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-evse',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-protection-relays',d)} \
 "
 
 
 MATRIX_APPS_append_omap-a15 = " \
-    matrix-gui-apps-dual-camera \
-    matrix-gui-apps-image-gallery \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-gui-apps-dual-camera',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-gui-apps-image-gallery',d)} \
     matrix-multimedia-demo-audiocapture \
-    matrix-hmi-demo-evse            \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-evse',d)} \
 "
 
 MATRIX_APPS_append_ti43x = " \
     matrix-multimedia-demo-audiocapture \
-    matrix-hmi-demo-evse            \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','','matrix-hmi-demo-evse',d)} \
+"
+
+MATRIX_APPS_remove_ti43x = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-gui-apps-dual-camera','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx','matrix-gui-apps-image-gallery','',d)} \
 "
 
 MATRIX_TOUCH_APPS_keystone = ""
 MATRIX_TOUCH_APPS_omapl138 = ""
+RDEPENDS_${PN}_remove = "        \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx',"${MATRIX_OPENCL_APPS}",'',d)} \
+"
+
+RDEPENDS_${PN}_append = "        \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx',"${MATRIX_SGX_DEMOS}",'',d)} \
+"
+
+RDEPENDS_${PN}-extra_remove = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','xsgx',"${MATRIX_OPENCV_OPENCL_APPS}",'',d)} \
+"
-- 
1.9.1


