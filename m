Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0720C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:54:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2737.1686336865735060155
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 11:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tgbfaXyO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359IsODr062903;
	Fri, 9 Jun 2023 13:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686336864;
	bh=PNCrB/M0d/QMCKK7ue6lIsUGwD35z3L/x7KL+r1gE9g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tgbfaXyOGGnT/IDJqVO1Wt9VJSCqdeCmOKHyuvxSyyy55WzShfqOV/k3kQpB0y2ox
	 JYNDpdUKIuEHwD50IvXgYKDQ4qtlP70NeU1qm9TBSMH9TMfg+rL+wgnrNc4r25+f6m
	 cmcYv+PVS7O3KbLqkIBGy1ED0wr0hWNz83CgD/gQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359IsOuX042416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 13:54:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 13:54:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 13:54:24 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359IsNMZ035371;
	Fri, 9 Jun 2023 13:54:24 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/4] ocl-rtos: Remove TI-RTOS hosted OpenCL
Date: Fri, 9 Jun 2023 13:54:20 -0500
Message-ID: <20230609185422.132654-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609185422.132654-1-afd@ti.com>
References: <20230609185422.132654-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 18:54:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14579

We do not build RTOS packages with OE anymore, remove leftover package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc       |   2 -
 .../recipes-ti/ocl-rtos/clocl-rtos_git.bb     |  40 -------
 .../recipes-ti/ocl-rtos/clocl-win_git.bb      |  32 ------
 .../ocl-rtos/opencl-examples-rtos_git.bb      |  83 ---------------
 .../ocl-rtos/opencl-monitor-rtos_git.bb       |  76 -------------
 .../recipes-ti/ocl-rtos/opencl-rtos_git.bb    | 100 ------------------
 6 files changed, 333 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index 137a33c3..71295bb5 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -3,7 +3,6 @@ require recipes-ti/includes/ti-paths.inc
 export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
 export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
 export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
-export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
 export OCL_TIDL_FW_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-tidl-fw-tree"
 export FFTLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-fftlib-tree"
 export FFTW_INSTALL_DIR_RECIPE       = "${installdir}/ti-fftw-tree"
@@ -12,7 +11,6 @@ export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
 export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
-export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_TIDL_FW_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
 export FFTLIB_INSTALL_DIR     = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
 export FFTW_INSTALL_DIR       = "${STAGING_DIR_TARGET}${FFTW_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
deleted file mode 100644
index d31f06c9..00000000
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "TI OpenCL-C compiler for C66x (Linux hosted)"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE = "BSD-3-Clause"
-
-require recipes-ti/ocl/ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR = "${INC_PR}.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "ti-llvm3.6-native boost-native"
-
-S = "${WORKDIR}/git/host"
-
-TARGET:class-target = "am57xx"
-TARGET:class-native = "x86"
-
-export WANT_LLVM_RELEASE = "3.6-ti"
-export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}"
-export LDFLAGS="${BUILD_LDFLAGS}"
-export CXXFLAGS="${BUILD_CFLAGS}"
-
-EXTRA_OEMAKE = "CXX=${BUILD_CXX} \
-                -C ${S}/clocl \
-                 _PRODUCT_VERSION=${PV} \
-                 TARGET=x86 \
-                 LLVM_CONFIG_EXE=llvm-config \
-"
-
-do_compile() {
-  oe_runmake
-}
-
-do_install() {
-    install -d ${DESTDIR}/bin/x86
-    install -m 755 ${S}/clocl/x86/clocl ${DESTDIR}/bin/x86/
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
deleted file mode 100644
index 346b40d1..00000000
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "TI OpenCL-C compiler for C66x (Windows hosted)"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE = "BSD-3-Clause"
-
-require recipes-ti/ocl/ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR = "${INC_PR}.0"
-
-CLOCL_WIN_GIT_URI = "git://git.ti.com/git/opencl/clocl-win.git"
-CLOCL_WIN_GIT_BRANCH = "master"
-CLOCL_WIN_SRCREV = "eac7ac7cc2e64a9ff05e4238e44dff3f9a9fcf6b"
-
-BRANCH = "${CLOCL_WIN_GIT_BRANCH}"
-SRC_URI = "${CLOCL_WIN_GIT_URI};protocol=git;branch=${BRANCH}"
-SRCREV = "${CLOCL_WIN_SRCREV}"
-
-LIC_FILES_CHKSUM = "file://opencl-manifest.html;md5=e0810676ad435e2ef53c1a538e24a9a7"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
-
-S = "${WORKDIR}/git"
-export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
-
-do_install() {
-    install -d ${DESTDIR}/usr/share/ti/opencl/bin/pc
-    install -m 755 ${S}/bin/clocl.exe ${DESTDIR}/usr/share/ti/opencl/bin/pc
-}
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
deleted file mode 100644
index 883be797..00000000
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ /dev/null
@@ -1,83 +0,0 @@
-SUMMARY = "TI OpenCL example applications"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE = "BSD-3-Clause"
-
-require recipes-ti/ocl/ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-DEPENDS = "opencl-rtos ti-cgt6x-native clocl-rtos-native opencl-monitor-rtos \
-           clocl-win gcc-arm-baremetal-native ti-xdctools-native ti-sysbios \
-"
-
-S = "${WORKDIR}/git/opencl_example_src"
-B = "${S}"
-
-OCL_EXAMPLE_LIST = " abort_exit \
-                     buffer \
-                     ccode \
-                     dsplib_fft \
-                     float_compute \
-                     null \
-                     offline_embed \
-                     platforms \
-                     simple \
-                     timeout \
-                     vecadd \
-                     matmpy \
-                     ooo_callback \
-                     sgemm \
-                     edmamgr \
-                     vecadd_openmp \
-                     vecadd_openmp_t \
-"
-
-RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
-
-export BIOS_INSTALL_DIR = "${SYSBIOS_INSTALL_DIR}"
-export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}"
-export TI_OCL_INSTALL = "${DESTDIR}/packages/ti/opencl"
-
-python do_unpack:append() {
-    import shutil
-
-    git_dir = d.expand("${WORKDIR}/git/examples")
-    s = d.getVar("S")
-
-    os.makedirs(s)
-    shutil.copy(os.path.join(git_dir,"Makefile"),s)
-    shutil.copy(os.path.join(git_dir,"make_rtos.inc"),s)
-    shutil.copy(os.path.join(git_dir,"rtos_main.c"),s)
-    shutil.copy(os.path.join(git_dir,"load_am57_rtos.js"),s)
-    for example in d.getVar("OCL_EXAMPLE_LIST").split():
-        shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
-}
-
-EXTRA_OEMAKE = "BUILD_OS=SYS_BIOS \
-                TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
-"
-
-do_compile() {
-    unset LDFLAGS
-    unset TARGET_LDFLAGS
-
-    oe_runmake CLOCL=${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tree/bin/x86/clocl
-}
-
-do_install() {
-    install -d ${DESTDIR}/examples
-
-    install ${B}/Makefile ${DESTDIR}/examples
-    install ${B}/make_rtos.inc ${DESTDIR}/examples
-    install ${B}/rtos_main.c ${DESTDIR}/examples
-
-    for ocl_example in ${OCL_EXAMPLE_LIST}; do
-        install -d ${DESTDIR}/examples/${ocl_example}
-        cp -rv ${B}/${ocl_example}/* ${DESTDIR}/examples/${ocl_example}
-    done
-}
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
deleted file mode 100644
index 2c53f684..00000000
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY = "TI OpenCL compute device firmware for C66x (RTOS)"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE = "BSD-3-Clause"
-
-require recipes-ti/ocl/ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = " ti-llvm3.6-native \
-            common-csl-ip-rtos \
-            ti-xdctools-native \
-            ti-ipc-rtos \
-            ti-sysbios \
-            ti-cgt6x-native \
-            edma3-lld-rtos \
-            ti-xdais \
-            ti-framework-components \
-            libaet \
-            openmp-rtos \
-            gcc-arm-baremetal-native \
-"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git/monitor"
-
-BUILD_TARGET:omap-a15   = "ARM_AM57"
-
-RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
-
-export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export PDK_DIR = "${PDK_INSTALL_DIR}"
-export IPC_DIR = "${IPC_INSTALL_DIR}"
-export XDC_DIR = "${XDC_INSTALL_DIR}"
-export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
-export EDMA3LLD_DIR = "${EDMA3_LLD_INSTALL_DIR}"
-export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
-export FC_DIR = "${FC_INSTALL_DIR}"
-export MPM_DIR = "${MPM_INSTALL_DIR}"
-export OMP_DIR = "${OMP_INSTALL_DIR}"
-export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
-export GDB_SERVER_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/gdbc6x"
-export AET_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ctoolslib/aet"
-export X86_LLVM_DIR = "${STAGING_DIR_NATIVE}/usr"
-export XDCPATH = "${S};${IPC_DIR}/packages;${BIOS_DIR}/packages;${EDMA3LLD_DIR}/packages;${FC_DIR}/packages;${XDAIS_DIR}/packages"
-export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
-export OCL_FPERMS = "664"
-export OCL_DPERMS = "775"
-export SHARE_PATH="${DESTDIR}${datadir}/ti/opencl"
-
-EXTRA_OEMAKE += " BUILD_OS=SYS_BIOS \
-                  WORKING_DIRECTORY=${S} \
-                  BUILD_TARGET=${BUILD_TARGET} \
-"
-
-do_compile() {
-  oe_runmake -f Makefile
-}
-
-do_install() {
-    install -m ${OCL_DPERMS} -d ${SHARE_PATH}
-    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.syms ${SHARE_PATH}/dsp.syms
-    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.syms.obj ${SHARE_PATH}/dsp_syms.obj
-    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp0.out ${SHARE_PATH}
-    install -m ${OCL_FPERMS} monitor_am57x_rtos/dsp1.out ${SHARE_PATH}
-    install -m ${OCL_FPERMS} libDSPMonitor.ae66 ${SHARE_PATH}
-    install -m ${OCL_FPERMS} ../builtins/dsp.lib ${SHARE_PATH}
-    install -m ${OCL_FPERMS} ../libm/libm.lib ${SHARE_PATH}
-    install -m ${OCL_FPERMS} cmds/monitor.am57x_rtos.cmd ${SHARE_PATH}
-}
-
-FILES:${PN} += "${OCL_RTOS_INSTALL_DIR_RECIPE}"
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
deleted file mode 100644
index bed29bc1..00000000
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-SUMMARY = "TI OpenCL host runtime (RTOS)"
-HOMEPAGE = "http://software-dl.ti.com/mctools/docs/opencl/intro.html"
-LICENSE = "BSD-3-Clause"
-
-require recipes-ti/ocl/ocl.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR = "${INC_PR}.0"
-
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PACKAGES += " ${PN}-runtime"
-
-DEPENDS = "cmake-native \
-           llvm-rtos \
-           libloki \
-           gcc-arm-baremetal-native \
-           ti-sysbios \
-           ti-xdctools-native \
-           ti-ipc-rtos  \
-           opencl-monitor-rtos  \
-           clocl-rtos-native  \
-           ti-cgt6x-native \
-"
-
-#RDEPENDS:${PN}-dev += " opencl-monitor-rtos"
-
-ALLOW_EMPTY:${PN}-runtime = "1"
-
-
-S = "${WORKDIR}/git/host"
-B = "${WORKDIR}/build"
-
-export WANT_LLVM_RELEASE = "3.6-ti"
-
-OCL_BUILD_TARGET:omap-a15   = "ARM_AM57"
-
-ENABLE_ULM = "0"
-SHMEM_MANAGER = "CMEM"
-
-RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
-
-export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
-export ARM_LLVM_DIR="${LLVM_RTOS_INSTALL_DIR}"
-export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
-
-# Required for eclipse plugin and packages
-export XDC_DIR = "${XDC_INSTALL_DIR}"
-export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
-export IPC_DIR = "${IPC_INSTALL_DIR}"
-
-do_configure() {
-    unset LDFLAGS
-    unset TARGET_LDFLAGS
-
-    rm -rf "${B}"
-
-    mkdir -p "${B}"
-    cd "${B}"; cmake \
-        -DCMAKE_TOOLCHAIN_FILE=../git/host/cmake/CMakeBiosARMToolChain.txt \
-        -DBUILD_TARGET=${OCL_BUILD_TARGET} \
-        -DBUILD_OUTPUT=lib \
-        -DENABLE_ULM=${ENABLE_ULM} \
-        -DSHMEM_MANAGER=${SHMEM_MANAGER} \
-        -DBUILD_OS=SYS_BIOS \
-        -DIPC_INSTALL_PATH=${IPC_INSTALL_DIR}/packages \
-        -DXDC_INSTALL_PATH=${XDC_INSTALL_DIR}/packages \
-        -DBIOS_INSTALL_PATH=${SYSBIOS_INSTALL_DIR}/packages \
-        -DLOKI_INCLUDE_PATH=${STAGING_DIR_HOST}/usr/include/loki \
-        -DARM_LLVM_DIR=${ARM_LLVM_DIR} \
-        -DOCL_VERSION=${PV} "${S}";
-}
-
-do_compile() {
-    unset LDFLAGS
-    unset TARGET_LDFLAGS
-
-    oe_runmake
-    oe_runmake -C packages
-}
-
-# Install x86/Linux clocl built by clocl-rtos-native recipe
-do_install() {
-    unset LDFLAGS
-    unset TARGET_LDFLAGS
-
-    oe_runmake install
-    oe_runmake -C packages install
-
-    install -d ${D}/usr/share/ti/opencl/bin/x86
-    install -m 755 ${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tree/bin/x86/clocl ${D}/usr/share/ti/opencl/bin/x86
-}
-
-FILES:${PN}-dev += "/usr/share/ti/opencl ${OCL_RTOS_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN} = "already-stripped"
-INSANE_SKIP:${PN}-dev = "staticdev file-rdeps arch"
-- 
2.39.2


