Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E29485297D
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 20:06:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RK6IYV018554
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 15:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490645178;
	bh=ARt0mNkvspuS88kBox+u3gdXFYOb2Soj/Ixam2pfKA0=;
	h=From:To:CC:Subject:Date;
	b=x5nN2GtAxdfJ6vEzJUYziZHntZghEn+Ruu6GsiyT0ozHNf+4EdTA/DX5oh8+DBeIx
	calDC1wUE1pg7wZzq0i2TbywQaH77dt52Na5DbrmvBjw6yXIIbCFfph+HtaGlvLgIc
	4drPSIQdGUCpUHKdEKKPZps/oUcGXoi/t3vCnlZc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RK6Dsq010733
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 15:06:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 15:06:12 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2RK6CX2029728;	Mon, 27 Mar 2017 15:06:13 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 16:06:10 -0400
Message-ID: <1490645170-13951-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [morty/krogoth][PATCH 3/4 v2] matrix-gui-machinevision-demos: add simple-people-tracking demo
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
X-List-Received-Date: Mon, 27 Mar 2017 20:06:29 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
V2 changes:
* Bump SRCREV to pick up URL fix in the demo description page

 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc |  4 ++--
 .../recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb | 11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 02156c8..0ae0d21 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "b96f7c7365c166bf59abf6486912eaad2e0ad607"
+SRCREV = "7ab39e827e65c35f4e37d1142a45071f670395fe"
 BRANCH = "master"
-INC_PR = "r45"
+INC_PR = "r46"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 9c7eb92..b98fdc9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit allarch
 
@@ -17,6 +17,7 @@ FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 PACKAGES = "matrix-machinevision-demo-dlp3dscanner \
             matrix-machinevision-demo-barcoderoi \
             matrix-machinevision-demo-barcoderoi-f2f \
+            matrix-machinevision-demo-simplepeopletracking \
 "
 
 RDEPENDS_matrix-machinevision-demo-dlp3dscanner_dra7xx = " \
@@ -34,6 +35,11 @@ RDEPENDS_matrix-machinevision-demo-barcoderoi-f2f = " \
     barcode-roi \
 "
 
+RDEPENDS_matrix-machinevision-demo-simplepeopletracking = " \
+    ${MACHINEVISION_RDEPENDS} \
+    voxelsdk \
+"
+
 FILES_matrix-machinevision-demo-dlp3dscanner    = "${MATRIX_APP_DIR}/machinevision_dlp_3d_scanner/*"
 FILES_matrix-machinevision-demo-dlp3dscanner   += "${bindir}/runDlp3DScanner.sh"
 
@@ -41,3 +47,6 @@ FILES_matrix-machinevision-demo-barcoderoi    = "${MATRIX_APP_DIR}/machinevision
 FILES_matrix-machinevision-demo-barcoderoi   += "${bindir}/runBarcodeRoi.sh"
 FILES_matrix-machinevision-demo-barcoderoi-f2f = "${MATRIX_APP_DIR}/machinevision_barcode_roi_f2f/*"
 FILES_matrix-machinevision-demo-barcoderoi-f2f += "${bindir}/runBarcodeRoiSave2File.sh"
+
+FILES_matrix-machinevision-demo-simplepeopletracking   = "${MATRIX_APP_DIR}/machinevision_simple_people_tracking/*"
+FILES_matrix-machinevision-demo-simplepeopletracking   += "${bindir}/runSimplePeopleTracking.sh"
-- 
1.9.1


