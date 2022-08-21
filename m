Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21781C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 18:37:10 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.9786.1661107026909083140
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 21 Aug 2022 11:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RZNirdtP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27LIb3hm081187;
	Sun, 21 Aug 2022 13:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661107023;
	bh=MFv9e6S0hYJhP9hmUA8KxdktNO2nc5JwZVD3C5mVK7o=;
	h=From:To:Subject:Date;
	b=RZNirdtPmnd/+fYU8nQ+dsdvsF21bhXfGHhcCQeuWs0qLnmkoWSIFBSMIPawVE4JM
	 rulb1q/JFVgXfFkPrjv4Ja9y/2zWX7nWZ6Lk75rBAativDX4PVj/l8z0kSE5TQ3z/2
	 RY14SUMJvuWSTdL9TvsN9DVwHygNqgQFb/1VIp8g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27LIb327047549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 21 Aug 2022 13:37:03 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Sun, 21
 Aug 2022 13:37:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Sun, 21 Aug 2022 13:37:03 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27LIb3Se129956;
	Sun, 21 Aug 2022 13:37:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oPpol-0005h6-8y; Sun, 21 Aug 2022 13:37:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v2] all: Stop using git://git.ti.com
Date: Sun, 21 Aug 2022 13:37:03 -0500
Message-ID: <20220821183703.21847-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 21 Aug 2022 18:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13978

Stop using un-encrypted git:// protocol to access TI repositories.

This is inline with the same arguments as made by github in
https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rework/rebase of the original patch from Nishanth now that our new
    build servers can handle this change.

 .../conf/distro/include/branding-bleeding.inc             | 4 ++--
 .../recipes-connectivity/linuxptp/linuxptp_%.bbappend     | 2 +-
 .../recipes-core/meta/external-arm-toolchain.bbappend     | 4 ++--
 .../linux-libc-headers/linux-libc-headers_5.10.bb         | 4 ++--
 .../recipes-tisdk/oe-layersetup/oe-layersetup.bb          | 2 +-
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb        | 2 +-
 .../recipes-apps/barcode-demo/barcode-roi_git.bb          | 2 +-
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc  | 4 ++--
 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb   | 2 +-
 .../recipes-apps/image-gallery/image-gallery_git.bb       | 2 +-
 .../mmwavegesture-hmi/mmwavegesture-hmi_git.bb            | 2 +-
 .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb    | 2 +-
 .../point-cloud-viewer/point-cloud-viewer_git.bb          | 2 +-
 .../recipes-apps/posix-smp-demo/posix-smp-demo.inc        | 4 ++--
 .../protection-relays-hmi/protection-relays-hmi_git.bb    | 2 +-
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb          | 2 +-
 .../qt-opencv-opencl-opengl-multithreaded_git.bb          | 2 +-
 .../arm-benchmarks/arm-benchmarks_1.3.bb                  | 2 +-
 meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb | 2 +-
 .../recipes-bsp/switch-config/switch-config_git.bb        | 2 +-
 meta-arago-extras/recipes-connectivity/hostap/hostap.inc  | 2 +-
 .../wpa-supplicant/wpa-supplicant.inc                     | 2 +-
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb             | 2 +-
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb     | 8 ++++----
 .../recipes-core/matrix/matrix-gui-apps-git.inc           | 2 +-
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb         | 2 +-
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | 2 +-
 .../recipes-core/matrix/refresh-screen_2.0.bb             | 2 +-
 .../recipes-core/oprofile-example/oprofile-example_git.bb | 2 +-
 .../ti-crypto-examples/ti-crypto-examples_git.bb          | 2 +-
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb          | 2 +-
 meta-arago-extras/recipes-devtools/statcol/statcol.bb     | 4 ++--
 .../recipes-devtools/util-scripts/glsdk-util-scripts.bb   | 2 +-
 .../glsdk-example-apps/glsdk-example-apps.bb              | 2 +-
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb     | 2 +-
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb     | 2 +-
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb            | 2 +-
 meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb  | 2 +-
 .../recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb | 2 +-
 .../amsdk-av-files/amsdk-av-files_1.4.bb                  | 2 +-
 .../recipes-multimedia/av-examples/av-examples_1.0.bb     | 2 +-
 .../demo-image-proc/demo-image-proc_git.bb                | 2 +-
 .../dual-camera-demo/dual-camera-demo_1.0.bb              | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb      | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb     | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb       | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb        | 2 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb              | 2 +-
 .../recipes-support/cclink/ccief-basic_git.bb             | 4 ++--
 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc   | 2 +-
 .../recipes-support/libnl-xfrm/libnl-xfrm_git.bb          | 2 +-
 .../tensorflow-lite/tensorflow-lite-demo_git.bb           | 2 +-
 meta-arago-extras/recipes-ti/fftlib/fftlib.inc            | 4 ++--
 meta-arago-extras/recipes-ti/libarch/libarch.inc          | 2 +-
 meta-arago-extras/recipes-ti/linalg/linalg.inc            | 4 ++--
 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc      | 4 ++--
 meta-arago-extras/recipes-ti/netapi/netapi.inc            | 4 ++--
 meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb    | 2 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc                  | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb    | 4 ++--
 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc      | 4 ++--
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc        | 4 ++--
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc    | 2 +-
 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb      | 2 +-
 meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc          | 2 +-
 65 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 71b09f71..d6a3e709 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -20,8 +20,8 @@ TI_LINUX_FW_SRCREV = "${AUTOREV}"
 K3_IMAGE_GEN_SRCREV = "${AUTOREV}"
 
 # Point to latest nightly metadata
-#TI_RTOS_METADATA_URI = "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
-#TI_RTOS_METADATA_PROTOCOL = "git"
+#TI_RTOS_METADATA_URI = "git://git.ti.com/git/processor-sdk/coresdk_rtos_releases.git"
+#TI_RTOS_METADATA_PROTOCOL = "https"
 TI_RTOS_METADATA_SRCREV = "${AUTOREV}"
 TI_RTOS_METADATA_BRANCH = "next"
 
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index e4fb109a..4416f2f7 100644
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -5,7 +5,7 @@ BRANCH = "ti-linuxptp"
 SRCREV = "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
 
 SRC_URI = " \
-    git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
+    git://git.ti.com/git/processor-sdk/linuxptp.git;branch=${BRANCH} \
     file://build-Allow-CC-and-prefix-to-be-overriden.patch \
     file://Use-cross-cpp-in-incdefs.patch \
 "
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
index 1ceb80f9..3bed327b 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -6,8 +6,8 @@
 BRANCH = "ti-linux-5.10.y"
 SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
 PKGV_linux-libc-headers-dev = "5.10"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
index 7f4343d7..75b35465 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 BRANCH = "ti-linux-5.10.y"
 SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
index 8472e424..c2e00e96 100644
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -8,6 +8,6 @@ inherit allarch
 
 BRANCH ?= "master"
 SRCREV = "e58f941784fb45fd826779a45b33973e6342700f"
-SRC_URI = "git://git.ti.com/git/arago-project/oe-layersetup.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/git/arago-project/oe-layersetup.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 67c57f39..b1c1485c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -6,7 +6,7 @@ PR = "r47"
 
 BRANCH ?= "master"
 SRCREV = "eae21af9be4e7a0028045cc3e4038fe2157a266d"
-SRC_URI = "git://git.ti.com/arago-project/tisdk-setup-scripts.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
index 0673c0a4..ced37fad 100644
--- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -13,7 +13,7 @@ PV = "01.00.00"
 PR = "r1"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/apps/barcode-roi-detection.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/barcode-roi-detection.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "50fa051f66012ebaa10eba1cb289287c4c5e7432"
 
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
index 50d721b3..28969de5 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc78
 COMPATIBLE_MACHINE = "omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git"
-BIG_DATA_IPC_GIT_PROTOCOL = "git"
+BIG_DATA_IPC_GIT_URI = "git://git.ti.com/git/processor-sdk/big-data-ipc-examples.git"
+BIG_DATA_IPC_GIT_PROTOCOL = "https"
 BIG_DATA_IPC_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.03.00.00"
diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
index e2d7b882..06fa80de 100644
--- a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -8,7 +8,7 @@ PV = "1.0"
 PR = "r1"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sitara-linux/evse-hmi.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "d8c309d2832735f8df84db9993a01d861fdc02d7"
 
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
index 7bbfa320..502e593e 100644
--- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
@@ -13,7 +13,7 @@ PR = "r5"
 BRANCH = "master"
 SRCREV = "d9a2f2e27f59f3bbcde91efc6afba8cd04f3b4be"
 
-SRC_URI = "git://git.ti.com/matrix-gui-v2/image-gallery.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/matrix-gui-v2/image-gallery.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
index ff6b02a8..10244dad 100644
--- a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
@@ -8,7 +8,7 @@ PV = "1.0"
 PR = "r0"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/sitara-linux/mmwavegesture-hmi.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sitara-linux/mmwavegesture-hmi.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "0881fc8bc5b3c3411af7b69c3837a8b3a1fbedc5"
 
diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
index 266cabd9..14744de3 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
@@ -8,7 +8,7 @@ PV = "1.0"
 PR = "r2"
 
 BRANCH = "master"
-SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
+SRC_URI  = "git://git.ti.com/git/apps/pdm-anomaly-detection.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "2ccf0e5e5aaac73166d52374650a25652bd6aed2"
 
diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index 6e4394b6..b521d601 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 BRANCH = "master"
 
-SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-sdk/point-cloud-viewer.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "f0af54e63a6c802b4f8f0657873e74f1cb486e86"
 
diff --git a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
index 77b61ac8..20b0b08d 100644
--- a/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
+++ b/meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc
@@ -3,8 +3,8 @@ SUMMARY = "This recipe creates a posix-smp-demo binaries."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://dhry.h;beginline=1;endline=377;md5=8f2fbe6e071d9ea4afeca73cfd656ec8"
 
-POSIX_SMP_GIT_URI = "git://git.ti.com/keystone-demos/posix-smp.git"
-POSIX_SMP_GIT_PROTOCOL = "git"
+POSIX_SMP_GIT_URI = "git://git.ti.com/git/keystone-demos/posix-smp.git"
+POSIX_SMP_GIT_PROTOCOL = "https"
 POSIX_SMP_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.02B"
diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
index a0c7321f..a4a610ce 100755
--- a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
@@ -8,7 +8,7 @@ PV = "1.0"
 PR = "r0"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sitara-linux/protection-relays-hmi.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "b116b5628a68ba3b6db88435023cf034504655d3"
 
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 22c0023b..4818c507 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -19,7 +19,7 @@ DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 BRANCH ?= "master"
 SRCREV = "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
 
-SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/thermostat-demo.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 7d2fb51c..ee481439 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
@@ -17,7 +17,7 @@ PV = "1.3.3"
 PR = "r3"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "80051ec8befd921e40cfb74a49234ed045576bbc"
 
diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 528f5a6e..dbf778ac 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -9,7 +9,7 @@ PR = "r13"
 BRANCH ?= "master"
 SRCREV = "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
 
-SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/arm_benchmarks.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index 76617224..fef8eb8f 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
@@ -9,7 +9,7 @@ PR = "r0"
 BRANCH ?= "master"
 SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
 
-SRC_URI = "git://git.ti.com/sitara-linux/stream.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sitara-linux/stream.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index dca4bfe1..2768c6a6 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -11,7 +11,7 @@ BRANCH_aarch64 ?= "am65x-v1.0"
 SRCREV = "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
 SRCREV_aarch64 = "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
 
-SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/switch-config/switch-config.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 324de0be..5eb23001 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -18,7 +18,7 @@ INITSCRIPT_NAME="hostapd"
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/hostap.git;protocol=https;branch=${BRANCH} \
            file://defconfig \
 	       file://init"
 
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 65693270..9e2ad812 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -18,7 +18,7 @@ DEFAULT_PREFERENCE = "-1"
 
 PR = "r9"
 
-SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/hostap.git;protocol=https;branch=${BRANCH} \
            file://defconfig \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 4df536fd..455c3f29 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -10,7 +10,7 @@ PR = "r10"
 BRANCH ?= "master"
 SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
 
-SRC_URI = "git://git.ti.com/apps/am_sysinfo.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/am_sysinfo.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 16a3269b..44db9086 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -23,15 +23,15 @@ DEPENDS_append_class-target = " valgrind"
 LLVM_DIR = "ti-llvm${PV}"
 
 LLVM_GIT_NAME = "llvm"
-LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
-LLVM_GIT_PROTOCOL = "git"
+LLVM_GIT_URI = "git://git.ti.com/git/opencl/llvm.git"
+LLVM_GIT_PROTOCOL = "https"
 LLVM_GIT_BRANCH = "release_36_ti"
 LLVM_GIT_DESTSUFFIX = "git"
 LLVM_GIT_SRCREV = "09780c6750b30da81e4a0a805aedf1699fbc37c7"
 
 CLANG_GIT_NAME = "clang"
-CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
-CLANG_GIT_PROTOCOL = "git"
+CLANG_GIT_URI = "git://git.ti.com/git/opencl/clang.git"
+CLANG_GIT_PROTOCOL = "https"
 CLANG_GIT_BRANCH = "release_36_ti"
 CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
 CLANG_GIT_SRCREV = "5b006f07bdc22b5ae6917eecdfe243908dd7b029"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index d61cf748..16e20cf1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -3,7 +3,7 @@ LICENSE = "CC-BY-SA-3.0"
 LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
-SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=https;branch=${BRANCH}"
 SRCREV = "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
 BRANCH = "master"
 INC_PR = "r76"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 44f66d0d..54832103 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -23,7 +23,7 @@ QT5_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
 SRCREV = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
 BRANCH ?= "master"
 
-SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/matrix-gui-v2/matrix_browser.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 4cbd7174..9585204b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -20,7 +20,7 @@ SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
 
 MATRIX_INITSCRIPT = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
 
-SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2.git;protocol=https;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
            file://matrix-gui-2.0.service \
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 9e214f42..f1641f88 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -13,7 +13,7 @@ PR = "r9"
 SRCREV = "4c8817e28ceed2dd886761e3ec1971b11436ba33"
 BRANCH ?= "master"
 
-SRC_URI = "git://git.ti.com/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/matrix-gui-v2/refresh-screen.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index dd013c87..5178c249 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -13,7 +13,7 @@ PR = "r4"
 BRANCH ?= "master"
 SRCREV = "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
 
-SRC_URI = "git://git.ti.com/apps/oprofile-example.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/oprofile-example.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 0d4cb7ba..39462fa6 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -10,7 +10,7 @@ PR = "r7"
 BRANCH ?= "master"
 SRCREV = "6f4b09fffe970bb6b448369875874e798ef282f6"
 
-SRC_URI = "git://git.ti.com/git/arago-project-org/crypto-example-apps.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/git/arago-project-org/crypto-example-apps.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index f48510ff..cdcd8df9 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -18,7 +18,7 @@ SRCREV = "5bc71a00c0ea0cb744f37cc6bae0a9ea9fe74814"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-SRC_URI_prepend = "git://git.ti.com/test-automation/ltp-ddt.git;branch=${BRANCH} "
+SRC_URI_prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 12e10bcf..9d7b0ef6 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -3,10 +3,10 @@ SUMMARY = "Statistics collector application"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
-PROTOCOL = "git"
+PROTOCOL = "https"
 BRANCH = "master"
 SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
-SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 DEPENDS = "ti-rpmsg-char websocketd"
 RDEPENDS_${PN} = "bash"
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
index 9dd2cd39..20a8a202 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omap-a15|j7"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS_${PN} += "bash"
 
-SRC_URI = "git://git.ti.com/glsdk/util-scripts.git"
+SRC_URI = "git://git.ti.com/git/glsdk/util-scripts.git;protocol=https"
 
 SRCREV = "df50ca1592cae97ad0c7285686d602926b4f7305"
 
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 3e2452f4..909b8be0 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
+SRC_URI = "git://git.ti.com/git/glsdk/example-applications.git;protocol=https \
 "
 
 SRCREV="52466430609c402a9f1c0667ccf727d096336d0d"
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 6c9953d0..346cd625 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -6,7 +6,7 @@ CLEANBROKEN = "1"
 
 BRANCH = "master"
 
-SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/img-pvr-sdk.git;protocol=https;branch=${BRANCH}"
 SRCREV = "e52592c843ad16be31db411b85c4059d82c4a6b9"
 
 PR = "r19"
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 68a8efe7..68fb4ff6 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -15,7 +15,7 @@ SRCREV = "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
+SRC_URI = "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=https \
         file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
 "
 
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index 9138f27f..5eaf2f23 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -7,7 +7,7 @@ DEPENDS = "ti-gc320-libs"
 
 BRANCH = "ti-${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch=${BRANCH} \
 file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
 "
 SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
index 733f3ba4..df7b4592 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 BRANCH = "ti-linux-5.10.y"
 SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
index 3fc631b5..5ca54c2e 100644
--- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
+++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
@@ -8,7 +8,7 @@ PR = "r4"
 COMPATIBLE_MACHINE = "keystone"
 BRANCH = "v3.10.72/master"
 SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
-SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-linux/linux.git;protocol=https;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
index 2f570d43..d6729c5f 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
@@ -25,7 +25,7 @@ VIDEO_FILES_keystone = "video_720p "
 
 BRANCH = "master"
 
-SRC_URI = "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-sdk/amsdk-av-files.git;protocol=https;branch=${BRANCH}"
 SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
index 65ff4f3b..98401436 100644
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE = "(omap3)"
 BRANCH ?= "master"
 SRCREV = "b67b11011a8a54a7598eed383f3a106c32b47c6d"
 
-SRC_URI = "git://git.ti.com/apps/av_examples.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/apps/av_examples.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
index 29d87eaf..c2051c6b 100644
--- a/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/demo-image-proc/demo-image-proc_git.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE = "keystone"
 DEPENDS = "ti-ipc"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-demos/image-proc.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/keystone-demos/image-proc.git;protocol=https;branch=${BRANCH}"
 #Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.03
 SRCREV = "d1f4014d28ecedf34dbd20f04d4277eb1c4b8ae0"
 PV = "1.0.0.3"
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 66746793..65204041 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -12,7 +12,7 @@ PR = "r20"
 BRANCH = "master"
 SRCREV = "3188b1eacb14dda0dcf3a58877962d86687b6d20"
 
-SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/sitara-linux/dual-camera-demo.git;protocol=https;branch=${BRANCH} \
            file://desc_dual-camera.html \
            file://dual_camera_qt5.sh \
            file://dual_camera_qt4.sh \
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 617fdc95..18cc60ef 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-dsp66"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
-SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master \
+SRC_URI = "git://git.ti.com/git/processor-sdk/gst-plugin-dsp66.git;protocol=https;branch=master \
 	file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch \
 	file://0001-configure.ac-stop-using-export-symbols-regex.patch \
 "
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index ccf0fd55..dafc7a1b 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -14,7 +14,7 @@ SRCREV = "7e3938f0854be99583f8b204f600907ea9e6471d"
 BRANCH ?= "master"
 
 SRC_URI = " \
-    git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
+    git://git.ti.com/git/glsdk/gst-plugin-ducati.git;protocol=https;branch=${BRANCH} \
     file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
 "
 
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index 1f9796c2..94c63aef 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 
-SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=git \
+SRC_URI = "git://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;protocol=https \
 	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
 SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
 
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 841a403f..8e6855d1 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -12,6 +12,6 @@ REQUIRED_MACHINE_FEATURES = "mmip"
 PR = "${INC_PR}.20"
 SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
 
-SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
+SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
 "
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
index 069e8397..90b9bab6 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE = "dra7xx|keystone"
 
 BRANCH = "master"
 
-SRC_URI = "git://git.ti.com/processor-sdk/hevc_arm_decode.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/processor-sdk/hevc_arm_decode.git;protocol=https;branch=${BRANCH} \
            file://Testparams.cfg \
 "
 
diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
index 21d59b0e..9347a5f3 100644
--- a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://CCIEF-BASIC_Master/library/include/SLMP.h;beginline=1
 PV = "1.0"
 PR = "r1"
 
-CCIEF-BASIC_GIT_URI = "git://git.ti.com/processor-sdk/cclink.git"
-CCIEF-BASIC_GIT_PROTOCOL = "git"
+CCIEF-BASIC_GIT_URI = "git://git.ti.com/git/processor-sdk/cclink.git"
+CCIEF-BASIC_GIT_PROTOCOL = "https"
 CCIEF-BASIC_GIT_BRANCH = "master"
 
 CCIEF-BASIC_SRCREV = "ec2a42e61c85c6a5e858438c590b052f2e780d6f"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
index a3ac5029..2272775c 100644
--- a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 BRANCH="master"
-SRC_URI = "git://git.ti.com/git/arago-project-org/ipsecmgr.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/git/arago-project-org/ipsecmgr.git;protocol=https;branch=${BRANCH}"
 
 SRCREV = "d3ebaa8c80346c8037b5e81c636ab26785ccefaf"
 PV     = "01.01.00.04+git${SRCPV}"
diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
index cd0fa288..87689944 100644
--- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
+++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libnl"
 BRANCH="hawking_dev"
 # The following commit correspond to DEV.LIBNL-XFRM.03.01.00.00A
 SRCREV = "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
-SRC_URI = "git://git.ti.com/git/arago-project-org/libnl-xfrm.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/git/arago-project-org/libnl-xfrm.git;protocol=https;branch=${BRANCH}"
 
 PR = "r1"
 
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
index c45acf4f..71959e76 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
@@ -17,7 +17,7 @@ PV = "01.00.00"
 PR = "r1"
 
 BRANCH = "master"
-SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-examples.git;protocol=git;branch=${BRANCH} \
+SRC_URI  = "git://git.ti.com/git/apps/tensorflow-lite-examples.git;protocol=https;branch=${BRANCH} \
             http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model;destsuffix=model \
             http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenetv1;subdir=${WORKDIR}/model;destsuffix=model \
             http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data"
diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
index f6d5935a..49777a53 100644
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
@@ -4,8 +4,8 @@ INC_PR = "r4"
 require recipes-ti/includes/arago-paths.inc
 
 
-FFTLIB_GIT_URI = "git://git.ti.com/fftlib/fftlib"
-FFTLIB_GIT_PROTOCOL = "git"
+FFTLIB_GIT_URI = "git://git.ti.com/git/fftlib/fftlib"
+FFTLIB_GIT_PROTOCOL = "https"
 FFTLIB_GIT_BRANCH = "master"
 FFTLIB_GIT_DESTSUFFIX = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
index b7a7af6c..9352babe 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "opencl"
 
 BRANCH = "master"
 LIC_FILES_CHKSUM = "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.html;md5=bb48cacb8827ec8d8e5a94c4f2425ee3"
-SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/library-architecture/libarch.git;protocol=https;branch=${BRANCH}"
 SRCREV = "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
 
 COMPATIBLE_MACHINE = "k2hk|dra7xx"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 6883b990..c512886f 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
+HOMEPAGE = "git://git.ti.com/git/dense-linear-algebra-libraries/linalg.git"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
 
@@ -16,7 +16,7 @@ REQUIRED_MACHINE_FEATURES = "dsp"
 REQUIRED_DISTRO_FEATURES = "opencl openmp"
 
 SRC_URI = " \
-	git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
+	git://git.ti.com/git/dense-linear-algebra-libraries/linalg.git;protocol=https;branch=${BRANCH} \
 	file://0001-Makefile-fix-toolchain-variables.patch \
 	file://0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch \
 "
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
index 20fb132c..b2c14dda 100644
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
@@ -4,8 +4,8 @@ INC_PR = "r0"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 LLVM_GIT_NAME = "llvm"
-LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
-LLVM_GIT_PROTOCOL = "git"
+LLVM_GIT_URI = "git://git.ti.com/git/opencl/llvm.git"
+LLVM_GIT_PROTOCOL = "https"
 LLVM_GIT_BRANCH = "release_36_ti"
 LLVM_GIT_DESTSUFFIX = "git"
 LLVM_GIT_SRCREV = "8ff2a35c586a3d3f624712e0943777613a017bc5"
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi.inc b/meta-arago-extras/recipes-ti/netapi/netapi.inc
index ef4607f5..fae8fc73 100644
--- a/meta-arago-extras/recipes-ti/netapi/netapi.inc
+++ b/meta-arago-extras/recipes-ti/netapi/netapi.inc
@@ -9,8 +9,8 @@ DEBIAN_NOAUTONAME_${PN}-dev = "1"
 DEBIAN_NOAUTONAME_${PN}-dbg = "1"
 DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
 
-NETAPI_GIT_URI = "git://git.ti.com/keystone-rtos/netapi.git"
-NETAPI_GIT_PROTOCOL = "git"
+NETAPI_GIT_URI = "git://git.ti.com/git/keystone-rtos/netapi.git"
+NETAPI_GIT_PROTOCOL = "https"
 NETAPI_GIT_BRANCH = "master"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.07"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
index 230c34aa..ceda4df9 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
-CLOCL_WIN_GIT_URI = "git://git.ti.com/opencl/clocl-win.git"
+CLOCL_WIN_GIT_URI = "git://git.ti.com/git/opencl/clocl-win.git"
 CLOCL_WIN_GIT_BRANCH = "master"
 CLOCL_WIN_SRCREV = "eac7ac7cc2e64a9ff05e4238e44dff3f9a9fcf6b"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index c1b475a3..6c8e7c55 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/ocl:"
 
-OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
-OCL_GIT_PROTOCOL = "git"
+OCL_GIT_URI = "git://git.ti.com/git/opencl/ti-opencl.git"
+OCL_GIT_PROTOCOL = "https"
 OCL_GIT_BRANCH = "master"
 
 OCL_SRCREV = "b1dfed9af21a1236380b9d643c432e4f0c619fce"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
index 0e8b46d6..da93ce17 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
-GIT_PROTOCOL = "git"
+GIT_URI      = "git://git.ti.com/git/opencl/opencl-firmware.git"
+GIT_PROTOCOL = "https"
 BRANCH       = "master"
 SRCREV       = "9e3d0b34f604203f275fba4807481a8a763a4f63"
 
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
index 1c01f5ac..644fa104 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/openmpacc:"
 
-OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
-OMPACC_GIT_PROTOCOL = "git"
+OMPACC_GIT_URI = "git://git.ti.com/git/openmp/ti-openmpacc.git"
+OMPACC_GIT_PROTOCOL = "https"
 OMPACC_GIT_BRANCH = "master"
 
 OMPACC_SRCREV = "7c4e68a0bf73ec193edff9dfc23ea764ae6ad434"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index c70ff8a8..fca1cb8c 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -3,8 +3,8 @@ INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
 
-GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
-GIT_PROTOCOL = "git"
+GIT_URI = "git://git.ti.com/git/tidl/tidl-api.git"
+GIT_PROTOCOL = "https"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 5ba5ffd8..80eefe9d 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,4 +1,4 @@
-SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
+SRC_URI = "git://git.ti.com/git/tidl/tidl-utils.git;protocol=https;branch=master"
 SRCREV = "6a51b2aff1709c13edb3445bdb4698a28fbb2ae7"
 PV = "01.01.03.02"
 PR = "r1"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
index 16f23398..bdc444af 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
@@ -15,7 +15,7 @@ PV = "01.00.00.00"
 PR = "r1"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-sdk/tiovx.git;protocol=https;branch=${BRANCH}"
 SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
 SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
 
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
index becf0cc1..41fc6825 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
@@ -2,4 +2,4 @@ PV = "01.00.01.00"
 
 BRANCH="master"
 SRCREV = "5be60aee8d013907a4d8a6cc8af35a517a33b49e"
-SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-sdk/tiovx-app.git;protocol=https;branch=${BRANCH}"
-- 
2.17.1


