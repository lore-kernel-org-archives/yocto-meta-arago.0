Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 39F9A52A14
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 23:08:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16N8Fc7015778
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 17:08:15 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16N8FNb028857
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 17:08:15 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Feb 2017 17:08:14 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v16N8E0u003764;	Mon, 6 Feb 2017 17:08:15 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Feb 2017 18:08:13 -0500
Message-ID: <1486422493-5282-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 5/6 V2] packagegroup-arago-tisdk-matrix: add barcode-roi demo
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
X-List-Received-Date: Mon, 06 Feb 2017 23:08:17 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
V2 changes:
Group barcode-roi demo according to whether it uses OpenCL

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 848492c..f64a591 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r62"
+PR = "r63"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -61,6 +61,18 @@ MATRIX_OPENCL_APPS_append_dra7xx = " \
     matrix-machinevision-demo-dlp3dscanner \
 "
 
+MATRIX_OPENCV_ARM_ONLY_APPS = " \
+     matrix-machinevision-demo-barcoderoi \
+"
+
+MATRIX_OPENCV_OPENCL_APPS = " \
+    matrix-machinevision-demo-barcoderoi-f2f \
+"
+
+MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
+     matrix-machinevision-demo-barcoderoi \
+"
+
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_ti33x = "        \
@@ -76,6 +88,8 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-pm-demos-governor    \
                                     \
     matrix-gui-ethernet-demos       \
+                                    \
+    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -91,6 +105,8 @@ MATRIX_APPS_append_ti43x = "        \
                                     \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
+                                    \
+    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -126,4 +142,5 @@ RDEPENDS_${PN} = "        \
     ${MATRIX_APPS}        \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCL_APPS}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCV_OPENCL_APPS}",'',d)} \
 "
-- 
1.9.1


