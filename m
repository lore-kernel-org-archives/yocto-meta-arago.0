Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 7512E52A12
	for <meta-arago@arago-project.org>;
	Tue, 20 Sep 2016 19:30:35 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODT001QZI6EG9N0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 20 Sep 2016 14:30:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=uIm26YOzJoj7PdznjHUA:9
Received: by 100.15.110.130 with SMTP id 65914c26;
	Tue, 20 Sep 2016 19:30:20 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 4E181162145;	Tue, 20 Sep 2016 15:30:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 20 Sep 2016 15:30:13 -0400
Message-id: <1474399813-28560-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipes: introduce k2e SOC family
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
X-List-Received-Date: Tue, 20 Sep 2016 19:30:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb       | 3 ++-
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc      | 2 +-
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb      | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb                | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb                        | 2 +-
 10 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 06884ae..009d6bc 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -3,7 +3,8 @@ require arago-core-tisdk-image.inc
 DEPLOY_SPL_NAME_omapl138 = ""
 DEPLOY_SPL_NAME_k2hk-evm = ""
 DEPLOY_SPL_NAME_k2l-evm = ""
-DEPLOY_SPL_NAME_k2e-evm = ""
+DEPLOY_SPL_NAME_k2g-evm = ""
+DEPLOY_SPL_NAME_k2e = ""
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index f97bf18..17d796a 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -26,7 +26,7 @@ DTB_FILTER_am57xx-hs-evm = "${DTB_FILTER_am57xx-evm}"
 DTB_FILTER_ti43x = "am43"
 DTB_FILTER_k2hk-evm = "k2hk"
 DTB_FILTER_k2l-evm = "k2l"
-DTB_FILTER_k2e-evm = "k2e"
+DTB_FILTER_k2e = "k2e"
 DTB_FILTER_k2g-evm = "k2g"
 
 # List of target side images to build for the SDK
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 3d8b891..6a7019a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -134,7 +134,7 @@ ARAGO_TI_PKGS_append_k2hk-evm = "\
     nwal-lld \
     "
 
-ARAGO_TI_PKGS_append_k2e-evm = "\
+ARAGO_TI_PKGS_append_k2e = "\
     mmap-lld \
     hyplnk-lld \
     netapi \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index e463f99..54fb39e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -67,7 +67,7 @@ TEST_ADDONS_TI_append_k2l-evm = " \
     netapi-test \
     "
 
-TEST_ADDONS_TI_append_k2e-evm = " \
+TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
     nwal-lld-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 6fcd6b0..c402eff 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -60,7 +60,7 @@ EXTRA_LIBS_append_k2l-evm = " \
     gdbserverproxy-module-drv-src \
 "
 
-EXTRA_LIBS_append_k2e-evm = " \
+EXTRA_LIBS_append_k2e = " \
     debugss-module-drv-src \
     gdbserverproxy-module-drv-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b768c70..005cb5b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -103,7 +103,7 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	aif2-lld-staticdev \
 	"
 
-EXTRA_LIBS_append_k2e-evm = "\
+EXTRA_LIBS_append_k2e = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
@@ -136,7 +136,7 @@ EXTRA_LIBS_append_k2hk-evm = " libulm-staticdev \
 EXTRA_LIBS_append_k2l-evm = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
-EXTRA_LIBS_append_k2e-evm = " libulm-staticdev \
+EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index db841ce..f02f062 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -74,7 +74,7 @@ UTILS_append_k2l-evm = " \
     dsptop \
 "
 
-UTILS_append_k2e-evm = " \
+UTILS_append_k2e = " \
     gdbc6x \
     dsptop \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 515de94..b6a8201 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -143,7 +143,7 @@ MAKEFILES_append_k2l-evm = " opencl-examples \
                              openmpacc-examples \
 "
 
-MAKEFILES_append_k2e-evm = " opencl-examples \
+MAKEFILES_append_k2e = " opencl-examples \
                              gdbserverproxy-module-drv \
                              debugss-module-drv \
                              openmpacc-examples \
@@ -183,7 +183,7 @@ KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
 KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
+KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 8420217..25a39f8 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -35,7 +35,7 @@ DEPENDS_append_k2l-evm  = " multiprocmgr-rtos \
                             rm-lld-rtos \
 "
 
-DEPENDS_append_k2e-evm  = " multiprocmgr-rtos \
+DEPENDS_append_k2e  = " multiprocmgr-rtos \
                             qmss-lld-rtos \
                             cppi-lld-rtos \
                             rm-lld-rtos \
@@ -50,7 +50,7 @@ S_k2g-evm = "${WORKDIR}/git/monitor_vayu"
 
 BUILD_TARGET_k2hk-evm = "ARM_K2H"
 BUILD_TARGET_k2l-evm  = "ARM_K2L"
-BUILD_TARGET_k2e-evm  = "ARM_K2E"
+BUILD_TARGET_k2e  = "ARM_K2E"
 BUILD_TARGET_dra7xx   = "ARM_AM57"
 BUILD_TARGET_k2g-evm  = "ARM_K2G"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index e6b3e1c..4500ad5 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -47,7 +47,7 @@ export WANT_LLVM_RELEASE = "3.6-ti"
 OCL_BUILD_TARGET_dra7xx   = "ARM_AM57"
 OCL_BUILD_TARGET_k2hk-evm = "ARM_K2H"
 OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
-OCL_BUILD_TARGET_k2e-evm  = "ARM_K2E"
+OCL_BUILD_TARGET_k2e  = "ARM_K2E"
 OCL_BUILD_TARGET_k2g-evm  = "ARM_K2G"
 
 ENABLE_ULM = "1"
-- 
2.7.4


