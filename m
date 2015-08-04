Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E358152A08
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 15:08:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74F85ip003311
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 10:08:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74F85f0030806
	for <meta-arago@arago-project.org>; Tue, 4 Aug 2015 10:08:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 10:08:05 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74F85DA027257;
	Tue, 4 Aug 2015 10:08:05 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZMdoz-0008KA-Dj; Tue, 04 Aug 2015 11:08:05 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Aug 2015 11:07:53 -0400
Message-ID: <1438700873-31955-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438700873-31955-1-git-send-email-j-stiffler@ti.com>
References: <1438700873-31955-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] matrix-gui-3d-demos: Extend for omap-a15 SOC
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
X-List-Received-Date: Tue, 04 Aug 2015 15:08:07 -0000
Content-Type: text/plain

* Add new demos for omap-a15
* For omap-a15, 3D demos are available though the "img-pvr-sdk"
  package instead of the "libgles-omap3-rawdemos" package, so RDEPENDS
  on it for omap-a15.
* For omap-a15 devices, demos run for a short duration for same
  configuration, so increase 'qaf' parameter for a more reasonable
  duration

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index b87b925..649c673 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 S = "${WORKDIR}/git/3d_apps"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 # Make sure 3D submenu has been installed and app images has been installed
 
 # TODO: in the future we may want to consider putting this into the libgles
@@ -22,9 +24,27 @@ PACKAGES = "matrix-3d-demo-chameleon \
             matrix-3d-demo-skull     \
             matrix-3d-demo-shaders   \
             matrix-3d-demo-vase      \
+            matrix-3d-demo-navigation   \
+            matrix-3d-demo-exampleui    \
+"
+
+PACKAGES_append_omap-a15 = " \
+            matrix-3d-demo-kmscube      \
+            matrix-3d-demo-kmscubevideo \
 "
 
-3D_DEMOS_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
+MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
+MATRIX_3D_DEMO_SGX_QAF_PARAM_omap-a15 = "8000"
+
+do_install_prepend() {
+    find ${S} -name '*.desktop' -exec sed -i {} \
+        -e "s|-qaf=[0-9]*|-qaf=${MATRIX_3D_DEMO_SGX_QAF_PARAM}|g" \;
+}
+
+3D_DEMOS_RDEPENDS_MATRIX = "matrix-gui-apps-images matrix-gui-submenus-3d"
+3D_DEMOS_RDEPENDS = "${3D_DEMOS_RDEPENDS_MATRIX} libgles-omap3-rawdemos"
+3D_DEMOS_RDEPENDS_omap-a15 = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+
 
 RDEPENDS_matrix-3d-demo-chameleon = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-coverflow = "${3D_DEMOS_RDEPENDS}"
@@ -33,6 +53,10 @@ RDEPENDS_matrix-3d-demo-lantern   = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-skull     = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-shaders   = "${3D_DEMOS_RDEPENDS}"
 RDEPENDS_matrix-3d-demo-vase      = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-navigation    = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-exampleui     = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-kmscube       = "${3D_DEMOS_RDEPENDS_MATRIX} kmscube"
+RDEPENDS_matrix-3d-demo-kmscubevideo  = "${3D_DEMOS_RDEPENDS_MATRIX} omapdrmtest"
 
 # Split the matrix files by 3d demos
 FILES_matrix-3d-demo-chameleon = "${MATRIX_APP_DIR}/3d_chameleon/*"
@@ -42,6 +66,10 @@ FILES_matrix-3d-demo-lantern   = "${MATRIX_APP_DIR}/3d_lantern/*"
 FILES_matrix-3d-demo-skull     = "${MATRIX_APP_DIR}/3d_skull/*"
 FILES_matrix-3d-demo-shaders   = "${MATRIX_APP_DIR}/3d_shaders/*"
 FILES_matrix-3d-demo-vase      = "${MATRIX_APP_DIR}/3d_vase/*"
+FILES_matrix-3d-demo-navigation       = "${MATRIX_APP_DIR}/3d_navigation/*"
+FILES_matrix-3d-demo-exampleui        = "${MATRIX_APP_DIR}/3d_exampleui/*"
+FILES_matrix-3d-demo-kmscube          = "${MATRIX_APP_DIR}/3d_kmscube/*"
+FILES_matrix-3d-demo-kmscubevideo     = "${MATRIX_APP_DIR}/3d_kmscubevideo/*"
 
 # Split the ${bindir} files by 3d demos
 FILES_matrix-3d-demo-chameleon += "${bindir}/runOGLES2ChameleonMan.sh"
@@ -51,3 +79,5 @@ FILES_matrix-3d-demo-lantern   += "${bindir}/runOGLES2MagicLantern.sh"
 FILES_matrix-3d-demo-skull     += "${bindir}/runOGLESEvilSkull.sh"
 FILES_matrix-3d-demo-shaders   += "${bindir}/runOGLES2Shaders.sh"
 FILES_matrix-3d-demo-vase      += "${bindir}/runOGLESVase.sh"
+FILES_matrix-3d-demo-navigation      += "${bindir}/runOGLES2Navigation.sh"
+FILES_matrix-3d-demo-exampleui       += "${bindir}/runOGLES2ExampleUI.sh"
-- 
1.9.1


