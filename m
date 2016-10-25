Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5A3B2529E8
	for <meta-arago@arago-project.org>;
	Tue, 25 Oct 2016 00:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1CA5B20911;
	Tue, 25 Oct 2016 00:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id e7aauyhaN549; Tue, 25 Oct 2016 00:44:39 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EAE47204AF;
	Tue, 25 Oct 2016 00:44:37 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 11BC6162175;
	Mon, 24 Oct 2016 20:44:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Oct 2016 20:44:36 -0400
Message-Id: <1477356276-3950-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipes: introduce k2g SOC family
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
X-List-Received-Date: Tue, 25 Oct 2016 00:44:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb   | 5 +----
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc  | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb   | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      | 2 +-
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb  | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb            | 8 ++++----
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb                    | 8 ++++----
 8 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 009d6bc..f313494 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -1,10 +1,7 @@
 require arago-core-tisdk-image.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
-DEPLOY_SPL_NAME_k2hk-evm = ""
-DEPLOY_SPL_NAME_k2l-evm = ""
-DEPLOY_SPL_NAME_k2g-evm = ""
-DEPLOY_SPL_NAME_k2e = ""
+DEPLOY_SPL_NAME_keystone = ""
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 17d796a..1115321 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -27,7 +27,7 @@ DTB_FILTER_ti43x = "am43"
 DTB_FILTER_k2hk-evm = "k2hk"
 DTB_FILTER_k2l-evm = "k2l"
 DTB_FILTER_k2e = "k2e"
-DTB_FILTER_k2g-evm = "k2g"
+DTB_FILTER_k2g = "k2g"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 005cb5b..b31d729 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -122,7 +122,7 @@ UTILS_append_dra7xx = " canutils-dev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
-UTILS_append_k2g-evm = " canutils-dev"
+UTILS_append_k2g = " canutils-dev"
 
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " cmem-dev"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index ccfad61..8bfcb82 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -80,7 +80,7 @@ UTILS_append_k2e = " \
     dsptop \
 "
 
-UTILS_append_k2g-evm = " \
+UTILS_append_k2g = " \
     canutils \
     pru-icss \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index b6a8201..202078c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -184,7 +184,7 @@ KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-os
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
-KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
+KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
 DEFCONFIG = "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 129bec1..6283283 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SDCARD_SCRIPT = " create-sdcard.sh"
 SDCARD_SCRIPT_keystone = ""
-SDCARD_SCRIPT_k2g-evm = " create-sdcard.sh"
+SDCARD_SCRIPT_k2g = " create-sdcard.sh"
 
 SETUP_SCRIPTS = " common.sh \
                   setup-host-check.sh \
@@ -36,7 +36,7 @@ UBOOT_ENV_ti43x = "setup-uboot-env-am43x.sh"
 UBOOT_ENV_omap5-evm = "setup-uboot-env-omap5.sh"
 UBOOT_ENV_am57xx-evm = "setup-uboot-env-am57xx-evm.sh"
 UBOOT_ENV_keystone = "setup-uboot-env-keystone.sh"
-UBOOT_ENV_k2g-evm = "setup-uboot-env-k2g-evm.sh"
+UBOOT_ENV_k2g = "setup-uboot-env-k2g-evm.sh"
 UBOOT_ENV = "setup-uboot-unknown.sh"
 
 do_install () {
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 25a39f8..8fc1e81 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -46,13 +46,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
 S_dra7xx = "${WORKDIR}/git/monitor_vayu"
-S_k2g-evm = "${WORKDIR}/git/monitor_vayu"
+S_k2g = "${WORKDIR}/git/monitor_vayu"
 
 BUILD_TARGET_k2hk-evm = "ARM_K2H"
 BUILD_TARGET_k2l-evm  = "ARM_K2L"
-BUILD_TARGET_k2e  = "ARM_K2E"
-BUILD_TARGET_dra7xx   = "ARM_AM57"
-BUILD_TARGET_k2g-evm  = "ARM_K2G"
+BUILD_TARGET_k2e = "ARM_K2E"
+BUILD_TARGET_dra7xx = "ARM_AM57"
+BUILD_TARGET_k2g = "ARM_K2G"
 
 EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
                    -DOCL_MONITOR_DIR=${S} \
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 4500ad5..9676687 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -32,7 +32,7 @@ DEPENDS = " ocl-gl-headers \
 
 DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
-DEPENDS_remove_k2g-evm  = " libulm"
+DEPENDS_remove_k2g = " libulm"
 
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
 RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
@@ -47,11 +47,11 @@ export WANT_LLVM_RELEASE = "3.6-ti"
 OCL_BUILD_TARGET_dra7xx   = "ARM_AM57"
 OCL_BUILD_TARGET_k2hk-evm = "ARM_K2H"
 OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
-OCL_BUILD_TARGET_k2e  = "ARM_K2E"
-OCL_BUILD_TARGET_k2g-evm  = "ARM_K2G"
+OCL_BUILD_TARGET_k2e = "ARM_K2E"
+OCL_BUILD_TARGET_k2g = "ARM_K2G"
 
 ENABLE_ULM = "1"
-ENABLE_ULM_k2g-evm = "0"
+ENABLE_ULM_k2g = "0"
 
 EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=${ENABLE_ULM} -DOCL_VERSION=${PV}"
 
-- 
2.7.4


