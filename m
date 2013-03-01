Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id F07FE52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:10:59 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id h1so4993870oag.3
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cWHgk27leB9r4CZ75au7gQG0vvR3EeHaD//laUsi35w=;
	b=XP8Dy41pT+W+tsZ4HaWH6Dbs20MAYTIweDjgdmC2eCLFH4mjMd0rjF8XtOiyGS5uM/
	PVhN2mFyOKpVn9aahlvuCfOlAI+5ppybKQZ1uHjWXgdFQkxn3Falg821K9EplVJ+1181
	Bj0c7FteNd5bihsihn8rz47hL4WhUenJotasdV6wi8S/B94yhd+8phEgr4uMq4SMJJuj
	WutuOZ2p0F0VWj9UE0UqBbW3y+78tLCSaQxnIm2u18LjQTctyKEbRHpb/pYb4aEnyHPp
	6jyu9V3X7QIhDfD28dZnnEg3Al7ymLq0USnMKz0gCuVcQ2jgtO8/qY50PsCi8pNv2mtK
	pxEw==
X-Received: by 10.182.23.101 with SMTP id l5mr7466485obf.16.1362107459583;
	Thu, 28 Feb 2013 19:10:59 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.10.57
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:10:58 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:40 -0600
Message-Id: <1362107447-11234-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362107447-11234-1-git-send-email-fcooper@ti.com>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/9] matrix-gui-3d-demos: Split out Graphics demos
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
X-List-Received-Date: Fri, 01 Mar 2013 03:11:00 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Create separate packages to allow each demo to be pulled in individually.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |   12 ++++-
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb |   40 ++++++++++++++++++-
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 2093178..2e0a753 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 inherit packagegroup
 
@@ -31,18 +31,24 @@ MATRIX_QT_APPS = "                  \
     ${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','matrix-gui-apps-quick-playground','', d)} \
 "
 
+MATRIX_SGX_DEMOS = "                \
+    matrix-3d-demo-chameleon        \
+    matrix-3d-demo-film             \
+    matrix-3d-demo-lantern          \
+    matrix-3d-demo-skull            \
+"
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_omap3 = "        \
-    ${@base_contains('MACHINE_FEATURES','sgx','matrix-gui-3d-demos','',d)} \
+    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
     matrix-gui-multimedia-demos     \
 "
 
 MATRIX_APPS_append_ti33x = "        \
     matrix-gui-ethernet-demos       \
-    ${@base_contains('MACHINE_FEATURES','sgx','matrix-gui-3d-demos','',d)} \
+    ${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}','',d)} \
     matrix-gui-multimedia-demos     \
                                     \
     matrix-gui-clocks-275mhz        \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index d40e0d6..e1c3023 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -15,6 +15,40 @@ S = "${WORKDIR}/git/3d_apps"
 #       to the matrix-gui-submenus-3d dependency.  So if matrix v2 moves
 #       into the same layer as libgles this may be acceptable, or perhaps
 #       we can use an RRECOMMENDS instead.
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
 
-FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+PACKAGES = "matrix-3d-demo-chameleon \
+            matrix-3d-demo-coverflow \
+            matrix-3d-demo-film      \
+            matrix-3d-demo-lantern   \
+            matrix-3d-demo-skull     \
+            matrix-3d-demo-shaders   \
+            matrix-3d-demo-vase      \
+"
+
+3D_DEMOS_RDEPENDS = "matrix-gui-apps-images matrix-gui-submenus-3d libgles-omap3-rawdemos"
+
+RDEPENDS_matrix-3d-demo-chameleon = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-coverflow = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-film      = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-lantern   = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-skull     = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-shaders   = "${3D_DEMOS_RDEPENDS}"
+RDEPENDS_matrix-3d-demo-vase      = "${3D_DEMOS_RDEPENDS}"
+
+# Split the matrix files by 3d demos
+FILES_matrix-3d-demo-chameleon = "${MATRIX_APP_DIR}/3d_chameleon/*"
+FILES_matrix-3d-demo-coverflow = "${MATRIX_APP_DIR}/3d_coverflow/*"
+FILES_matrix-3d-demo-film      = "${MATRIX_APP_DIR}/3d_film/*"
+FILES_matrix-3d-demo-lantern   = "${MATRIX_APP_DIR}/3d_lantern/*"
+FILES_matrix-3d-demo-skull     = "${MATRIX_APP_DIR}/3d_skull/*"
+FILES_matrix-3d-demo-shaders   = "${MATRIX_APP_DIR}/3d_shaders/*"
+FILES_matrix-3d-demo-vase      = "${MATRIX_APP_DIR}/3d_vase/*"
+
+# Split the ${bindir} files by 3d demos
+FILES_matrix-3d-demo-chameleon += "${bindir}/runOGLES2ChameleonMan.sh"
+FILES_matrix-3d-demo-coverflow += "${bindir}/runOGLES2Coverflow.sh"
+FILES_matrix-3d-demo-film      += "${bindir}/runOGLESFilmTV.sh"
+FILES_matrix-3d-demo-lantern   += "${bindir}/runOGLES2MagicLantern.sh"
+FILES_matrix-3d-demo-skull     += "${bindir}/runOGLESEvilSkull.sh"
+FILES_matrix-3d-demo-shaders   += "${bindir}/runOGLES2Shaders.sh"
+FILES_matrix-3d-demo-vase      += "${bindir}/runOGLESVase.sh"
-- 
1.7.0.4


