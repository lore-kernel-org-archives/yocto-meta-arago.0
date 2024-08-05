Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC70C52D7D
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 04:37:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1070.1722832644494118919
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 21:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8BEF40C21;
	Mon,  5 Aug 2024 04:37:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoCjlE43BgUB; Mon,  5 Aug 2024 04:37:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA94640CC1;
	Mon,  5 Aug 2024 04:37:22 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6FC4016405E;
	Mon,  5 Aug 2024 00:37:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 08/16] tiovx: deprecate
Date: Mon,  5 Aug 2024 00:37:05 -0400
Message-Id: <20240805043713.172555-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240805043713.172555-1-denis@denix.org>
References: <20240805043713.172555-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Aug 2024 04:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15489

From: Denys Dmytriyenko <denys@konsulko.com>

Remove tiovx components as deprecated and not maintained.

This component was offloading processing tasks to DSP using heavily
modified OpenCL/OpenCV forks of old versions of corresponding upstream
projects on legacy platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...r-Yocto-build-and-add-RTOS-build-var.patch | 135 ------------------
 .../recipes-ti/tiovx/files/reload-dsp-fw.sh   |  66 ---------
 .../recipes-ti/tiovx/files/setenv.sh          |   8 --
 .../recipes-ti/tiovx/tiovx-app-host.bb        |  60 --------
 .../recipes-ti/tiovx/tiovx-lib-host.bb        |  42 ------
 .../recipes-ti/tiovx/tiovx-sys-iface.bb       |  51 -------
 .../recipes-ti/tiovx/tiovx-sys.inc            |   5 -
 7 files changed, 367 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-pat=
hs-for-Yocto-build-and-add-RTOS-build-var.patch
 delete mode 100755 meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-f=
w.sh
 delete mode 100644 meta-arago-extras/recipes-ti/tiovx/files/setenv.sh
 delete mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
 delete mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc

diff --git a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-=
Yocto-build-and-add-RTOS-build-var.patch b/meta-arago-extras/recipes-ti/t=
iovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
deleted file mode 100644
index ff80debc..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-b=
uild-and-add-RTOS-build-var.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 32bd788608034f5a49d9cd4a0163190ef666d9a2 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <d-senicic1@ti.com>
-Date: Mon, 14 Aug 2017 10:26:39 -0400
-Subject: [PATCH] Fix paths for Yocto build and add RTOS build var
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
----
- Makefile            | 27 +++++++++++++++++++--------
- psdk_tools_path.mak | 32 ++++++++++++++------------------
- 2 files changed, 33 insertions(+), 26 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 0832e07..1be5b0d 100755
---- a/Makefile
-+++ b/Makefile
-@@ -1,6 +1,6 @@
-=20
- # Valid values are: vsdk psdk
--BUILD_SDK=3Dvsdk
-+BUILD_SDK=3Dpsdk
-=20
- include $(BUILD_SDK)_tools_path.mak
-=20
-@@ -8,11 +8,12 @@ BUILD_EMULATION_MODE?=3Dno
- BUILD_TARGET_MODE?=3Dyes
-=20
- BUILD_CONFORMANCE_TEST?=3Dyes
--BUILD_IVISION_KERNELS?=3Dyes
-+BUILD_IVISION_KERNELS?=3Dno
- BUILD_BAM?=3Dyes
- BUILD_TUTORIAL?=3Dyes
- BUILD_LINUX_A15?=3Dyes
--BUILD_EVE?=3Dyes
-+BUILD_RTOS?=3Dno
-+BUILD_EVE?=3Dno
-=20
- PROFILE?=3Dall
-=20
-@@ -43,12 +44,17 @@ TARGET_COMBOS :=3D
-=20
- ifeq ($(BUILD_TARGET_MODE),yes)
-   ifeq ($(PROFILE), $(filter $(PROFILE), debug all))
--	TARGET_COMBOS +=3D TDAX:SYSBIOS:M4:1:debug:TIARMCGT
--	TARGET_COMBOS +=3D TDAX:SYSBIOS:C66:1:debug:CGT6X
-+	ifeq ($(BUILD_RTOS),yes)
-+	  TARGET_COMBOS +=3D TDAX:SYSBIOS:M4:1:debug:TIARMCGT
-+	  TARGET_COMBOS +=3D TDAX:SYSBIOS:C66:1:debug:CGT6X
-+	endif
-+
- 	ifeq ($(BUILD_EVE),yes)
- 	TARGET_COMBOS +=3D TDAX:SYSBIOS:EVE:1:debug:ARP32CGT
- 	endif
-+	ifeq ($(BUILD_RTOS),yes)
- 	TARGET_COMBOS +=3D TDAX:SYSBIOS:A15:1:debug:GCC
-+	endif
- 	ifneq ($(OS),Windows_NT)
- 		ifeq ($(BUILD_LINUX_A15),yes)
- 		TARGET_COMBOS +=3D TDAX:LINUX:A15:1:debug:GCC_LINARO
-@@ -57,12 +63,17 @@ ifeq ($(BUILD_TARGET_MODE),yes)
-   endif
-=20
-   ifeq ($(PROFILE), $(filter $(PROFILE), release all))
--	TARGET_COMBOS +=3D TDAX:SYSBIOS:M4:1:release:TIARMCGT
--	TARGET_COMBOS +=3D TDAX:SYSBIOS:C66:1:release:CGT6X
-+	ifeq ($(BUILD_RTOS),yes)
-+	  TARGET_COMBOS +=3D TDAX:SYSBIOS:M4:1:release:TIARMCGT
-+	  TARGET_COMBOS +=3D TDAX:SYSBIOS:C66:1:release:CGT6X
-+	endif
-+
- 	ifeq ($(BUILD_EVE),yes)
- 	TARGET_COMBOS +=3D TDAX:SYSBIOS:EVE:1:release:ARP32CGT
- 	endif
--	TARGET_COMBOS +=3D TDAX:SYSBIOS:A15:1:release:GCC
-+	ifeq ($(BUILD_RTOS),yes)
-+	  TARGET_COMBOS +=3D TDAX:SYSBIOS:A15:1:release:GCC
-+	endif
- 	ifneq ($(OS),Windows_NT)
- 		ifeq ($(BUILD_LINUX_A15),yes)
- 		TARGET_COMBOS +=3D TDAX:LINUX:A15:1:release:GCC_LINARO
-diff --git a/psdk_tools_path.mak b/psdk_tools_path.mak
-index 36394f8..8fd468d 100755
---- a/psdk_tools_path.mak
-+++ b/psdk_tools_path.mak
-@@ -2,7 +2,6 @@
- TIOVX_PATH =3D $(abspath .)
-=20
- PLSDK_PATH :=3D /home/x0157990/ti-processor-sdk-linux-am57xx-evm-04.00.=
00.04
--PRSDK_PATH :=3D /home/x0157990/ti-processor-sdk-rtos-am57xx-evm-04-00-0=
0-04
-=20
- CROSS_COMPILE_LINARO :=3D arm-linux-gnueabihf-
- CROSS_COMPILE :=3D arm-none-eabi-
-@@ -16,23 +15,20 @@ ifeq ($(BUILD_OS),Windows_NT)
- GCC_WINDOWS_ROOT ?=3D C:/CodeBlocks/MinGW
- endif
-=20
--XDC_PATH :=3D $(PRSDK_PATH)/xdctools_3_32_01_22_core/
--TIARMCGT_ROOT :=3D $(PRSDK_PATH)/ti-cgt-arm_16.9.2.LTS
-+XDC_PATH :=3D $(XDC_INSTALL_DIR)
-+TIARMCGT_ROOT :=3D  $(TIARMCGTPATH)
-+GCC_ROOT_LINARO :=3D $(GCCLINARO)
-+XDIAS_PATH :=3D $(XDAISPATH)
-+BIOS_PATH :=3D $(SYSBIOSPATH)
-+PDK_PATH :=3D $(PDKPATH)
-+SDK_PLATFORM_IF_PATH :=3D $(SDKPLATFORMIFPATH)
-=20
--GCC_ROOT :=3D $(PRSDK_PATH)/gcc-arm-none-eabi-4_9-2015q3
--GCC_ROOT_LINARO :=3D /home/x0157990/linaro/gcc-linaro-6.2.1-2016.11-x86=
_64_arm-linux-gnueabihf
--CGT6X_ROOT :=3D $(PRSDK_PATH)/ti-cgt-c6000_8.1.3/
-+GCC_ROOT ?=3D $(GCCARMNONEPATH)
-+CGT6X_ROOT :=3D $(TI_CGT_INSTALL)
- GCC_LINUX_ROOT ?=3D /usr/
-+VXLIB_PATH ?=3D $(VXLIBPATH)
-+ARP32CGT_ROOT ?=3D $(EVETOOLSPATH}
-+DMAUTILS_PATH ?=3D $(DSPAPPS_PATH)/dmautils
-+ALGFRAMEWORK_PATH ?=3D $(DSPAPPS_PATH)/algframework
-+EDMA3_LLD_PATH :=3D $(EDMA3LLDPATH)
-=20
--
--VXLIB_PATH ?=3D $(PRSDK_PATH)/vxlib_c66x_1_1_0_0
--XDIAS_PATH :=3D $(PRSDK_PATH)/xdais_7_24_00_04
--EDMA3_LLD_PATH :=3D $(PRSDK_PATH)/edma3_lld_2_12_04_28/
--BIOS_PATH :=3D $(PRSDK_PATH)/bios_6_46_05_55/
--
--DMAUTILS_PATH ?=3D $(PRSDK_PATH)/REL.DMAUTILS.00.08.00.02/dmautils
--ALGFRAMEWORK_PATH ?=3D $(PRSDK_PATH)/REL.ALGFRAMEWORK.02.07.00.00/algfr=
amework
--PDK_PATH :=3D $(PRSDK_PATH)/pdk_am57xx_1_0_7
--CMEM_PATH ?=3D $(PLSDK_INSTALL_PATH)/board-support/extra-drivers/cmem-m=
od-4.14.00.00+gitAUTOINC+b514a99ac4/
--TARGETFS :=3D $(PLSDK_PATH)/linux-devkit/sysroots/armv7ahf-neon-linux-g=
nueabi/
--SDK_PLATFORM_IF_PATH ?=3D /home/x0157990/am57/openvx/ex41_forwardmsg/vx
-\ No newline at end of file
---=20
-1.9.1
-
diff --git a/meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh b/=
meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh
deleted file mode 100755
index 198fd60f..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/files/reload-dsp-fw.sh
+++ /dev/null
@@ -1,66 +0,0 @@
-#!/bin/sh
-usage() {
-    cat << EOF
-
-  Usage:
-         $0 <fw-type: opencl, tiovx>
-
-EOF
-}
-
-if [ "$1" ]; then
-case "$1" in
-    opencl) echo "Reload opencl firmware to DSP"
-        ;;
-    tiovx) echo "Reload tiovx firmware to DSP"
-        ;;
-    *) echo "Wrong argument $1"
-       usage
-       exit
-        ;;
-esac
-else
-       usage
-       exit
-fi
-
-fw=3D"${1}"
-
-if [[ ${fw} =3D=3D opencl ]]; then
-    #Start OpenCL CMEM memory allocation daemon
-    if pgrep -x "ti-mctd" > /dev/null
-    then
-        echo "ti-mctd is running"
-    else
-        echo "Starting ti-mctd..."
-        ti-mctd
-    fi
-    # Link opencl monitor firmware for DSPs
-    ln -s -f /lib/firmware/dra7-dsp1-fw.xe66.opencl-monitor /lib/firmwar=
e/dra7-dsp1-fw.xe66
-    ln -s -f /lib/firmware/dra7-dsp2-fw.xe66.opencl-monitor /lib/firmwar=
e/dra7-dsp2-fw.xe66
-fi
-
-if [[ ${fw} =3D=3D tiovx ]]; then
-    # Kill CMEM multi-process daemon. This releases all CMEM memory used=
 by OpenCL memory allocation
-    pkill ti-mctd
-
-    # Link tiovx firmware for DSPs
-    ln -s -f /lib/firmware/dra7-dsp1-fw.xe66.openvx /lib/firmware/dra7-d=
sp1-fw.xe66
-    ln -s -f /lib/firmware/dra7-dsp2-fw.xe66.openvx /lib/firmware/dra7-d=
sp2-fw.xe66
-fi
-
-cd /sys/bus/platform/drivers/omap-rproc/
-
-# release DSPs
-echo "Releasing DSPs..."
-echo 40800000.dsp > unbind
-
-echo 41000000.dsp > unbind
-
-# reload firmware for DSPs
-echo "Reloading firmware for DSPs..."
-echo 40800000.dsp > bind
-
-echo 41000000.dsp > bind
-
-cd ~-
diff --git a/meta-arago-extras/recipes-ti/tiovx/files/setenv.sh b/meta-ar=
ago-extras/recipes-ti/tiovx/files/setenv.sh
deleted file mode 100644
index dc7bcea3..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/files/setenv.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/bash
-
-export PROC_LIST=3D'host khronos_example'
-
-export LINUX_SYSROOT_DIR=3D/
-export TIOVXPATH=3D/usr/include/VX
-export IPCPATH=3D/usr/share/ti/ti-ipc-tree
-export SDKPLATFORMIFPATH=3D/usr/share/ti/ti-tiovx-lib-tree/sys-iface
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb b/meta-=
arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
deleted file mode 100644
index ec8355e0..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-SUMMARY =3D "TI OpenVX HOST (Linux A15) conformance verification applica=
tion, Khronos tutorial example, and Host side IPC implementation"
-DESCRIPTION =3D "TI OpenVX implementation, TIOVX, includes Khronos defin=
ed conformance test and tutorial example, as well as additional TI \
-specific tests. This package creates application which runs all the conf=
ormance tests (7K-8K) and Khronos tutorial exercise1. \
-Same package includes IPC implementation (MessageQ based) needed for com=
munication with DSP firmware (loaded at boot time)"
-
-LICENSE =3D "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM =3D "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_ma=
nifest.html;md5=3D247d7c56d783f583bf802490d5c93db3"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
-SRC_URI:append =3D "\
-     file://setenv.sh \
-"
-
-inherit pkgconfig features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencv"
-
-require recipes-ti/includes/arago-paths.inc
-require tiovx-sys.inc
-
-DEPENDS =3D "tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv udev"
-RDEPENDS:${PN} =3D "tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-h=
ost ti-ipc cmem"
-
-PR =3D "r3"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PROCLIST =3D "host khronos_example"
-
-S =3D "${WORKDIR}/git"
-
-EXTRA_OEMAKE +=3D " TARGET_ROOTDIR=3D${STAGING_DIR_HOST} "
-EXTRA_OEMAKE +=3D " GCCLINARO=3D${TOOLCHAIN_PATH} TIOVXPATH=3D${TIOVX_IN=
STALL_DIR} IPCPATH=3D${IPC_INSTALL_DIR} "
-EXTRA_OEMAKE +=3D " SDKPLATFORMIFPATH=3D${TIOVX_INSTALL_DIR}/sys-iface "
-EXTRA_OEMAKE +=3D " PROC_LIST=3D'${PROCLIST}' "
-
-do_install () {
-    install -d ${D}${bindir}/
-    install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app=
_host
-    install -m 0755 ${S}/khronos_example/bin/debug/opticalflow ${D}${bin=
dir}/tiovx-opticalflow
-
-    oe_runmake clean
-    install -d ${D}${datadir}/ti/examples/openvx
-    install -m 644 ${S}/products.mak ${D}${datadir}/ti/examples/openvx
-    install -m 644 ${S}/makefile ${D}${datadir}/ti/examples/openvx
-    install -m 644 ${WORKDIR}/setenv.sh ${D}${datadir}/ti/examples/openv=
x
-    cp -r ${S}/host ${D}${datadir}/ti/examples/openvx
-    cp -r ${S}/khronos_example  ${D}${datadir}/ti/examples/openvx
-    cp -r ${S}/shared ${D}${datadir}/ti/examples/openvx
-}
-
-PACKAGES +=3D "${PN}-examples"
-FILES:${PN}-examples =3D "${datadir}/ti/examples/openvx"
-RDEPENDS:${PN}-examples =3D "tiovx-lib-host-staticdev tiovx-lib-host-dev=
"
-
-FILES:${PN} +=3D "${bindir}/*"
-INSANE_SKIP:${PN} =3D "ldflags"
-INSANE_SKIP:${PN}-examples =3D "dev-deps"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-=
arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
deleted file mode 100644
index e2ee926e..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY =3D "TI OpenVX HOST (Linux A15) side library"
-DESCRIPTION =3D "TI OpenVX implementation, TIOVX, based on Khronos OpenV=
X framework implementation including multiple C66 optimized kernels. \
-Khronos defined conformance test is part of this package as well as addi=
tional TI specific tests. Few tutorial examples are also included. \
-This package creates necessary libraries and header files for Linux Host=
 side only. "
-
-LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM =3D "file://docs/manifest/TIOVX_manifest.html;md5=3Dedd=
4fbfc6c1f01c20d49def4670efac0"
-
-require recipes-ti/includes/arago-paths.inc
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PV =3D "01.00.00.00"
-PR =3D "r1"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/git/processor-sdk/tiovx.git;protocol=3Dhtt=
ps;branch=3D${BRANCH}"
-SRC_URI +=3D "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-v=
ar.patch "
-SRCREV =3D "2bfa01201804eaf2e675c743e708e88ab612049e"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "tiovx-sys-iface"
-
-EXTRA_OEMAKE +=3D " GCCLINARO=3D${TOOLCHAIN_PATH} "
-EXTRA_OEMAKE +=3D " SDKPLATFORMIFPATH=3D${TIOVX_INSTALL_DIR}/sys-iface B=
UILD_RTOS=3Dno "
-
-do_install () {
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${includedir}/VX
-    install -d ${D}${includedir}/VX/TI
-    install -d ${D}${libdir}
-    cp ${CP_ARGS} ${S}/lib/TDAX/A15/LINUX/release/*.a ${D}${libdir}
-    cp ${CP_ARGS} ${S}/include/VX/* ${D}${includedir}/VX
-    cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
-}
-
-FILES:${PN}-staticdev =3D "${libdir}"
-FILES:${PN}-dev =3D "${includedir}"
-
-ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb b/meta=
-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
deleted file mode 100644
index 3a900e5f..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY =3D "TI OpenVX interface header files between TIOVX library and =
HOST, DSP IPC side implementation"
-DESCRIPTION =3D "Collection of header files needed to define interface b=
etween TIOVX library and HOST and DSP IPC side implementation. \
-In order to maintain source compatibility, directory structure follows V=
SDK source tree layout."
-
-LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM =3D "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_man=
ifest.html;md5=3D10904cbdb4f065c025a63ca71ae7de2d"
-
-require recipes-ti/includes/arago-paths.inc
-require tiovx-sys.inc
-
-PR =3D "r1"
-
-COMPATIBLE_MACHINE =3D "dra7xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit update-alternatives features_check
-
-REQUIRED_MACHINE_FEATURES =3D "dsp"
-
-SRC_URI:append =3D "\
-     file://reload-dsp-fw.sh \
-"
-
-S =3D "${WORKDIR}/git"
-
-do_install () {
-#   Install the header files
-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
-    install -d ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
-    cp ${CP_ARGS} ${S}/iface/VSDK/* ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-=
iface
-#   Install the firmware
-    install -d ${D}/${base_libdir}/firmware
-    install -m 0644 ${S}/firmware/tiovx_dsp1.xe66 ${D}/${base_libdir}/fi=
rmware/dra7-dsp1-fw.xe66.openvx
-    install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/fi=
rmware/dra7-dsp2-fw.xe66.openvx
-#   Install the scripts for loading dsp firmware
-    install -d ${D}${bindir}/
-    install -m 0755 ${WORKDIR}/reload-dsp-fw.sh ${D}${bindir}
-}
-
-ALTERNATIVE:${PN} =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
-ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp1-fw.xe66"
-ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp1-fw.xe66.openvx"
-ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp2-fw.xe66"
-ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp2-fw.xe66.openvx"
-ALTERNATIVE_PRIORITY =3D "20"
-
-FILES:${PN} +=3D "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
-PACKAGES =3D+ "${PN}-firmware"
-FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
-
-INSANE_SKIP:${PN}-firmware =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc b/meta-arag=
o-extras/recipes-ti/tiovx/tiovx-sys.inc
deleted file mode 100644
index 41fc6825..00000000
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-PV =3D "01.00.01.00"
-
-BRANCH=3D"master"
-SRCREV =3D "5be60aee8d013907a4d8a6cc8af35a517a33b49e"
-SRC_URI =3D "git://git.ti.com/git/processor-sdk/tiovx-app.git;protocol=3D=
https;branch=3D${BRANCH}"
--=20
2.25.1


