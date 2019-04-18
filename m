Return-Path: <gaurav@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 27D1E529AB
	for <meta-arago@arago-project.org>;
	Thu, 18 Apr 2019 21:34:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3ILYBFZ044221
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2019 16:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555623251;
	bh=tjP22VB68jLD/nFi3QQCFMOz5JiyvLzejXxgBTE8NFs=;
	h=From:To:CC:Subject:Date;
	b=UCD42CAJ1JOEq7p3zJ+qDgY6E2VCJ4x04jt23Xf8zPLGinm/dEPActGEoQUrTas1A
	n6pJ6x3/4bC42NdXbg4miu7UIxDLFtzVePauvb2qt6PmaoKYAMDrnPYpC67/9VS+4M
	1v7sP8t1vrXnhsyYIGdHCowFH+xSHj0isbGyIIc8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3ILYBNb078323
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 18 Apr 2019 16:34:11 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 18 Apr 2019 16:34:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 18 Apr 2019 16:34:11 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3ILYB0k053765;
	Thu, 18 Apr 2019 16:34:11 -0500
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 18 Apr 2019 16:33:39 -0500
Message-ID: <20190418213339.109836-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] opencl-monitor, opencl-monitor-ipu, opencl-monitor-rtos: compile monitor in do_compile phase instead of do_install
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
X-List-Received-Date: Thu, 18 Apr 2019 21:34:34 -0000
Content-Type: text/plain

    - The cmake build of opencl-monitor, opencl-monitor-ipu and
      opencl-monitor-rtos performs compilation as well as installation of
      artifacts in the do_install phase
    - Separate the compilation and installation of the monitor in do_compile
      and do_install phases respectively using make instead of cmake

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 .../recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb | 32 +++++++-----
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb       | 24 ++++++---
 .../recipes-ti/ocl/opencl-monitor_git.bb           | 57 ++++++++++++++++++----
 3 files changed, 85 insertions(+), 28 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index b0e70165..637b427c 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -7,8 +7,6 @@ require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
-inherit cmake
-
 DEPENDS = " ti-llvm3.6-native \
             common-csl-ip-rtos \
             ti-xdctools-native \
@@ -33,14 +31,6 @@ BUILD_TARGET_omap-a15   = "ARM_AM57"
 RELEASE_TARGET = ""
 RELEASE_TARGET_omap-a15 = "am57xx"
 
-EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
-                   -DOCL_MONITOR_DIR=${S} \
-                   -DBUILD_OUTPUT=all \
-                   -DSHARE_PATH=${datadir}/ti \
-                   -DBUILD_TARGET=${BUILD_TARGET} \
-                   -DBUILD_OS=SYS_BIOS \
-"
-
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export PDK_DIR = "${PDK_INSTALL_DIR}"
 export IPC_DIR = "${IPC_INSTALL_DIR}"
@@ -57,9 +47,29 @@ export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
 export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
+export OCL_FPERMS = "664"
+export OCL_DPERMS = "775"
+export SHARE_PATH="${DESTDIR}${datadir}/ti/opencl"
+
+EXTRA_OEMAKE += " BUILD_OS=SYS_BIOS \
+                  WORKING_DIRECTORY=${S} \
+                  BUILD_TARGET=${BUILD_TARGET} \
+"
+
+do_compile() {
+  oe_runmake -f Makefile
+}
 
 do_install() {
-    oe_runmake install
+    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.syms ${SHARE_PATH}/dsp.syms
+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.syms.obj ${SHARE_PATH}/dsp_syms.obj
+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.out ${SHARE_PATH}
+    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp1.out ${SHARE_PATH}
+    install -m ${OCL_FPERMS} libDSPMonitor.ae66 ${SHARE_PATH}
+    install -m ${OCL_FPERMS} ../builtins/dsp.lib ${SHARE_PATH}
+    install -m ${OCL_FPERMS} ../libm/libm.lib ${SHARE_PATH}
+    install -m ${OCL_FPERMS} cmds/monitor.am57x_rtos.cmd ${SHARE_PATH}
 }
 
 FILES_${PN} += "${OCL_RTOS_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 72855665..c2552416 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
-inherit cmake update-alternatives
+inherit update-alternatives
 
 DEPENDS = " common-csl-ip-rtos \
             pm-lld-rtos \
@@ -25,13 +25,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor_ipu"
 
-BUILD_TARGET = "ARM_AM57"
-
-EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
-                   -DOCL_MONITOR_IPU_DIR=${S} \
-                   -DBUILD_OUTPUT=all \
-"
-
 export IPC_DIR = "${IPC_INSTALL_DIR}"
 export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
 export PDK_DIR = "${PDK_INSTALL_DIR}"
@@ -40,6 +33,21 @@ export TI_OCL_M4_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/ti-cgt-arm"
 export CSL_LIB_M4 = "${PDK_DIR}/packages/ti/csl/lib/am572x/m4/release/ti.csl.aem4"
 export PM_HAL_LIB_M4 = "$(PDK_DIR)/packages/ti/drv/pm/lib/am572x/m4/release/pm_hal.aem4"
 export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
+export OCL_FPERMS = "664"
+export OCL_DPERMS = "775"
+
+EXTRA_OEMAKE += " BUILD_AM57=1 \
+                  WORKING_DIRECTORY=${S} \
+"
+
+do_compile() {
+  oe_runmake -f Makefile
+}
+
+do_install() {
+    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
+    install -m ${OCL_FPERMS} bin/release/server_ipu1.xem4 ${D}${base_libdir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor
+}
 
 ALTERNATIVE_${PN} = "dra7-ipu1-fw.xem4"
 ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${base_libdir}/firmware/dra7-ipu1-fw.xem4"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 3cc6572b..0ab21a1a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
-inherit cmake update-alternatives
+inherit update-alternatives
 
 DEPENDS = " ti-llvm3.6-native \
             common-csl-ip-rtos \
@@ -56,13 +56,6 @@ BUILD_TARGET_k2l = "ARM_K2L"
 BUILD_TARGET_k2e = "ARM_K2E"
 BUILD_TARGET_k2g = "ARM_K2G"
 
-EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
-                   -DOCL_MONITOR_DIR=${S} \
-                   -DBUILD_OUTPUT=all \
-                   -DSHARE_PATH=${datadir}/ti \
-                   -DBUILD_TARGET=${BUILD_TARGET} \
-"
-
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export PDK_DIR = "${PDK_INSTALL_DIR}"
 export IPC_DIR = "${IPC_INSTALL_DIR}"
@@ -79,9 +72,55 @@ export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
 export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
 export OCL_TIDL_FW_DIR = "${OCL_TIDL_FW_INSTALL_DIR}"
+export OCL_FPERMS = "664"
+export OCL_DPERMS = "775"
+export SHARE_PATH="${D}${datadir}/ti/opencl"
+
+EXTRA_OEMAKE += " BUILD_OS=linux \
+                  WORKING_DIRECTORY=${S} \
+                  BUILD_TARGET=${BUILD_TARGET} \
+"
+do_compile() {
+  oe_runmake -f Makefile
+}
+
+do_install() {
+    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
+}
+
+install_dsp_objs() {
+    install -m ${OCL_FPERMS} monitor_${1}/dsp0.out ${SHARE_PATH}/dsp.out
+    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms.obj ${SHARE_PATH}/dsp_syms.obj
+    install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms ${SHARE_PATH}/dsp.syms
+}
 
 do_install_append_dra7xx() {
-	for i in 1 2; do mv ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66 ${D}${base_libdir}/firmware/dra7-dsp$i-fw.xe66.${BPN}; done
+    install_dsp_objs am57x
+    install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
+    install -m ${OCL_FPERMS} monitor_am57x/dsp0.out ${D}${base_libdir}/firmware/dra7-dsp1-fw.xe66.${BPN}
+    install -m ${OCL_FPERMS} monitor_am57x/dsp1.out ${D}${base_libdir}/firmware/dra7-dsp2-fw.xe66.${BPN}
+}
+
+do_install_append_k2hk() {
+    for i in {0..7}; do install -m ${OCL_FPERMS} monitor_evmk2h/dsp${i}.out ${SHARE_PATH}; done
+    install_dsp_objs evmk2h
+}
+
+do_install_append_k2l() {
+    for i in {0..3}; do install -m ${OCL_FPERMS} monitor_evmk2l/dsp${i}.out ${SHARE_PATH}; done
+    install_dsp_objs evmk2l
+}
+
+do_install_append_k2e() {
+    install -m ${OCL_FPERMS} monitor_evmk2e/dsp0.out ${SHARE_PATH}
+    install_dsp_objs evmk2e
+}
+
+do_install_append_k2g() {
+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp0.out ${SHARE_PATH}
+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp0.out ${SHARE_PATH}/dsp.out
+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp.syms ${SHARE_PATH}
+    install -m ${OCL_FPERMS} monitor_evmk2g/dsp_syms.obj ${SHARE_PATH}
 }
 
 ALTERNATIVE_${PN}_dra7xx = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
-- 
2.14.1


