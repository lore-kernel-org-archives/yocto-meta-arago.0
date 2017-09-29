Return-Path: <ajayj@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 121FE529E4
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 21:42:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TLgZnA007983
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 16:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506721355;
	bh=07WbOBGGNYJDNlZneWVW6I8k2ZCnUhmYvHmgm5S3sPM=;
	h=From:To:CC:Subject:Date;
	b=Hgp+7RFG6TP4DubuY+CWHTQHR2w7Vf/3xLym6uNcDTHqXRbUKFdyOtoRk/WEKDNcK
	wDJKJwdJslXf++a4xzXZs8upYLIrRMV8MP4h6xxQeji6TgKuk4mR2o00nO66RDDtzL
	E+NdKuRFCfCkA/tBKTE3RPBIEMJQ+vGi5Od0rv6Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TLgU3r029430
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 16:42:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 16:42:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 16:42:30 -0500
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TLgURp014118;
	Fri, 29 Sep 2017 16:42:30 -0500
From: Ajay Jayaraj <ajayj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 17:42:19 -0400
Message-ID: <1506721339-4516-1-git-send-email-ajayj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Ajay Jayaraj <ajayj@ti.com>
Subject: [PATCH] llvm-rtos: LLVM build for OpenCL on TI-RTOS hosts
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
X-List-Received-Date: Fri, 29 Sep 2017 21:42:46 -0000
Content-Type: text/plain

Build a subset of LLVM libraries using the bare metal arm gcc toolchain. These libraries are used by TI's OpenCL runtime over TI-RTOS host.

Signed-off-by: Ajay Jayaraj <ajayj@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc            |  2 +
 .../recipes-ti/llvm-rtos/llvm-rtos.inc             | 16 +++++++
 .../recipes-ti/llvm-rtos/llvm-rtos_git.bb          | 56 ++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
 create mode 100644 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index 6867406..393f14b 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -2,6 +2,8 @@ require recipes-ti/includes/ti-paths.inc
 
 export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
 export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
+export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
+export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
new file mode 100644
index 0000000..faf9b64
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
@@ -0,0 +1,16 @@
+PV = "3.6.0"
+INC_PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
+
+LLVM_GIT_NAME = "llvm"
+LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
+LLVM_GIT_PROTOCOL = "git"
+LLVM_GIT_BRANCH = "release_36_ti"
+LLVM_GIT_DESTSUFFIX = "git"
+LLVM_GIT_SRCREV = "8ff2a35c586a3d3f624712e0943777613a017bc5"
+
+SRC_URI = "${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME}"
+
+SRCREV_${LLVM_GIT_NAME} = "${LLVM_GIT_SRCREV}"
+
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
new file mode 100644
index 0000000..fac9d6b
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Bare-metal build of a subset of LLVM 3.6 with support for TI C66x"
+HOMEPAGE = "http://git.ti.com/opencl/llvm"
+DESCRIPTION = "A subset of LLVM 3.6 libraries built using gcc-arm-none-eabi-native. Used in the OpenCL running over a TI-RTOS based host."
+
+# 3-clause BSD-like
+# University of Illinois/NCSA Open Source License
+LICENSE = "NCSA"
+
+
+require llvm-rtos.inc
+require recipes-ti/includes/arago-paths.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "gcc-arm-none-eabi-native cmake-native"
+
+COMPATIBLE_MACHINE = "omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+RELEASE_TARGET = ""
+RELEASE_TARGET_omap-a15 = "am57xx"
+
+CLEANBROKEN = "1"
+
+export LLVM_SRC_DIR="${S}"
+export LLVM_INSTALL_DIR="${LLVM_RTOS_INSTALL_DIR}"
+
+do_compile() {
+    unset LDFLAGS
+    unset TARGET_LDFLAGS
+
+    # Clean the build directory
+    rm -rf build.sysbios
+
+    mkdir -p build.sysbios/build.native
+    cd build.sysbios/build.native; CC="${BUILD_CC}" CXX="${BUILD_CXX}" cmake "${S}"; cd ../..
+    make -C build.sysbios/build.native llvm-tblgen llvm-config ${PARALLEL_MAKE}
+
+    cd build.sysbios; cmake -DCMAKE_TOOLCHAIN_FILE="${S}/ToolChain_ARMSysBios.cmake" -Wno-dev "${S}"; cd ..
+
+    make -C build.sysbios LLVMSupport LLVMCore LLVMBitReader ${PARALLEL_MAKE}
+
+    cd build.sysbios; make -f include/llvm/Makefile install/local; cd ..
+
+}
+
+do_install() {
+    install -d ${LLVM_RTOS_INSTALL_DIR}/bin
+    install -m 755 ${S}/build.sysbios/build.native/bin/llvm-config ${LLVM_RTOS_INSTALL_DIR}/bin/llvm-config-host
+
+    install -d ${LLVM_RTOS_INSTALL_DIR}/lib
+    for libfile in ${S}/build.sysbios/lib/*.a; do
+        install -m 644 ${libfile} ${LLVM_RTOS_INSTALL_DIR}/lib
+    done
+}
-- 
1.9.1


