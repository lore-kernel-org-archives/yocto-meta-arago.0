Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 9783252B09
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 22:22:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v13MMVfN026230
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v13MMVXP005403
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 16:22:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v13MMTL1025786;	Fri, 3 Feb 2017 16:22:30 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Feb 2017 17:22:17 -0500
Message-ID: <1486160539-23523-5-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1486160539-23523-1-git-send-email-h-gou@ti.com>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 4/6] matrix-gui-machinevision-demos: add barcode-roi demo
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
X-List-Received-Date: Fri, 03 Feb 2017 22:22:35 -0000
Content-Type: text/plain

* machinevision_barcode_roi for displaying the output
* machinevision_barcode_roi_f2f for saving the output to a file

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../matrix/matrix-gui-machinevision-demos_2.0.bb   | 24 +++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 4bd245d..9c7eb92 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit allarch
 
@@ -14,12 +14,30 @@ MACHINEVISION_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-machinevis
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
-PACKAGES = "matrix-machinevision-demo-dlp3dscanner"
+PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
+            matrix-machinevision-demo-barcoderoi \
+            matrix-machinevision-demo-barcoderoi-f2f \
+"
 
-RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
+RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = " \
     ${MACHINEVISION_RDEPENDS} \
     point-cloud-viewer \
 "
 
+RDEPENDS_matrix-machinevision-demo-barcoderoi = " \
+    ${MACHINEVISION_RDEPENDS} \
+    barcode-roi \
+"
+
+RDEPENDS_matrix-machinevision-demo-barcoderoi-f2f = " \
+    ${MACHINEVISION_RDEPENDS} \
+    barcode-roi \
+"
+
 FILES_matrix-machinevision-demo-dlp3dscanner    = "${MATRIX_APP_DIR}/machinevision_dlp_3d_scanner/*"
 FILES_matrix-machinevision-demo-dlp3dscanner   += "${bindir}/runDlp3DScanner.sh"
+
+FILES_matrix-machinevision-demo-barcoderoi    = "${MATRIX_APP_DIR}/machinevision_barcode_roi/*"
+FILES_matrix-machinevision-demo-barcoderoi   += "${bindir}/runBarcodeRoi.sh"
+FILES_matrix-machinevision-demo-barcoderoi-f2f = "${MATRIX_APP_DIR}/machinevision_barcode_roi_f2f/*"
+FILES_matrix-machinevision-demo-barcoderoi-f2f += "${bindir}/runBarcodeRoiSave2File.sh"
-- 
1.9.1


