Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF3DC6FD24
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.859.1663041770869700065
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5FD7540D97
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qpPViDGmTAA for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FCFA40D8C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B833D1749E1
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 41/52] all: Stop using git://git.ti.com
Date: Tue, 13 Sep 2022 04:02:35 +0000
Message-Id: <20220913040246.2365077-42-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14024

From: Ryan Eatmon <reatmon@ti.com>

Stop using un-encrypted git:// protocol to access TI repositories.

This is inline with the same arguments as made by github in
https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/distro/include/branding-bleeding.inc             | 4 ++--
 .../recipes-connectivity/linuxptp/linuxptp_3.0.bbappend   | 2 +-
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
 .../amsdk-av-files/amsdk-av-files_1.4.bb                  | 2 +-
 .../dual-camera-demo/dual-camera-demo_1.0.bb              | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb      | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb     | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb       | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb        | 2 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb              | 2 +-
 .../recipes-support/cclink/ccief-basic_git.bb             | 4 ++--
 .../tensorflow-lite/tensorflow-lite-demo_git.bb           | 2 +-
 meta-arago-extras/recipes-ti/fftlib/fftlib.inc            | 4 ++--
 meta-arago-extras/recipes-ti/libarch/libarch.inc          | 2 +-
 meta-arago-extras/recipes-ti/linalg/linalg.inc            | 4 ++--
 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc      | 4 ++--
 meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb    | 2 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc                  | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb    | 4 ++--
 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc      | 4 ++--
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc        | 4 ++--
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc    | 2 +-
 meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb      | 2 +-
 meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc          | 2 +-
 58 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc =
b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 4054c5af..0008a442 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -20,8 +20,8 @@ TI_LINUX_FW_SRCREV =3D "${AUTOREV}"
 K3_IMAGE_GEN_SRCREV =3D "${AUTOREV}"
=20
 # Point to latest nightly metadata
-#TI_RTOS_METADATA_URI =3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
-#TI_RTOS_METADATA_PROTOCOL =3D "git"
+#TI_RTOS_METADATA_URI =3D "git://git.ti.com/git/processor-sdk/coresdk_rt=
os_releases.git"
+#TI_RTOS_METADATA_PROTOCOL =3D "https"
 TI_RTOS_METADATA_SRCREV =3D "${AUTOREV}"
 TI_RTOS_METADATA_BRANCH =3D "next"
=20
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0=
.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.=
bbappend
index 06329b6e..cf11b475 100644
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappe=
nd
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappe=
nd
@@ -5,7 +5,7 @@ BRANCH =3D "ti-linuxptp"
 SRCREV =3D "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
=20
 SRC_URI =3D " \
-    git://git.ti.com/processor-sdk/linuxptp.git;branch=3D${BRANCH} \
+    git://git.ti.com/git/processor-sdk/linuxptp.git;branch=3D${BRANCH} \
     file://build-Allow-CC-and-prefix-to-be-overriden.patch \
     file://Use-cross-cpp-in-incdefs.patch \
 "
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.b=
bappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbap=
pend
index ddf37ee2..ce22c453 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -6,8 +6,8 @@
 BRANCH =3D "ti-linux-5.10.y"
 SRCREV =3D "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
=20
-KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git=
"
-KERNEL_GIT_PROTOCOL =3D "git"
+KERNEL_GIT_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel=
.git"
+KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH}"
=20
 PKGV:linux-libc-headers-dev =3D "5.10"
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-li=
bc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/=
linux-libc-headers_5.10.bb
index 4cd0ee1b..43493570 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-head=
ers_5.10.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-head=
ers_5.10.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
 BRANCH =3D "ti-linux-5.10.y"
 SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
=20
-KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git=
"
-KERNEL_GIT_PROTOCOL =3D "git"
+KERNEL_GIT_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel=
.git"
+KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI =3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D=
${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.=
bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
index 917aa1bf..1600b679 100644
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
@@ -8,6 +8,6 @@ inherit allarch
=20
 BRANCH ?=3D "master"
 SRCREV =3D "e58f941784fb45fd826779a45b33973e6342700f"
-SRC_URI =3D "git://git.ti.com/git/arago-project/oe-layersetup.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/git/arago-project/oe-layersetup.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index b4eb8244..e000e8c7 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -6,7 +6,7 @@ PR =3D "r47"
=20
 BRANCH ?=3D "master"
 SRCREV =3D "eae21af9be4e7a0028045cc3e4038fe2157a266d"
-SRC_URI =3D "git://git.ti.com/arago-project/tisdk-setup-scripts.git;bran=
ch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;=
protocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.=
bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
index 7d82b0ec..ddad14c2 100644
--- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -13,7 +13,7 @@ PV =3D "01.00.00"
 PR =3D "r1"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/apps/barcode-roi-detection.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/apps/barcode-roi-detection.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "50fa051f66012ebaa10eba1cb289287c4c5e7432"
=20
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc
index 32ead99c..0b8a0611 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM =3D "file://makefile;beginline=3D1;endli=
ne=3D31;md5=3D2f2ea348b98d5cc78
 COMPATIBLE_MACHINE =3D "omap-a15"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-BIG_DATA_IPC_GIT_URI =3D "git://git.ti.com/processor-sdk/big-data-ipc-ex=
amples.git"
-BIG_DATA_IPC_GIT_PROTOCOL =3D "git"
+BIG_DATA_IPC_GIT_URI =3D "git://git.ti.com/git/processor-sdk/big-data-ip=
c-examples.git"
+BIG_DATA_IPC_GIT_PROTOCOL =3D "https"
 BIG_DATA_IPC_GIT_BRANCH =3D "master"
=20
 # Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.03.00.00"
diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/me=
ta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
index a5083999..9adc7363 100644
--- a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -8,7 +8,7 @@ PV =3D "1.0"
 PR =3D "r1"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=3Dgit;b=
ranch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/sitara-linux/evse-hmi.git;protocol=3Dh=
ttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "d8c309d2832735f8df84db9993a01d861fdc02d7"
=20
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_g=
it.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
index 9625084b..1a6737cf 100644
--- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
@@ -13,7 +13,7 @@ PR =3D "r5"
 BRANCH =3D "master"
 SRCREV =3D "d9a2f2e27f59f3bbcde91efc6afba8cd04f3b4be"
=20
-SRC_URI =3D "git://git.ti.com/matrix-gui-v2/image-gallery.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/image-gallery.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegestu=
re-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavege=
sture-hmi_git.bb
index d5f9e43c..127cc2a7 100644
--- a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_=
git.bb
+++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_=
git.bb
@@ -8,7 +8,7 @@ PV =3D "1.0"
 PR =3D "r0"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/sitara-linux/mmwavegesture-hmi.git;protoco=
l=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/sitara-linux/mmwavegesture-hmi.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "0881fc8bc5b3c3411af7b69c3837a8b3a1fbedc5"
=20
diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-ano=
maly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detect=
ion/pdm-anomaly-detection_git.bb
index 93317486..7a419974 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
@@ -8,7 +8,7 @@ PV =3D "1.0"
 PR =3D "r2"
=20
 BRANCH =3D "master"
-SRC_URI  =3D "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI  =3D "git://git.ti.com/git/apps/pdm-anomaly-detection.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "2ccf0e5e5aaac73166d52374650a25652bd6aed2"
=20
diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-clou=
d-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point=
-cloud-viewer_git.bb
index bbc2558e..0388a2e0 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE =3D "dra7xx"
=20
 BRANCH =3D "master"
=20
-SRC_URI =3D "git://git.ti.com/processor-sdk/point-cloud-viewer.git;proto=
col=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/point-cloud-viewer.git;p=
rotocol=3Dhttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "f0af54e63a6c802b4f8f0657873e74f1cb486e86"
=20
diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protect=
ion-relays-hmi_git.bb b/meta-arago-extras/recipes-apps/protection-relays-=
hmi/protection-relays-hmi_git.bb
index 018859e0..95977162 100644
--- a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-rel=
ays-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-rel=
ays-hmi_git.bb
@@ -8,7 +8,7 @@ PV =3D "1.0"
 PR =3D "r0"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/sitara-linux/protection-relays-hmi.git;pro=
tocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/sitara-linux/protection-relays-hmi.git=
;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "b116b5628a68ba3b6db88435023cf034504655d3"
=20
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.=
bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 84ef96ea..29aa689d 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -19,7 +19,7 @@ DEPENDS +=3D "qtsvg qtscript"
 BRANCH ?=3D "master"
 SRCREV =3D "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
=20
-SRC_URI =3D "git://git.ti.com/apps/thermostat-demo.git;protocol=3Dgit;br=
anch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/apps/thermostat-demo.git;protocol=3Dht=
tps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-openc=
v-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/vid=
eo-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 5b085641..12793df0 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
@@ -17,7 +17,7 @@ PV =3D "1.3.3"
 PR =3D "r3"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/apps/qt-opencv-opencl-opengl-multithreaded=
.git;protocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/apps/qt-opencv-opencl-opengl-multithre=
aded.git;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 SRCREV =3D "80051ec8befd921e40cfb74a49234ed045576bbc"
=20
diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-bench=
marks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-ben=
chmarks_1.3.bb
index 356b8d91..3e67b960 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb
@@ -9,7 +9,7 @@ PR =3D "r13"
 BRANCH ?=3D "master"
 SRCREV =3D "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
=20
-SRC_URI =3D "git://git.ti.com/apps/arm_benchmarks.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/apps/arm_benchmarks.git;protocol=3Dhtt=
ps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/=
meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index a3657b58..73b791e4 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
@@ -9,7 +9,7 @@ PR =3D "r0"
 BRANCH ?=3D "master"
 SRCREV =3D "b66f2bab5d6d0b35732ef8406ae03873725a3306"
=20
-SRC_URI =3D "git://git.ti.com/sitara-linux/stream.git;branch=3D${BRANCH}=
"
+SRC_URI =3D "git://git.ti.com/git/sitara-linux/stream.git;protocol=3Dhtt=
ps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_gi=
t.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index 77fd3ecc..1160b45d 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -11,7 +11,7 @@ BRANCH:aarch64 ?=3D "am65x-v1.0"
 SRCREV =3D "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
 SRCREV:aarch64 =3D "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
=20
-SRC_URI =3D "git://git.ti.com/switch-config/switch-config.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/switch-config/switch-config.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/m=
eta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 72cdc4b1..6695d3a3 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -18,7 +18,7 @@ INITSCRIPT_NAME=3D"hostapd"
=20
 CONFFILES:${PN} +=3D "${sysconfdir}/hostapd.conf"
=20
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/hostap.git;protocol=3Dgit;bra=
nch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/wilink8-wlan/hostap.git;protocol=3Dhtt=
ps;branch=3D${BRANCH} \
            file://defconfig \
 	       file://init"
=20
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-=
supplicant.inc
index 53354375..9767e9ad 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
@@ -18,7 +18,7 @@ DEFAULT_PREFERENCE =3D "-1"
=20
 PR =3D "r9"
=20
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/hostap.git;protocol=3Dgit;bra=
nch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/wilink8-wlan/hostap.git;protocol=3Dhtt=
ps;branch=3D${BRANCH} \
            file://defconfig \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb =
b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 6f38b750..7a437fe8 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -10,7 +10,7 @@ PR =3D "r10"
 BRANCH ?=3D "master"
 SRCREV =3D "5df7da69a50d27b7f594db0918c5e6793c3a6237"
=20
-SRC_URI =3D "git://git.ti.com/apps/am_sysinfo.git;protocol=3Dgit;branch=3D=
${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/apps/am_sysinfo.git;protocol=3Dhttps;b=
ranch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta=
-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 05c71a1d..31e9ea8c 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -23,15 +23,15 @@ DEPENDS:append:class-target =3D " valgrind"
 LLVM_DIR =3D "ti-llvm${PV}"
=20
 LLVM_GIT_NAME =3D "llvm"
-LLVM_GIT_URI =3D "git://git.ti.com/opencl/llvm.git"
-LLVM_GIT_PROTOCOL =3D "git"
+LLVM_GIT_URI =3D "git://git.ti.com/git/opencl/llvm.git"
+LLVM_GIT_PROTOCOL =3D "https"
 LLVM_GIT_BRANCH =3D "release_36_ti"
 LLVM_GIT_DESTSUFFIX =3D "git"
 LLVM_GIT_SRCREV =3D "09780c6750b30da81e4a0a805aedf1699fbc37c7"
=20
 CLANG_GIT_NAME =3D "clang"
-CLANG_GIT_URI =3D "git://git.ti.com/opencl/clang.git"
-CLANG_GIT_PROTOCOL =3D "git"
+CLANG_GIT_URI =3D "git://git.ti.com/git/opencl/clang.git"
+CLANG_GIT_PROTOCOL =3D "https"
 CLANG_GIT_BRANCH =3D "release_36_ti"
 CLANG_GIT_DESTSUFFIX =3D "${LLVM_GIT_DESTSUFFIX}/tools/clang"
 CLANG_GIT_SRCREV =3D "5b006f07bdc22b5ae6917eecdfe243908dd7b029"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 5d6df788..94776f54 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -3,7 +3,7 @@ LICENSE =3D "CC-BY-SA-3.0"
 LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
=20
-SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;proto=
col=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;p=
rotocol=3Dhttps;branch=3D${BRANCH}"
 SRCREV =3D "cad105b0c2b75a90f4def523b4fdbd0b6aa2fe8e"
 BRANCH =3D "master"
 INC_PR =3D "r76"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 578cff50..1d58363f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -13,7 +13,7 @@ SRCREV =3D "78ad5db716d1abc4c05abfe435f066b6b88454d5"
=20
 BRANCH ?=3D "master"
=20
-SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix_browser.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/matrix_browser.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 40ad55d3..047e9dbd 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -20,7 +20,7 @@ SRCREV =3D "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
=20
 MATRIX_INITSCRIPT =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland'=
, 'init', 'init.eglfs', d)}"
=20
-SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=3D=
git;branch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/matrix-gui-v2.git;protoc=
ol=3Dhttps;branch=3D${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
            file://matrix-gui-2.0.service \
diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb =
b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 4cc9859a..bd81bca8 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -10,7 +10,7 @@ PR =3D "r9"
 SRCREV =3D "4c8817e28ceed2dd886761e3ec1971b11436ba33"
 BRANCH ?=3D "master"
=20
-SRC_URI =3D "git://git.ti.com/matrix-gui-v2/refresh-screen.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/matrix-gui-v2/refresh-screen.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-exa=
mple_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-ex=
ample_git.bb
index ff0347d6..0216e5db 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_gi=
t.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_gi=
t.bb
@@ -13,7 +13,7 @@ PR =3D "r4"
 BRANCH ?=3D "master"
 SRCREV =3D "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
=20
-SRC_URI =3D "git://git.ti.com/apps/oprofile-example.git;protocol=3Dgit;b=
ranch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/apps/oprofile-example.git;protocol=3Dh=
ttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-=
examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-cr=
ypto-examples_git.bb
index 6cd8d466..10f14478 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
@@ -10,7 +10,7 @@ PR =3D "r7"
 BRANCH ?=3D "master"
 SRCREV =3D "6f4b09fffe970bb6b448369875874e798ef282f6"
=20
-SRC_URI =3D "git://git.ti.com/git/arago-project-org/crypto-example-apps.=
git;protocol=3Dhttps;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/git/arago-project-org/crypto-example-a=
pps.git;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index e30c5e27..9ea0df36 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -18,7 +18,7 @@ SRCREV =3D "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;protocol=
=3Dhttps;branch=3Dmaster"
-SRC_URI:prepend =3D "git://git.ti.com/test-automation/ltp-ddt.git;branch=
=3D${BRANCH} "
+SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;pr=
otocol=3Dhttps;branch=3D${BRANCH} "
=20
 export prefix =3D "/opt/ltp"
 export exec_prefix =3D "/opt/ltp"
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta=
-arago-extras/recipes-devtools/statcol/statcol.bb
index ee2b12d2..5cae05d7 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -3,10 +3,10 @@ SUMMARY =3D "Statistics collector application"
 LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6bc27cd44417c389a180bd62f55=
2a0"
=20
-PROTOCOL =3D "git"
+PROTOCOL =3D "https"
 BRANCH =3D "master"
 SRCREV =3D "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
-SRC_URI =3D "git://git.ti.com/glsdk/statcol.git;protocol=3D${PROTOCOL};b=
ranch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/glsdk/statcol.git;protocol=3D${PROTOCO=
L};branch=3D${BRANCH}"
=20
 DEPENDS =3D "ti-rpmsg-char websocketd"
 RDEPENDS:${PN} =3D "bash"
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-s=
cripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-sc=
ripts.bb
index 5ed4e034..1ab1cbc1 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE =3D "omap-a15|j7"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 RDEPENDS:${PN} +=3D "bash"
=20
-SRC_URI =3D "git://git.ti.com/glsdk/util-scripts.git;branch=3Dmaster"
+SRC_URI =3D "git://git.ti.com/git/glsdk/util-scripts.git;protocol=3Dhttp=
s;branch=3Dmaster"
=20
 SRCREV =3D "5a3f8eca444a5c4bf8855705a3018d482e3e19cd"
=20
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-=
example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/g=
lsdk-example-apps.bb
index de725c07..6827ed31 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
@@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig
=20
-SRC_URI =3D "git://git.ti.com/glsdk/example-applications.git;protocol=3D=
git;branch=3Dmaster \
+SRC_URI =3D "git://git.ti.com/git/glsdk/example-applications.git;protoco=
l=3Dhttps;branch=3Dmaster \
 "
=20
 SRCREV=3D"52466430609c402a9f1c0667ccf727d096336d0d"
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3=
.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.=
2.bb
index d855d191..7cd6d8c9 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -6,7 +6,7 @@ CLEANBROKEN =3D "1"
=20
 BRANCH =3D "master"
=20
-SRC_URI =3D "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=3Dgit;br=
anch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/graphics/img-pvr-sdk.git;protocol=3Dht=
tps;branch=3D${BRANCH}"
 SRCREV =3D "e52592c843ad16be31db411b85c4059d82c4a6b9"
=20
 PR =3D "r19"
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1=
.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.=
0.bb
index 8804544f..11251ee0 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -15,7 +15,7 @@ SRCREV =3D "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
 EXTRA_OEMAKE =3D "CC=3D"${CC}""
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
-SRC_URI =3D "git://git.ti.com/glsdk/omapdrmtest.git;protocol=3Dgit \
+SRC_URI =3D "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=3Dhttps=
 \
         file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.=
patch \
 "
=20
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-t=
ests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-=
gc320-tests_5.0.11.p7.bb
index e84195ff..f9b9685f 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.=
0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.=
0.11.p7.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "ti-gc320-libs"
=20
 BRANCH =3D "ti-${PV}"
=20
-SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-test.git;protocol=3Dgit;=
branch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=3D=
https;branch=3D${BRANCH} \
 file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
 "
 SRCREV =3D "53207f8e360a3336276b62066a1d8a9e923de17e"
diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb b/m=
eta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
index 02188c97..8f2d27ca 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7=
fc9398086aedcd7e46"
=20
 BRANCH =3D "ti-linux-5.10.y"
 SRCREV =3D "73aa709ca10103b61fba3a07471dbb4dcb56db45"
-SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av=
-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk=
-av-files_1.4.bb
index 2d9f41b0..7267668b 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
@@ -20,7 +20,7 @@ VIDEO_FILES:append:k3          =3D "video_720p"
=20
 BRANCH =3D "master"
=20
-SRC_URI =3D "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/amsdk-av-files.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
 SRCREV =3D "1b73009090265328ebaf1b6c880dfeccae5a8f19"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo=
/dual-camera-demo_1.0.bb
index c7d5a817..157e5602 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
@@ -12,7 +12,7 @@ PR =3D "r20"
 BRANCH =3D "master"
 SRCREV =3D "3188b1eacb14dda0dcf3a58877962d86687b6d20"
=20
-SRC_URI =3D "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=
=3Dgit;branch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/sitara-linux/dual-camera-demo.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} \
            file://desc_dual-camera.html \
            file://dual_camera_qt5.sh \
            file://dual_camera_qt4.sh \
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-dsp66_git.bb
index c9505652..d92efb9b 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://git.ti.com/processor-sdk/gst-plugin=
-dsp66"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2827f94fc0a1adeff4d9702e97ce2=
979"
=20
-SRC_URI =3D "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protoco=
l=3Dgit;branch=3Dmaster \
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/gst-plugin-dsp66.git;pro=
tocol=3Dhttps;branch=3Dmaster \
 	file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch =
\
 	file://0001-configure.ac-stop-using-export-symbols-regex.patch \
 "
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plu=
gins-ti/gstreamer1.0-plugins-ducati_git.bb
index ff0e87fd..1ff2dfb0 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
@@ -14,7 +14,7 @@ SRCREV =3D "7e3938f0854be99583f8b204f600907ea9e6471d"
 BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
-    git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=3Dgit;branch=3D=
${BRANCH} \
+    git://git.ti.com/git/glsdk/gst-plugin-ducati.git;protocol=3Dhttps;br=
anch=3D${BRANCH} \
     file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.pat=
ch \
 "
=20
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugi=
ns-ti/gstreamer1.0-plugins-hevc_git.bb
index 0125c245..f9d04e3d 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2827f94fc0a1ad=
eff4d9702e97ce2979"
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
=20
-SRC_URI =3D "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=
=3Dgit;branch=3Dmaster \
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;prot=
ocol=3Dhttps;branch=3Dmaster \
 	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
 SRCREV =3D "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
=20
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugin=
s-ti/gstreamer1.0-plugins-vpe_git.bb
index a6f024f5..237031b1 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
@@ -12,6 +12,6 @@ REQUIRED_MACHINE_FEATURES =3D "mmip"
 PR =3D "${INC_PR}.20"
 SRCREV =3D "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
=20
-SRC_URI =3D "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=3Dgit \
+SRC_URI =3D "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=3Dht=
tps \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-reg=
ex.patch \
 "
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-a=
rm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder=
/hevc-arm-decoder_git.bb
index 997ed451..3bcd6c7f 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-deco=
der_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-deco=
der_git.bb
@@ -8,7 +8,7 @@ COMPATIBLE_MACHINE =3D "dra7xx"
=20
 BRANCH =3D "master"
=20
-SRC_URI =3D "git://git.ti.com/processor-sdk/hevc_arm_decode.git;protocol=
=3Dgit;branch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/hevc_arm_decode.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} \
            file://Testparams.cfg \
 "
=20
diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb =
b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
index 083eaf39..a2ade425 100644
--- a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://CCIEF-BASIC_Master/library/i=
nclude/SLMP.h;beginline=3D1
 PV =3D "1.0"
 PR =3D "r1"
=20
-CCIEF-BASIC_GIT_URI =3D "git://git.ti.com/processor-sdk/cclink.git"
-CCIEF-BASIC_GIT_PROTOCOL =3D "git"
+CCIEF-BASIC_GIT_URI =3D "git://git.ti.com/git/processor-sdk/cclink.git"
+CCIEF-BASIC_GIT_PROTOCOL =3D "https"
 CCIEF-BASIC_GIT_BRANCH =3D "master"
=20
 CCIEF-BASIC_SRCREV =3D "ec2a42e61c85c6a5e858438c590b052f2e780d6f"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow=
-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/ten=
sorflow-lite-demo_git.bb
index c1e47def..fcbc84ab 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-d=
emo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-d=
emo_git.bb
@@ -17,7 +17,7 @@ PV =3D "01.00.00"
 PR =3D "r1"
=20
 BRANCH =3D "master"
-SRC_URI  =3D "git://git.ti.com/apps/tensorflow-lite-examples.git;protoco=
l=3Dgit;branch=3D${BRANCH} \
+SRC_URI  =3D "git://git.ti.com/git/apps/tensorflow-lite-examples.git;pro=
tocol=3Dhttps;branch=3D${BRANCH} \
             http://storage.googleapis.com/download.tensorflow.org/models=
/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=3Ddeeplabv3;subdir=3D${WORKD=
IR}/model;destsuffix=3Dmodel \
             http://storage.googleapis.com/download.tensorflow.org/models=
/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=3Dmobilenetv1;subd=
ir=3D${WORKDIR}/model;destsuffix=3Dmodel \
             http://raw.githubusercontent.com/google-coral/edgetpu/master=
/test_data/bird_segmentation.bmp;name=3Dbird_segmentation;subdir=3D${WORK=
DIR}/test_data;destsuffix=3Dtest_data"
diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-=
extras/recipes-ti/fftlib/fftlib.inc
index f6d5935a..49777a53 100644
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
@@ -4,8 +4,8 @@ INC_PR =3D "r4"
 require recipes-ti/includes/arago-paths.inc
=20
=20
-FFTLIB_GIT_URI =3D "git://git.ti.com/fftlib/fftlib"
-FFTLIB_GIT_PROTOCOL =3D "git"
+FFTLIB_GIT_URI =3D "git://git.ti.com/git/fftlib/fftlib"
+FFTLIB_GIT_PROTOCOL =3D "https"
 FFTLIB_GIT_BRANCH =3D "master"
 FFTLIB_GIT_DESTSUFFIX =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arag=
o-extras/recipes-ti/libarch/libarch.inc
index 1985a6b4..3c708250 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES =3D "opencl"
=20
 BRANCH =3D "master"
 LIC_FILES_CHKSUM =3D "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.=
html;md5=3Dbb48cacb8827ec8d8e5a94c4f2425ee3"
-SRC_URI =3D "git://git.ti.com/library-architecture/libarch.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/library-architecture/libarch.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
 SRCREV =3D "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-=
extras/recipes-ti/linalg/linalg.inc
index 7cf16c9f..32459847 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -1,4 +1,4 @@
-HOMEPAGE =3D "git://git.ti.com/dense-linear-algebra-libraries/linalg.git=
"
+HOMEPAGE =3D "git://git.ti.com/git/dense-linear-algebra-libraries/linalg=
.git"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.ht=
ml;md5=3Df30895e41e5947c3439b1ad4cf4c8555"
=20
@@ -16,7 +16,7 @@ REQUIRED_MACHINE_FEATURES =3D "dsp"
 REQUIRED_DISTRO_FEATURES =3D "opencl openmp"
=20
 SRC_URI =3D " \
-	git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=3Dg=
it;branch=3D${BRANCH} \
+	git://git.ti.com/git/dense-linear-algebra-libraries/linalg.git;protocol=
=3Dhttps;branch=3D${BRANCH} \
 	file://0001-Makefile-fix-toolchain-variables.patch \
 	file://0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch =
\
 "
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc b/meta-=
arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
index 20fb132c..b2c14dda 100644
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
@@ -4,8 +4,8 @@ INC_PR =3D "r0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd=
7814d1d"
=20
 LLVM_GIT_NAME =3D "llvm"
-LLVM_GIT_URI =3D "git://git.ti.com/opencl/llvm.git"
-LLVM_GIT_PROTOCOL =3D "git"
+LLVM_GIT_URI =3D "git://git.ti.com/git/opencl/llvm.git"
+LLVM_GIT_PROTOCOL =3D "https"
 LLVM_GIT_BRANCH =3D "release_36_ti"
 LLVM_GIT_DESTSUFFIX =3D "git"
 LLVM_GIT_SRCREV =3D "8ff2a35c586a3d3f624712e0943777613a017bc5"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/met=
a-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
index d1fffae2..346b40d1 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
@@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
=20
 PR =3D "${INC_PR}.0"
=20
-CLOCL_WIN_GIT_URI =3D "git://git.ti.com/opencl/clocl-win.git"
+CLOCL_WIN_GIT_URI =3D "git://git.ti.com/git/opencl/clocl-win.git"
 CLOCL_WIN_GIT_BRANCH =3D "master"
 CLOCL_WIN_SRCREV =3D "eac7ac7cc2e64a9ff05e4238e44dff3f9a9fcf6b"
=20
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras=
/recipes-ti/ocl/ocl.inc
index b03d2040..9a9231a8 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D2e=
3965a73a8a49c23836467266120
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/ocl:"
=20
-OCL_GIT_URI =3D "git://git.ti.com/opencl/ti-opencl.git"
-OCL_GIT_PROTOCOL =3D "git"
+OCL_GIT_URI =3D "git://git.ti.com/git/opencl/ti-opencl.git"
+OCL_GIT_PROTOCOL =3D "https"
 OCL_GIT_BRANCH =3D "master"
=20
 OCL_SRCREV =3D "b1dfed9af21a1236380b9d643c432e4f0c619fce"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
index 67d1769a..46796147 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE =3D "dra7xx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-GIT_URI      =3D "git://git.ti.com/opencl/opencl-firmware.git"
-GIT_PROTOCOL =3D "git"
+GIT_URI      =3D "git://git.ti.com/git/opencl/opencl-firmware.git"
+GIT_PROTOCOL =3D "https"
 BRANCH       =3D "master"
 SRCREV       =3D "9e3d0b34f604203f275fba4807481a8a763a4f63"
=20
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-=
arago-extras/recipes-ti/openmpacc/openmpacc.inc
index f8774810..a54fa48d 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D=
aaa2a0939d08197132fc382e97b62
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/openmpacc:"
=20
-OMPACC_GIT_URI =3D "git://git.ti.com/openmp/ti-openmpacc.git"
-OMPACC_GIT_PROTOCOL =3D "git"
+OMPACC_GIT_URI =3D "git://git.ti.com/git/openmp/ti-openmpacc.git"
+OMPACC_GIT_PROTOCOL =3D "https"
 OMPACC_GIT_BRANCH =3D "master"
=20
 OMPACC_SRCREV =3D "7c4e68a0bf73ec193edff9dfc23ea764ae6ad434"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-ar=
ago-extras/recipes-ti/tidl-api/tidl-api.inc
index 1f6bb442..389e565a 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -3,8 +3,8 @@ INC_PR =3D "r0"
=20
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3De3daeabffb9fc131a73f16d16=
cbdb118"
=20
-GIT_URI =3D "git://git.ti.com/tidl/tidl-api.git"
-GIT_PROTOCOL =3D "git"
+GIT_URI =3D "git://git.ti.com/git/tidl/tidl-api.git"
+GIT_PROTOCOL =3D "https"
 BRANCH =3D "master"
=20
 SRC_URI =3D "${GIT_URI};protocol=3D${GIT_PROTOCOL};branch=3D${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/met=
a-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 5ba5ffd8..80eefe9d 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,4 +1,4 @@
-SRC_URI =3D "git://git.ti.com/tidl/tidl-utils.git;protocol=3Dgit;branch=3D=
master"
+SRC_URI =3D "git://git.ti.com/git/tidl/tidl-utils.git;protocol=3Dhttps;b=
ranch=3Dmaster"
 SRCREV =3D "6a51b2aff1709c13edb3445bdb4698a28fbb2ae7"
 PV =3D "01.01.03.02"
 PR =3D "r1"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-=
arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
index 71b85d40..e2ee926e 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
@@ -15,7 +15,7 @@ PV =3D "01.00.00.00"
 PR =3D "r1"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/processor-sdk/tiovx.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/tiovx.git;protocol=3Dhtt=
ps;branch=3D${BRANCH}"
 SRC_URI +=3D "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-v=
ar.patch "
 SRCREV =3D "2bfa01201804eaf2e675c743e708e88ab612049e"
=20
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc b/meta-arag=
o-extras/recipes-ti/tiovx/tiovx-sys.inc
index becf0cc1..41fc6825 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
@@ -2,4 +2,4 @@ PV =3D "01.00.01.00"
=20
 BRANCH=3D"master"
 SRCREV =3D "5be60aee8d013907a4d8a6cc8af35a517a33b49e"
-SRC_URI =3D "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=3Dgit=
;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/processor-sdk/tiovx-app.git;protocol=3D=
https;branch=3D${BRANCH}"
--=20
2.25.1



