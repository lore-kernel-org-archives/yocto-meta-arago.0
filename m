Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5FFEB52A2B
	for <meta-arago@arago-project.org>;
	Fri, 27 Jul 2018 16:09:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6RG951K129577
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532707745;
	bh=hX1nz9LEhFLXOS8O7U8KV/TEzi2tkmE7l0mnANpy9Xc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bH5wORUso3CWa8PUX4x3fNaCVj8RuKyq8+noYuaF+QKeoUc80NxXD6ojXh9cH/Ywf
	GbyhnLsRZjboVpUKW7luQM/JIRcgkOGXs8UQuG1ty+V0YtsOgba1PfBOcnIwcBI2He
	ELTYb/xv/2RHJVJuhE2SgCqttEaKWr969Wtp5q7M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG95eE012098
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:05 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 27 Jul 2018 11:09:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 27 Jul 2018 11:09:05 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG94Kp017026
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:04 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jul 2018 12:08:58 -0400
Message-ID: <1532707738-28510-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
References: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 4/4] packagegroup-arago: enable graphics for k3 devices
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
X-List-Received-Date: Fri, 27 Jul 2018 16:09:13 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             | 22 +++++++++++++++++++---
 .../packagegroup-arago-tisdk-multimedia.bb         |  3 +--
 .../packagegroup-arago-toolchain-tisdk-target.bb   |  4 +---
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 3d661a5..737397d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r70"
+PR = "r71"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -20,7 +20,6 @@ MATRIX_GUI = "               \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
-MATRIX_GUI_k3 = ""
 
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
@@ -43,7 +42,6 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
-MATRIX_QT_APPS_k3 = ""
 
 MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
@@ -142,6 +140,24 @@ MATRIX_APPS_append_omap-a15 = "     \
     ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
 "
 
+MATRIX_APPS_append_k3 = "           \
+    matrix-multimedia-demo-aac      \
+    matrix-multimedia-demo-audiocapture \
+    matrix-multimedia-demo-h264dec  \
+    matrix-multimedia-demo-h265dec  \
+    matrix-multimedia-demo-mpeg4aacdec \
+    matrix-multimedia-demo-mpeg4dec \
+                                    \
+    matrix-gui-generic-pm           \
+    matrix-gui-clocks               \
+    matrix-gui-pm-demos-governor    \
+                                    \
+    matrix-hmi-demo-evse            \
+                                    \
+    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
+    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
+"
+
 MATRIX_APPS_append_dra7xx += " \
     matrix-multimedia-demo-dsp66imgproc \
     matrix-tidl-demo-staticimg \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 265abe7..361dc6c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,7 +11,6 @@ MULTIMEDIA = " \
 "
 
 MULTIMEDIA_omapl138 = ""
-MULTIMEDIA_k3 = ""
 MULTIMEDIA_append_keystone = " \
     hevc-arm-decoder \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 2851302..52e3456 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,7 +11,6 @@ QT_TOOLCHAIN_TARGET = "\
 "
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
-QT_TOOLCHAIN_TARGET_k3 = ""
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
@@ -24,7 +23,6 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET_keystone = ""
 TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
-TISDK_TOOLCHAIN_EXTRA_TARGET_k3 = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
-- 
1.9.1


