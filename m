Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E553B529CF
	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 19:47:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1PJl5Mk015275
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:47:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1PJl5jj032088
	for <meta-arago@arago-project.org>; Thu, 25 Feb 2016 13:47:05 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Feb 2016 13:47:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1PJl45D030425	for <meta-arago@arago-project.org>;
	Thu, 25 Feb 2016 13:47:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 25 Feb 2016 14:46:58 -0500
Message-ID: <1456429618-35160-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Enable Wayland/DRM-based graphics support on AM3
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
X-List-Received-Date: Thu, 25 Feb 2016 19:47:06 -0000
Content-Type: text/plain

- Retain "wayland" within DISTRO_FEATURES of AM3
- Replace "fbdev" with "egl" in weston plugin list
- Use the same set of 3D demos in Matrix Gui on AM3/4
- Enable kmscube on AM3

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                       |  5 ++++-
 .../conf/distro/include/branding-processor-sdk.inc             |  3 ---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb           | 10 +++++++++-
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb             |  6 +++++-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f4f499e..98efdfe 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -43,7 +43,10 @@ PACKAGECONFIG_pn-weston = "fbdev kms launch libinput"
 PACKAGECONFIG_append_pn-weston_omap-a15 = " egl"
 PACKAGECONFIG_remove_pn-weston_omap-a15 = "fbdev"
 PACKAGECONFIG_append_pn-weston_ti43x    = " egl"
-PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
+PACKAGECONFIG_remove_pn-weston_ti43x    = "fbdev"
+PACKAGECONFIG_append_pn-weston_ti33x    = " egl"
+PACKAGECONFIG_remove_pn-weston_ti33x    = "fbdev"
+
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 0c5e41c..bd51f76 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -1,8 +1,5 @@
 ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 
-# Remove wayland from ti33x DISTRO_FEATURES.
-DISTRO_FEATURES_remove_ti33x = "wayland"
-
 # Set CMEM reserved memory region
 CMEM_BASE_omap-a15 ?= "a0000000"
 CMEM_SIZE_omap-a15 ?= "08000000"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 75866d2..11ff899 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r50"
+PR = "r51"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -57,6 +57,14 @@ MATRIX_SGX_DEMOS_ti43x = " \
     matrix-3d-demo-kmscube \
 "
 
+MATRIX_SGX_DEMOS_ti33x = " \
+    matrix-3d-demo-chameleon \
+    matrix-3d-demo-coverflow \
+    matrix-3d-demo-navigation \
+    matrix-3d-demo-exampleui \
+    matrix-3d-demo-kmscube \
+"
+
 MATRIX_QT_APPS_keystone = ""
 
 MATRIX_APPS = ""
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 710bb75..f9d3f30 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 
 S = "${WORKDIR}/git/3d_apps"
 
@@ -37,6 +37,10 @@ PACKAGES_append_ti43x = " \
             matrix-3d-demo-kmscube \
 "
 
+PACKAGES_append_ti33x = " \
+            matrix-3d-demo-kmscube \
+"
+
 MATRIX_3D_DEMO_SGX_QAF_PARAM = "1000"
 
 do_install_prepend() {
-- 
1.9.1


