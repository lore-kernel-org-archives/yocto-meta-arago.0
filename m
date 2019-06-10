Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E8531529B1
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 23:50:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo5cZ033130
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560210605;
	bh=qBDE9nKAF+mE3Z2vjvlQhjyBcIAn20MUAFvaChtd7NM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CKGH5GoDc3xc9y16pzvpO1wC6T15uy7UvW9r7Ugb7Apsefl0G2UB2ErXxv8156xuT
	4WdZENBenIChgU1/w0/RAoRly2XRFF9Bg4IZsGoBPJ8Gl+oeGAGpzR9MlIHYfX68Om
	QW+ejJphz1qsLhEH23lvQk30pZOmN0V1qbZzrFv0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANo5nD115933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:05 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:50:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:50:05 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo4wk077708;
	Mon, 10 Jun 2019 18:50:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Jun 2019 23:37:47 +0000
Message-ID: <20190610233750.31009-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610233750.31009-1-denys@ti.com>
References: <20190610233750.31009-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 1/4] packagegroups, tisdk-makefile: de-scope some K3 features to AM65 for now
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
X-List-Received-Date: Mon, 10 Jun 2019 23:50:46 -0000
Content-Type: text/plain

J7 is a new platform in K3 family and support of some features is not ready yet:
* Graphics
* Multimedia
* IPC
* PRU-ICSS

Any SW component that implements above features or requires those as dependency
is being limited to AM65xx for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb | 2 +-
 .../packagegroup-arago-tisdk-addons-sdk-host.bb           | 4 ++--
 .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb      | 7 +++----
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb              | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-hmi.bb         | 2 +-
 .../packagegroup-arago-tisdk-matrix-sdk-host.bb           | 1 +
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb      | 5 ++++-
 .../packagegroup-arago-tisdk-multimedia-sdk-host.bb       | 2 +-
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb     | 2 +-
 .../packagegroup-arago-toolchain-tisdk-target.bb          | 2 ++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 8 ++++++--
 12 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 5b45597b..9c95670a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -62,7 +62,7 @@ ARAGO_TI_TEST_append_omap-a15 = " \
     ti-ipc-test \
     "
 
-ARAGO_TI_TEST_append_k3 = " \
+ARAGO_TI_TEST_append_am65xx = " \
     ti-ipc-test \
     "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 3b734554..19f2bcf4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -36,7 +36,7 @@ UTILS_append_k2g = " \
     pru-icss-src \
 "
 
-UTILS_append_k3 = " \
+UTILS_append_am65xx = " \
     pru-icss-src \
 "
 
@@ -100,7 +100,7 @@ EXTRA_PACKAGES_append_ti43x = " \
     pdm-anomaly-detection-src \
 "
 
-EXTRA_PACKAGES_append_k3 = " \
+EXTRA_PACKAGES_append_am65xx = " \
     pdm-anomaly-detection-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 8bce1756..375473c0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -172,7 +172,7 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
                                 ${ARMNN_PACKAGES} \
                                 pdm-anomaly-detection-dev \
 "
-EXTRA_PACKAGES_append_k3 = " arm-compute-library-dev \
+EXTRA_PACKAGES_append_am65xx = " arm-compute-library-dev \
                              ${ARMNN_PACKAGES} \
                              pdm-anomaly-detection-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6558a21a..2f903ff7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -72,11 +72,10 @@ UTILS_append_k3 = " mmc-utils \
                     can-utils \
                     parted \
                     switch-config \
-                    pru-icss \
-                    ti-ipc-rtos-fw \
                     irqbalance \
 "
 
+UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
 UTILS_append_dra7xx = " can-utils \
@@ -168,7 +167,7 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    pdm-anomaly-detection \
 "
 
-EXTRA_PACKAGES_append_k3 = " arm-compute-library \
+EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
                              ${ARMNN_PACKAGES} \
                              pdm-anomaly-detection \
 "
@@ -176,7 +175,7 @@ EXTRA_PACKAGES_append_k3 = " arm-compute-library \
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
-EXTRA_PACKAGES_append_k3 = " ti-ipc-examples-linux"
+EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
 
 EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 1399690b..1eb83d18 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -25,7 +25,7 @@ HMI_append_omap-a15 = " \
     mmwavegesture-hmi-src \
 "
 
-HMI_append_k3 = " \
+HMI_append_am65xx = " \
     evse-hmi-src \
     mmwavegesture-hmi-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index 74dbcd7b..10f6d306 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -26,7 +26,7 @@ HMI_append_omap-a15 = " \
     mmwavegesture-hmi \
 "
 
-HMI_append_k3 = " \
+HMI_append_am65xx = " \
     evse-hmi \
     mmwavegesture-hmi \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 11355fcc..fddc9297 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -13,6 +13,7 @@ MATRIX_GUI = " \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
+MATRIX_GUI_j7-evm = ""
 
 RDEPENDS_${PN} = "\
     matrix-gui-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 100d4070..8f34ec7b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -20,6 +20,7 @@ MATRIX_GUI = "               \
 
 MATRIX_GUI_keystone = ""
 MATRIX_GUI_omapl138 = ""
+MATRIX_GUI_j7-evm = ""
 
 MATRIX_COMMON_APPS = "              \
     matrix-gui-armbenchmarks-demos  \
@@ -45,6 +46,8 @@ MATRIX_TOUCH_APPS = " \
 
 MATRIX_QT_APPS_keystone = ""
 MATRIX_QT_APPS_omapl138 = ""
+MATRIX_QT_APPS_j7-evm = ""
+
 #MATRIX_QT_APPS_remove_k3 = "matrix-qt5-demo-browser"
 #MATRIX_QT_APPS_append_k3 = " \
 #    matrix-qt5-demo-webkit-browser \
@@ -165,7 +168,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-analytics-pdm-anomaly-detection \
 "
 
-MATRIX_APPS_append_k3 = "           \
+MATRIX_APPS_append_am65xx = "           \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h264dec  \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 9b6a81fb..2ab9dc7d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -16,7 +16,7 @@ MULTIMEDIA_append_ti43x = " \
 
 MULTIMEDIA_append_ti33x = " barcode-roi-src"
 
-MULTIMEDIA_append_k3 = " barcode-roi-src"
+MULTIMEDIA_append_am65xx = " barcode-roi-src"
 
 MULTIMEDIA_append_omap-a15 = " \
     dual-camera-demo-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index ae391247..50842ba5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -17,7 +17,7 @@ MULTIMEDIA_append_dra7xx = " \
 MULTIMEDIA_append_ti33x = " barcode-roi-dev"
 MULTIMEDIA_append_ti43x = " barcode-roi-dev"
 MULTIMEDIA_append_omap-a15 = " barcode-roi-dev"
-MULTIMEDIA_append_k3 = " barcode-roi-dev"
+MULTIMEDIA_append_am65xx = " barcode-roi-dev"
 
 MULTIMEDIA_append_keystone = " \
     hevc-arm-decoder-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index a3c9377c..7db6c67f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -11,6 +11,7 @@ QT_TOOLCHAIN_TARGET = "\
 "
 QT_TOOLCHAIN_TARGET_keystone = ""
 QT_TOOLCHAIN_TARGET_omapl138 = ""
+QT_TOOLCHAIN_TARGET_j7-evm = ""
 
 TISDK_TOOLCHAIN_BASE_TARGET = "\
     packagegroup-arago-standalone-sdk-target \
@@ -23,6 +24,7 @@ TISDK_TOOLCHAIN_EXTRA_TARGET = "\
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET_keystone = ""
 TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 = ""
+TISDK_TOOLCHAIN_EXTRA_TARGET_j7-evm = ""
 
 RDEPENDS_${PN} = "\
     ${QT_TOOLCHAIN_TARGET} \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e0d409a2..f289a56b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -63,6 +63,7 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 
 MAKEFILES_MATRIX_GUI_keystone = ""
 MAKEFILES_MATRIX_GUI_omapl138 = ""
+MAKEFILES_MATRIX_GUI_j7-evm = ""
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -179,12 +180,15 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         barcode-roi \
                         cryptodev \
                         ti-sgx-ddk-km-k3 \
-                        pru-icss \
                         sysfw-image \
 			mmwavegesture-hmi \
                         pdm-anomaly-detection \
 "
 
+MAKEFILES_append_am65xx = " \
+                        pru-icss \
+"
+
 # Use this to export kernel arch to ARCH
 #
 # We need to be very careful here. This class will also overwrite UBOOT_ARCH
@@ -214,7 +218,7 @@ PRU_ICSS_INSTALL_TARGET_ti33x = "pru-icss_install_am335x"
 PRU_ICSS_INSTALL_TARGET_ti43x = "pru-icss_install_am437x"
 PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
-PRU_ICSS_INSTALL_TARGET_k3 = "pru-icss_install_am65x"
+PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
 
 
 # If it's not defined at all, like for zImage case
-- 
2.17.1


