Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1D3E9529AE
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2018 13:12:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UDCWeg049565
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 08:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535634752;
	bh=G5kx3zU4D0J9R8fJ7RtSJVVj09noIcEkqKFYaitSu2o=;
	h=From:To:CC:Subject:Date;
	b=w+Xf/9fF6Ac164dHineTm+jx9JId5Zl7yhVCFpJYDimMUcZKGEvY7eP1g8kLPDzsN
	nvNKgWCoehHIvQHVGb9b2/RDgtKr2OBiit243HSDJHXYqZJADK44u8UirQUvN2K1QA
	dSmqlWb5vSFdN+yoPvQLKrazcVPhWLwz9EM10/kg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UDCWoe031335
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2018 08:12:32 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 08:12:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 08:12:31 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UDCVw3021898;
	Thu, 30 Aug 2018 08:12:31 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2018 09:12:29 -0400
Message-ID: <1535634749-26642-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] matrix-gui: tidl: Add demos with higher fps
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
X-List-Received-Date: Thu, 30 Aug 2018 13:12:40 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |  4 ++--
 .../matrix/matrix-gui-tidl-demos_2.0.bb            | 24 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 3204af2..bbb4f2d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "5e96e80aa929508d4c096cc387183d83852f0450"
+SRCREV = "55f8e4baec0bf28ad475038fb1e20fbde4abf751"
 BRANCH = "master"
-INC_PR = "r55"
+INC_PR = "r56"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
index 099e027..8a9fb5a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -15,14 +15,25 @@ TIDLDEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-tidl"
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 PACKAGES = "matrix-tidl-demo-staticimg \
+            matrix-tidl-demo-staticimg_lg2 \
+            matrix-tidl-demo-staticimg_dsponly \
             matrix-tidl-demo-pnexamples \
             matrix-tidl-demo-livecam \
+            matrix-tidl-demo-livecam_lg2 \
 "
 
 RDEPENDS_matrix-tidl-demo-staticimg = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
+RDEPENDS_matrix-tidl-demo-staticimg_lg2 = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-staticimg_dsponly = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
 RDEPENDS_matrix-tidl-demo-pnexamples = " \
     ${TIDLDEMO_RDEPENDS} \
 "
@@ -31,11 +42,24 @@ RDEPENDS_matrix-tidl-demo-livecam = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
+RDEPENDS_matrix-tidl-demo-livecam_lg2 = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
 FILES_matrix-tidl-demo-staticimg = "${MATRIX_APP_DIR}/tidl_demo_staticimg/*"
 FILES_matrix-tidl-demo-staticimg += "${bindir}/runTidlStaticImg.sh"
 
+FILES_matrix-tidl-demo-staticimg_lg2 = "${MATRIX_APP_DIR}/tidl_demo_staticimg_lg2/*"
+FILES_matrix-tidl-demo-staticimg_lg2 += "${bindir}/runTidlStaticImg_lg2.sh"
+
+FILES_matrix-tidl-demo-staticimg_dsponly = "${MATRIX_APP_DIR}/tidl_demo_staticimg_dsponly/*"
+FILES_matrix-tidl-demo-staticimg_dsponly += "${bindir}/runTidlStaticImg_dsponly.sh"
+
 FILES_matrix-tidl-demo-pnexamples = "${MATRIX_APP_DIR}/tidl_demo_pnexamples/*"
 FILES_matrix-tidl-demo-pnexamples += "${bindir}/runTidlPnExamples.sh"
 
 FILES_matrix-tidl-demo-livecam   = "${MATRIX_APP_DIR}/tidl_demo_livecam/*"
 FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
+
+FILES_matrix-tidl-demo-livecam_lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
+FILES_matrix-tidl-demo-livecam_lg2  += "${bindir}/runTidlLiveCam_lg2.sh"
-- 
1.9.1


