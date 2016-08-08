Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 636605209D
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 16:49:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78GnnRI024243
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:49:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78GnmJ0019341
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:49:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 11:49:47 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78Gnk6U011145;	Mon, 8 Aug 2016 11:49:47 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 12:49:42 -0400
Message-ID: <1470674983-6925-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470674983-6925-1-git-send-email-h-gou@ti.com>
References: <1470674983-6925-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] matrix-gui-machinevision-demos: add machine vision demo: DLP 3D scanner
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
X-List-Received-Date: Mon, 08 Aug 2016 16:49:49 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../matrix/matrix-gui-machinevision-demos_2.0.bb   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
new file mode 100644
index 0000000..4bd245d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Machine vision demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require recipes-core/matrix/matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.1"
+
+inherit allarch
+
+S = "${WORKDIR}/git/machinevision_apps"
+
+# Make sure machinevision submenu and app images has been installed
+MACHINEVISION_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-machinevision"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
+PACKAGES = "matrix-machinevision-demo-dlp3dscanner"
+
+RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
+    ${MACHINEVISION_RDEPENDS} \
+    point-cloud-viewer \
+"
+
+FILES_matrix-machinevision-demo-dlp3dscanner    = "${MATRIX_APP_DIR}/machinevision_dlp_3d_scanner/*"
+FILES_matrix-machinevision-demo-dlp3dscanner   += "${bindir}/runDlp3DScanner.sh"
-- 
1.9.1


