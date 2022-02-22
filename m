Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.9108.1645504914236877860
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EBF840CAA
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wF8GhluOWWuI for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 72CA240C24
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 34B6417476D
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 02/23] recipes: remove deprecated old platforms
Date: Tue, 22 Feb 2022 04:41:30 +0000
Message-Id: <20220222044151.2844138-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Specific recipes and overrides in shared recipes were removed for these:
OMAP3/4/5
AM35xx/AM37xx
Keystone2/K2HK/K2E/K2L/K2G

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/tisdk-bundle.bbclass              |  26 +---
 meta-arago-distro/conf/distro/arago.conf      |  16 --
 .../conf/distro/include/arago-prefs.inc       |  11 --
 .../conf/distro/include/arago-source-ipk.inc  |  27 ----
 .../distro/include/branding-processor-sdk.inc |   3 -
 .../recipes-bsp/hplib/hplib-mod_git.bbappend  |   3 -
 .../k2-fw-initrd/k2-fw-initrd_0.0.7.bb        |  43 ------
 .../netboot-initrd/files/init-netboot.sh      | 140 ------------------
 .../netboot-initrd-scripts_0.0.1.bb           |  13 --
 .../netboot-initrd/netboot-initrd_0.0.1.bb    |  47 ------
 .../recipes-core/images/tisdk-core-bundle.bb  |   5 -
 .../recipes-core/images/tisdk-core-bundle.inc |  10 +-
 .../images/tisdk-default-image.bb             |   1 -
 ...kagegroup-arago-base-tisdk-server-extra.bb |  80 ----------
 .../packagegroups/packagegroup-arago-base.bb  |   4 -
 .../packagegroup-arago-gst-sdk-target.bb      |   5 -
 .../packagegroups/packagegroup-arago-gst.bb   |   5 -
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  28 ----
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 134 -----------------
 .../packagegroup-arago-tisdk-addons.bb        |  29 ----
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |   4 -
 ...ackagegroup-arago-tisdk-crypto-sdk-host.bb |   5 -
 ...kagegroup-arago-tisdk-crypto-sdk-target.bb |   1 -
 .../packagegroup-arago-tisdk-crypto.bb        |   1 -
 .../packagegroup-arago-tisdk-matrix.bb        |   6 -
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |   2 -
 ...group-arago-tisdk-multimedia-sdk-target.bb |   6 -
 .../packagegroup-arago-tisdk-multimedia.bb    |   4 -
 ...ackagegroup-arago-tisdk-opencl-sdk-host.bb |   4 -
 ...kagegroup-arago-tisdk-opencl-sdk-target.bb |   4 -
 .../packagegroup-arago-tisdk-opencl.bb        |   5 -
 .../packagegroup-arago-tisdk-recoveryfs.bb    |  21 ---
 ...ckagegroup-arago-toolchain-tisdk-target.bb |   1 -
 .../packagegroups/ti-analytics.bb             |   1 -
 .../recipes-core/packagegroups/ti-test.bb     |  79 ----------
 .../recipes-tisdk/parse-ip/parse-ip.bb        |   2 +-
 .../ti-tisdk-makefile/Makefile_ipsecmgr-mod   |  28 ----
 .../ti-tisdk-makefile/Makefile_pru-icss       |  13 --
 .../ti-tisdk-makefile_1.0.bb                  |  48 ------
 .../ti-tisdk-setup/ti-tisdk-setup.bb          |   7 -
 meta-arago-extras/conf/layer.conf             |   1 -
 .../big-data-ipc-demo/big-data-ipc-demo.inc   |  11 +-
 .../posix-smp-demo/posix-smp-demo.inc         |  20 ---
 .../posix-smp-demo/posix-smp-demo_git.bb      |  16 --
 .../matrix/matrix-gui-3d-demos_2.0.bb         |   2 +-
 .../matrix-gui-armbenchmarks-demos_2.0.bb     |   2 +-
 .../matrix/matrix-gui-crypto-demos_2.0.bb     |   6 -
 .../matrix/matrix-gui-utility-demos_2.0.bb    |   2 -
 .../flash-utility-1.6.0.0/LICENSE             |  63 --------
 .../flash-utility/flash-utility_1.6.0.0.bb    |  35 -----
 .../pinmux-utility/pinmux-utility_2.5.2.0.bb  |   2 +-
 .../recovery-kernel/recovery-kernel_1.0.bb    |  46 ------
 .../amsdk-av-files/amsdk-av-files_1.4.bb      |   6 -
 .../av-examples/av-examples_1.0.bb            |  34 -----
 .../demo-image-proc/demo-image-proc_git.bb    |  26 ----
 .../gstreamer1.0-plugins-dsp66_git.bb         |   2 +-
 .../gstreamer1.0-plugins-hevc_git.bb          |   2 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb  |   2 +-
 .../crash-recovery/crash-recovery.bb          |  19 ---
 .../crash-recovery/files/recoveryfs.sh        |  44 ------
 .../ipsecmgr/ipsecmgr-mod_git.bb              |  22 ---
 .../recipes-support/ipsecmgr/ipsecmgr.inc     |   6 -
 .../recipes-support/ipsecmgr/ipsecmgr_git.bb  |  35 -----
 .../libnl-xfrm/libnl-xfrm_git.bb              |  44 ------
 .../recipes-ti/fftlib/fftlib_git.bb           |   3 +-
 .../recipes-ti/fftlib/ti-fftw_git.bb          |   3 +-
 .../recipes-ti/libarch/libarch.inc            |   3 +-
 .../recipes-ti/linalg/linalg.inc              |   2 +-
 .../recipes-ti/linalg/linalg_git.bb           |   2 -
 .../recipes-ti/netapi/netapi-test_git.bb      |  51 -------
 .../recipes-ti/netapi/netapi.inc              |  33 -----
 .../recipes-ti/netapi/netapi_git.bb           |  32 ----
 ...ondition-during-DSP-firmware-booting.patch |  38 -----
 .../recipes-ti/ocl/opencl-examples_git.bb     |   4 +-
 .../recipes-ti/ocl/opencl-monitor_git.bb      |  47 +-----
 .../recipes-ti/ocl/opencl_git.bb              |  11 +-
 76 files changed, 18 insertions(+), 1531 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bba=
ppend
 delete mode 100644 meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-init=
rd_0.0.7.bb
 delete mode 100644 meta-arago-distro/recipes-bsp/netboot-initrd/files/in=
it-netboot.sh
 delete mode 100644 meta-arago-distro/recipes-bsp/netboot-initrd/netboot-=
initrd-scripts_0.0.1.bb
 delete mode 100644 meta-arago-distro/recipes-bsp/netboot-initrd/netboot-=
initrd_0.0.1.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-recoveryfs.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ipsecmgr-mod
 delete mode 100644 meta-arago-extras/recipes-apps/posix-smp-demo/posix-s=
mp-demo.inc
 delete mode 100644 meta-arago-extras/recipes-apps/posix-smp-demo/posix-s=
mp-demo_git.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/flash-utility/flas=
h-utility-1.6.0.0/LICENSE
 delete mode 100644 meta-arago-extras/recipes-devtools/flash-utility/flas=
h-utility_1.6.0.0.bb
 delete mode 100644 meta-arago-extras/recipes-kernel/recovery-kernel/reco=
very-kernel_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/av-examples/av-e=
xamples_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/demo-image-proc/=
demo-image-proc_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/crash-recovery/cras=
h-recovery.bb
 delete mode 100755 meta-arago-extras/recipes-support/crash-recovery/file=
s/recoveryfs.sh
 delete mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-m=
od_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.i=
nc
 delete mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_g=
it.bb
 delete mode 100644 meta-arago-extras/recipes-support/libnl-xfrm/libnl-xf=
rm_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/netapi/netapi-test_git.b=
b
 delete mode 100644 meta-arago-extras/recipes-ti/netapi/netapi.inc
 delete mode 100644 meta-arago-extras/recipes-ti/netapi/netapi_git.bb
 delete mode 100644 meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-r=
ace-condition-during-DSP-firmware-booting.patch

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index 4ebfb5dc..ac2eb747 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -59,13 +59,7 @@ DEPLOY_IMAGES_NAME ?=3D ""
 DEPLOY_SPL_UART_NAME ?=3D "u-boot-spl.bin-${MACHINE}"
=20
 # Variable to specify the name of the TI SCI firmware
-DEPLOY_TISCI_FW_NAME ?=3D "ti-sci-firmware-k2g.bin"
-
-# Variable to specify the name of Keystone skern file (it has SOC in the=
 name, not MACHINE)
-DEPLOY_K2_SKERN_NAME ?=3D "skern-*.bin"
-
-# Variable to specify the name of Keystone initramfs with FW images
-DEPLOY_K2_FW_INITRD_NAME ?=3D "k2-fw-initrd.cpio.gz"
+DEPLOY_TISCI_FW_NAME ?=3D ""
=20
 # Manifest file location which will be created as part of the image buil=
d
 # process.
@@ -865,24 +859,6 @@ tisdk_image_build () {
         fi
     fi
=20
-    # Copy skern/boot-monitor image if it exists
-    if [ "${DEPLOY_K2_SKERN_NAME}" !=3D "" ]
-    then
-        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME} ]
-        then
-            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME} ${prebuilt_di=
r}/
-        fi
-    fi
-
-    # Copy Keystone FW initramfs image if it exists
-    if [ "${DEPLOY_K2_FW_INITRD_NAME}" !=3D "" ]
-    then
-        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME} ]
-        then
-            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME} ${prebuil=
t_dir}/
-        fi
-    fi
-
     # Add the EXTRA_TISDK_FILES contents if they exist
     # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
     # copy the root directory.
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index ed067a38..35741ea9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -56,22 +56,6 @@ KERNEL_IMAGETYPES_am64xx-hs-evm =3D "Image fitImage"
 KERNEL_IMAGETYPES_j7-hs-evm =3D "Image fitImage"
 KERNEL_IMAGETYPES_j7200-hs-evm =3D "Image fitImage"
=20
-KERNEL_IMAGETYPES_k2e-hs-evm =3D "zImage fitImage"
-INITRAMFS_IMAGE_k2e-hs-evm =3D "k2-fw-initrd"
-INITRAMFS_FSTYPES_k2e-hs-evm =3D "cpio.gz"
-
-KERNEL_IMAGETYPES_k2hk-hs-evm =3D "zImage fitImage"
-INITRAMFS_IMAGE_k2hk-hs-evm =3D "k2-fw-initrd"
-INITRAMFS_FSTYPES_k2hk-hs-evm =3D "cpio.gz"
-
-KERNEL_IMAGETYPES_k2g-hs-evm =3D "zImage fitImage"
-INITRAMFS_IMAGE_k2g-hs-evm =3D "k2-fw-initrd"
-INITRAMFS_FSTYPES_k2g-hs-evm =3D "cpio.gz"
-
-KERNEL_IMAGETYPES_k2l-hs-evm =3D "zImage fitImage"
-INITRAMFS_IMAGE_k2l-hs-evm =3D "k2-fw-initrd"
-INITRAMFS_FSTYPES_k2l-hs-evm =3D "cpio.gz"
-
 # Extra boot files for WIC images
 do_image_wic[depends] +=3D "tisdk-uenv:do_deploy"
 IMAGE_BOOT_FILES +=3D "uEnv.txt"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index a356c76c..2bf9f103 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -21,15 +21,6 @@ PREFERRED_PROVIDER_virtual/libgles2_j7 =3D "ti-img-rog=
ue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm_j7 =3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver_j7 =3D "ti-img-rogue-driver"
=20
-# This is required when using keystone devices with graphical support
-# such as Qt5
-PREFERRED_PROVIDER_virtual/egl_keystone =3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles1_keystone =3D "mesa"
-PREFERRED_PROVIDER_virtual/libgles2_keystone =3D "mesa"
-PREFERRED_PROVIDER_virtual/libgbm_keystone =3D "mesa"
-PREFERRED_PROVIDER_virtual/libgl_keystone =3D "mesa"
-PREFERRED_PROVIDER_virtual/mesa_keystone =3D "mesa"
-
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging${ARAGO_KERNEL_SU=
FFIX}"
=20
 # For TI devices with only baremetal/TI RTOS support
@@ -43,8 +34,6 @@ PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"
 PREFERRED_VERSION_crda =3D "3.18"
 PREFERRED_VERSION_obex =3D "0.34"
=20
-PREFERRED_PROVIDER_libnl-xfrm =3D "libnl"
-
 PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-supplicant"
 #PREFERRED_PROVIDER_wpa-supplicant_ti33x =3D "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant_ti43x =3D "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b=
/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index d4122339..22484cf4 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -109,9 +109,6 @@ SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?=3D "exampl=
e-applications/pru-${PV}"
 CREATE_SRCIPK_pn-ti-ocf-crypto-module ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?=3D "board-support/extra-dri=
vers/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-omap3-sgx-modules ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules ?=3D "board-support/extra-driver=
s/sgx-modules-${PV}"
-
 CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
=20
@@ -126,22 +123,11 @@ SRCIPK_INSTALL_DIR_pn-av-examples ?=3D "example-app=
lications/av-examples-${PV}"
=20
 CREATE_SRCIPK_pn-u-boot ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-u-boot ?=3D "board-support/u-boot-${PV}"
-# For beagleboard we use the git version which doesn't define UVER
-SRCIPK_INSTALL_DIR_pn-u-boot_beagleboard ?=3D "board-support/${P}"
-
-CREATE_SRCIPK_pn-x-load ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-x-load ?=3D "board-support/x-load-${XVER}-psp${PSP=
REL}"
-# For beagleboard we use the git version which doesn't define XVER
-SRCIPK_INSTALL_DIR_pn-x-load_beagleboard ?=3D "board-support/${P}"
=20
 CREATE_SRCIPK_pn-u-boot-ti-staging ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}=
${UBOOT_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?=3D "true"
=20
-CREATE_SRCIPK_pn-u-boot-keystone ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-keystone ?=3D "board-support/u-boot-${PV}"
-SRCIPK_PRESERVE_GIT_pn-u-boot-keystone ?=3D "true"
-
 CREATE_SRCIPK_pn-u-boot-dra7xx ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${P=
R}"
=20
@@ -170,10 +156,6 @@ SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging ?=3D =
"true"
 SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging ?=3D "true"
 SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging ?=3D "400"
=20
-CREATE_SRCIPK_pn-linux-keystone ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-keystone ?=3D "board-support/linux-${PV}"
-SRCIPK_PRESERVE_GIT_pn-linux-keystone ?=3D "true"
-
 CREATE_SRCIPK_pn-linux-am335x-psp ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}=
"
=20
@@ -215,18 +197,12 @@ SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?=3D=
 "example-applications/linux-dr
 CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
=20
-CREATE_SRCIPK_pn-ti-linux-driver-examples-omap3 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omap3 ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
-
 CREATE_SRCIPK_pn-ti-framework-components ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-ti-framework-components ?=3D "component-sources/fr=
amework_components_${PV}"
=20
 CREATE_SRCIPK_pn-ti-codec-engine ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?=3D "component-sources/codec_engi=
ne_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-omap3530 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omap3530 ?=3D "codecs-omap3530_${PV}"
-
 CREATE_SRCIPK_pn-ti-linuxutils ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?=3D "component-sources/linuxutils_$=
{PV}"
=20
@@ -373,9 +349,6 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod ?=3D "board-support/e=
xtra-drivers/${PN}-${PV}"
 CREATE_SRCIPK_pn-uio-module-drv ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-uio-module-drv ?=3D "board-support/extra-drivers/$=
{PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ipsecmgr-mod ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod ?=3D "board-support/extra-drivers/${P=
N}-${PV}"
-
 CREATE_SRCIPK_pn-pru-icss ?=3D "1"
 SRCIPK_INSTALL_DIR_pn-pru-icss ?=3D "example-applications/${PN}-${PV}"
=20
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk=
.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index cd79078e..166e259a 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -32,6 +32,3 @@ SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging =3D "400"
=20
 SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging =3D "processor-sdk-local"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_=
MESSAGE}"
-
-# Temporarily disable UBI images for K2 "server" rootfs due to size
-IMAGE_FSTYPES_remove_pn-tisdk-server-rootfs-image =3D "ubi ubifs"
diff --git a/meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend b=
/meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend
deleted file mode 100644
index ac946dbe..00000000
--- a/meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append =3D ".arago0"
-
-SRCIPK_SRC_DIR =3D "${WORKDIR}/git/ti/runtime/hplib"
diff --git a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.=
7.bb b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
deleted file mode 100644
index b9eb57fe..00000000
--- a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION =3D "Prebuilt Keystone2 initramfs with SerDes, QMSS and NETC=
P PA firmware"
-
-LICENSE =3D "TI-TFL"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc5e02be633f1499c109d1652514d8=
5ec"
-
-CLEANBROKEN =3D "1"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-SRC_URI =3D "http://arago-project.org/files/releases/k2-fw/k2-initramfs-=
${PV}.tar.gz"
-
-SRC_URI[md5sum] =3D "27fb248cbfe08ed8344bdc4451067c8f"
-SRC_URI[sha256sum] =3D "beb19d685ee0d20281266726e4c2ba4b245af9450c1bd515=
5ff06d8c1656dd26"
-
-S =3D "${WORKDIR}"
-TARGET =3D "k2-fw-initrd.cpio.gz"
-TARGETM =3D "k2-fw-initrd-${MACHINE}.cpio.gz"
-
-do_install() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/${TARGET} ${D}/boot/${TARGETM}
-	ln -s ${TARGETM} ${D}/boot/${TARGET}
-}
-
-FILES_${PN} =3D "/boot"
-
-inherit deploy
-
-do_deploy() {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/${TARGET} ${DEPLOYDIR}/${TARGETM}
-	ln -s ${TARGETM} ${DEPLOYDIR}/${TARGET}
-}
-
-addtask deploy before do_build after do_compile
-
-do_image_complete() {
-	:
-}
-
-addtask image_complete after do_deploy before do_build
diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netb=
oot.sh b/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.=
sh
deleted file mode 100644
index 2d8792bd..00000000
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/files/init-netboot.sh
+++ /dev/null
@@ -1,140 +0,0 @@
-#!/bin/sh
-
-export PATH=3D$PATH:/sbin:/usr/sbin
-
-early_setup() {
-    mkdir -p /proc /sys /tmp /run
-    mount -t proc proc /proc
-    mount -t sysfs sysfs /sys
-    mount -t devtmpfs none /dev
-}
-
-beginswith() { case $2 in "$1"*) true;; *) false;; esac; }
-
-read_args() {
-    for arg in $2; do
-        if beginswith "$1=3D" $arg ; then
-		optarg=3D`expr "x$arg" : 'x[^=3D]*=3D\(.*\)'`
-		echo  $optarg
-		break
-	fi
-    done
-}
-
-parse_server_info() {
-    info=3D$1
-    ip=3D$(echo $info | cut -s -d':' -f1 )
-    info=3D${info#$ip:}
-    path=3D$(echo $info | cut -d',' -f1 )
-    info=3D${info#$path}
-    options=3D${info#,}
-
-    eval "$2=3D$ip"
-    eval "$3=3D$path"
-    eval "$4=3D$options"
-}
-
-do_dhcp() {
-	if [ "$1" !=3D "" ] ; then
-		udhcpc -i $1
-	else
-		udhcpc
-	fi
-}
-
-configure_eth_dev() {
-	conf=3D$1
-
-	client_ip=3D$(echo $conf | cut -s -d':' -f 1)
-	server_ip=3D$(echo $conf | cut -s -d':' -f 2)
-	gw_ip=3D$(echo $conf | cut -s -d':' -f 3)
-	netmask=3D$(echo $conf | cut -s -d':' -f 4)
-	hostname=3D$(echo $conf | cut -s -d':' -f 5)
-	device=3D$(echo $conf | cut -s -d':' -f 6)
-	autoconf=3D$(echo $conf | cut -s -d':' -f 7)
-	dns0_ip=3D$(echo $conf | cut -s -d':' -f 8)
-	dns1_ip=3D$(echo $conf | cut -s -d':' -f 9)
-
-	if [ "$device" =3D=3D "" ]; then
-		device=3D"eth0";
-	fi
-
-	echo waiting for device $device to come up
-	while [ -z "$(ip link show $device 2> /dev/null)" ] ; do
-		echo .;
-		sleep 1
-	done
-	echo done
-
-
-	ip link set $device up
-	echo waiting establishment of link on $device
-	while [ -z "$(ip link show $device | grep '<*LOWER_UP*>')" ] ; do
-		echo .;
-		sleep 1
-	done
-	echo done
-
-	#handle the case 'ip=3Ddhcp'
-	if [ "$conf" =3D=3D "dhcp" ] ; then
-		do_dhcp
-		return $?
-	fi
-
-	#handle the 'autoconf' case
-	if [ "$autoconf" =3D=3D "dhcp" ] ; then
-		do_dhcp $device
-		return $?
-	fi
-
-	if [ "$netmask" !=3D "" ]; then
-		ip addr add $client_ip/$netmask dev $device
-	else
-		ip addr add $client_ip dev $device
-	fi
-
-	if [ "$gw_ip" !=3D "" ] ; then
-		ip route add default via $gw_ip
-	fi
-	if [ "$dns0_ip" !=3D "" ] ; then
-		echo $dns0_ip >> /etc/resolv.conf
-	fi
-	if [ "$dns1_ip" !=3D "" ] ; then
-		echo $dns1_ip >> /etc/resolv.conf
-	fi
-}
-
-early_setup
-udevd --daemon
-udevadm trigger
-udevadm settle
-
-cmdline=3D$(cat /proc/cmdline)
-
-root_dev=3D$(read_args  root "$cmdline")
-server_info=3D$(read_args nfsroot "$cmdline")
-ip_info=3D$(read_args ip "$cmdline")
-
-if [ "$root_dev" !=3D "/dev/nfs" ]; then
-	echo "invalid root device. It must be /dev/nfs"
-	exit 1
-fi
-
-#
-configure_eth_dev $ip_info
-parse_server_info $server_info ip path options
-
-#default options: "nolock"
-if [ -z "$options" ] ; then
-	options=3D"nolock"
-fi
-
-#busybox mount doesn't recognize 'v3' as a valid option. replace it with=
 nfsvers=3D3
-options=3D$(echo $options | sed 's/\<v3\>/nfsvers=3D3/g')
-
-# mount NFS drive
-mkdir /newroot
-mount -t nfs -o $options $ip:$path /newroot
-
-# switch root. new root is the NFS mount
-exec switch_root /newroot /sbin/init
diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-=
scripts_0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-i=
nitrd-scripts_0.0.1.bb
deleted file mode 100644
index f1ab0d5a..00000000
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd-scripts=
_0.0.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION =3D "Simple init script that triggers udev and mount a NFS r=
oot filesystem described in kernel command line"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-SRC_URI =3D "file://init-netboot.sh"
-
-do_install() {
-        install -m 0755 ${WORKDIR}/init-netboot.sh ${D}/init
-}
-
-inherit allarch
-
-FILES_${PN} +=3D " /init "
diff --git a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_=
0.0.1.bb b/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.=
0.1.bb
deleted file mode 100644
index c774af0a..00000000
--- a/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.b=
b
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY =3D "Initramfs image for NFS boot"
-DESCRIPTION =3D "Small image capable of mounting a newtwork root filesys=
tem (NFS)"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-PR =3D "r1"
-
-inherit core-image image_types
-
-#by default include the kernel modules necessary to use a ASIX USB/Ether=
net adapter
-NETBOOT_KERNEL_MODULES ?=3D "dwc3 dwc3-omap asix xhci-plat-hcd extcon-us=
b-gpio phy-omap-usb2"
-
-export IMAGE_BASENAME =3D "netboot-initramfs"
-
-#generate an image that can be loaded by u-boot
-IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES} ${INITRAMFS_FSTYPES}.u-boot"
-
-# include udev (used to load the kernel modules)
-VIRTUAL-RUNTIME_dev_manager =3D "udev"
-
-# List of packages to install
-IMAGE_INSTALL =3D "\
-  bash \
-  busybox \
-  udev \
-  netboot-initrd-scripts\
-  "
-
-# add the required kernel modules
-IMAGE_INSTALL +=3D "${@' '.join(['kernel-module-'+x for x in d.getVar('N=
ETBOOT_KERNEL_MODULES').split()])}"
-
-# Reduce the size of the rootfs by removing features
-
-# Do not include buysbox's syslog
-BAD_RECOMMENDATIONS +=3D "busybox-syslog"
-# Do not pollute the initrd image with rootfs features
-IMAGE_FEATURES =3D ""
-# Keep extra language files from being installed
-IMAGE_LINGUAS =3D ""
-
-# To further reduce the size of the rootfs, remove the /boot directory f=
rom the final image
-# this is usually done by adding RDEPENDS_kernel-base =3D "" in the conf=
iguration file. In our case we can't use
-# this method. Instead we just wipe out the content of "/boot" before cr=
eating the image.
-ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
-empty_boot_dir () {
-	rm -rf ${IMAGE_ROOTFS}/boot/*
-}
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b=
/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 253bfbb6..636464b6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -1,11 +1,6 @@
 require tisdk-core-bundle.inc
=20
 DEPLOY_SPL_NAME_omapl138 =3D ""
-DEPLOY_SPL_NAME_k2hk =3D ""
-DEPLOY_SPL_NAME_k2l =3D ""
-DEPLOY_SPL_NAME_k2e =3D ""
-# Only unset it for HS device, as k2g GP does provide MLO/SPL
-DEPLOY_SPL_NAME_k2g-hs-evm =3D ""
 DEPLOY_SPL_NAME_k3 =3D "tispl.bin tiboot3.bin"
=20
 DEPLOY_IMAGES_NAME_k3 =3D "bl31.bin bl32.bin"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 9f0e65db..823402ad 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -7,7 +7,7 @@ IMAGE_NAME_SUFFIX =3D ""
=20
 inherit tisdk-bundle
=20
-COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap-a15|keystone|k3"
+COMPATIBLE_MACHINE =3D "omapl138|ti33x|ti43x|omap-a15|k3"
=20
 # List of packages to remove from the host package.  This is usually due=
 to
 # licensing issues and unneeded dependencies.
@@ -18,15 +18,10 @@ TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev libgnut=
ls-extra26 libgnutls-openssl2
 # picking up DTB files for devices with no DTB support.
 DTB_FILTER =3D "unknown"
 DTB_FILTER_ti33x =3D "am335x"
-DTB_FILTER_omap5-evm =3D "omap5"
 DTB_FILTER_dra7xx-evm =3D "dra7"
 DTB_FILTER_am57xx-evm =3D "am57xx"
 DTB_FILTER_am57xx-hs-evm =3D "${DTB_FILTER_am57xx-evm}"
 DTB_FILTER_ti43x =3D "am43"
-DTB_FILTER_k2hk =3D "k2hk"
-DTB_FILTER_k2l =3D "k2l"
-DTB_FILTER_k2e =3D "k2e"
-DTB_FILTER_k2g =3D "k2g"
 DTB_FILTER_omapl138 =3D "da850"
 DTB_FILTER_am65xx =3D "am65"
 DTB_FILTER_j7 =3D "j721e"
@@ -34,9 +29,6 @@ DTB_FILTER_j7 =3D "j721e"
 # List of target side images to build for the SDK
 TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image"
=20
-# dra71 lcard requires an initramfs with modules for NFS boot
-TARGET_IMAGES_append_dra7xx-evm =3D " netboot-initrd"
-
 TISDK_TOOLCHAIN =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','meta=
-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
 TOOLCHAIN_SUFFIX =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu','-ti=
sdk','-tisdk-server',d)}"
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 152f8572..efac8d44 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -30,7 +30,6 @@ export IMAGE_BASENAME =3D "tisdk-default-image"
=20
 # Disable ubi/ubifs as the filesystem requires more space than is
 # available on the HW.
-IMAGE_FSTYPES_remove_keystone =3D "ubifs ubi"
 IMAGE_FSTYPES_remove_omapl138 =3D "ubifs ubi"
=20
 # Below is the delta in packages between old fuller and a new smaller de=
fault rootfs
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-base-tisdk-server-extra.bb
index 86bef4cf..0628b630 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk-server-extra.bb
@@ -23,89 +23,9 @@ ARAGO_NDISC6 =3D "\
     ndisc6-tracert6 \
     "
=20
-# ipsecmgr has been disabled for a while
-# disable ipsecmgr-mod,hplib-mod due to K4.14 API changes
-#    ipsecmgr-mod
-#    hplib-mod
-ARAGO_TI_KEYSTONE_PKGS =3D "\
-    uio-module-drv \
-    traceframework \
-    cuia \
-    libnl-xfrm \
-    udma \
-    cuia \
-    edma3-lld \
-    srss-tc \
-    cmem \
-    cmem-mod \
-    ti-ipc \
-    mpm-transport \
-    multiprocmgr \
-    rm-lld \
-    qmss-lld \
-    pktlib \
-    cppi-lld \
-    parse-ip \
-    "
-
-# The following packages are not yet ready for k2g-evm
-#    netapi
-#    netapi-test
-#    hplib
-#    nwal-lld
-
-ARAGO_TI_PKGS =3D ""
-ARAGO_TI_PKGS_append_keystone =3D " ${ARAGO_TI_KEYSTONE_PKGS}"
-
-# Disable netapi due to libnl and xfrm conflict
-#    netapi
-#    netapi-test
-# Disable hplib,nwal-lld as hplib-mod is broken against K4.14
-#    hplib
-#    nwal-lld
-ARAGO_TI_PKGS_append_k2l =3D "\
-    dfe-lld \
-    iqn2-lld \
-    pa-lld \
-    "
-
-# Disable netapi due to libnl and xfrm conflict
-#    netapi
-#    netapi-test
-# Disable hplib,nwal-lld as hplib-mod is broken against K4.14
-#    hplib
-#    nwal-lld
-ARAGO_TI_PKGS_append_k2hk =3D "\
-    srio-lld \
-    mmap-lld \
-    hyplnk-lld \
-    aif2-lld \
-    pa-lld \
-    "
-
-# Disable netapi due to libnl and xfrm conflict
-#    netapi
-#    netapi-test
-# Disable hplib,nwal-lld as hplib-mod is broken against K4.14
-#    hplib
-#    nwal-lld
-ARAGO_TI_PKGS_append_k2e =3D "\
-    mmap-lld \
-    hyplnk-lld \
-    pa-lld \
-    "
-
-# vtun does not build against openssl 1.1
-ARAGO_VTUN =3D ""
-# vtun does not support aarch64
-ARAGO_VTUN_aarch64 =3D ""
-
-#    recovery-kernel
 RDEPENDS_${PN} =3D "\
     ${ARAGO_LIBNL} \
     ${ARAGO_NDISC6} \
-    ${ARAGO_TI_PKGS} \
-    ${ARAGO_VTUN} \
     ptpd \
     vsftpd \
     syslog-ng \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-base.bb
index 22842108..5b8bea7f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
@@ -39,10 +39,6 @@ ARAGO_EXTRA =3D "\
     docker \
 "
=20
-ARAGO_EXTRA_append_keystone =3D "\
-    k2-fw-initrd \
-"
-
 # minimal set of packages - needed to boot
 RDEPENDS_${PN} =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-ba=
se-zeroconf', '',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-gst-sdk-target.bb
index 0d6391d9..15323b0f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
@@ -23,11 +23,6 @@ GSTREAMER_DEPS_append_dra7xx =3D " \
     ${GSTREAMER_DSP} \
 "
=20
-GSTREAMER_DEPS_append_keystone =3D " \
-    gstreamer1.0-plugins-hevc-dev \
-    ${GSTREAMER_DSP} \
-"
-
 RDEPENDS_${PN} =3D " \
     ${GSTREAMER_DEPS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb
index 2679251f..e16b9878 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
@@ -26,11 +26,6 @@ GSTREAMER_DEPS_append_dra7xx =3D " \
     ${GSTREAMER_DSP} \
 "
=20
-GSTREAMER_DEPS_append_keystone =3D " \
-    gstreamer1.0-plugins-hevc \
-    ${GSTREAMER_DSP} \
-"
-
 GSTREAMER_ACCEL_MM =3D ""
 GSTREAMER_ACCEL_MM_omap-a15 =3D "${@bb.utils.contains('MACHINE_FEATURES'=
, 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
 GSTREAMER_ACCEL_MM_append_dra7xx =3D "${@bb.utils.contains('MACHINE_FEAT=
URES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-addons-sdk-host.bb
index edc6a58c..366712e8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
@@ -32,10 +32,6 @@ UTILS_append_ti43x =3D " \
     pru-icss-source \
 "
=20
-UTILS_append_k2g =3D " \
-    pru-icss-source \
-"
-
 UTILS_append_k3 =3D " \
     ti-sci-fw-source \
     trusted-firmware-a-source \
@@ -79,30 +75,6 @@ EXTRA_LIBS_append_ti43x =3D " \
     uio-module-drv-source \
 "
=20
-# Disable ipsecmgr due to libnl and xfrm conflict
-#    ipsecmgr-mod-source
-# Disable hplib-mod-srv due to K4.14 breakage
-#    hplib-mod-source
-EXTRA_LIBS_append_keystone =3D " \
-    cmem-mod-source \
-    uio-module-drv-source \
-"
-
-#EXTRA_LIBS_append_k2hk =3D " \
-#    debugss-module-drv-source \
-#    gdbserverproxy-module-drv-source \
-#"
-
-#EXTRA_LIBS_append_k2l =3D " \
-#    debugss-module-drv-source \
-#    gdbserverproxy-module-drv-source \
-#"
-
-#EXTRA_LIBS_append_k2e =3D " \
-#    debugss-module-drv-source \
-#    gdbserverproxy-module-drv-source \
-#"
-
 PDM_ANOMALY_PKG_SRC =3D "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detecti=
on-src', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 48a6cd5e..2e2801aa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -13,136 +13,12 @@ UTILS =3D " \
 	python3-numpy \
 "
=20
-UTILS_append_keystone =3D "\
-	kernel-dev \
-	libdnet-dev \
-	libdnet-staticdev \
-	binutils-dev \
-	binutils-staticdev \
-	elfutils-dev \
-	elfutils-staticdev \
-	bzip2-dev \
-	bzip2-staticdev \
-	boost-dev \
-	libsdl-dev \
-	"
-
-TI_SECURE_STORAGE_DEV =3D ""
-# All these secure storage packages need to be
-# migrated to openssl 1.1
-#	ti-softhsmv2-dev \
-#	libp11-dev \
-#	libp11-staticdev \
-#	"
-
-# Disable ipsecmgr due to libnl and xfrm conflict
-#	ipsecmgr-dev
-#	ipsecmgr-staticdev
-#	libnl-xfrm-dev
-#	libnl-xfrm-staticdev
-EXTRA_LIBS_append_keystone =3D "\
-	${TI_SECURE_STORAGE_DEV} \
-	cmem-dev \
-	cmem-staticdev \
-	udma-dev \
-	udma-staticdev \
-	traceframework-dev \
-	traceframework-staticdev \
-	cuia-dev \
-	cuia-staticdev \
-	common-csl-ip-dev \
-	cppi-lld-dev \
-	cppi-lld-staticdev \
-	qmss-lld-dev \
-	qmss-lld-staticdev \
-	rm-lld-dev \
-	rm-lld-staticdev \
-	pktlib-dev \
-	pktlib-staticdev \
-	libnl-dev \
-	libnl-staticdev \
-	multiprocmgr-dev \
-	multiprocmgr-staticdev \
-	mpm-transport-dev \
-	mpm-transport-staticdev \
-	edma3-lld-dev \
-	edma3-lld-staticdev \
-	lksctp-tools-dev \
-	lksctp-tools-staticdev \
-	ipc-transport-qmss-dev \
-	ipc-transport-qmss-staticdev \
-	"
-
-# Disable netapi due to libnl and xfrm conflict
-#	netapi-dev
-#	netapi-staticdev
-# Disable hplib-dev/staticdev,nwal-lld due to hplib-mod breakage against=
 K4.14
-#	hplib-dev
-#	hplib-staticdev
-#	nwal-lld-dev
-#	nwal-lld-staticdev
-EXTRA_LIBS_append_k2l =3D "\
-	dfe-lld-dev \
-	dfe-lld-staticdev \
-	iqn2-lld-dev \
-	iqn2-lld-staticdev \
-	pa-lld-dev \
-	pa-lld-staticdev \
-	sa-lld-dev \
-	sa-lld-staticdev \
-	"
-
-# Disable netapi due to libnl and xfrm conflict
-#	netapi-dev
-#	netapi-staticdev
-# Disable hplib-dev/staticdev,nwal-lld due to hplib-mod breakage against=
 K4.14
-#	hplib-dev
-#	hplib-staticdev
-#	nwal-lld-dev
-#	nwal-lld-staticdev
-EXTRA_LIBS_append_k2hk =3D "\
-	srio-lld-dev \
-	srio-lld-staticdev \
-	ipc-transport-srio-dev \
-	ipc-transport-srio-staticdev \
-	mmap-lld \
-	mmap-lld-staticdev \
-	hyplnk-lld-dev \
-	hyplnk-lld-staticdev \
-	aif2-lld-dev \
-	aif2-lld-staticdev \
-	pa-lld-dev \
-	pa-lld-staticdev \
-	sa-lld-dev \
-	sa-lld-staticdev \
-	"
-
-# Disable netapi due to libnl and xfrm conflict
-#	netapi-dev
-#	netapi-staticdev
-# Disable hplib-dev/staticdev,nwal-lld due to hplib-mod breakage against=
 K4.14
-#	hplib-dev
-#	hplib-staticdev
-#	nwal-lld-dev
-#	nwal-lld-staticdev
-EXTRA_LIBS_append_k2e =3D "\
-	mmap-lld \
-	mmap-lld-staticdev \
-	hyplnk-lld-dev \
-	hyplnk-lld-staticdev \
-	pa-lld-dev \
-	pa-lld-staticdev \
-	sa-lld-dev \
-	sa-lld-staticdev \
-"
-
 UTILS_append_ti33x =3D " can-utils-dev"
 UTILS_append_ti43x =3D " can-utils-dev"
 UTILS_append_dra7xx =3D " can-utils-dev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
-UTILS_append_k2g =3D " can-utils-dev"
 UTILS_append_k3 =3D "\
 	can-utils-dev \
 	ti-rpmsg-char-dev \
@@ -159,15 +35,6 @@ EXTRA_LIBS_append_dra7xx =3D " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
 "
-EXTRA_LIBS_append_k2hk =3D " libulm-staticdev \
-                               gdbserver-c6x-dev \
-"
-EXTRA_LIBS_append_k2l =3D " libulm-staticdev \
-                              gdbserver-c6x-dev \
-"
-EXTRA_LIBS_append_k2e =3D " libulm-staticdev \
-                              gdbserver-c6x-dev \
-"
=20
 PDM_ANOMALY_PKG_DEV =3D "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detecti=
on-dev', '', d)} \
@@ -205,7 +72,6 @@ IPCDEV =3D " \
 "
=20
 EXTRA_PACKAGES_append_omap-a15 =3D " ${IPCDEV}"
-EXTRA_PACKAGES_append_keystone =3D " ${IPCDEV}"
 EXTRA_PACKAGES_append_omapl138 =3D " ${IPCDEV}"
=20
 RDEPENDS_${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 5fa9141d..4e88072a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -78,39 +78,12 @@ UTILS_append_dra7xx =3D " \
                         ${@bb.utils.contains('MACHINE_FEATURES','gpu','g=
lsdk-example-apps','',d)} \
 "
=20
-UTILS_append_keystone =3D " \
-    uio-module-drv-test \
-    ti-ipc-rtos-fw \
-"
-
-UTILS_append_k2hk =3D " \
-    ${UTILS_DSP} \
-"
-
-UTILS_append_k2l =3D " \
-    ${UTILS_DSP} \
-"
-
-UTILS_append_k2e =3D " \
-    ${UTILS_DSP} \
-"
-
-UTILS_append_k2g =3D " \
-    pru-icss \
-    uio-test-pruss \
-"
-
 EXTRA_LIBS =3D ""
 EXTRA_LIBS_append_omap-a15 =3D " \
     cmem \
     uio-module-drv \
 "
=20
-EXTRA_LIBS_append_keystone =3D " \
-    cmem \
-    uio-module-drv \
-"
-
 EXTRA_LIBS_append_ti43x =3D " \
     cmem \
     uio-module-drv \
@@ -132,7 +105,6 @@ EXTRA_PACKAGES_omapl138 =3D " \
 "
=20
 EXTRA_PACKAGES_append_omap-a15 =3D " ti-ipc-examples-linux"
-EXTRA_PACKAGES_append_keystone =3D " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 =3D " ti-ipc-examples-linux"
=20
 EXTRA_PACKAGES_append_omap-a15 =3D " \
@@ -144,7 +116,6 @@ EXTRA_PACKAGES_append_am335x-evm =3D " pruss-lld-apps=
"
 EXTRA_PACKAGES_append_am437x-evm =3D " pruss-lld-apps"
 # acontis-atemsys
 EXTRA_PACKAGES_append_am57xx-evm =3D " pruss-lld-apps"
-EXTRA_PACKAGES_append_k2g-evm  =3D " pruss-lld-apps"
=20
 RDEPENDS_${PN} =3D "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 954fb9d1..82d69403 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
@@ -15,9 +15,6 @@ KERNEL_SRC =3D "${PREFERRED_PROVIDER_virtual/kernel}-so=
urce"
 KERNEL_SHADOW_CLONE :=3D "${PREFERRED_PROVIDER_virtual/kernel}"
 KERNEL_SHADOW_CLONE_ENABLED :=3D "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHA=
DOW_CLONE}}"
=20
-BOOT_MONITOR =3D ""
-BOOT_MONITOR_keystone =3D "boot-monitor-source"
-
 EXTRA_FILES =3D ""
 EXTRA_FILES_ti43x =3D "tisdk-uenv"
 EXTRA_FILES_omap-a15 =3D "tisdk-readme tisdk-uenv"
@@ -29,7 +26,6 @@ RDEPENDS_${PN} =3D "\
     ti-tisdk-makefile \
     ${UBOOT_SRC} \
     ${KERNEL_SRC} \
-    ${BOOT_MONITOR} \
     ${@oe.utils.conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshal=
low-repositories','',d)} \
     tisdk-install \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 33c37cb0..2dca54e1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-host.bb
@@ -8,14 +8,9 @@ inherit packagegroup
=20
 CRYPTO_RDEPENDS =3D ""
=20
-#CRYPTO_RDEPENDS_append_ti33x =3D " ti-crypto-examples-source"
-#CRYPTO_RDEPENDS_append_ti43x =3D " ti-crypto-examples-source"
-#CRYPTO_RDEPENDS_append_keystone =3D " ti-crypto-examples-source"
-
 CRYPTO_RDEPENDS_append_ti33x =3D " cryptodev-module-source"
 CRYPTO_RDEPENDS_append_ti43x =3D " cryptodev-module-source"
 CRYPTO_RDEPENDS_append_dra7xx =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS_append_keystone =3D " cryptodev-module-source"
 CRYPTO_RDEPENDS_append_k3 =3D " cryptodev-module-source"
=20
 RDEPENDS_${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 759276f9..7df60f9f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-target.bb
@@ -10,7 +10,6 @@ CRYPTO_API =3D ""
 CRYPTO_API_ti33x =3D "cryptodev-module-dev"
 CRYPTO_API_ti43x =3D "cryptodev-module-dev"
 CRYPTO_API_dra7xx =3D "cryptodev-module-dev"
-CRYPTO_API_keystone =3D "cryptodev-module-dev"
=20
 RDEPENDS_${PN} =3D "\
     openssl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-crypto.bb
index 50b7e8ef..c2e6e68b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
@@ -17,7 +17,6 @@ CRYPTO_SUPPORT =3D "\
 CRYPTO_SUPPORT_append_ti33x =3D " cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT_append_ti43x =3D " cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT_append_dra7xx =3D " cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_keystone =3D " cryptodev-module cryptodev-tests"
=20
 RDEPENDS_${PN} =3D "\
     ${CRYPTO_SUPPORT} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-matrix.bb
index 4675cb80..7e2db8be 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
@@ -183,12 +183,6 @@ MATRIX_APPS_append_dra7xx +=3D " \
     matrix-tidl-demo-dogbreeds \
 "
=20
-MATRIX_APPS_append_keystone =3D " \
-    matrix-gui-utility-demos    \
-    matrix-mc-demo-ipc          \
-    matrix-multimedia-demo-dsp66imgproc-f2f \
-"
-
 RDEPENDS_${PN} =3D "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_APPS}        \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index f923f305..b0de90cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
@@ -36,8 +36,6 @@ MULTIMEDIA_append_am65xx =3D " ${BARCODE_PKG}"
 #    ${@['','qt-opencv-opencl-opengl-multithreaded-source'][oe.utils.all=
_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.con=
tains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #"
=20
-MULTIMEDIA_append_keystone =3D " ${BARCODE_PKG}"
-
 RDEPENDS_${PN} =3D "\
     ${MULTIMEDIA} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packa=
gegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index abc916f6..24a313bc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
@@ -24,12 +24,6 @@ MULTIMEDIA_append_ti43x =3D " ${BARCODE_PKG}"
 MULTIMEDIA_append_omap-a15 =3D " ${BARCODE_PKG}"
 MULTIMEDIA_append_am65xx =3D " ${BARCODE_PKG}"
=20
-MULTIMEDIA_append_keystone =3D " \
-    hevc-arm-decoder-dev \
-    hevc-arm-decoder-staticdev \
-    ${BARCODE_PKG} \
-"
-
 RDEPENDS_${PN} =3D "\
     ${MULTIMEDIA} \
     packagegroup-arago-gst-sdk-target \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/pa=
ckagegroup-arago-tisdk-multimedia.bb
index b87966be..e1ae4d9e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia.bb
@@ -12,10 +12,6 @@ MULTIMEDIA =3D " \
=20
 MULTIMEDIA_omapl138 =3D ""
=20
-MULTIMEDIA_append_keystone =3D " \
-    hevc-arm-decoder \
-"
-
 DUAL_CAMERA_DEMO =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'd=
ual-camera-demo', '', d)}"
 IMAGE_GALLERY_DEMO =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', =
'image-gallery', '', d)}"
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-opencl-sdk-host.bb
index b0aa15c3..1e6baa20 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-host.bb
@@ -13,10 +13,6 @@ UTILS =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-examples-sou=
rce')} \
 "
=20
-UTILS_append_k2hk =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-source=
')} \
-"
-
 UTILS_append_dra7xx =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-source=
')} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-opencl-sdk-target.bb
index 550e5b9d..410bf47e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
@@ -13,10 +13,6 @@ UTILS =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-dev')} \
 "
=20
-UTILS_append_k2hk =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
-"
-
 UTILS_append_dra7xx =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-opencl.bb
index 85ddcc0b..a36d794b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl.bb
@@ -17,11 +17,6 @@ MAIN_PKGS =3D " \
 EXTRA_PKGS =3D " \
 "
=20
-#    ti-fftw-examples
-EXTRA_PKGS_append_k2hk =3D " \
-    ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples')} \
-"
-
 #    ti-fftw-examples
 EXTRA_PKGS_append_dra7xx =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples')} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-recoveryfs.bb b/meta-arago-distro/recipes-core/packagegroups/pa=
ckagegroup-arago-tisdk-recoveryfs.bb
deleted file mode 100644
index 7ad32de7..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-recoveryfs.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION =3D "Packagegroup for basic recovery rootfs"
-LICENSE =3D "MIT"
-
-inherit packagegroup
-
-ARAGO_BASE =3D "\
-    module-init-tools \
-    mtd-utils \
-    initscript-telnetd \
-    "
-
-ARAGO_EXTRA =3D "\
-    makedumpfile \
-    crash-recovery \
-    "
-
-# minimal set of packages - needed to boot
-RDEPENDS_${PN} =3D "\
-    ${ARAGO_BASE} \
-    ${ARAGO_EXTRA} \
-    "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-toolchain-tisdk-target.bb
index 5244637e..4f8ebbc9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
@@ -15,7 +15,6 @@ TISDK_TOOLCHAIN_EXTRA_TARGET =3D "\
     packagegroup-arago-tisdk-connectivity-sdk-target \
     packagegroup-arago-tisdk-crypto-sdk-target \
 "
-TISDK_TOOLCHAIN_EXTRA_TARGET_keystone =3D ""
 TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 =3D ""
=20
 RDEPENDS_${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb=
 b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index 09264c2a..05c88613 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -19,7 +19,6 @@ ANALYTICS =3D ""
 #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro=
_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('=
MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', Tru=
e, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d=
)]} \
 #"
-ANALYTICS_keystone =3D ""
 ANALYTICS_j7 =3D ""
 ANALYTICS_omapl138 =3D ""
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 79f1081c..008b30ce 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -91,85 +91,6 @@ ARAGO_TI_TEST_append_omapl138 =3D " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test'=
, d)} \
 "
=20
-# Disable ipsecmgr due to libnl and xfrm conflict
-#    ipsecmgr
-ARAGO_TI_TEST_append_keystone =3D " \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
-        ti-ipc-test \
-        mpm-transport-test \
-        multiprocmgr-test \
-        qmss-lld-test \
-        cppi-lld-test \
-        edma3-lld-test \
-        rm-lld \
-        rm-lld-test \
-        traceframework-test \
-        udma-test \
-        cmem-test \
-    ', d)} \
-"
-
-# The following are not yet ready for k2g-evm
-#    nwal-lld-test
-#    hplib-test
-#    nwal-lld
-#    ipc-transport-qmss-test
-#    netapi-test
-
-# Disable netapi due to libnl and xfrm conflict
-#    netapi-test
-# Disable hplib-test,nwal-lld due to hplib-mod breakage against K4.14
-#    hplib-test
-#    nwal-lld-test
-#    nwal-lld
-ARAGO_TI_TEST_append_k2hk =3D " \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
-        srio-lld-test \
-        ipc-transport-srio-test \
-        ipc-transport-qmss-test \
-        hyplnk-lld-test \
-        mmap-lld-test \
-        aif2-lld-test \
-        pa-lld-test \
-        sa-lld \
-        sa-lld-test \
-    ', d)} \
-"
-
-# Disable netapi due to libnl and xfrm conflict
-#    netapi-test
-# Disable hplib-test,nwal-lld due to hplib-mod breakage against K4.14
-#    hplib-test
-#    nwal-lld-test
-#    nwal-lld
-ARAGO_TI_TEST_append_k2l =3D " \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
-        dfe-lld-test \
-        iqn2-lld-test \
-        ipc-transport-qmss-test \
-        pa-lld-test \
-        sa-lld \
-        sa-lld-test \
-    ', d)} \
-"
-
-# Disable netapi due to libnl and xfrm conflict
-#    netapi-test
-# Disable hplib-test,nwal-lld due to hplib-mod breakage against K4.14
-#    hplib-test
-#    nwal-lld-test
-#    nwal-lld
-ARAGO_TI_TEST_append_k2e =3D " \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
-        mmap-lld-test \
-        hyplnk-lld-test \
-        ipc-transport-qmss-test \
-        pa-lld-test \
-        sa-lld \
-        sa-lld-test \
-    ', d)} \
-"
-
 RDEPENDS_${PN} =3D "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-=
arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index 69a8cf7a..ac03ea43 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Script to parse ip address during boot a=
nd make it available to t
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://init;beginline=3D3;endline=3D31;md5=3Df82dd=
b19a87f97193d08feacfd0e4903"
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|keystone"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 SRC_URI =3D "file://init"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ipsecmgr-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-=
makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
deleted file mode 100644
index 557a4393..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ipsecmgr-mod
+++ /dev/null
@@ -1,28 +0,0 @@
-ipsecmgr-mod: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building ipsecmgr-mod
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ipsecmgr-mod*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KDIR=3D$(LINUXKERNEL_INSTALL_DIR)
-
-ipsecmgr-mod_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning ipsecmgr-mod
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ipsecmgr-mod*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KDIR=3D$(LINUXKERNEL_INSTALL_DIR) clean
-
-ipsecmgr-mod_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing ipsecmgr-mod
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ipsecmgr-mod*"`; \
-	make ARCH=3D__KERNEL_ARCH__  KDIR=3D$(LINUXKERNEL_INSTALL_DIR)  INSTALL=
_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=3D$(=
INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-make=
file/ti-tisdk-makefile/Makefile_pru-icss
index 10e5bf3f..f1e6c433 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_pru-icss
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_pru-icss
@@ -74,19 +74,6 @@ pru-icss_install_am572x: pru-icss_install_common
 		done; \
 	done
=20
-pru-icss_install_k2g: pru-icss_install_common
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	install -m 0644 ./examples/k2g/PRU_Halt/gen/PRU_Halt.out \
-		$(DESTDIR)/lib/firmware/pru; \
-	for i in 0 1; \
-	do \
-		for j in 0 1; \
-		do \
-			install -m 0644 ./examples/k2g/PRU_RPMsg_Echo_Interrupt$${i}_$${j}/ge=
n/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-		done; \
-	done
-
 pru-icss_install_am65x: pru-icss_install_common
 	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
 	for i in 0 1; \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile_1.0.bb
index 30e51386..6937ced1 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
@@ -42,7 +42,6 @@ SRC_URI =3D "\
     file://Makefile_uio-module-drv \
     file://Makefile_pru-icss \
     file://Makefile_qt-opencv-opencl-opengl-multithreaded \
-    file://Makefile_ipsecmgr-mod \
     file://Makefile_openmpacc-examples \
     file://Makefile_linalg-examples \
     file://Makefile_ti-gc320-driver \
@@ -62,7 +61,6 @@ MAKEFILES_MATRIX_GUI =3D "matrix-gui-browser \
                         qt-tstat \
 "
=20
-MAKEFILES_MATRIX_GUI_keystone =3D ""
 MAKEFILES_MATRIX_GUI_omapl138 =3D ""
 MAKEFILES_MATRIX_GUI_j7 =3D ""
=20
@@ -77,14 +75,6 @@ MAKEFILES =3D ""
=20
 # Add device specific make targets
=20
-MAKEFILES_append_omap3 =3D " u-boot-spl \
-"
-MAKEFILES_append_am37x-evm =3D " av-examples \
-                               ti-ocf-crypto-module \
-"
-MAKEFILES_append_am3517-evm =3D " av-examples \
-                                ti-ocf-crypto-module \
-"
 MAKEFILES_append_ti33x =3D " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
@@ -137,40 +127,6 @@ MAKEFILES_append_omapl138 =3D " linux-dtbs \
                               ti-ipc \
 "
=20
-MAKEFILES_append_keystone =3D " u-boot-spl \
-                              linux-dtbs \
-                              boot-monitor \
-                              cmem-mod \
-                              cryptodev \
-                              ti-crypto-examples \
-                              hplib-mod \
-                              uio-module-drv \
-                              ipsecmgr-mod \
-                              barcode-roi \
-                              ti-ipc \
-"
-
-#                              gdbserverproxy-module-drv=20
-#                              debugss-module-drv=20
-MAKEFILES_append_k2hk =3D " opencl-examples \
-                              openmpacc-examples \
-                              linalg-examples \
-"
-
-#                             gdbserverproxy-module-drv=20
-#                             debugss-module-drv=20
-MAKEFILES_append_k2l =3D " opencl-examples \
-                             openmpacc-examples \
-"
-
-#                             gdbserverproxy-module-drv=20
-#                             debugss-module-drv=20
-MAKEFILES_append_k2e =3D " opencl-examples \
-                             openmpacc-examples \
-"
-
-MAKEFILES_append_k2g =3D " pru-icss"
-
 MAKEFILES_append_k3 =3D " u-boot-spl \
                         linux-dtbs \
                         cryptodev \
@@ -216,17 +172,14 @@ TI_SGX_TARGET_ARCH_k3 =3D "aarch64"
=20
 PLATFORM_DEBUGSS =3D ""
 PLATFORM_DEBUGSS_dra7xx =3D "DRA7xx_PLATFORM"
-PLATFORM_DEBUGSS_keystone =3D "KEYSTONE_PLATFORM"
=20
 PLATFORM_GDBSERVERPROXY =3D ""
 PLATFORM_GDBSERVERPROXY_dra7xx =3D "DRA7xx_PLATFORM"
-PLATFORM_GDBSERVERPROXY_keystone =3D "KEYSTONE_PLATFORM"
=20
 PRU_ICSS_INSTALL_TARGET =3D "pru-icss_install_none"
 PRU_ICSS_INSTALL_TARGET_ti33x =3D "pru-icss_install_am335x"
 PRU_ICSS_INSTALL_TARGET_ti43x =3D "pru-icss_install_am437x"
 PRU_ICSS_INSTALL_TARGET_omap-a15 =3D "pru-icss_install_am572x"
-PRU_ICSS_INSTALL_TARGET_k2g =3D "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx =3D "pru-icss_install_am65x"
 PRU_ICSS_INSTALL_TARGET_j7 =3D "pru-icss_install_j721e"
 PRU_ICSS_INSTALL_TARGET_am64xx =3D "pru-icss_install_am64x"
@@ -241,7 +194,6 @@ IPC_TOOLS_PATHS_R5F  =3D "ti.targets.arm.elf.R5F=3D"\=
$\(TOOLCHAIN_PATH_R5\)""
 IPC_TOOLS_PATHS_C674 =3D "ti.targets.elf.C674=3D"\$\(C6X_GEN_INSTALL_PAT=
H\)""
=20
 IPC_TOOLS_PATHS =3D ""
-IPC_TOOLS_PATHS_append_keystone =3D " ${IPC_TOOLS_PATHS_C66}"
 IPC_TOOLS_PATHS_append_omap-a15 =3D " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS=
_PATHS_M4}"
 IPC_TOOLS_PATHS_append_omapl138 =3D " ${IPC_TOOLS_PATHS_C674}"
 IPC_TOOLS_PATHS_append_k3 =3D "${IPC_TOOLS_PATHS_R5F}"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index d6f3dc28..5f7d9f15 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -13,8 +13,6 @@ S =3D "${WORKDIR}/git"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 SDCARD_SCRIPT =3D " create-sdcard.sh"
-SDCARD_SCRIPT_keystone =3D ""
-SDCARD_SCRIPT_k2g =3D " create-sdcard.sh"
=20
 SETUP_SCRIPTS =3D " common.sh \
                   setup-host-check.sh \
@@ -27,17 +25,12 @@ SETUP_SCRIPTS =3D " common.sh \
                   ${SDCARD_SCRIPT} \
 "
=20
-UBOOT_ENV_am37x-evm =3D "setup-uboot-env-am37x.sh"
-UBOOT_ENV_beagleboard =3D "setup-uboot-env-beagleboard.sh"
-UBOOT_ENV_am3517-evm =3D "setup-uboot-env-am3517.sh"
 UBOOT_ENV_omapl138 =3D "setup-uboot-env-am18x.sh"
 UBOOT_ENV_ti33x =3D "setup-uboot-env-am335x.sh"
 UBOOT_ENV_ti43x =3D "setup-uboot-env-am43x.sh"
 UBOOT_ENV_omap5-evm =3D "setup-uboot-env-omap5.sh"
 UBOOT_ENV_am57xx-evm =3D "setup-uboot-env-am57xx-evm.sh"
 UBOOT_ENV_k3 =3D "setup-uboot-env-am65x.sh"
-UBOOT_ENV_keystone =3D "setup-uboot-env-keystone.sh"
-UBOOT_ENV_k2g =3D "setup-uboot-env-k2g-evm.sh"
 UBOOT_ENV =3D "setup-uboot-unknown.sh"
=20
 do_install () {
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index d64a80f8..5f105422 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -39,6 +39,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
-    ipsecmgr-mod \
     gstreamer1.0-plugins-bad \
 "
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc
index 50d721b3..92b39914 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
@@ -1,7 +1,7 @@
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://makefile;beginline=3D1;endline=3D31;md5=3D2=
f2ea348b98d5cc7807ece7adcc2c43a"
=20
-COMPATIBLE_MACHINE =3D "omap-a15|keystone"
+COMPATIBLE_MACHINE =3D "omap-a15"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 BIG_DATA_IPC_GIT_URI =3D "git://git.ti.com/processor-sdk/big-data-ipc-ex=
amples.git"
@@ -21,10 +21,6 @@ S =3D "${WORKDIR}/git"
=20
 PLATFORM =3D "UNKNOWN"
 PLATFORM_omap-a15 =3D "DRA7XX"
-PLATFORM_k2hk-evm =3D "TCI6636"
-PLATFORM_k2l =3D "TCI6630"
-PLATFORM_k2e =3D "66AK2E"
-PLATFORM_k2g =3D "66AK2G"
=20
 IPC_TARGETS =3D ""
 IPC_TARGETS_omap-a15 =3D "\
@@ -32,8 +28,3 @@ IPC_TARGETS_omap-a15 =3D "\
     ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
-
-IPC_TARGETS_keystone =3D " \
-    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
-    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-"
diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo=
.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
deleted file mode 100644
index 77b61ac8..00000000
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY =3D "This recipe creates a posix-smp-demo binaries."
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://dhry.h;beginline=3D1;endline=3D377;md5=3D8f=
2fbe6e071d9ea4afeca73cfd656ec8"
-
-POSIX_SMP_GIT_URI =3D "git://git.ti.com/keystone-demos/posix-smp.git"
-POSIX_SMP_GIT_PROTOCOL =3D "git"
-POSIX_SMP_GIT_BRANCH =3D "master"
-
-# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.02B"
-POSIX_SMP_SRCREV =3D "339039e281586a79c5b04fac6c2ae84eb30c0576"
-
-BRANCH =3D "${POSIX_SMP_GIT_BRANCH}"
-SRC_URI =3D "${POSIX_SMP_GIT_URI};protocol=3D${POSIX_SMP_GIT_PROTOCOL};b=
ranch=3D${BRANCH}"
-
-SRCREV =3D "${POSIX_SMP_SRCREV}"
-PV =3D "01.01.00.02B"
-INC_PR =3D "r0"
-
-S =3D "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo=
_git.bb b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo_gi=
t.bb
deleted file mode 100644
index 7cd201cf..00000000
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require posix-smp-demo.inc
-
-PR =3D "${INC_PR}.0"
-
-EXTRA_OEMAKE =3D "-f Makefile_linux EGCC=3D"${CC}""
-
-do_compile() {
-    oe_runmake posix-smp-demo-linux-armv7
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 posix-smp-demo-linux-armv7 ${D}${bindir}
-}
-
-INSANE_SKIP_${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 3f4cf803..9bc32cdf 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -52,7 +52,7 @@ do_install_prepend() {
 }
=20
 3D_DEMOS_RDEPENDS_MATRIX =3D "matrix-gui-apps-images matrix-gui-submenus=
-3d"
-3D_DEMOS_RDEPENDS =3D "${3D_DEMOS_RDEPENDS_MATRIX} libgles-omap3-rawdemo=
s"
+3D_DEMOS_RDEPENDS =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
 3D_DEMOS_RDEPENDS_omap-a15 =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS_ti43x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS_ti33x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmar=
ks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armben=
chmarks-demos_2.0.bb
index bdb446da..36598517 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demo=
s_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demo=
s_2.0.bb
@@ -12,6 +12,6 @@ S =3D "${WORKDIR}/git/arm_apps"
 RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-arm"
=20
 # Make sure the benchmarks have been installed
-RDEPENDS_${PN} +=3D "arm-benchmarks lmbench nbench-byte matrix-gui-helpe=
r-scripts posix-smp-demo"
+RDEPENDS_${PN} +=3D "arm-benchmarks lmbench nbench-byte matrix-gui-helpe=
r-scripts"
=20
 FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demo=
s_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_=
2.0.bb
index 7029df53..9fd48820 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
@@ -10,14 +10,8 @@ S =3D "${WORKDIR}/git/cryptos_apps_scripts"
 S_ti33x =3D "${WORKDIR}/git/cryptos_apps_program"
 S_ti43x =3D "${WORKDIR}/git/cryptos_apps_program"
 S_dra7xx =3D "${WORKDIR}/git/cryptos_apps_program"
-S_keystone =3D "${WORKDIR}/git/cryptos_apps_program"
=20
 FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 # Make sure crypto submenu and app images has been installed. Also make =
sure openssl is available
 RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-cryptos =
openssl matrix-gui-helper-scripts"
-
-#RDEPENDS_${PN}_append_ti33x =3D " ti-crypto-examples"
-#RDEPENDS_${PN}_append_ti43x =3D " ti-crypto-examples"
-#RDEPENDS_${PN}_append_dra7xx =3D " ti-crypto-examples"
-#RDEPENDS_${PN}_append_keystone =3D " ti-crypto-examples"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-dem=
os_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demo=
s_2.0.bb
index 83e10bac..8cb6cf29 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.=
bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.=
bb
@@ -11,7 +11,6 @@ S =3D "${WORKDIR}/git/utilities_apps"
 do_install_prepend(){
    install -d ${D}${MATRIX_BASE_DIR}/html-apps/
    cp -rf ${S}/utility_eeprom/eeprom ${D}${MATRIX_BASE_DIR}/html-apps/
-   cp -rf ${S}/utility_flash/flash ${D}${MATRIX_BASE_DIR}/html-apps/
    cp -rf ${S}/utility_filesystem/filesystem ${D}${MATRIX_BASE_DIR}/html=
-apps/
    cp -rf ${S}/utility_info/info ${D}${MATRIX_BASE_DIR}/html-apps/
    cp -rf ${S}/utility_stats/stats ${D}${MATRIX_BASE_DIR}/html-apps/
@@ -19,7 +18,6 @@ do_install_prepend(){
=20
 do_install_append(){
     rm ${D}${MATRIX_APP_DIR}/utility_eeprom/eeprom-utility.php
-    rm ${D}${MATRIX_APP_DIR}/utility_flash/flash-utility.php
     rm ${D}${MATRIX_APP_DIR}/utility_filesystem/filesystem-utility.php
     rm ${D}${MATRIX_APP_DIR}/utility_info/info-utility.php
     rm ${D}${MATRIX_APP_DIR}/utility_stats/stats-utility.php
diff --git a/meta-arago-extras/recipes-devtools/flash-utility/flash-utili=
ty-1.6.0.0/LICENSE b/meta-arago-extras/recipes-devtools/flash-utility/fla=
sh-utility-1.6.0.0/LICENSE
deleted file mode 100644
index fd4f082f..00000000
--- a/meta-arago-extras/recipes-devtools/flash-utility/flash-utility-1.6.=
0.0/LICENSE
+++ /dev/null
@@ -1,63 +0,0 @@
-Copyright (c) 2010, Texas Instruments Incorporated
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without modif=
ication,
-are permitted provided that the following conditions are met:
-
- - Redistributions of source code must retain the above copyright notice=
,
-   this list of conditions and the following disclaimer.
- - Redistributions in binary form must reproduce the above copyright not=
ice,
-   this list of conditions and the following disclaimer in the documenta=
tion
-   and/or other materials provided with the distribution.
- - Neither the name of Texas Instruments nor the names of its contributo=
rs
-   may be used to endorse or promote products derived from this software
-   without specific prior written permission.
-
- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
- FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
- COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
- BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
- OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
- AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
- OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
- OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- SUCH DAMAGE.
-
-Copyright (C) 2008 The Android Open Source Project
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions
-are met:
-
- - Redistributions of source code must retain the above copyright
-   notice, this list of conditions and the following disclaimer.
- - Redistributions in binary form must reproduce the above copyright
-   notice, this list of conditions and the following disclaimer in
-   the documentation and/or other materials provided with the
-   distribution.
-
- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
- FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
- COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
- BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
- OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
- AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
- OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
- OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- SUCH DAMAGE.
-
-Copyright (c) 1996 L. Peter Deutsch and Jean-Loup Gailly
-
-Permission is granted to copy and distribute this document for any
-purpose and without charge, including translations into other
-languages and incorporation into compilations, provided that the
-copyright notice and this notice are preserved, and that any
-substantive changes or deletions from the original are clearly
-marked.
diff --git a/meta-arago-extras/recipes-devtools/flash-utility/flash-utili=
ty_1.6.0.0.bb b/meta-arago-extras/recipes-devtools/flash-utility/flash-ut=
ility_1.6.0.0.bb
deleted file mode 100644
index 48fb1f42..00000000
--- a/meta-arago-extras/recipes-devtools/flash-utility/flash-utility_1.6.=
0.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION =3D "Texas Instruments Flash Utility"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da428c464689fd2fac5b185963cbfb=
f85"
-
-PR =3D "r0"
-
-COMPATIBLE_MACHINE =3D "am37x-evm|am3517-evm"
-
-SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/580/4785/Flash=
_v1.6.0.0.zip;name=3Dbase;subdir=3D${P}"
-
-# Temporarily add LICENSE file here since zip files don't contain any li=
cense information. This file was grabbed
-# from the License Agreement screen when installing the flash utility ap=
plication.
-SRC_URI +=3D "file://LICENSE"
-
-S =3D "${WORKDIR}/${P}"
-
-do_unpack_extra() {
-    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
-}
-
-addtask unpack_extra after do_unpack before do_patch
-
-installdir =3D "host-tools/flash_utils/windows"
-
-do_install() {
-    install -d ${D}/${installdir}
-    install ${S}/setup.exe ${D}/${installdir}
-    install ${S}/FlashInstaller.msi ${D}/${installdir}
-    install ${S}/Release_Notes.txt ${D}/${installdir}
-}
-
-FILES_${PN} +=3D "${installdir}/*"
-
-SRC_URI[base.md5sum] =3D "1f53efa31996afb5af78930739090ae6"
-SRC_URI[base.sha256sum] =3D "f6722422016ec4e49b8c55c38affea4c924b6636a47=
d0d67e6537e7dab108a1b"
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-uti=
lity_2.5.2.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmu=
x-utility_2.5.2.0.bb
index 51c65716..9d770751 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Texas Instruments Pinmux Utility"
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd69a4aafe4f7b66d5f9c60d6875eb=
d52"
-COMPATIBLE_MACHINE =3D "am335x-evm|am37x-evm|am3517-evm|beagleboard"
+COMPATIBLE_MACHINE =3D "am335x-evm"
=20
 PR =3D "r0"
=20
diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-ke=
rnel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-k=
ernel_1.0.bb
deleted file mode 100644
index 3fc631b5..00000000
--- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.=
0.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION =3D "Recovery kernel building for Keystone EVM"
-LICENSE =3D "GPLv2"
-
-# recovery kernel needs devtree compiler to add padding bytes
-DEPENDS +=3D "dtc-native"
-
-PR =3D "r4"
-COMPATIBLE_MACHINE =3D "keystone"
-BRANCH =3D "v3.10.72/master"
-SRCREV =3D "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
-SRC_URI =3D "git://git.ti.com/keystone-linux/linux.git;protocol=3Dgit;br=
anch=3D${BRANCH}"
-S =3D "${WORKDIR}/git"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7"
-
-FILES_${PN} +=3D "${bindir}/crashdump"
-LINUX_ZIMAGE =3D "zImage"
-KERNEL_MACHINE ?=3D "keystone2_recovery_defconfig"
-KERNEL_DTBTYPE =3D "k2hk-evm-recovery.dtb k2l-evm-recovery.dtb k2e-evm-r=
ecovery.dtb "
-CRASHDIR =3D "crashdump"
-ARCH =3D "${TARGET_ARCH}"
-CROSS_COMPILE =3D "${TARGET_PREFIX}"
-
-export ARCH
-export CROSS_COMPILE
-
-do_configure () {
-	make ${KERNEL_MACHINE}
-}
-
-do_compile() {
-	make ${LINUX_ZIMAGE} KALLSYMS_EXTRA_PASS=3D1
-	make ${KERNEL_DTBTYPE}
-        for d in ${KERNEL_DTBTYPE}
-        do
-            dtc -I dtb -O dtb -p 2048 -o $d arch/arm/boot/dts/$d
-        done
-}
-
-do_install () {
-	install -d ${D}${bindir}/${CRASHDIR}/
-	install ${S}/arch/arm/boot/${LINUX_ZIMAGE} ${D}${bindir}/${CRASHDIR}
-        for d in ${KERNEL_DTBTYPE}
-        do
-            install ${S}/$d ${D}${bindir}/${CRASHDIR}
-        done
-}
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av=
-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk=
-av-files_1.4.bb
index 2f570d43..c1caa980 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
@@ -9,9 +9,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 VIDEO_FILES =3D "video_480p "
=20
-VIDEO_FILES_append_am37x-evm   =3D "video_vga_r"
-VIDEO_FILES_append_beagleboard =3D "video_vga"
-VIDEO_FILES_append_am3517-evm  =3D "video_wqvga"
 VIDEO_FILES_append_ti33x       =3D "video_wvga \
                                   video_wqvga"
 VIDEO_FILES_append_ti43x       =3D "video_wqvga"
@@ -21,8 +18,6 @@ VIDEO_FILES_append_dra7xx      =3D "video_wvga \
                                   video_yuv"
 VIDEO_FILES_append_k3          =3D "video_720p"
=20
-VIDEO_FILES_keystone =3D "video_720p "
-
 BRANCH =3D "master"
=20
 SRC_URI =3D "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=3D=
git;branch=3D${BRANCH}"
@@ -45,4 +40,3 @@ do_install() {
 }
=20
 FILES_${PN} +=3D "${datadir}/ti/*"
-
diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples=
_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.=
0.bb
deleted file mode 100644
index 65ff4f3b..00000000
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION =3D "Linux Audio Video Example Applications"
-HOMEPAGE =3D "https://gforge.ti.com/gf/project/av_examples/"
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM :=3D "file://COPYING;md5=3D80ea1ff5788f65d5c5b3206d50d4=
bc6c"
-SECTION =3D "system"
-
-PR =3D "r2"
-
-DEPENDS =3D "virtual/kernel"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE =3D "(omap3)"
-
-BRANCH ?=3D "master"
-SRCREV =3D "b67b11011a8a54a7598eed383f3a106c32b47c6d"
-
-SRC_URI =3D "git://git.ti.com/apps/av_examples.git;protocol=3Dgit;branch=
=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SKIP w=
hich would otherwise lead to discrepancies between host and arago binarie=
s
-INSANE_SKIP_${PN} =3D "True"
-
-do_compile() {
-
-	touch debug
-	export CROSS_COMPILE=3D${TARGET_PREFIX}
-	export CFLAGS=3D'${TARGET_CC_ARCH}'
-	make release LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" PLATFORM=
=3D"${MACHINE}"
-}
-
-do_install() {
-	make DESTDIR=3D${D} install
-}
diff --git a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-im=
age-proc_git.bb b/meta-arago-extras/recipes-multimedia/demo-image-proc/de=
mo-image-proc_git.bb
deleted file mode 100644
index 29d87eaf..00000000
--- a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-pro=
c_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "TI Image Processing Demo for KeyStone 2"
-HOMEPAGE =3D "http://git.ti.com/cgit/cgit.cgi/keystone-demos/image-proc.=
git"
-LICENSE =3D "BSD & MIT"
-LIC_FILES_CHKSUM =3D "file://Makefile;beginline=3D1;endline=3D29;md5=3Da=
da2acff673fad7c53cbfd2598525f2a"
-SECTION =3D "console"
-COMPATIBLE_MACHINE =3D "keystone"
-
-DEPENDS =3D "ti-ipc"
-
-BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/keystone-demos/image-proc.git;protocol=3Dg=
it;branch=3D${BRANCH}"
-#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.03
-SRCREV =3D "d1f4014d28ecedf34dbd20f04d4277eb1c4b8ae0"
-PV =3D "1.0.0.3"
-
-S =3D "${WORKDIR}/git"
-
-FILES_${PN} =3D "${bindir}/image_processing_master"
-
-do_install() {
-	if [ ! -d ${D}/${bindir} ]
-	then
-		install -d ${D}${bindir}
-	fi
-	install -c -m 755 ${S}/ipc/master/image_processing_master.out ${D}${bin=
dir}/image_processing_master
-}
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 617fdc95..4f7f73e5 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
@@ -11,7 +11,7 @@ SRCREV =3D "0abedafadbed693592804f23482a9447d81b2dbf"
=20
 S =3D "${WORKDIR}/git"
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base opencl ti-cgt6x-nati=
ve clocl-native imglib-c66x vlib-c66x gettext-native"
=20
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugi=
ns-ti/gstreamer1.0-plugins-hevc_git.bb
index 83ef1030..78dd4d3c 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://git.ti.com/processor-sdk/gst-plugin=
-hevc"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2827f94fc0a1adeff4d9702e97ce2=
979"
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
=20
 SRC_URI =3D "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=
=3Dgit \
 	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-a=
rm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder=
/hevc-arm-decoder_git.bb
index 069e8397..9a262311 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-deco=
der_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-deco=
der_git.bb
@@ -4,7 +4,7 @@ LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://Inc/exp_pp_h265decoder.h;beginline=3D1;endl=
ine=3D27;md5=3D51a0ae5cca603a21186bf6ff458f3be9"
 PR =3D "r4"
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
=20
 BRANCH =3D "master"
=20
diff --git a/meta-arago-extras/recipes-support/crash-recovery/crash-recov=
ery.bb b/meta-arago-extras/recipes-support/crash-recovery/crash-recovery.=
bb
deleted file mode 100644
index 95959093..00000000
--- a/meta-arago-extras/recipes-support/crash-recovery/crash-recovery.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION =3D "Initscripts for kdump recovery mechanism"
-LICENSE =3D "BSD-3-Clause"
-
-COMPATIBLE_MACHINE =3D "keystone"
-LIC_FILES_CHKSUM =3D "file://recoveryfs.sh;beginline=3D1;endline=3D20;md=
5=3D83e9f5412fd9a0db2aee516b52c24535"
-PR =3D"r1"
-
-S =3D "${WORKDIR}"
-SRC_URI =3D "file://recoveryfs.sh"
-
-INITSCRIPT_NAME =3D "recoveryfs.sh"
-INITSCRIPT_PARAMS =3D "defaults 10"
-
-inherit update-rc.d
-
-do_install_append() {
-        install -d ${D}${sysconfdir}/init.d/
-        install -c -m 755 ${WORKDIR}/recoveryfs.sh ${D}${sysconfdir}/ini=
t.d/${INITSCRIPT_NAME}
-}
diff --git a/meta-arago-extras/recipes-support/crash-recovery/files/recov=
eryfs.sh b/meta-arago-extras/recipes-support/crash-recovery/files/recover=
yfs.sh
deleted file mode 100755
index d1b15e42..00000000
--- a/meta-arago-extras/recipes-support/crash-recovery/files/recoveryfs.s=
h
+++ /dev/null
@@ -1,44 +0,0 @@
-#*
-#* Copyright (C) 2012-2014 Texas Instruments Incorporated - http://www.t=
i.com/
-#*
-#*
-#*  Redistribution and use in source and binary forms, with or without
-#*  modification, are permitted provided that the following conditions
-#*  are met:
-#*
-#*    Redistributions of source code must retain the above copyright
-#*    notice, this list of conditions and the following disclaimer.
-#*
-#*    Redistributions in binary form must reproduce the above copyright
-#*    notice, this list of conditions and the following disclaimer in th=
e
-#*    documentation and/or other materials provided with the
-#*    distribution.
-#*
-#*    Neither the name of Texas Instruments Incorporated nor the names o=
f
-#*    its contributors may be used to endorse or promote products derive=
d
-#*    from this software without specific prior written permission.
-#*
-
-#!/bin/sh
-
-if [ -f /proc/vmcore ] ; then
-  mkdir -p /mnt/boot2
-  mount -o rw,sync -t ubifs /dev/ubi0_2 /mnt/boot2
-  if [ $? -eq 0 ] ; then
-     if [ -f /usr/bin/makedumpfile ] ; then
-       makedumpfile -E -d 31 /proc/vmcore /mnt/boot2/home/root/coredump.=
elf
-       gzip -c /mnt/boot2/home/root/coredump.elf > /mnt/boot2/home/root/=
coredump.elf.gz
-       rm -rf /mnt/boot2/home/root/coredump.elf
-       sync
-       reboot
-     else
-       echo "makedumpfile not found"
-       exit 1
-     fi
-  else
-    echo "mount unsuccessful"
-    exit 1
-  fi
-fi
-
-exit 0
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.=
bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
deleted file mode 100644
index 34d56f55..00000000
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "IPSec Manager kernel module"
-DESCRIPTION =3D "Provides Module to offload IPSec security policy & asso=
ciated security association to NETCP for crypto operations"
-
-LIC_FILES_CHKSUM =3D "file://../../ipsecmgr_snoop.h;beginline=3D1;endlin=
e=3D33;md5=3Df7eadca4fb5599f508dc11fa1e752919"
-
-include ipsecmgr.inc
-
-MACHINE_KERNEL_PR_append =3D "d"
-PR =3D "${MACHINE_KERNEL_PR}"
-
-EXTRA_OEMAKE +=3D "KDIR=3D"${STAGING_KERNEL_DIR}""
-
-inherit module
-
-S =3D "${WORKDIR}/git/src/module"
-
-do_install() {
-# Install kernel module
-	oe_runmake INSTALL_MOD_PATH=3D"${D}" install
-}
-
-KERNEL_MODULE_AUTOLOAD +=3D "ipsecmgr_mod"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/me=
ta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
deleted file mode 100644
index 331f19c2..00000000
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-BRANCH=3D"master"
-SRC_URI =3D "git://arago-project.org/git/projects/ipsecmgr.git;protocol=3D=
git;branch=3D${BRANCH}"
-
-SRCREV =3D "d3ebaa8c80346c8037b5e81c636ab26785ccefaf"
-PV     =3D "01.01.00.04+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b=
/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
deleted file mode 100644
index 605e48ff..00000000
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "IPSec Manager libraries"
-DESCRIPTION =3D "Provides library to offload IPSec security policy & ass=
ociated security association to NETCP for crypto operations"
-
-LIC_FILES_CHKSUM =3D "file://../ipsecmgr_snoop.h;beginline=3D1;endline=3D=
33;md5=3Df7eadca4fb5599f508dc11fa1e752919"
-
-include ipsecmgr.inc
-
-PR =3D "r3"
-
-DEPENDS =3D "libnl-xfrm"
-RDEPENDS_${PN} =3D "ipsecmgr-mod"
-
-CFLAGS +=3D "-I${STAGING_INCDIR}/libnl3"
-
-S =3D "${WORKDIR}/git/build"
-LIB_INC_DIR =3D "${WORKDIR}/git"
-UTILS_LIB_INC_DIR =3D "${WORKDIR}/git/utils/iface/"
-
-ALLOW_EMPTY_${PN} =3D "1"
-
-do_compile() {
-# Compile the library
-	make clean
-	make all
-}
-do_install() {
-# Install libraries
-	install -d ${D}${libdir}/
-	install -c -m 666 libipsecmgr_snoop.a ${D}${libdir}/
-	install -c -m 666 libipsecmgr_ipc.a ${D}${libdir}/
-	install -c -m 666 libipsecmgr_syslog.a ${D}${libdir}/
-	install -d ${D}${includedir}/
-	install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
-	install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
-}
diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.=
bb b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
deleted file mode 100644
index 526ad0ab..00000000
--- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION =3D "Libnl extension for XFRM support"
-PROVIDES =3D "libnl-xfrm"
-SECTION =3D "net"
-LICENSE =3D "BSD-3-Clause"
-
-COMPATIBLE_MACHINE =3D "keystone"
-
-LIC_FILES_CHKSUM =3D "file://include/xfrm_pvt.h;beginline=3D1;endline=3D=
33;md5=3Dfe068af290f274f2a86a867bbd7cc61c"
-
-DEPENDS =3D "libnl"
-
-BRANCH=3D"hawking_dev"
-# The following commit correspond to DEV.LIBNL-XFRM.03.01.00.00A
-SRCREV =3D "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
-SRC_URI =3D "git://arago-project.org/git/projects/libnl-xfrm.git;protoco=
l=3Dgit;branch=3D${BRANCH}"
-
-PR =3D "r1"
-
-S =3D "${WORKDIR}/git"
-
-LIBNL_XFRM_LIB =3D "lib/libnl-xfrm.a"
-
-CFLAGS +=3D "-I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -fPIC -DPIC =
"
-
-do_compile() {
-	mkdir -p ${S}/lib
-	make clean
-	make all
-}
-
-do_install_append() {
-	install -d ${D}${libdir}/
-	install -d ${D}${includedir}/
-	install -d ${D}${includedir}/libnl3/netlink/
-	install -d ${D}${includedir}/libnl3/netlink/xfrm/
-	install -c -m 755 ${S}/${LIBNL_XFRM_LIB} ${D}${libdir}/
-	install -c -m 755 ${S}/include/netlink/xfrm/*.h ${D}${includedir}/libnl=
3/netlink/xfrm/
-	install -c -m 755 ${S}/lib/libnl-xfrm.so ${D}${libdir}/libnl-xfrm.so.1.=
0.0
-	cd ${D}${includedir}/
-	ln -s libnl3/netlink netlink
-	cd ${D}${libdir}/
-	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so.1
-	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so
-}
diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb b/meta-ara=
go-extras/recipes-ti/fftlib/fftlib_git.bb
index 2631e72e..e0d758d3 100644
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
@@ -15,10 +15,9 @@ PR =3D "${INC_PR}.0"
=20
 DEPENDS =3D "common-csl-ip-rtos libarch ti-xdctools-native doxygen-nativ=
e ti-cgt6x-native ti-xdais libulm dsplib-c66x php libxslt-native libxslt =
openmp-rtos"
=20
-COMPATIBLE_MACHINE =3D "k2hk|dra7xx"
+COMPATIBLE_MACHINE =3D "dra7xx"
=20
 TARGET_dra7xx =3D "SOC_AM572x"
-TARGET_k2hk   =3D "SOC_K2H"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb b/meta-ar=
ago-extras/recipes-ti/fftlib/ti-fftw_git.bb
index 84b6ba14..5cb4e5df 100644
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
@@ -18,9 +18,8 @@ DEPENDS =3D "common-csl-ip-rtos common-csl-ip ti-xdctoo=
ls-native ti-sysbios ti-cgt
=20
 RDEPENDS_${PN} +=3D "opencl-runtime"
=20
-COMPATIBLE_MACHINE =3D "k2hk|dra7xx"
+COMPATIBLE_MACHINE =3D "dra7xx"
 TARGET_dra7xx =3D "SOC_AM572x"
-TARGET_k2hk   =3D "SOC_K2H"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/ti/fftw"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arag=
o-extras/recipes-ti/libarch/libarch.inc
index b7a7af6c..ee3bc747 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://src/ti/libarch/docs/LibArc=
h_1.0.0_manifest.html;md5=3Db
 SRC_URI =3D "git://git.ti.com/library-architecture/libarch.git;protocol=3D=
git;branch=3D${BRANCH}"
 SRCREV =3D "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
=20
-COMPATIBLE_MACHINE =3D "k2hk|dra7xx"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git"
@@ -34,4 +34,3 @@ export FC_DIR =3D "${FC_INSTALL_DIR}"
 export PDK_DIR =3D "${PDK_INSTALL_DIR}"
=20
 TARGET_dra7xx =3D "SOC_AM572x"
-TARGET_k2hk   =3D "SOC_K2H"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-=
extras/recipes-ti/linalg/linalg.inc
index 6883b990..7cf16c9f 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://src/ti/linalg/docs/LINALG_1.=
2.0_manifest.html;md5=3Df30
 PV =3D "1_2_0_0"
 INC_PR =3D "r7"
=20
-COMPATIBLE_MACHINE =3D "k2hk|dra7xx"
+COMPATIBLE_MACHINE =3D "dra7xx"
=20
 require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-ara=
go-extras/recipes-ti/linalg/linalg_git.bb
index ce1ce472..3b9220a9 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -3,9 +3,7 @@ DESCRIPTION =3D "TI Linear Algebra Library"
 include linalg.inc
 PR =3D "${INC_PR}.0"
=20
-TARGET_k2hk      =3D "SOC_K2H"
 TARGET_dra7xx        =3D "SOC_AM572x"
-MEM_MODEL_k2hk   =3D "Large"
 MEM_MODEL_dra7xx     =3D "Small"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb b/met=
a-arago-extras/recipes-ti/netapi/netapi-test_git.bb
deleted file mode 100644
index 3b7825c9..00000000
--- a/meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION =3D "Provides test and application binaries using NETAPI mod=
ule"
-
-DEPENDS =3D "netapi ipsecmgr"
-
-include netapi.inc
-
-PR =3D "${INC_PR}.1"
-
-EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
-
-do_compile () {
-#   Build the netapi binaries
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake -f makefile_armv7 tests NETAPI_SRC_DIR=3D${S} NETAPI_INC_D=
IR=3D${BASEDIR} \
-				USEDYNAMIC_LIB=3D"$choice" DEVICE=3D"$device"
-		done
-
-#     Now build the netapi appplications
-		cd ${S}/applications/ipsec_offload/ipsecmgr/build
-		oe_runmake clean NETAPI_SRC_DIR=3D${S} DEVICE=3D"$device"
-		oe_runmake app NETAPI_SRC_DIR=3D${S} DEVICE=3D"$device"
-
-		cd ${S}/applications/ipsec_offload/config-app/build
-		oe_runmake clean DEVICE=3D"$device"
-		oe_runmake app DEVICE=3D"$device"
-		cd ${S}
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake -f makefile_armv7 installbin INSTALL_INC_BASE_DIR=3D${D}/${=
includedir} \
-			INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bin=
dir} \
-			SYSCONFDIR=3D${D}${sysconfdir} DEVICE=3D"$device"
-
-		cd ${S}/applications/ipsec_offload/ipsecmgr/build
-		oe_runmake install \
-			INSTALL_BIN_BASE_DIR=3D${D}${bindir} SYSCONFDIR=3D${D}${sysconfdir} \
-			DEVICE=3D"$device"
-
-		cd ${S}/applications/ipsec_offload/config-app/build
-		oe_runmake install \
-			INSTALL_BIN_BASE_DIR=3D${D}${bindir} SYSCONFDIR=3D${D}${sysconfdir} \
-			DEVICE=3D"$device"
-		cd ${S}
-	done
-}
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi.inc b/meta-arago-=
extras/recipes-ti/netapi/netapi.inc
deleted file mode 100644
index ef4607f5..00000000
--- a/meta-arago-extras/recipes-ti/netapi/netapi.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/COPYING.txt;md5=3Df2b4f16235=
8b1ffaf3f2307287ca2074"
-
-COMPATIBLE_MACHINE =3D "keystone"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-DEBIAN_NOAUTONAME_${PN} =3D "1"
-DEBIAN_NOAUTONAME_${PN}-dev =3D "1"
-DEBIAN_NOAUTONAME_${PN}-dbg =3D "1"
-DEBIAN_NOAUTONAME_${PN}-staticdev =3D "1"
-
-NETAPI_GIT_URI =3D "git://git.ti.com/keystone-rtos/netapi.git"
-NETAPI_GIT_PROTOCOL =3D "git"
-NETAPI_GIT_BRANCH =3D "master"
-
-# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.07"
-NETAPI_SRCREV =3D "50026020384737d253668c4be80745a3653106f8"
-
-BRANCH =3D "${NETAPI_GIT_BRANCH}"
-SRC_URI =3D "${NETAPI_GIT_URI};protocol=3D${NETAPI_GIT_PROTOCOL};branch=3D=
${BRANCH}"
-SRCREV =3D "${NETAPI_SRCREV}"
-
-PV =3D "01.01.00.07"
-INC_PR =3D "r0"
-
-DEVICELIST_k2hk =3D "k2h k2k"
-DEVICELIST_k2l  =3D "k2l"
-DEVICELIST_k2e  =3D "k2e"
-
-CHOICELIST =3D "yes no"
-
-BASEDIR =3D "${WORKDIR}/git"
-S =3D "${BASEDIR}/ti/runtime/netapi"
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi_git.bb b/meta-ara=
go-extras/recipes-ti/netapi/netapi_git.bb
deleted file mode 100644
index 4427ecc2..00000000
--- a/meta-arago-extras/recipes-ti/netapi/netapi_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION =3D "Provides NETAPI module: TI user space network library"
-
-DEPENDS =3D "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib =
nwal-lld"
-
-include netapi.inc
-
-PR =3D "${INC_PR}.1"
-
-EXTRA_OEMAKE =3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
"
-
-do_compile () {
-#   Now build the netapi
-	for device in ${DEVICELIST}
-	do
-		for choice in ${CHOICELIST}
-		do
-			oe_runmake  clean NETAPI_SRC_DIR=3D${S} NETAPI_INC_DIR=3D${BASEDIR} \
-				USEDYNAMIC_LIB=3D"$choice" DEVICE=3D"$device"
-			oe_runmake lib NETAPI_SRC_DIR=3D${S} NETAPI_INC_DIR=3D${BASEDIR} \
-				USEDYNAMIC_LIB=3D"$choice" DEVICE=3D"$device"
-		done
-	done
-}
-
-do_install () {
-	for device in ${DEVICELIST}
-	do
-		oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir} \
-			INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bin=
dir} \
-			SYSCONFDIR=3D${D}${sysconfdir} DEVICE=3D"$device"
-	done
-}
diff --git a/meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-race-con=
dition-during-DSP-firmware-booting.patch b/meta-arago-extras/recipes-ti/o=
cl/files/0002-Fix-K2x-race-condition-during-DSP-firmware-booting.patch
deleted file mode 100644
index 807639da..00000000
--- a/meta-arago-extras/recipes-ti/ocl/files/0002-Fix-K2x-race-condition-=
during-DSP-firmware-booting.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-ocl: Fix K2x race condition during DSP firmware booting
-
-- Race condition during booting of K2x DSP monitor firmware, causes
-  some DSPs not able to create RPMessage object that communicates with
-  the host (Arm A15).
-- The root cause is that one global data in ipc/RPMessage,
-  "RPMessage_module", is placed in global DDR section shared by all core=
s.
-- The fix is to place "ipc/RPMessage" global data into core-private memo=
ry.
-- MCT-1279
-
-Upstream-Status: Submitted
-
-Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
----
- monitor/cmds/monitor.cmd | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/monitor/cmds/monitor.cmd b/monitor/cmds/monitor.cmd
-index a6a9fb9..6ec4151 100644
---- a/monitor/cmds/monitor.cmd
-+++ b/monitor/cmds/monitor.cmd
-@@ -164,6 +164,13 @@ SECTIONS
-     } run=3DDDR3_VIRT, load=3DDDR3_PER_CORE
-      */
-=20
-+    /* ipc (e.g. RPMessage_module) need to be private for each core */
-+    .otherlocalfar :
-+    {
-+                "*.ae66"            (.fardata)
-+                "*.ae66"            (.far)
-+    } run=3DDDR3_VIRT, load=3DDDR3_PER_CORE
-+
-     .localddr: run=3DDDR3_VIRT, load=3DDDR3_PER_CORE
-     .ctools_core_private: run=3DDDR3_VIRT, load=3DDDR3_PER_CORE
-=20
---=20
-2.17.1
-
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index bb7ff839..8e77302e 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -7,7 +7,7 @@ require recipes-ti/includes/ti-paths.inc
=20
 PR =3D "${INC_PR}.1"
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS =3D "opencl opencl-monitor ti-cgt6x-native clocl-native"
@@ -80,8 +80,6 @@ OCL_MPAX_EXAMPLE_LIST =3D " vecadd_mpax \
                           vecadd_mpax_openmp \
 "
=20
-OCL_EXAMPLE_LIST_append_k2hk =3D " ${OCL_MPAX_EXAMPLE_LIST}"
-
 python do_unpack_append() {
     s =3D d.getVar("S")
     os.makedirs(s)
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index bb1f37d4..4beadb36 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -12,7 +12,6 @@ REQUIRED_DISTRO_FEATURES =3D "opencl openmp"
=20
 PR =3D "${INC_PR}.2"
 SRC_URI +=3D "file://0001-Update-VRING-in-resource-table-for-new-Linux-k=
ernel.patch;patchdir=3D.."
-SRC_URI +=3D "file://0002-Fix-K2x-race-condition-during-DSP-firmware-boo=
ting.patch;patchdir=3D.."
=20
 inherit update-alternatives
=20
@@ -31,37 +30,15 @@ DEPENDS =3D " ti-llvm3.6-native \
             openmp-rtos \
 "
=20
-DEPENDS_append_k2hk =3D " multiprocmgr-rtos \
-                            qmss-lld-rtos \
-                            cppi-lld-rtos \
-                            rm-lld-rtos \
-"
-
-DEPENDS_append_k2l  =3D " multiprocmgr-rtos \
-                            qmss-lld-rtos \
-                            cppi-lld-rtos \
-                            rm-lld-rtos \
-"
-
-DEPENDS_append_k2e  =3D " multiprocmgr-rtos \
-                            qmss-lld-rtos \
-                            cppi-lld-rtos \
-                            rm-lld-rtos \
-"
-
 DEPENDS_append_dra7xx =3D " opencl-tidl-fw \
 "
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/monitor"
=20
 BUILD_TARGET_dra7xx =3D "ARM_AM57"
-BUILD_TARGET_k2hk =3D "ARM_K2H"
-BUILD_TARGET_k2l =3D "ARM_K2L"
-BUILD_TARGET_k2e =3D "ARM_K2E"
-BUILD_TARGET_k2g =3D "ARM_K2G"
=20
 export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
 export PDK_DIR =3D "${PDK_INSTALL_DIR}"
@@ -108,28 +85,6 @@ do_install_append_dra7xx() {
     install -m ${OCL_FPERMS} monitor_am57x/dsp1.out ${D}${base_libdir}/f=
irmware/dra7-dsp2-fw.xe66.${BPN}
 }
=20
-do_install_append_k2hk() {
-    for i in {0..7}; do install -m ${OCL_FPERMS} monitor_evmk2h/dsp${i}.=
out ${SHARE_PATH}; done
-    install_dsp_objs evmk2h
-}
-
-do_install_append_k2l() {
-    for i in {0..3}; do install -m ${OCL_FPERMS} monitor_evmk2l/dsp${i}.=
out ${SHARE_PATH}; done
-    install_dsp_objs evmk2l
-}
-
-do_install_append_k2e() {
-    install -m ${OCL_FPERMS} monitor_evmk2e/dsp0.out ${SHARE_PATH}
-    install_dsp_objs evmk2e
-}
-
-do_install_append_k2g() {
-    install -m ${OCL_FPERMS} monitor_evmk2g/dsp0.out ${SHARE_PATH}
-    install -m ${OCL_FPERMS} monitor_evmk2g/dsp0.out ${SHARE_PATH}/dsp.o=
ut
-    install -m ${OCL_FPERMS} monitor_evmk2g/dsp.syms ${SHARE_PATH}
-    install -m ${OCL_FPERMS} monitor_evmk2g/dsp_syms.obj ${SHARE_PATH}
-}
-
 ALTERNATIVE_${PN}_dra7xx =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
 ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp1-fw.xe66"
 ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp1-fw.xe66.${BPN}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-=
extras/recipes-ti/ocl/opencl_git.bb
index 48bbc02c..d6399432 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -8,7 +8,7 @@ PR =3D "${INC_PR}.3"
=20
 inherit cmake systemd
=20
-COMPATIBLE_MACHINE =3D "dra7xx|keystone"
+COMPATIBLE_MACHINE =3D "dra7xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 # Define runtime package for minimal dependencies to run opencl applicat=
ions
@@ -38,8 +38,6 @@ DEPENDS =3D " ocl-gl-headers \
 "
=20
 DEPENDS_append_dra7xx =3D " ti-ipc virtual/kernel"
-DEPENDS_append_keystone =3D " mpm-transport multiprocmgr"
-DEPENDS_remove_k2g =3D " libulm"
=20
 RDEPENDS_${PN}-runtime +=3D "bash ${MONITORS}"
 RDEPENDS_${PN}-dev +=3D "ocl-gl-headers-dev"
@@ -53,13 +51,8 @@ S =3D "${WORKDIR}/git/host"
 export WANT_LLVM_RELEASE =3D "3.6-ti"
=20
 OCL_BUILD_TARGET_dra7xx =3D "ARM_AM57"
-OCL_BUILD_TARGET_k2hk =3D "ARM_K2H"
-OCL_BUILD_TARGET_k2l =3D "ARM_K2L"
-OCL_BUILD_TARGET_k2e =3D "ARM_K2E"
-OCL_BUILD_TARGET_k2g =3D "ARM_K2G"
=20
 ENABLE_ULM =3D "1"
-ENABLE_ULM_k2g =3D "0"
 SHMEM_MANAGER =3D "CMEM"
=20
 EXTRA_OECMAKE +=3D " -DBUILD_TARGET=3D${OCL_BUILD_TARGET} -DBUILD_OUTPUT=
=3Dlib -DENABLE_ULM=3D${ENABLE_ULM} -DOCL_VERSION=3D${PV} -DSHMEM_MANAGER=
=3D${SHMEM_MANAGER}"
@@ -67,7 +60,7 @@ EXTRA_OECMAKE +=3D " -DBUILD_TARGET=3D${OCL_BUILD_TARGE=
T} -DBUILD_OUTPUT=3Dlib -DENABL
 EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR} LINUX_DEVK=
IT_ROOT=3D${STAGING_DIR_HOST}"
 export KERNEL_INSTALL_DIR =3D "${STAGING_KERNEL_DIR}"
=20
-MCTD =3D "${S}/mct-daemon/ti-mct-daemon.service.k2x"
+MCTD =3D ""
 MCTD_dra7xx =3D "${S}/mct-daemon/ti-mct-daemon.service.am57x"
=20
 do_install_append() {
--=20
2.25.1

