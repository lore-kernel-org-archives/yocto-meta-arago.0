Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 673A152A15
	for <meta-arago@arago-project.org>;
	Tue, 11 Sep 2018 13:10:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8BDAdOk012221
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 08:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536671439;
	bh=LELe7Xjx4iy7S21T1/r4bDNd4XhNY+4W0uUsidTTDDM=;
	h=From:To:CC:Subject:Date;
	b=PG6hwRX26d8Y+KVMFyaYIkAauK8bAAr4FqDl8CH1pR9a/GGQT2ITxN7omAah58/Wg
	9KKh7rlYGs4wb939Xn1pX4y2WWkITd4CyfGzq6DZ78XdEZmQjSOhwz8G3B3HLFcHaK
	n6YfOuSk0ESJeMUDT3RqheRm9QkY5Uor5dYGPmeA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8BDAbTx009209
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 08:10:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 11 Sep 2018 08:10:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 11 Sep 2018 08:10:37 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8BDAavD024189;
	Tue, 11 Sep 2018 08:10:36 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Sep 2018 09:10:34 -0400
Message-ID: <1536671434-7121-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] matrix-gui: tidl: Fix package names
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
X-List-Received-Date: Tue, 11 Sep 2018 13:10:48 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |  4 ++--
 .../matrix/matrix-gui-tidl-demos_2.0.bb            | 24 +++++++++++-----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index bbb4f2d..3620e85 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "55f8e4baec0bf28ad475038fb1e20fbde4abf751"
+SRCREV = "1fab50f6ceac640bf946e8716a68b1c827256489"
 BRANCH = "master"
-INC_PR = "r56"
+INC_PR = "r57"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
index 8a9fb5a..33d0af7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -15,22 +15,22 @@ TIDLDEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-tidl"
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 PACKAGES = "matrix-tidl-demo-staticimg \
-            matrix-tidl-demo-staticimg_lg2 \
-            matrix-tidl-demo-staticimg_dsponly \
+            matrix-tidl-demo-staticimg-lg2 \
+            matrix-tidl-demo-staticimg-dsponly \
             matrix-tidl-demo-pnexamples \
             matrix-tidl-demo-livecam \
-            matrix-tidl-demo-livecam_lg2 \
+            matrix-tidl-demo-livecam-lg2 \
 "
 
 RDEPENDS_matrix-tidl-demo-staticimg = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
-RDEPENDS_matrix-tidl-demo-staticimg_lg2 = " \
+RDEPENDS_matrix-tidl-demo-staticimg-lg2 = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
-RDEPENDS_matrix-tidl-demo-staticimg_dsponly = " \
+RDEPENDS_matrix-tidl-demo-staticimg-dsponly = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
@@ -42,18 +42,18 @@ RDEPENDS_matrix-tidl-demo-livecam = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
-RDEPENDS_matrix-tidl-demo-livecam_lg2 = " \
+RDEPENDS_matrix-tidl-demo-livecam-lg2 = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
 FILES_matrix-tidl-demo-staticimg = "${MATRIX_APP_DIR}/tidl_demo_staticimg/*"
 FILES_matrix-tidl-demo-staticimg += "${bindir}/runTidlStaticImg.sh"
 
-FILES_matrix-tidl-demo-staticimg_lg2 = "${MATRIX_APP_DIR}/tidl_demo_staticimg_lg2/*"
-FILES_matrix-tidl-demo-staticimg_lg2 += "${bindir}/runTidlStaticImg_lg2.sh"
+FILES_matrix-tidl-demo-staticimg-lg2 = "${MATRIX_APP_DIR}/tidl_demo_staticimg_lg2/*"
+FILES_matrix-tidl-demo-staticimg-lg2 += "${bindir}/runTidlStaticImg_lg2.sh"
 
-FILES_matrix-tidl-demo-staticimg_dsponly = "${MATRIX_APP_DIR}/tidl_demo_staticimg_dsponly/*"
-FILES_matrix-tidl-demo-staticimg_dsponly += "${bindir}/runTidlStaticImg_dsponly.sh"
+FILES_matrix-tidl-demo-staticimg-dsponly = "${MATRIX_APP_DIR}/tidl_demo_staticimg_dsponly/*"
+FILES_matrix-tidl-demo-staticimg-dsponly += "${bindir}/runTidlStaticImg_dsponly.sh"
 
 FILES_matrix-tidl-demo-pnexamples = "${MATRIX_APP_DIR}/tidl_demo_pnexamples/*"
 FILES_matrix-tidl-demo-pnexamples += "${bindir}/runTidlPnExamples.sh"
@@ -61,5 +61,5 @@ FILES_matrix-tidl-demo-pnexamples += "${bindir}/runTidlPnExamples.sh"
 FILES_matrix-tidl-demo-livecam   = "${MATRIX_APP_DIR}/tidl_demo_livecam/*"
 FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
 
-FILES_matrix-tidl-demo-livecam_lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
-FILES_matrix-tidl-demo-livecam_lg2  += "${bindir}/runTidlLiveCam_lg2.sh"
+FILES_matrix-tidl-demo-livecam-lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
+FILES_matrix-tidl-demo-livecam-lg2  += "${bindir}/runTidlLiveCam_lg2.sh"
-- 
1.9.1


