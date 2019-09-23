Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 61812520E4
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2019 19:24:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NJN5T4022531
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 14:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569266585;
	bh=8T3NXdG0/pbOwMUDaIv2tczAEVxZMwxAqHolcGwcvAk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DpsU6a0iuUt6qViTw+5RyU55zC0JELfiQYvl2iizD32sBOmNyFDt+GvGw5XXtVO5F
	DiEgNqOu1BmAMvZfbx0oHApGr6+aeZfCFuBw6eps76glaiudpzP/eMB3tbcrzu+qgW
	6JOn/4zpdEv26Jfh3YoQQyK+EVl+HhDE+S+QQZGs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NJN5pJ033501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 14:23:05 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 14:23:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 14:22:58 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NJMxq8033647;
	Mon, 23 Sep 2019 14:23:04 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Sep 2019 15:21:19 -0400
Message-ID: <20190923192121.29814-2-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923192121.29814-1-a0271529@ti.com>
References: <20190923192121.29814-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, d-senicic1@ti.com,
	Djordje Senicic <x0157990@ti.com>
Subject: [master/thud/ti2019.03 2/4] tiovx-lib-host: add recipe for TI OpenVX library, host side
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
X-List-Received-Date: Mon, 23 Sep 2019 19:24:14 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...r-Yocto-build-and-add-RTOS-build-var.patch | 133 ++++++++++++++++++
 .../recipes-ti/tiovx/tiovx-lib-host.bb        |  41 ++++++
 2 files changed, 174 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
 create mode 100644 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb

diff --git a/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch b/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
new file mode 100644
index 00000000..1e667b87
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
@@ -0,0 +1,133 @@
+From 32bd788608034f5a49d9cd4a0163190ef666d9a2 Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <d-senicic1@ti.com>
+Date: Mon, 14 Aug 2017 10:26:39 -0400
+Subject: [PATCH] Fix paths for Yocto build and add RTOS build var
+
+Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
+---
+ Makefile            | 27 +++++++++++++++++++--------
+ psdk_tools_path.mak | 32 ++++++++++++++------------------
+ 2 files changed, 33 insertions(+), 26 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0832e07..1be5b0d 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ 
+ # Valid values are: vsdk psdk
+-BUILD_SDK=vsdk
++BUILD_SDK=psdk
+ 
+ include $(BUILD_SDK)_tools_path.mak
+ 
+@@ -8,11 +8,12 @@ BUILD_EMULATION_MODE?=no
+ BUILD_TARGET_MODE?=yes
+ 
+ BUILD_CONFORMANCE_TEST?=yes
+-BUILD_IVISION_KERNELS?=yes
++BUILD_IVISION_KERNELS?=no
+ BUILD_BAM?=yes
+ BUILD_TUTORIAL?=yes
+ BUILD_LINUX_A15?=yes
+-BUILD_EVE?=yes
++BUILD_RTOS?=no
++BUILD_EVE?=no
+ 
+ PROFILE?=all
+ 
+@@ -43,12 +44,17 @@ TARGET_COMBOS :=
+ 
+ ifeq ($(BUILD_TARGET_MODE),yes)
+   ifeq ($(PROFILE), $(filter $(PROFILE), debug all))
+-	TARGET_COMBOS += TDAX:SYSBIOS:M4:1:debug:TIARMCGT
+-	TARGET_COMBOS += TDAX:SYSBIOS:C66:1:debug:CGT6X
++	ifeq ($(BUILD_RTOS),yes)
++	  TARGET_COMBOS += TDAX:SYSBIOS:M4:1:debug:TIARMCGT
++	  TARGET_COMBOS += TDAX:SYSBIOS:C66:1:debug:CGT6X
++	endif
++
+ 	ifeq ($(BUILD_EVE),yes)
+ 	TARGET_COMBOS += TDAX:SYSBIOS:EVE:1:debug:ARP32CGT
+ 	endif
++	ifeq ($(BUILD_RTOS),yes)
+ 	TARGET_COMBOS += TDAX:SYSBIOS:A15:1:debug:GCC
++	endif
+ 	ifneq ($(OS),Windows_NT)
+ 		ifeq ($(BUILD_LINUX_A15),yes)
+ 		TARGET_COMBOS += TDAX:LINUX:A15:1:debug:GCC_LINARO
+@@ -57,12 +63,17 @@ ifeq ($(BUILD_TARGET_MODE),yes)
+   endif
+ 
+   ifeq ($(PROFILE), $(filter $(PROFILE), release all))
+-	TARGET_COMBOS += TDAX:SYSBIOS:M4:1:release:TIARMCGT
+-	TARGET_COMBOS += TDAX:SYSBIOS:C66:1:release:CGT6X
++	ifeq ($(BUILD_RTOS),yes)
++	  TARGET_COMBOS += TDAX:SYSBIOS:M4:1:release:TIARMCGT
++	  TARGET_COMBOS += TDAX:SYSBIOS:C66:1:release:CGT6X
++	endif
++
+ 	ifeq ($(BUILD_EVE),yes)
+ 	TARGET_COMBOS += TDAX:SYSBIOS:EVE:1:release:ARP32CGT
+ 	endif
+-	TARGET_COMBOS += TDAX:SYSBIOS:A15:1:release:GCC
++	ifeq ($(BUILD_RTOS),yes)
++	  TARGET_COMBOS += TDAX:SYSBIOS:A15:1:release:GCC
++	endif
+ 	ifneq ($(OS),Windows_NT)
+ 		ifeq ($(BUILD_LINUX_A15),yes)
+ 		TARGET_COMBOS += TDAX:LINUX:A15:1:release:GCC_LINARO
+diff --git a/psdk_tools_path.mak b/psdk_tools_path.mak
+index 36394f8..8fd468d 100755
+--- a/psdk_tools_path.mak
++++ b/psdk_tools_path.mak
+@@ -2,7 +2,6 @@
+ TIOVX_PATH = $(abspath .)
+ 
+ PLSDK_PATH := /home/x0157990/ti-processor-sdk-linux-am57xx-evm-04.00.00.04
+-PRSDK_PATH := /home/x0157990/ti-processor-sdk-rtos-am57xx-evm-04-00-00-04
+ 
+ CROSS_COMPILE_LINARO := arm-linux-gnueabihf-
+ CROSS_COMPILE := arm-none-eabi-
+@@ -16,23 +15,20 @@ ifeq ($(BUILD_OS),Windows_NT)
+ GCC_WINDOWS_ROOT ?= C:/CodeBlocks/MinGW
+ endif
+ 
+-XDC_PATH := $(PRSDK_PATH)/xdctools_3_32_01_22_core/
+-TIARMCGT_ROOT := $(PRSDK_PATH)/ti-cgt-arm_16.9.2.LTS
++XDC_PATH := $(XDC_INSTALL_DIR)
++TIARMCGT_ROOT :=  $(TIARMCGTPATH)
++GCC_ROOT_LINARO := $(GCCLINARO)
++XDIAS_PATH := $(XDAISPATH)
++BIOS_PATH := $(SYSBIOSPATH)
++PDK_PATH := $(PDKPATH)
++SDK_PLATFORM_IF_PATH := $(SDKPLATFORMIFPATH)
+ 
+-GCC_ROOT := $(PRSDK_PATH)/gcc-arm-none-eabi-4_9-2015q3
+-GCC_ROOT_LINARO := /home/x0157990/linaro/gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf
+-CGT6X_ROOT := $(PRSDK_PATH)/ti-cgt-c6000_8.1.3/
++GCC_ROOT ?= $(GCCARMNONEPATH)
++CGT6X_ROOT := $(TI_CGT_INSTALL)
+ GCC_LINUX_ROOT ?= /usr/
++VXLIB_PATH ?= $(VXLIBPATH)
++ARP32CGT_ROOT ?= $(EVETOOLSPATH}
++DMAUTILS_PATH ?= $(DSPAPPS_PATH)/dmautils
++ALGFRAMEWORK_PATH ?= $(DSPAPPS_PATH)/algframework
++EDMA3_LLD_PATH := $(EDMA3LLDPATH)
+ 
+-
+-VXLIB_PATH ?= $(PRSDK_PATH)/vxlib_c66x_1_1_0_0
+-XDIAS_PATH := $(PRSDK_PATH)/xdais_7_24_00_04
+-EDMA3_LLD_PATH := $(PRSDK_PATH)/edma3_lld_2_12_04_28/
+-BIOS_PATH := $(PRSDK_PATH)/bios_6_46_05_55/
+-
+-DMAUTILS_PATH ?= $(PRSDK_PATH)/REL.DMAUTILS.00.08.00.02/dmautils
+-ALGFRAMEWORK_PATH ?= $(PRSDK_PATH)/REL.ALGFRAMEWORK.02.07.00.00/algframework
+-PDK_PATH := $(PRSDK_PATH)/pdk_am57xx_1_0_7
+-CMEM_PATH ?= $(PLSDK_INSTALL_PATH)/board-support/extra-drivers/cmem-mod-4.14.00.00+gitAUTOINC+b514a99ac4/
+-TARGETFS := $(PLSDK_PATH)/linux-devkit/sysroots/armv7ahf-neon-linux-gnueabi/
+-SDK_PLATFORM_IF_PATH ?= /home/x0157990/am57/openvx/ex41_forwardmsg/vx
+\ No newline at end of file
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
new file mode 100644
index 00000000..6115b195
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
@@ -0,0 +1,41 @@
+SUMMARY = "TI OpenVX HOST (Linux A15) side library"
+DESCRIPTION = "TI OpenVX implementation, TIOVX, based on Khronos OpenVX framework implementation including multiple C66 optimized kernels. Khronos defined conformance test is part of this package as well as additional TI specific tests. Few tutorial examples are also included. This package creates necessary libraries and header files for Linux Host side only. "
+
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX_manifest.html;md5=edd4fbfc6c1f01c20d49def4670efac0"
+
+require recipes-ti/includes/tisdk-paths.inc
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PV = "01.00.00.00"
+PR = "r1"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
+SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
+SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
+
+
+S = "${WORKDIR}/git"
+
+DEPENDS = " tiovx-sys-iface "
+
+EXTRA_OEMAKE += " GCCLINARO=${TOOLCHAIN_PATH} "
+EXTRA_OEMAKE += " SDKPLATFORMIFPATH=${TIOVX_INSTALL_DIR}/sys-iface BUILD_RTOS=no "
+
+do_install () {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${includedir}/VX
+    install -d ${D}${includedir}/VX/TI
+    install -d ${D}${libdir}
+    cp ${CP_ARGS} ${S}/lib/TDAX/A15/LINUX/release/*.a ${D}${libdir}
+    cp ${CP_ARGS} ${S}/include/VX/* ${D}${includedir}/VX
+    cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
+}
+
+FILES_${PN}-staticdev = "${libdir}"
+FILES_${PN}-dev = "${includedir}"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.17.1


