Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id C42EF52093
	for <meta-arago@arago-project.org>;
	Fri,  5 Jun 2015 01:10:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPG0049Q5XJJXT0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 04 Jun 2015 20:10:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Lv5vsSpc c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=sozttTNsAAAA:8	a=klVuRiTrhT7zRFMxjOgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4F601161A83;	Thu,
	4 Jun 2015 21:10:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 04 Jun 2015 21:10:31 -0400
Message-id: <1433466631-15455-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] srcipk: default source package architecture to the same as binary package
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
X-List-Received-Date: Fri, 05 Jun 2015 01:10:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

The original idea was that sources are machine- and even architecture-agnostic.
That should be true in general, but in some cases sources do differ from
machine to machine, due to different code bases. To accomodate those, there's
a way to set source package architecture on a case by case basis, but it
became error-prone lately.

But the biggest issue is that srcipk class doesn't play nice with sstate,
resulting in packaging errors. For example, when binary package is machine
specific, but its sources are marked by default as allarch, the source
package gets re-packaged every time a new machine gets built and packages
its machine-speicific packages, which could lead to md5sum mismatches. It
is also true for regular arch-specific packages when machines have different
Cortex optimizations enabled, essentially leading to different archs.

Another example is when binary package is not machine-specific, but its
source package is erroneously marked as such, the binary package then gets
invalidated by sstate for different machines, potentially leading to errors
like "PR went backwards" and so on.

Setting default source package architecture the same as the corresponding
binary package makes things easier and avoids unnecessary packaging issues.

Long-term this could be fixed more flexible by revamping srcipk class to
do proper shared state handling, so making source package as allarch won't
trigger rebuilding or re-packaging it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass        |  4 +-
 .../conf/distro/arago-source-ipk.conf              | 65 ----------------------
 2 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 0e778f4..2d19a18 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -13,7 +13,7 @@
 #                             the sources into.
 #   - SRCIPK_PACKAGE_ARCH   = This variable allows specific recipies to
 #                             specify an architecture for the sourcetree
-#                             package is "all" is not appropriate
+#                             package, defaults to the same as binary pkg
 #   - SRCIPK_INC_EXTRAFILES = When set to 1 this variable indicates that
 #                             the source ipk should contain extra files
 #                             such as the README file and recipe.
@@ -51,7 +51,7 @@ SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
 SRCIPK_SRC_DIR ?= "${S}"
 
 # Default PACKAGE_ARCH for sources is "all"
-SRCIPK_PACKAGE_ARCH ?= "all"
+SRCIPK_PACKAGE_ARCH ?= "${PACKAGE_ARCH}"
 
 # Default section matches the recipe section
 SRCIPK_SECTION ?= "${SECTION}"
diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 91b1d48..0940e0d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -96,7 +96,6 @@ SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module = "board-support/extra-drivers/${PN}-
 
 CREATE_SRCIPK_pn-omap3-sgx-modules = "1"
 SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules = "board-support/extra-drivers/sgx-modules-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-omap3-sgx-modules = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
@@ -114,109 +113,85 @@ CREATE_SRCIPK_pn-u-boot = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot = "board-support/u-boot-${PV}"
 # For beagleboard we use the git version which doesn't define UVER
 SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard = "board-support/${P}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-x-load = "1"
 SRCIPK_INSTALL_DIR_pn-x-load = "board-support/x-load-${XVER}-psp${PSPREL}"
 # For beagleboard we use the git version which doesn't define XVER
 SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
-SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-u-boot-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging = "board-support/u-boot-${PV}${UBOOT_LOCALVERSION}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging = "true"
 
 CREATE_SRCIPK_pn-u-boot-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-keystone = "board-support/u-boot-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-keystone = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
 
 CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-dra7xx = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-u-boot-am180x = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am180x = "board-support/u-boot-${UVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-am180x = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-u-boot-am37x = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am37x = "board-support/u-boot-${UVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-am37x = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-u-boot-am33x = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am33x = "board-support/u-boot-${UVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-am33x = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-u-boot-am3517 = "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-am3517 = "board-support/u-boot-${UVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-u-boot-am3517 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PACKAGE_ARCH_pn-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
 SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging = "true"
 
 CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PACKAGE_ARCH_pn-sitara-linux-ti-staging = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
 SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging = "true"
 SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging = "400"
 
 CREATE_SRCIPK_pn-linux-keystone = "1"
 SRCIPK_INSTALL_DIR_pn-linux-keystone = "board-support/linux-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-linux-keystone = "${MACHINE_ARCH}"
 SRCIPK_PRESERVE_GIT_pn-linux-keystone = "true"
 
 CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-linux-omapl138-psp = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-omap-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap-psp = "board-support/linux-${KVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-linux-omap-psp = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-am335x-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-am335x-psp = "board-support/linux-${KVER}"
-SRCIPK_PACKAGE_ARCH_pn-linux-am335x-psp = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-omap = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap = "board-support/linux-${PV}-${PR}"
-SRCIPK_PACKAGE_ARCH_pn-linux-omap = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux = "1"
 SRCIPK_INSTALL_DIR_pn-linux = "board-support/linux-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-linux = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-omap4 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-linux-omap4 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-davinci = "1"
 SRCIPK_INSTALL_DIR_pn-linux-davinci = "board-support/linux-${KVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-linux-davinci = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-omapl1 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-cryptodev-module = "1"
 SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-cryptodev-module = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-cmem-mod = "1"
 SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-cmem-mod = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-debugss-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-debugss-module-drv = "board-support/extra-drivers/${PN}-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-debugss-module-drv = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-gdbserverproxy-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/${PN}-${PV}"
-SRCIPK_PACKAGE_ARCH_pn-gdbserverproxy-module-drv = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
@@ -229,163 +204,123 @@ SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 = "example-applications/lin
 
 CREATE_SRCIPK_pn-ti-framework-components = "1"
 SRCIPK_INSTALL_DIR_pn-ti-framework-components = "component-sources/framework_components_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-framework-components = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codec-engine = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codec-engine = "component-sources/codec_engine_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codec-engine = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-omap3530 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 = "codecs-omap3530_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-omap3530 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-linuxutils = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linuxutils = "component-sources/linuxutils_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-linuxutils = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-xdctools = "1"
 SRCIPK_INSTALL_DIR_pn-ti-xdctools = "component-sources/xdctools_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-xdctools = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dmai = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dmai = "dmai_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dmai = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-xdais = "1"
 SRCIPK_INSTALL_DIR_pn-ti-xdais = "component-sources/xdais_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-xdais = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-local-power-manager = "1"
 SRCIPK_INSTALL_DIR_pn-ti-local-power-manager = "local-power-manager_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-local-power-manager = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-dm355 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 = "codecs-dm355_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm355 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dvsdk-demos = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos = "dvsdk-demos_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dvsdk-demos = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dvtb = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dvtb = "dvtb_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dvtb = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-dm365 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 = "codecs-dm365_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm365 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dm365mm-module = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module = "dm365mm-module_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dm365mm-module = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-dm6446 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 = "codecs-dm6446_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm6446 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-dm6467 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 = "codecs-dm6467_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-dm6467 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-omapl137 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 = "codecs-omapl137_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-omapl137 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-codecs-omapl138 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 = "codecs-omapl138_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-codecs-omapl138 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-cgt6x = "1"
 SRCIPK_INSTALL_DIR_pn-ti-cgt6x = "dsp-devkit/cgt6x_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-cgt6x = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-cgt470 = "1"
 SRCIPK_INSTALL_DIR_pn-ti-cgt470 = "media-controller-devkit/cgt470_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-cgt470 = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dspbios = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dspbios = "dspbios_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dspbios = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-sysbios = "1"
 SRCIPK_INSTALL_DIR_pn-ti-sysbios = "component-sources/bios_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-sysbios = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-biosutils = "1"
 SRCIPK_INSTALL_DIR_pn-ti-biosutils = "biosutils_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-biosutils = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dsplink = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dsplink = "dsplink_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dsplink = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-syslink = "1"
 SRCIPK_INSTALL_DIR_pn-ti-syslink = "component-sources/syslink_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-syslink = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-edma3lld = "1"
 SRCIPK_INSTALL_DIR_pn-ti-edma3lld = "component-sources/edma3lld_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-edma3lld = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-c6accel = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c6accel = "component-sources/c6accel_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-c6accel = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-biospsp = "1"
 SRCIPK_INSTALL_DIR_pn-ti-biospsp = "biospsp_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-biospsp = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-audio-soc-example = "1"
 SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example = "audio-soc-example_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-audio-soc-example = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-c6run = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c6run = "component-sources/c6run_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-c6run = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-osal = "1"
 SRCIPK_INSTALL_DIR_pn-ti-osal = "component-sources/osal_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-osal = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-ipc = "1"
 SRCIPK_INSTALL_DIR_pn-ti-ipc = "component-sources/ipc_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-ipc = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-dsp-benchmark = "1"
 SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark = "example-applications/dsp-benchmark_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-dsp-benchmark = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-gstreamer-ti = "1"
 SRCIPK_INSTALL_DIR_pn-gstreamer-ti = "gstreamer-ti_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-gstreamer-ti = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-omx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-omx = "component-sources/omx_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-omx = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-uia = "1"
 SRCIPK_INSTALL_DIR_pn-ti-uia = "component-sources/uia_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-uia = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-media-controller-utils = "1"
 SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils = "board-support/media-controller-utils_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-media-controller-utils = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-firmware-dm816x = "1"
 SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x = "board-support/prebuilt-images/dm816x-firmware_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-firmware-dm816x = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-firmware-dm814x = "1"
 SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x = "board-support/prebuilt-images/dm814x-firmware_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-firmware-dm814x = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-slog = "1"
 SRCIPK_INSTALL_DIR_pn-ti-slog = "component-sources/slog_${PV}"
-SRCIPK_PACKAGE_ARCH_pn-ti-slog = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-c674x-aaclcdec = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV}${PVExtra}"
-SRCIPK_PACKAGE_ARCH_pn-ti-c674x-aaclcdec = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-oe-layersetup = "1"
 SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
-- 
2.2.0


