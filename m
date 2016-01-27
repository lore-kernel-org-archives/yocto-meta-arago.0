Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 461C4529C9
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:54:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJsWB0022468
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWbf012379
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:54:31 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWiv004684;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOWAh-0007F0-QF; Wed, 27 Jan 2016 14:54:31 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:54:25 -0500
Message-ID: <1453924469-27790-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
References: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] ocl: Upgrade to version 1.1.7.2
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
X-List-Received-Date: Wed, 27 Jan 2016 19:54:34 -0000
Content-Type: text/plain

* Extend support to keystone SOCs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |  4 +--
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |  4 +--
 .../recipes-ti/ocl/opencl-examples_git.bb          |  6 +++-
 .../recipes-ti/ocl/opencl-monitor_git.bb           | 35 +++++++++++++++++++---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     | 16 ++++++----
 5 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
index 94e9e34..bf00267 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -6,11 +6,11 @@ include ocl.inc
 
 PR = "${INC_PR}.0"
 
-DEPENDS = "ti-llvm3.3 ti-llvm3.3-native boost"
+DEPENDS = "ti-llvm3.6 ti-llvm3.6-native boost"
 
 S = "${WORKDIR}/git/host"
 
-export WANT_LLVM_RELEASE = "3.3-ti"
+export WANT_LLVM_RELEASE = "3.6-ti"
 
 TARGET_class-target = "arm"
 TARGET_class-native = "x86"
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 66e1f37..18690e7 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.6"
+PV = "1.1.7.2"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "992dfba8783af895f6d4e4877ad7c0466d085bf0"
+OCL_SRCREV = "b437300df647551ebd5df7130576c726155eee4d"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index af225d1..344d2d0 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -6,7 +6,7 @@ include ocl.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm|k2l-evm|k2e-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl ti-cgt6x-native clocl-native"
@@ -30,6 +30,10 @@ OCL_EXAMPLE_LIST = " buffer \
                      matmpy \
                      ooo_callback \
                      edmamgr \
+                     sgemm \
+                     vecadd_openmp \
+                     vecadd_openmp_t \
+                     dgemm \
 "
 
 python do_unpack_append() {
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 3a277e9..1f0a849 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -5,11 +5,11 @@ LICENSE = "BSD"
 include ocl.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
 inherit cmake update-alternatives
 
-DEPENDS = " ti-llvm3.3-native \
+DEPENDS = " ti-llvm3.6-native \
             common-csl-ip-rtos \
             ti-xdctools \
             ti-ipc-rtos \
@@ -20,28 +20,55 @@ DEPENDS = " ti-llvm3.3-native \
             ti-framework-components \
             libulm \
             gdbserver-c6x \
+            openmp-rtos \
 "
 
-COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+DEPENDS_append_k2hk-evm = " multiprocmgr-rtos \
+                            qmss-lld-rtos \
+                            cppi-lld-rtos \
+                            rm-lld-rtos \
+"
+
+DEPENDS_append_k2l-evm  = " multiprocmgr-rtos \
+                            qmss-lld-rtos \
+                            cppi-lld-rtos \
+                            rm-lld-rtos \
+"
+
+DEPENDS_append_k2e-evm  = " multiprocmgr-rtos \
+                            qmss-lld-rtos \
+                            cppi-lld-rtos \
+                            rm-lld-rtos \
+"
+
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm|k2l-evm|k2e-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
 S_dra7xx = "${WORKDIR}/git/monitor_vayu"
 
+BUILD_TARGET_k2hk-evm = "ARM_K2H"
+BUILD_TARGET_k2l-evm  = "ARM_K2L"
+BUILD_TARGET_k2e-evm  = "ARM_K2E"
+
 EXTRA_OECMAKE += " -DCROSS_COMPILE=TRUE \
                    -DOCL_MONITOR_DIR=${S} \
                    -DBUILD_OUTPUT=all \
                    -DSHARE_PATH=${datadir}/ti \
+                   -DBUILD_TARGET=${BUILD_TARGET} \
 "
 
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export PDK_DIR = "${PDK_INSTALL_DIR}"
+export AM57_PDK_DIR = "${PDK_INSTALL_DIR}"
+export C6636_PDK_DIR = "${PDK_INSTALL_DIR}"
 export IPC_DIR = "${IPC_INSTALL_DIR}"
 export XDC_DIR = "${XDC_INSTALL_DIR}"
 export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
 export EDMA3LLD_DIR = "${EDMA3_LLD_INSTALL_DIR}"
 export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
 export FC_DIR = "${FC_INSTALL_DIR}"
+export MPM_DIR = "${MPM_INSTALL_DIR}"
+export OMP_DIR = "${OMP_INSTALL_DIR}"
 export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
 export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
 export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 568e249..de97844 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.0"
 
 inherit cmake
 
-COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
+COMPATIBLE_MACHINE = "dra7xx|k2hk-evm|k2l-evm|k2e-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES += " ${PN}-runtime"
@@ -17,8 +17,8 @@ DEPENDS = " ocl-gl-headers \
             opencl-monitor \
             cmake-native \
             cmem \
-            ti-llvm3.3 \
-            ti-llvm3.3-native \
+            ti-llvm3.6 \
+            ti-llvm3.6-native \
             binutils \
             sqlite3 \
             libffi \
@@ -29,8 +29,10 @@ DEPENDS = " ocl-gl-headers \
             libulm \
 "
 
-DEPENDS_append_dra7xx += "ti-ipc virtual/kernel"
+DEPENDS_append_dra7xx   += " ti-ipc virtual/kernel"
 DEPENDS_append_k2hk-evm += " mpm-transport multiprocmgr"
+DEPENDS_append_k2l-evm  += " mpm-transport multiprocmgr"
+DEPENDS_append_k2e-evm  += " mpm-transport multiprocmgr"
 
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
 RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
@@ -40,10 +42,12 @@ ALLOW_EMPTY_${PN}-runtime = "1"
 
 S = "${WORKDIR}/git/host"
 
-export WANT_LLVM_RELEASE = "3.3-ti"
+export WANT_LLVM_RELEASE = "3.6-ti"
 
-OCL_BUILD_TARGET_dra7xx = "ARM_AM57"
+OCL_BUILD_TARGET_dra7xx   = "ARM_AM57"
 OCL_BUILD_TARGET_k2hk-evm = "ARM_K2H"
+OCL_BUILD_TARGET_k2l-evm  = "ARM_K2L"
+OCL_BUILD_TARGET_k2e-evm  = "ARM_K2E"
 
 EXTRA_OECMAKE += " -DBUILD_TARGET=${OCL_BUILD_TARGET} -DBUILD_OUTPUT=lib -DENABLE_ULM=1"
 
-- 
1.9.1


