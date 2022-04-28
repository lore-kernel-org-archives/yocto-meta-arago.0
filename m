Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661C8C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:29:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.11354.1651156159407004793
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 07:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gWTm6enO;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SETHJD006517;
	Thu, 28 Apr 2022 09:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651156157;
	bh=nHvQwhRlGHdjve5bjhLnbdoHCZUiXt0q1tk3qYGk2uM=;
	h=From:To:CC:Subject:Date;
	b=gWTm6enOpHgwlUqJDjsRKA6rfuVB1G7zQvq90KY7d8ZxrlB48iYGZFnTFn1fl0l0y
	 Qpj8UI8HQiiZXreKVsMbXogF0tVdyZWk/PBbSma5/yk2a/v4o2+zffe73JDo5bEsib
	 Sl10yLBTUmcuj3gCdUBJ5Q6NvbAo2xHHD1CzXIDw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SETHJK005177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 09:29:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 09:29:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 09:29:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SETGCc008159;
	Thu, 28 Apr 2022 09:29:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] Rename machine from omap-a15 to am57xx
Date: Thu, 28 Apr 2022 09:29:15 -0500
Message-ID: <20220428142915.15979-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 14:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13817

The "omap-a15" is a bit of a legacy holdover and is confusing.
This causes issues with mixed usage of 'dra7xx' and 'omap-a15'.
For example all EVM using this SoC family include dra7x.inc
so both are always defined, then we use 'omap-a15' in several
places where we really mean 'am57xx'. 'dra7xx' can't be filtered
for as needed like in the case of PRU.

AM57x is arguably the real superset device. Lets use that name
then start filtering correctly out the DRA7x to only be used
when we actually mean DRA7x.

This patch makes no functional change.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-prefs.inc       |  2 +-
 .../conf/distro/include/branding-glsdk.inc    |  4 +--
 .../distro/include/branding-processor-sdk.inc |  4 +--
 .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
 .../images/tisdk-default-image.bb             |  2 +-
 .../packagegroups/packagegroup-arago-gst.bb   |  2 +-
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  6 ++--
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  6 ++--
 .../packagegroup-arago-tisdk-addons.bb        | 22 +++++++--------
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  2 +-
 .../packagegroup-arago-tisdk-graphics.bb      |  2 +-
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  2 +-
 .../packagegroup-arago-tisdk-hmi.bb           |  2 +-
 .../packagegroup-arago-tisdk-matrix.bb        |  8 +++---
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |  2 +-
 ...group-arago-tisdk-multimedia-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-multimedia.bb    |  4 +--
 .../recipes-core/packagegroups/ti-demos.bb    |  2 +-
 .../recipes-core/packagegroups/ti-test.bb     |  2 +-
 .../recipes-core/packagegroups/ti-world.bb    |  2 +-
 .../recipes-qt/qt5/qtdeclarative_git.bbappend |  2 +-
 .../ti-tisdk-makefile_1.0.bb                  | 28 +++++++++----------
 .../big-data-ipc-demo/big-data-ipc-demo.inc   |  6 ++--
 .../matrix/matrix-gui-3d-demos_2.0.bb         |  4 +--
 .../recipes-devtools/omapconf/omapconf_git.bb |  2 +-
 .../util-scripts/glsdk-util-scripts.bb        |  2 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          |  2 +-
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  2 +-
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |  2 +-
 .../tensorflow-lite-demo_git.bb               |  2 +-
 .../recipes-ti/llvm-rtos/llvm-rtos_git.bb     |  4 +--
 .../recipes-ti/ocl-rtos/clocl-win_git.bb      |  4 +--
 .../ocl-rtos/opencl-examples-rtos_git.bb      |  4 +--
 .../ocl-rtos/opencl-monitor-rtos_git.bb       |  6 ++--
 .../recipes-ti/ocl-rtos/opencl-rtos_git.bb    |  6 ++--
 35 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 65ce2a96..067307b9 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -33,4 +33,4 @@ PREFERRED_VERSION_obex = "0.34"
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
-#PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant:am57xx = "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
index 0abd73cc..50c79533 100644
--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
@@ -3,8 +3,8 @@
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
 
-PREFERRED_PROVIDER_virtual/bootloader:omap-a15 = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot:omap-a15 = "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader:am57xx = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot:am57xx = "u-boot-ti-staging"
 
 # Set the PREFERRED_VERSION of libdrm to the glsdk version for the 
 # glsdk branded builds
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 25bb1b8c..f95815d3 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -2,8 +2,8 @@ ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 
 # Set CMEM reserved memory region
 RESERVE_CMEM = "${@bb.utils.contains('MACHINE_FEATURES','dsp','1','0',d)}"
-CMEM_BASE:omap-a15 ?= "a0000000"
-CMEM_SIZE:omap-a15 ?= "08000000"
+CMEM_BASE:am57xx ?= "a0000000"
+CMEM_SIZE:am57xx ?= "08000000"
 
 # To create newlines in the message \n is used and the slash must be escaped
 # to function properly
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index cf4d0298..d4543a29 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -7,7 +7,7 @@ IMAGE_NAME_SUFFIX = ""
 
 inherit tisdk-bundle
 
-COMPATIBLE_MACHINE = "omapl138|ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "omapl138|ti33x|ti43x|am57xx|k3"
 
 # List of packages to remove from the host package.  This is usually due to
 # licensing issues and unneeded dependencies.
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index cd0f71b7..1972ddc8 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -34,7 +34,7 @@ IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
 
 # Below is the delta in packages between old fuller and a new smaller default rootfs
 CHROMIUM = ""
-CHROMIUM:append:omap-a15 = "\
+CHROMIUM:append:am57xx = "\
     chromium-ozone-wayland \
 "
 CHROMIUM:append:k3 = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 65e315a1..32787ebd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -27,7 +27,7 @@ GSTREAMER_DEPS:append:dra7xx = " \
 "
 
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+GSTREAMER_ACCEL_MM:am57xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
 GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index a741eb03..d4e36bb3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -18,7 +18,7 @@ UTILS = " \
 #    ti-pru-sw-examples-source \
 #"
 
-UTILS:append:omap-a15 = " \
+UTILS:append:am57xx = " \
     omapconf-source \
     pru-icss-source \
 "
@@ -55,7 +55,7 @@ UTILS:append:am64xx = " \
 
 EXTRA_LIBS = ""
 
-EXTRA_LIBS:append:omap-a15 = " \
+EXTRA_LIBS:append:am57xx = " \
     cmem-mod-source \
     uio-module-drv-source \
     big-data-ipc-demo-linux-source \
@@ -81,7 +81,7 @@ PDM_ANOMALY_PKG_SRC = "\
 
 EXTRA_PACKAGES = ""
 
-EXTRA_PACKAGES:append:omap-a15 = " \
+EXTRA_PACKAGES:append:am57xx = " \
     ${PDM_ANOMALY_PKG_SRC} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 43a043e1..aa6d0ca2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -30,7 +30,7 @@ EXTRA_LIBS:append:ti43x = "\
     cmem-dev \
     cmem-staticdev \
 "
-EXTRA_LIBS:append:omap-a15 = " cmem-dev"
+EXTRA_LIBS:append:am57xx = " cmem-dev"
 EXTRA_LIBS:append:dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
@@ -54,7 +54,7 @@ EXTRA_PACKAGES:append:ti43x = " \
                                 tensorflow-lite-staticdev \
                                 ${PDM_ANOMALY_PKG_DEV} \
 "
-EXTRA_PACKAGES:append:omap-a15 = " \
+EXTRA_PACKAGES:append:am57xx = " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
@@ -71,7 +71,7 @@ IPCDEV = " \
 	ti-ipc-staticdev \
 "
 
-EXTRA_PACKAGES:append:omap-a15 = " ${IPCDEV}"
+EXTRA_PACKAGES:append:am57xx = " ${IPCDEV}"
 EXTRA_PACKAGES:append:omapl138 = " ${IPCDEV}"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 363602b5..8ce0c1e0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -46,14 +46,14 @@ UTILS:append:ti43x = " mmc-utils \
                        uio-test-pruss \
 "
 
-UTILS:append:omap-a15 = " mmc-utils \
-                          switch-config \
-                          libdrm-omap \
-                          stream-openmp \
-                          pru-icss \
-                          ti-ipc-rtos-fw \
-                          uio-test-pruss \
-                          uio-module-drv-test \
+UTILS:append:am57xx = " mmc-utils \
+                        switch-config \
+                        libdrm-omap \
+                        stream-openmp \
+                        pru-icss \
+                        ti-ipc-rtos-fw \
+                        uio-test-pruss \
+                        uio-module-drv-test \
 "
 
 UTILS:append:k3 = " mmc-utils \
@@ -79,7 +79,7 @@ UTILS:append:dra7xx = " \
 "
 
 EXTRA_LIBS = ""
-EXTRA_LIBS:append:omap-a15 = " \
+EXTRA_LIBS:append:am57xx = " \
     cmem \
     uio-module-drv \
 "
@@ -104,10 +104,10 @@ EXTRA_PACKAGES:omapl138 = " \
     protobuf \
 "
 
-EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
+EXTRA_PACKAGES:append:am57xx = " ti-ipc-examples-linux"
 EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
 
-EXTRA_PACKAGES:append:omap-a15 = " \
+EXTRA_PACKAGES:append:am57xx = " \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo-linux big-data-ipc-demo-linux-firmware','',d)} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index bd27f0f1..4ece27cf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -17,7 +17,7 @@ KERNEL_SHADOW_CLONE_ENABLED := "${SRCIPK_SHALLOW_CLONE:pn-${KERNEL_SHADOW_CLONE}
 
 EXTRA_FILES = ""
 EXTRA_FILES:ti43x = "tisdk-uenv"
-EXTRA_FILES:omap-a15 = "tisdk-readme tisdk-uenv"
+EXTRA_FILES:am57xx = "tisdk-readme tisdk-uenv"
 EXTRA_FILES:k3 = "tisdk-readme tisdk-uenv"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 1d450600..a0b784cb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -14,7 +14,7 @@ GFX_WAYLAND = "\
 "
 
 GFX_UTILS = ""
-GFX_UTILS:append:omap-a15  = "\
+GFX_UTILS:append:am57xx  = "\
     glsdk-util-scripts \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 2cd7ae6b..a262fc90 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -22,7 +22,7 @@ HMI:append:ti33x = " \
 "
 
 
-HMI:append:omap-a15 = " \
+HMI:append:am57xx = " \
     evse-hmi-source \
     mmwavegesture-hmi-source \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index e16727c4..20198d31 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -23,7 +23,7 @@ HMI:append:ti43x = " \
     mmwavegesture-hmi \
 "
 
-HMI:append:omap-a15 = " \
+HMI:append:am57xx = " \
     evse-hmi \
     mmwavegesture-hmi \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 361bd04b..27b6169b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -35,7 +35,7 @@ MATRIX_QT_APPS = " \
     matrix-gui-thermostat-demo \
 "
 
-MATRIX_QT_APPS:append:omap-a15 = " \
+MATRIX_QT_APPS:append:am57xx = " \
     matrix-analytics-pdm-anomaly-detection \
     matrix-hmi-demo-evse            \
     matrix-hmi-demo-mmwavegesture   \
@@ -76,7 +76,7 @@ MATRIX_GPU_DEMOS = " \
     matrix-3d-demo-kmscube \
 "
 
-MATRIX_GPU_DEMOS:append:omap-a15 = " \
+MATRIX_GPU_DEMOS:append:am57xx = " \
     matrix-3d-demo-kmscubevideo \
 "
 
@@ -99,7 +99,7 @@ MATRIX_OPENCV_OPENCL_APPS = " \
     matrix-machinevision-demo-barcoderoi-f2f \
 "
 
-MATRIX_OPENCV_OPENCL_APPS:omap-a15 = " \
+MATRIX_OPENCV_OPENCL_APPS:am57xx = " \
      matrix-machinevision-demo-barcoderoi \
      matrix-machinevision-demo-simplepeopletracking \
 "
@@ -138,7 +138,7 @@ MATRIX_APPS:append:ti43x = "        \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
 
-MATRIX_APPS:append:omap-a15 = "     \
+MATRIX_APPS:append:am57xx = "     \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h265dec  \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index 3169fd0a..1ec45970 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
@@ -24,7 +24,7 @@ MULTIMEDIA:append:ti43x = " \
     ${BARCODE_PKG} \
 "
 
-MULTIMEDIA:append:omap-a15 = " \
+MULTIMEDIA:append:am57xx = " \
     ${DUAL_CAMERA_PKG} \
     ${IMAGE_GALLERY_PKG} \
     ${BARCODE_PKG} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 62bcc0ea..aeee9664 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -21,7 +21,7 @@ MULTIMEDIA:append:dra7xx = " \
 
 MULTIMEDIA:append:ti33x = " ${BARCODE_PKG}"
 MULTIMEDIA:append:ti43x = " ${BARCODE_PKG}"
-MULTIMEDIA:append:omap-a15 = " ${BARCODE_PKG}"
+MULTIMEDIA:append:am57xx = " ${BARCODE_PKG}"
 MULTIMEDIA:append:am65xx = " ${BARCODE_PKG}"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 9d6767b0..12e7bbbf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -20,7 +20,7 @@ MULTIMEDIA:append:ti43x = " \
     ${IMAGE_GALLERY_DEMO} \
 "
 
-MULTIMEDIA:append:omap-a15 = " \
+MULTIMEDIA:append:am57xx = " \
     ${DUAL_CAMERA_DEMO} \
     ${IMAGE_GALLERY_DEMO} \
 "
@@ -36,7 +36,7 @@ MULTIMEDIA:append:omap5-evm = " \
 
 ACCEL_MM = ""
 
-ACCEL_MM:append:omap-a15 = " \
+ACCEL_MM:append:am57xx = " \
     ipumm-fw \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 3fbf4199..f55e4814 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -10,7 +10,7 @@ PDM_ANOMALY_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-
 PDM_ANOMALY = ""
 PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
 PDM_ANOMALY:ti43x = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:omap-a15 = "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY:am57xx = "${PDM_ANOMALY_PKG}"
 PDM_ANOMALY:am65xx = "${PDM_ANOMALY_PKG}"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 07dbdf38..21da6c50 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -68,7 +68,7 @@ ARAGO_TI_TEST:append:ti43x = " \
 
 NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
 
-ARAGO_TI_TEST:append:omap-a15 = " \
+ARAGO_TI_TEST:append:am57xx = " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 323d88ae..c629e150 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -8,7 +8,7 @@ inherit packagegroup
 INSANE_SKIP:${PN} += "dev-deps"
 
 CHROMIUM = ""
-CHROMIUM:append:omap-a15 = "\
+CHROMIUM:append:am57xx = "\
     chromium-ozone-wayland \
 "
 CHROMIUM:append:k3 = "\
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
index 4167ac43..3fbc79e1 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
@@ -1,7 +1,7 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 PR:append = ".tisdk1"
 
-CXXFLAGS:append:omap-a15 = " -DQ_OS_BLACKBERRY"
+CXXFLAGS:append:am57xx = " -DQ_OS_BLACKBERRY"
 
 
 SRC_URI += " \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 85b99bf2..bd5bfbce 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -109,18 +109,18 @@ MAKEFILES:append:dra7xx = " cryptodev \
                             tiovx-app-host \
 "
 
-MAKEFILES:append:omap-a15 = " u-boot-spl \
-                              omapconf \
-                              linux-dtbs \
-                              ti-sgx-ddk-km \
-                              cmem-mod \
-                              pru-icss \
-                              ti-gc320-driver \
-                              barcode-roi \
-                              uio-module-drv \
-			      mmwavegesture-hmi \
-                              pdm-anomaly-detection \
-                              ti-ipc \
+MAKEFILES:append:am57xx = " u-boot-spl \
+                            omapconf \
+                            linux-dtbs \
+                            ti-sgx-ddk-km \
+                            cmem-mod \
+                            pru-icss \
+                            ti-gc320-driver \
+                            barcode-roi \
+                            uio-module-drv \
+                            mmwavegesture-hmi \
+                            pdm-anomaly-detection \
+                            ti-ipc \
 "
 MAKEFILES:append:omapl138 = " linux-dtbs \
                               u-boot-spl \
@@ -179,7 +179,7 @@ PLATFORM_GDBSERVERPROXY:dra7xx = "DRA7xx_PLATFORM"
 PRU_ICSS_INSTALL_TARGET = "pru-icss_install_none"
 PRU_ICSS_INSTALL_TARGET:ti33x = "pru-icss_install_am335x"
 PRU_ICSS_INSTALL_TARGET:ti43x = "pru-icss_install_am437x"
-PRU_ICSS_INSTALL_TARGET:omap-a15 = "pru-icss_install_am572x"
+PRU_ICSS_INSTALL_TARGET:am57xx = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET:am65xx = "pru-icss_install_am65x"
 PRU_ICSS_INSTALL_TARGET:j7 = "pru-icss_install_j721e"
 PRU_ICSS_INSTALL_TARGET:am64xx = "pru-icss_install_am64x"
@@ -194,7 +194,7 @@ IPC_TOOLS_PATHS_R5F  = "ti.targets.arm.elf.R5F="\$\(TOOLCHAIN_PATH_R5\)""
 IPC_TOOLS_PATHS_C674 = "ti.targets.elf.C674="\$\(C6X_GEN_INSTALL_PATH\)""
 
 IPC_TOOLS_PATHS = ""
-IPC_TOOLS_PATHS:append:omap-a15 = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"
+IPC_TOOLS_PATHS:append:am57xx = " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS_PATHS_M4}"
 IPC_TOOLS_PATHS:append:omapl138 = " ${IPC_TOOLS_PATHS_C674}"
 IPC_TOOLS_PATHS:append:k3 = "${IPC_TOOLS_PATHS_R5F}"
 
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
index 32ead99c..e101ada7 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc7807ece7adcc2c43a"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git"
@@ -20,10 +20,10 @@ PV = "01.03.00.00"
 S = "${WORKDIR}/git"
 
 PLATFORM = "UNKNOWN"
-PLATFORM:omap-a15 = "DRA7XX"
+PLATFORM:am57xx = "DRA7XX"
 
 IPC_TARGETS = ""
-IPC_TARGETS:omap-a15 = "\
+IPC_TARGETS:am57xx = "\
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 2c2aef82..2cfb53d9 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -27,7 +27,7 @@ PACKAGES = "matrix-3d-demo-chameleon \
             matrix-3d-demo-exampleui    \
 "
 
-PACKAGES:append:omap-a15 = " \
+PACKAGES:append:am57xx = " \
             matrix-3d-demo-kmscube      \
             matrix-3d-demo-kmscubevideo \
 "
@@ -53,7 +53,7 @@ do_install:prepend() {
 
 3D_DEMOS_RDEPENDS_MATRIX = "matrix-gui-apps-images matrix-gui-submenus-3d"
 3D_DEMOS_RDEPENDS = "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS:omap-a15 = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+3D_DEMOS_RDEPENDS:am57xx   = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS:ti43x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS:ti33x    = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
 3D_DEMOS_RDEPENDS:k3       = "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 3d3af349..26c3a557 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
 PV = "1.75+git${SRCPV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap4"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|omap4"
 
 BRANCH ?= "master"
 SRCREV = "ff07b6992bacb1e1586c72b7d2be469caee4a347"
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
index cf187a29..a8e6df27 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debug/filter-dmesg-rproc.sh;md5=ce264e7cbc036fd2f37073947c2f0800"
 PR = "r1"
 
-COMPATIBLE_MACHINE = "omap-a15|j7"
+COMPATIBLE_MACHINE = "am57xx|j7"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS:${PN} += "bash"
 
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index d855d191..2ae4169a 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -11,7 +11,7 @@ SRCREV = "e52592c843ad16be31db411b85c4059d82c4a6b9"
 
 PR = "r19"
 
-COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
+COMPATIBLE_MACHINE = "am57xx|ti43x|ti33x|k3"
 
 S = "${WORKDIR}/git"
 SRC_DIR = "arm"
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 8804544f..83e82adc 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a2
 
 DEPENDS = "ffmpeg libdce libdrm virtual/libgbm ti-sgx-ddk-um wayland"
 
-COMPATIBLE_MACHINE = "omap-a15|ti43x"
+COMPATIBLE_MACHINE = "am57xx|ti43x"
 
 inherit autotools pkgconfig
 
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index de9f1c7d..5b075636 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -20,7 +20,7 @@ SRC_URI:append:ti33x = " \
     file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
 "
 
-SRC_URI:append:omap-a15 = " \
+SRC_URI:append:am57xx = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
index c1e47def..2900d781 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES:append:dra7xx = " opencl"
 DEPENDS = "tensorflow-lite flatbuffers opencv"
 DEPENDS:append:dra7xx = " tidl-api"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PV = "01.00.00"
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
index 2054b1bb..c389f085 100644
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
@@ -14,12 +14,12 @@ PR = "${INC_PR}.0"
 
 DEPENDS = "gcc-arm-baremetal-native cmake-native"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
 RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
+RELEASE_TARGET:am57xx = "am57xx"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
index d1fffae2..f7876802 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
@@ -17,11 +17,11 @@ SRCREV = "${CLOCL_WIN_SRCREV}"
 
 LIC_FILES_CHKSUM = "file://opencl-manifest.html;md5=e0810676ad435e2ef53c1a538e24a9a7"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
+RELEASE_TARGET:am57xx = "am57xx"
 
 S = "${WORKDIR}/git"
 export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 883be797..fee27996 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl-rtos ti-cgt6x-native clocl-rtos-native opencl-monitor-rtos \
@@ -37,7 +37,7 @@ OCL_EXAMPLE_LIST = " abort_exit \
 "
 
 RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
+RELEASE_TARGET:am57xx = "am57xx"
 
 export BIOS_INSTALL_DIR = "${SYSBIOS_INSTALL_DIR}"
 export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index 2c53f684..c802aef7 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -21,15 +21,15 @@ DEPENDS = " ti-llvm3.6-native \
             gcc-arm-baremetal-native \
 "
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/monitor"
 
-BUILD_TARGET:omap-a15   = "ARM_AM57"
+BUILD_TARGET:am57xx = "ARM_AM57"
 
 RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
+RELEASE_TARGET:am57xx = "am57xx"
 
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export PDK_DIR = "${PDK_INSTALL_DIR}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index bed29bc1..e994cab4 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -8,7 +8,7 @@ require recipes-ti/includes/arago-paths.inc
 PR = "${INC_PR}.0"
 
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "am57xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES += " ${PN}-runtime"
@@ -35,13 +35,13 @@ B = "${WORKDIR}/build"
 
 export WANT_LLVM_RELEASE = "3.6-ti"
 
-OCL_BUILD_TARGET:omap-a15   = "ARM_AM57"
+OCL_BUILD_TARGET:am57xx = "ARM_AM57"
 
 ENABLE_ULM = "0"
 SHMEM_MANAGER = "CMEM"
 
 RELEASE_TARGET = ""
-RELEASE_TARGET:omap-a15 = "am57xx"
+RELEASE_TARGET:am57xx = "am57xx"
 
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export ARM_LLVM_DIR="${LLVM_RTOS_INSTALL_DIR}"
-- 
2.17.1


