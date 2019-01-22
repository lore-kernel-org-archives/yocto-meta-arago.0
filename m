Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D506B529D5
	for <meta-arago@arago-project.org>;
	Tue, 22 Jan 2019 21:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 97B5740BCB;
	Tue, 22 Jan 2019 21:19:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dTGkfCXc6ukk; Tue, 22 Jan 2019 21:19:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3123940BD3;
	Tue, 22 Jan 2019 21:19:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5AFCB1699D3;
	Tue, 22 Jan 2019 16:19:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 16:19:14 -0500
Message-Id: <1548191956-2527-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/3] packagegroups: isolate armnn packages into a var for conditional inclusion
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
X-List-Received-Date: Tue, 22 Jan 2019 21:19:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb     | 12 +++++++-----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 12 +++++++-----
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb  | 19 ++++++++++---------
 3 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b347880..77ddbe1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r40"
+PR = "r41"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -153,21 +153,23 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
+ARMNN_PACKAGES = "armnn-dev"
+
 EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
                                 arm-compute-library-dev \
-                                armnn-dev \
+                                ${ARMNN_PACKAGES} \
 "
 EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
                                 arm-compute-library-dev \
-                                armnn-dev \
+                                ${ARMNN_PACKAGES} \
 "
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
                                 arm-compute-library-dev \
-                                armnn-dev \
+                                ${ARMNN_PACKAGES} \
 "
 EXTRA_PACKAGES_append_k3 = " arm-compute-library-dev \
-                             armnn-dev \
+                             ${ARMNN_PACKAGES} \
 "
 
 IPCDEV = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index e394846..11e41f7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r71"
+PR = "r72"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -144,25 +144,27 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
+ARMNN_PACKAGES = "armnn"
+
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
-                                armnn \
+                                ${ARMNN_PACKAGES} \
 "
 
 EXTRA_PACKAGES_append_ti43x = " voxelsdk \
                                 arm-compute-library \
-                                armnn \
+                                ${ARMNN_PACKAGES} \
 "
 
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    big-data-ipc-demo-linux \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
-                                   armnn \
+                                   ${ARMNN_PACKAGES} \
 "
 
 EXTRA_PACKAGES_append_k3 = " arm-compute-library \
-                             armnn \
+                             ${ARMNN_PACKAGES} \
 "
 
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 5ddaa9f..530f70c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r76"
+PR = "r77"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -86,6 +86,11 @@ MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
      matrix-machinevision-demo-simplepeopletracking \
 "
 
+MATRIX_ARMNN_APPS = " \
+    matrix-armnn-demo-staticimg     \
+    matrix-armnn-demo-livecam       \
+"
+
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_ti33x = "        \
@@ -107,8 +112,7 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
-    matrix-armnn-demo-staticimg     \
-    matrix-armnn-demo-livecam       \
+    ${MATRIX_ARMNN_APPS}            \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -130,8 +134,7 @@ MATRIX_APPS_append_ti43x = "        \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
-    matrix-armnn-demo-staticimg     \
-    matrix-armnn-demo-livecam       \
+    ${MATRIX_ARMNN_APPS}            \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -152,8 +155,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-pm-demos-governor    \
     ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
                                 \
-    matrix-armnn-demo-staticimg \
-    matrix-armnn-demo-livecam   \
+    ${MATRIX_ARMNN_APPS}            \
 "
 
 MATRIX_APPS_append_k3 = "           \
@@ -167,8 +169,7 @@ MATRIX_APPS_append_k3 = "           \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
-    matrix-armnn-demo-staticimg     \
-    matrix-armnn-demo-livecam       \
+    ${MATRIX_ARMNN_APPS}            \
 "
 
 MATRIX_APPS_append_dra7xx += " \
-- 
2.7.4


