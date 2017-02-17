Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9251652A71
	for <meta-arago@arago-project.org>;
	Fri, 17 Feb 2017 06:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B1C0E209B9;
	Fri, 17 Feb 2017 06:07:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DWz6SpoJQaGl; Fri, 17 Feb 2017 06:07:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A9A8209A4;
	Fri, 17 Feb 2017 06:07:49 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F0534162374;
	Fri, 17 Feb 2017 01:07:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 17 Feb 2017 01:07:47 -0500
Message-Id: <1487311667-75519-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] Revert previous hacks that disabled cmem, mpm and all their dependencies
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
X-List-Received-Date: Fri, 17 Feb 2017 06:07:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 2af6eae8bda62b594a7b49d554c2f77789d614a7.
This reverts commit 0b5fc726b86fc574d5b27e2c49547c6bbe80d03c.
This reverts commit 6196fe44e57e24821914824949959d972d7525ab.
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 11 ++++-----
 .../packagegroup-arago-gst-sdk-target.bb           |  4 +++-
 .../packagegroups/packagegroup-arago-gst.bb        |  4 +++-
 .../packagegroup-arago-test-addons.bb              | 27 +++++++++-------------
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  8 +++----
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 26 ++++++++++-----------
 .../packagegroup-arago-tisdk-addons.bb             |  9 +++-----
 .../packagegroup-arago-tisdk-matrix.bb             | 17 ++++++++++++++
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  9 +++++++-
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  8 ++++++-
 10 files changed, 72 insertions(+), 51 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 99d8dda..75cb719 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r16"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -81,11 +81,6 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
-# Disable cmem (and deps) due to 4.9 kernel
-#    cmem
-#    cmem-mod
-#    multiprocmgr
-#    mpm-transport
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -96,7 +91,11 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     cuia \
     edma3-lld \
     srss-tc \
+    cmem \
+    cmem-mod \
     ti-ipc \
+    mpm-transport \
+    multiprocmgr \
     rm-lld \
     demo-image-proc \
     pa-lld \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 84e7244..739371f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,10 +16,12 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc-dev \
+    gstreamer1.0-plugins-dsp66-dev \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc-dev \
+    gstreamer1.0-plugins-dsp66-dev \
 "
 
 RDEPENDS_${PN} = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index d34051e..4fc0255 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -19,10 +19,12 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc \
+    gstreamer1.0-plugins-dsp66 \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc \
+    gstreamer1.0-plugins-dsp66 \
 "
 
 GSTREAMER_ACCEL_MM = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 82c2682..8bc9dec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r14"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,20 +15,17 @@ TEST_ADDONS = " \
 
 TEST_ADDONS_TI = ""
 
-# Disable cmem due to 4.9 kernel
-#    cmem-test
 TEST_ADDONS_TI_append_omap-a15 = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+    cmem-test \
     "
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr
-# Disable cmem (and deps) due to 4.9 kernel
-#    cmem-test
-#    mpm-transport-test
-#    multiprocmgr-test
-#    qmss-lld-test
 TEST_ADDONS_TI_append_keystone = " \
+    mpm-transport-test \
+    multiprocmgr-test \
+    qmss-lld-test \
     pa-lld-test \
     cppi-lld-test \
     edma3-lld-test \
@@ -38,6 +35,7 @@ TEST_ADDONS_TI_append_keystone = " \
     sa-lld-test \
     traceframework-test \
     udma-test \
+    cmem-test \
     "
 
 # The following are not yet ready for k2g-evm
@@ -49,11 +47,10 @@ TEST_ADDONS_TI_append_keystone = " \
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
-# Disable cmem and deps due to 4.9 kernel
-#    srio-lld-test
-#    ipc-transport-srio-test
-#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2hk-evm = " \
+    srio-lld-test \
+    ipc-transport-srio-test \
+    ipc-transport-qmss-test \
     hyplnk-lld-test \
     mmap-lld-test \
     aif2-lld-test \
@@ -64,26 +61,24 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
-# Disable cmem and deps due to 4.9 kernel
-#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
+    ipc-transport-qmss-test \
     "
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
-# Disable cmem and deps due to 4.9 kernel
-#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
+    ipc-transport-qmss-test \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 686cd90..50470d9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r30"
+PR = "r29"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -34,9 +34,8 @@ UTILS_append_ti43x = " \
 
 EXTRA_LIBS = ""
 
-# Disable cmem due to 4.9 kernel
-#    cmem-mod-src
 EXTRA_LIBS_append_omap-a15 = " \
+    cmem-mod-src \
     pru-icss-src \
 "
 
@@ -47,9 +46,8 @@ EXTRA_LIBS_append_dra7xx = " \
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr-mod-src
-# Disable cmem due to 4.9 kernel
-#    cmem-mod-src
 EXTRA_LIBS_append_keystone = " \
+    cmem-mod-src \
     uio-module-drv-src \
     hplib-mod-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index c2836c5..b2586d5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r35"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -33,17 +33,10 @@ TI_SECURE_STORAGE_DEV = "\
 #	ipsecmgr-staticdev
 #	libnl-xfrm-dev
 #	libnl-xfrm-staticdev
-# Disable cmem (and deps) due to 4.9 kernel breakage
-#	cmem-dev
-#	cmem-staticdev
-#	multiprocmgr-dev
-#	multiprocmgr-staticdev
-#	mpm-transport-dev
-#	mpm-transport-staticdev
-#	ipc-transport-qmss-dev
-#	ipc-transport-qmss-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
+	cmem-dev \
+	cmem-staticdev \
 	udma-dev \
 	udma-staticdev \
 	traceframework-dev \
@@ -67,10 +60,16 @@ EXTRA_LIBS_append_keystone = "\
 	libnl-staticdev \
 	ti-ipc-dev \
 	ti-ipc-staticdev \
+	multiprocmgr-dev \
+	multiprocmgr-staticdev \
+	mpm-transport-dev \
+	mpm-transport-staticdev \
 	edma3-lld-dev \
 	edma3-lld-staticdev \
 	lksctp-tools-dev \
 	lksctp-tools-staticdev \
+	ipc-transport-qmss-dev \
+	ipc-transport-qmss-staticdev \
 	"
 
 # Disable netapi due to libnl and xfrm conflict
@@ -90,12 +89,11 @@ EXTRA_LIBS_append_k2l-evm = "\
 # Disable netapi due to libnl and xfrm conflict
 #	netapi-dev
 #	netapi-staticdev
-# Disable cmem (and deps) due to 4.9 kernel breakage
-#	ipc-transport-srio-dev
-#	ipc-transport-srio-staticdev
 EXTRA_LIBS_append_k2hk-evm = "\
 	srio-lld-dev \
 	srio-lld-staticdev \
+	ipc-transport-srio-dev \
+	ipc-transport-srio-staticdev \
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
@@ -131,7 +129,7 @@ UTILS_append_dra7xx = " canutils-dev \
 UTILS_append_k2g = " canutils-dev"
 
 EXTRA_LIBS = ""
-#EXTRA_LIBS_append_omap-a15 = " cmem-dev"
+EXTRA_LIBS_append_omap-a15 = " cmem-dev"
 EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index eb65758..97184b1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r56"
+PR = "r55"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -86,16 +86,13 @@ UTILS_append_k2g = " \
 "
 
 EXTRA_LIBS = ""
-
-# Disable cmem due to 4.9 kernel
-#    cmem
 EXTRA_LIBS_append_omap-a15 = " \
+    cmem \
     uio-module-drv \
 "
 
-# Disable cmem due to 4.9 kernel
-#    cmem
 EXTRA_LIBS_append_keystone = " \
+    cmem \
     uio-module-drv \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 047cab3..21d8918 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -63,6 +63,18 @@ MATRIX_OPENCL_APPS_append_dra7xx = " \
     matrix-machinevision-demo-dlp3dscanner \
 "
 
+MATRIX_OPENCV_ARM_ONLY_APPS = " \
+     matrix-machinevision-demo-barcoderoi \
+"
+
+MATRIX_OPENCV_OPENCL_APPS = " \
+    matrix-machinevision-demo-barcoderoi-f2f \
+"
+
+MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
+     matrix-machinevision-demo-barcoderoi \
+"
+
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_ti33x = "        \
@@ -78,6 +90,8 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-pm-demos-governor    \
                                     \
     matrix-gui-ethernet-demos       \
+                                    \
+    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
 MATRIX_APPS_append_ti43x = "        \
@@ -93,6 +107,8 @@ MATRIX_APPS_append_ti43x = "        \
                                     \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
+                                    \
+    ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
 MATRIX_APPS_append_omap-a15 = "     \
@@ -129,4 +145,5 @@ RDEPENDS_${PN} = "        \
     ${MATRIX_APPS}        \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCL_APPS}",'',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','opencl',"${MATRIX_OPENCV_OPENCL_APPS}",'',d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 9bb62fc..cded1aa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related sources into the SDK"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,12 +11,19 @@ MULTIMEDIA = ""
 MULTIMEDIA_append_ti43x = " \
     dual-camera-demo-src \
     image-gallery-src \
+    barcode-roi-src \
 "
 
+MULTIMEDIA_append_ti33x = " barcode-roi-src"
+
+MULTIMEDIA_append_omap-a15 = " barcode-roi-src"
+
 MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-src', '', d)} \
 "
 
+MULTIMEDIA_append_keystone = " barcode-roi-src"
+
 #Demo doesn't work on 3.14
 # ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-demo-src image-gallery-src', d)}
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index e77f66d..3c72bf0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -14,6 +14,12 @@ MULTIMEDIA_append_dra7xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'opencl', 'qt-opencv-opencl-opengl-multithreaded-dev', '', d)} \
 "
 
+MULTIMEDIA_append_ti33x = " barcode-roi-dev"
+MULTIMEDIA_append_ti43x = " barcode-roi-dev"
+MULTIMEDIA_append_omap-a15 = " barcode-roi-dev"
+
+MULTIMEDIA_append_keystone = " barcode-roi-dev"
+
 RDEPENDS_${PN} = "\
     ${MULTIMEDIA} \
     packagegroup-arago-gst-sdk-target \
-- 
2.7.4


