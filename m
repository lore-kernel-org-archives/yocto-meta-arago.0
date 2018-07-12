Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DEA5752A14
	for <meta-arago@arago-project.org>;
	Thu, 12 Jul 2018 19:15:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6CJFFYp046951
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 14:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531422915;
	bh=MrkrOy87IXaV94dhfzkG1k4xb8HlUNRN+3BNwmHjmSw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O8wBs4y5QHwzE13EjXWyNu2RYUw4HFY+2eYw7pcV10K4XFsZ4SJbWSKs+pXuAvxX4
	G/yxBce7OPVqsZVeao7fWtWHc3iZf70LaKwvFjI9Pq+CTPeqtxAojcemfJTLn/9qEL
	sDPB1BNFkCYw4orNdGWGqorIObufHxYB9VB4zWYY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CJFFnB016821
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 14:15:15 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 12 Jul 2018 14:15:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 12 Jul 2018 14:15:14 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CJFDTS022560;
	Thu, 12 Jul 2018 14:15:14 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Jul 2018 15:14:50 -0400
Message-ID: <1531422891-23069-3-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531422891-23069-1-git-send-email-a0271529@ti.com>
References: <1531422891-23069-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, d-senicic1@ti.com
Subject: [ti2018.01/rocko/master] [PATCH 3/4] matrix-gui-tidl-demos: add tidl demos
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
X-List-Received-Date: Thu, 12 Jul 2018 19:15:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../matrix/matrix-gui-tidl-demos_2.0.bb            | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
new file mode 100644
index 0000000..099e027
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Deep learning vision demo descriptions for Matrix v2"
+HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/tidl_apps"
+
+# Make sure tidl submenu and app images has been installed
+TIDLDEMO_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-tidl"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
+PACKAGES = "matrix-tidl-demo-staticimg \
+            matrix-tidl-demo-pnexamples \
+            matrix-tidl-demo-livecam \
+"
+
+RDEPENDS_matrix-tidl-demo-staticimg = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-pnexamples = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+RDEPENDS_matrix-tidl-demo-livecam = " \
+    ${TIDLDEMO_RDEPENDS} \
+"
+
+FILES_matrix-tidl-demo-staticimg = "${MATRIX_APP_DIR}/tidl_demo_staticimg/*"
+FILES_matrix-tidl-demo-staticimg += "${bindir}/runTidlStaticImg.sh"
+
+FILES_matrix-tidl-demo-pnexamples = "${MATRIX_APP_DIR}/tidl_demo_pnexamples/*"
+FILES_matrix-tidl-demo-pnexamples += "${bindir}/runTidlPnExamples.sh"
+
+FILES_matrix-tidl-demo-livecam   = "${MATRIX_APP_DIR}/tidl_demo_livecam/*"
+FILES_matrix-tidl-demo-livecam   += "${bindir}/runTidlLiveCam.sh"
-- 
1.9.1


