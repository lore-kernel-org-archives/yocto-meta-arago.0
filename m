Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0558052A4C
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9004140C8F;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9lBsR4v1V51U; Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 71C6940C5E;
	Sat,  3 Apr 2021 00:11:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 43D5217457A;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:17 -0400
Message-Id: <1617408644-2675-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 02/29] sourceipk, tisdk-bundle, packagegroup-*-sdk-host: rename ${PN}-src to ${PN}-source
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:43 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Arago sourceipk creates source packages to be distributed with TI-SDK. Sources
get packaged before do_configure and do_compile, so they are pristine. And
historically sourceipk named those packages as ${PN}-src.

But OE-Core also creates ${PN}-src packages these days for debugging purposes
with sources that correspond to binaries and debug symbols in ${PN}-dbg. And
therefore those sources are packaged after the build is done.

To avoid conflicts between ${PN}-src packages created for different purposes
at different stage, change sourceipk to produce ${PN}-source instead.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/classes/sourceipk.bbclass        | 22 +++----
 meta-arago-distro/classes/tisdk-bundle.bbclass     |  2 +-
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 74 +++++++++++-----------
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |  6 +-
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    | 16 ++---
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  |  4 +-
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb       | 18 +++---
 .../packagegroup-arago-tisdk-matrix-sdk-host.bb    |  6 +-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb | 12 ++--
 .../packagegroup-arago-tisdk-opencl-sdk-host.bb    |  8 +--
 .../packagegroup-arago-tisdk-qte-sdk-host.bb       |  4 +-
 11 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 3b011a9..817f5b7 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -19,7 +19,7 @@
 #                             such as the README file and recipe.
 #
 # The default installation directory for the sources is:
-#   /usr/src/${PN}-src
+#   /usr/src/${PN}-source
 #
 # By setting the SRCIPK_INSTALL_DIR this default can be changed to any
 # location desired.  When combined with the opkg -o option this allows for the
@@ -45,7 +45,7 @@
 CREATE_SRCIPK ?= "0"
 
 # Default installation prefix
-SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
+SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-source"
 
 # Directory to preserve sources until they can be installed for packaging
 SRCIPK_STAGING_DIR = "${WORKDIR}/srcipk-staging"
@@ -215,7 +215,7 @@ adjust_git() {
 
 # Create a README file that describes the contents of the source ipk
 sourceipk_create_readme() {
-    readme="$1/README.${PN}-src"
+    readme="$1/README.${PN}-source"
     touch $readme
     echo 'This package contains the patched sources for ${PN} that' >> $readme
     echo 'were used to generate the ${PN} binary ipk package(s).' >> $readme
@@ -234,7 +234,7 @@ do_create_srcipk[umask] = "022"
 
 # Create the source ipk file.  The ipk is manually created here instead
 # of using the normal ipk system because some recipes will over write
-# the PACKAGES variable.  Thus if this class added a -src package
+# the PACKAGES variable.  Thus if this class added a -source package
 # to the list of packages to be created that package would be lost.
 # See the linux kernel recipe for an example of this issue.
 sourceipk_do_create_srcipk() {
@@ -283,23 +283,23 @@ python () {
 }
 
 #Add source packages to list of packages OE knows about
-PACKAGES_DYNAMIC += "${PN}-src"
+PACKAGES_DYNAMIC += "${PN}-source"
 
 # Do not perform any QA checks on sourceipk packages
-INSANE_SKIP_${PN}-src += "${@oe.utils.conditional("${CREATE_SRCIPK}", "0", "", "${ALL_QA}", d)}"
+INSANE_SKIP_${PN}-source += "${@oe.utils.conditional("${CREATE_SRCIPK}", "0", "", "${ALL_QA}", d)}"
 
 python __anonymous () {
     if d.getVar("CREATE_SRCIPK") != "0":
-        if '${PN}-src' not in d.getVar("PACKAGES", False):
-            d.appendVar('PACKAGES', ' ${PN}-src')
+        if '${PN}-source' not in d.getVar("PACKAGES", False):
+            d.appendVar('PACKAGES', ' ${PN}-source')
         pn = d.getVar("PN")
-        d.setVar('FILES_%s-src' % (pn), '${SRCIPK_INSTALL_DIR}')
+        d.setVar('FILES_%s-source' % (pn), '${SRCIPK_INSTALL_DIR}')
 }
 
 PACKAGESPLITFUNCS_append = " ${@oe.utils.conditional('CREATE_SRCIPK','0','','populate_srcipk_package',d)}"
 populate_srcipk_package() {
-    install -d ${PKGDEST}/${PN}-src/${SRCIPK_INSTALL_DIR}
+    install -d ${PKGDEST}/${PN}-source/${SRCIPK_INSTALL_DIR}
     cp -Prf --preserve=mode,timestamps --no-preserve=ownership \
         ${SRCIPK_STAGING_DIR}/${SRCIPK_INSTALL_DIR}/. \
-        ${PKGDEST}/${PN}-src/${SRCIPK_INSTALL_DIR}
+        ${PKGDEST}/${PN}-source/${SRCIPK_INSTALL_DIR}
 }
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 7e3f4c2..4ebfb5d 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -647,7 +647,7 @@ EOF
         case "$package" in
             task-*)
                 continue ;;
-            *-src*)
+            *-source*)
                 delivered_as="Source"
                 ;;
             *)
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 46817f9..b07fea3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -7,115 +7,115 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 UTILS = " \
-    am-sysinfo-src \
-    arm-benchmarks-src \
-    oprofile-example-src \
+    am-sysinfo-source \
+    arm-benchmarks-source \
+    oprofile-example-source \
 "
 
 # ti-pru-sw-edma-driver is currently broken
 # Add pru and profibus sources for omapl138 devices
 #UTILS_append_omapl138 = " \
-#    ti-pru-sw-examples-src \
+#    ti-pru-sw-examples-source \
 #"
 
 UTILS_append_omap-a15 = " \
-    omapconf-src \
-    pru-icss-src \
+    omapconf-source \
+    pru-icss-source \
 "
 
 UTILS_append_ti33x = " \
-    omapconf-src \
-    pru-icss-src \
+    omapconf-source \
+    pru-icss-source \
 "
 
 UTILS_append_ti43x = " \
-    pru-icss-src \
+    pru-icss-source \
 "
 
 UTILS_append_k2g = " \
-    pru-icss-src \
+    pru-icss-source \
 "
 
 UTILS_append_k3 = " \
-    jailhouse-src \
+    jailhouse-source \
     ti-sci-fw-source \
-    trusted-firmware-a-src \
+    trusted-firmware-a-source \
 "
 
 UTILS_append_j7-evm = " \
-    pru-icss-src \
+    pru-icss-source \
 "
 
 UTILS_append_j7-hs-evm = " \
-    pru-icss-src \
+    pru-icss-source \
 "
 
 UTILS_append_am65xx = " \
-    pru-icss-src \
+    pru-icss-source \
 "
 
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
-    cmem-mod-src \
-    uio-module-drv-src \
-    big-data-ipc-demo-linux-src \
+    cmem-mod-source \
+    uio-module-drv-source \
+    big-data-ipc-demo-linux-source \
 "
 
 #EXTRA_LIBS_append_dra7xx = " \
-#    debugss-module-drv-src \
-#    gdbserverproxy-module-drv-src \
+#    debugss-module-drv-source \
+#    gdbserverproxy-module-drv-source \
 #"
 
 EXTRA_LIBS_append_ti33x = " \
-    uio-module-drv-src \
+    uio-module-drv-source \
 "
 
 EXTRA_LIBS_append_ti43x = " \
-    cmem-mod-src \
-    uio-module-drv-src \
+    cmem-mod-source \
+    uio-module-drv-source \
 "
 
 # Disable ipsecmgr due to libnl and xfrm conflict
-#    ipsecmgr-mod-src
+#    ipsecmgr-mod-source
 # Disable hplib-mod-srv due to K4.14 breakage
-#    hplib-mod-src
+#    hplib-mod-source
 EXTRA_LIBS_append_keystone = " \
-    cmem-mod-src \
-    uio-module-drv-src \
+    cmem-mod-source \
+    uio-module-drv-source \
 "
 
 #EXTRA_LIBS_append_k2hk = " \
-#    debugss-module-drv-src \
-#    gdbserverproxy-module-drv-src \
+#    debugss-module-drv-source \
+#    gdbserverproxy-module-drv-source \
 #"
 
 #EXTRA_LIBS_append_k2l = " \
-#    debugss-module-drv-src \
-#    gdbserverproxy-module-drv-src \
+#    debugss-module-drv-source \
+#    gdbserverproxy-module-drv-source \
 #"
 
 #EXTRA_LIBS_append_k2e = " \
-#    debugss-module-drv-src \
-#    gdbserverproxy-module-drv-src \
+#    debugss-module-drv-source \
+#    gdbserverproxy-module-drv-source \
 #"
 
 EXTRA_PACKAGES = ""
 
 EXTRA_PACKAGES_append_omap-a15 = " \
-    pdm-anomaly-detection-src \
+    pdm-anomaly-detection-source \
 "
 
 EXTRA_PACKAGES_append_ti33x = " \
-    pdm-anomaly-detection-src \
+    pdm-anomaly-detection-source \
 "
 
 EXTRA_PACKAGES_append_ti43x = " \
-    pdm-anomaly-detection-src \
+    pdm-anomaly-detection-source \
 "
 
 EXTRA_PACKAGES_append_am65xx = " \
-    pdm-anomaly-detection-src \
+    pdm-anomaly-detection-source \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index ebe129b..954fb9d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -9,14 +9,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 # Choose the kernel and u-boot recipe sources to use
-UBOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
-KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
+UBOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-source"
+KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-source"
 
 KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}"
 KERNEL_SHADOW_CLONE_ENABLED := "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHADOW_CLONE}}"
 
 BOOT_MONITOR = ""
-BOOT_MONITOR_keystone = "boot-monitor-src"
+BOOT_MONITOR_keystone = "boot-monitor-source"
 
 EXTRA_FILES = ""
 EXTRA_FILES_ti43x = "tisdk-uenv"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 14c06e9..33c37cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -8,15 +8,15 @@ inherit packagegroup
 
 CRYPTO_RDEPENDS = ""
 
-#CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
-#CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
-#CRYPTO_RDEPENDS_append_keystone = " ti-crypto-examples-src"
+#CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-source"
+#CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-source"
+#CRYPTO_RDEPENDS_append_keystone = " ti-crypto-examples-source"
 
-CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_keystone = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_k3 = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-source"
+CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-source"
+CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-source"
+CRYPTO_RDEPENDS_append_keystone = " cryptodev-module-source"
+CRYPTO_RDEPENDS_append_k3 = " cryptodev-module-source"
 
 RDEPENDS_${PN} = "\
     ${CRYPTO_RDEPENDS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 6ae773d..683a9b6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -9,6 +9,6 @@ inherit packagegroup features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 RDEPENDS_${PN} = "\
-    ${PREFERRED_PROVIDER_virtual/gpudriver}-src \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-driver-src', '', d)} \
+    ${PREFERRED_PROVIDER_virtual/gpudriver}-source \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-driver-source', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 1eb83d1..ace7abb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -9,25 +9,25 @@ inherit packagegroup
 HMI = ""
 
 HMI_append_ti43x = " \
-    evse-hmi-src \
-    mmwavegesture-hmi-src \
+    evse-hmi-source \
+    mmwavegesture-hmi-source \
 "
 
 HMI_append_ti33x = " \
-    evse-hmi-src \
-    protection-relays-hmi-src \
-    mmwavegesture-hmi-src \
+    evse-hmi-source \
+    protection-relays-hmi-source \
+    mmwavegesture-hmi-source \
 "
 
 
 HMI_append_omap-a15 = " \
-    evse-hmi-src \
-    mmwavegesture-hmi-src \
+    evse-hmi-source \
+    mmwavegesture-hmi-source \
 "
 
 HMI_append_am65xx = " \
-    evse-hmi-src \
-    mmwavegesture-hmi-src \
+    evse-hmi-source \
+    mmwavegesture-hmi-source \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
index a4a33f2..83ffdfc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
@@ -7,11 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 MATRIX_GUI = " \
-    matrix-gui-browser-src \
-    refresh-screen-src \
+    matrix-gui-browser-source \
+    refresh-screen-source \
 "
 
 RDEPENDS_${PN} = "\
-    matrix-gui-src \
+    matrix-gui-source \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 081cc92..8baa506 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -8,7 +8,7 @@ inherit packagegroup
 
 BARCODE_PKG = ""
 #BARCODE_PKG = " \
-#    ${@['','barcode-roi-src'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
+#    ${@['','barcode-roi-source'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 #"
 
 MULTIMEDIA = ""
@@ -16,21 +16,21 @@ MULTIMEDIA = ""
 MULTIMEDIA_append_ti33x = " ${BARCODE_PKG}"
 
 MULTIMEDIA_append_ti43x = " \
-    dual-camera-demo-src \
-    image-gallery-src \
+    dual-camera-demo-source \
+    image-gallery-source \
     ${BARCODE_PKG} \
 "
 
 MULTIMEDIA_append_omap-a15 = " \
-    dual-camera-demo-src \
-    image-gallery-src \
+    dual-camera-demo-source \
+    image-gallery-source \
     ${BARCODE_PKG} \
 "
 
 MULTIMEDIA_append_am65xx = " ${BARCODE_PKG}"
 
 #MULTIMEDIA_append_dra7xx = " \
-#    ${@['','qt-opencv-opencl-opengl-multithreaded-src'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
+#    ${@['','qt-opencv-opencl-opengl-multithreaded-source'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #"
 
 MULTIMEDIA_append_keystone = " ${BARCODE_PKG}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
index f1accc0..b0aa15c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
@@ -9,16 +9,16 @@ inherit packagegroup features_check
 REQUIRED_DISTRO_FEATURES = "opencl"
 
 UTILS = " \
-    opencl-examples-src \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-examples-src')} \
+    opencl-examples-source \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-examples-source')} \
 "
 
 UTILS_append_k2hk = " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-src')} \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-source')} \
 "
 
 UTILS_append_dra7xx = " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-src')} \
+    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-source')} \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index a63bcb0..bcfa202 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -7,11 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 QT4_DEMOS = "\
-    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
+    ${@oe.utils.conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-source', '', d)} \
 "
 
 QT_DEMOS = "\
-    qt-tstat-src \
+    qt-tstat-source \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


