Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4751652AAD
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CE56208B1;
	Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Xe6lxGK4VaxX; Mon, 13 Feb 2017 23:07:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45F9C20B53;
	Mon, 13 Feb 2017 23:07:23 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B41C6162373;
	Mon, 13 Feb 2017 18:07:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:07:16 -0500
Message-Id: <1487027238-101793-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487027238-101793-1-git-send-email-denys@ti.com>
References: <1487027238-101793-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 3/5] packagegroups: add omapl138 configs to regular packagegroups
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
X-List-Received-Date: Mon, 13 Feb 2017 23:07:28 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb      | 7 ++++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 4 ++++
 .../packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb      | 3 ++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb  | 4 +++-
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb           | 1 +
 .../packagegroups/packagegroup-arago-toolchain-tisdk-target.bb     | 1 +
 6 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index cd1afa2..686cd90 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -12,10 +12,11 @@ UTILS = " \
     oprofile-example-src \
 "
 
+# ti-pru-sw-edma-driver is currently broken
 # Add pru and profibus sources for omapl138 devices
-UTILS_append_am180x-evm = " \
-    ti-pru-sw-examples-src \
-"
+#UTILS_append_am180x-evm = " \
+#    ti-pru-sw-examples-src \
+#"
 
 UTILS_append_omap-a15 = " \
     omapconf-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6e9265f..eb65758 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -111,6 +111,10 @@ EXTRA_PACKAGES = " \
     protobuf \
 "
 
+EXTRA_PACKAGES_omapl138 = " \
+    protobuf \
+"
+
 RDEPENDS_${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 29872d0..295b164 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install Matrix v2 and associated applications sources in the SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,6 +12,7 @@ MATRIX_GUI = " \
 "
 
 MATRIX_GUI_keystone = ""
+MATRIX_GUI_omapl138 = ""
 
 RDEPENDS_${PN} = "\
     matrix-gui-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 848492c..02d617e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r62"
+PR = "r63"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -17,6 +17,7 @@ MATRIX_GUI = "               \
 "
 
 MATRIX_GUI_keystone = ""
+MATRIX_GUI_omapl138 = ""
 
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
@@ -38,6 +39,7 @@ MATRIX_TOUCH_APPS = " \
 "
 
 MATRIX_QT_APPS_keystone = ""
+MATRIX_QT_APPS_omapl138 = ""
 
 MATRIX_SGX_DEMOS = " \
     matrix-3d-demo-chameleon \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index bb344b0..67d8d47 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -11,6 +11,7 @@ MULTIMEDIA = " \
 "
 
 MULTIMEDIA_keystone = ""
+MULTIMEDIA_omapl138 = ""
 
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 5b4775b..157b1f3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -11,6 +11,7 @@ QT_TOOLCHAIN_TARGET = "\
 "
 
 QT_TOOLCHAIN_TARGET_keystone = ""
+QT_TOOLCHAIN_TARGET_omapl138 = ""
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-tisdk-multimedia-sdk-target \
-- 
2.7.4


