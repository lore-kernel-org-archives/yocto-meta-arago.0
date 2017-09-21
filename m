Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B51D5529DA
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 19:51:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LJosm2018315
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 14:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506023454;
	bh=QjovIY0pkUrJnjUL8XHQ88NHVCRq1oSzy1aF0VrBbjk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=dWbmDudvLySHvSJ4FEGjybxHFueMcqmspweRprMpNEfwmJ4pUcyzno2ZfgNQw3DSe
	QU/K8oEhFt+URyKiKZj1ZXNnxb+NriiA/WErOmKzawW2+X+LeiF+thNSOlgXg6Kebi
	P0aJhQDp5KSH0bjsdiSYyTA0F62u39qFK8pLJzdw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LJonVJ026248
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 14:50:49 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 14:50:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 14:50:49 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LJom4Q008478;
	Thu, 21 Sep 2017 14:50:49 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1506023193-16873-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8764bc9a-7698-16a1-03f8-1ac7be28f2f5@ti.com>
Date: Thu, 21 Sep 2017 15:50:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506023193-16873-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] tiovx: Add TIOVX framework host side package, IPC implementation and sample application
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
X-List-Received-Date: Thu, 21 Sep 2017 19:51:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/21/2017 3:46 PM, Djordje Senicic wrote:
> * TIOVX is TI’s implementation of OpenVX Khronos Standard. TIOVX allows users to create vision and compute applications using OpenVX API and can be executed on TI SoCs.
>    TIOVX also provides optimized OpenVX kernels for C66x DSP. An extension API allows users to integrate their own natively developed custom kernels and call them using OpenVX APIs.
>
> * TIOVX-APP includes sample TIOVX applications, like conformance tests, IPC implementation and DSP firmware (includes kernels and DSP-side of TIOVX framework)
>
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---

Can you split this into multi commits? One per recipe?

>   ...agegroup-arago-tisdk-addons-sdk-target.bbappend |   6 +
>   .../packagegroup-arago-tisdk-addons.bbappend       |   2 +
>   recipes-ti/includes/ti-paths-append.inc            |   5 +
>   ...hs-for-Yocto-build-and-add-RTOS-build-var.patch | 133 +++++++++++++++++++++
>   recipes-ti/tiovx/tiovx-app-host.bb                 |  32 +++++
>   recipes-ti/tiovx/tiovx-lib-host.bb                 |  41 +++++++
>   recipes-ti/tiovx/tiovx-sys-iface.bb                |  32 +++++
>   recipes-ti/tiovx/tiovx-sys.inc                     |   5 +
>   8 files changed, 256 insertions(+)
>   create mode 100644 recipes-ti/includes/ti-paths-append.inc

This file should not exist in meta-processor-sdk. Please make the 
updates in recipes-ti/includes/tisdk-paths.inc

>   create mode 100644 recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
>   create mode 100644 recipes-ti/tiovx/tiovx-app-host.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-lib-host.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-sys-iface.bb
>   create mode 100644 recipes-ti/tiovx/tiovx-sys.inc
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
> index aeabbc0..8de7992 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
> @@ -75,3 +75,9 @@ EXTRA_LIBS_append_ti43x = "\
>       cmem-dev \
>       cmem-staticdev \
>   "
> +
> +EXTRA_LIBS_append_dra7xx = " \
> +    tiovx-lib-host-dev \
> +    tiovx-lib-host-staticdev \
> +    tiovx-sys-iface \
> +"
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> index 91e92ff..30b6eb6 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> @@ -34,3 +34,5 @@ UTILS_append_k2g = " uio-test-pruss"
>   EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \
>                                      big-data-ipc-demo-linux-firmware \
>   "
> +
> +EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host "
> diff --git a/recipes-ti/includes/ti-paths-append.inc b/recipes-ti/includes/ti-paths-append.inc
> new file mode 100644
> index 0000000..48f8a9c
> --- /dev/null
> +++ b/recipes-ti/includes/ti-paths-append.inc
> @@ -0,0 +1,5 @@
> +require recipes-ti/includes/tisdk-paths.inc
> +
> +export TIOVX_INSTALL_DIR_RECIPE      = "${installdir}/ti-tiovx-lib-tree"
> +export TIOVX_INSTALL_DIR      = "${STAGING_DIR_TARGET}${TIOVX_INSTALL_DIR_RECIPE}"
> +
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
> diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
> new file mode 100644
> index 0000000..38d6f3f
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-app-host.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, and Host side IPC implementation "
> +DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test as well as additional TI specific tests. This package creates application which runs all the tests (7K-8K). Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_1.0.0.0_manifest.html;md5=de53bc8bf67ffa9a316fe48e3bacbf6d"
> +
> +require recipes-ti/includes/ti-paths-append.inc
> +require tiovx-sys.inc
> +
> +DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
> +
> +PR = "r2"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PROCLIST = "host"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += " TARGET_ROOTDIR=${STAGING_DIR_HOST} "
> +EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} TIOVXPATH=${TIOVX_INSTALL_DIR} IPCPATH=${IPC_INSTALL_DIR} "
> +EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface "
> +EXTRA_OEMAKE += " PROC_LIST=${PROCLIST} "
> +
> +do_install () {
> +    install -d ${D}${bindir}/
> +    install -m 0755 ${S}/host/bin/debug/app_host ${D}${bindir}/tiovx-app_host
> +}
> +
> +FILES_${PN} += "${bindir}/*"
> +INSANE_SKIP_${PN} = "ldflags"
> diff --git a/recipes-ti/tiovx/tiovx-lib-host.bb b/recipes-ti/tiovx/tiovx-lib-host.bb
> new file mode 100644
> index 0000000..17af8b0
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
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PV = "01.00.00.00"
> +PR = "r1"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git@bitbucket.itg.ti.com/processor-sdk/tiovx.git;protocol=ssh;branch=${BRANCH}"
> +SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
> +SRCREV = "ea5da232c371cfb4c081fb9c614e3ce7c022b512"
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
> diff --git a/recipes-ti/tiovx/tiovx-sys-iface.bb b/recipes-ti/tiovx/tiovx-sys-iface.bb
> new file mode 100644
> index 0000000..f4728d9
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-sys-iface.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "TI OpenVX interface header files between TIOVX library and HOST, DSP IPC side implementation "
> +DESCRIPTION = "Collection of header files needed to defined interface between TIOVX library and HOST and DSP IPC side implementation. In order to maintain source compatibility, directory structure follows VSDK source tree layout."
> +
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://iface/VSDK/docs/TIOVX-SYS-IFACE_1.0.0.0_manifest.html;md5=10904cbdb4f065c025a63ca71ae7de2d"
> +
> +require recipes-ti/includes/ti-paths-append.inc
> +require tiovx-sys.inc
> +
> +PR = "r1"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +#   Install the header files
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
> +    cp ${CP_ARGS} ${S}/iface/VSDK/* ${D}${TIOVX_INSTALL_DIR_RECIPE}/sys-iface
> +    install -d ${D}/${base_libdir}/firmware
> +    install -m 0644 ${S}/firmware/tiovx_dsp1.xe66 ${D}/${base_libdir}/firmware/dra7-dsp1-fw.xe66.openvx
> +    install -m 0644 ${S}/firmware/tiovx_dsp2.xe66 ${D}/${base_libdir}/firmware/dra7-dsp2-fw.xe66.openvx
> +}
> +
> +FILES_${PN} += "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
> +PACKAGES =+ "${PN}-firmware"
> +FILES_${PN}-firmware = "${base_libdir}/firmware/*"
> +
> +INSANE_SKIP_${PN}-firmware = "arch"
> +
> diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
> new file mode 100644
> index 0000000..61e6d8d
> --- /dev/null
> +++ b/recipes-ti/tiovx/tiovx-sys.inc
> @@ -0,0 +1,5 @@
> +PV = "01.00.00.00"
> +
> +BRANCH="master"
> +SRCREV = "b17cafb972fb3803794785f70a449e67bcf455a2"
> +SRC_URI = "git://git@bitbucket.itg.ti.com/processor-sdk/tiovx-app.git;protocol=ssh;branch=${BRANCH}"


