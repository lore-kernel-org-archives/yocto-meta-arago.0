Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7C386529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 23:21:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LNLXdO025803
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 18:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506036093;
	bh=eqXU27fPdzNi+PvODgW9rbH5S7mCPKvhUTXP0pUku8Q=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=EB+nJe6wSZgRIsWliNsLqUDOp6HPLKO5WTNKJs6PHYSPc/BYVCjEQQYhOKMVgYeQ8
	AF7F8vRyV/lFq4b8saZg/OwIcCQmvQSNLZiJJv16cO7sFSLETG9GTfMx1FhRTTKjWg
	g4lKrbCiIkbvINTSMAhQBzx6fNucGQ3X4mF+I2jg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LNLXAO027629
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 18:21:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 18:21:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 18:21:33 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LNLW6U001808;
	Thu, 21 Sep 2017 18:21:32 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1506033246-18916-1-git-send-email-x0157990@ti.com>
	<1506033246-18916-3-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <09f8a16d-f1c5-8368-e9ff-409b72355b65@ti.com>
Date: Thu, 21 Sep 2017 19:21:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506033246-18916-3-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2 2/5] tiovx-lib-host:Add recipe for TI OpenVX library, host side
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
X-List-Received-Date: Thu, 21 Sep 2017 23:21:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/21/2017 6:34 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   ...hs-for-Yocto-build-and-add-RTOS-build-var.patch | 133 +++++++++++++++++++++
>   recipes-ti/tiovx/tiovx-lib-host.bb                 |  41 +++++++
>   2 files changed, 174 insertions(+)
>   create mode 100644 recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
>   create mode 100644 recipes-ti/tiovx/tiovx-lib-host.bb
>
> diff --git a/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch b/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
> new file mode 100644
> index 0000000..1e667b8
> --- /dev/null
> +++ b/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
> @@ -0,0 +1,133 @@
> +From 32bd788608034f5a49d9cd4a0163190ef666d9a2 Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <d-senicic1@ti.com>
> +Date: Mon, 14 Aug 2017 10:26:39 -0400
> +Subject: [PATCH] Fix paths for Yocto build and add RTOS build var
> +
> +Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> +---
> + Makefile            | 27 +++++++++++++++++++--------
> + psdk_tools_path.mak | 32 ++++++++++++++------------------
> + 2 files changed, 33 insertions(+), 26 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0832e07..1be5b0d 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,6 +1,6 @@
> +
> + # Valid values are: vsdk psdk
> +-BUILD_SDK=vsdk
> ++BUILD_SDK=psdk
> +
> + include $(BUILD_SDK)_tools_path.mak
> +
> +@@ -8,11 +8,12 @@ BUILD_EMULATION_MODE?=no
> + BUILD_TARGET_MODE?=yes
> +
> + BUILD_CONFORMANCE_TEST?=yes
> +-BUILD_IVISION_KERNELS?=yes
> ++BUILD_IVISION_KERNELS?=no
> + BUILD_BAM?=yes
> + BUILD_TUTORIAL?=yes
> + BUILD_LINUX_A15?=yes
> +-BUILD_EVE?=yes
> ++BUILD_RTOS?=no
> ++BUILD_EVE?=no
> +
> + PROFILE?=all
> +
> +@@ -43,12 +44,17 @@ TARGET_COMBOS :=
> +
> + ifeq ($(BUILD_TARGET_MODE),yes)
> +   ifeq ($(PROFILE), $(filter $(PROFILE), debug all))
> +-	TARGET_COMBOS += TDAX:SYSBIOS:M4:1:debug:TIARMCGT
> +-	TARGET_COMBOS += TDAX:SYSBIOS:C66:1:debug:CGT6X
> ++	ifeq ($(BUILD_RTOS),yes)
> ++	  TARGET_COMBOS += TDAX:SYSBIOS:M4:1:debug:TIARMCGT
> ++	  TARGET_COMBOS += TDAX:SYSBIOS:C66:1:debug:CGT6X
> ++	endif
> ++
> + 	ifeq ($(BUILD_EVE),yes)
> + 	TARGET_COMBOS += TDAX:SYSBIOS:EVE:1:debug:ARP32CGT
> + 	endif
> ++	ifeq ($(BUILD_RTOS),yes)
> + 	TARGET_COMBOS += TDAX:SYSBIOS:A15:1:debug:GCC
> ++	endif
> + 	ifneq ($(OS),Windows_NT)
> + 		ifeq ($(BUILD_LINUX_A15),yes)
> + 		TARGET_COMBOS += TDAX:LINUX:A15:1:debug:GCC_LINARO
> +@@ -57,12 +63,17 @@ ifeq ($(BUILD_TARGET_MODE),yes)
> +   endif
> +
> +   ifeq ($(PROFILE), $(filter $(PROFILE), release all))
> +-	TARGET_COMBOS += TDAX:SYSBIOS:M4:1:release:TIARMCGT
> +-	TARGET_COMBOS += TDAX:SYSBIOS:C66:1:release:CGT6X
> ++	ifeq ($(BUILD_RTOS),yes)
> ++	  TARGET_COMBOS += TDAX:SYSBIOS:M4:1:release:TIARMCGT
> ++	  TARGET_COMBOS += TDAX:SYSBIOS:C66:1:release:CGT6X
> ++	endif
> ++
> + 	ifeq ($(BUILD_EVE),yes)
> + 	TARGET_COMBOS += TDAX:SYSBIOS:EVE:1:release:ARP32CGT
> + 	endif
> +-	TARGET_COMBOS += TDAX:SYSBIOS:A15:1:release:GCC
> ++	ifeq ($(BUILD_RTOS),yes)
> ++	  TARGET_COMBOS += TDAX:SYSBIOS:A15:1:release:GCC
> ++	endif
> + 	ifneq ($(OS),Windows_NT)
> + 		ifeq ($(BUILD_LINUX_A15),yes)
> + 		TARGET_COMBOS += TDAX:LINUX:A15:1:release:GCC_LINARO
> +diff --git a/psdk_tools_path.mak b/psdk_tools_path.mak
> +index 36394f8..8fd468d 100755
> +--- a/psdk_tools_path.mak
> ++++ b/psdk_tools_path.mak
> +@@ -2,7 +2,6 @@
> + TIOVX_PATH = $(abspath .)
> +
> + PLSDK_PATH := /home/x0157990/ti-processor-sdk-linux-am57xx-evm-04.00.00.04
> +-PRSDK_PATH := /home/x0157990/ti-processor-sdk-rtos-am57xx-evm-04-00-00-04
> +
> + CROSS_COMPILE_LINARO := arm-linux-gnueabihf-
> + CROSS_COMPILE := arm-none-eabi-
> +@@ -16,23 +15,20 @@ ifeq ($(BUILD_OS),Windows_NT)
> + GCC_WINDOWS_ROOT ?= C:/CodeBlocks/MinGW
> + endif
> +
> +-XDC_PATH := $(PRSDK_PATH)/xdctools_3_32_01_22_core/
> +-TIARMCGT_ROOT := $(PRSDK_PATH)/ti-cgt-arm_16.9.2.LTS
> ++XDC_PATH := $(XDC_INSTALL_DIR)
> ++TIARMCGT_ROOT :=  $(TIARMCGTPATH)
> ++GCC_ROOT_LINARO := $(GCCLINARO)
> ++XDIAS_PATH := $(XDAISPATH)
> ++BIOS_PATH := $(SYSBIOSPATH)
> ++PDK_PATH := $(PDKPATH)
> ++SDK_PLATFORM_IF_PATH := $(SDKPLATFORMIFPATH)
> +
> +-GCC_ROOT := $(PRSDK_PATH)/gcc-arm-none-eabi-4_9-2015q3
> +-GCC_ROOT_LINARO := /home/x0157990/linaro/gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf
> +-CGT6X_ROOT := $(PRSDK_PATH)/ti-cgt-c6000_8.1.3/
> ++GCC_ROOT ?= $(GCCARMNONEPATH)
> ++CGT6X_ROOT := $(TI_CGT_INSTALL)
> + GCC_LINUX_ROOT ?= /usr/
> ++VXLIB_PATH ?= $(VXLIBPATH)
> ++ARP32CGT_ROOT ?= $(EVETOOLSPATH}
> ++DMAUTILS_PATH ?= $(DSPAPPS_PATH)/dmautils
> ++ALGFRAMEWORK_PATH ?= $(DSPAPPS_PATH)/algframework
> ++EDMA3_LLD_PATH := $(EDMA3LLDPATH)
> +
> +-
> +-VXLIB_PATH ?= $(PRSDK_PATH)/vxlib_c66x_1_1_0_0
> +-XDIAS_PATH := $(PRSDK_PATH)/xdais_7_24_00_04
> +-EDMA3_LLD_PATH := $(PRSDK_PATH)/edma3_lld_2_12_04_28/
> +-BIOS_PATH := $(PRSDK_PATH)/bios_6_46_05_55/
> +-
> +-DMAUTILS_PATH ?= $(PRSDK_PATH)/REL.DMAUTILS.00.08.00.02/dmautils
> +-ALGFRAMEWORK_PATH ?= $(PRSDK_PATH)/REL.ALGFRAMEWORK.02.07.00.00/algframework
> +-PDK_PATH := $(PRSDK_PATH)/pdk_am57xx_1_0_7
> +-CMEM_PATH ?= $(PLSDK_INSTALL_PATH)/board-support/extra-drivers/cmem-mod-4.14.00.00+gitAUTOINC+b514a99ac4/
> +-TARGETFS := $(PLSDK_PATH)/linux-devkit/sysroots/armv7ahf-neon-linux-gnueabi/
> +-SDK_PLATFORM_IF_PATH ?= /home/x0157990/am57/openvx/ex41_forwardmsg/vx
> +\ No newline at end of file
> +--
> +1.9.1
> +
> diff --git a/recipes-ti/tiovx/tiovx-lib-host.bb b/recipes-ti/tiovx/tiovx-lib-host.bb
> new file mode 100644
> index 0000000..e4da2d6
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-lib-host.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "TI OpenVX HOST (Linux A15) side library"
> +DESCRIPTION = "TI OpenVX implementation, TIOVX, based on Khronos OpenVX framework implementation including multiple C66 optimized kernels. Khronos defined conformance test is part of this package as well as additional TI specific tests. Few tutorial examples are also included. This package creates necessary libraries and header files for Linux Host side only. "
> +
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX_manifest.html;md5=edd4fbfc6c1f01c20d49def4670efac0"
> +
> +require recipes-ti/includes/ti-paths-append.inc
Should also be tisdk-paths.inc

> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PV = "01.00.00.00"
> +PR = "r1"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
> +SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
> +SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
> +
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = " tiovx-sys-iface "
> +
> +EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} "
> +EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface BUILD_RTOS=no "
> +
> +do_install () {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${includedir}/VX
> +    install -d ${D}${includedir}/VX/TI
> +    install -d ${D}${libdir}
> +    cp ${CP_ARGS} ${S}/lib/TDAX/A15/LINUX/release/*.a ${D}${libdir}
> +    cp ${CP_ARGS} ${S}/include/VX/* ${D}${includedir}/VX
> +    cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
> +}
> +
> +FILES_${PN}-staticdev = "${libdir}"
> +FILES_${PN}-dev = "${includedir}"
> +
> +ALLOW_EMPTY_${PN} = "1"


