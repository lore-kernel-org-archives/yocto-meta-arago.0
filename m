Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 74F9352A78
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 15:24:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61FOg2l010669
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:24:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61FOgKK024310
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 10:24:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 10:24:42 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61FOceT031064;	Tue, 1 Jul 2014 10:24:40 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Jul 2014 10:24:37 -0500
Message-ID: <1404228277-7421-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Add am57xx-evm support and use dra7xx SOC_FAMILY
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
X-List-Received-Date: Tue, 01 Jul 2014 15:24:44 -0000
Content-Type: text/plain

* Update the packages and appends in meta-arago to use the dra7xx
  SOC_FAMILY and add support for the am57xx-evm machine type.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          |    4 ++--
 .../openssl/openssl_1.0.1e.bbappend                |    3 +++
 .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
 .../packagegroups/packagegroup-arago-gst.bb        |    2 +-
 .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |    2 +-
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb  |    2 +-
 .../packagegroup-arago-tisdk-crypto.bb             |    2 +-
 .../packagegroup-arago-tisdk-multimedia.bb         |    8 +++++++-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++--
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 ++--
 .../amsdk-av-files/amsdk-av-files_1.1.bb           |    2 +-
 12 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
index e855e8b..232301f 100644
--- a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 FWVER = "eng-4-gb9283b0"
 PR = "r0+${FWVER}"
 
-COMPATIBLE_MACHINE = "omap5-evm|dra7xx-evm"
+COMPATIBLE_MACHINE = "omap5-evm|dra7xx"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP_${PN} = "arch"
@@ -20,7 +20,7 @@ SRC_URI[md5sum] = "4fcba6844949ea909131684a80233800"
 SRC_URI[sha256sum] = "3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
 
 FW_FILES_omap5-evm = "tesla-dsp.xe64T ducati-m3-core0.xem3"
-FW_FILES_dra7xx-evm = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-fw.xem4 dra7-ipu2-fw.xem4"
+FW_FILES_dra7xx = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-fw.xem4 dra7-ipu2-fw.xem4"
 
 do_compile() {
     :
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
index 9b6bf00..f58edb5 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
@@ -17,12 +17,14 @@ PR_append = "-arago9"
 DEPENDS_append_ti33x_class-target = " cryptodev"
 DEPENDS_append_ti43x_class-target = " cryptodev"
 DEPENDS_append_dra7xx-evm_class-target = " cryptodev"
+DEPENDS_append_am57xx-evm_class-target = " cryptodev"
 
 python __anonymous () {
     crypdep = d.getVar("DEPENDS").replace("ocf-linux ", "")
     d.setVar("DEPENDS_ti33x_class-target", crypdep)
     d.setVar("DEPENDS_ti43x_class-target", crypdep)
     d.setVar("DEPENDS_dra7xx-evm_class-target", crypdep)
+    d.setVar("DEPENDS_am57xx-evm_class-target", crypdep)
 }
 
 CRYPTODEV_AFALG_PATCHES = " \
@@ -36,6 +38,7 @@ CRYPTODEV_AFALG_PATCHES = " \
 SRC_URI_append_ti33x_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 SRC_URI_append_ti43x_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 SRC_URI_append_dra7xx-evm_class-target = "${CRYPTODEV_AFALG_PATCHES}"
+SRC_URI_append_am57xx-evm_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 
 # Override do_configure to replace target with linux-armv4 to enable ASM code
 # optimization for ARM arch (including armv7) for extra performance
diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index c38e277..2932714 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -19,7 +19,7 @@ TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl2
 DTB_FILTER = "unknown"
 DTB_FILTER_ti33x = "am335x"
 DTB_FILTER_omap5-evm = "omap5"
-DTB_FILTER_dra7xx-evm = "dra7"
+DTB_FILTER_dra7xx = "dra7"
 DTB_FILTER_ti43x = "am43"
 DTB_FILTER_keystone = "k2hk"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 9e35f26..03a04c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -16,7 +16,7 @@ GSTREAMER = " \
 
 GSTREAMER_ACCEL_MM = ""
 GSTREAMER_ACCEL_MM_omap-a15 = "gst-plugins-ducati"
-GSTREAMER_ACCEL_MM_append_dra7xx-evm = " gst-plugins-vpe"
+GSTREAMER_ACCEL_MM_append_dra7xx = " gst-plugins-vpe"
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index b8b85a0..54d44e1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -22,6 +22,7 @@ ARAGO_TEST = "\
     yavta \
     "
 
+ARAGO_TI_TEST_am57xx-evm = ""
 ARAGO_TI_TEST = "\
     ltp-ddt \
     input-utils \
@@ -36,7 +37,7 @@ ARAGO_TI_TEST_append_omap-a15 = " \
     bvtest \
     "
 
-ARAGO_TI_TEST_append_dra7xx-evm = " \
+ARAGO_TI_TEST_append_dra7xx = " \
     vpe-vpdma \
     "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index bb406d7..492e174 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -13,7 +13,7 @@ CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
 
 CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_dra7xx-evm = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index fa14649..b3df987 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -10,7 +10,7 @@ CRYPTO_API = "ocf-linux-dev"
 
 CRYPTO_API_ti33x = "cryptodev-module-dev"
 CRYPTO_API_ti43x = "cryptodev-module-dev"
-CRYPTO_API_dra7xx-evm = "cryptodev-module-dev"
+CRYPTO_API_dra7xx = "cryptodev-module-dev"
 
 RDEPENDS_${PN} = "\
     openssl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index e6b6ec4..53a914b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -17,7 +17,7 @@ CRYPTO_SUPPORT = "\
 
 CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_dra7xx-evm = " ti-crypto-examples cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples cryptodev-module cryptodev-tests"
 
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index ab88609..b044f58 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -39,10 +39,16 @@ MULTIMEDIA_append_am3517-evm = " \
 "
 
 ACCEL_FW = ""
-ACCEL_FW_append_omap-a15 = " \
+ACCEL_FW_append_am57xx-evm = " \
     ipumm-fw \
     "
+
+ACCEL_FW_append_omap5-evm = " \
+    ipumm-fw \
+    "
+
 ACCEL_FW_append_dra7xx-evm = " \
+    ipumm-fw \
     dspdce-fw \
     vis \
     "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index ab4244c..749fb72 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -80,7 +80,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            cryptodev \
 "
 
-MAKEFILES_append_dra7xx-evm = " cryptodev"
+MAKEFILES_append_dra7xx = " cryptodev"
 
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
@@ -101,7 +101,7 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
 KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
 
 # This step will stitch together the final Makefile based on the supported
 # make targets.
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 698749c..92fc916 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -11,7 +11,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 S = "${WORKDIR}/git/cryptos_apps_scripts"
 S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
 S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
-S_dra7xx-evm = "${WORKDIR}/git/cryptos_apps_program"
+S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
 
 SRC_URI += "file://0001-openssl_perf.sh-remove-module-manipulation.patch;striplevel=2"
 
@@ -22,4 +22,4 @@ RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
 
 RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
 RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
-RDEPENDS_${PN}_append_dra7xx-evm = " ti-crypto-examples"
+RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
index 553ead5..e23fdf3 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.1.bb
@@ -14,7 +14,7 @@ VIDEO_FILES_append_beagleboard = "video_vga"
 VIDEO_FILES_append_am3517-evm  = "video_wqvga"
 VIDEO_FILES_append_am335x-evm  = "video_wvga \
 				                  video_wqvga"
-VIDEO_FILES_append_dra7xx-evm  = "video_wvga"
+VIDEO_FILES_append_dra7xx  = "video_wvga"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/564/5179/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
 
-- 
1.7.9.5


