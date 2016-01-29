Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 73F8D5296D
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 14:35:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TEZLUX014036
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 08:35:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TEZLlr026437
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 08:35:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 08:35:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TEZLtK011799;
	Fri, 29 Jan 2016 08:35:21 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPA8u-00015Y-VF; Fri, 29 Jan 2016 09:35:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 09:35:18 -0500
Message-ID: <1454078119-4150-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] matrix-gui-mc-demos: split each demo into individual packages
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
X-List-Received-Date: Fri, 29 Jan 2016 14:35:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-mc-demos_2.0.bb  | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
index 79c7202..8a74335 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
@@ -3,17 +3,26 @@ HOMEPAGE = "http://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
 S = "${WORKDIR}/git/mc_demo_apps"
 
 # Make sure demo submenu and app images has been installed.
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-mc-demo"
+MC_DEMOS_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-mc-demo"
 
-FILES_${PN} += "${MATRIX_BASE_DIR}/apps/ \
-		${bindir}/mc_demo_imageproc.sh \
-		${bindir}/mc_run_dsp.sh \
-		${bindir}/mc_demo_ipc.sh \
+PACKAGES = "matrix-mc-demo-ipc \
+            matrix-mc-demo-imageproc \
+"
+
+RDEPENDS_matrix-mc-demo-ipc        = "${MC_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-mc-demo-imageproc  = "${MC_DEMOS_RDEPENDS}"
+
+FILES_matrix-mc-demo-ipc        = "${MATRIX_APP_DIR}/mc_demo_ipc/*"
+FILES_matrix-mc-demo-imageproc  = "${MATRIX_APP_DIR}/mc_demo_imageproc/*"
+
+FILES_matrix-mc-demo-ipc       += "${bindir}/mc_demo_ipc.sh"
+FILES_matrix-mc-demo-imageproc += "${bindir}/mc_demo_imageproc.sh \
+                                   ${bindir}/mc_run_dsp.sh \
 "
-- 
1.9.1


