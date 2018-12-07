Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 313E9529BE
	for <meta-arago@arago-project.org>;
	Fri,  7 Dec 2018 19:28:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB7JSjSm129584
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544210925;
	bh=Byj2HRGK44uocNw/RgUrSNIHRhIRmp001FpBMNU6BBU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QgQafAO4+OTtXhNLXmwgHfVmfGs4x5+baxiwrSUqKJGKfeOqE4CD0cln08CkmunWl
	TIRoqvjoRCor3OeU+T0LCRtB3GNqHhqC0jeRiVo/Rcgs7wEFzey4/M79TBm152bKc2
	cqImWgQM5ut7UmIpOxREnZebGKJxfILpfvF8blzA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB7JSjJ9058494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 7 Dec 2018 13:28:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 7 Dec 2018 13:28:45 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB7JSiJk021043
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2018 13:28:45 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Dec 2018 14:28:38 -0500
Message-ID: <1544210919-14906-2-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544210919-14906-1-git-send-email-qsu@ti.com>
References: <1544210919-14906-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/3] matrix-gui-tidl-demos: add Arm NN Matrix GUI demo examples
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
X-List-Received-Date: Fri, 07 Dec 2018 19:28:58 -0000
Content-Type: text/plain

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
index 33d0af7..8062648 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
@@ -20,6 +20,8 @@ PACKAGES = "matrix-tidl-demo-staticimg \
             matrix-tidl-demo-pnexamples \
             matrix-tidl-demo-livecam \
             matrix-tidl-demo-livecam-lg2 \
+            matrix-armnn-demo-staticimg \
+            matrix-armnn-demo-livecam \
 "
 
 RDEPENDS_matrix-tidl-demo-staticimg = " \
@@ -46,6 +48,14 @@ RDEPENDS_matrix-tidl-demo-livecam-lg2 = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
+RDEPENDS_matrix-armnn-demo-staticimg = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-armnn-demo-livecam = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
 FILES_matrix-tidl-demo-staticimg = "${MATRIX_APP_DIR}/tidl_demo_staticimg/*"
 FILES_matrix-tidl-demo-staticimg += "${bindir}/runTidlStaticImg.sh"
 
@@ -63,3 +73,9 @@ FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
 
 FILES_matrix-tidl-demo-livecam-lg2  = "${MATRIX_APP_DIR}/tidl_demo_livecam_lg2/*"
 FILES_matrix-tidl-demo-livecam-lg2  += "${bindir}/runTidlLiveCam_lg2.sh"
+
+FILES_matrix-armnn-demo-staticimg = "${MATRIX_APP_DIR}/armnn_demo_staticimg/*"
+FILES_matrix-armnn-demo-staticimg += "${bindir}/runArmnnStaticImg.sh"
+
+FILES_matrix-armnn-demo-livecam = "${MATRIX_APP_DIR}/armnn_demo_livecam/*"
+FILES_matrix-armnn-demo-livecam += "${bindir}/runArmnnLiveCam.sh"
-- 
1.9.1


