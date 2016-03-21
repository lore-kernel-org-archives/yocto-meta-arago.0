Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EA3805299B
	for <meta-arago@arago-project.org>;
	Mon, 21 Mar 2016 17:31:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LHVV4h031046
	for <meta-arago@arago-project.org>; Mon, 21 Mar 2016 12:31:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LHVVB1020957
	for <meta-arago@arago-project.org>; Mon, 21 Mar 2016 12:31:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 12:31:31 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LHVUwI010908;
	Mon, 21 Mar 2016 12:31:31 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ai3fu-0001Ig-CL; Mon, 21 Mar 2016 13:31:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 21 Mar 2016 13:31:28 -0400
Message-ID: <1458581488-4964-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ocl: Upgrade to version 1.1.8.0 and add k2g-evm support
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
X-List-Received-Date: Mon, 21 Mar 2016 17:31:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc                |  4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb |  2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb  |  5 ++++-
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb          | 15 +++++++++------
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 18690e7..be596e3 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.7.2"
+PV = "1.1.8.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "b437300df647551ebd5df7130576c726155eee4d"
+OCL_SRCREV = "07577df55e6a81a1b7ca85b7007baa221e24adb2"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 344d2d0..c067085 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -6,7 +6,7 @@ include ocl.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "dra7xx|k2hk-evm|k2l-evm|k2e-evm"
+COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl ti-cgt6x-native clocl-native"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 1f0a849..8420217 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -41,15 +41,18 @@ DEPENDS_append_k2e-evm  = " multiprocmgr-rtos \
                             rm-lld-rtos \
 "
 
-COMPATIBLE_MACHINE = "dra7xx|k2hk-evm|k2l-evm|k2e-evm"
+COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
 S_dra7xx = "${WORKDIR}/git/monitor_vayu"
+S_k2g-evm = "${WORKDIR}/git/monitor_vayu"
 
 BUILD_TARGET_k2hk-evm = "ARM_K2H"
 BUILD_TARGET_k2l-evm  = "ARM_K2L"
 BUILD_TARGET_k2e-evm  = "ARM_K2E"
+BUILD_TARGET_dra7xx   = "ARM_AM57"
+BUILD_TARGET_k2g-evm  = "ARM_K2G"
 
 EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
                    -DOCL_MONITOR_DIR=${S} \
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index de97844..7954f2f 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.0"
 
 inherit cmake
 
-COMPATIBLE_MACHINE = "dra7xx|k2hk-evm|k2l-evm|k2e-evm"
+COMPATIBLE_MACHINE = "dra7xx|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES += " ${PN}-runtime"
@@ -29,10 +29,9 @@ DEPENDS = " ocl-gl-headers \
             libulm \
 "
 
-DEPENDS_append_dra7xx   += " ti-ipc virtual/kernel"
-DEPENDS_append_k2hk-evm += " mpm-transport multiprocmgr"
-DEPENDS_append_k2l-evm  += " mpm-transport multiprocmgr"
-DEPENDS_append_k2e-evm  += " mpm-transport multiprocmgr"
+DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
+DEPENDS_append_keystone = " mpm-transport multiprocmgr"
+DEPENDS_remove_k2g-evm  = " libulm"
 
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
 RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
@@ -48,8 +47,12 @@ OCL_BUILD_TARGET_dra7xx   = "ARM_AM57"
 OCL_BUILD_TARGET_k2hk-evm = "ARM_K2H"
 OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
 OCL_BUILD_TARGET_k2e-evm  = "ARM_K2E"
+OCL_BUILD_TARGET_k2g-evm  = "ARM_K2G"
 
-EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=1"
+ENABLE_ULM = "1"
+ENABLE_ULM_k2g-evm = "0"
+
+EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=${ENABLE_ULM}"
 
 EXTRA_OEMAKE += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} LINUX_DEVKIT_ROOT=${STAGING_DIR_HOST}"
 export KERNEL_INSTALL_DIR = "${STAGING_KERNEL_DIR}"
-- 
1.9.1


