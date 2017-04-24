Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E46E352A4E
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 22:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3979B20B85;
	Mon, 24 Apr 2017 22:04:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HV4YR7DNav9F; Mon, 24 Apr 2017 22:04:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A1B320174;
	Mon, 24 Apr 2017 22:04:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A9686162473;
	Mon, 24 Apr 2017 18:04:14 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 24 Apr 2017 18:04:13 -0400
Message-Id: <1493071453-20761-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] recipes: introduce k2hk SOC family
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
X-List-Received-Date: Mon, 24 Apr 2017 22:04:21 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb       | 2 +-
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc      | 2 +-
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb      | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb       | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb     | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 meta-arago-extras/recipes-ti/libarch/libarch.inc                      | 4 ++--
 meta-arago-extras/recipes-ti/linalg/linalg.inc                        | 2 +-
 meta-arago-extras/recipes-ti/linalg/linalg_git.bb                     | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb                | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb                        | 2 +-
 16 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 7dfaac1..41b8d68 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -1,7 +1,7 @@
 require arago-core-tisdk-image.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
-DEPLOY_SPL_NAME_k2hk-evm = ""
+DEPLOY_SPL_NAME_k2hk = ""
 DEPLOY_SPL_NAME_k2l-evm = ""
 DEPLOY_SPL_NAME_k2e = ""
 
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 71041f8..c6afdbe 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -24,7 +24,7 @@ DTB_FILTER_dra7xx-evm = "dra7"
 DTB_FILTER_am57xx-evm = "am57xx"
 DTB_FILTER_am57xx-hs-evm = "${DTB_FILTER_am57xx-evm}"
 DTB_FILTER_ti43x = "am43"
-DTB_FILTER_k2hk-evm = "k2hk"
+DTB_FILTER_k2hk = "k2hk"
 DTB_FILTER_k2l-evm = "k2l"
 DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g = "k2g"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index bc9a796..784c5b4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -130,7 +130,7 @@ ARAGO_TI_PKGS_append_k2l-evm = "\
 # Disable netapi due to libnl and xfrm conflict
 #    netapi
 #    netapi-test
-ARAGO_TI_PKGS_append_k2hk-evm = "\
+ARAGO_TI_PKGS_append_k2hk = "\
     srio-lld \
     mmap-lld \
     hyplnk-lld \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 8bc9dec..b441400 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -47,7 +47,7 @@ TEST_ADDONS_TI_append_keystone = " \
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
-TEST_ADDONS_TI_append_k2hk-evm = " \
+TEST_ADDONS_TI_append_k2hk = " \
     srio-lld-test \
     ipc-transport-srio-test \
     ipc-transport-qmss-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index e4211d7..ab3be3d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -52,7 +52,7 @@ EXTRA_LIBS_append_keystone = " \
     hplib-mod-src \
 "
 
-EXTRA_LIBS_append_k2hk-evm = " \
+EXTRA_LIBS_append_k2hk = " \
     debugss-module-drv-src \
     gdbserverproxy-module-drv-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 46cff98..708016e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -89,7 +89,7 @@ EXTRA_LIBS_append_k2l-evm = "\
 # Disable netapi due to libnl and xfrm conflict
 #	netapi-dev
 #	netapi-staticdev
-EXTRA_LIBS_append_k2hk-evm = "\
+EXTRA_LIBS_append_k2hk = "\
 	srio-lld-dev \
 	srio-lld-staticdev \
 	ipc-transport-srio-dev \
@@ -134,7 +134,7 @@ EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
 "
-EXTRA_LIBS_append_k2hk-evm = " libulm-staticdev \
+EXTRA_LIBS_append_k2hk = " libulm-staticdev \
                                gdbserver-c6x-dev \
 "
 EXTRA_LIBS_append_k2l-evm = " libulm-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index cf4a9ee..5ad6655 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -68,7 +68,7 @@ UTILS_append_keystone = " \
     ti-ipc-rtos-fw \
 "
 
-UTILS_append_k2hk-evm = " \
+UTILS_append_k2hk = " \
     gdbc6x \
     dsptop \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
index 0e0e112..321af12 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
@@ -11,7 +11,7 @@ UTILS = " \
     openmpacc-examples-src \
 "
 
-UTILS_append_k2hk-evm = " \
+UTILS_append_k2hk = " \
     linalg-examples-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
index ea0f724..b103315 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
@@ -12,7 +12,7 @@ UTILS = " \
     python-pyopencl-dev \
 "
 
-UTILS_append_k2hk-evm = " \
+UTILS_append_k2hk = " \
     linalg-dev \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index e882e2a..b96f62d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -19,7 +19,7 @@ EXTRA_PKGS = " \
     python-pyopencl \
 "
 
-EXTRA_PKGS_append_k2hk-evm = " \
+EXTRA_PKGS_append_k2hk = " \
     linalg-examples \
 "
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a2dec74..57f37ac 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -138,7 +138,7 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               barcode-roi \
 "
 
-MAKEFILES_append_k2hk-evm = " opencl-examples \
+MAKEFILES_append_k2hk = " opencl-examples \
                               gdbserverproxy-module-drv \
                               debugss-module-drv \
                               openmpacc-examples \
@@ -190,7 +190,7 @@ KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bone
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am572x-idk-pru-excl-uio.dtb', '', d)}"
-KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2hk = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
index e196fa0..5575f95 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.html;md5=b
 SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
 SRCREV = "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
 
-COMPATIBLE_MACHINE = "k2hk-evm|dra7xx"
+COMPATIBLE_MACHINE = "k2hk|dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
@@ -29,4 +29,4 @@ export FC_DIR = "${FC_INSTALL_DIR}"
 export PDK_DIR = "${PDK_INSTALL_DIR}"
 
 TARGET_dra7xx = "SOC_AM572x"
-TARGET_k2hk-evm   = "SOC_K2H"
+TARGET_k2hk   = "SOC_K2H"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 2a0eae3..c60387e 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30
 PV = "1_2_0_0"
 INC_PR = "r7"
 
-COMPATIBLE_MACHINE = "k2hk-evm|dra7xx"
+COMPATIBLE_MACHINE = "k2hk|dra7xx"
 
 require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
index d250fce..b84c461 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "TI Linear Algebra Library"
 include linalg.inc
 PR = "${INC_PR}.0"
 
-TARGET_k2hk-evm      = "SOC_K2H"
+TARGET_k2hk      = "SOC_K2H"
 TARGET_dra7xx        = "SOC_AM572x"
-MEM_MODEL_k2hk-evm   = "Large"
+MEM_MODEL_k2hk   = "Large"
 MEM_MODEL_dra7xx     = "Small"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index c0a8a6c..35bd993 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -23,7 +23,7 @@ DEPENDS = " ti-llvm3.6-native \
             openmp-rtos \
 "
 
-DEPENDS_append_k2hk-evm = " multiprocmgr-rtos \
+DEPENDS_append_k2hk = " multiprocmgr-rtos \
                             qmss-lld-rtos \
                             cppi-lld-rtos \
                             rm-lld-rtos \
@@ -46,7 +46,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
 
-BUILD_TARGET_k2hk-evm = "ARM_K2H"
+BUILD_TARGET_k2hk = "ARM_K2H"
 BUILD_TARGET_k2l-evm  = "ARM_K2L"
 BUILD_TARGET_k2e = "ARM_K2E"
 BUILD_TARGET_dra7xx = "ARM_AM57"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 059be38..906cad3 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -44,7 +44,7 @@ S = "${WORKDIR}/git/host"
 export WANT_LLVM_RELEASE = "3.6-ti"
 
 OCL_BUILD_TARGET_dra7xx   = "ARM_AM57"
-OCL_BUILD_TARGET_k2hk-evm = "ARM_K2H"
+OCL_BUILD_TARGET_k2hk = "ARM_K2H"
 OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
 OCL_BUILD_TARGET_k2e = "ARM_K2E"
 OCL_BUILD_TARGET_k2g = "ARM_K2G"
-- 
2.7.4


