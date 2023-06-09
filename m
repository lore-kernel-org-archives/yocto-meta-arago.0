Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCDBC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:54:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2704.1686336865961797434
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 11:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WLo8Zuzf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359IsP7B075173;
	Fri, 9 Jun 2023 13:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686336865;
	bh=YHLbDdHuJBHoWoAr2AlGguPRSTyq1ap5n49JznRo5Jc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WLo8ZuzfvBjnqasR/GnM0HVnQp79q4A3mxwu8x+Ut17C1lZv1q+kcvnGUHMLUOanZ
	 IV8BUn3Wo9dNcWNuocmgOs6uirQnTGg4qpcY8eUoqtffEbD0Cp3KdUcksmM4Csm3DW
	 +aysh/u4r94DmpDV3cIyq6aL9ruZW3RMieRcfz8s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359IsPso072607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 13:54:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 13:54:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 13:54:24 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359IsNMa035371;
	Fri, 9 Jun 2023 13:54:24 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 3/4] llvm-rtos: Remove TI-RTOS hosted LLVM
Date: Fri, 9 Jun 2023 13:54:21 -0500
Message-ID: <20230609185422.132654-3-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14581

We do not build RTOS packages with OE anymore, remove leftover package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc       |  2 -
 .../recipes-ti/llvm-rtos/llvm-rtos.inc        | 15 -----
 .../recipes-ti/llvm-rtos/llvm-rtos_git.bb     | 65 -------------------
 3 files changed, 82 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
 delete mode 100644 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index 71295bb5..3c0c3863 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -2,7 +2,6 @@ require recipes-ti/includes/ti-paths.inc
 
 export LIBARCH_INSTALL_DIR_RECIPE    = "${installdir}/ti-libarch-tree"
 export LINALG_INSTALL_DIR_RECIPE     = "${installdir}/ti-linalg-tree"
-export LLVM_RTOS_INSTALL_DIR_RECIPE  = "${installdir}/llvm-rtos-tree"
 export OCL_TIDL_FW_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-tidl-fw-tree"
 export FFTLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-fftlib-tree"
 export FFTW_INSTALL_DIR_RECIPE       = "${installdir}/ti-fftw-tree"
@@ -10,7 +9,6 @@ export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
-export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_TIDL_FW_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
 export FFTLIB_INSTALL_DIR     = "${STAGING_DIR_TARGET}${FFTLIB_INSTALL_DIR_RECIPE}"
 export FFTW_INSTALL_DIR       = "${STAGING_DIR_TARGET}${FFTW_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
deleted file mode 100644
index b2c14dda..00000000
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-PV = "3.6.0"
-INC_PR = "r0"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
-
-LLVM_GIT_NAME = "llvm"
-LLVM_GIT_URI = "git://git.ti.com/git/opencl/llvm.git"
-LLVM_GIT_PROTOCOL = "https"
-LLVM_GIT_BRANCH = "release_36_ti"
-LLVM_GIT_DESTSUFFIX = "git"
-LLVM_GIT_SRCREV = "8ff2a35c586a3d3f624712e0943777613a017bc5"
-
-SRC_URI = "${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME}"
-
-SRCREV_${LLVM_GIT_NAME} = "${LLVM_GIT_SRCREV}"
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
deleted file mode 100644
index 2054b1bb..00000000
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY = "Bare-metal build of a subset of LLVM 3.6 with support for TI C66x"
-HOMEPAGE = "http://git.ti.com/opencl/llvm"
-DESCRIPTION = "A subset of LLVM 3.6 libraries built using gcc-arm-baremetal-native. Used in the OpenCL running over a TI-RTOS based host."
-
-# 3-clause BSD-like
-# University of Illinois/NCSA Open Source License
-LICENSE = "NCSA"
-
-
-require llvm-rtos.inc
-require recipes-ti/includes/arago-paths.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS = "gcc-arm-baremetal-native cmake-native"
-
-COMPATIBLE_MACHINE = "omap-a15"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
-
-CLEANBROKEN = "1"
-
-export LLVM_SRC_DIR="${S}"
-export LLVM_INSTALL_DIR="${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
-
-do_compile() {
-    unset LDFLAGS
-    unset TARGET_LDFLAGS
-
-    # Clean the build directory
-    rm -rf build.sysbios
-
-    mkdir -p build.sysbios/build.native
-    cd build.sysbios/build.native; CC="${BUILD_CC}" CXX="${BUILD_CXX}" cmake "${S}"; cd ../..
-    make -C build.sysbios/build.native llvm-tblgen llvm-config ${PARALLEL_MAKE}
-
-    cd build.sysbios; cmake -DCMAKE_TOOLCHAIN_FILE="${S}/ToolChain_ARMSysBios.cmake" -Wno-dev "${S}"; cd ..
-
-    make -C build.sysbios LLVMSupport LLVMCore LLVMBitReader ${PARALLEL_MAKE}
-
-}
-
-do_install() {
-    cd build.sysbios; make -f include/llvm/Makefile install/local; cd ..
-
-    install -d ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/bin
-    install -m 755 ${S}/build.sysbios/build.native/bin/llvm-config ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/bin/llvm-config-host
-
-    install -d ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/lib
-    for libfile in ${S}/build.sysbios/lib/*.a; do
-        install -m 644 ${libfile} ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/lib
-    done
-}
-
-FILES:${PN} += "${LLVM_RTOS_INSTALL_DIR_RECIPE}"
-
-# This package contains one x86-64 executable and a few static libraries
-INSANE_SKIP:${PN} = "arch file-rdeps staticdev"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.39.2


