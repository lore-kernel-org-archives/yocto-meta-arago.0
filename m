Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6A5C6529CE
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 17:36:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RHa5gf114869
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530120965;
	bh=NloA3/B1a9MhnAfmMyyd/A8HvJ0DqW42pqoguNtOnNQ=;
	h=From:To:CC:Subject:Date;
	b=XYWIiA/u/iRL/sW4qfX62kJs/NIri9tUJgXt8wRy9dqVdnImec8ht/8IfoHCU4/t7
	Mk7bMBs4xa8zN/MbFhk1nIH9EGOQnz0+oohEbIe4kOyFz6oVvquP9N5+GQ11z3rlR7
	pedN0l5VPUaWIZ95io/+/cSdft0FZ5hrPibP38+w=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHa5fd018877
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:36:05 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 12:36:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 12:36:04 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHa4mw017747;
	Wed, 27 Jun 2018 12:36:04 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jun 2018 12:35:57 -0500
Message-ID: <20180627173557.55824-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: update version to 01.01.15.02
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
X-List-Received-Date: Wed, 27 Jun 2018 17:36:11 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc            |  2 ++
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |  4 +--
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb       |  4 ++-
 .../recipes-ti/ocl/opencl-monitor_git.bb           |  4 ++-
 .../recipes-ti/ocl/opencl-tidl-fw_git.bb           | 38 ++++++++++++++++++++++
 5 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index a652df08..5a2efaff 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -4,8 +4,10 @@ export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
 export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
 export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
 export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
+export OCL_TIDL_FW_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-tidl-fw-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
 export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
+export OCL_TIDL_FW_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index edde12b2..1fd705da 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.15.1"
+PV = "1.1.15.2"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "5b77a9c0ac39985430f11ff9b80d3122d11e261c"
+OCL_SRCREV = "84f2e36f38eca46c6c376bacd757d45f2e5733f1"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index d560744a..61d5cad0 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
 LICENSE = "BSD"
 
 include ocl.inc
-require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
@@ -17,6 +17,7 @@ DEPENDS = " common-csl-ip-rtos \
             ti-pdk-build-rtos \
             ti-cgt-arm-native \
             util-linux-native \
+            opencl-tidl-fw \
 "
 
 COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm"
@@ -38,6 +39,7 @@ export XDC_DIR = "${XDC_INSTALL_DIR}"
 export TI_OCL_M4_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/ti-cgt-arm"
 export CSL_LIB_M4 = "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/release/ti.csl.aem4"
 export PM_HAL_LIB_M4 = "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/release/pm_hal.aem4"
+export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
 
 ALTERNATIVE_${PN} = "dra7-ipu1-fw.xem4"
 ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 50a5270e..5605bfbd 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
 LICENSE = "BSD"
 
 include ocl.inc
-require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
@@ -22,6 +22,7 @@ DEPENDS = " ti-llvm3.6-native \
             gdbserver-c6x \
             libaet \
             openmp-rtos \
+            opencl-tidl-fw \
 "
 
 DEPENDS_append_k2hk = " multiprocmgr-rtos \
@@ -75,6 +76,7 @@ export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
 export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
+export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
 
 do_install_append_dra7xx() {
 	for i in 1 2; do mv ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66 ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66.${BPN}; done
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
new file mode 100644
index 00000000..d36c4152
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "OpenCL TIDL firmware for AM57xx"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
+
+PV = "01.00.00.02"
+PR = "r0"
+
+require recipes-ti/includes/arago-paths.inc
+
+COMPATIBLE_MACHINE = "am57xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
+GIT_PROTOCOL = "git"
+BRANCH       = "master"
+SRCREV       = "3b2dca5cb5718db93f7742186839591188c46b25"
+SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = "eve_firmware.bin ocl_tidl_dsp.lib"
+
+do_install() {
+    install -d ${D}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}
+    for f in ${TARGET}; do
+	install -m 0644 ${S}/$f ${D}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}/$f
+    done
+}
+
+FILES_${PN} += "${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN} = "arch"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.14.1


