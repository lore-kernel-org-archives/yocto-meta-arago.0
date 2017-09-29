Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id CC8FD52A86
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINbbm024529
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709417;
	bh=C3vXLfdO9xQ8JkiJ0wZznnDn71/YXULKjytx6EtJwpA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Rs5INUuLSeAISqNGzLyRtgMMhmne+CjR+q/PYBDv8CcZooP6FWChqGVc8RCc6IXaj
	4n991W+g8rgBtScjkzk/B/N1yRm4SGhkuIERun9D/QzNqmC3t8HKROY1J3TwaG1yQB
	70Xsb8W5ViNcAqBx2TnRERU7OpHIBiv91sE/RCbs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINb4i010452
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:37 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8k006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:25 -0400
Message-ID: <1506709407-16448-22-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 21/ packagegroup-arago-tisdk-matrix: remove unsupported matrix-gui demos for X11(xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:43 -0000
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


