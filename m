Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 77328520E5
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 22:14:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86MDPqS009937
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 17:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567808005;
	bh=VWWvyoNHafAOpVz1+/YnpAiSi9XjrZBroZNQcEzl6Ik=;
	h=From:To:CC:Subject:Date;
	b=LRnd688MsM/6J1IyxneTnKZqTrzUCT1FlETUvsxiAEDO9ML+JEfsCd2IyJEizt5Nf
	HlaHWMMa7tpH8Lh6gm9EUtFsju3ALDQBLQGLhoHzCVTcUCza1WLugxfi+uNEYrPtgD
	07scMmDLwwWwot8h93vx8/v/kUmRZYda7voIHXGk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86MDPZb078395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 17:13:25 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 17:13:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 17:13:24 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86MDORY038729;
	Fri, 6 Sep 2019 17:13:24 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Sep 2019 17:13:18 -0500
Message-ID: <20190906221318.132204-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update version to 01.01.19.00
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
X-List-Received-Date: Fri, 06 Sep 2019 22:14:29 -0000
Content-Type: text/plain

- Selected OpenCL 1.2 features
- Runtime support update for TIDL API 01.03.01
- Update OpenCL TIDL firmware to 01.01.19.00

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../ocl-rtos/opencl-examples-rtos_git.bb           |  2 +-
 .../recipes-ti/ocl-rtos/opencl-rtos_git.bb         |  2 +
 .../ocl/files/0001-OpenCL_K2x_compile.patch        | 12 ----
 .../ocl/files/0002-OpenCL_l2_cache_size.patch      | 49 ----------------
 ...g-8.3.0-OpenCL-example-undefined-behavior.patch | 68 ----------------------
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |  5 +-
 .../recipes-ti/ocl/opencl-examples_git.bb          |  4 +-
 .../recipes-ti/ocl/opencl-monitor_git.bb           |  4 +-
 .../recipes-ti/ocl/opencl-tidl-fw_git.bb           |  4 +-
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |  6 +-
 10 files changed, 13 insertions(+), 143 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 42bc0a9b..15ac0af7 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 require recipes-ti/ocl/ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index 0c9aca7e..fd7e53c5 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -38,6 +38,7 @@ export WANT_LLVM_RELEASE = "3.6-ti"
 OCL_BUILD_TARGET_omap-a15   = "ARM_AM57"
 
 ENABLE_ULM = "0"
+SHMEM_MANAGER = "CMEM"
 
 RELEASE_TARGET = ""
 RELEASE_TARGET_omap-a15 = "am57xx"
@@ -63,6 +64,7 @@ do_configure() {
         -DBUILD_TARGET=${OCL_BUILD_TARGET} \
         -DBUILD_OUTPUT=lib \
         -DENABLE_ULM=${ENABLE_ULM} \
+        -DSHMEM_MANAGER=${SHMEM_MANAGER} \
         -DBUILD_OS=SYS_BIOS \
         -DIPC_INSTALL_PATH=${IPC_INSTALL_DIR}/packages \
         -DXDC_INSTALL_PATH=${XDC_INSTALL_DIR}/packages \
diff --git a/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch b/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch
deleted file mode 100644
index 0098d321..00000000
--- a/meta-arago-extras/recipes-ti/ocl/files/0001-OpenCL_K2x_compile.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp b/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
-index e5da9cc..182e5e3 100644
---- a/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
-+++ b/host/src/core/dsp/tal/devmem_map_policy_mpm.cpp
-@@ -91,6 +91,7 @@ void* DevMemMapPolicyMPM::Map (DSPDevicePtr64 dsp_addr,  uint32_t size) const
-     else
-         ReportError(ErrorType::Fatal,
-                     ErrorKind::TranslateAddressOutsideMappedAddressRange);
-+    return 0;
- }
- 
- void DevMemMapPolicyMPM::Unmap(void* host_addr, uint32_t size) const
diff --git a/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch b/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
deleted file mode 100644
index 7a81a137..00000000
--- a/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-diff --git a/monitor/src/builtins.c b/monitor/src/builtins.c
-index fbf3bf3..4edf61c 100644
---- a/monitor/src/builtins.c
-+++ b/monitor/src/builtins.c
-@@ -159,7 +159,7 @@ EXPORT int __cache_l2_none()
- EXPORT int __cache_l2_32k()
- {
-     int32_t scratch_delta = __cache_l2_size() - (32 << 10);
--    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-+    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-     if (-scratch_delta > scratch_size) return 0;
-     kernel_config_l2.L2_scratch_size += scratch_delta;
- 
-@@ -173,7 +173,7 @@ EXPORT int __cache_l2_32k()
- EXPORT int __cache_l2_64k()
- {
-     int32_t scratch_delta = __cache_l2_size() - (64 << 10);
--    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-+    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-     if (-scratch_delta > scratch_size) return 0;
-     kernel_config_l2.L2_scratch_size += scratch_delta;
- 
-@@ -187,7 +187,7 @@ EXPORT int __cache_l2_64k()
- EXPORT int __cache_l2_128k()
- {
-     int32_t scratch_delta = __cache_l2_size() - (128 << 10);
--    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-+    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-     if (-scratch_delta > scratch_size) return 0;
-     kernel_config_l2.L2_scratch_size += scratch_delta;
- 
-@@ -205,7 +205,7 @@ EXPORT int __cache_l2_512k() { return 0; }
- EXPORT int __cache_l2_256k()
- {
-     int32_t scratch_delta = __cache_l2_size() - (256 << 10);
--    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-+    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-     if (-scratch_delta > scratch_size) return 0;
-     kernel_config_l2.L2_scratch_size += scratch_delta;
- 
-@@ -219,7 +219,7 @@ EXPORT int __cache_l2_256k()
- EXPORT int __cache_l2_512k()
- {
-     int32_t scratch_delta = __cache_l2_size() - (512 << 10);
--    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-+    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
-     if (-scratch_delta > scratch_size) return 0;
-     kernel_config_l2.L2_scratch_size += scratch_delta;
- 
diff --git a/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch b/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch
deleted file mode 100644
index b2c40c84..00000000
--- a/meta-arago-extras/recipes-ti/ocl/files/0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 7cf77b704544b6012105f7ed19807b798b6cb242 Mon Sep 17 00:00:00 2001
-From: Yuan Zhao <yuanzhao@ti.com>
-Date: Mon, 24 Jun 2019 13:24:11 -0500
-Subject: [PATCH] Fix g++ 8.3.0 OpenCL example undefined behavior
-
-- Fix undefined behavior of non-void functions with no return statements,
-  when using g++ 8.3.0.  Change them to void functions.
-
-Upstream-Status: Submitted [Remove this patch when next release is out]
-
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- examples/persistent_common/host_assist.cpp | 2 +-
- examples/persistent_common/host_assist.h   | 2 +-
- examples/sgemm/main.cpp                    | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/examples/persistent_common/host_assist.cpp b/examples/persistent_common/host_assist.cpp
-index f1640bc..fd8bb18 100644
---- a/examples/persistent_common/host_assist.cpp
-+++ b/examples/persistent_common/host_assist.cpp
-@@ -34,7 +34,7 @@ void print_completion_code(uint32_t completion_code)
- /******************************************************************************
- * Given an OpenCL Device, Abort if the device is not part of the AM57x platform
- ******************************************************************************/
--int assert_am57x(cl::Device &device)
-+void assert_am57x(cl::Device &device)
- {
-     cl::Platform platform;
-     std::string  platform_name;
-diff --git a/examples/persistent_common/host_assist.h b/examples/persistent_common/host_assist.h
-index dec381e..4abf837 100644
---- a/examples/persistent_common/host_assist.h
-+++ b/examples/persistent_common/host_assist.h
-@@ -7,7 +7,7 @@
- /*-----------------------------------------------------------------------------
- * Prototypes
- *----------------------------------------------------------------------------*/
--int  assert_am57x         (cl::Device &device);
-+void assert_am57x         (cl::Device &device);
- void print_completion_code(uint32_t completion_code);
- 
- #endif // _HOST_ASSIST_H_
-diff --git a/examples/sgemm/main.cpp b/examples/sgemm/main.cpp
-index 85f19ac..dfac651 100644
---- a/examples/sgemm/main.cpp
-+++ b/examples/sgemm/main.cpp
-@@ -96,7 +96,7 @@ int NUMCOMPUNITS                    = 0;
- /* ======================================================================== */
- void PrintUsageAndExit();
- void HandleOptions(int argc, char* argv[]);
--bool SetSgemmParams(Device& device);
-+void SetSgemmParams(Device& device);
- 
- /* ======================================================================== */
- /*  MAIN                                                                    */
-@@ -428,7 +428,7 @@ static cl_ulong roundDownPower2(cl_ulong value)
- /*-----------------------------------------------------------------------------
- * Check platform name, set sgemm blocking/tiling parameters accordingly
- *----------------------------------------------------------------------------*/
--bool SetSgemmParams(Device& device)
-+void SetSgemmParams(Device& device)
- {
-    int APanelSz        = 8  << 10;
-    int BPanelSz        = 16 << 10;
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 21247177..4d4af819 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,5 +1,5 @@
 # patch version at the end needs to be in double digits
-PV = "1.1.18.00"
+PV = "1.1.19.00"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -10,7 +10,8 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "a50d8b41cc30bdf4faf1998ec3fc7d0a3093b795"
+
+OCL_SRCREV = "5db8ad81df2d1f39fb21d9d5aeff5ac8dae5c9c3"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index c562bbf7..4732c73d 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -5,9 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI += "file://0003-Fix-g-8.3.0-OpenCL-example-undefined-behavior.patch;patchdir=.."
-
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 00aa773c..0ab21a1a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,9 +5,7 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/arago-paths.inc
 
-SRC_URI += "file://0002-OpenCL_l2_cache_size.patch;patchdir=${WORKDIR}/git"
-
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 inherit update-alternatives
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
index a9ec413a..64dfd0d7 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
 
-PV = "01.01.18.00"
+PV = "01.01.19.00"
 PR = "r0"
 
 require recipes-ti/includes/arago-paths.inc
@@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
 GIT_PROTOCOL = "git"
 BRANCH       = "master"
-SRCREV       = "3b98f405d98416a66678dec01d8f7ef244f379b6"
+SRCREV       = "32772d41ae6978b0ec66173d2bfc8c041017bda1"
 
 SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 8b363573..69f93309 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -3,9 +3,8 @@ HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/opencl/index.html"
 LICENSE = "BSD"
 
 include ocl.inc
-SRC_URI += "file://0001-OpenCL_K2x_compile.patch;patchdir=${WORKDIR}/git"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 inherit cmake systemd
 
@@ -59,8 +58,9 @@ OCL_BUILD_TARGET_k2g = "ARM_K2G"
 
 ENABLE_ULM = "1"
 ENABLE_ULM_k2g = "0"
+SHMEM_MANAGER = "CMEM"
 
-EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=${ENABLE_ULM} -DOCL_VERSION=${PV}"
+EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=${ENABLE_ULM} -DOCL_VERSION=${PV} -DSHMEM_MANAGER=${SHMEM_MANAGER}"
 
 EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
 export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
-- 
2.14.1


