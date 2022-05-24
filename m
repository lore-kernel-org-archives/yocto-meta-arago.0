Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC6EC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 18:58:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.13416.1653418699552094689
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 May 2022 11:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CCA8640CBF;
	Tue, 24 May 2022 18:58:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_Agi1ydNT0C; Tue, 24 May 2022 18:58:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8EEFD40CBD;
	Tue, 24 May 2022 18:58:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5F965174951; Tue, 24 May 2022 14:58:15 -0400 (EDT)
Date: Tue, 24 May 2022 14:58:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [master PATCH] all: Stop using git://git.ti.com
Message-ID: <20220524185815.GQ9834@denix.org>
References: <20220524182544.12421-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524182544.12421-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 May 2022 18:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13878

NAK, incorrect.


On Tue, May 24, 2022 at 01:25:44PM -0500, Nishanth Menon wrote:
> Stop using un-encrypted git:// protocol to access TI repositories.
> 
> This is inline with the same arguments as made by github in [1]
> 
> This patch was generated via the following script:
> git grep "git://git.ti.com" .|cut -d ':' -f1|sort -u|xargs sed -i -e "s/git:\/\/git.ti.com/https:\/\/git.ti.com\/git/g"
> 
> [1] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> based on
> master       fe0d3770c8f5 gstreamer1.0-plugins-hevc_git: specify branch
> 
>  meta-arago-distro/conf/distro/include/branding-bleeding.inc   | 2 +-
>  .../recipes-connectivity/linuxptp/linuxptp_3.0.bbappend       | 2 +-
>  .../recipes-core/meta/external-arm-toolchain.bbappend         | 2 +-
>  .../linux-libc-headers/linux-libc-headers_5.10.bb             | 2 +-
>  .../recipes-apps/barcode-demo/barcode-roi_git.bb              | 2 +-
>  .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc      | 2 +-
>  meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb       | 2 +-
>  .../recipes-apps/image-gallery/image-gallery_git.bb           | 2 +-
>  .../recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb   | 2 +-
>  .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb        | 2 +-
>  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb | 2 +-
>  .../protection-relays-hmi/protection-relays-hmi_git.bb        | 2 +-
>  .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb              | 2 +-
>  .../qt-opencv-opencl-opengl-multithreaded_git.bb              | 2 +-
>  .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb    | 2 +-
>  meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb     | 2 +-
>  .../recipes-bsp/switch-config/switch-config_git.bb            | 2 +-
>  meta-arago-extras/recipes-connectivity/hostap/hostap.inc      | 2 +-
>  .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc    | 2 +-
>  meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb   | 2 +-
>  meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb         | 4 ++--
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb             | 2 +-
>  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb       | 2 +-
>  meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb   | 2 +-
>  .../recipes-core/oprofile-example/oprofile-example_git.bb     | 2 +-
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb              | 2 +-
>  meta-arago-extras/recipes-devtools/statcol/statcol.bb         | 2 +-
>  .../recipes-devtools/util-scripts/glsdk-util-scripts.bb       | 2 +-
>  .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb | 2 +-
>  .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb         | 2 +-
>  .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb         | 2 +-
>  .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb                | 2 +-
>  meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb       | 2 +-
>  .../recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb   | 2 +-
>  .../dual-camera-demo/dual-camera-demo_1.0.bb                  | 2 +-
>  .../gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb          | 2 +-
>  .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb         | 2 +-
>  .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb           | 2 +-
>  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb            | 2 +-
>  .../hevc-arm-decoder/hevc-arm-decoder_git.bb                  | 2 +-
>  meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb   | 2 +-
>  .../tensorflow-lite/tensorflow-lite-demo_git.bb               | 2 +-
>  meta-arago-extras/recipes-ti/fftlib/fftlib.inc                | 2 +-
>  meta-arago-extras/recipes-ti/libarch/libarch.inc              | 2 +-
>  meta-arago-extras/recipes-ti/linalg/linalg.inc                | 4 ++--
>  meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc          | 2 +-
>  meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb        | 2 +-
>  meta-arago-extras/recipes-ti/ocl/ocl.inc                      | 2 +-
>  meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb        | 2 +-
>  meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc          | 2 +-
>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc            | 2 +-
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc        | 2 +-
>  meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb          | 2 +-
>  meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc              | 2 +-
>  55 files changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
> index 4054c5af5e39..91789b27d264 100644
> --- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
> @@ -20,7 +20,7 @@ TI_LINUX_FW_SRCREV = "${AUTOREV}"
>  K3_IMAGE_GEN_SRCREV = "${AUTOREV}"
>  
>  # Point to latest nightly metadata
> -#TI_RTOS_METADATA_URI = "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
> +#TI_RTOS_METADATA_URI = "https://git.ti.com/git/processor-sdk/coresdk_rtos_releases.git"
>  #TI_RTOS_METADATA_PROTOCOL = "git"
>  TI_RTOS_METADATA_SRCREV = "${AUTOREV}"
>  TI_RTOS_METADATA_BRANCH = "next"
> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappend
> index 06329b6e587c..d3b391bb9425 100644
> --- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_3.0.bbappend
> @@ -5,7 +5,7 @@ BRANCH = "ti-linuxptp"
>  SRCREV = "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
>  
>  SRC_URI = " \
> -    git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
> +    https://git.ti.com/git/processor-sdk/linuxptp.git;branch=${BRANCH} \
>      file://build-Allow-CC-and-prefix-to-be-overriden.patch \
>      file://Use-cross-cpp-in-incdefs.patch \
>  "
> diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
> index ddf37ee20364..b824c3c317fe 100644
> --- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
> +++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
> @@ -6,7 +6,7 @@
>  BRANCH = "ti-linux-5.10.y"
>  SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> index 4cd0ee1b84d3..083add6718de 100644
> --- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  BRANCH = "ti-linux-5.10.y"
>  SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
> index 7d82b0eca54c..e6302cd5ec54 100644
> --- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
> +++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
> @@ -13,7 +13,7 @@ PV = "01.00.00"
>  PR = "r1"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/apps/barcode-roi-detection.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/apps/barcode-roi-detection.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "50fa051f66012ebaa10eba1cb289287c4c5e7432"
>  
> diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> index 32ead99c6331..b4bb9aa778ab 100644
> --- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> +++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://makefile;beginline=1;endline=31;md5=2f2ea348b98d5cc78
>  COMPATIBLE_MACHINE = "omap-a15"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git"
> +BIG_DATA_IPC_GIT_URI = "https://git.ti.com/git/processor-sdk/big-data-ipc-examples.git"
>  BIG_DATA_IPC_GIT_PROTOCOL = "git"
>  BIG_DATA_IPC_GIT_BRANCH = "master"
>  
> diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> index a50839991643..761a0b0c10e0 100644
> --- a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> +++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -8,7 +8,7 @@ PV = "1.0"
>  PR = "r1"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "d8c309d2832735f8df84db9993a01d861fdc02d7"
>  
> diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
> index 9625084bd486..1c39842054d1 100644
> --- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
> +++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
> @@ -13,7 +13,7 @@ PR = "r5"
>  BRANCH = "master"
>  SRCREV = "d9a2f2e27f59f3bbcde91efc6afba8cd04f3b4be"
>  
> -SRC_URI = "git://git.ti.com/matrix-gui-v2/image-gallery.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/matrix-gui-v2/image-gallery.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
> index d5f9e43c72e5..142bd1c7001b 100644
> --- a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
> +++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
> @@ -8,7 +8,7 @@ PV = "1.0"
>  PR = "r0"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/sitara-linux/mmwavegesture-hmi.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sitara-linux/mmwavegesture-hmi.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "0881fc8bc5b3c3411af7b69c3837a8b3a1fbedc5"
>  
> diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> index 933174860dce..b715c64099b8 100644
> --- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> +++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> @@ -8,7 +8,7 @@ PV = "1.0"
>  PR = "r2"
>  
>  BRANCH = "master"
> -SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
> +SRC_URI  = "https://git.ti.com/git/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "2ccf0e5e5aaac73166d52374650a25652bd6aed2"
>  
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index bbc2558ea716..4689fcfaa203 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "dra7xx"
>  
>  BRANCH = "master"
>  
> -SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "f0af54e63a6c802b4f8f0657873e74f1cb486e86"
>  
> diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> index 018859e05688..90f02f66964c 100644
> --- a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> +++ b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> @@ -8,7 +8,7 @@ PV = "1.0"
>  PR = "r0"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "b116b5628a68ba3b6db88435023cf034504655d3"
>  
> diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> index 84ef96eaf4b1..3f015a80761d 100644
> --- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
> @@ -19,7 +19,7 @@ DEPENDS += "qtsvg qtscript"
>  BRANCH ?= "master"
>  SRCREV = "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
>  
> -SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
> index 5b0856412a35..23751c286802 100644
> --- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
> +++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
> @@ -17,7 +17,7 @@ PV = "1.3.3"
>  PR = "r3"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/apps/qt-opencv-opencl-opengl-multithreaded.git;protocol=git;branch=${BRANCH}"
>  
>  SRCREV = "80051ec8befd921e40cfb74a49234ed045576bbc"
>  
> diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> index e0f826e9879c..032b6fd1099d 100644
> --- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> +++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
> @@ -9,7 +9,7 @@ PR = "r13"
>  BRANCH ?= "master"
>  SRCREV = "a3126fd88edd911fff33ace5b813652397bf4cfe"
>  
> -SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
> index a3657b58ecf1..e92340e717bf 100644
> --- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
> +++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
> @@ -9,7 +9,7 @@ PR = "r0"
>  BRANCH ?= "master"
>  SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
>  
> -SRC_URI = "git://git.ti.com/sitara-linux/stream.git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sitara-linux/stream.git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
> index 77fd3eccfb8c..12896e8b80d7 100644
> --- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
> +++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
> @@ -11,7 +11,7 @@ BRANCH:aarch64 ?= "am65x-v1.0"
>  SRCREV = "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
>  SRCREV:aarch64 = "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
>  
> -SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> index 72cdc4b116b6..28f91b2bc7fa 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
> @@ -18,7 +18,7 @@ INITSCRIPT_NAME="hostapd"
>  
>  CONFFILES:${PN} += "${sysconfdir}/hostapd.conf"
>  
> -SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
>             file://defconfig \
>  	       file://init"
>  
> diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> index 53354375b0e4..46d0099cbf32 100644
> --- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> +++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
> @@ -18,7 +18,7 @@ DEFAULT_PREFERENCE = "-1"
>  
>  PR = "r9"
>  
> -SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH} \
>             file://defconfig \
>             file://wpa-supplicant.sh \
>             file://wpa_supplicant.conf \
> diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> index 6f38b7502c72..16c7e46e3f82 100644
> --- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> +++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
> @@ -10,7 +10,7 @@ PR = "r10"
>  BRANCH ?= "master"
>  SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
>  
> -SRC_URI = "git://git.ti.com/apps/am_sysinfo.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/apps/am_sysinfo.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> index 05c71a1d7d58..08f44437740e 100644
> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> @@ -23,14 +23,14 @@ DEPENDS:append:class-target = " valgrind"
>  LLVM_DIR = "ti-llvm${PV}"
>  
>  LLVM_GIT_NAME = "llvm"
> -LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
> +LLVM_GIT_URI = "https://git.ti.com/git/opencl/llvm.git"
>  LLVM_GIT_PROTOCOL = "git"
>  LLVM_GIT_BRANCH = "release_36_ti"
>  LLVM_GIT_DESTSUFFIX = "git"
>  LLVM_GIT_SRCREV = "09780c6750b30da81e4a0a805aedf1699fbc37c7"
>  
>  CLANG_GIT_NAME = "clang"
> -CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
> +CLANG_GIT_URI = "https://git.ti.com/git/opencl/clang.git"
>  CLANG_GIT_PROTOCOL = "git"
>  CLANG_GIT_BRANCH = "release_36_ti"
>  CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index fb61b3409de0..196d5a36230a 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -3,7 +3,7 @@ LICENSE = "CC-BY-SA-3.0"
>  LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
> -SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "976e775a1275198d3391018ce8115a66d00120a2"
>  BRANCH = "master"
>  INC_PR = "r76"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> index 578cff50d358..33b8b1ef9b46 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -13,7 +13,7 @@ SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
>  
>  BRANCH ?= "master"
>  
> -SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index c09e8d35ba50..06d6265bc2dc 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -18,7 +18,7 @@ SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
>  
>  MATRIX_INITSCRIPT = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d)}"
>  
> -SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
>             file://${MATRIX_INITSCRIPT} \
>             file://php.ini \
>             file://matrix-gui-2.0.service \
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> index 4cc9859abd21..dc43e365b623 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> @@ -10,7 +10,7 @@ PR = "r9"
>  SRCREV = "4c8817e28ceed2dd886761e3ec1971b11436ba33"
>  BRANCH ?= "master"
>  
> -SRC_URI = "git://git.ti.com/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
> index ff0347d6abfe..834b64adae5a 100644
> --- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
> +++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
> @@ -13,7 +13,7 @@ PR = "r4"
>  BRANCH ?= "master"
>  SRCREV = "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
>  
> -SRC_URI = "git://git.ti.com/apps/oprofile-example.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/apps/oprofile-example.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> index f3fcdad3ec49..ec2dd45e1390 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
> @@ -18,7 +18,7 @@ SRCREV = "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
>  BRANCH ?= "master"
>  
>  SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
> -SRC_URI:prepend = "git://git.ti.com/test-automation/ltp-ddt.git;branch=${BRANCH} "
> +SRC_URI:prepend = "https://git.ti.com/git/test-automation/ltp-ddt.git;branch=${BRANCH} "
>  
>  export prefix = "/opt/ltp"
>  export exec_prefix = "/opt/ltp"
> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> index ee2b12d22987..06943bc3f28c 100644
> --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>  PROTOCOL = "git"
>  BRANCH = "master"
>  SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
> -SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
>  DEPENDS = "ti-rpmsg-char websocketd"
>  RDEPENDS:${PN} = "bash"
> diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> index 5ed4e03424a4..131f8f23abbf 100644
> --- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> +++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.bb
> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "omap-a15|j7"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  RDEPENDS:${PN} += "bash"
>  
> -SRC_URI = "git://git.ti.com/glsdk/util-scripts.git;branch=master"
> +SRC_URI = "https://git.ti.com/git/glsdk/util-scripts.git;branch=master"
>  
>  SRCREV = "5a3f8eca444a5c4bf8855705a3018d482e3e19cd"
>  
> diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> index de725c077f66..50d76dd3d851 100644
> --- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> +++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> @@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
>  
>  inherit autotools pkgconfig
>  
> -SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git;branch=master \
> +SRC_URI = "https://git.ti.com/git/glsdk/example-applications.git;protocol=git;branch=master \
>  "
>  
>  SRCREV="52466430609c402a9f1c0667ccf727d096336d0d"
> diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
> index d855d1919d77..837a6a9bb49a 100644
> --- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
> +++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
> @@ -6,7 +6,7 @@ CLEANBROKEN = "1"
>  
>  BRANCH = "master"
>  
> -SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "e52592c843ad16be31db411b85c4059d82c4a6b9"
>  
>  PR = "r19"
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index 8804544f98cf..c53d9e6498f0 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -15,7 +15,7 @@ SRCREV = "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
>  EXTRA_OEMAKE = "CC="${CC}""
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
> -SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
> +SRC_URI = "https://git.ti.com/git/glsdk/omapdrmtest.git;protocol=git \
>          file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
>  "
>  
> diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> index e84195ffbaa7..1a3480318032 100644
> --- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> +++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
> @@ -7,7 +7,7 @@ DEPENDS = "ti-gc320-libs"
>  
>  BRANCH = "ti-${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/graphics/ti-gc320-test.git;protocol=git;branch=${BRANCH} \
>  file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
>  "
>  SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
> diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
> index 2d7f370f2622..d4c9253f7515 100644
> --- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
> +++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  
>  BRANCH = "ti-linux-5.4.y"
>  SRCREV = "738552d0b0292e148b35d60ec47ca3c8dd6007b4"
> -SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> index 2d9f41b02d42..dd56fc82e7b0 100644
> --- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> +++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> @@ -20,7 +20,7 @@ VIDEO_FILES:append:k3          = "video_720p"
>  
>  BRANCH = "master"
>  
> -SRC_URI = "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-sdk/amsdk-av-files.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index c7d5a817488c..a3b56be5f9f3 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -12,7 +12,7 @@ PR = "r20"
>  BRANCH = "master"
>  SRCREV = "3188b1eacb14dda0dcf3a58877962d86687b6d20"
>  
> -SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
>             file://desc_dual-camera.html \
>             file://dual_camera_qt5.sh \
>             file://dual_camera_qt4.sh \
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
> index c95056523210..1b46fd5c0ce9 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-dsp66_git.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-dsp66"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
>  
> -SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master \
> +SRC_URI = "https://git.ti.com/git/processor-sdk/gst-plugin-dsp66.git;protocol=git;branch=master \
>  	file://0001-Makefile-correct-use-of-CPP-CXX-and-other-standard-v.patch \
>  	file://0001-configure.ac-stop-using-export-symbols-regex.patch \
>  "
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> index ff0e87fd1524..7c4087721d95 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> @@ -14,7 +14,7 @@ SRCREV = "7e3938f0854be99583f8b204f600907ea9e6471d"
>  BRANCH ?= "master"
>  
>  SRC_URI = " \
> -    git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
> +    https://git.ti.com/git/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
>      file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
>  "
>  
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
> index 0125c245c20e..7911a102cce2 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
>  
> -SRC_URI = "git://git.ti.com/processor-sdk/gst-plugin-hevc.git;protocol=git;branch=master \
> +SRC_URI = "https://git.ti.com/git/processor-sdk/gst-plugin-hevc.git;protocol=git;branch=master \
>  	file://0001-configure.ac-stop-using-export-symbols-regex.patch"
>  SRCREV = "e4ea007d0ddeb95ae01742293454ef3c87a6e84c"
>  
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> index a6f024f5cde5..c39e399ac568 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> @@ -12,6 +12,6 @@ REQUIRED_MACHINE_FEATURES = "mmip"
>  PR = "${INC_PR}.20"
>  SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
>  
> -SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
> +SRC_URI = "https://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=git \
>             file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
>  "
> diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
> index 997ed4513d51..c34daa572796 100644
> --- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
> @@ -8,7 +8,7 @@ COMPATIBLE_MACHINE = "dra7xx"
>  
>  BRANCH = "master"
>  
> -SRC_URI = "git://git.ti.com/processor-sdk/hevc_arm_decode.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/processor-sdk/hevc_arm_decode.git;protocol=git;branch=${BRANCH} \
>             file://Testparams.cfg \
>  "
>  
> diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> index 083eaf3920e9..f7fb17936546 100644
> --- a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> +++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://CCIEF-BASIC_Master/library/include/SLMP.h;beginline=1
>  PV = "1.0"
>  PR = "r1"
>  
> -CCIEF-BASIC_GIT_URI = "git://git.ti.com/processor-sdk/cclink.git"
> +CCIEF-BASIC_GIT_URI = "https://git.ti.com/git/processor-sdk/cclink.git"
>  CCIEF-BASIC_GIT_PROTOCOL = "git"
>  CCIEF-BASIC_GIT_BRANCH = "master"
>  
> diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
> index c1e47def1f47..a3cf8578010b 100644
> --- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
> +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
> @@ -17,7 +17,7 @@ PV = "01.00.00"
>  PR = "r1"
>  
>  BRANCH = "master"
> -SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-examples.git;protocol=git;branch=${BRANCH} \
> +SRC_URI  = "https://git.ti.com/git/apps/tensorflow-lite-examples.git;protocol=git;branch=${BRANCH} \
>              http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model;destsuffix=model \
>              http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenetv1;subdir=${WORKDIR}/model;destsuffix=model \
>              http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data"
> diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
> index f6d5935a3225..3ded59e214da 100644
> --- a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
> +++ b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
> @@ -4,7 +4,7 @@ INC_PR = "r4"
>  require recipes-ti/includes/arago-paths.inc
>  
>  
> -FFTLIB_GIT_URI = "git://git.ti.com/fftlib/fftlib"
> +FFTLIB_GIT_URI = "https://git.ti.com/git/fftlib/fftlib"
>  FFTLIB_GIT_PROTOCOL = "git"
>  FFTLIB_GIT_BRANCH = "master"
>  FFTLIB_GIT_DESTSUFFIX = "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
> index 1985a6b484c7..5b7c6d59c390 100644
> --- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
> +++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
> @@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "opencl"
>  
>  BRANCH = "master"
>  LIC_FILES_CHKSUM = "file://src/ti/libarch/docs/LibArch_1.0.0_manifest.html;md5=bb48cacb8827ec8d8e5a94c4f2425ee3"
> -SRC_URI = "git://git.ti.com/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/library-architecture/libarch.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "cb6d785e95cd390c6388853a4f1e99a302e5a58f"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
> diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> index 7cf16c9fcca9..ceba864d21ae 100644
> --- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
> +++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
> +HOMEPAGE = "https://git.ti.com/git/dense-linear-algebra-libraries/linalg.git"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
>  
> @@ -16,7 +16,7 @@ REQUIRED_MACHINE_FEATURES = "dsp"
>  REQUIRED_DISTRO_FEATURES = "opencl openmp"
>  
>  SRC_URI = " \
> -	git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
> +	https://git.ti.com/git/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
>  	file://0001-Makefile-fix-toolchain-variables.patch \
>  	file://0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch \
>  "
> diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
> index 20fb132cc846..3a1f958f24a9 100644
> --- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
> +++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos.inc
> @@ -4,7 +4,7 @@ INC_PR = "r0"
>  LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
>  
>  LLVM_GIT_NAME = "llvm"
> -LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
> +LLVM_GIT_URI = "https://git.ti.com/git/opencl/llvm.git"
>  LLVM_GIT_PROTOCOL = "git"
>  LLVM_GIT_BRANCH = "release_36_ti"
>  LLVM_GIT_DESTSUFFIX = "git"
> diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
> index d1fffae2ca97..ca6982519099 100644
> --- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
> @@ -7,7 +7,7 @@ require recipes-ti/includes/arago-paths.inc
>  
>  PR = "${INC_PR}.0"
>  
> -CLOCL_WIN_GIT_URI = "git://git.ti.com/opencl/clocl-win.git"
> +CLOCL_WIN_GIT_URI = "https://git.ti.com/git/opencl/clocl-win.git"
>  CLOCL_WIN_GIT_BRANCH = "master"
>  CLOCL_WIN_SRCREV = "eac7ac7cc2e64a9ff05e4238e44dff3f9a9fcf6b"
>  
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index b03d204024fd..0dc73d4f9258 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120
>  
>  FILESEXTRAPATHS:prepend := "${THISDIR}/ocl:"
>  
> -OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
> +OCL_GIT_URI = "https://git.ti.com/git/opencl/ti-opencl.git"
>  OCL_GIT_PROTOCOL = "git"
>  OCL_GIT_BRANCH = "master"
>  
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index 67d1769ad916..e5f6a5965468 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "dra7xx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
> +GIT_URI      = "https://git.ti.com/git/opencl/opencl-firmware.git"
>  GIT_PROTOCOL = "git"
>  BRANCH       = "master"
>  SRCREV       = "9e3d0b34f604203f275fba4807481a8a763a4f63"
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> index f87748102a0b..69908ae28f93 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62
>  
>  FILESEXTRAPATHS:prepend := "${THISDIR}/openmpacc:"
>  
> -OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
> +OMPACC_GIT_URI = "https://git.ti.com/git/openmp/ti-openmpacc.git"
>  OMPACC_GIT_PROTOCOL = "git"
>  OMPACC_GIT_BRANCH = "master"
>  
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index 1f6bb4425192..d7fd04ee1647 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -3,7 +3,7 @@ INC_PR = "r0"
>  
>  LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
>  
> -GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
> +GIT_URI = "https://git.ti.com/git/tidl/tidl-api.git"
>  GIT_PROTOCOL = "git"
>  BRANCH = "master"
>  
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 5ba5ffd88170..6a3e8ace0d27 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,4 +1,4 @@
> -SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> +SRC_URI = "https://git.ti.com/git/tidl/tidl-utils.git;protocol=git;branch=master"
>  SRCREV = "6a51b2aff1709c13edb3445bdb4698a28fbb2ae7"
>  PV = "01.01.03.02"
>  PR = "r1"
> diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> index 71b85d406695..a8528777310b 100644
> --- a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> +++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
> @@ -15,7 +15,7 @@ PV = "01.00.00.00"
>  PR = "r1"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-sdk/tiovx.git;protocol=git;branch=${BRANCH}"
>  SRC_URI += "file://0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch "
>  SRCREV = "2bfa01201804eaf2e675c743e708e88ab612049e"
>  
> diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
> index becf0cc1e1a0..9aecec47b313 100644
> --- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
> +++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys.inc
> @@ -2,4 +2,4 @@ PV = "01.00.01.00"
>  
>  BRANCH="master"
>  SRCREV = "5be60aee8d013907a4d8a6cc8af35a517a33b49e"
> -SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964


