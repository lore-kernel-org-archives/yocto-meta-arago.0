Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 01A1D52978
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 23:11:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25NBrS0097656
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 17:11:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551827513;
	bh=MTbYlsAYRkywM+DAxnyFywWUeJkBBDCeFy9/jpmwIO0=;
	h=From:To:CC:Subject:Date;
	b=Rrngs6oOq1KN43Ho1xQjXK2HRoJKQ/g+KY7cCxe5x1oHU6arNPCE74eDwJ6T0s3uv
	ecqf9yYLvMnyiyGOtgGa45/lFon0RVE4AeNmr97IxsOiMZWz0DR/xLN06V/Ika/sjY
	2Y9wEhamYo04p34LXdnAF6ma8KaBfgyLD93QzIw8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25NBqVb063359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 17:11:52 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 17:11:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 17:11:52 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25NBqk6001153;
	Tue, 5 Mar 2019 17:11:52 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Mar 2019 13:05:36 -0500
Message-ID: <20190305180536.23260-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] matrix-gui:tidl: Add four more demos (objdet and segmentation)
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
X-List-Received-Date: Tue, 05 Mar 2019 23:12:00 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../matrix/matrix-gui-tidl-demos_2.0.bb       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
index 8062648f..37d730e6 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -20,6 +20,10 @@ PACKAGES = "matrix-tidl-demo-staticimg \
             matrix-tidl-demo-pnexamples \
             matrix-tidl-demo-livecam \
             matrix-tidl-demo-livecam-lg2 \
+            matrix-tidl-demo-dogbreeds \
+            matrix-tidl-demo-objdet \
+            matrix-tidl-demo-objdet-livecam \
+            matrix-tidl-demo-segment \
             matrix-armnn-demo-staticimg \
             matrix-armnn-demo-livecam \
 "
@@ -48,6 +52,22 @@ RDEPENDS_matrix-tidl-demo-livecam-lg2 = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
+RDEPENDS_matrix-tidl-demo-dogbreeds = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-objdet = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-objdet-livecam = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-segment = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
 RDEPENDS_matrix-armnn-demo-staticimg = " \
     ${TIDLDEMO_RDEPENDS} \
 "
@@ -74,6 +94,18 @@ FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
 FILES_matrix-tidl-demo-livecam-lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
 FILES_matrix-tidl-demo-livecam-lg2  += "${bindir}/runTidlLiveCam_lg2.sh"
 
+FILES_matrix-tidl-demo-dogbreeds = "${MATRIX_APP_DIR}/tidl_demo_dogbreeds/*"
+FILES_matrix-tidl-demo-dogbreeds += "${bindir}/runTidlDogBreeds.sh"
+
+FILES_matrix-tidl-demo-objdet   = "${MATRIX_APP_DIR}/tidl_demo_objdet/*"
+FILES_matrix-tidl-demo-objdet   += "${bindir}/runTidlObjdet.sh"
+
+FILES_matrix-tidl-demo-objdet-livecam   = "${MATRIX_APP_DIR}/tidl_demo_objdet_livecam/*"
+FILES_matrix-tidl-demo-objdet-livecam   += "${bindir}/runTidlObjdet_livecam.sh"
+
+FILES_matrix-tidl-demo-segment   = "${MATRIX_APP_DIR}/tidl_demo_segment/*"
+FILES_matrix-tidl-demo-segment   += "${bindir}/runTidlSegment.sh"
+
 FILES_matrix-armnn-demo-staticimg = "${MATRIX_APP_DIR}/armnn_demo_staticimg/*"
 FILES_matrix-armnn-demo-staticimg += "${bindir}/runArmnnStaticImg.sh"
 
-- 
2.17.1


