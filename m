Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 104D452986
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 19:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E6B4820BB9;
	Fri, 20 Apr 2018 19:23:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Sks3NwOfTWy8; Fri, 20 Apr 2018 19:23:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B54B92079D;
	Fri, 20 Apr 2018 19:23:33 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6E59F1633B1;
	Fri, 20 Apr 2018 15:23:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 20 Apr 2018 15:23:32 -0400
Message-Id: <1524252212-462-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] conf, recipes: introduce k2l family and add support for k2l-hs-evm
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
X-List-Received-Date: Fri, 20 Apr 2018 19:23:44 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                            | 4 ++++
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb     | 2 +-
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc    | 2 +-
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb     | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb    | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 2 +-
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 2 +-
 meta-arago-extras/recipes-ti/netapi/netapi.inc                      | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb              | 6 +++---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb                      | 4 ++--
 13 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6dc98a9..1ed0c1f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -70,6 +70,10 @@ KERNEL_IMAGETYPES_k2g-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2g-hs-evm = "arago-base-tisdk-image"
 INITRAMFS_FSTYPES_k2g-hs-evm = "cpio.xz"
 
+KERNEL_IMAGETYPES_k2l-hs-evm = "zImage fitImage"
+INITRAMFS_IMAGE_k2l-hs-evm = "arago-base-tisdk-image"
+INITRAMFS_FSTYPES_k2l-hs-evm = "cpio.xz"
+
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index d361c3d..fcf843a 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -2,7 +2,7 @@ require arago-core-tisdk-image.inc
 
 DEPLOY_SPL_NAME_omapl138 = ""
 DEPLOY_SPL_NAME_k2hk = ""
-DEPLOY_SPL_NAME_k2l-evm = ""
+DEPLOY_SPL_NAME_k2l = ""
 DEPLOY_SPL_NAME_k2e = ""
 # Only unset it for HS device, as k2g GP does provide MLO/SPL
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 673a56d..08e101d 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -24,7 +24,7 @@ DTB_FILTER_am57xx-evm = "am57xx"
 DTB_FILTER_am57xx-hs-evm = "${DTB_FILTER_am57xx-evm}"
 DTB_FILTER_ti43x = "am43"
 DTB_FILTER_k2hk = "k2hk"
-DTB_FILTER_k2l-evm = "k2l"
+DTB_FILTER_k2l = "k2l"
 DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g = "k2g"
 DTB_FILTER_omapl138 = "da850"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index c5dfc99..343fd2a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -124,7 +124,7 @@ ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
 # Disable hplib,nwal-lld as hplib-mod is broken against K4.14
 #    hplib
 #    nwal-lld
-ARAGO_TI_PKGS_append_k2l-evm = "\
+ARAGO_TI_PKGS_append_k2l = "\
     dfe-lld \
     iqn2-lld \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 075e470..53954f7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -70,7 +70,7 @@ TEST_ADDONS_TI_append_k2hk = " \
 #    hplib-test
 #    nwal-lld-test
 #    nwal-lld
-TEST_ADDONS_TI_append_k2l-evm = " \
+TEST_ADDONS_TI_append_k2l = " \
     dfe-lld-test \
     iqn2-lld-test \
     ipc-transport-qmss-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 5a80bf4..6ed5aff 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -69,7 +69,7 @@ EXTRA_LIBS_append_k2hk = " \
     gdbserverproxy-module-drv-src \
 "
 
-EXTRA_LIBS_append_k2l-evm = " \
+EXTRA_LIBS_append_k2l = " \
     debugss-module-drv-src \
     gdbserverproxy-module-drv-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 3ca669e..dc33381 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -78,7 +78,7 @@ EXTRA_LIBS_append_keystone = "\
 #	hplib-staticdev
 #	nwal-lld-dev
 #	nwal-lld-staticdev
-EXTRA_LIBS_append_k2l-evm = "\
+EXTRA_LIBS_append_k2l = "\
 	dfe-lld-dev \
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
@@ -142,7 +142,7 @@ EXTRA_LIBS_append_dra7xx = " libulm-dev \
 EXTRA_LIBS_append_k2hk = " libulm-staticdev \
                                gdbserver-c6x-dev \
 "
-EXTRA_LIBS_append_k2l-evm = " libulm-staticdev \
+EXTRA_LIBS_append_k2l = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 EXTRA_LIBS_append_k2e = " libulm-staticdev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 7d3f567..288b25a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -79,7 +79,7 @@ UTILS_append_k2hk = " \
     dsptop \
 "
 
-UTILS_append_k2l-evm = " \
+UTILS_append_k2l = " \
     gdbc6x \
     dsptop \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 2bb462d..f2f16f5 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -150,7 +150,7 @@ MAKEFILES_append_k2hk = " opencl-examples \
                               linalg-examples \
 "
 
-MAKEFILES_append_k2l-evm = " opencl-examples \
+MAKEFILES_append_k2l = " opencl-examples \
                              gdbserverproxy-module-drv \
                              debugss-module-drv \
                              openmpacc-examples \
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
index c3f8f38..307e5e9 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 PLATFORM = "UNKNOWN"
 PLATFORM_omap-a15 = "DRA7XX"
 PLATFORM_k2hk-evm = "TCI6636"
-PLATFORM_k2l-evm = "TCI6630"
+PLATFORM_k2l = "TCI6630"
 PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g = "66AK2G"
 
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi.inc b/meta-arago-extras/recipes-ti/netapi/netapi.inc
index 83fb6aa..ef4607f 100644
--- a/meta-arago-extras/recipes-ti/netapi/netapi.inc
+++ b/meta-arago-extras/recipes-ti/netapi/netapi.inc
@@ -24,7 +24,7 @@ PV = "01.01.00.07"
 INC_PR = "r0"
 
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "yes no"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 88d7c2e..50a5270 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -30,7 +30,7 @@ DEPENDS_append_k2hk = " multiprocmgr-rtos \
                             rm-lld-rtos \
 "
 
-DEPENDS_append_k2l-evm  = " multiprocmgr-rtos \
+DEPENDS_append_k2l  = " multiprocmgr-rtos \
                             qmss-lld-rtos \
                             cppi-lld-rtos \
                             rm-lld-rtos \
@@ -47,10 +47,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
 
+BUILD_TARGET_dra7xx = "ARM_AM57"
 BUILD_TARGET_k2hk = "ARM_K2H"
-BUILD_TARGET_k2l-evm  = "ARM_K2L"
+BUILD_TARGET_k2l = "ARM_K2L"
 BUILD_TARGET_k2e = "ARM_K2E"
-BUILD_TARGET_dra7xx = "ARM_AM57"
 BUILD_TARGET_k2g = "ARM_K2G"
 
 EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index fdc822d..892a091 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -45,9 +45,9 @@ S = "${WORKDIR}/git/host"
 
 export WANT_LLVM_RELEASE = "3.6-ti"
 
-OCL_BUILD_TARGET_dra7xx   = "ARM_AM57"
+OCL_BUILD_TARGET_dra7xx = "ARM_AM57"
 OCL_BUILD_TARGET_k2hk = "ARM_K2H"
-OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
+OCL_BUILD_TARGET_k2l = "ARM_K2L"
 OCL_BUILD_TARGET_k2e = "ARM_K2E"
 OCL_BUILD_TARGET_k2g = "ARM_K2G"
 
-- 
2.7.4


