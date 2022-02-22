Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9165.1645504916548087195
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED41440C30
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1w_z5S6-xwV for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3DF040C52
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5283F174770
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 05/23] meta-arago: convert to new override syntax in honister
Date: Tue, 22 Feb 2022 04:41:33 +0000
Message-Id: <20220222044151.2844138-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Latest "honister" release changes the override syntax to improve usabilit=
y,
speed and memory footprint. Update recipes with the new syntax and set la=
yer
compatibility to honister.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/image_types_md5.bbclass           |   4 +-
 .../classes/kernel-fitimage.bbclass           |   2 +-
 meta-arago-distro/classes/sourceipk.bbclass   |  12 +-
 .../classes/tisdk-bundle.bbclass              |   8 +-
 meta-arago-distro/classes/uboot-sign.bbclass  |   6 +-
 meta-arago-distro/conf/distro/arago.conf      |  98 ++--
 .../conf/distro/include/arago-prefs.inc       |  20 +-
 .../conf/distro/include/arago-source-ipk.inc  | 458 +++++++++---------
 .../conf/distro/include/branding-amsdk.inc    |  12 +-
 .../conf/distro/include/branding-bleeding.inc |  24 +-
 .../conf/distro/include/branding-core.inc     |   8 +-
 .../conf/distro/include/branding-glsdk.inc    |   4 +-
 .../conf/distro/include/branding-mainline.inc |   4 +-
 .../distro/include/branding-processor-sdk.inc |  16 +-
 .../conf/distro/include/toolchain-arm.inc     |  16 +-
 meta-arago-distro/conf/layer.conf             |   5 +-
 .../conf/machine/arago-armv8.conf             |   2 +-
 .../chromium-ozone-wayland_%.bbappend         |   6 +-
 .../arm-benchmarks/arm-benchmarks_%.bbappend  |   2 +-
 .../glmark2/glmark2_git.bbappend              |   4 +-
 .../stream/stream_%.bbappend                  |   8 +-
 .../alsa-state/alsa-state.bbappend            |   4 +-
 .../bt-enable/bt-enable.bb                    |   4 +-
 .../iproute2/iproute2_%.bbappend              |   6 +-
 .../linuxptp/linuxptp_%.bbappend              |   4 +-
 .../docker/docker%.bbappend                   |   4 +-
 .../arago-gpl-notice/arago-gpl-notice.bb      |   2 +-
 .../base-files/base-files_%.bbappend          |   4 +-
 .../recipes-core/busybox/busybox_%.bbappend   |   6 +-
 .../busybox/softap-udhcpd-config_1.0.bb       |   4 +-
 .../recipes-core/dbus/dbus_%.bbappend         |   2 +-
 .../feed-config/arago-feed-config_1.0.bb      |   4 +-
 .../recipes-core/images/arago-image.inc       |   2 +-
 .../recipes-core/images/tisdk-base-image.bb   |   2 +-
 .../recipes-core/images/tisdk-core-bundle.bb  |  16 +-
 .../recipes-core/images/tisdk-core-bundle.inc |  16 +-
 .../images/tisdk-default-image.bb             |   6 +-
 .../recipes-core/images/tisdk-tiny-image.bb   |   2 +-
 .../init-ifupdown/init-ifupdown_%.bbappend    |   4 +-
 .../meta/external-arm-toolchain.bbappend      |   8 +-
 .../meta/meta-toolchain-arago-tisdk.inc       |   2 +-
 .../packagegroups/build-essential.bb          |   2 +-
 ...kagegroup-arago-base-tisdk-server-extra.bb |   2 +-
 .../packagegroup-arago-base-tisdk.bb          |   2 +-
 .../packagegroups/packagegroup-arago-base.bb  |   2 +-
 .../packagegroup-arago-console.bb             |   4 +-
 .../packagegroup-arago-gst-sdk-target.bb      |   4 +-
 .../packagegroups/packagegroup-arago-gst.bb   |   8 +-
 .../packagegroups/packagegroup-arago-misc.bb  |   2 +-
 .../packagegroups/packagegroup-arago-qte.bb   |   2 +-
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  36 +-
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  28 +-
 .../packagegroup-arago-tisdk-addons.bb        |  46 +-
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  10 +-
 .../packagegroup-arago-tisdk-amsdk.bb         |   6 +-
 ...oup-arago-tisdk-connectivity-sdk-target.bb |   6 +-
 .../packagegroup-arago-tisdk-connectivity.bb  |   2 +-
 ...ackagegroup-arago-tisdk-crypto-sdk-host.bb |  10 +-
 ...kagegroup-arago-tisdk-crypto-sdk-target.bb |   8 +-
 .../packagegroup-arago-tisdk-crypto.bb        |   8 +-
 ...kagegroup-arago-tisdk-graphics-sdk-host.bb |   2 +-
 ...gegroup-arago-tisdk-graphics-sdk-target.bb |   2 +-
 .../packagegroup-arago-tisdk-graphics.bb      |   4 +-
 ...packagegroup-arago-tisdk-gtk-sdk-target.bb |   2 +-
 .../packagegroup-arago-tisdk-gtk.bb           |   2 +-
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  10 +-
 .../packagegroup-arago-tisdk-hmi.bb           |  10 +-
 ...ackagegroup-arago-tisdk-matrix-sdk-host.bb |   2 +-
 .../packagegroup-arago-tisdk-matrix.bb        |  28 +-
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |  12 +-
 ...group-arago-tisdk-multimedia-sdk-target.bb |  12 +-
 .../packagegroup-arago-tisdk-multimedia.bb    |  14 +-
 ...ackagegroup-arago-tisdk-opencl-sdk-host.bb |   4 +-
 ...kagegroup-arago-tisdk-opencl-sdk-target.bb |   4 +-
 .../packagegroup-arago-tisdk-opencl.bb        |   6 +-
 .../packagegroup-arago-tisdk-qte-sdk-host.bb  |   2 +-
 .../packagegroup-arago-tisdk-qte.bb           |   2 +-
 ...ckagegroup-arago-toolchain-tisdk-target.bb |   4 +-
 .../packagegroup-cross-canadian.bbappend      |   4 +-
 .../packagegroups/ti-analytics.bb             |   8 +-
 .../recipes-core/packagegroups/ti-demos.bb    |  10 +-
 .../recipes-core/packagegroups/ti-opencl.bb   |   4 +-
 .../recipes-core/packagegroups/ti-test.bb     |  18 +-
 .../recipes-core/packagegroups/ti-world.bb    |   8 +-
 .../recipes-core/psplash/psplash_git.bbappend |   6 +-
 .../recipes-core/systemd/systemd_%.bbappend   |  14 +-
 .../recipes-core/sysvinit/sysvinit_%.bbappend |   8 +-
 .../recipes-core/thermal-init/thermal-init.bb |   2 +-
 .../recipes-core/udev/eudev_%.bbappend        |   8 +-
 .../recipes-devtools/cmake/cmake_%.bbappend   |   4 +-
 .../recipes-devtools/perl/perl_%.bbappend     |   2 +-
 .../recipes-devtools/php/php_%.bbappend       |  16 +-
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend   |   4 +-
 .../python/python3_%.bbappend                 |   2 +-
 .../recipes-extended/bash/bash_%.bbappend     |   2 +-
 .../shadow/shadow-securetty_%.bbappend        |   4 +-
 .../recipes-graphics/cairo/cairo_%.bbappend   |   4 +-
 .../recipes-graphics/drm/libdrm_%.bbappend    |   6 +-
 .../freetype/freetype_%.bbappend              |   2 +-
 .../kmscube/kmscube_%.bbappend                |   4 +-
 .../recipes-graphics/tslib/tslib_%.bbappend   |   4 +-
 .../wayland/wayland-ivi-extension_2.2.0.bb    |  10 +-
 .../wayland/weston-init.bbappend              |  10 +-
 .../wayland/weston_9.0.0.bbappend             |   4 +-
 .../cryptodev/cryptodev-module_%.bbappend     |   2 +-
 .../kexec/kexec-tools_%.bbappend              |   6 +-
 .../linux-firmware/linux-firmware_%.bbappend  |  16 +-
 .../linux-libc-headers_5.10.bb                |   2 +-
 .../recipes-kernel/linux/copy-defconfig.inc   |   4 +-
 .../recipes-kernel/linux/docker.inc           |   2 +-
 .../linux/linux-ti-staging-rt_%.bbappend      |   6 +-
 .../linux/linux-ti-staging-systest_%.bbappend |   6 +-
 .../linux/linux-ti-staging_%.bbappend         |   6 +-
 .../ffmpeg/ffmpeg_%.bbappend                  |   4 +-
 .../gstreamer/gstreamer1.0-plugins-%.bbappend |   4 +-
 .../libtiff/tiff_%.bbappend                   |   4 +-
 .../net-snmp/net-snmp_%.bbappend              |   8 +-
 .../examples/qtwebbrowser_1.0.bbappend        |   4 +-
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |   2 +-
 .../recipes-qt/qt5/qtbase_%.bbappend          |  12 +-
 .../recipes-qt/qt5/qtdeclarative_git.bbappend |   6 +-
 .../recipes-qt/qt5/qtwayland_git.bbappend     |   4 +-
 .../recipes-qt/qt5/qtwebengine_git.bbappend   |   4 +-
 .../recipes-qt/qt5/qtwebkit_%.bbappend        |   8 +-
 .../recipes-support/gnutls/gnutls_%.bbappend  |   2 +-
 .../libnl/libnl_3.5.0.bbappend                |   4 +-
 .../rng-tools/rng-tools_%.bbappend            |   6 +-
 .../strongswan/strongswan_%.bbappend          |   6 +-
 .../syslog-ng/syslog-ng_%.bbappend            |   4 +-
 .../opencl-examples-rtos_git.bbappend         |   2 +-
 .../recipes-tisdk/parse-ip/parse-ip.bb        |   2 +-
 .../ti-tisdk-makefile_1.0.bb                  |  68 +--
 .../ti-tisdk-setup/ti-tisdk-setup.bb          |  16 +-
 .../tisdk-install/tisdk-install_1.0.bb        |   2 +-
 .../tisdk-readme/tisdk-readme.bb              |   2 +-
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb    |   2 +-
 .../unshallow-repositories_1.0.bb             |   4 +-
 meta-arago-extras/classes/qt5.bbclass         |   2 +-
 meta-arago-extras/conf/layer.conf             |   5 +-
 .../barcode-demo/barcode-roi_git.bb           |   4 +-
 .../big-data-ipc-demo-linux_git.bb            |   6 +-
 .../big-data-ipc-demo/big-data-ipc-demo.inc   |   4 +-
 .../image-gallery/image-gallery_git.bb        |   4 +-
 .../pdm-anomaly-detection_git.bb              |   2 +-
 .../point-cloud-viewer_git.bb                 |   6 +-
 .../thermostat-demo/qt-tstat_2.0.bb           |   4 +-
 ...-opencv-opencl-opengl-multithreaded_git.bb |   4 +-
 .../recipes-benchmark/stream/stream_5.10.bb   |   2 +-
 .../switch-config/switch-config_git.bb        |   4 +-
 .../hostap/hostap-daemon-wl18xx.bb            |  10 +-
 .../recipes-connectivity/hostap/hostap.inc    |   2 +-
 .../open62541/open62541_git.bb                |  14 +-
 .../recipes-connectivity/vtun/vtun_3.0.3.bb   |   2 +-
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb   |  12 +-
 .../wpa-supplicant/wpa-supplicant.inc         |  12 +-
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb |   2 +-
 .../recipes-core/llvm/llvm-common.bb          |   6 +-
 .../recipes-core/llvm/llvm-common.bbappend    |   4 +-
 meta-arago-extras/recipes-core/llvm/llvm.inc  |  30 +-
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb       |  22 +-
 .../matrix/matrix-gui-3d-demos_2.0.bb         |  84 ++--
 .../matrix/matrix-gui-analytics-demos_2.0.bb  |   8 +-
 .../matrix/matrix-gui-apps-git.inc            |   2 +-
 .../matrix/matrix-gui-apps-images_2.0.bb      |   2 +-
 .../recipes-core/matrix/matrix-gui-apps.inc   |   2 +-
 .../matrix-gui-armbenchmarks-demos_2.0.bb     |   6 +-
 .../matrix/matrix-gui-browser-demos_2.0.bb    |   6 +-
 .../matrix/matrix-gui-camera-loopback_2.0.bb  |   4 +-
 .../matrix/matrix-gui-clocks_2.0.bb           |   8 +-
 .../matrix/matrix-gui-crypto-demos_2.0.bb     |  10 +-
 .../matrix/matrix-gui-display-control_2.0.bb  |   4 +-
 .../matrix/matrix-gui-ethernet-demos_2.0.bb   |   8 +-
 .../matrix/matrix-gui-helper-scripts.bb       |   4 +-
 .../matrix/matrix-gui-hmi-demos_2.0.bb        |  20 +-
 .../matrix-gui-machinevision-demos_2.0.bb     |  28 +-
 .../matrix/matrix-gui-mc-demos_2.0.bb         |  12 +-
 .../matrix/matrix-gui-multimedia-demos_2.0.bb |  74 +--
 .../matrix/matrix-gui-opencl-demos_2.0.bb     |  20 +-
 .../matrix/matrix-gui-oprofile-demos_2.0.bb   |   4 +-
 .../matrix/matrix-gui-pm-demos_2.0.bb         |  28 +-
 .../matrix/matrix-gui-pru-demos_2.0.bb        |   4 +-
 .../matrix/matrix-gui-qt4-demos_2.0.bb        |   4 +-
 .../matrix/matrix-gui-qt5-demos_2.0.bb        |  22 +-
 .../matrix/matrix-gui-settings-demos_2.0.bb   |   8 +-
 .../matrix/matrix-gui-submenus_2.0.bb         |  52 +-
 .../matrix/matrix-gui-tidl-demos_2.0.bb       |  62 +--
 .../matrix/matrix-gui-touch-demos_2.0.bb      |   4 +-
 .../matrix/matrix-gui-usb-demos_2.0.bb        |   4 +-
 .../matrix/matrix-gui-utility-demos_2.0.bb    |   8 +-
 .../matrix/matrix-gui-v4l2-demos_2.0.bb       |   4 +-
 .../matrix-gui-video-analytics-demos_2.0.bb   |   4 +-
 .../matrix/matrix-gui-wifi-demos_2.0.bb       |   4 +-
 .../recipes-core/matrix/matrix-gui/php.ini    |   2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb     |   6 +-
 .../matrix/matrix-lighttpd-config.bb          |   6 +-
 .../meta/external-arm-sdk-toolchain.bb        |  32 +-
 .../meta/external-arm-toolchain.bbappend      |  20 +-
 .../meta/meta-toolchain-arago-qte.bb          |   2 +-
 .../recipes-core/meta/meta-toolchain-arago.bb |   2 +-
 ...k-packagegroup-arago-qte-toolchain-host.bb |   2 +-
 ...nativesdk-packagegroup-arago-tisdk-host.bb |   4 +-
 ...packagegroup-arago-qte-toolchain-target.bb |   2 +-
 ...ackagegroup-arago-standalone-sdk-target.bb |   2 +-
 .../ti-pru-sw-app-loader_1.00.00.bb           |   4 +-
 .../ti-pru-sw-edma-library_1.00.00.bb         |   6 +-
 .../ti-pru-sw-examples_1.00.00.bb             |   8 +-
 .../cmake/extra-cmake-modules.bb              |   2 +-
 .../recipes-devtools/dt/dt_17.07.bb           |   2 +-
 .../flatbuffers/flatbuffers_1.11.0.bb         |   6 +-
 .../input-utils/input-utils_1.0.bb            |   2 +-
 .../ltp-ddt/ltp-ddt_20210524.bb               |  16 +-
 .../mtd/mtd-utils_git.bbappend                |   8 +-
 .../opkg/opkg-bash-completion.bb              |   4 +-
 .../pinmux-utility_1.0.1076.3.bb              |   2 +-
 .../pinmux-utility/pinmux-utility_2.5.2.0.bb  |   2 +-
 .../recipes-devtools/statcol/statcol.bb       |   6 +-
 .../util-scripts/glsdk-util-scripts.bb        |   4 +-
 .../websocketd/websocketd_0.4.1.bb            |   2 +-
 .../recipes-extended/ltp/ltp_20200120.bb      |  20 +-
 .../recipes-extended/ltp/ltp_20210524.bb      |  20 +-
 .../recipes-graphics/glfw/glfw_git.bb         |   2 +-
 .../glsdk-example-apps/glsdk-example-apps.bb  |   6 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          |  10 +-
 .../recipes-graphics/kms++/kms++_git.bb       |   6 +-
 .../ti-gc320-tests_5.0.11.p7.bb               |   4 +-
 .../tslib/ts-calibrate-init_1.0.bb            |   2 +-
 .../wayland/wayland-protocols_%.bbappend      |   6 +-
 .../timestamping/timestamping_4.1.bb          |   2 +-
 .../amsdk-av-files/amsdk-av-files_1.4.bb      |  10 +-
 .../dual-camera-demo/dual-camera-demo_1.0.bb  |   8 +-
 .../gstreamer1.0-plugins-dsp66_git.bb         |  16 +-
 .../gstreamer1.0-plugins-ducati_git.bb        |   2 +-
 .../gstreamer1.0-plugins-hevc_git.bb          |   8 +-
 .../gstreamer1.0-plugins-ti.inc               |   6 +-
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |  18 +-
 .../gstreamer1.0-plugins-good_1.18.%.bbappend |   6 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb  |   4 +-
 .../recipes-qt/examples/qtwebbrowser_1.0.bb   |   4 +-
 .../arm-compute-library_git.bb                |  12 +-
 .../recipes-support/cclink/ccief-basic_git.bb |   2 +-
 .../recipes-support/devmem2/devmem2.bbappend  |   2 +-
 .../recipes-support/mstpctl/mstpd_git.bb      |   4 +-
 .../tensorflow-lite-demo_git.bb               |   8 +-
 .../tensorflow-lite/tensorflow-lite_1.15.bb   |  14 +-
 .../recipes-ti/fftlib/fftlib_git.bb           |   8 +-
 .../recipes-ti/fftlib/ti-fftw-examples_git.bb |   6 +-
 .../recipes-ti/fftlib/ti-fftw_git.bb          |   8 +-
 .../libarch/libarch-examples_git.bb           |   8 +-
 .../recipes-ti/libarch/libarch.inc            |   2 +-
 .../recipes-ti/libarch/libarch_git.bb         |   6 +-
 .../recipes-ti/linalg/linalg-examples_git.bb  |   8 +-
 .../recipes-ti/linalg/linalg_git.bb           |  12 +-
 .../recipes-ti/llvm-rtos/llvm-rtos_git.bb     |   6 +-
 .../recipes-ti/ocl-rtos/clocl-rtos_git.bb     |   4 +-
 .../recipes-ti/ocl-rtos/clocl-win_git.bb      |   2 +-
 .../ocl-rtos/opencl-examples-rtos_git.bb      |   4 +-
 .../ocl-rtos/opencl-monitor-rtos_git.bb       |   8 +-
 .../recipes-ti/ocl-rtos/opencl-rtos_git.bb    |  14 +-
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb |   8 +-
 .../recipes-ti/ocl/ocl-gl-headers_git.bb      |   2 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc      |   2 +-
 .../recipes-ti/ocl/opencl-examples_git.bb     |  34 +-
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb  |   6 +-
 .../recipes-ti/ocl/opencl-monitor_git.bb      |  14 +-
 .../recipes-ti/ocl/opencl-tidl-fw_git.bb      |   4 +-
 .../recipes-ti/ocl/opencl_git.bb              |  26 +-
 .../recipes-ti/openmpacc/clacc_git.bb         |   8 +-
 .../openmpacc/openmpacc-examples_git.bb       |  10 +-
 .../recipes-ti/openmpacc/openmpacc.inc        |   6 +-
 .../recipes-ti/openmpacc/openmpacc_git.bb     |   6 +-
 .../recipes-ti/tidl-api/tidl-api.inc          |   4 +-
 .../recipes-ti/tidl-api/tidl-api_git.bb       |   6 +-
 .../recipes-ti/tidl-api/tidl-examples_git.bb  |   6 +-
 .../recipes-ti/tidl-api/tidl-viewer_git.bb    |  10 +-
 .../recipes-ti/tidl-utils/tidl-import_git.bb  |   4 +-
 .../recipes-ti/tidl-utils/tidl-utils.bb       |  12 +-
 .../recipes-ti/tiovx/tiovx-app-host.bb        |  16 +-
 .../recipes-ti/tiovx/tiovx-lib-host.bb        |   6 +-
 .../recipes-ti/tiovx/tiovx-sys-iface.bb       |  10 +-
 279 files changed, 1428 insertions(+), 1430 deletions(-)

diff --git a/meta-arago-distro/classes/image_types_md5.bbclass b/meta-ara=
go-distro/classes/image_types_md5.bbclass
index 9e2c04fa..16324ca5 100644
--- a/meta-arago-distro/classes/image_types_md5.bbclass
+++ b/meta-arago-distro/classes/image_types_md5.bbclass
@@ -1,9 +1,9 @@
 inherit image_types
=20
 COMPRESSIONTYPES +=3D "gz.md5"
-COMPRESS_CMD_gz.md5 =3D "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}.rootfs=
.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
+COMPRESS_CMD:gz.md5 =3D "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}.rootfs=
.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
 IMAGE_TYPES +=3D "tar.gz.md5"
=20
 COMPRESSIONTYPES +=3D "xz.md5"
-COMPRESS_CMD_xz.md5 =3D "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}.rootfs=
.${type}.xz > ${IMAGE_NAME}.rootfs.${type}.xz.md5"
+COMPRESS_CMD:xz.md5 =3D "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}.rootfs=
.${type}.xz > ${IMAGE_NAME}.rootfs.${type}.xz.md5"
 IMAGE_TYPES +=3D "tar.xz.md5"
diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-ara=
go-distro/classes/kernel-fitimage.bbclass
index 430fa5d0..f412f4c9 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -728,7 +728,7 @@ FITIMAGE_INITRAMFS_ITB_IMAGE[vardepsexclude] =3D "DAT=
ETIME"
 FITIMAGE_INITRAMFS_ITB_BINARY ?=3D "fitImage-${INITRAMFS_IMAGE}.${FITIMA=
GE_ITB_SUFFIX}"
 FITIMAGE_INITRAMFS_ITB_SYMLINK ?=3D "fitImage-${INITRAMFS_IMAGE}-${MACHI=
NE}.${FITIMAGE_ITB_SUFFIX}"
=20
-kernel_do_deploy_append() {
+kernel_do_deploy:append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-dis=
tro/classes/sourceipk.bbclass
index 817f5b72..5ffb75a8 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -28,7 +28,7 @@
 #=20
 # Creation of the source ipk can be controlled per package by setting
 # CREATE_SRCIPK =3D "1" in the package recipe or by setting
-# CREATE_SRCIPK_pn-<package name> =3D "1" in your local.conf
+# CREATE_SRCIPK:pn-<package name> =3D "1" in your local.conf
 #
 #TODO:=20
 # Need to figure out how to use opkg-build in this class.
@@ -89,7 +89,7 @@ SRCIPK_SHALLOW_DEPTH ?=3D "1"
 get_remote() {
     git_repo=3D"$1"
=20
-    if [ "$git_repo" =3D=3D "" ]
+    if [ "$git_repo" =3D "" ]
     then
         echo "git_repo not passed to get_remote"
         exit 1
@@ -167,7 +167,7 @@ adjust_git() {
         then
             # If SRCIPK_SHALLOW_CLONE is true then make a shallow copy o=
f the
             # git repository and then fix up the git URLs
-            if [ "${SRCIPK_SHALLOW_CLONE}" =3D=3D "true" ]
+            if [ "${SRCIPK_SHALLOW_CLONE}" =3D "true" ]
             then
                 limit_git_history
             fi
@@ -286,17 +286,17 @@ python () {
 PACKAGES_DYNAMIC +=3D "${PN}-source"
=20
 # Do not perform any QA checks on sourceipk packages
-INSANE_SKIP_${PN}-source +=3D "${@oe.utils.conditional("${CREATE_SRCIPK}=
", "0", "", "${ALL_QA}", d)}"
+INSANE_SKIP:${PN}-source +=3D "${@oe.utils.conditional("${CREATE_SRCIPK}=
", "0", "", "${ALL_QA}", d)}"
=20
 python __anonymous () {
     if d.getVar("CREATE_SRCIPK") !=3D "0":
         if '${PN}-source' not in d.getVar("PACKAGES", False):
             d.appendVar('PACKAGES', ' ${PN}-source')
         pn =3D d.getVar("PN")
-        d.setVar('FILES_%s-source' % (pn), '${SRCIPK_INSTALL_DIR}')
+        d.setVar('FILES:%s-source' % (pn), '${SRCIPK_INSTALL_DIR}')
 }
=20
-PACKAGESPLITFUNCS_append =3D " ${@oe.utils.conditional('CREATE_SRCIPK','=
0','','populate_srcipk_package',d)}"
+PACKAGESPLITFUNCS:append =3D " ${@oe.utils.conditional('CREATE_SRCIPK','=
0','','populate_srcipk_package',d)}"
 populate_srcipk_package() {
     install -d ${PKGDEST}/${PN}-source/${SRCIPK_INSTALL_DIR}
     cp -Prf --preserve=3Dmode,timestamps --no-preserve=3Downership \
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index ac2eb747..0e5d2391 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -9,8 +9,8 @@ IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
=20
 # Always add the sdk_base feature
-IMAGE_FEATURES_prepend =3D "sdk_base package-management "
-SDKIMAGE_FEATURES_prepend =3D "package-management "
+IMAGE_FEATURES:prepend =3D "sdk_base package-management "
+SDKIMAGE_FEATURES:prepend =3D "package-management "
=20
 # Define our always included sdk package group as the IMAGE_INSTALL sett=
ings
 # like you would expect.
@@ -19,7 +19,7 @@ FEATURE_PACKAGES_sdk_base =3D "${IMAGE_INSTALL}"
 # Create the list of packages to be installed
 PACKAGE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages('${IM=
AGE_FEATURES}'.split(), d))}"
=20
-RDEPENDS_${PN} +=3D "${@' '.join(oe.packagegroup.active_packages('${IMAG=
E_FEATURES}'.split(), d))}"
+RDEPENDS:${PN} +=3D "${@' '.join(oe.packagegroup.active_packages('${IMAG=
E_FEATURES}'.split(), d))}"
=20
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] =3D "1"
@@ -692,7 +692,7 @@ generate_sw_manifest() {
=20
 ROOTFS_PREPROCESS_COMMAND +=3D "tisdk_image_setup; "
 ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; "
-IMAGE_PREPROCESS_COMMAND_append =3D "tisdk_image_cleanup; "
+IMAGE_PREPROCESS_COMMAND:append =3D "tisdk_image_cleanup; "
=20
 # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functio=
nality
 # to install a given list of packages using opkg.
diff --git a/meta-arago-distro/classes/uboot-sign.bbclass b/meta-arago-di=
stro/classes/uboot-sign.bbclass
index 982ed46d..102232b9 100644
--- a/meta-arago-distro/classes/uboot-sign.bbclass
+++ b/meta-arago-distro/classes/uboot-sign.bbclass
@@ -19,7 +19,7 @@
 # The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common p=
lace to
 # treat the device tree blob:
 #
-# * u-boot:do_install_append
+# * u-boot:do_install:append
 #   Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
 #   signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
 #
@@ -103,7 +103,7 @@ install_helper() {
 	fi
 }
=20
-do_install_append() {
+do_install:append() {
 	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${PN}" =3D "${UBOOT_PN}" -a -n =
"${UBOOT_DTB_BINARY}" ]; then
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
@@ -125,7 +125,7 @@ python () {
         d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel=
_pn)
=20
         # kernerl's do_deploy is a litle special, so we can't use
-        # do_deploy_append, otherwise it would override
+        # do_deploy:append, otherwise it would override
         # kernel_do_deploy.
         d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
 }
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index 35741ea9..0aab847b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -6,7 +6,7 @@ BUILD_VARIANT =3D "${@['prod','rt','systest'][int(d.getVa=
r('ARAGO_RT_ENABLE'))+int
 TISDK_VERSION ?=3D "live"
 FEEDURIPREFIX ?=3D "packages/${DISTRO}-dunfell/${TISDK_VERSION}/${BUILD_=
VARIANT}/"
=20
-OPKG_ARGS_remove =3D "--prefer-arch-to-version"
+OPKG_ARGS:remove =3D "--prefer-arch-to-version"
=20
 TI_MIRROR =3D "http://software-dl.ti.com/processor-sdk-mirror/sources/"
 MIRRORS +=3D " \
@@ -33,28 +33,28 @@ SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
=20
-IMAGE_CLASSES +=3D "image_types_md5"
-IMAGE_FSTYPES +=3D "tar.xz.md5"
+#IMAGE_CLASSES +=3D "image_types_md5"
+#IMAGE_FSTYPES +=3D "tar.xz.md5"
=20
 # FIT image for secure devices
 KERNEL_CLASSES +=3D "kernel-fitimage"
 FITIMAGE_HASH_ALGO =3D ""
 FITIMAGE_PACK_TEE =3D "0"
-FITIMAGE_PACK_TEE_am437x-hs-evm =3D "1"
-FITIMAGE_PACK_TEE_am57xx-hs-evm =3D "1"
-FITIMAGE_PACK_TEE_dra7xx-hs-evm =3D "1"
+FITIMAGE_PACK_TEE:am437x-hs-evm =3D "1"
+FITIMAGE_PACK_TEE:am57xx-hs-evm =3D "1"
+FITIMAGE_PACK_TEE:dra7xx-hs-evm =3D "1"
 FITIMAGE_DTB_BY_NAME =3D "1"
 FITIMAGE_TEE_BY_NAME =3D "1"
 FITIMAGE_CONF_BY_NAME =3D "1"
=20
-KERNEL_IMAGETYPES_dra7xx-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES_am57xx-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES_am437x-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES_am335x-hs-evm =3D "zImage fitImage"
-KERNEL_IMAGETYPES_am65xx-hs-evm =3D "Image fitImage"
-KERNEL_IMAGETYPES_am64xx-hs-evm =3D "Image fitImage"
-KERNEL_IMAGETYPES_j7-hs-evm =3D "Image fitImage"
-KERNEL_IMAGETYPES_j7200-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:dra7xx-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:am57xx-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:am437x-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:am335x-hs-evm =3D "zImage fitImage"
+KERNEL_IMAGETYPES:am65xx-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:am64xx-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:j7-hs-evm =3D "Image fitImage"
+KERNEL_IMAGETYPES:j7200-hs-evm =3D "Image fitImage"
=20
 # Extra boot files for WIC images
 do_image_wic[depends] +=3D "tisdk-uenv:do_deploy"
@@ -70,18 +70,18 @@ TMPDIR .=3D "${TCMODEAPPEND}"
 DISTRO_FEATURES =3D "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
=20
 # Remove some unwanted features
-DISTRO_FEATURES_remove =3D "x11"
+DISTRO_FEATURES:remove =3D "x11"
=20
 # Add additional distro features
-DISTRO_FEATURES_append =3D " pam wayland opengl"
-#DISTRO_FEATURES_append =3D " opencl"
-DISTRO_FEATURES_append =3D " opencv"
-DISTRO_FEATURES_append =3D " openmp"
+DISTRO_FEATURES:append =3D " pam wayland opengl"
+#DISTRO_FEATURES:append =3D " opencl"
+DISTRO_FEATURES:append =3D " opencv"
+DISTRO_FEATURES:append =3D " openmp"
=20
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE_append =3D " opencl opencv openmp"
-DISTRO_FEATURES_FILTER_NATIVESDK_append =3D " opencl opencv openmp"
+DISTRO_FEATURES_FILTER_NATIVE:append =3D " opencl opencv openmp"
+DISTRO_FEATURES_FILTER_NATIVESDK:append =3D " opencl opencv openmp"
=20
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?=3D "0"
@@ -91,53 +91,53 @@ VIRTUAL-RUNTIME_initscripts =3D "${@["initscripts", "=
systemd-compat-units"][bool(d
 VIRTUAL-RUNTIME_initramfs =3D "${@["sysvinit-initramfs", "systemd-initra=
mfs"][bool(d.getVar("ARAGO_SYSVINIT"))]}"
 VIRTUAL-RUNTIME_login_manager =3D "busybox shadow"
=20
-DISTRO_FEATURES_append =3D "${@[""," systemd"][bool(d.getVar("ARAGO_SYSV=
INIT"))]}"
+DISTRO_FEATURES:append =3D "${@[""," systemd"][bool(d.getVar("ARAGO_SYSV=
INIT"))]}"
=20
 # Distro-specific package configuration
-PACKAGECONFIG_append_pn-systemd =3D " coredump"
+PACKAGECONFIG:append:pn-systemd =3D " coredump"
=20
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwe=
bkit)
-PACKAGECONFIG_GL_pn-qtbase =3D "gles2 linuxfb"
-PACKAGECONFIG_DISTRO_pn-qtbase =3D "icu examples accessibility gif gbm k=
ms libinput"
-PACKAGECONFIG_FONTS_pn-qtbase =3D "fontconfig"
+PACKAGECONFIG_GL:pn-qtbase =3D "gles2 linuxfb"
+PACKAGECONFIG_DISTRO:pn-qtbase =3D "icu examples accessibility gif gbm k=
ms libinput"
+PACKAGECONFIG_FONTS:pn-qtbase =3D "fontconfig"
=20
 # Add gstreamer in package configuration to enable video
-PACKAGECONFIG_append_pn-qtmultimedia =3D " gstreamer"
+PACKAGECONFIG:append:pn-qtmultimedia =3D " gstreamer"
=20
 # Add examples in Qt5 package configurations
-PACKAGECONFIG_append_pn-qtcharts =3D " examples"
-#PACKAGECONFIG_append_pn-qtdeclarative =3D " examples"
-PACKAGECONFIG_append_pn-qtlocation =3D " examples"
-PACKAGECONFIG_append_pn-qtmultimedia =3D " examples"
-PACKAGECONFIG_append_pn-qtscript =3D " examples"
-PACKAGECONFIG_append_pn-qtserialport =3D " examples"
-PACKAGECONFIG_append_pn-qtsvg =3D " examples"
-PACKAGECONFIG_append_pn-qtwayland =3D " examples"
-PACKAGECONFIG_append_pn-qtwebengine =3D " examples"
+PACKAGECONFIG:append:pn-qtcharts =3D " examples"
+#PACKAGECONFIG:append:pn-qtdeclarative =3D " examples"
+PACKAGECONFIG:append:pn-qtlocation =3D " examples"
+PACKAGECONFIG:append:pn-qtmultimedia =3D " examples"
+PACKAGECONFIG:append:pn-qtscript =3D " examples"
+PACKAGECONFIG:append:pn-qtserialport =3D " examples"
+PACKAGECONFIG:append:pn-qtsvg =3D " examples"
+PACKAGECONFIG:append:pn-qtwayland =3D " examples"
+PACKAGECONFIG:append:pn-qtwebengine =3D " examples"
=20
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
-PACKAGECONFIG_pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6=
", "ipv6", "", d)} ssl zlib"
+PACKAGECONFIG:pn-curl =3D "${@bb.utils.contains("DISTRO_FEATURES", "ipv6=
", "ipv6", "", d)} ssl zlib"
=20
-PACKAGECONFIG_pn-glmark2 =3D "drm-gles2 wayland-gles2"
+PACKAGECONFIG:pn-glmark2 =3D "drm-gles2 wayland-gles2"
=20
 # Enable encryption support in open62541
-PACKAGECONFIG_append_pn-open62541 =3D " encrypt"
+PACKAGECONFIG:append:pn-open62541 =3D " encrypt"
=20
 # Enable netperf intervals/pacing and histogram
-PACKAGECONFIG_append_pn-netperf =3D " intervals histogram"
+PACKAGECONFIG:append:pn-netperf =3D " intervals histogram"
=20
 # Use OpenGL ES2 for SDL2
-PACKAGECONFIG_GL_pn-libsdl2 =3D "gles2"
+PACKAGECONFIG_GL:pn-libsdl2 =3D "gles2"
=20
 # Add KMS/DRM backend support
-PACKAGECONFIG_append_pn-libsdl2 =3D " kmsdrm"
+PACKAGECONFIG:append:pn-libsdl2 =3D " kmsdrm"
=20
 # Enable cryptodev/devcrypto engine in OpenSSL 1.1
-PACKAGECONFIG_append_pn-openssl =3D " cryptodev-linux"
+PACKAGECONFIG:append:pn-openssl =3D " cryptodev-linux"
=20
 # Disable pulseaudio routing in alsa by default
-PACKAGECONFIG_remove_pn-alsa-plugins =3D "pulseaudio"
-RDEPENDS_pulseaudio-server_remove =3D "alsa-plugins-pulseaudio-conf"
+PACKAGECONFIG:remove:pn-alsa-plugins =3D "pulseaudio"
+RDEPENDS:pulseaudio-server:remove =3D "alsa-plugins-pulseaudio-conf"
=20
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?=3D "perf-scripting perf-tui"
@@ -149,18 +149,18 @@ ARAGO_KERNEL_SUFFIX ?=3D ""
=20
 # Set real-time kernel suffix
 ARAGO_RT_ENABLE ?=3D "0"
-ARAGO_KERNEL_SUFFIX_append =3D "${@oe.utils.conditional("ARAGO_RT_ENABLE=
", "1", "-rt", "", d)}"
+ARAGO_KERNEL_SUFFIX:append =3D "${@oe.utils.conditional("ARAGO_RT_ENABLE=
", "1", "-rt", "", d)}"
=20
 # Set systest kernel suffix
 ARAGO_SYSTEST_ENABLE ?=3D "0"
-ARAGO_KERNEL_SUFFIX_append =3D "${@oe.utils.conditional("ARAGO_SYSTEST_E=
NABLE", "1", "-systest", "", d)}"
-IMAGE_FSTYPES_remove =3D "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_EN=
ABLE') =3D=3D '1']}"
+ARAGO_KERNEL_SUFFIX:append =3D "${@oe.utils.conditional("ARAGO_SYSTEST_E=
NABLE", "1", "-systest", "", d)}"
+IMAGE_FSTYPES:remove =3D "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_EN=
ABLE') =3D=3D '1']}"
=20
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.c=
onf
 TC_SANE_DEFAULT ?=3D "arm"
 TOOLCHAIN_TYPE ?=3D "external"
-TOOLCHAIN_TYPE_omapl1 =3D "internal"
+TOOLCHAIN_TYPE:omapl1 =3D "internal"
 TOOLCHAIN_BRAND ?=3D "${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('T=
OOLCHAIN_TYPE') =3D=3D 'internal']}"
=20
 require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
index 2bf9f103..9c4a533c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -15,18 +15,14 @@ PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
=20
 # J7 has a Rogue GPU core
-PREFERRED_PROVIDER_virtual/egl_j7 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1_j7 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2_j7 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm_j7 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver_j7 =3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/egl:j7 =3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1:j7 =3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2:j7 =3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm:j7 =3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver:j7 =3D "ti-img-rogue-driver"
=20
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging${ARAGO_KERNEL_SU=
FFIX}"
=20
-# For TI devices with only baremetal/TI RTOS support
-PREFERRED_PROVIDER_virtual/kernel_c66x =3D "linux-dummy"
-PREFERRED_PROVIDER_virtual/kernel_omapl137 =3D "linux-dummy"
-
 PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"
=20
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a li=
brary or
@@ -35,6 +31,6 @@ PREFERRED_VERSION_crda =3D "3.18"
 PREFERRED_VERSION_obex =3D "0.34"
=20
 PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-supplicant"
-#PREFERRED_PROVIDER_wpa-supplicant_ti33x =3D "wpa-supplicant-wl18xx"
-#PREFERRED_PROVIDER_wpa-supplicant_ti43x =3D "wpa-supplicant-wl18xx"
-#PREFERRED_PROVIDER_wpa-supplicant_omap-a15 =3D "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant:ti33x =3D "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant:ti43x =3D "wpa-supplicant-wl18xx"
+#PREFERRED_PROVIDER_wpa-supplicant:omap-a15 =3D "wpa-supplicant-wl18xx"
diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b=
/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 22484cf4..c03d5383 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -18,19 +18,19 @@
 #       PREFERRED_VERSION_udev_omap3evm =3D "124"
 #
 #   Enable source ipk creation for a package
-#       CREATE_SRCIPK_pn-<pkg> =3D "1"
+#       CREATE_SRCIPK:pn-<pkg> =3D "1"
 #   i.e.
-#       CREATE_SRCIPK_pn-u-boot =3D "1"
+#       CREATE_SRCIPK:pn-u-boot =3D "1"
 #
 #   Change install diretory of source ipk for a package
-#       SRCIPK_INSTALL_DIR_pn-<pkg> =3D "<install dir>"
+#       SRCIPK_INSTALL_DIR:pn-<pkg> =3D "<install dir>"
 #   i.e.
-#       SRCIPK_INSTALL_DIR_pn-u-boot =3D "board-support/u-boot-source"
+#       SRCIPK_INSTALL_DIR:pn-u-boot =3D "board-support/u-boot-source"
 #
 #   Change source ipk architecture for a package
-#       SRCIPK_PACKAGE_ARCH_pn-<pkg> =3D "<arch>"
+#       SRCIPK_PACKAGE_ARCH:pn-<pkg> =3D "<arch>"
 #   i.e.
-#       SRCIPK_PACKAGE_ARCH_pn-u-boot =3D "${MACHINE_ARCH}"
+#       SRCIPK_PACKAGE_ARCH:pn-u-boot =3D "${MACHINE_ARCH}"
 #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 # Enable the creation of source ipks
@@ -40,329 +40,329 @@ INHERIT +=3D "sourceipk"
 SRCIPK_INCLUDE_EXTRAFILES =3D "0"
=20
 # Set source ipk packages and install directories
-CREATE_SRCIPK_pn-ti-tisdk-licenses ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-tisdk-licenses ?=3D "docs/licenses"
+CREATE_SRCIPK:pn-ti-tisdk-licenses ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-tisdk-licenses ?=3D "docs/licenses"
=20
-CREATE_SRCIPK_pn-matrix-gui ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-matrix-gui ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-matrix-gui ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-matrix-gui ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-crypto-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-crypto-examples ?=3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK:pn-ti-crypto-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-crypto-examples ?=3D "example-applications/${PN=
}-${PV}"
=20
-CREATE_SRCIPK_pn-qml-carinfo ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-qml-carinfo ?=3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK:pn-qml-carinfo ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-qml-carinfo ?=3D "example-applications/${PN}-${PV}=
"
=20
-CREATE_SRCIPK_pn-quick-playground ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-quick-playground ?=3D "example-applications/${PN}-=
${PV}"
+CREATE_SRCIPK:pn-quick-playground ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-quick-playground ?=3D "example-applications/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-qt-catalog ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-catalog ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-qt-catalog ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-qt-catalog ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-qt-patientcare ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-patientcare ?=3D "example-applications/${PN}-${=
PV}"
+CREATE_SRCIPK:pn-qt-patientcare ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-qt-patientcare ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-qt-tstat ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-tstat ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-qt-tstat ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-qt-tstat ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-dual-camera-demo ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-dual-camera-demo ?=3D "example-applications/${PN}-=
${PV}"
+CREATE_SRCIPK:pn-dual-camera-demo ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-dual-camera-demo ?=3D "example-applications/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-evse-hmi ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-evse-hmi ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-evse-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-evse-hmi ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-protection-relays-hmi ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-protection-relays-hmi ?=3D "example-applications/$=
{PN}-${PV}"
+CREATE_SRCIPK:pn-protection-relays-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-protection-relays-hmi ?=3D "example-applications/$=
{PN}-${PV}"
=20
-CREATE_SRCIPK_pn-mmwavegesture-hmi ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi ?=3D "example-applications/${PN}=
-${PV}"
+CREATE_SRCIPK:pn-mmwavegesture-hmi ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-mmwavegesture-hmi ?=3D "example-applications/${PN}=
-${PV}"
=20
-CREATE_SRCIPK_pn-pdm-anomaly-detection ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection ?=3D "example-applications/$=
{PN}-${PV}"
+CREATE_SRCIPK:pn-pdm-anomaly-detection ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-pdm-anomaly-detection ?=3D "example-applications/$=
{PN}-${PV}"
=20
-CREATE_SRCIPK_pn-tiovx-app-host ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-tiovx-app-host ?=3D "example-applications/${PN}-${=
PV}"
+CREATE_SRCIPK:pn-tiovx-app-host ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-tiovx-app-host ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-image-gallery ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-image-gallery ?=3D "example-applications/${PN}"
+CREATE_SRCIPK:pn-image-gallery ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-image-gallery ?=3D "example-applications/${PN}"
=20
-CREATE_SRCIPK_pn-matrix-gui-browser ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-matrix-gui-browser ?=3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK:pn-matrix-gui-browser ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-matrix-gui-browser ?=3D "example-applications/${PN=
}-${PV}"
=20
-CREATE_SRCIPK_pn-refresh-screen ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-refresh-screen ?=3D "example-applications/${PN}-${=
PV}"
+CREATE_SRCIPK:pn-refresh-screen ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-refresh-screen ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-am-sysinfo ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-am-sysinfo ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-am-sysinfo ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-am-sysinfo ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-oprofile-example ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-oprofile-example ?=3D "example-applications/${PN}"
+CREATE_SRCIPK:pn-oprofile-example ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-oprofile-example ?=3D "example-applications/${PN}"
=20
-CREATE_SRCIPK_pn-arm-benchmarks ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-arm-benchmarks ?=3D "example-applications/${PN}-${=
PV}"
+CREATE_SRCIPK:pn-arm-benchmarks ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-arm-benchmarks ?=3D "example-applications/${PN}-${=
PV}"
=20
-CREATE_SRCIPK_pn-omapconf ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-omapconf ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-omapconf ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-omapconf ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-pru-sw-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-pru-sw-examples ?=3D "example-applications/pru-=
${PV}"
+CREATE_SRCIPK:pn-ti-pru-sw-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-pru-sw-examples ?=3D "example-applications/pru-=
${PV}"
=20
-CREATE_SRCIPK_pn-ti-ocf-crypto-module ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module ?=3D "board-support/extra-dri=
vers/${PN}-${PV}"
+CREATE_SRCIPK:pn-ti-ocf-crypto-module ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-ocf-crypto-module ?=3D "board-support/extra-dri=
vers/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
+CREATE_SRCIPK:pn-ti-compat-wireless-wl18xx ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-compat-wireless-wl18xx ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-wl18xx-fw ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-wl18xx-fw ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
+CREATE_SRCIPK:pn-wl18xx-fw ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-wl18xx-fw ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-wl1271-wlan-cli ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-wl1271-wlan-cli ?=3D "example-applications/wlan"
+CREATE_SRCIPK:pn-wl1271-wlan-cli ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-wl1271-wlan-cli ?=3D "example-applications/wlan"
=20
-CREATE_SRCIPK_pn-av-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-av-examples ?=3D "example-applications/av-examples=
-${PV}"
+CREATE_SRCIPK:pn-av-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-av-examples ?=3D "example-applications/av-examples=
-${PV}"
=20
-CREATE_SRCIPK_pn-u-boot ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot ?=3D "board-support/u-boot-${PV}"
+CREATE_SRCIPK:pn-u-boot ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-u-boot ?=3D "board-support/u-boot-${PV}"
=20
-CREATE_SRCIPK_pn-u-boot-ti-staging ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}=
${UBOOT_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-u-boot-ti-staging ?=3D "true"
+CREATE_SRCIPK:pn-u-boot-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-u-boot-ti-staging ?=3D "board-support/u-boot-${PV}=
${UBOOT_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT:pn-u-boot-ti-staging ?=3D "true"
=20
-CREATE_SRCIPK_pn-u-boot-dra7xx ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${P=
R}"
+CREATE_SRCIPK:pn-u-boot-dra7xx ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-u-boot-dra7xx ?=3D "board-support/u-boot-${PV}-${P=
R}"
=20
-CREATE_SRCIPK_pn-trusted-firmware-a ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-trusted-firmware-a ?=3D "board-support/${PN}-${PV}=
"
-SRCIPK_PRESERVE_GIT_pn-trusted-firmware-a ?=3D "true"
+CREATE_SRCIPK:pn-trusted-firmware-a ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-trusted-firmware-a ?=3D "board-support/${PN}-${PV}=
"
+SRCIPK_PRESERVE_GIT:pn-trusted-firmware-a ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-ti-staging ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-ti-staging ?=3D "board-support/linux-${PV}${=
KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-linux-ti-staging ?=3D "true"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging ?=3D "true"
+CREATE_SRCIPK:pn-linux-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux-ti-staging ?=3D "board-support/linux-${PV}${=
KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT:pn-linux-ti-staging ?=3D "true"
+SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-ti-staging-rt ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt ?=3D "board-support/linux-rt-$=
{PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt ?=3D "true"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt ?=3D "true"
+CREATE_SRCIPK:pn-linux-ti-staging-rt ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux-ti-staging-rt ?=3D "board-support/linux-rt-$=
{PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-rt ?=3D "true"
+SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-rt ?=3D "true"
=20
-CREATE_SRCIPK_pn-linux-ti-staging-systest ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest ?=3D "board-support/linux=
-systest-${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest ?=3D "true"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest ?=3D "true"
+CREATE_SRCIPK:pn-linux-ti-staging-systest ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux-ti-staging-systest ?=3D "board-support/linux=
-systest-${PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT:pn-linux-ti-staging-systest ?=3D "true"
+SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging-systest ?=3D "true"
=20
-CREATE_SRCIPK_pn-sitara-linux-ti-staging ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging ?=3D "board-support/linux-=
${PV}${KERNEL_LOCALVERSION}"
-SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging ?=3D "true"
-SRCIPK_SHALLOW_CLONE_pn-sitara-linux-ti-staging ?=3D "true"
-SRCIPK_SHALLOW_DEPTH_pn-sitara-linux-ti-staging ?=3D "400"
+CREATE_SRCIPK:pn-sitara-linux-ti-staging ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-sitara-linux-ti-staging ?=3D "board-support/linux-=
${PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT:pn-sitara-linux-ti-staging ?=3D "true"
+SRCIPK_SHALLOW_CLONE:pn-sitara-linux-ti-staging ?=3D "true"
+SRCIPK_SHALLOW_DEPTH:pn-sitara-linux-ti-staging ?=3D "400"
=20
-CREATE_SRCIPK_pn-linux-am335x-psp ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}=
"
+CREATE_SRCIPK:pn-linux-am335x-psp ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux-am335x-psp ?=3D "board-support/linux-${KVER}=
"
=20
-CREATE_SRCIPK_pn-linux-omap ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap ?=3D "board-support/linux-${PV}-${PR}"
+CREATE_SRCIPK:pn-linux-omap ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux-omap ?=3D "board-support/linux-${PV}-${PR}"
=20
-CREATE_SRCIPK_pn-linux ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux ?=3D "board-support/linux-${PV}"
+CREATE_SRCIPK:pn-linux ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux ?=3D "board-support/linux-${PV}"
=20
-CREATE_SRCIPK_pn-linux-omap4 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap4 ?=3D "board-support/linux-${PV}"
+CREATE_SRCIPK:pn-linux-omap4 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linux-omap4 ?=3D "board-support/linux-${PV}"
=20
-CREATE_SRCIPK_pn-cryptodev-module ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-cryptodev-module ?=3D "board-support/extra-drivers=
/cryptodev-module-${PV}"
-SRCIPK_PRESERVE_GIT_pn-cryptodev-module ?=3D "true"
+CREATE_SRCIPK:pn-cryptodev-module ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-cryptodev-module ?=3D "board-support/extra-drivers=
/cryptodev-module-${PV}"
+SRCIPK_PRESERVE_GIT:pn-cryptodev-module ?=3D "true"
=20
-CREATE_SRCIPK_pn-cmem-mod ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-cmem-mod ?=3D "board-support/extra-drivers/${PN}-$=
{PV}"
+CREATE_SRCIPK:pn-cmem-mod ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-cmem-mod ?=3D "board-support/extra-drivers/${PN}-$=
{PV}"
=20
-CREATE_SRCIPK_pn-debugss-module-drv ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-debugss-module-drv ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
+CREATE_SRCIPK:pn-debugss-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-debugss-module-drv ?=3D "board-support/extra-drive=
rs/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-gdbserverproxy-module-drv ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
+CREATE_SRCIPK:pn-gdbserverproxy-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-gdbserverproxy-module-drv ?=3D "board-support/extr=
a-drivers/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-sgx-ddk-km ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
+CREATE_SRCIPK:pn-ti-sgx-ddk-km ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-sgx-ddk-km ?=3D "board-support/extra-drivers/${=
PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-img-rogue-driver ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver ?=3D "board-support/extra-driv=
ers/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver ?=3D "true"
+CREATE_SRCIPK:pn-ti-img-rogue-driver ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-img-rogue-driver ?=3D "board-support/extra-driv=
ers/${PN}-${PV}"
+SRCIPK_PRESERVE_GIT:pn-ti-img-rogue-driver ?=3D "true"
=20
-CREATE_SRCIPK_pn-ti-gc320-driver ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-gc320-driver ?=3D "board-support/extra-drivers/=
${PN}-${PV}"
+CREATE_SRCIPK:pn-ti-gc320-driver ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-gc320-driver ?=3D "board-support/extra-drivers/=
${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-ti-linux-driver-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples ?=3D "example-application=
s/linux-driver-examples-${PV}"
+CREATE_SRCIPK:pn-ti-linux-driver-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-linux-driver-examples ?=3D "example-application=
s/linux-driver-examples-${PV}"
=20
-CREATE_SRCIPK_pn-ti-linux-driver-examples-omapl ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples-omapl ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
+CREATE_SRCIPK:pn-ti-linux-driver-examples-omapl ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-linux-driver-examples-omapl ?=3D "example-appli=
cations/linux-driver-examples-${PV}"
=20
-CREATE_SRCIPK_pn-ti-framework-components ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-framework-components ?=3D "component-sources/fr=
amework_components_${PV}"
+CREATE_SRCIPK:pn-ti-framework-components ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-framework-components ?=3D "component-sources/fr=
amework_components_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codec-engine ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codec-engine ?=3D "component-sources/codec_engi=
ne_${PV}"
+CREATE_SRCIPK:pn-ti-codec-engine ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codec-engine ?=3D "component-sources/codec_engi=
ne_${PV}"
=20
-CREATE_SRCIPK_pn-ti-linuxutils ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-linuxutils ?=3D "component-sources/linuxutils_$=
{PV}"
+CREATE_SRCIPK:pn-ti-linuxutils ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-linuxutils ?=3D "component-sources/linuxutils_$=
{PV}"
=20
-CREATE_SRCIPK_pn-ti-xdctools ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdctools ?=3D "component-sources/xdctools_${PV}=
"
+CREATE_SRCIPK:pn-ti-xdctools ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-xdctools ?=3D "component-sources/xdctools_${PV}=
"
=20
-CREATE_SRCIPK_pn-ti-dmai ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dmai ?=3D "dmai_${PV}"
+CREATE_SRCIPK:pn-ti-dmai ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dmai ?=3D "dmai_${PV}"
=20
-CREATE_SRCIPK_pn-ti-xdais ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-xdais ?=3D "component-sources/xdais_${PV}"
+CREATE_SRCIPK:pn-ti-xdais ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-xdais ?=3D "component-sources/xdais_${PV}"
=20
-CREATE_SRCIPK_pn-ti-local-power-manager ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-local-power-manager ?=3D "local-power-manager_$=
{PV}"
+CREATE_SRCIPK:pn-ti-local-power-manager ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-local-power-manager ?=3D "local-power-manager_$=
{PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm355 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"
+CREATE_SRCIPK:pn-ti-codecs-dm355 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codecs-dm355 ?=3D "codecs-dm355_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dvsdk-demos ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"
+CREATE_SRCIPK:pn-ti-dvsdk-demos ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dvsdk-demos ?=3D "dvsdk-demos_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dvtb ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dvtb ?=3D "dvtb_${PV}"
+CREATE_SRCIPK:pn-ti-dvtb ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dvtb ?=3D "dvtb_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm365 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"
+CREATE_SRCIPK:pn-ti-codecs-dm365 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codecs-dm365 ?=3D "codecs-dm365_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dm365mm-module ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"
+CREATE_SRCIPK:pn-ti-dm365mm-module ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dm365mm-module ?=3D "dm365mm-module_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm6446 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"
+CREATE_SRCIPK:pn-ti-codecs-dm6446 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codecs-dm6446 ?=3D "codecs-dm6446_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-dm6467 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"
+CREATE_SRCIPK:pn-ti-codecs-dm6467 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codecs-dm6467 ?=3D "codecs-dm6467_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-omapl137 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}"
+CREATE_SRCIPK:pn-ti-codecs-omapl137 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codecs-omapl137 ?=3D "codecs-omapl137_${PV}"
=20
-CREATE_SRCIPK_pn-ti-codecs-omapl138 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}"
+CREATE_SRCIPK:pn-ti-codecs-omapl138 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-codecs-omapl138 ?=3D "codecs-omapl138_${PV}"
=20
-CREATE_SRCIPK_pn-ti-cgt6x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"
+CREATE_SRCIPK:pn-ti-cgt6x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-cgt6x ?=3D "dsp-devkit/cgt6x_${PV}"
=20
-CREATE_SRCIPK_pn-ti-cgt470 ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470_${P=
V}"
+CREATE_SRCIPK:pn-ti-cgt470 ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-cgt470 ?=3D "media-controller-devkit/cgt470_${P=
V}"
=20
-CREATE_SRCIPK_pn-ti-dspbios ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dspbios ?=3D "dspbios_${PV}"
+CREATE_SRCIPK:pn-ti-dspbios ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dspbios ?=3D "dspbios_${PV}"
=20
-CREATE_SRCIPK_pn-ti-sysbios ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-sysbios ?=3D "component-sources/bios_${PV}"
+CREATE_SRCIPK:pn-ti-sysbios ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-sysbios ?=3D "component-sources/bios_${PV}"
=20
-CREATE_SRCIPK_pn-ti-biosutils ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-biosutils ?=3D "biosutils_${PV}"
+CREATE_SRCIPK:pn-ti-biosutils ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-biosutils ?=3D "biosutils_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dsplink ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dsplink ?=3D "dsplink_${PV}"
+CREATE_SRCIPK:pn-ti-dsplink ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dsplink ?=3D "dsplink_${PV}"
=20
-CREATE_SRCIPK_pn-ti-syslink ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-syslink ?=3D "component-sources/syslink_${PV}"
+CREATE_SRCIPK:pn-ti-syslink ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-syslink ?=3D "component-sources/syslink_${PV}"
=20
-CREATE_SRCIPK_pn-ti-edma3lld ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-edma3lld ?=3D "component-sources/edma3lld_${PV}=
"
+CREATE_SRCIPK:pn-ti-edma3lld ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-edma3lld ?=3D "component-sources/edma3lld_${PV}=
"
=20
-CREATE_SRCIPK_pn-ti-c6accel ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c6accel ?=3D "component-sources/c6accel_${PV}"
+CREATE_SRCIPK:pn-ti-c6accel ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-c6accel ?=3D "component-sources/c6accel_${PV}"
=20
-CREATE_SRCIPK_pn-ti-biospsp ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-biospsp ?=3D "biospsp_${PV}"
+CREATE_SRCIPK:pn-ti-biospsp ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-biospsp ?=3D "biospsp_${PV}"
=20
-CREATE_SRCIPK_pn-ti-audio-soc-example ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example ?=3D "audio-soc-example_${PV}=
"
+CREATE_SRCIPK:pn-ti-audio-soc-example ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-audio-soc-example ?=3D "audio-soc-example_${PV}=
"
=20
-CREATE_SRCIPK_pn-ti-c6run ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c6run ?=3D "component-sources/c6run_${PV}"
+CREATE_SRCIPK:pn-ti-c6run ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-c6run ?=3D "component-sources/c6run_${PV}"
=20
-CREATE_SRCIPK_pn-ti-osal ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-osal ?=3D "component-sources/osal_${PV}"
+CREATE_SRCIPK:pn-ti-osal ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-osal ?=3D "component-sources/osal_${PV}"
=20
-CREATE_SRCIPK_pn-ti-ipc ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-ipc ?=3D "component-sources/ipc_${PV}"
+CREATE_SRCIPK:pn-ti-ipc ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-ipc ?=3D "component-sources/ipc_${PV}"
=20
-CREATE_SRCIPK_pn-ti-dsp-benchmark ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-dsp-benchmark ?=3D "example-applications/dsp-be=
nchmark_${PV}"
+CREATE_SRCIPK:pn-ti-dsp-benchmark ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-dsp-benchmark ?=3D "example-applications/dsp-be=
nchmark_${PV}"
=20
-CREATE_SRCIPK_pn-gstreamer-ti ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"
+CREATE_SRCIPK:pn-gstreamer-ti ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-gstreamer-ti ?=3D "gstreamer-ti_${PV}"
=20
-CREATE_SRCIPK_pn-ti-omx ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-omx ?=3D "component-sources/omx_${PV}"
+CREATE_SRCIPK:pn-ti-omx ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-omx ?=3D "component-sources/omx_${PV}"
=20
-CREATE_SRCIPK_pn-ti-uia ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-uia ?=3D "component-sources/uia_${PV}"
+CREATE_SRCIPK:pn-ti-uia ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-uia ?=3D "component-sources/uia_${PV}"
=20
-CREATE_SRCIPK_pn-ti-media-controller-utils ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-media-controller-utils ?=3D "board-support/medi=
a-controller-utils_${PV}"
+CREATE_SRCIPK:pn-ti-media-controller-utils ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-media-controller-utils ?=3D "board-support/medi=
a-controller-utils_${PV}"
=20
-CREATE_SRCIPK_pn-ti-firmware-dm816x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-firmware-dm816x ?=3D "board-support/prebuilt-im=
ages/dm816x-firmware_${PV}"
+CREATE_SRCIPK:pn-ti-firmware-dm816x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-firmware-dm816x ?=3D "board-support/prebuilt-im=
ages/dm816x-firmware_${PV}"
=20
-CREATE_SRCIPK_pn-ti-firmware-dm814x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-firmware-dm814x ?=3D "board-support/prebuilt-im=
ages/dm814x-firmware_${PV}"
+CREATE_SRCIPK:pn-ti-firmware-dm814x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-firmware-dm814x ?=3D "board-support/prebuilt-im=
ages/dm814x-firmware_${PV}"
=20
-CREATE_SRCIPK_pn-ti-slog ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-slog ?=3D "component-sources/slog_${PV}"
+CREATE_SRCIPK:pn-ti-slog ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-slog ?=3D "component-sources/slog_${PV}"
=20
-CREATE_SRCIPK_pn-ti-c674x-aaclcdec ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec ?=3D "component-sources/c674x-aa=
clcdec_${PV}"
+CREATE_SRCIPK:pn-ti-c674x-aaclcdec ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-ti-c674x-aaclcdec ?=3D "component-sources/c674x-aa=
clcdec_${PV}"
=20
-CREATE_SRCIPK_pn-oe-layersetup ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-oe-layersetup ?=3D "bin/oe-layersetup"
+CREATE_SRCIPK:pn-oe-layersetup ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-oe-layersetup ?=3D "bin/oe-layersetup"
=20
-CREATE_SRCIPK_pn-opencl-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-opencl-examples ?=3D "example-applications/${PN}-$=
{PV}"
+CREATE_SRCIPK:pn-opencl-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-opencl-examples ?=3D "example-applications/${PN}-$=
{PV}"
=20
-CREATE_SRCIPK_pn-openmpacc-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-openmpacc-examples ?=3D "example-applications/${PN=
}-${PV}"
+CREATE_SRCIPK:pn-openmpacc-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-openmpacc-examples ?=3D "example-applications/${PN=
}-${PV}"
=20
-CREATE_SRCIPK_pn-tidl-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-tidl-examples ?=3D "example-applications/${PN}-${P=
V}"
-SRCIPK_SRC_DIR_pn-tidl-examples ?=3D "${S}/examples"
+CREATE_SRCIPK:pn-tidl-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-tidl-examples ?=3D "example-applications/${PN}-${P=
V}"
+SRCIPK_SRC_DIR:pn-tidl-examples ?=3D "${S}/examples"
=20
-CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded ?=3D "exampl=
e-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-qt-opencv-opencl-opengl-multithreaded ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-qt-opencv-opencl-opengl-multithreaded ?=3D "exampl=
e-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-libarch-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-libarch-examples ?=3D "example-applications/${PN}-=
${PV}"
+CREATE_SRCIPK:pn-libarch-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-libarch-examples ?=3D "example-applications/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-linalg-examples ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-linalg-examples ?=3D "example-applications/${PN}-$=
{PV}"
-SRCIPK_SRC_DIR_pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"
+CREATE_SRCIPK:pn-linalg-examples ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-linalg-examples ?=3D "example-applications/${PN}-$=
{PV}"
+SRCIPK_SRC_DIR:pn-linalg-examples ?=3D "${EXAMPLES_ROOT}"
=20
-CREATE_SRCIPK_pn-barcode-roi ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-barcode-roi ?=3D "example-applications/${PN}-${PV}=
"
+CREATE_SRCIPK:pn-barcode-roi ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-barcode-roi ?=3D "example-applications/${PN}-${PV}=
"
=20
-CREATE_SRCIPK_pn-boot-monitor ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-boot-monitor ?=3D "board-support/${PN}-${PV}"
+CREATE_SRCIPK:pn-boot-monitor ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-boot-monitor ?=3D "board-support/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-hplib-mod ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-hplib-mod ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
+CREATE_SRCIPK:pn-hplib-mod ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-hplib-mod ?=3D "board-support/extra-drivers/${PN}-=
${PV}"
=20
-CREATE_SRCIPK_pn-uio-module-drv ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-uio-module-drv ?=3D "board-support/extra-drivers/$=
{PN}-${PV}"
+CREATE_SRCIPK:pn-uio-module-drv ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-uio-module-drv ?=3D "board-support/extra-drivers/$=
{PN}-${PV}"
=20
-CREATE_SRCIPK_pn-pru-icss ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-pru-icss ?=3D "example-applications/${PN}-${PV}"
+CREATE_SRCIPK:pn-pru-icss ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-pru-icss ?=3D "example-applications/${PN}-${PV}"
=20
-CREATE_SRCIPK_pn-dsplib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-dsplib-c66x ?=3D "component-sources/dsplib_c66x_${=
PV}"
+CREATE_SRCIPK:pn-dsplib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-dsplib-c66x ?=3D "component-sources/dsplib_c66x_${=
PV}"
=20
-CREATE_SRCIPK_pn-mathlib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-mathlib-c66x ?=3D "component-sources/mathlib_c66x_=
${PV}"
+CREATE_SRCIPK:pn-mathlib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-mathlib-c66x ?=3D "component-sources/mathlib_c66x_=
${PV}"
=20
-CREATE_SRCIPK_pn-imglib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-imglib-c66x ?=3D "component-sources/imglib_c66x_${=
PV}"
+CREATE_SRCIPK:pn-imglib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-imglib-c66x ?=3D "component-sources/imglib_c66x_${=
PV}"
=20
-CREATE_SRCIPK_pn-vlib-c66x ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${PV}"
+CREATE_SRCIPK:pn-vlib-c66x ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-vlib-c66x ?=3D "component-sources/vlib_c66x_${PV}"
=20
-CREATE_SRCIPK_pn-big-data-ipc-demo-linux ?=3D "1"
-SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux ?=3D "example-applications=
/${PN}-${PV}"
+CREATE_SRCIPK:pn-big-data-ipc-demo-linux ?=3D "1"
+SRCIPK_INSTALL_DIR:pn-big-data-ipc-demo-linux ?=3D "example-applications=
/${PN}-${PV}"
diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/m=
eta-arago-distro/conf/distro/include/branding-amsdk.inc
index 6a4dd47b..96df5660 100644
--- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
@@ -1,7 +1,7 @@
 ARAGO_TISDK_IMAGE =3D "arago-amsdk-image"
=20
-PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "sitara-linux-ti-stagin=
g"
-PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "sitara-linux-ti-stagin=
g"
+PREFERRED_PROVIDER_virtual/kernel:am335x-evm =3D "sitara-linux-ti-stagin=
g"
+PREFERRED_PROVIDER_virtual/kernel:am437x-evm =3D "sitara-linux-ti-stagin=
g"
 PREFERRED_VERSION_sitara-linux-ti-staging =3D "3.14%"
=20
 # To create newlines in the message \n is used and the slash must be esc=
aped
@@ -24,8 +24,8 @@ script located in the sdk\'s bin directory\\n\
 The script may take several minutes but you will then have a full copy o=
f\\n\
 the git repository including its entire git history.\\n"
=20
-SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging =3D "amsdk-8.0"
-SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging =3D "${SRCIPK_SHALL=
OW_GIT_COMMIT_MESSAGE}"
+SRCIPK_CUSTOM_GIT_BRANCH:pn-sitara-linux-ti-staging =3D "amsdk-8.0"
+SRCIPK_CUSTOM_GIT_MESSAGE:pn-sitara-linux-ti-staging =3D "${SRCIPK_SHALL=
OW_GIT_COMMIT_MESSAGE}"
=20
-SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging =3D "amsdk-8.0"
-SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_=
MESSAGE}"
+SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging =3D "amsdk-8.0"
+SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_=
MESSAGE}"
diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc =
b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 71b09f71..4054c5af 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -3,15 +3,15 @@
 require branding-core.inc
=20
 # Auto rev important packages to pick up latest
-SRCREV_pn-linux-ti-staging =3D "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-rt =3D "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-systest =3D "${AUTOREV}"
-SRCREV_pn-u-boot-ti-staging =3D "${AUTOREV}"
-SRCREV_pn-ltp-ddt =3D "${AUTOREV}"
-#SRCREV_pn-optee-os =3D "${AUTOREV}"
-#SRCREV_pn-optee-client =3D "${AUTOREV}"
-#SRCREV_pn-optee-test =3D "${AUTOREV}"
-SRCREV_pn-arm-trusted-firmware =3D "${AUTOREV}"
+SRCREV:pn-linux-ti-staging =3D "${AUTOREV}"
+SRCREV:pn-linux-ti-staging-rt =3D "${AUTOREV}"
+SRCREV:pn-linux-ti-staging-systest =3D "${AUTOREV}"
+SRCREV:pn-u-boot-ti-staging =3D "${AUTOREV}"
+SRCREV:pn-ltp-ddt =3D "${AUTOREV}"
+#SRCREV:pn-optee-os =3D "${AUTOREV}"
+#SRCREV:pn-optee-client =3D "${AUTOREV}"
+#SRCREV:pn-optee-test =3D "${AUTOREV}"
+SRCREV:pn-arm-trusted-firmware =3D "${AUTOREV}"
=20
 # Point to the latest ti linux firmware
 TI_LINUX_FW_SRCREV =3D "${AUTOREV}"
@@ -28,8 +28,8 @@ TI_RTOS_METADATA_BRANCH =3D "next"
 # Switch to internal nightlies, force overriding incorrect metadata valu=
es
 # and ensure parsing won't break w/o metadata file
 CORESDK_RTOS_WEBLINK_NIGHTLY ?=3D "file://empty"
-CORESDK_RTOS_WEBLINK_forcevariable =3D "${CORESDK_RTOS_WEBLINK_NIGHTLY}"
-CORESDK_RTOS_FIRMWARE_URL_forcevariable =3D "${DEFAULT_FIRMWARE_URL}"
+CORESDK_RTOS_WEBLINK:forcevariable =3D "${CORESDK_RTOS_WEBLINK_NIGHTLY}"
+CORESDK_RTOS_FIRMWARE_URL:forcevariable =3D "${DEFAULT_FIRMWARE_URL}"
=20
 # Avoid use of old cached nightly file by using timed prefix
 DATEH :=3D "${@time.strftime('%Y%m%d%H',time.gmtime())}"
@@ -37,4 +37,4 @@ CORESDK_RTOS_FILE_PREFIX =3D "${DATEH}-"
 CORESDK_RTOS_FILE_SUFFIX =3D ";downloadfilename=3D${CORESDK_RTOS_FILE_PR=
EFIX}${DEFAULT_FIRMWARE_FILE}"
=20
 # Build and assemble TI-SDK, but don't package it
-IMAGE_FSTYPES_pn-tisdk-core-bundle =3D ""
+IMAGE_FSTYPES:pn-tisdk-core-bundle =3D ""
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/me=
ta-arago-distro/conf/distro/include/branding-core.inc
index 3d259d2d..b28fb196 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -6,11 +6,11 @@
 # hence this file is mostly empty and used as a template
=20
 # Lower opencl-monitor priority for now
-ALTERNATIVE_PRIORITY_pn-opencl-monitor =3D "1"
-ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu =3D "1"
+ALTERNATIVE_PRIORITY:pn-opencl-monitor =3D "1"
+ALTERNATIVE_PRIORITY:pn-opencl-monitor-ipu =3D "1"
=20
 # Raise priority for sample IPC FW images
-ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos =3D "15"
+ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos =3D "15"
=20
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GS=
T 1.18
-MACHINE_FEATURES_remove =3D "mmip"
+MACHINE_FEATURES:remove =3D "mmip"
diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/m=
eta-arago-distro/conf/distro/include/branding-glsdk.inc
index 9a491038..0abd73cc 100644
--- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
@@ -3,8 +3,8 @@
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-glsdk"
=20
-PREFERRED_PROVIDER_virtual/bootloader_omap-a15 =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot_omap-a15 =3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader:omap-a15 =3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot:omap-a15 =3D "u-boot-ti-staging"
=20
 # Set the PREFERRED_VERSION of libdrm to the glsdk version for the=20
 # glsdk branded builds
diff --git a/meta-arago-distro/conf/distro/include/branding-mainline.inc =
b/meta-arago-distro/conf/distro/include/branding-mainline.inc
index 786508d9..2fc9dc5f 100644
--- a/meta-arago-distro/conf/distro/include/branding-mainline.inc
+++ b/meta-arago-distro/conf/distro/include/branding-mainline.inc
@@ -1,7 +1,7 @@
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-mainline"
 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-mainline"
 PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-mainline"
-SRCREV_ti-upstream-tools_pn-linux-ti-mainline =3D "${AUTOREV}"
+SRCREV_ti-upstream-tools:pn-linux-ti-mainline =3D "${AUTOREV}"
=20
 # GPU support requires out-of-tree SGX and RGX drivers not available in =
mainline
-MACHINE_FEATURES_remove =3D "gpu"
+MACHINE_FEATURES:remove =3D "gpu"
diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk=
.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 166e259a..25bb1b8c 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -2,8 +2,8 @@ ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
=20
 # Set CMEM reserved memory region
 RESERVE_CMEM =3D "${@bb.utils.contains('MACHINE_FEATURES','dsp','1','0',=
d)}"
-CMEM_BASE_omap-a15 ?=3D "a0000000"
-CMEM_SIZE_omap-a15 ?=3D "08000000"
+CMEM_BASE:omap-a15 ?=3D "a0000000"
+CMEM_SIZE:omap-a15 ?=3D "08000000"
=20
 # To create newlines in the message \n is used and the slash must be esc=
aped
 # to function properly
@@ -25,10 +25,10 @@ script located in the sdk\'s bin directory\\n\
 The script may take several minutes but you will then have a full copy o=
f\\n\
 the git repository including its entire git history.\\n"
=20
-SRCIPK_CUSTOM_GIT_BRANCH_pn-linux-ti-staging =3D "processor-sdk-local"
-SRCIPK_CUSTOM_GIT_MESSAGE_pn-linux-ti-staging =3D "${SRCIPK_SHALLOW_GIT_=
COMMIT_MESSAGE}"
-SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging =3D "true"
-SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging =3D "400"
+SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-ti-staging =3D "processor-sdk-local"
+SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-ti-staging =3D "${SRCIPK_SHALLOW_GIT_=
COMMIT_MESSAGE}"
+SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging =3D "true"
+SRCIPK_SHALLOW_DEPTH:pn-linux-ti-staging =3D "400"
=20
-SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging =3D "processor-sdk-local"
-SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_=
MESSAGE}"
+SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging =3D "processor-sdk-local"
+SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_=
MESSAGE}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc b/me=
ta-arago-distro/conf/distro/include/toolchain-arm.inc
index e69536f9..9b76917d 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
@@ -5,12 +5,12 @@ EAT_TARGET_SYS_ARMV5 ?=3D "arm-none-linux-gnueabi"
 EAT_TARGET_SYS_ARMV7 ?=3D "arm-none-linux-gnueabihf"
 EAT_TARGET_SYS_ARMV8 ?=3D "aarch64-none-linux-gnu"
=20
-EAT_TARGET_SYS_arm =3D "${EAT_TARGET_SYS_ARMV5}"
-EAT_TARGET_SYS_armv7a =3D "${EAT_TARGET_SYS_ARMV7}"
-EAT_TARGET_SYS_aarch64 =3D "${EAT_TARGET_SYS_ARMV8}"
+EAT_TARGET_SYS:arm =3D "${EAT_TARGET_SYS_ARMV5}"
+EAT_TARGET_SYS:armv7a =3D "${EAT_TARGET_SYS_ARMV7}"
+EAT_TARGET_SYS:aarch64 =3D "${EAT_TARGET_SYS_ARMV8}"
=20
 SECONDARY_TARGET_ARCH =3D "invalid"
-SECONDARY_TARGET_ARCH_k3 =3D "armv7a"
+SECONDARY_TARGET_ARCH:k3 =3D "armv7a"
=20
 TARGET_VENDOR =3D ""
=20
@@ -19,9 +19,9 @@ TOOLCHAIN_PATH_ARMV5 ?=3D "${TOOLCHAIN_BASE}/gcc-arm-9.=
2-ti2020.01-armv5-x86_64-${
 TOOLCHAIN_PATH_ARMV7 ?=3D "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-=
${EAT_TARGET_SYS_ARMV7}"
 TOOLCHAIN_PATH_ARMV8 ?=3D "${TOOLCHAIN_BASE}/gcc-arm-9.2-2019.12-x86_64-=
${EAT_TARGET_SYS_ARMV8}"
=20
-DEF_TOOLCHAIN_PATH_arm =3D "${TOOLCHAIN_PATH_ARMV5}"
-DEF_TOOLCHAIN_PATH_armv7a =3D "${TOOLCHAIN_PATH_ARMV7}"
-DEF_TOOLCHAIN_PATH_aarch64 =3D "${TOOLCHAIN_PATH_ARMV8}"
+DEF_TOOLCHAIN_PATH:arm =3D "${TOOLCHAIN_PATH_ARMV5}"
+DEF_TOOLCHAIN_PATH:armv7a =3D "${TOOLCHAIN_PATH_ARMV7}"
+DEF_TOOLCHAIN_PATH:aarch64 =3D "${TOOLCHAIN_PATH_ARMV8}"
=20
 TOOLCHAIN_PATH ?=3D "${DEF_TOOLCHAIN_PATH}"
=20
@@ -38,7 +38,7 @@ PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGE=
T_ARCH} ?=3D "external-arm-
 PREFERRED_PROVIDER_binutils-cross-canadian-${SECONDARY_TARGET_ARCH} ?=3D=
 "external-arm-secondary-sdk-toolchain-${SECONDARY_TARGET_ARCH}"
=20
 # Special case for gdb to be built as part of canadian-cross-sdk, instea=
d of packaged from external toolchain
-bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${exec_prefi=
x}/bin"
+bindir:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${exec_prefi=
x}/bin"
 PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
=20
 # Set up runtime preferences
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/l=
ayer.conf
index da0bb7ed..28d553ed 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,11 +8,12 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-distro =3D "dunfell gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-arago-distro =3D "honister"
=20
 LAYERDEPENDS_meta-arago-distro =3D " \
     core \
-    meta-ti \
+    meta-ti-bsp \
+    meta-ti-extras \
     openembedded-layer \
     networking-layer \
     meta-python \
diff --git a/meta-arago-distro/conf/machine/arago-armv8.conf b/meta-arago=
-distro/conf/machine/arago-armv8.conf
index 7296347c..fd6147fe 100644
--- a/meta-arago-distro/conf/machine/arago-armv8.conf
+++ b/meta-arago-distro/conf/machine/arago-armv8.conf
@@ -18,4 +18,4 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 MACHINE_FEATURES =3D ""
 MACHINE_FEATURES_BACKFILL_CONSIDERED =3D "rtc"
=20
-RDEPENDS_kernel-base =3D ""
+RDEPENDS:kernel-base =3D ""
diff --git a/meta-arago-distro/dynamic-layers/browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic=
-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.b=
bappend
index e1600e8d..13ac6464 100644
--- a/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chro=
mium/chromium-ozone-wayland_%.bbappend
+++ b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chro=
mium/chromium-ozone-wayland_%.bbappend
@@ -1,8 +1,8 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-DEPENDS_remove =3D "virtual/libgl"
+DEPENDS:remove =3D "virtual/libgl"
=20
 SRC_URI +=3D "file://chromium-75.0.3770.80-SIOCGSTAMP.patch"
 SRC_URI +=3D "file://pulse.patch"
diff --git a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-bench=
marks_%.bbappend b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm=
-benchmarks_%.bbappend
index e0b3ebe3..a281f4dd 100644
--- a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%=
.bbappend
+++ b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_%=
.bbappend
@@ -1,3 +1,3 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 SRCIPK_SRC_DIR =3D "${S}/${PLATFORM_ARCH}"
diff --git a/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbap=
pend b/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
index 9cd8ce77..bf4b3ac9 100644
--- a/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
+++ b/meta-arago-distro/recipes-benchmark/glmark2/glmark2_git.bbappend
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 SRC_URI +=3D "file://0001-native-state-drm-restrict-udev-enumeration-to-=
card0-.patch"
=20
diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend=
 b/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
index 57c5d684..ac18074a 100644
--- a/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
+++ b/meta-arago-distro/recipes-benchmark/stream/stream_%.bbappend
@@ -1,12 +1,12 @@
-INSANE_SKIP_${PN} +=3D "ldflags"
-INSANE_SKIP_${PN}-openmp +=3D "ldflags"
+INSANE_SKIP:${PN} +=3D "ldflags"
+INSANE_SKIP:${PN}-openmp +=3D "ldflags"
=20
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
 BRANCH =3D "sdk"
 SRCREV =3D "96156d407d9a4e5fac4513f3d3f60a414b3355cd"
=20
-do_compile_prepend() {
+do_compile:prepend() {
     #Explicitly clear some variables to insure no unexpected optimizatio=
ns are being passed in.
     unset CFLAGS
     unset LDFLAGS
diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend=
 b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
index c5a35b7c..ef9c2f32 100644
--- a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
diff --git a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.b=
b b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
index 50dc369d..9759e688 100644
--- a/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
+++ b/meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb
@@ -16,9 +16,9 @@ INITSCRIPT_PARAMS =3D "defaults 99"
=20
 inherit allarch update-rc.d systemd
=20
-SYSTEMD_SERVICE_${PN} =3D "bt-enable.service"
+SYSTEMD_SERVICE:${PN} =3D "bt-enable.service"
=20
-RDEPENDS_${PN} +=3D "bash"
+RDEPENDS:${PN} +=3D "bash"
=20
 do_install () {
 	install -d ${D}${sysconfdir}/init.d
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.b=
bappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbap=
pend
index 78b78475..500071e4 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%.bbappend
@@ -1,7 +1,7 @@
-PR_append =3D ".arago6"
+PR:append =3D ".arago6"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
     file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.pat=
ch \
 "
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.b=
bappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbap=
pend
index e4fb109a..06329b6e 100644
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
 PV =3D "3.0+git${SRCPV}"
=20
 BRANCH =3D "ti-linuxptp"
@@ -12,6 +12,6 @@ SRC_URI =3D " \
=20
 S =3D "${WORKDIR}/git"
=20
-do_install_append () {
+do_install:append () {
     install -p ${S}/phc2pwm ${D}/${bindir}
 }
diff --git a/meta-arago-distro/recipes-containers/docker/docker%.bbappend=
 b/meta-arago-distro/recipes-containers/docker/docker%.bbappend
index ccf9ff2c..1d3c37ba 100644
--- a/meta-arago-distro/recipes-containers/docker/docker%.bbappend
+++ b/meta-arago-distro/recipes-containers/docker/docker%.bbappend
@@ -1,6 +1,6 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
-do_install_append() {
+do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}=
; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker=
.init
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-no=
tice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notic=
e.bb
index 6d89f46f..33aa31f7 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -22,4 +22,4 @@ do_install(){
 	install -m0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_uni=
tdir}
 }
=20
-SYSTEMD_SERVICE_${PN} =3D "gplv3-notice.service"
+SYSTEMD_SERVICE:${PN} =3D "gplv3-notice.service"
diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbapp=
end b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
index c5f25f6a..e5c53e80 100644
--- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
+++ b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago4"
+PR:append =3D ".arago4"
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/=
meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index 42211792..9b440aa3 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -1,6 +1,6 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-SRC_URI_append =3D " file://0001-rtcwake-Allow-poweroff-with-rtcwake-com=
mand.patch "
+SRC_URI:append =3D " file://0001-rtcwake-Allow-poweroff-with-rtcwake-com=
mand.patch "
=20
-PR_append =3D ".arago21"
+PR:append =3D ".arago21"
diff --git a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_=
1.0.bb b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.=
bb
index 991fd2b8..ffc4d223 100644
--- a/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb
@@ -19,5 +19,5 @@ do_install() {
     install -m 0755 ${S}/udhcpd.conf ${D}${sysconfdir}
 }
=20
-FILES_${PN} +=3D "${sysconfdir}/udhcpd.conf"
-CONFFILES_${PN} +=3D "${sysconfdir}/udhcpd.conf"
+FILES:${PN} +=3D "${sysconfdir}/udhcpd.conf"
+CONFFILES:${PN} +=3D "${sysconfdir}/udhcpd.conf"
diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-a=
rago-distro/recipes-core/dbus/dbus_%.bbappend
index 6e5d14cb..4bf6578a 100644
--- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
+++ b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
@@ -1,3 +1,3 @@
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
 LICENSE =3D "GPLv2+"
diff --git a/meta-arago-distro/recipes-core/feed-config/arago-feed-config=
_1.0.bb b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.=
0.bb
index 7bf169b2..4239bc8f 100644
--- a/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
+++ b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
@@ -37,7 +37,7 @@ do_install () {
 	install -m 0644  ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/
 }
=20
-FILES_${PN} =3D "${sysconfdir}/opkg/"
+FILES:${PN} =3D "${sysconfdir}/opkg/"
=20
-CONFFILES_${PN} +=3D "${sysconfdir}/opkg/base-feeds.conf \
+CONFFILES:${PN} +=3D "${sysconfdir}/opkg/base-feeds.conf \
                     ${sysconfdir}/opkg/arch.conf"
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index e068287e..12446185 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE =3D "ti-soc"
 IMAGE_FEATURES +=3D "package-management splash"
=20
 # 4KB per 1 inode should be enough
-EXTRA_IMAGECMD_ext2.gz +=3D "-i 4096"
+EXTRA_IMAGECMD:ext2.gz +=3D "-i 4096"
=20
 IMAGE_INSTALL =3D " \
 	packagegroup-core-boot \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/=
meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 76668831..1f6928b1 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -4,7 +4,7 @@
 require arago-image.inc
=20
 IMAGE_FSTYPES +=3D "cpio.xz"
-IMAGE_FSTYPES_append_dra7xx =3D " ubifs ubi"
+IMAGE_FSTYPES:append:dra7xx =3D " ubifs ubi"
=20
 IMAGE_INSTALL +=3D "\
     packagegroup-arago-base \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b=
/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 636464b6..feff7842 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -1,14 +1,14 @@
 require tisdk-core-bundle.inc
=20
-DEPLOY_SPL_NAME_omapl138 =3D ""
-DEPLOY_SPL_NAME_k3 =3D "tispl.bin tiboot3.bin"
+DEPLOY_SPL_NAME:omapl138 =3D ""
+DEPLOY_SPL_NAME:k3 =3D "tispl.bin tiboot3.bin"
=20
-DEPLOY_IMAGES_NAME_k3 =3D "bl31.bin bl32.bin"
-DEPLOY_IMAGES_NAME_append_am65xx =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_j7-evm =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_j7-hs-evm =3D " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_am65xx-evm =3D " ti-sci-firmware-am65x-gp.bin =
sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
-DEPLOY_IMAGES_NAME_append_j7-evm =3D " ti-fs-firmware-j721e-gp.bin"
+DEPLOY_IMAGES_NAME:k3 =3D "bl31.bin bl32.bin"
+DEPLOY_IMAGES_NAME:append:am65xx =3D " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:j7-evm =3D " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:j7-hs-evm =3D " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:am65xx-evm =3D " ti-sci-firmware-am65x-gp.bin =
sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
+DEPLOY_IMAGES_NAME:append:j7-evm =3D " ti-fs-firmware-j721e-gp.bin"
=20
 ARAGO_TISDK_IMAGE ?=3D "tisdk-core-bundle"
 export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 823402ad..cf4d0298 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -17,14 +17,14 @@ TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev libgnut=
ls-extra26 libgnutls-openssl2
 # Set DTB filters for each machine.  Use "unknown" by default to avoid
 # picking up DTB files for devices with no DTB support.
 DTB_FILTER =3D "unknown"
-DTB_FILTER_ti33x =3D "am335x"
-DTB_FILTER_dra7xx-evm =3D "dra7"
-DTB_FILTER_am57xx-evm =3D "am57xx"
-DTB_FILTER_am57xx-hs-evm =3D "${DTB_FILTER_am57xx-evm}"
-DTB_FILTER_ti43x =3D "am43"
-DTB_FILTER_omapl138 =3D "da850"
-DTB_FILTER_am65xx =3D "am65"
-DTB_FILTER_j7 =3D "j721e"
+DTB_FILTER:ti33x =3D "am335x"
+DTB_FILTER:dra7xx-evm =3D "dra7"
+DTB_FILTER:am57xx-evm =3D "am57xx"
+DTB_FILTER:am57xx-hs-evm =3D "${DTB_FILTER:am57xx-evm}"
+DTB_FILTER:ti43x =3D "am43"
+DTB_FILTER:omapl138 =3D "da850"
+DTB_FILTER:am65xx =3D "am65"
+DTB_FILTER:j7 =3D "j721e"
=20
 # List of target side images to build for the SDK
 TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index efac8d44..cd0f71b7 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -30,14 +30,14 @@ export IMAGE_BASENAME =3D "tisdk-default-image"
=20
 # Disable ubi/ubifs as the filesystem requires more space than is
 # available on the HW.
-IMAGE_FSTYPES_remove_omapl138 =3D "ubifs ubi"
+IMAGE_FSTYPES:remove:omapl138 =3D "ubifs ubi"
=20
 # Below is the delta in packages between old fuller and a new smaller de=
fault rootfs
 CHROMIUM =3D ""
-CHROMIUM_append_omap-a15 =3D "\
+CHROMIUM:append:omap-a15 =3D "\
     chromium-ozone-wayland \
 "
-CHROMIUM_append_k3 =3D "\
+CHROMIUM:append:k3 =3D "\
     chromium-ozone-wayland \
 "
=20
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/=
meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index c0ef8f24..a3db6ac2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -2,7 +2,7 @@ ARAGO_SYSVINIT =3D "1"
=20
 require arago-image.inc
=20
-IMAGE_FEATURES_remove =3D "package-management splash"
+IMAGE_FEATURES:remove =3D "package-management splash"
=20
 IMAGE_FSTYPES +=3D "cpio cpio.xz"
=20
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%=
.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.=
bbappend
index 129dd96a..d27bd7f0 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappe=
nd
+++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappe=
nd
@@ -1,4 +1,4 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
diff --git a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.b=
bappend b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbap=
pend
index 5716ea13..ddf37ee2 100644
--- a/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-arm-toolchain.bbappend
@@ -10,8 +10,8 @@ KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti=
-linux-kernel.git"
 KERNEL_GIT_PROTOCOL =3D "git"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH}"
=20
-PKGV_linux-libc-headers-dev =3D "5.10"
-PKGV_linux-libc-headers =3D "5.10"
+PKGV:linux-libc-headers-dev =3D "5.10"
+PKGV:linux-libc-headers =3D "5.10"
=20
 inherit kernel-arch pkgconfig multilib_header
=20
@@ -19,12 +19,12 @@ EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC}" HOSTCPP=3D"=
${BUILD_CPP}""
=20
 DEPENDS +=3D "bison-native rsync-native"
=20
-do_configure_append() {
+do_configure:append() {
 	cd ${WORKDIR}/git
 	oe_runmake allnoconfig
 }
=20
-do_install_append() {
+do_install:append() {
 	cd ${WORKDIR}/git
 	oe_runmake headers_install INSTALL_HDR_PATH=3D${B}${exec_prefix}
=20
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tis=
dk.inc b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.i=
nc
index be89feaa..e8d389c5 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
@@ -3,6 +3,6 @@ TOOLCHAIN_CLEANUP_PACKAGES ?=3D "libgnutls-dev libgnutls-=
extra26 libgnutls-openssl
=20
 INC_PR =3D "r5"
=20
-toolchain_create_sdk_env_script_append() {
+toolchain_create_sdk_env_script:append() {
     echo -e 'export PS1=3D"\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' =
>> $script
 }
diff --git a/meta-arago-distro/recipes-core/packagegroups/build-essential=
.bb b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
index c50053a2..5b9930b8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
@@ -4,4 +4,4 @@ LICENSE =3D "MIT"
=20
 inherit packagegroup
=20
-RDEPENDS_${PN} =3D "packagegroup-core-buildessential"
+RDEPENDS:${PN} =3D "packagegroup-core-buildessential"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-base-tisdk-server-extra.bb
index 0628b630..50122f11 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk-server-extra.bb
@@ -23,7 +23,7 @@ ARAGO_NDISC6 =3D "\
     ndisc6-tracert6 \
     "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${ARAGO_LIBNL} \
     ${ARAGO_NDISC6} \
     ptpd \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-base-tisdk.bb
index e0d33bbb..a27a13ef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e-tisdk.bb
@@ -11,7 +11,7 @@ OPTEE_PKGS =3D " \
     optee-test \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     dbus \
     expat \
     glib-2.0 \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-base.bb
index 5b8bea7f..caa0bc01 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bas=
e.bb
@@ -40,7 +40,7 @@ ARAGO_EXTRA =3D "\
 "
=20
 # minimal set of packages - needed to boot
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-ba=
se-zeroconf', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}=
', '',d)} \
     ${ARAGO_BASE} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegrou=
p-arago-console.bb
index 619c6a18..cd2960c1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-con=
sole.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-con=
sole.bb
@@ -75,10 +75,10 @@ ARAGO_CONSOLE =3D "\
     ${ARAGO_SDK_PREREQ} \
     "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${ARAGO_CONSOLE} \
     "
=20
-RRECOMMENDS_${PN} =3D "\
+RRECOMMENDS:${PN} =3D "\
     kernel-modules \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-gst-sdk-target.bb
index 15323b0f..ef5624ec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
-sdk-target.bb
@@ -18,11 +18,11 @@ GSTREAMER_DSP =3D " \
     ${@['','gstreamer1.0-plugins-dsp66-dev'][oe.utils.all_distro_feature=
s(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'ds=
p', True, False, d)]} \
 "
=20
-GSTREAMER_DEPS_append_dra7xx =3D " \
+GSTREAMER_DEPS:append:dra7xx =3D " \
     gstreamer1.0-plugins-hevc-dev \
     ${GSTREAMER_DSP} \
 "
=20
-RDEPENDS_${PN} =3D " \
+RDEPENDS:${PN} =3D " \
     ${GSTREAMER_DEPS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-gst.bb
index e16b9878..65e315a1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst=
.bb
@@ -21,16 +21,16 @@ GSTREAMER_DSP =3D " \
     ${@['','gstreamer1.0-plugins-dsp66'][oe.utils.all_distro_features(d,=
 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', =
True, False, d)]} \
 "
=20
-GSTREAMER_DEPS_append_dra7xx =3D " \
+GSTREAMER_DEPS:append:dra7xx =3D " \
     gstreamer1.0-plugins-hevc \
     ${GSTREAMER_DSP} \
 "
=20
 GSTREAMER_ACCEL_MM =3D ""
-GSTREAMER_ACCEL_MM_omap-a15 =3D "${@bb.utils.contains('MACHINE_FEATURES'=
, 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-GSTREAMER_ACCEL_MM_append_dra7xx =3D "${@bb.utils.contains('MACHINE_FEAT=
URES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+GSTREAMER_ACCEL_MM:omap-a15 =3D "${@bb.utils.contains('MACHINE_FEATURES'=
, 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+GSTREAMER_ACCEL_MM:append:dra7xx =3D "${@bb.utils.contains('MACHINE_FEAT=
URES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${GSTREAMER_DEPS} \
     ${GSTREAMER_ACCEL_MM} \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-misc.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-misc.bb
index 091d728f..6604cca1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-mis=
c.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-mis=
c.bb
@@ -4,7 +4,7 @@ PR =3D "r0"
=20
 inherit packagegroup
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     nano \
     mc \
     rsync \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-qte.bb
index 3d69ba81..6dac7bfb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte=
.bb
@@ -6,7 +6,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     qtbase-plugins \
     qtdeclarative-qmlplugins \
     qtlocation-plugins \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-addons-sdk-host.bb
index 366712e8..8d7cad24 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-host.bb
@@ -14,63 +14,63 @@ UTILS =3D " \
=20
 # ti-pru-sw-edma-driver is currently broken
 # Add pru and profibus sources for omapl138 devices
-#UTILS_append_omapl138 =3D " \
+#UTILS:append:omapl138 =3D " \
 #    ti-pru-sw-examples-source \
 #"
=20
-UTILS_append_omap-a15 =3D " \
+UTILS:append:omap-a15 =3D " \
     omapconf-source \
     pru-icss-source \
 "
=20
-UTILS_append_ti33x =3D " \
+UTILS:append:ti33x =3D " \
     omapconf-source \
     pru-icss-source \
 "
=20
-UTILS_append_ti43x =3D " \
+UTILS:append:ti43x =3D " \
     pru-icss-source \
 "
=20
-UTILS_append_k3 =3D " \
+UTILS:append:k3 =3D " \
     ti-sci-fw-source \
     trusted-firmware-a-source \
 "
=20
-UTILS_append_j7-evm =3D " \
+UTILS:append:j7-evm =3D " \
     pru-icss-source \
 "
=20
-UTILS_append_j7-hs-evm =3D " \
+UTILS:append:j7-hs-evm =3D " \
     pru-icss-source \
 "
=20
-UTILS_append_am65xx =3D " \
+UTILS:append:am65xx =3D " \
     pru-icss-source \
 "
=20
-UTILS_append_am64xx =3D " \
+UTILS:append:am64xx =3D " \
     pru-icss-src \
 "
=20
 EXTRA_LIBS =3D ""
=20
-EXTRA_LIBS_append_omap-a15 =3D " \
+EXTRA_LIBS:append:omap-a15 =3D " \
     cmem-mod-source \
     uio-module-drv-source \
     big-data-ipc-demo-linux-source \
 "
=20
-#EXTRA_LIBS_append_dra7xx =3D " \
+#EXTRA_LIBS:append:dra7xx =3D " \
 #    debugss-module-drv-source \
 #    gdbserverproxy-module-drv-source \
 #"
=20
-EXTRA_LIBS_append_ti33x =3D " \
+EXTRA_LIBS:append:ti33x =3D " \
     uio-module-drv-source \
 "
=20
-EXTRA_LIBS_append_ti43x =3D " \
+EXTRA_LIBS:append:ti43x =3D " \
     cmem-mod-source \
     uio-module-drv-source \
 "
@@ -81,23 +81,23 @@ PDM_ANOMALY_PKG_SRC =3D "\
=20
 EXTRA_PACKAGES =3D ""
=20
-EXTRA_PACKAGES_append_omap-a15 =3D " \
+EXTRA_PACKAGES:append:omap-a15 =3D " \
     ${PDM_ANOMALY_PKG_SRC} \
 "
=20
-EXTRA_PACKAGES_append_ti33x =3D " \
+EXTRA_PACKAGES:append:ti33x =3D " \
     ${PDM_ANOMALY_PKG_SRC} \
 "
=20
-EXTRA_PACKAGES_append_ti43x =3D " \
+EXTRA_PACKAGES:append:ti43x =3D " \
     ${PDM_ANOMALY_PKG_SRC} \
 "
=20
-EXTRA_PACKAGES_append_am65xx =3D " \
+EXTRA_PACKAGES:append:am65xx =3D " \
     ${PDM_ANOMALY_PKG_SRC} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${UTILS} \
     ${EXTRA_LIBS} \
     ${EXTRA_PACKAGES} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 2e2801aa..43a043e1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -13,25 +13,25 @@ UTILS =3D " \
 	python3-numpy \
 "
=20
-UTILS_append_ti33x =3D " can-utils-dev"
-UTILS_append_ti43x =3D " can-utils-dev"
-UTILS_append_dra7xx =3D " can-utils-dev \
+UTILS:append:ti33x =3D " can-utils-dev"
+UTILS:append:ti43x =3D " can-utils-dev"
+UTILS:append:dra7xx =3D " can-utils-dev \
                         elfutils-dev \
                         elfutils-staticdev \
 "
-UTILS_append_k3 =3D "\
+UTILS:append:k3 =3D "\
 	can-utils-dev \
 	ti-rpmsg-char-dev \
 	ti-rpmsg-char-staticdev \
 "
=20
 EXTRA_LIBS =3D ""
-EXTRA_LIBS_append_ti43x =3D "\
+EXTRA_LIBS:append:ti43x =3D "\
     cmem-dev \
     cmem-staticdev \
 "
-EXTRA_LIBS_append_omap-a15 =3D " cmem-dev"
-EXTRA_LIBS_append_dra7xx =3D " libulm-dev \
+EXTRA_LIBS:append:omap-a15 =3D " cmem-dev"
+EXTRA_LIBS:append:dra7xx =3D " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
 "
@@ -42,25 +42,25 @@ PDM_ANOMALY_PKG_DEV =3D "\
=20
=20
 EXTRA_PACKAGES =3D ""
-EXTRA_PACKAGES_append_ti33x =3D " \
+EXTRA_PACKAGES:append:ti33x =3D " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 ${PDM_ANOMALY_PKG_DEV} \
 "
-EXTRA_PACKAGES_append_ti43x =3D " \
+EXTRA_PACKAGES:append:ti43x =3D " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 ${PDM_ANOMALY_PKG_DEV} \
 "
-EXTRA_PACKAGES_append_omap-a15 =3D " \
+EXTRA_PACKAGES:append:omap-a15 =3D " \
                                 arm-compute-library-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 ${PDM_ANOMALY_PKG_DEV} \
 "
-EXTRA_PACKAGES_append_am65xx =3D " arm-compute-library-dev \
+EXTRA_PACKAGES:append:am65xx =3D " arm-compute-library-dev \
                              tensorflow-lite-dev \
                              tensorflow-lite-staticdev \
                              ${PDM_ANOMALY_PKG_DEV} \
@@ -71,10 +71,10 @@ IPCDEV =3D " \
 	ti-ipc-staticdev \
 "
=20
-EXTRA_PACKAGES_append_omap-a15 =3D " ${IPCDEV}"
-EXTRA_PACKAGES_append_omapl138 =3D " ${IPCDEV}"
+EXTRA_PACKAGES:append:omap-a15 =3D " ${IPCDEV}"
+EXTRA_PACKAGES:append:omapl138 =3D " ${IPCDEV}"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${UTILS} \
     ${EXTRA_LIBS} \
     ${EXTRA_PACKAGES} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-addons.bb
index 4e88072a..1c8b9467 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
@@ -31,7 +31,7 @@ UTILS_DSP =3D " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'gdbc6x dsptop', '',=
 d)} \
 "
=20
-UTILS_append_ti33x =3D " mmc-utils \
+UTILS:append:ti33x =3D " mmc-utils \
                        switch-config \
                        pru-icss \
                        pru-swuart-fw \
@@ -39,7 +39,7 @@ UTILS_append_ti33x =3D " mmc-utils \
                        uio-test-pruss \
 "
=20
-UTILS_append_ti43x =3D " mmc-utils \
+UTILS:append:ti43x =3D " mmc-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
@@ -47,7 +47,7 @@ UTILS_append_ti43x =3D " mmc-utils \
                        uio-test-pruss \
 "
=20
-UTILS_append_omap-a15 =3D " mmc-utils \
+UTILS:append:omap-a15 =3D " mmc-utils \
                           switch-config \
                           libdrm-omap \
                           stream-openmp \
@@ -57,7 +57,7 @@ UTILS_append_omap-a15 =3D " mmc-utils \
                           uio-module-drv-test \
 "
=20
-UTILS_append_k3 =3D " mmc-utils \
+UTILS:append:k3 =3D " mmc-utils \
                     switch-config \
                     irqbalance \
                     ti-rpmsg-char \
@@ -65,31 +65,31 @@ UTILS_append_k3 =3D " mmc-utils \
                     statcol \
 "
=20
-UTILS_append_am64xx =3D " ti-rtos-firmware pru-icss"
-UTILS_append_am65xx =3D " ti-rtos-firmware pru-icss pru-pwm-fw"
-UTILS_append_j7 =3D " ti-rtos-firmware"
-UTILS_append_j7-evm =3D " pru-icss"
-UTILS_append_j7-hs-evm =3D " pru-icss"
+UTILS:append:am64xx =3D " ti-rtos-firmware pru-icss"
+UTILS:append:am65xx =3D " ti-rtos-firmware pru-icss pru-pwm-fw"
+UTILS:append:j7 =3D " ti-rtos-firmware"
+UTILS:append:j7-evm =3D " pru-icss"
+UTILS:append:j7-hs-evm =3D " pru-icss"
=20
-UTILS_append_omapl138 =3D " ti-ipc-rtos-fw"
+UTILS:append:omapl138 =3D " ti-ipc-rtos-fw"
=20
-UTILS_append_dra7xx =3D " \
+UTILS:append:dra7xx =3D " \
                         ${UTILS_DSP} \
                         ${@bb.utils.contains('MACHINE_FEATURES','gpu','g=
lsdk-example-apps','',d)} \
 "
=20
 EXTRA_LIBS =3D ""
-EXTRA_LIBS_append_omap-a15 =3D " \
+EXTRA_LIBS:append:omap-a15 =3D " \
     cmem \
     uio-module-drv \
 "
=20
-EXTRA_LIBS_append_ti43x =3D " \
+EXTRA_LIBS:append:ti43x =3D " \
     cmem \
     uio-module-drv \
 "
=20
-EXTRA_LIBS_append_ti33x =3D " \
+EXTRA_LIBS:append:ti33x =3D " \
     uio-module-drv \
 "
=20
@@ -100,29 +100,29 @@ EXTRA_PACKAGES =3D " \
     ccief-basic \
 "
=20
-EXTRA_PACKAGES_omapl138 =3D " \
+EXTRA_PACKAGES:omapl138 =3D " \
     protobuf \
 "
=20
-EXTRA_PACKAGES_append_omap-a15 =3D " ti-ipc-examples-linux"
-EXTRA_PACKAGES_append_omapl138 =3D " ti-ipc-examples-linux"
+EXTRA_PACKAGES:append:omap-a15 =3D " ti-ipc-examples-linux"
+EXTRA_PACKAGES:append:omapl138 =3D " ti-ipc-examples-linux"
=20
-EXTRA_PACKAGES_append_omap-a15 =3D " \
+EXTRA_PACKAGES:append:omap-a15 =3D " \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo-lin=
ux big-data-ipc-demo-linux-firmware','',d)} \
 "
=20
 # acontis-atemsys
-EXTRA_PACKAGES_append_am335x-evm =3D " pruss-lld-apps"
-EXTRA_PACKAGES_append_am437x-evm =3D " pruss-lld-apps"
+EXTRA_PACKAGES:append:am335x-evm =3D " pruss-lld-apps"
+EXTRA_PACKAGES:append:am437x-evm =3D " pruss-lld-apps"
 # acontis-atemsys
-EXTRA_PACKAGES_append_am57xx-evm =3D " pruss-lld-apps"
+EXTRA_PACKAGES:append:am57xx-evm =3D " pruss-lld-apps"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
     ${EXTRA_LIBS} \
 "
=20
-RDEPENDS_${PN}-extra =3D "\
+RDEPENDS:${PN}-extra =3D "\
     ${EXTRA_PACKAGES} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 82d69403..bd27f0f1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
@@ -13,14 +13,14 @@ UBOOT_SRC =3D "${PREFERRED_PROVIDER_virtual/bootloade=
r}-source"
 KERNEL_SRC =3D "${PREFERRED_PROVIDER_virtual/kernel}-source"
=20
 KERNEL_SHADOW_CLONE :=3D "${PREFERRED_PROVIDER_virtual/kernel}"
-KERNEL_SHADOW_CLONE_ENABLED :=3D "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHA=
DOW_CLONE}}"
+KERNEL_SHADOW_CLONE_ENABLED :=3D "${SRCIPK_SHALLOW_CLONE:pn-${KERNEL_SHA=
DOW_CLONE}}"
=20
 EXTRA_FILES =3D ""
-EXTRA_FILES_ti43x =3D "tisdk-uenv"
-EXTRA_FILES_omap-a15 =3D "tisdk-readme tisdk-uenv"
-EXTRA_FILES_k3 =3D "tisdk-readme tisdk-uenv"
+EXTRA_FILES:ti43x =3D "tisdk-uenv"
+EXTRA_FILES:omap-a15 =3D "tisdk-readme tisdk-uenv"
+EXTRA_FILES:k3 =3D "tisdk-readme tisdk-uenv"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ti-tisdk-setup \
     ${EXTRA_FILES} \
     ti-tisdk-makefile \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-tisdk-amsdk.bb
index c9a17c5e..4e913077 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk.bb
@@ -9,14 +9,14 @@ inherit packagegroup
 # Out of Box Experience (OOBE)
 OOBE =3D ""
=20
-OOBE_ti33x +=3D "\
+OOBE:ti33x +=3D "\
     parse-ip \
 "
=20
-OOBE_ti43x +=3D "\
+OOBE:ti43x +=3D "\
     parse-ip \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${OOBE} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/pac=
kagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index cdf6a623..7f5e9c2e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity-sdk-target.bb
@@ -12,16 +12,16 @@ BLUETOOTH_STACK =3D "\
=20
 CONNECTIVITY_RDEPENDS =3D ""
=20
-CONNECTIVITY_RDEPENDS_ti33x  =3D "\
+CONNECTIVITY_RDEPENDS:ti33x  =3D "\
     wpa-supplicant-dev \
     ${BLUETOOTH_STACK} \
 "
=20
-CONNECTIVITY_RDEPENDS_ti43x  =3D "\
+CONNECTIVITY_RDEPENDS:ti43x  =3D "\
     wpa-supplicant-dev \
     ${BLUETOOTH_STACK} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-connectivity.bb
index 50c4ea25..8798a44a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-connectivity.bb
@@ -65,6 +65,6 @@ CONNECTIVITY_RDEPENDS =3D " \
     ${BT_TI} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 2dca54e1..2dad8bd7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-host.bb
@@ -8,11 +8,11 @@ inherit packagegroup
=20
 CRYPTO_RDEPENDS =3D ""
=20
-CRYPTO_RDEPENDS_append_ti33x =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS_append_ti43x =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS_append_dra7xx =3D " cryptodev-module-source"
-CRYPTO_RDEPENDS_append_k3 =3D " cryptodev-module-source"
+CRYPTO_RDEPENDS:append:ti33x =3D " cryptodev-module-source"
+CRYPTO_RDEPENDS:append:ti43x =3D " cryptodev-module-source"
+CRYPTO_RDEPENDS:append:dra7xx =3D " cryptodev-module-source"
+CRYPTO_RDEPENDS:append:k3 =3D " cryptodev-module-source"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${CRYPTO_RDEPENDS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 7df60f9f..01b20759 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto-sdk-target.bb
@@ -7,11 +7,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit packagegroup
=20
 CRYPTO_API =3D ""
-CRYPTO_API_ti33x =3D "cryptodev-module-dev"
-CRYPTO_API_ti43x =3D "cryptodev-module-dev"
-CRYPTO_API_dra7xx =3D "cryptodev-module-dev"
+CRYPTO_API:ti33x =3D "cryptodev-module-dev"
+CRYPTO_API:ti43x =3D "cryptodev-module-dev"
+CRYPTO_API:dra7xx =3D "cryptodev-module-dev"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     openssl-dev \
     ${CRYPTO_API} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-crypto.bb
index c2e6e68b..f217f7d8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
@@ -14,10 +14,10 @@ CRYPTO_SUPPORT =3D "\
 "
=20
 #ti-crypto-examples
-CRYPTO_SUPPORT_append_ti33x =3D " cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_ti43x =3D " cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_dra7xx =3D " cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT:append:ti33x =3D " cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT:append:ti43x =3D " cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT:append:dra7xx =3D " cryptodev-module cryptodev-tests"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${CRYPTO_SUPPORT} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 683a9b6b..01ccd7d5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-host.bb
@@ -8,7 +8,7 @@ inherit packagegroup features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${PREFERRED_PROVIDER_virtual/gpudriver}-source \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-driver-s=
ource', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 0a2b8f64..093b2d3f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics-sdk-target.bb
@@ -8,7 +8,7 @@ inherit packagegroup features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     libegl-dev \
     libdrm-dev \
     wayland-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-graphics.bb
index 65b921cb..1d450600 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
@@ -14,11 +14,11 @@ GFX_WAYLAND =3D "\
 "
=20
 GFX_UTILS =3D ""
-GFX_UTILS_append_omap-a15  =3D "\
+GFX_UTILS:append:omap-a15  =3D "\
     glsdk-util-scripts \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     libegl \
     glmark2 \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', =
'', d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-gtk-sdk-target.bb
index f45d6424..0bf3530d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk-sdk-target.bb
@@ -8,6 +8,6 @@ inherit packagegroup features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     gtk+3-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-gtk.bb
index 0d281c9d..59b0461d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-gtk.bb
@@ -8,7 +8,7 @@ inherit packagegroup features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     gtk+3 \
     gtk+3-demo \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-hmi-sdk-host.bb
index e327551e..2cd7ae6b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi-sdk-host.bb
@@ -10,28 +10,28 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 HMI =3D ""
=20
-HMI_append_ti43x =3D " \
+HMI:append:ti43x =3D " \
     evse-hmi-source \
     mmwavegesture-hmi-source \
 "
=20
-HMI_append_ti33x =3D " \
+HMI:append:ti33x =3D " \
     evse-hmi-source \
     protection-relays-hmi-source \
     mmwavegesture-hmi-source \
 "
=20
=20
-HMI_append_omap-a15 =3D " \
+HMI:append:omap-a15 =3D " \
     evse-hmi-source \
     mmwavegesture-hmi-source \
 "
=20
-HMI_append_am65xx =3D " \
+HMI:append:am65xx =3D " \
     evse-hmi-source \
     mmwavegesture-hmi-source \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${HMI} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-hmi.bb
index 6958f08c..e16727c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-hmi.bb
@@ -12,27 +12,27 @@ HMI =3D " \
 "
=20
=20
-HMI_append_ti33x =3D " \
+HMI:append:ti33x =3D " \
     evse-hmi \
     protection-relays-hmi \
     mmwavegesture-hmi \
 "
=20
-HMI_append_ti43x =3D " \
+HMI:append:ti43x =3D " \
     evse-hmi \
     mmwavegesture-hmi \
 "
=20
-HMI_append_omap-a15 =3D " \
+HMI:append:omap-a15 =3D " \
     evse-hmi \
     mmwavegesture-hmi \
 "
=20
-HMI_append_am65xx =3D " \
+HMI:append:am65xx =3D " \
     evse-hmi \
     mmwavegesture-hmi \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
 	${HMI} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-matrix-sdk-host.bb
index 83ffdfc4..c32966bb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix-sdk-host.bb
@@ -11,7 +11,7 @@ MATRIX_GUI =3D " \
     refresh-screen-source \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     matrix-gui-source \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${MATRIX_GUI}",'',d)}=
 \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-matrix.bb
index 7e2db8be..361bd04b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
@@ -35,27 +35,27 @@ MATRIX_QT_APPS =3D " \
     matrix-gui-thermostat-demo \
 "
=20
-MATRIX_QT_APPS_append_omap-a15 =3D " \
+MATRIX_QT_APPS:append:omap-a15 =3D " \
     matrix-analytics-pdm-anomaly-detection \
     matrix-hmi-demo-evse            \
     matrix-hmi-demo-mmwavegesture   \
 "
=20
-MATRIX_QT_APPS_append_am65xx =3D " \
+MATRIX_QT_APPS:append:am65xx =3D " \
     matrix-analytics-pdm-anomaly-detection \
                                     \
     matrix-hmi-demo-evse            \
     matrix-hmi-demo-mmwavegesture   \
 "
=20
-MATRIX_QT_APPS_append_ti33x =3D " \
+MATRIX_QT_APPS:append:ti33x =3D " \
     matrix-analytics-pdm-anomaly-detection \
     matrix-hmi-demo-evse            \
     matrix-hmi-demo-protection-relays \
     matrix-hmi-demo-mmwavegesture   \
 "
=20
-MATRIX_QT_APPS_append_ti43x =3D " \
+MATRIX_QT_APPS:append:ti43x =3D " \
     matrix-analytics-pdm-anomaly-detection \
     matrix-gui-apps-dual-camera     \
     matrix-gui-apps-image-gallery   \
@@ -76,7 +76,7 @@ MATRIX_GPU_DEMOS =3D " \
     matrix-3d-demo-kmscube \
 "
=20
-MATRIX_GPU_DEMOS_append_omap-a15 =3D " \
+MATRIX_GPU_DEMOS:append:omap-a15 =3D " \
     matrix-3d-demo-kmscubevideo \
 "
=20
@@ -85,7 +85,7 @@ MATRIX_OPENCL_APPS =3D " \
     matrix-opencl-demo-vecadd        \
 "
=20
-MATRIX_OPENCL_APPS_append_dra7xx =3D " \
+MATRIX_OPENCL_APPS:append:dra7xx =3D " \
     matrix-video-analytics-opencv-opencl-opengl-demo \
     matrix-machinevision-demo-dlp3dscanner \
 "
@@ -99,14 +99,14 @@ MATRIX_OPENCV_OPENCL_APPS =3D " \
     matrix-machinevision-demo-barcoderoi-f2f \
 "
=20
-MATRIX_OPENCV_OPENCL_APPS_omap-a15 =3D " \
+MATRIX_OPENCV_OPENCL_APPS:omap-a15 =3D " \
      matrix-machinevision-demo-barcoderoi \
      matrix-machinevision-demo-simplepeopletracking \
 "
=20
 MATRIX_APPS =3D ""
=20
-MATRIX_APPS_append_ti33x =3D "        \
+MATRIX_APPS:append:ti33x =3D "        \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h264dec  \
@@ -123,7 +123,7 @@ MATRIX_APPS_append_ti33x =3D "        \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
=20
-MATRIX_APPS_append_ti43x =3D "        \
+MATRIX_APPS:append:ti43x =3D "        \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h264dec  \
@@ -138,7 +138,7 @@ MATRIX_APPS_append_ti43x =3D "        \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
=20
-MATRIX_APPS_append_omap-a15 =3D "     \
+MATRIX_APPS:append:omap-a15 =3D "     \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h265dec  \
@@ -159,7 +159,7 @@ MATRIX_APPS_append_omap-a15 =3D "     \
 #                                \
 #
=20
-MATRIX_APPS_append_am65xx =3D "           \
+MATRIX_APPS:append:am65xx =3D "           \
     matrix-multimedia-demo-aac      \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h264dec  \
@@ -169,7 +169,7 @@ MATRIX_APPS_append_am65xx =3D "           \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
=20
-MATRIX_APPS_append_dra7xx +=3D " \
+MATRIX_APPS:append:dra7xx =3D " \
     matrix-multimedia-demo-dsp66imgproc \
     matrix-tidl-demo-staticimg \
     matrix-tidl-demo-pnexamples \
@@ -183,7 +183,7 @@ MATRIX_APPS_append_dra7xx +=3D " \
     matrix-tidl-demo-dogbreeds \
 "
=20
-RDEPENDS_${PN} =3D "        \
+RDEPENDS:${PN} =3D "        \
     ${MATRIX_ESSENTIALS}  \
     ${MATRIX_APPS}        \
     ${MATRIX_COMMON_APPS} \
@@ -194,6 +194,6 @@ RDEPENDS_${PN} =3D "        \
     ${@['',"${MATRIX_OPENCL_APPS}"][oe.utils.all_distro_features(d, 'ope=
ncl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True,=
 False, d)]} \
 "
=20
-RDEPENDS_${PN}-extra =3D " \
+RDEPENDS:${PN}-extra =3D " \
     ${@['',"${MATRIX_OPENCV_OPENCL_APPS}"][oe.utils.all_distro_features(=
d, 'opencl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES'=
, 'dsp', True, False, d)]} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-host.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
index b0de90cb..3169fd0a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-host.bb
@@ -16,26 +16,26 @@ IMAGE_GALLERY_PKG =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'gpu','image-galle
=20
 MULTIMEDIA =3D ""
=20
-MULTIMEDIA_append_ti33x =3D " ${BARCODE_PKG}"
+MULTIMEDIA:append:ti33x =3D " ${BARCODE_PKG}"
=20
-MULTIMEDIA_append_ti43x =3D " \
+MULTIMEDIA:append:ti43x =3D " \
     ${DUAL_CAMERA_PKG} \
     ${IMAGE_GALLERY_PKG} \
     ${BARCODE_PKG} \
 "
=20
-MULTIMEDIA_append_omap-a15 =3D " \
+MULTIMEDIA:append:omap-a15 =3D " \
     ${DUAL_CAMERA_PKG} \
     ${IMAGE_GALLERY_PKG} \
     ${BARCODE_PKG} \
 "
=20
-MULTIMEDIA_append_am65xx =3D " ${BARCODE_PKG}"
+MULTIMEDIA:append:am65xx =3D " ${BARCODE_PKG}"
=20
-#MULTIMEDIA_append_dra7xx =3D " \
+#MULTIMEDIA:append:dra7xx =3D " \
 #    ${@['','qt-opencv-opencl-opengl-multithreaded-source'][oe.utils.all=
_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.con=
tains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${MULTIMEDIA} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packa=
gegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 24a313bc..62bcc0ea 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia-sdk-target.bb
@@ -14,17 +14,17 @@ BARCODE_PKG =3D ""
 MULTIMEDIA =3D ""
=20
 #    ${@['','qt-opencv-opencl-opengl-multithreaded-dev'][oe.utils.all_di=
stro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contai=
ns('MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
-MULTIMEDIA_append_dra7xx =3D " \
+MULTIMEDIA:append:dra7xx =3D " \
     hevc-arm-decoder-dev \
     hevc-arm-decoder-staticdev \
 "
=20
-MULTIMEDIA_append_ti33x =3D " ${BARCODE_PKG}"
-MULTIMEDIA_append_ti43x =3D " ${BARCODE_PKG}"
-MULTIMEDIA_append_omap-a15 =3D " ${BARCODE_PKG}"
-MULTIMEDIA_append_am65xx =3D " ${BARCODE_PKG}"
+MULTIMEDIA:append:ti33x =3D " ${BARCODE_PKG}"
+MULTIMEDIA:append:ti43x =3D " ${BARCODE_PKG}"
+MULTIMEDIA:append:omap-a15 =3D " ${BARCODE_PKG}"
+MULTIMEDIA:append:am65xx =3D " ${BARCODE_PKG}"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${MULTIMEDIA} \
     packagegroup-arago-gst-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/pa=
ckagegroup-arago-tisdk-multimedia.bb
index e1ae4d9e..9d6767b0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-multimedia.bb
@@ -10,37 +10,37 @@ MULTIMEDIA =3D " \
     amsdk-av-files \
 "
=20
-MULTIMEDIA_omapl138 =3D ""
+MULTIMEDIA:omapl138 =3D ""
=20
 DUAL_CAMERA_DEMO =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'd=
ual-camera-demo', '', d)}"
 IMAGE_GALLERY_DEMO =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', =
'image-gallery', '', d)}"
=20
-MULTIMEDIA_append_ti43x =3D " \
+MULTIMEDIA:append:ti43x =3D " \
     ${DUAL_CAMERA_DEMO} \
     ${IMAGE_GALLERY_DEMO} \
 "
=20
-MULTIMEDIA_append_omap-a15 =3D " \
+MULTIMEDIA:append:omap-a15 =3D " \
     ${DUAL_CAMERA_DEMO} \
     ${IMAGE_GALLERY_DEMO} \
 "
=20
-MULTIMEDIA_append_dra7xx =3D " \
+MULTIMEDIA:append:dra7xx =3D " \
     vis \
     hevc-arm-decoder \
 "
=20
-MULTIMEDIA_append_omap5-evm =3D " \
+MULTIMEDIA:append:omap5-evm =3D " \
     abefw \
 "
=20
 ACCEL_MM =3D ""
=20
-ACCEL_MM_append_omap-a15 =3D " \
+ACCEL_MM:append:omap-a15 =3D " \
     ipumm-fw \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', =
d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-tisdk-opencl-sdk-host.bb
index 1e6baa20..ee5bb610 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-host.bb
@@ -13,10 +13,10 @@ UTILS =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-examples-sou=
rce')} \
 "
=20
-UTILS_append_dra7xx =3D " \
+UTILS:append:dra7xx =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples-source=
')} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${UTILS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-opencl-sdk-target.bb
index 410bf47e..b660fcb4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl-sdk-target.bb
@@ -13,10 +13,10 @@ UTILS =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'openmpacc-dev')} \
 "
=20
-UTILS_append_dra7xx =3D " \
+UTILS:append:dra7xx =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-dev')} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${UTILS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-opencl.bb
index a36d794b..1aba3f7b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-opencl.bb
@@ -18,14 +18,14 @@ EXTRA_PKGS =3D " \
 "
=20
 #    ti-fftw-examples
-EXTRA_PKGS_append_dra7xx =3D " \
+EXTRA_PKGS:append:dra7xx =3D " \
     ${@oe.utils.all_distro_features(d, 'openmp', 'linalg-examples')} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${MAIN_PKGS} \
 "
=20
-RDEPENDS_${PN}-extra =3D "\
+RDEPENDS:${PN}-extra =3D "\
     ${EXTRA_PKGS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-qte-sdk-host.bb
index d3b55e85..538ec80a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte-sdk-host.bb
@@ -6,6 +6,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     qt-tstat-source \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-tisdk-qte.bb
index d1a9ae3c..60d6e63c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-qte.bb
@@ -9,7 +9,7 @@ inherit packagegroup features_check
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 #    qtdeclarative-examples
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     packagegroup-arago-qte \
     qtbase-examples \
     qtdeclarative-tools \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegro=
ups/packagegroup-arago-toolchain-tisdk-target.bb
index 4f8ebbc9..c64e1727 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-too=
lchain-tisdk-target.bb
@@ -15,9 +15,9 @@ TISDK_TOOLCHAIN_EXTRA_TARGET =3D "\
     packagegroup-arago-tisdk-connectivity-sdk-target \
     packagegroup-arago-tisdk-crypto-sdk-target \
 "
-TISDK_TOOLCHAIN_EXTRA_TARGET_omapl138 =3D ""
+TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 =3D ""
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-qt=
e-toolchain-target','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-ti=
sdk-gtk-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cr=
oss-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-cross-canadian.bbappend
index 9f59ac8c..46df17f9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-can=
adian.bbappend
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-can=
adian.bbappend
@@ -1,10 +1,10 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 SECONDARY_TARGET_ARCH ?=3D "invalid"
=20
 SECONDARY_TOOLCHAIN =3D "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
                        binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
=20
-RDEPENDS_${PN}_append =3D " \
+RDEPENDS:${PN}:append =3D " \
     ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', 'invalid', '', '${S=
ECONDARY_TOOLCHAIN}', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb=
 b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index 05c88613..e16e4d51 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -9,7 +9,7 @@ TENSORFLOW_DEMO =3D ""
 #TENSORFLOW_DEMO =3D " \
 #    ${@oe.utils.all_distro_features(d, 'opencv', 'tensorflow-lite-demo'=
, '')} \
 #"
-#TENSORFLOW_DEMO_dra7xx =3D " \
+#TENSORFLOW_DEMO:dra7xx =3D " \
 #    ${@['','tensorflow-lite-demo'][oe.utils.all_distro_features(d, 'ope=
ncl opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp'=
, True, False, d)]} \
 #"
=20
@@ -19,9 +19,9 @@ ANALYTICS =3D ""
 #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro=
_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('=
MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', Tru=
e, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d=
)]} \
 #"
-ANALYTICS_j7 =3D ""
-ANALYTICS_omapl138 =3D ""
+ANALYTICS:j7 =3D ""
+ANALYTICS:omapl138 =3D ""
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${ANALYTICS} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/m=
eta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 6141799f..3fbf4199 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -8,11 +8,11 @@ inherit packagegroup
 PDM_ANOMALY_PKG =3D "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pd=
m-anomaly-detection', '', d)}"
=20
 PDM_ANOMALY =3D ""
-PDM_ANOMALY_ti33x =3D "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY_ti43x =3D "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY_omap-a15 =3D "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY_am65xx =3D "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY:ti33x =3D "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY:ti43x =3D "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY:omap-a15 =3D "${PDM_ANOMALY_PKG}"
+PDM_ANOMALY:am65xx =3D "${PDM_ANOMALY_PKG}"
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${PDM_ANOMALY} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb b/=
meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
index 20abf172..ecae271f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
@@ -8,5 +8,5 @@ inherit packagegroup
=20
 PACKAGES +=3D "${PN}-runtime"
=20
-RDEPENDS_${PN} =3D "opencl"
-RDEPENDS_${PN}-runtime =3D "opencl-runtime"
+RDEPENDS:${PN} =3D "opencl"
+RDEPENDS:${PN}-runtime =3D "opencl-runtime"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 008b30ce..bd307220 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -40,11 +40,11 @@ ARAGO_TEST =3D "\
     stream \
 "
=20
-ARAGO_TEST_append_armv7a =3D " \
+ARAGO_TEST:append:armv7a =3D " \
     cpuburn-neon \
 "
=20
-ARAGO_TEST_append_armv7ve =3D " \
+ARAGO_TEST:append:armv7ve =3D " \
     cpuburn-neon \
 "
=20
@@ -57,18 +57,18 @@ ARAGO_TI_TEST =3D " \
     arm-benchmarks \
 "
=20
-ARAGO_TI_TEST_append_ti33x =3D " \
+ARAGO_TI_TEST:append:ti33x =3D " \
     omapconf \
 "
=20
-ARAGO_TI_TEST_append_ti43x =3D " \
+ARAGO_TI_TEST:append:ti43x =3D " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', =
d)} \
 "
=20
 NOT_MAINLINE_MMIP_DEPS =3D "${@bb.utils.contains('MACHINE_FEATURES', 'mm=
ip', 'omapdrmtest', '', d)}"
=20
-ARAGO_TI_TEST_append_omap-a15 =3D " \
+ARAGO_TI_TEST:append:omap-a15 =3D " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
@@ -77,21 +77,21 @@ ARAGO_TI_TEST_append_omap-a15 =3D " \
     ", d)} \
 "
=20
-ARAGO_TI_TEST_append_k3 =3D " \
+ARAGO_TI_TEST:append:k3 =3D " \
     k3conf \
 "
=20
-ARAGO_TI_TEST_append_j7 =3D " \
+ARAGO_TI_TEST:append:j7 =3D " \
     ufs-utils \
     viddec-test-app \
     videnc-test-app \
 "
=20
-ARAGO_TI_TEST_append_omapl138 =3D " \
+ARAGO_TI_TEST:append:omapl138 =3D " \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'ti-ipc-test'=
, d)} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/m=
eta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 440e9e63..323d88ae 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -5,13 +5,13 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-INSANE_SKIP_${PN} +=3D "dev-deps"
+INSANE_SKIP:${PN} +=3D "dev-deps"
=20
 CHROMIUM =3D ""
-CHROMIUM_append_omap-a15 =3D "\
+CHROMIUM:append:omap-a15 =3D "\
     chromium-ozone-wayland \
 "
-CHROMIUM_append_k3 =3D "\
+CHROMIUM:append:k3 =3D "\
     chromium-ozone-wayland \
 "
=20
@@ -38,7 +38,7 @@ OPENCL =3D " \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-ti=
sdk-opencl-extra','',d)} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend =
b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
index 147e3eae..652c71f3 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago4"
+PR:append =3D ".arago4"
=20
 #            file://0003-Updated-configurability.patch.patch
 SRC_URI +=3D "file://psplash-18bpp.patch                      \
@@ -10,6 +10,6 @@ SRC_URI +=3D "file://psplash-18bpp.patch               =
       \
             file://0001-psplash-Add-Arago-custom-color.patch\
 "
=20
-do_configure_prepend() {
+do_configure:prepend() {
     install -m 0644 ${WORKDIR}/psplash-bar-img.h ${S}/
 }
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/=
meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 39fe64d4..9e49ac69 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,12 +1,12 @@
-PR_append =3D ".arago6"
+PR:append =3D ".arago6"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PACKAGECONFIG_append =3D " networkd resolved"
-USERADD_PARAM_${PN} +=3D "--system -d / -M --shell /bin/nologin systemd-=
network;"
-USERADD_PARAM_${PN} +=3D "--system -d / -M --shell /bin/nologin systemd-=
resolve;"
+PACKAGECONFIG:append =3D " networkd resolved"
+USERADD_PARAM:${PN} +=3D "--system -d / -M --shell /bin/nologin systemd-=
network;"
+USERADD_PARAM:${PN} +=3D "--system -d / -M --shell /bin/nologin systemd-=
resolve;"
=20
-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
     file://local.rules \
     file://usb1-rules.sh \
     file://usb2-rules.sh \
@@ -17,7 +17,7 @@ SRC_URI_append =3D " \
     file://sync-clocks.service \
 "
=20
-do_install_append() {
+do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
     install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.=
d/
=20
diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend =
b/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
index 6936e376..6f65b42d 100644
--- a/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
+++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_%.bbappend
@@ -1,10 +1,10 @@
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
 PACKAGES =3D+ "${PN}-initramfs"
=20
-do_install_append() {
+do_install:append() {
 	[ ! -e ${D}/init ] && ln -s ${base_sbindir}/init ${D}/init
 }
=20
-FILES_${PN}-initramfs =3D "/init"
-RDEPENDS_${PN}-initramfs =3D "${PN}"
+FILES:${PN}-initramfs =3D "/init"
+RDEPENDS:${PN}-initramfs =3D "${PN}"
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb =
b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
index f128c737..56f1ba1a 100644
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
@@ -16,4 +16,4 @@ do_install() {
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIP=
T_NAME}
 }
=20
-FILES_${PN} =3D "${sysconfdir} ${bindir}"
+FILES:${PN} =3D "${sysconfdir} ${bindir}"
diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-=
arago-distro/recipes-core/udev/eudev_%.bbappend
index 7d0a496d..4817e840 100644
--- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
+++ b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
@@ -3,17 +3,17 @@
 # meta-arago switches to Dora
=20
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago5"
+PR:append =3D ".arago5"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
                   file://usb1-rules.sh \
                   file://usb2-rules.sh"
=20
-do_install_append() {
+do_install:append() {
     install -d ${D}/${bindir}
=20
     install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
diff --git a/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend b/=
meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
index a5f2d011..da36370f 100644
--- a/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
@@ -1,3 +1,3 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-FILES_${PN}-doc +=3D "${datadir}/cmake-${CMAKE_MAJOR_VERSION}/Help/"
+FILES:${PN}-doc +=3D "${datadir}/cmake-${CMAKE_MAJOR_VERSION}/Help/"
diff --git a/meta-arago-distro/recipes-devtools/perl/perl_%.bbappend b/me=
ta-arago-distro/recipes-devtools/perl/perl_%.bbappend
index abd7a55a..9af89cbc 100644
--- a/meta-arago-distro/recipes-devtools/perl/perl_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/perl/perl_%.bbappend
@@ -8,5 +8,5 @@ python() {
     if d.getVar('CLASSOVERRIDE') =3D=3D "class-nativesdk":
         pkgs =3D d.getVar("PACKAGES").split()
         for p in pkgs:
-            d.appendVar('INSANE_SKIP_%s' % (p), ' shebang-size')
+            d.appendVar('INSANE_SKIP:%s' % (p), ' shebang-size')
 }
diff --git a/meta-arago-distro/recipes-devtools/php/php_%.bbappend b/meta=
-arago-distro/recipes-devtools/php/php_%.bbappend
index 79b95dc7..7db1f1cb 100644
--- a/meta-arago-distro/recipes-devtools/php/php_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_%.bbappend
@@ -1,25 +1,25 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
-SRC_URI_append_virtclass-native =3D " file://0001-php-native-Fix-host-co=
ntamination-issue.patch"
+SRC_URI:append:virtclass-native =3D " file://0001-php-native-Fix-host-co=
ntamination-issue.patch"
=20
 # Work around to address the fact that php-fpm and php-cgi can not coexi=
st
 # php-cgi is used by Matrix and php-fpm is in beta for this version of p=
hp.
 # Once this issue is fix in meta-oe the below won't be needed.
 # Issue mentioned here: https://bugs.php.net/bug.php?id=3D60144
=20
-EXTRA_OECONF_remove =3D "--enable-fpm"
+EXTRA_OECONF:remove =3D "--enable-fpm"
=20
-PACKAGES_remove =3D "${PN}-fpm"
-PACKAGES_remove =3D "${PN}-fpm-apache2"
+PACKAGES:remove =3D "${PN}-fpm"
+PACKAGES:remove =3D "${PN}-fpm-apache2"
=20
-do_install_prepend_pn-php() {
+do_install:prepend:pn-php() {
     # Add the below file even though we aren't going to use it.
     # do_install will complain and fail if this file isn't found.
     mkdir -p ${B}/sapi/fpm/
     touch ${B}/sapi/fpm/init.d.php-fpm
 }
=20
-INSANE_SKIP_${PN} +=3D "installed-vs-shipped"
+INSANE_SKIP:${PN} +=3D "installed-vs-shipped"
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend b/=
meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
index 833d29ad..73d4013d 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 # Bump to 0.5.0+
 SRCREV =3D "e66966ef6a08cd3b491ee1df5c6c5d33baaf1f1c"
@@ -7,4 +7,4 @@ SRC_URI +=3D " \
 	file://0001-Return-non-zero-value-on-test-failure.patch \
 	file://0002-cpuidle-Avoid-relative-paths.patch"
=20
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
diff --git a/meta-arago-distro/recipes-devtools/python/python3_%.bbappend=
 b/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
index 3e5bb4c9..2afb2b37 100644
--- a/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
@@ -8,5 +8,5 @@ python() {
     if d.getVar('CLASSOVERRIDE') =3D=3D "class-nativesdk":
         pkgs =3D d.getVar("PACKAGES").split()
         for p in pkgs:
-            d.appendVar('INSANE_SKIP_%s' % (p), ' shebang-size')
+            d.appendVar('INSANE_SKIP:%s' % (p), ' shebang-size')
 }
diff --git a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend b/me=
ta-arago-distro/recipes-extended/bash/bash_%.bbappend
index 01e4c851..c837e5e3 100644
--- a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
+++ b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
@@ -1,3 +1,3 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 EXTRA_OECONF +=3D " --disable-command-timing"
diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%=
.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.=
bbappend
index b8f981c2..62999d2a 100644
--- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappe=
nd
+++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappe=
nd
@@ -1,6 +1,6 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
-do_install_append () {
+do_install:append () {
     # Allow telnet sessions to login as root
     securetty_file=3D${D}${sysconfdir}/securetty
=20
diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/=
meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
index 6076f370..1de9aebb 100644
--- a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
@@ -1,3 +1,3 @@
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
-PACKAGECONFIG_append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu=
', 'egl glesv2', '', d)}"
+PACKAGECONFIG:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu=
', 'egl glesv2', '', d)}"
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/m=
eta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
index 99d2fa71..85152b5f 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 SRC_URI +=3D " \
 file://0001-Add-option-to-run-a-test-indefinitely.patch \
@@ -8,10 +8,10 @@ file://0001-libsync-add-support-for-pre-v4.7-kernels.pa=
tch \
 file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
 "
=20
-PR_append =3D ".arago3"
+PR:append =3D ".arago3"
=20
 inherit update-alternatives
=20
 ALTERNATIVE_PRIORITY =3D "10"
-ALTERNATIVE_${PN} =3D "kmstest"
+ALTERNATIVE:${PN} =3D "kmstest"
 ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbapp=
end b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
index f99ac3c7..6018cca8 100644
--- a/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/freetype/freetype_%.bbappend
@@ -1,3 +1,3 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 LICENSE =3D "GPLv2+"
diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappen=
d b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
index 2d43a6b0..df1ca872 100644
--- a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}:"
=20
 SRCREV =3D "76bb57d539cb43d267e561024c34e031bf351e04"
=20
@@ -8,4 +8,4 @@ file://0001-meson-check-for-gles3-support.patch \
=20
 CFLAGS +=3D "-fcommon"
=20
-PR_append =3D ".arago2"
+PR:append =3D ".arago2"
diff --git a/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend b/=
meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
index f9aec68f..74450a2a 100644
--- a/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/tslib/tslib_%.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-exten=
sion_2.2.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-ex=
tension_2.2.0.bb
index cd330f51..4626345e 100644
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.=
2.0.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.=
2.0.bb
@@ -21,14 +21,14 @@ inherit cmake
=20
 EXTRA_OECMAKE :=3D "-DWITH_ILM_INPUT=3D1"
=20
-FILES_${PN} +=3D "${datadir}/wayland-protocols/stable/ivi-application/iv=
i-application.xml"
-FILES_${PN} +=3D "${libdir}/weston/*"
-FILES_${PN}-dbg +=3D "${libdir}/weston/.debug/*"
+FILES:${PN} +=3D "${datadir}/wayland-protocols/stable/ivi-application/iv=
i-application.xml"
+FILES:${PN} +=3D "${libdir}/weston/*"
+FILES:${PN}-dbg +=3D "${libdir}/weston/.debug/*"
=20
 EXTRA_OECMAKE +=3D "-DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib',=
 '')}"
=20
 PR =3D "r1"
=20
 # Need these temporarily to prevent a non-fatal do_package_qa issue
-INSANE_SKIP_${PN} +=3D "dev-deps"
-INSANE_SKIP_${PN}-dev +=3D "dev-elf dev-so"
+INSANE_SKIP:${PN} +=3D "dev-deps"
+INSANE_SKIP:${PN}-dev +=3D "dev-elf dev-so"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbapp=
end b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 55b191ef..15835c8f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,14 +1,14 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago10"
+PR:append =3D ".arago10"
=20
-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
     file://runWeston \
     file://wayland_env.sh \
     file://weston.ini \
 "
=20
-do_install_append() {
+do_install:append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
=20
@@ -17,4 +17,4 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.=
d/
 }
=20
-FILES_${PN} +=3D "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
+FILES:${PN} +=3D "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbap=
pend b/meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend
index 006579bd..804507e3 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_9.0.0.bbappend
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago3"
+PR:append =3D ".arago3"
=20
 #        file://0002-weston-Allow-visual_id-to-be-0.patch
 SRC_URI +=3D " \
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_=
%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_=
%.bbappend
index f8a35cd7..74688f1c 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbapp=
end
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbapp=
end
@@ -1,3 +1,3 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 KERNEL_MODULE_AUTOLOAD +=3D "cryptodev"
diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappen=
d b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
index e66dcda1..88786124 100644
--- a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
@@ -1,7 +1,7 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago2"
+PR:append =3D ".arago2"
=20
-do_install_append() {
+do_install:append() {
 	chmod -x ${D}${sysconfdir}/init.d/kdump
 }
diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmwa=
re_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-fir=
mware_%.bbappend
index 3472f267..8742c7bf 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bb=
append
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bb=
append
@@ -1,17 +1,17 @@
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
 PACKAGES =3D+ "${PN}-iwlwifi-9260"
 PACKAGES =3D+ "${PN}-ibt-18"
=20
-LICENSE_${PN}-iwlwifi-9260 =3D "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-ibt-18 =3D "Firmware-ibt_firmware"
+LICENSE:${PN}-iwlwifi-9260 =3D "Firmware-iwlwifi_firmware"
+LICENSE:${PN}-ibt-18 =3D "Firmware-ibt_firmware"
=20
-FILES_${PN}-iwlwifi-9260 =3D "${nonarch_base_libdir}/firmware/iwlwifi-92=
60-*.ucode"
-FILES_${PN}-ibt-18 =3D "${nonarch_base_libdir}/firmware/intel/ibt-18-*.s=
fi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
+FILES:${PN}-iwlwifi-9260 =3D "${nonarch_base_libdir}/firmware/iwlwifi-92=
60-*.ucode"
+FILES:${PN}-ibt-18 =3D "${nonarch_base_libdir}/firmware/intel/ibt-18-*.s=
fi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
=20
-RDEPENDS_${PN}-iwlwifi-9260 +=3D "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-ibt-18 +=3D "${PN}-ibt-license"
+RDEPENDS:${PN}-iwlwifi-9260 +=3D "${PN}-iwlwifi-license"
+RDEPENDS:${PN}-ibt-18 +=3D "${PN}-ibt-license"
=20
-do_install_append() {
+do_install:append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
 }
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-li=
bc-headers_5.10.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/=
linux-libc-headers_5.10.bb
index 7f4343d7..4cd0ee1b 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-head=
ers_5.10.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-head=
ers_5.10.bb
@@ -1,6 +1,6 @@
 require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
=20
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
=20
diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/=
meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
index 10ecf8ea..4347a88a 100644
--- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
+++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
@@ -3,9 +3,9 @@ CONFIG_NAME ?=3D "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_=
defconfig"
 # Copy the configuration file used during the SDK build in Arago to
 # the kernel sources to be packaged into the sourceipk.  Then call
 # the function to build the sourceipk again.  This is done as a
-# do_compile_prepend so that we can pick up any changes to the
+# do_compile:prepend so that we can pick up any changes to the
 # defconfig thay may have been done by the sanitizer code.
-do_configure_append() {
+do_configure:append() {
     cp ${B}/.config ${S}/arch/${ARCH}/configs/${CONFIG_NAME}
=20
     # Remove defconfig generated by defconfig_builder to avoid confusion=
. This
diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc b/meta-ara=
go-distro/recipes-kernel/linux/docker.inc
index 51eaf8d7..e926b219 100644
--- a/meta-arago-distro/recipes-kernel/linux/docker.inc
+++ b/meta-arago-distro/recipes-kernel/linux/docker.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
 SRC_URI +=3D "file://docker.cfg"
 KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/docker.cfg"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%=
.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.=
bbappend
index 165e86f3..402362c2 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
@@ -1,8 +1,8 @@
-MACHINE_KERNEL_PR_append =3D ".arago1"
+MACHINE_KERNEL_PR:append =3D ".arago1"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 require copy-defconfig.inc
 require docker.inc
=20
-ALLOW_EMPTY_kernel-devicetree =3D "1"
+ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-syst=
est_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-=
systest_%.bbappend
index 165e86f3..402362c2 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
@@ -1,8 +1,8 @@
-MACHINE_KERNEL_PR_append =3D ".arago1"
+MACHINE_KERNEL_PR:append =3D ".arago1"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 require copy-defconfig.inc
 require docker.inc
=20
-ALLOW_EMPTY_kernel-devicetree =3D "1"
+ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bb=
append b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappe=
nd
index 31940e3f..f4fac19a 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
@@ -1,8 +1,8 @@
-MACHINE_KERNEL_PR_append =3D ".arago5"
+MACHINE_KERNEL_PR:append =3D ".arago5"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 require copy-defconfig.inc
 require docker.inc
=20
-ALLOW_EMPTY_kernel-devicetree =3D "1"
+ALLOW_EMPTY:kernel-devicetree =3D "1"
diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappen=
d b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
index 8284e9dd..d2f22d8e 100644
--- a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
+++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
-PACKAGECONFIG_remove =3D "x264"
+PACKAGECONFIG:remove =3D "x264"
 LICENSE_FLAGS =3D ""
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-%.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-%.bbappend
index 5f6374af..4a4986c3 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-%.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-%.bbappend
@@ -1,6 +1,6 @@
 # Remove all GFX PACKAGECONFIGs for platforms w/o GPU
-PACKAGECONFIG_remove =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu',=
'','x11 wayland gl egl gles2 qt5',d)}"
+PACKAGECONFIG:remove =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu',=
'','x11 wayland gl egl gles2 qt5',d)}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-PR_append =3D ".0"
+PR:append =3D ".0"
diff --git a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend=
 b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
index 2e0e4580..1bdc0802 100644
--- a/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
+++ b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 # Remove xz/lzma support to avoid pulling in additional GPLv3 licenses
-PACKAGECONFIG_remove =3D "lzma"
+PACKAGECONFIG:remove =3D "lzma"
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbap=
pend b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend
index 3772f116..32cbe416 100644
--- a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend
+++ b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend
@@ -1,8 +1,8 @@
-PR_append =3D ".arago7"
+PR:append =3D ".arago7"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:${THISDIR}/files:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:${THISDIR}/files:"
=20
-SRC_URI_append =3D " \
+SRC_URI:append =3D " \
     file://0001-IEC-62439-3-add-initial-support-for-hsr-prp-mib-supp.pat=
ch \
     file://0002-IEC-62439-3-add-a-dummy-lreInterfaceConfigTable-for-.pat=
ch \
     file://0003-IEC-62439-3-MIB-update-lreInterfaceConfigTable-for-M.pat=
ch \
@@ -26,6 +26,6 @@ SRC_URI_append =3D " \
 PACKAGECONFIG[iec-62439-3-mib] =3D "--with-mib-modules=3Diec-62439-3-mib=
,,,"
 PACKAGECONFIG +=3D "iec-62439-3-mib"
=20
-RDEPENDS_${PN}-client +=3D "perl-module-getopt-std \
+RDEPENDS:${PN}-client +=3D "perl-module-getopt-std \
                           perl-module-term-readline \
 "
diff --git a/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbapp=
end b/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
index 3b7e80f6..1f61a3b8 100644
--- a/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
+++ b/meta-arago-distro/recipes-qt/examples/qtwebbrowser_1.0.bbappend
@@ -1,7 +1,7 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 SRC_URI +=3D " \
     file://0001-qtwebbrowser-disable-FullScreen-mode.patch \
 "
=20
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-a=
rago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
index 5c2974e1..63894c47 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
@@ -17,4 +17,4 @@ do_install () {
     install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
 }
=20
-FILES_${PN} +=3D "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
+FILES:${PN} +=3D "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-ar=
ago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 21dc4f88..8ae8110b 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,10 +1,10 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 GLES_EXTRA_DEPS =3D "libdrm wayland"
=20
 PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/e=
gl ${GLES_EXTRA_DEPS}"
=20
-PR_append =3D ".arago17"
+PR:append =3D ".arago17"
=20
 QT_CONFIG_FLAGS +=3D "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayl=
and', 'wayland', 'eglfs', d)}"
=20
@@ -23,7 +23,7 @@ SRC_URI +=3D "\
     file://0001-eglfs-Force-888-format-only-on-env-flag.patch \
 "
=20
-python do_patch_append() {
+python do_patch:append() {
     import shutil
=20
     work_dir =3D d.getVar("WORKDIR")
@@ -34,13 +34,13 @@ python do_patch_append() {
 }
=20
 # Add symbolic link qt5/examples for backward compatibility
-do_install_append () {
+do_install:append () {
=20
     install -d ${D}${datadir}/qt5
     ln -sf ../examples ${D}${datadir}/qt5/examples
 }
=20
-FILES_${PN}-examples +=3D  "${datadir}/qt5/*"
+FILES:${PN}-examples +=3D  "${datadir}/qt5/*"
=20
=20
-RDEPENDS_${PN} +=3D "${PN}-conf"
+RDEPENDS:${PN} +=3D "${PN}-conf"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend =
b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
index e1408c71..4167ac43 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
@@ -1,7 +1,7 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
-PR_append =3D ".tisdk1"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+PR:append =3D ".tisdk1"
=20
-CXXFLAGS_append_omap-a15 =3D " -DQ_OS_BLACKBERRY"
+CXXFLAGS:append:omap-a15 =3D " -DQ_OS_BLACKBERRY"
=20
=20
 SRC_URI +=3D " \
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/me=
ta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index c602813c..23a2f907 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,5 +1,5 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
-PR_append =3D ".arago2"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+PR:append =3D ".arago2"
=20
 SRC_URI +=3D " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.pat=
ch \
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/=
meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index 6459bbf7..60f6678f 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
-PR_append =3D ".arago1"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+PR:append =3D ".arago1"
=20
 DEPENDS +=3D "bison-native"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-=
arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 1dbe40d1..22d2dc70 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 #	file://GraphicsSurfaceToken.h.patch
 #	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
@@ -9,10 +9,10 @@ SRC_URI +=3D " \
 	file://0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch =
\
 "
=20
-PR_append =3D ".arago8"
+PR:append =3D ".arago8"
=20
-EXTRA_OECMAKE_append =3D " -DCMAKE_BUILD_TYPE=3DRelease"
+EXTRA_OECMAKE:append =3D " -DCMAKE_BUILD_TYPE=3DRelease"
=20
-EXTRA_OECMAKE_append_k3 =3D " -DUSE_SYSTEM_MALLOC=3DON"
+EXTRA_OECMAKE:append:k3 =3D " -DUSE_SYSTEM_MALLOC=3DON"
=20
 DEPENDS +=3D "flex-native bison-native"
diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b=
/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
index 456982c7..7928a810 100644
--- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
+++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
 # version of gettext.
diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend=
 b/meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend
index db716ccf..523335c4 100644
--- a/meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend
+++ b/meta-arago-distro/recipes-support/libnl/libnl_3.5.0.bbappend
@@ -1,6 +1,6 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
-do_install_append() {
+do_install:append() {
 #   Install private files to allow libnl extensions
     install -d ${D}${includedir}/netlink-private
     cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/net=
link-private/
diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbap=
pend b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
index 2a7810f7..975e2535 100644
--- a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
+++ b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
@@ -1,10 +1,10 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 SRC_URI +=3D "file://rngd.rules"
=20
-do_install_append() {
+do_install:append() {
 	# remove duplicate initscript
 	rm -f ${D}${sysconfdir}/init.d/rng-tools
=20
diff --git a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bb=
append b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappe=
nd
index c3d4b573..0af8c9c2 100644
--- a/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
+++ b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
@@ -1,5 +1,5 @@
-PR_append =3D ".arago4"
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+PR:append =3D ".arago4"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
 PACKAGECONFIG =3D "charon curl openssl stroke sqlite3 \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
@@ -12,6 +12,6 @@ EXTRA_OECONF +=3D " \
=20
 SRC_URI +=3D "file://pkcs11_plugin.conf"
=20
-do_install_append () {
+do_install:append () {
 	install -m 0644 ${WORKDIR}/pkcs11_plugin.conf ${D}${sysconfdir}/strongs=
wan.d/
 }
diff --git a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbap=
pend b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
index 931a1d98..6c6a8ff0 100644
--- a/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
+++ b/meta-arago-distro/recipes-support/syslog-ng/syslog-ng_%.bbappend
@@ -1,2 +1,2 @@
-PR_append =3D ".arago0"
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+PR:append =3D ".arago0"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
diff --git a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rto=
s_git.bbappend b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples=
-rtos_git.bbappend
index 831aba04..a0e3d084 100644
--- a/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.b=
bappend
+++ b/meta-arago-distro/recipes-tisdk/ocl-rtos/opencl-examples-rtos_git.b=
bappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
 CM_NAME =3D "OpenCL"
 CM_VERSION =3D "${PV}"
diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-=
arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
index ac03ea43..85cf2554 100644
--- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
+++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
@@ -21,4 +21,4 @@ do_install() {
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
 }
=20
-FILES_${PN} =3D "${sysconfdir}"
+FILES:${PN} =3D "${sysconfdir}"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile_1.0.bb
index 6937ced1..c8b19d58 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
@@ -61,8 +61,8 @@ MAKEFILES_MATRIX_GUI =3D "matrix-gui-browser \
                         qt-tstat \
 "
=20
-MAKEFILES_MATRIX_GUI_omapl138 =3D ""
-MAKEFILES_MATRIX_GUI_j7 =3D ""
+MAKEFILES_MATRIX_GUI:omapl138 =3D ""
+MAKEFILES_MATRIX_GUI:j7 =3D ""
=20
 MAKEFILES_COMMON =3D "linux \
                     matrix-gui \
@@ -75,7 +75,7 @@ MAKEFILES =3D ""
=20
 # Add device specific make targets
=20
-MAKEFILES_append_ti33x =3D " u-boot-spl \
+MAKEFILES:append:ti33x =3D " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
@@ -85,7 +85,7 @@ MAKEFILES_append_ti33x =3D " u-boot-spl \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
 "
-MAKEFILES_append_ti43x =3D " u-boot-spl \
+MAKEFILES:append:ti43x =3D " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
@@ -101,7 +101,7 @@ MAKEFILES_append_ti43x =3D " u-boot-spl \
=20
 #                            debugss-module-drv=20
 #                            gdbserverproxy-module-drv=20
-MAKEFILES_append_dra7xx =3D " cryptodev \
+MAKEFILES:append:dra7xx =3D " cryptodev \
                             opencl-examples \
                             openmpacc-examples \
                             qt-opencv-opencl-opengl-multithreaded \
@@ -109,7 +109,7 @@ MAKEFILES_append_dra7xx =3D " cryptodev \
                             tiovx-app-host \
 "
=20
-MAKEFILES_append_omap-a15 =3D " u-boot-spl \
+MAKEFILES:append:omap-a15 =3D " u-boot-spl \
                               omapconf \
                               linux-dtbs \
                               ti-sgx-ddk-km \
@@ -122,19 +122,19 @@ MAKEFILES_append_omap-a15 =3D " u-boot-spl \
                               pdm-anomaly-detection \
                               ti-ipc \
 "
-MAKEFILES_append_omapl138 =3D " linux-dtbs \
+MAKEFILES:append:omapl138 =3D " linux-dtbs \
                               u-boot-spl \
                               ti-ipc \
 "
=20
-MAKEFILES_append_k3 =3D " u-boot-spl \
+MAKEFILES:append:k3 =3D " u-boot-spl \
                         linux-dtbs \
                         cryptodev \
                         sysfw-image \
                         ti-ipc \
 "
=20
-MAKEFILES_append_am65xx =3D " \
+MAKEFILES:append:am65xx =3D " \
                         pru-icss \
                         ti-sgx-ddk-km \
                         barcode-roi \
@@ -142,10 +142,10 @@ MAKEFILES_append_am65xx =3D " \
                         pdm-anomaly-detection \
 "
=20
-MAKEFILES_append_j7 =3D " pru-icss \
+MAKEFILES:append:j7 =3D " pru-icss \
                             ti-img-rogue-driver \
 "
-MAKEFILES_append_am64xx =3D " \
+MAKEFILES:append:am64xx =3D " \
                         pru-icss \
 "
=20
@@ -157,32 +157,32 @@ inherit kernel-arch
=20
 # Use ARCH format expected by the makefile
 PLATFORM_ARCH =3D "${ARMPKGARCH}"
-PLATFORM_ARCH_arm =3D "armv7-a"
-PLATFORM_ARCH_omapl138 =3D "armv5te"
+PLATFORM_ARCH:arm =3D "armv7-a"
+PLATFORM_ARCH:omapl138 =3D "armv5te"
=20
 # ti-sgx-ddk-km configurations
 # See meta-ti/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
 TI_SGX_TARGET_PRODUCT =3D "jacinto6evm"
-TI_SGX_TARGET_PRODUCT_ti33x =3D "ti335x"
-TI_SGX_TARGET_PRODUCT_ti43x =3D "ti437x"
-TI_SGX_TARGET_PRODUCT_k3 =3D "ti654x"
+TI_SGX_TARGET_PRODUCT:ti33x =3D "ti335x"
+TI_SGX_TARGET_PRODUCT:ti43x =3D "ti437x"
+TI_SGX_TARGET_PRODUCT:k3 =3D "ti654x"
=20
 TI_SGX_TARGET_ARCH =3D "armhf"
-TI_SGX_TARGET_ARCH_k3 =3D "aarch64"
+TI_SGX_TARGET_ARCH:k3 =3D "aarch64"
=20
 PLATFORM_DEBUGSS =3D ""
-PLATFORM_DEBUGSS_dra7xx =3D "DRA7xx_PLATFORM"
+PLATFORM_DEBUGSS:dra7xx =3D "DRA7xx_PLATFORM"
=20
 PLATFORM_GDBSERVERPROXY =3D ""
-PLATFORM_GDBSERVERPROXY_dra7xx =3D "DRA7xx_PLATFORM"
+PLATFORM_GDBSERVERPROXY:dra7xx =3D "DRA7xx_PLATFORM"
=20
 PRU_ICSS_INSTALL_TARGET =3D "pru-icss_install_none"
-PRU_ICSS_INSTALL_TARGET_ti33x =3D "pru-icss_install_am335x"
-PRU_ICSS_INSTALL_TARGET_ti43x =3D "pru-icss_install_am437x"
-PRU_ICSS_INSTALL_TARGET_omap-a15 =3D "pru-icss_install_am572x"
-PRU_ICSS_INSTALL_TARGET_am65xx =3D "pru-icss_install_am65x"
-PRU_ICSS_INSTALL_TARGET_j7 =3D "pru-icss_install_j721e"
-PRU_ICSS_INSTALL_TARGET_am64xx =3D "pru-icss_install_am64x"
+PRU_ICSS_INSTALL_TARGET:ti33x =3D "pru-icss_install_am335x"
+PRU_ICSS_INSTALL_TARGET:ti43x =3D "pru-icss_install_am437x"
+PRU_ICSS_INSTALL_TARGET:omap-a15 =3D "pru-icss_install_am572x"
+PRU_ICSS_INSTALL_TARGET:am65xx =3D "pru-icss_install_am65x"
+PRU_ICSS_INSTALL_TARGET:j7 =3D "pru-icss_install_j721e"
+PRU_ICSS_INSTALL_TARGET:am64xx =3D "pru-icss_install_am64x"
=20
 # Path to toolchains for the various cores in TI SOCs
 #
@@ -194,9 +194,9 @@ IPC_TOOLS_PATHS_R5F  =3D "ti.targets.arm.elf.R5F=3D"\=
$\(TOOLCHAIN_PATH_R5\)""
 IPC_TOOLS_PATHS_C674 =3D "ti.targets.elf.C674=3D"\$\(C6X_GEN_INSTALL_PAT=
H\)""
=20
 IPC_TOOLS_PATHS =3D ""
-IPC_TOOLS_PATHS_append_omap-a15 =3D " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS=
_PATHS_M4}"
-IPC_TOOLS_PATHS_append_omapl138 =3D " ${IPC_TOOLS_PATHS_C674}"
-IPC_TOOLS_PATHS_append_k3 =3D "${IPC_TOOLS_PATHS_R5F}"
+IPC_TOOLS_PATHS:append:omap-a15 =3D " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS=
_PATHS_M4}"
+IPC_TOOLS_PATHS:append:omapl138 =3D " ${IPC_TOOLS_PATHS_C674}"
+IPC_TOOLS_PATHS:append:k3 =3D "${IPC_TOOLS_PATHS_R5F}"
=20
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?=3D "0"
@@ -298,12 +298,12 @@ do_install () {
 }
=20
 K3_UBOOT_MACHINE_R5 =3D ""
-K3_UBOOT_MACHINE_R5_am65xx-evm =3D "am65x_evm_r5_defconfig"
-K3_UBOOT_MACHINE_R5_am65xx-hs-evm =3D "am65x_hs_evm_r5_defconfig"
-K3_UBOOT_MACHINE_R5_j7-evm =3D "j721e_evm_r5_config"
-K3_UBOOT_MACHINE_R5_j7-hs-evm =3D "j721e_hs_evm_r5_config"
+K3_UBOOT_MACHINE_R5:am65xx-evm =3D "am65x_evm_r5_defconfig"
+K3_UBOOT_MACHINE_R5:am65xx-hs-evm =3D "am65x_hs_evm_r5_defconfig"
+K3_UBOOT_MACHINE_R5:j7-evm =3D "j721e_evm_r5_config"
+K3_UBOOT_MACHINE_R5:j7-hs-evm =3D "j721e_hs_evm_r5_config"
=20
-do_install_append_k3() {
+do_install:append:k3() {
     cat >> ${D}/Rules.make << __EOF__
=20
 # Add CROSS_COMPILE and UBOOT_MACHINE for the R5
@@ -314,4 +314,4 @@ __EOF__
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-FILES_${PN} =3D "/*"
+FILES:${PN} =3D "/*"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setu=
p.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 5f7d9f15..a8b524ed 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -25,12 +25,12 @@ SETUP_SCRIPTS =3D " common.sh \
                   ${SDCARD_SCRIPT} \
 "
=20
-UBOOT_ENV_omapl138 =3D "setup-uboot-env-am18x.sh"
-UBOOT_ENV_ti33x =3D "setup-uboot-env-am335x.sh"
-UBOOT_ENV_ti43x =3D "setup-uboot-env-am43x.sh"
-UBOOT_ENV_omap5-evm =3D "setup-uboot-env-omap5.sh"
-UBOOT_ENV_am57xx-evm =3D "setup-uboot-env-am57xx-evm.sh"
-UBOOT_ENV_k3 =3D "setup-uboot-env-am65x.sh"
+UBOOT_ENV:omapl138 =3D "setup-uboot-env-am18x.sh"
+UBOOT_ENV:ti33x =3D "setup-uboot-env-am335x.sh"
+UBOOT_ENV:ti43x =3D "setup-uboot-env-am43x.sh"
+UBOOT_ENV:omap5-evm =3D "setup-uboot-env-omap5.sh"
+UBOOT_ENV:am57xx-evm =3D "setup-uboot-env-am57xx-evm.sh"
+UBOOT_ENV:k3 =3D "setup-uboot-env-am65x.sh"
 UBOOT_ENV =3D "setup-uboot-unknown.sh"
=20
 do_install () {
@@ -55,5 +55,5 @@ do_install () {
     fi
 }
=20
-FILES_${PN} +=3D "setup.sh"
-RDEPENDS_${PN} +=3D "bash"
+FILES:${PN} +=3D "setup.sh"
+RDEPENDS:${PN} +=3D "bash"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_=
1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.=
bb
index e4188137..da8ecce0 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
@@ -12,4 +12,4 @@ do_install () {
=20
 }
=20
-FILES_${PN} =3D "/*"
+FILES:${PN} =3D "/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb=
 b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
index 6fdcaff3..59df0c97 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
@@ -19,4 +19,4 @@ do_install () {
     install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
 }
=20
-FILES_${PN} +=3D "board-support/*"
+FILES:${PN} +=3D "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/m=
eta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 442e0673..76c83e7d 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -19,7 +19,7 @@ do_install () {
     install -m 0644 ${S}/uEnv.txt ${D}/board-support/prebuilt-images/
 }
=20
-FILES_${PN} +=3D "board-support/*"
+FILES:${PN} +=3D "board-support/*"
=20
 # deploy files for wic image
 inherit deploy
diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unsha=
llow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repo=
sitories/unshallow-repositories_1.0.bb
index d75fb4b4..c6ed07ab 100644
--- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-re=
positories_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-re=
positories_1.0.bb
@@ -12,5 +12,5 @@ do_install () {
     install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
 }
=20
-FILES_${PN} =3D "/*"
-RDEPENDS_${PN} +=3D "bash"
+FILES:${PN} =3D "/*"
+RDEPENDS:${PN} +=3D "bash"
diff --git a/meta-arago-extras/classes/qt5.bbclass b/meta-arago-extras/cl=
asses/qt5.bbclass
index 8669ea42..a790ac7f 100644
--- a/meta-arago-extras/classes/qt5.bbclass
+++ b/meta-arago-extras/classes/qt5.bbclass
@@ -1,7 +1,7 @@
 # Class to mimic the old qt4e to prep recipe for use with Qt5 libraries
=20
 QT5EDEPENDS ?=3D "qtbase "
-DEPENDS_prepend =3D "${QT5EDEPENDS}"
+DEPENDS:prepend =3D "${QT5EDEPENDS}"
=20
 inherit qmake5
=20
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/l=
ayer.conf
index 5f105422..50d5f2c9 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras =3D "10"
=20
-LAYERSERIES_COMPAT_meta-arago-extras =3D "dunfell gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-arago-extras =3D "honister"
=20
 # Set a variable to get to the top of the metadata location
 ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
@@ -17,7 +17,8 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
 LAYERDEPENDS_meta-arago-extras =3D " \
     core \
-    meta-ti \
+    meta-ti-bsp \
+    meta-ti-extras \
     openembedded-layer \
     networking-layer \
     meta-python \
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.=
bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
index 0673c0a4..7d82b0ec 100644
--- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -27,8 +27,8 @@ do_install() {
     install -m 644 ${S}/test/sample_barcode.jpg ${D}${datadir}/ti/image
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/image \
 "
=20
-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/bi=
g-data-ipc-demo-linux_git.bb
index a75b4aa5..b384bf87 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-=
linux_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-=
linux_git.bb
@@ -25,7 +25,7 @@ EXTRA_OEMAKE =3D "\
     JOBS=3D"${PARALLEL_MAKE}" \
 "
=20
-do_create_srcipk_prepend() {
+do_create_srcipk:prepend() {
   rm -rf host_bios
 }
=20
@@ -42,5 +42,5 @@ do_install() {
 }
=20
 PACKAGES =3D+ "${PN}-firmware"
-FILES_${PN}-firmware +=3D "${bindir}/simple_buffer_example/release/serve=
r_dsp.xe66"
-INSANE_SKIP_${PN}-firmware +=3D "arch"
+FILES:${PN}-firmware +=3D "${bindir}/simple_buffer_example/release/serve=
r_dsp.xe66"
+INSANE_SKIP:${PN}-firmware +=3D "arch"
diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ip=
c-demo.inc
index 92b39914..32ead99c 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.=
inc
@@ -20,10 +20,10 @@ PV =3D "01.03.00.00"
 S =3D "${WORKDIR}/git"
=20
 PLATFORM =3D "UNKNOWN"
-PLATFORM_omap-a15 =3D "DRA7XX"
+PLATFORM:omap-a15 =3D "DRA7XX"
=20
 IPC_TARGETS =3D ""
-IPC_TARGETS_omap-a15 =3D "\
+IPC_TARGETS:omap-a15 =3D "\
     gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
diff --git a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_g=
it.bb b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
index 2a9750da..537cec01 100644
--- a/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
+++ b/meta-arago-extras/recipes-apps/image-gallery/image-gallery_git.bb
@@ -26,6 +26,6 @@ do_install() {
=20
 PACKAGES +=3D "matrix-gui-apps-image-gallery"
=20
-RDEPENDS_matrix-gui-apps-image-gallery  =3D "matrix-gui-apps-images matr=
ix-gui-submenus-camera ${PN}"
+RDEPENDS:matrix-gui-apps-image-gallery  =3D "matrix-gui-apps-images matr=
ix-gui-submenus-camera ${PN}"
=20
-FILES_matrix-gui-apps-image-gallery +=3D "${MATRIX_APP_DIR}/*"
+FILES:matrix-gui-apps-image-gallery +=3D "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-ano=
maly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detect=
ion/pdm-anomaly-detection_git.bb
index e4f43f1d..8f70ac2a 100644
--- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
+++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-de=
tection_git.bb
@@ -23,4 +23,4 @@ do_install() {
     install -m 644 ${S}/logs/* ${D}${datadir}/ti/examples/pdm
 }
=20
-FILES_${PN} +=3D "${datadir}/ti/examples/pdm"
+FILES:${PN} +=3D "${datadir}/ti/examples/pdm"
diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-clou=
d-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point=
-cloud-viewer_git.bb
index 6e4394b6..bbc2558e 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewe=
r_git.bb
@@ -21,7 +21,7 @@ PV =3D "2.2"
=20
 S =3D "${WORKDIR}/git"
=20
-RDEPENDS_${PN} =3D "opencv libxkbcommon"
+RDEPENDS:${PN} =3D "opencv libxkbcommon"
=20
 do_install() {
     install -d ${D}${bindir}
@@ -31,8 +31,8 @@ do_install() {
     install -m 644 ${S}/example_point_cloud.xyz ${D}${datadir}/ti/pointc=
louds
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/pointclouds \
 "
=20
-INSANE_SKIP_${PN} =3D "already-stripped file-rdeps"
+INSANE_SKIP:${PN} =3D "already-stripped file-rdeps"
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.=
bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index a0f2c937..c4eb10ee 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -33,6 +33,6 @@ do_install() {
=20
 PACKAGES +=3D "matrix-gui-thermostat-demo"
=20
-RDEPENDS_matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images matrix-=
gui-submenus-qt5"
+RDEPENDS:matrix-gui-thermostat-demo +=3D "matrix-gui-apps-images matrix-=
gui-submenus-qt5"
=20
-FILES_matrix-gui-thermostat-demo +=3D "${MATRIX_APP_DIR}/*"
+FILES:matrix-gui-thermostat-demo +=3D "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-openc=
v-opencl-opengl-multithreaded_git.bb b/meta-arago-extras/recipes-apps/vid=
eo-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
index 9a25e911..5b085641 100644
--- a/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
+++ b/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-openc=
l-opengl-multithreaded_git.bb
@@ -29,7 +29,7 @@ export TARGET_ROOTDIR =3D "${STAGING_DIR_HOST}"
 export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
 export TI_DSPLIB_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-dsplib-c=
66x-tree"
=20
-CXXFLAGS_append =3D " -DOCV_NATIVE "
+CXXFLAGS:append =3D " -DOCV_NATIVE "
=20
 do_compile() {
     cd ${S}
@@ -43,4 +43,4 @@ do_install() {
     install -m 755 qt-opencv-opencl-opengl-multithreaded ${D}/usr/bin/qt=
-opencv-opencl-opengl-multithreaded
 }
=20
-RDEPENDS_${PN} +=3D "opencv opencl-runtime"
+RDEPENDS:${PN} +=3D "opencv opencl-runtime"
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/=
meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index 76617224..a3657b58 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
@@ -26,4 +26,4 @@ do_install() {
 	install -m 0755 ${S}/stream_c_openmp ${D}/${bindir}/
 }
=20
-FILES_${PN}-openmp =3D "${bindir}/stream_c_openmp"
+FILES:${PN}-openmp =3D "${bindir}/stream_c_openmp"
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_gi=
t.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index dca4bfe1..f3993f1e 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -6,10 +6,10 @@ PV =3D "2.0"
 PR =3D "r5"
=20
 BRANCH ?=3D "v4.1"
-BRANCH_aarch64 ?=3D "am65x-v1.0"
+BRANCH:aarch64 ?=3D "am65x-v1.0"
=20
 SRCREV =3D "412dce4e65cfe5af729be38fd1b4c1d59e9a8828"
-SRCREV_aarch64 =3D "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
+SRCREV:aarch64 =3D "0f52dcb3c4e3678e96427d546d6c2e1fabc2ad91"
=20
 SRC_URI =3D "git://git.ti.com/switch-config/switch-config.git;protocol=3D=
git;branch=3D${BRANCH}"
=20
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-=
wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-w=
l18xx.bb
index 0288a54d..67179602 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
@@ -6,9 +6,9 @@ require hostap.inc
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed846=
4018a3"
=20
-PR_append =3D "e"
+PR:append =3D "e"
=20
-FILESEXTRAPATHS_append :=3D ":${THISDIR}/hostap-daemon"
+FILESEXTRAPATHS:append :=3D ":${THISDIR}/hostap-daemon"
=20
 # Add TI to the end to make it clear that this is a TI customized versio=
n
 # of hostap
@@ -19,6 +19,6 @@ SRCREV =3D "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
 BRANCH =3D "upstream_25_rebase"
=20
 PROVIDES +=3D "hostap-daemon"
-RPROVIDES_${PN} +=3D "hostap-daemon"
-RREPLACES_${PN} +=3D "hostap-daemon"
-RCONFLICTS_${PN} +=3D "hostap-daemon"
+RPROVIDES:${PN} +=3D "hostap-daemon"
+RREPLACES:${PN} +=3D "hostap-daemon"
+RCONFLICTS:${PN} +=3D "hostap-daemon"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc b/m=
eta-arago-extras/recipes-connectivity/hostap/hostap.inc
index 324de0be..72cdc4b1 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap.inc
@@ -16,7 +16,7 @@ PR =3D "r6"
 inherit update-rc.d pkgconfig
 INITSCRIPT_NAME=3D"hostapd"
=20
-CONFFILES_${PN} +=3D "${sysconfdir}/hostapd.conf"
+CONFFILES:${PN} +=3D "${sysconfdir}/hostapd.conf"
=20
 SRC_URI =3D "git://git.ti.com/wilink8-wlan/hostap.git;protocol=3Dgit;bra=
nch=3D${BRANCH} \
            file://defconfig \
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_g=
it.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
index e28f96f5..02b63738 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG ?=3D "pubsub pubsub_delta_frames pubsub_i=
nformationmodel \
                   certificate"
=20
 # Install examples and unit tests
-do_install_append() {
+do_install:append() {
     # Install examples
     install -d "${D}${datadir}/${BPN}/examples"
     for example in ${B}/bin/examples/*
@@ -77,15 +77,15 @@ do_install_append() {
 }
=20
 PACKAGES =3D+ "${PN}-examples ${PN}-tests"
-FILES_${PN}-dev +=3D "${libdir}/cmake/* ${datadir}/${BPN}/tools"
-FILES_${PN}-examples +=3D "${datadir}/${BPN}/examples"
-FILES_${PN}-tests +=3D "${datadir}/${BPN}/tests"
+FILES:${PN}-dev +=3D "${libdir}/cmake/* ${datadir}/${BPN}/tools"
+FILES:${PN}-examples +=3D "${datadir}/${BPN}/examples"
+FILES:${PN}-tests +=3D "${datadir}/${BPN}/tests"
=20
 # This contains some python-based tools
-RDEPENDS_${PN}-dev =3D "python3"
+RDEPENDS:${PN}-dev =3D "python3"
=20
 # Allow staticdev package to be empty incase sharedlibs is switched on
-ALLOW_EMPTY_${PN}-staticdev =3D "1"
-ALLOW_EMPTY_${PN}-tests =3D "1"
+ALLOW_EMPTY:${PN}-staticdev =3D "1"
+ALLOW_EMPTY:${PN}-tests =3D "1"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/=
meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index 4450cc1c..f425d163 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -21,7 +21,7 @@ do_configure() {
 	oe_runconf --with-lzo-headers=3D${STAGING_INCDIR}/lzo --with-lzo-lib=3D=
${STAGING_LIBDIR} --with-ssl-headers=3D${STAGING_INCDIR}/openssl --with-s=
sl-lib=3D${STAGING_LIBDIR}
 }
=20
-do_install_append() {
+do_install:append() {
 	rm -rf ${D}${localstatedir}/run
 	rm -rf ${D}${localstatedir}/lock
 }
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplican=
t/wpa-supplicant-wl18xx.bb
index 1b3b8d05..59e64df2 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t-wl18xx.bb
@@ -8,18 +8,18 @@ LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f=
2ebbaa25608eed8464018a3 \
                     file://../README;md5=3D3f01d778be8f953962388307ee38e=
d2b \
                     file://wpa_supplicant.c;beginline=3D1;endline=3D17;m=
d5=3D35e6d71fea6b15f61a9fac935bcf410f"
=20
-FILESEXTRAPATHS_append :=3D ":${THISDIR}/wpa-supplicant"
+FILESEXTRAPATHS:append :=3D ":${THISDIR}/wpa-supplicant"
=20
 # Tag: R8.7_SP3
 SRCREV =3D "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
 BRANCH =3D "upstream_25_rebase"
-PR_append =3D "b"
+PR:append =3D "b"
=20
 # Add ti to the PV to indicate that this is a TI modify version of wpa-s=
upplicant.
 PV =3D "R8.7_SP3-devel-ti+git${SRCPV}"
=20
 PROVIDES +=3D "wpa-supplicant"
-RPROVIDES_${PN}  +=3D "wpa-supplicant"
-RREPLACES_${PN}  +=3D "wpa-supplicant"
-RCONFLICTS_${PN}  +=3D "wpa-supplicant"
-RDEPENDS_${PN} +=3D "wpa-supplicant-cli wpa-supplicant-passphrase"
+RPROVIDES:${PN}  +=3D "wpa-supplicant"
+RREPLACES:${PN}  +=3D "wpa-supplicant"
+RCONFLICTS:${PN}  +=3D "wpa-supplicant"
+RDEPENDS:${PN} +=3D "wpa-supplicant-cli wpa-supplicant-passphrase"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-=
supplicant.inc
index 65693270..4ed2d353 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplican=
t.inc
@@ -10,7 +10,7 @@ LICENSE =3D "GPLv2 | BSD"
 inherit pkgconfig
=20
 DEPENDS =3D "gnutls dbus libnl openssl libgcrypt"
-RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
+RRECOMMENDS:${PN} =3D "wpa-supplicant-passphrase wpa-supplicant-cli"
=20
 # To prevent users from accidently picking up this customized version of
 # wpa-supplicant the DEFAULT_PREFERENCE will be set to -1.
@@ -29,10 +29,10 @@ SRC_URI +=3D "file://crypto_openssl.patch;patchdir=3D=
.."
=20
 S =3D "${WORKDIR}/git/wpa_supplicant"
=20
-PACKAGES_prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli "
-FILES_wpa-supplicant-passphrase =3D "${sbindir}/wpa_passphrase"
-FILES_wpa-supplicant-cli =3D "${sbindir}/wpa_cli"
-FILES_${PN} +=3D "${datadir}/dbus-1/system-services/*"
+PACKAGES:prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli "
+FILES:wpa-supplicant-passphrase =3D "${sbindir}/wpa_passphrase"
+FILES:wpa-supplicant-cli =3D "${sbindir}/wpa_cli"
+FILES:${PN} +=3D "${datadir}/dbus-1/system-services/*"
=20
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig .config
@@ -81,7 +81,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
=20
-pkg_postinst_wpa-supplicant () {
+pkg_postinst:wpa-supplicant () {
 	# If we're offline, we don't need to do this.
 	if [ "x$D" =3D "x" ]; then
 		killall -q -HUP dbus-daemon || true
diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb =
b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 4df536fd..0cd24690 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -26,4 +26,4 @@ do_install() {
 	install -m 0755 ${S}/mem_util/Release/mem_util ${D}/${bindir}
 }
=20
-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bb b/meta-ar=
ago-extras/recipes-core/llvm/llvm-common.bb
index 07bc8316..b69a5775 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bb
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;=
md5=3D0835ade698e0bcf8506ecda
=20
 SRC_URI =3D "file://llvm-config"
=20
-ALLOW_EMPTY_${PN} =3D "1"
-SYSROOT_PREPROCESS_FUNCS_append_class-target =3D " llvm_common_sysroot_p=
reprocess"
+ALLOW_EMPTY:${PN} =3D "1"
+SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " llvm_common_sysroot_p=
reprocess"
=20
 llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_cr=
ossscripts}/
 }
=20
-do_install_class-native() {
+do_install:class-native() {
     install -d ${D}${bindir}
     install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
 }
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend b/m=
eta-arago-extras/recipes-core/llvm/llvm-common.bbappend
index 27c27f5e..273fb314 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bbappend
@@ -1,5 +1,5 @@
-PR_append =3D ".arago0"
+PR:append =3D ".arago0"
=20
-SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk =3D " llvm_common_sysroo=
t_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " llvm_common_sysroo=
t_preprocess"
=20
 BBCLASSEXTEND +=3D "nativesdk"
diff --git a/meta-arago-extras/recipes-core/llvm/llvm.inc b/meta-arago-ex=
tras/recipes-core/llvm/llvm.inc
index b1a48f62..64451af8 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm.inc
+++ b/meta-arago-extras/recipes-core/llvm/llvm.inc
@@ -49,7 +49,7 @@ EXTRA_OECONF +=3D "--disable-assertions \
                  --enable-targets=3Dhost-only"
 EXTRA_OEMAKE +=3D "REQUIRES_RTTI=3D1 VERBOSE=3D1"
=20
-do_configure_prepend() {
+do_configure:prepend() {
     # Remove RPATHs
     sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Mak=
efile.rules
=20
@@ -117,34 +117,34 @@ llvm_sysroot_preprocess() {
 }
=20
 PACKAGES +=3D "${PN}-bugpointpasses ${PN}-llvmhello"
-ALLOW_EMPTY_${PN} =3D "1"
-ALLOW_EMPTY_${PN}-staticdev =3D "1"
-FILES_${PN} =3D ""
-FILES_${PN}-staticdev =3D ""
-FILES_${PN}-dbg =3D " \
+ALLOW_EMPTY:${PN} =3D "1"
+ALLOW_EMPTY:${PN}-staticdev =3D "1"
+FILES:${PN} =3D ""
+FILES:${PN}-staticdev =3D ""
+FILES:${PN}-dbg =3D " \
     ${bindir}/${LLVM_DIR}/.debug \
     ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
     ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
     /usr/src/debug \
 "
=20
-FILES_${PN}-dev =3D " \
+FILES:${PN}-dev =3D " \
     ${bindir}/${LLVM_DIR} \
     ${includedir}/${LLVM_DIR} \
 "
-RRECOMMENDS_${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-llvmhello"
+RRECOMMENDS:${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-llvmhello"
=20
-FILES_${PN}-bugpointpasses =3D "\
+FILES:${PN}-bugpointpasses =3D "\
     ${libdir}/${LLVM_DIR}/BugpointPasses.so \
 "
-FILES_${PN}-llvmhello =3D "\
+FILES:${PN}-llvmhello =3D "\
     ${libdir}/${LLVM_DIR}/LLVMHello.so \
 "
=20
 PACKAGES_DYNAMIC =3D "^libllvm${LLVM_RELEASE}-.*$"
 NOAUTOPACKAGEDEBUG =3D "1"
=20
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} +=3D =
"dev-so"
+INSANE_SKIP:${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} +=3D =
"dev-so"
=20
 python llvm_populate_packages() {
     libdir =3D bb.data.expand('${libdir}', d)
@@ -154,9 +154,9 @@ python llvm_populate_packages() {
     split_staticdev_packages =3D do_split_packages(d, libllvm_libdir, '^=
lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev pac=
kage for %s', allow_dirs=3DTrue)
     if split_packages:
         pn =3D d.getVar('PN')
-        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
-        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_pa=
ckages))
-        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_=
staticdev_packages))
+        d.appendVar('RDEPENDS:' + pn, ' '+' '.join(split_packages))
+        d.appendVar('RDEPENDS:' + pn + '-dbg', ' '+' '.join(split_dbg_pa=
ckages))
+        d.appendVar('RDEPENDS:' + pn + '-staticdev', ' '+' '.join(split_=
staticdev_packages))
 }
=20
-PACKAGESPLITFUNCS_prepend =3D "llvm_populate_packages "
+PACKAGESPLITFUNCS:prepend =3D "llvm_populate_packages "
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta=
-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index a6739efe..05c71a1d 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -3,12 +3,12 @@ HOMEPAGE =3D "https://git.ti.com/opencl/llvm"
=20
 PR =3D "r7"
=20
-do_configure_prepend_class-native() {
+do_configure:prepend:class-native() {
     # Fix paths in llvm-config
     sed -i "s|sys::path::parent_path(sys::path::parent_path(CurrentPath)=
)).str()|sys::path::parent_path(CurrentPath))\.str()|g" ${S}/tools/llvm-c=
onfig/llvm-config.cpp
 }
=20
-do_configure_prepend() {
+do_configure:prepend() {
     # Workaround for libdir fix for multilib to undo what is currently u=
pstream
     sed -i 's:${base_libdir}:/${baselib}:g' ${S}/tools/llvm-config/llvm-=
config.cpp
 }
@@ -18,7 +18,7 @@ require recipes-core/llvm/llvm.inc
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd=
7814d1d"
=20
 DEPENDS +=3D "libxml2 groff-native"
-DEPENDS_append_class-target =3D " valgrind"
+DEPENDS:append:class-target =3D " valgrind"
=20
 LLVM_DIR =3D "ti-llvm${PV}"
=20
@@ -58,7 +58,7 @@ EXTRA_OECONF +=3D " --enable-targets=3D"host,arm,c6000,=
msp430" \
=20
 EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}" LIBXML2_LIBS=3D"${LIBX=
ML2_LIBS}""
=20
-do_compile_class-native() {
+do_compile:class-native() {
   cd ${LLVM_BUILD_DIR}
=20
   # Fix libdir for multilib
@@ -67,7 +67,7 @@ do_compile_class-native() {
   oe_runmake
 }
=20
-do_compile_class-nativesdk() {
+do_compile:class-nativesdk() {
     cd ${LLVM_BUILD_DIR}
=20
     # Fix libdir for multilib
@@ -119,7 +119,7 @@ do_compile() {
     oe_runmake
 }
=20
-do_install_append_class-target() {
+do_install:append:class-target() {
     for b in ${D}${bindir}/${LLVM_DIR}/${HOST_SYS}-clang*; do
         if [ ! -L ${b} ]; then
             mv ${b} ${D}${bindir}/`echo "${b}" | sed -e 's|${D}${bindir}=
/${LLVM_DIR}/${HOST_SYS}-||g'`
@@ -127,7 +127,7 @@ do_install_append_class-target() {
     done
 }
=20
-do_install_class-native() {
+do_install:class-native() {
     cd ${LLVM_BUILD_DIR}
     oe_runmake DESTDIR=3D${LLVM_INSTALL_DIR} install
=20
@@ -158,8 +158,8 @@ do_install_class-native() {
 }
=20
=20
-SYSROOT_PREPROCESS_FUNCS_class-target +=3D "llvm_sysroot_preprocess_targ=
et"
-SYSROOT_PREPROCESS_FUNCS_class-nativesdk +=3D "llvm_sysroot_preprocess_t=
arget"
+SYSROOT_PREPROCESS_FUNCS:class-target +=3D "llvm_sysroot_preprocess_targ=
et"
+SYSROOT_PREPROCESS_FUNCS:class-nativesdk +=3D "llvm_sysroot_preprocess_t=
arget"
=20
 llvm_sysroot_preprocess() {
     :
@@ -170,7 +170,7 @@ llvm_sysroot_preprocess_target() {
     mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_c=
rossscripts}/llvm-config${PV}-ti
 }
=20
-INSANE_SKIP_${PN} +=3D "installed-vs-shipped"
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.0 +=3D=
 "dev-so"
+INSANE_SKIP:${PN} +=3D "installed-vs-shipped"
+INSANE_SKIP:${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.0 +=3D=
 "dev-so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
index 9bc32cdf..2c2aef82 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-3d-demos_2.0.bb
@@ -27,70 +27,70 @@ PACKAGES =3D "matrix-3d-demo-chameleon \
             matrix-3d-demo-exampleui    \
 "
=20
-PACKAGES_append_omap-a15 =3D " \
+PACKAGES:append:omap-a15 =3D " \
             matrix-3d-demo-kmscube      \
             matrix-3d-demo-kmscubevideo \
 "
=20
-PACKAGES_append_ti43x =3D " \
+PACKAGES:append:ti43x =3D " \
             matrix-3d-demo-kmscube \
 "
=20
-PACKAGES_append_ti33x =3D " \
+PACKAGES:append:ti33x =3D " \
             matrix-3d-demo-kmscube \
 "
=20
-PACKAGES_append_k3 =3D " \
+PACKAGES:append:k3 =3D " \
             matrix-3d-demo-kmscube \
 "
=20
 MATRIX_3D_DEMO_SGX_QAF_PARAM =3D "1000"
=20
-do_install_prepend() {
+do_install:prepend() {
     find ${S} -name '*.desktop' -exec sed -i {} \
         -e "s|-qaf=3D[0-9]*|-qaf=3D${MATRIX_3D_DEMO_SGX_QAF_PARAM}|g" \;
 }
=20
 3D_DEMOS_RDEPENDS_MATRIX =3D "matrix-gui-apps-images matrix-gui-submenus=
-3d"
 3D_DEMOS_RDEPENDS =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
-3D_DEMOS_RDEPENDS_omap-a15 =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS_ti43x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS_ti33x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-3D_DEMOS_RDEPENDS_k3       =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
-
-RDEPENDS_matrix-3d-demo-chameleon =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-coverflow =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-film      =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-lantern   =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-skull     =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-shaders   =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-vase      =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-navigation    =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-exampleui     =3D "${3D_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-3d-demo-kmscube       =3D "${3D_DEMOS_RDEPENDS_MATRIX} k=
mscube"
-#RDEPENDS_matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX} =
omapdrmtest"
-RDEPENDS_matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
+3D_DEMOS_RDEPENDS:omap-a15 =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+3D_DEMOS_RDEPENDS:ti43x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+3D_DEMOS_RDEPENDS:ti33x    =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+3D_DEMOS_RDEPENDS:k3       =3D "${3D_DEMOS_RDEPENDS_MATRIX} img-pvr-sdk"
+
+RDEPENDS:matrix-3d-demo-chameleon =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-coverflow =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-film      =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-lantern   =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-skull     =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-shaders   =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-vase      =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-navigation    =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-exampleui     =3D "${3D_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-3d-demo-kmscube       =3D "${3D_DEMOS_RDEPENDS_MATRIX} k=
mscube"
+#RDEPENDS:matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX} =
omapdrmtest"
+RDEPENDS:matrix-3d-demo-kmscubevideo  =3D "${3D_DEMOS_RDEPENDS_MATRIX}"
=20
 # Split the matrix files by 3d demos
-FILES_matrix-3d-demo-chameleon =3D "${MATRIX_APP_DIR}/3d_chameleon/*"
-FILES_matrix-3d-demo-coverflow =3D "${MATRIX_APP_DIR}/3d_coverflow/*"
-FILES_matrix-3d-demo-film      =3D "${MATRIX_APP_DIR}/3d_film/*"
-FILES_matrix-3d-demo-lantern   =3D "${MATRIX_APP_DIR}/3d_lantern/*"
-FILES_matrix-3d-demo-skull     =3D "${MATRIX_APP_DIR}/3d_skull/*"
-FILES_matrix-3d-demo-shaders   =3D "${MATRIX_APP_DIR}/3d_shaders/*"
-FILES_matrix-3d-demo-vase      =3D "${MATRIX_APP_DIR}/3d_vase/*"
-FILES_matrix-3d-demo-navigation       =3D "${MATRIX_APP_DIR}/3d_navigati=
on/*"
-FILES_matrix-3d-demo-exampleui        =3D "${MATRIX_APP_DIR}/3d_exampleu=
i/*"
-FILES_matrix-3d-demo-kmscube          =3D "${MATRIX_APP_DIR}/3d_kmscube/=
*"
-FILES_matrix-3d-demo-kmscubevideo     =3D "${MATRIX_APP_DIR}/3d_kmscubev=
ideo/*"
+FILES:matrix-3d-demo-chameleon =3D "${MATRIX_APP_DIR}/3d_chameleon/*"
+FILES:matrix-3d-demo-coverflow =3D "${MATRIX_APP_DIR}/3d_coverflow/*"
+FILES:matrix-3d-demo-film      =3D "${MATRIX_APP_DIR}/3d_film/*"
+FILES:matrix-3d-demo-lantern   =3D "${MATRIX_APP_DIR}/3d_lantern/*"
+FILES:matrix-3d-demo-skull     =3D "${MATRIX_APP_DIR}/3d_skull/*"
+FILES:matrix-3d-demo-shaders   =3D "${MATRIX_APP_DIR}/3d_shaders/*"
+FILES:matrix-3d-demo-vase      =3D "${MATRIX_APP_DIR}/3d_vase/*"
+FILES:matrix-3d-demo-navigation       =3D "${MATRIX_APP_DIR}/3d_navigati=
on/*"
+FILES:matrix-3d-demo-exampleui        =3D "${MATRIX_APP_DIR}/3d_exampleu=
i/*"
+FILES:matrix-3d-demo-kmscube          =3D "${MATRIX_APP_DIR}/3d_kmscube/=
*"
+FILES:matrix-3d-demo-kmscubevideo     =3D "${MATRIX_APP_DIR}/3d_kmscubev=
ideo/*"
=20
 # Split the ${bindir} files by 3d demos
-FILES_matrix-3d-demo-chameleon +=3D "${bindir}/runOGLES2ChameleonMan.sh"
-FILES_matrix-3d-demo-coverflow +=3D "${bindir}/runOGLES2Coverflow.sh"
-FILES_matrix-3d-demo-film      +=3D "${bindir}/runOGLESFilmTV.sh"
-FILES_matrix-3d-demo-lantern   +=3D "${bindir}/runOGLES2MagicLantern.sh"
-FILES_matrix-3d-demo-skull     +=3D "${bindir}/runOGLESEvilSkull.sh"
-FILES_matrix-3d-demo-shaders   +=3D "${bindir}/runOGLES2Shaders.sh"
-FILES_matrix-3d-demo-vase      +=3D "${bindir}/runOGLESVase.sh"
-FILES_matrix-3d-demo-navigation      +=3D "${bindir}/runOGLES2Navigation=
.sh"
-FILES_matrix-3d-demo-exampleui       +=3D "${bindir}/runOGLES2ExampleUI.=
sh"
+FILES:matrix-3d-demo-chameleon +=3D "${bindir}/runOGLES2ChameleonMan.sh"
+FILES:matrix-3d-demo-coverflow +=3D "${bindir}/runOGLES2Coverflow.sh"
+FILES:matrix-3d-demo-film      +=3D "${bindir}/runOGLESFilmTV.sh"
+FILES:matrix-3d-demo-lantern   +=3D "${bindir}/runOGLES2MagicLantern.sh"
+FILES:matrix-3d-demo-skull     +=3D "${bindir}/runOGLESEvilSkull.sh"
+FILES:matrix-3d-demo-shaders   +=3D "${bindir}/runOGLES2Shaders.sh"
+FILES:matrix-3d-demo-vase      +=3D "${bindir}/runOGLESVase.sh"
+FILES:matrix-3d-demo-navigation      +=3D "${bindir}/runOGLES2Navigation=
.sh"
+FILES:matrix-3d-demo-exampleui       +=3D "${bindir}/runOGLES2ExampleUI.=
sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-d=
emos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-=
demos_2.0.bb
index 61cc9085..9d7eb444 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.=
0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.=
0.bb
@@ -11,16 +11,16 @@ S =3D "${WORKDIR}/git/analytics_apps"
 # Make sure analytics submenu and app images has been installed
 ANALYTICSDEMO_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-=
analytics"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 PACKAGES =3D "matrix-analytics-pdm-anomaly-detection \
 "
=20
-RDEPENDS_matrix-analytics-pdm-anomaly-detection =3D " \
+RDEPENDS:matrix-analytics-pdm-anomaly-detection =3D " \
     bash \
     ${ANALYTICSDEMO_RDEPENDS} \
     pdm-anomaly-detection \
 "
=20
-FILES_matrix-analytics-pdm-anomaly-detection =3D "${MATRIX_APP_DIR}/anal=
ytics_pdm_anomaly_detection/*"
-FILES_matrix-analytics-pdm-anomaly-detection +=3D "${bindir}/runPdmAnoma=
lyDetection.sh"
+FILES:matrix-analytics-pdm-anomaly-detection =3D "${MATRIX_APP_DIR}/anal=
ytics_pdm_anomaly_detection/*"
+FILES:matrix-analytics-pdm-anomaly-detection +=3D "${bindir}/runPdmAnoma=
lyDetection.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index a84e130c..fb61b340 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -11,4 +11,4 @@ INC_PR =3D "r76"
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
=20
-INSANE_SKIP_${PN} +=3D "installed-vs-shipped"
+INSANE_SKIP:${PN} +=3D "installed-vs-shipped"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images=
_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.=
0.bb
index a1c46ca0..b7c34896 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-images_2.0.bb
@@ -13,4 +13,4 @@ do_install(){
     cp -rf ${S}/ ${D}${MATRIX_APP_DIR}
 }
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/=
meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
index 4d3b609c..2bcc908b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
@@ -6,7 +6,7 @@ MATRIX_FILES_DIR ?=3D "${S}"
 # MATRIX_FILES_DIR for .desktop files and then:
 #   1.  Install all non-script files into the MATRIX_APP_DIR
 #   2.  Install all script files into ${bindir}
-do_install_append(){
+do_install:append(){
     cd ${MATRIX_FILES_DIR}
     applist=3D`find . -name "*.desktop"`
=20
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmar=
ks-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-armben=
chmarks-demos_2.0.bb
index 36598517..b6885a73 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demo=
s_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-armbenchmarks-demo=
s_2.0.bb
@@ -9,9 +9,9 @@ inherit allarch
 S =3D "${WORKDIR}/git/arm_apps"
=20
 # Make sure arm submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-arm"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-arm"
=20
 # Make sure the benchmarks have been installed
-RDEPENDS_${PN} +=3D "arm-benchmarks lmbench nbench-byte matrix-gui-helpe=
r-scripts"
+RDEPENDS:${PN} +=3D "arm-benchmarks lmbench nbench-byte matrix-gui-helpe=
r-scripts"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-dem=
os_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demo=
s_2.0.bb
index 745a477b..edbdd49b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.=
bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.=
bb
@@ -9,7 +9,7 @@ inherit allarch
 S =3D "${WORKDIR}/git/browser_apps"
=20
 # Make sure browser submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-browser"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-browser"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
-FILES_${PN} +=3D "${bindir}/runGoogleChrome.sh"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${bindir}/runGoogleChrome.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loop=
back_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loo=
pback_2.0.bb
index 835ba9e1..a020514b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.=
0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-camera-loopback_2.=
0.bb
@@ -7,6 +7,6 @@ PR =3D "${INC_PR}.1"
 S =3D "${WORKDIR}/git/cameraloopback_apps"
=20
 # Make sure loopback application is compiled and app images has been ins=
talled
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images av-examples"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images av-examples"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.=
bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
index 1b2c47e3..3a178cd7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-clocks_2.0.bb
@@ -8,19 +8,19 @@ inherit allarch
=20
 S =3D "${WORKDIR}/git/clocks_apps"
=20
-do_install_prepend(){
+do_install:prepend(){
    install -d ${D}${MATRIX_BASE_DIR}/html-apps/
=20
    cp -rf ${S}/set_frequency/power-set-frequency ${D}${MATRIX_BASE_DIR}/=
html-apps/
=20
 }
=20
-do_install_append(){
+do_install:append(){
     rm ${D}${MATRIX_APP_DIR}/set_frequency/set-frequency.php
 }
 # Make sure power submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power ma=
trix-gui-generic-pm"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power ma=
trix-gui-generic-pm"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
                 ${MATRIX_BASE_DIR}/apps/ \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demo=
s_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_=
2.0.bb
index 9fd48820..5e07519a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
@@ -7,11 +7,11 @@ PR =3D "${INC_PR}.12"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/cryptos_apps_scripts"
-S_ti33x =3D "${WORKDIR}/git/cryptos_apps_program"
-S_ti43x =3D "${WORKDIR}/git/cryptos_apps_program"
-S_dra7xx =3D "${WORKDIR}/git/cryptos_apps_program"
+S:ti33x =3D "${WORKDIR}/git/cryptos_apps_program"
+S:ti43x =3D "${WORKDIR}/git/cryptos_apps_program"
+S:dra7xx =3D "${WORKDIR}/git/cryptos_apps_program"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 # Make sure crypto submenu and app images has been installed. Also make =
sure openssl is available
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-cryptos =
openssl matrix-gui-helper-scripts"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-cryptos =
openssl matrix-gui-helper-scripts"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-con=
trol_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-co=
ntrol_2.0.bb
index 5dee50b9..1f9a4d35 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.=
0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-display-control_2.=
0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/displaycontrol_apps"
=20
 # Make sure display submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-display"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-display"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-de=
mos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-de=
mos_2.0.bb
index 49497753..2982d32e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0=
.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-ethernet-demos_2.0=
.bb
@@ -17,14 +17,14 @@ SRC_URI +=3D "file://udhcpd_eth1.conf"
=20
 S =3D "${WORKDIR}/git/ethernet_apps"
=20
-do_install_append() {
+do_install:append() {
     install -d ${D}${sysconfdir}
     install -m 0755 ${WORKDIR}/udhcpd_eth1.conf ${D}${sysconfdir}
 }
=20
 # Make sure ethernet submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-ethernet=
"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-ethernet=
"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/* \
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/* \
                 ${sysconfdir}/udhcpd_eth1.conf"
-CONFFILES_${PN} +=3D "${sysconfdir}/udhcpd_eth1.conf"
+CONFFILES:${PN} +=3D "${sysconfdir}/udhcpd_eth1.conf"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scri=
pts.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.=
bb
index 295db8c1..4db1d8d2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-helper-scripts.bb
@@ -8,9 +8,9 @@ inherit allarch
=20
 S =3D "${WORKDIR}/git/scripts"
=20
-do_install_append(){
+do_install:append(){
     install -d ${D}${bindir}
     install -m 0755 ${S}/optimize-benchmark.sh ${D}${bindir}/=20
 }
=20
-FILES_${PN} +=3D "{bindir}/*"
+FILES:${PN} +=3D "{bindir}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2=
.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index 9d9cc89e..1427ef0a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -11,36 +11,36 @@ S =3D "${WORKDIR}/git/hmi_apps"
 # Make sure machinevision submenu and app images has been installed
 HMI_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-hmi"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 PACKAGES =3D "matrix-hmi-demo-evse \
 	    matrix-hmi-demo-protection-relays \
 	    matrix-hmi-demo-mmwavegesture \
 "
=20
-RDEPENDS_matrix-hmi-demo-evse =3D " \
+RDEPENDS:matrix-hmi-demo-evse =3D " \
     bash \
     ${HMI_RDEPENDS} \
     evse-hmi \
 "
=20
-RDEPENDS_matrix-hmi-demo-protection-relays =3D " \
+RDEPENDS:matrix-hmi-demo-protection-relays =3D " \
     bash \
     ${HMI_RDEPENDS} \
     protection-relays-hmi \
 "
=20
-RDEPENDS_matrix-hmi-demo-mmwavegesture =3D " \
+RDEPENDS:matrix-hmi-demo-mmwavegesture =3D " \
     bash \
     ${HMI_RDEPENDS} \
     mmwavegesture-hmi \
 "
=20
-FILES_matrix-hmi-demo-evse    =3D "${MATRIX_APP_DIR}/hmi_evse/*"
-FILES_matrix-hmi-demo-evse  +=3D "${bindir}/runHmiEvse.sh"
+FILES:matrix-hmi-demo-evse    =3D "${MATRIX_APP_DIR}/hmi_evse/*"
+FILES:matrix-hmi-demo-evse  +=3D "${bindir}/runHmiEvse.sh"
=20
-FILES_matrix-hmi-demo-protection-relays   =3D "${MATRIX_APP_DIR}/hmi_pro=
tection_relays/*"
-FILES_matrix-hmi-demo-protection-relays  +=3D "${bindir}/runHmiProtectio=
nRelays.sh"
+FILES:matrix-hmi-demo-protection-relays   =3D "${MATRIX_APP_DIR}/hmi_pro=
tection_relays/*"
+FILES:matrix-hmi-demo-protection-relays  +=3D "${bindir}/runHmiProtectio=
nRelays.sh"
=20
-FILES_matrix-hmi-demo-mmwavegesture    =3D "${MATRIX_APP_DIR}/hmi_mmwave=
/*"
-FILES_matrix-hmi-demo-mmwavegesture  +=3D "${bindir}/runHmiMmWave.sh"
+FILES:matrix-hmi-demo-mmwavegesture    =3D "${MATRIX_APP_DIR}/hmi_mmwave=
/*"
+FILES:matrix-hmi-demo-mmwavegesture  +=3D "${bindir}/runHmiMmWave.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevisi=
on-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machin=
evision-demos_2.0.bb
index 193da657..16482003 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demo=
s_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demo=
s_2.0.bb
@@ -16,7 +16,7 @@ BARCODE_RDEPENDS =3D ""
 #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', Tru=
e, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d=
)]} \
 #"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 PACKAGES =3D "matrix-machinevision-demo-dlp3dscanner \
             matrix-machinevision-demo-barcoderoi \
@@ -24,35 +24,35 @@ PACKAGES =3D "matrix-machinevision-demo-dlp3dscanner =
\
             matrix-machinevision-demo-simplepeopletracking \
 "
=20
-RDEPENDS_matrix-machinevision-demo-dlp3dscanner =3D " \
+RDEPENDS:matrix-machinevision-demo-dlp3dscanner =3D " \
     ${MACHINEVISION_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx =3D " \
+RDEPENDS:matrix-machinevision-demo-dlp3dscanner:append:dra7xx =3D " \
     ${@['','point-cloud-viewer'][oe.utils.all_distro_features(d, 'opencv=
', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu', True, Fa=
lse, d)]} \
 "
=20
-RDEPENDS_matrix-machinevision-demo-barcoderoi =3D " \
+RDEPENDS:matrix-machinevision-demo-barcoderoi =3D " \
     ${MACHINEVISION_RDEPENDS} \
     ${BARCODE_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-machinevision-demo-barcoderoi-f2f =3D " \
+RDEPENDS:matrix-machinevision-demo-barcoderoi-f2f =3D " \
     ${MACHINEVISION_RDEPENDS} \
     ${BARCODE_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-machinevision-demo-simplepeopletracking =3D " \
+RDEPENDS:matrix-machinevision-demo-simplepeopletracking =3D " \
     ${MACHINEVISION_RDEPENDS} \
 "
=20
-FILES_matrix-machinevision-demo-dlp3dscanner    =3D "${MATRIX_APP_DIR}/m=
achinevision_dlp_3d_scanner/*"
-FILES_matrix-machinevision-demo-dlp3dscanner   +=3D "${bindir}/runDlp3DS=
canner.sh"
+FILES:matrix-machinevision-demo-dlp3dscanner    =3D "${MATRIX_APP_DIR}/m=
achinevision_dlp_3d_scanner/*"
+FILES:matrix-machinevision-demo-dlp3dscanner   +=3D "${bindir}/runDlp3DS=
canner.sh"
=20
-FILES_matrix-machinevision-demo-barcoderoi    =3D "${MATRIX_APP_DIR}/mac=
hinevision_barcode_roi/*"
-FILES_matrix-machinevision-demo-barcoderoi   +=3D "${bindir}/runBarcodeR=
oi.sh"
-FILES_matrix-machinevision-demo-barcoderoi-f2f =3D "${MATRIX_APP_DIR}/ma=
chinevision_barcode_roi_f2f/*"
-FILES_matrix-machinevision-demo-barcoderoi-f2f +=3D "${bindir}/runBarcod=
eRoiSave2File.sh"
+FILES:matrix-machinevision-demo-barcoderoi    =3D "${MATRIX_APP_DIR}/mac=
hinevision_barcode_roi/*"
+FILES:matrix-machinevision-demo-barcoderoi   +=3D "${bindir}/runBarcodeR=
oi.sh"
+FILES:matrix-machinevision-demo-barcoderoi-f2f =3D "${MATRIX_APP_DIR}/ma=
chinevision_barcode_roi_f2f/*"
+FILES:matrix-machinevision-demo-barcoderoi-f2f +=3D "${bindir}/runBarcod=
eRoiSave2File.sh"
=20
-FILES_matrix-machinevision-demo-simplepeopletracking   =3D "${MATRIX_APP=
_DIR}/machinevision_simple_people_tracking/*"
-FILES_matrix-machinevision-demo-simplepeopletracking   +=3D "${bindir}/r=
unSimplePeopleTracking.sh"
+FILES:matrix-machinevision-demo-simplepeopletracking   =3D "${MATRIX_APP=
_DIR}/machinevision_simple_people_tracking/*"
+FILES:matrix-machinevision-demo-simplepeopletracking   +=3D "${bindir}/r=
unSimplePeopleTracking.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
index 340c5144..d20143e6 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-mc-demos_2.0.bb
@@ -15,13 +15,13 @@ PACKAGES =3D "matrix-mc-demo-ipc \
             matrix-mc-demo-imageproc \
 "
=20
-RDEPENDS_matrix-mc-demo-ipc        =3D "${MC_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-mc-demo-imageproc  =3D "${MC_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-mc-demo-ipc        =3D "${MC_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-mc-demo-imageproc  =3D "${MC_DEMOS_RDEPENDS}"
=20
-FILES_matrix-mc-demo-ipc        =3D "${MATRIX_APP_DIR}/mc_demo_ipc/*"
-FILES_matrix-mc-demo-imageproc  =3D "${MATRIX_APP_DIR}/mc_demo_imageproc=
/*"
+FILES:matrix-mc-demo-ipc        =3D "${MATRIX_APP_DIR}/mc_demo_ipc/*"
+FILES:matrix-mc-demo-imageproc  =3D "${MATRIX_APP_DIR}/mc_demo_imageproc=
/*"
=20
-FILES_matrix-mc-demo-ipc       +=3D "${bindir}/mc_demo_ipc.sh"
-FILES_matrix-mc-demo-imageproc +=3D "${bindir}/mc_demo_imageproc.sh \
+FILES:matrix-mc-demo-ipc       +=3D "${bindir}/mc_demo_ipc.sh"
+FILES:matrix-mc-demo-imageproc +=3D "${bindir}/mc_demo_imageproc.sh \
                                    ${bindir}/mc_run_dsp.sh \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-=
demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedi=
a-demos_2.0.bb
index 701dd20b..3bfbc540 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2=
.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-multimedia-demos_2=
.0.bb
@@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git/multimedia_apps"
 # Make sure multimedia submenu and app images has been installed
 MULTIMEDIA_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-mul=
timedia amsdk-av-files"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 PACKAGES =3D "matrix-multimedia-demo-aac \
             matrix-multimedia-demo-audiocapture \
@@ -27,44 +27,44 @@ PACKAGES =3D "matrix-multimedia-demo-aac \
             matrix-multimedia-demo-dsp66imgproc-f2f \
 "
=20
-RDEPENDS_matrix-multimedia-demo-aac =3D "${MULTIMEDIA_RDEPENDS}"
-RDEPENDS_matrix-multimedia-demo-audiocapture =3D "${MULTIMEDIA_RDEPENDS}=
"
-RDEPENDS_matrix-multimedia-demo-h264dec      =3D "${MULTIMEDIA_RDEPENDS}=
"
-RDEPENDS_matrix-multimedia-demo-mpeg4aacdec   =3D "${MULTIMEDIA_RDEPENDS=
}"
-RDEPENDS_matrix-multimedia-demo-mpeg4dec     =3D "${MULTIMEDIA_RDEPENDS}=
"
-RDEPENDS_matrix-multimedia-demo-ivahdh264dec             =3D "${MULTIMED=
IA_RDEPENDS}"
-RDEPENDS_matrix-multimedia-demo-ivahdh264enc             =3D "${MULTIMED=
IA_RDEPENDS}"
-RDEPENDS_matrix-multimedia-demo-ivahdmjpegenc            =3D "${MULTIMED=
IA_RDEPENDS}"
-RDEPENDS_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec =3D "${MULTIMED=
IA_RDEPENDS}"
-RDEPENDS_matrix-multimedia-demo-h265dec      =3D "${MULTIMEDIA_RDEPENDS}=
"
-RDEPENDS_matrix-multimedia-demo-dsp66imgproc  =3D "${MULTIMEDIA_RDEPENDS=
}"
-RDEPENDS_matrix-multimedia-demo-dsp66imgproc-f2f  =3D "${MULTIMEDIA_RDEP=
ENDS}"
+RDEPENDS:matrix-multimedia-demo-aac =3D "${MULTIMEDIA_RDEPENDS}"
+RDEPENDS:matrix-multimedia-demo-audiocapture =3D "${MULTIMEDIA_RDEPENDS}=
"
+RDEPENDS:matrix-multimedia-demo-h264dec      =3D "${MULTIMEDIA_RDEPENDS}=
"
+RDEPENDS:matrix-multimedia-demo-mpeg4aacdec   =3D "${MULTIMEDIA_RDEPENDS=
}"
+RDEPENDS:matrix-multimedia-demo-mpeg4dec     =3D "${MULTIMEDIA_RDEPENDS}=
"
+RDEPENDS:matrix-multimedia-demo-ivahdh264dec             =3D "${MULTIMED=
IA_RDEPENDS}"
+RDEPENDS:matrix-multimedia-demo-ivahdh264enc             =3D "${MULTIMED=
IA_RDEPENDS}"
+RDEPENDS:matrix-multimedia-demo-ivahdmjpegenc            =3D "${MULTIMED=
IA_RDEPENDS}"
+RDEPENDS:matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec =3D "${MULTIMED=
IA_RDEPENDS}"
+RDEPENDS:matrix-multimedia-demo-h265dec      =3D "${MULTIMEDIA_RDEPENDS}=
"
+RDEPENDS:matrix-multimedia-demo-dsp66imgproc  =3D "${MULTIMEDIA_RDEPENDS=
}"
+RDEPENDS:matrix-multimedia-demo-dsp66imgproc-f2f  =3D "${MULTIMEDIA_RDEP=
ENDS}"
=20
=20
 # Split the matrix files by multimedia demos
-FILES_matrix-multimedia-demo-aac =3D "${MATRIX_APP_DIR}/arm_multimedia_a=
acdec/*"
-FILES_matrix-multimedia-demo-audiocapture =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_audiocapture/*"
-FILES_matrix-multimedia-demo-h264dec      =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_h264dec/*"
-FILES_matrix-multimedia-demo-mpeg4aacdec   =3D "${MATRIX_APP_DIR}/arm_mu=
ltimedia_mpeg4aacdec/*"
-FILES_matrix-multimedia-demo-mpeg4dec     =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_mpeg4dec/*"
-FILES_matrix-multimedia-demo-ivahdh264dec                =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_h264dec/*"
-FILES_matrix-multimedia-demo-ivahdh264enc                =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_h264enc/*"
-FILES_matrix-multimedia-demo-ivahdmjpegenc               =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_mjpegenc/*"
-FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
-FILES_matrix-multimedia-demo-h265dec      =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_h265dec/*"
-FILES_matrix-multimedia-demo-dsp66imgproc     =3D "${MATRIX_APP_DIR}/dsp=
66_multimedia_imgproc/*"
-FILES_matrix-multimedia-demo-dsp66imgproc-f2f     =3D "${MATRIX_APP_DIR}=
/dsp66_multimedia_imgproc_f2f/*"
+FILES:matrix-multimedia-demo-aac =3D "${MATRIX_APP_DIR}/arm_multimedia_a=
acdec/*"
+FILES:matrix-multimedia-demo-audiocapture =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_audiocapture/*"
+FILES:matrix-multimedia-demo-h264dec      =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_h264dec/*"
+FILES:matrix-multimedia-demo-mpeg4aacdec   =3D "${MATRIX_APP_DIR}/arm_mu=
ltimedia_mpeg4aacdec/*"
+FILES:matrix-multimedia-demo-mpeg4dec     =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_mpeg4dec/*"
+FILES:matrix-multimedia-demo-ivahdh264dec                =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_h264dec/*"
+FILES:matrix-multimedia-demo-ivahdh264enc                =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_h264enc/*"
+FILES:matrix-multimedia-demo-ivahdmjpegenc               =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_mjpegenc/*"
+FILES:matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec    =3D "${MATRIX_A=
PP_DIR}/ivahd_multimedia_vip_vpe_mpeg4encdec/*"
+FILES:matrix-multimedia-demo-h265dec      =3D "${MATRIX_APP_DIR}/arm_mul=
timedia_h265dec/*"
+FILES:matrix-multimedia-demo-dsp66imgproc     =3D "${MATRIX_APP_DIR}/dsp=
66_multimedia_imgproc/*"
+FILES:matrix-multimedia-demo-dsp66imgproc-f2f     =3D "${MATRIX_APP_DIR}=
/dsp66_multimedia_imgproc_f2f/*"
=20
 # Split the ${bindir} files by multimedia demos
-FILES_matrix-multimedia-demo-aac +=3D "${bindir}/runAACDec.sh"
-FILES_matrix-multimedia-demo-audiocapture +=3D "${bindir}/runAudioCaptur=
e.sh"
-FILES_matrix-multimedia-demo-h264dec      +=3D "${bindir}/runH264Dec.sh"
-FILES_matrix-multimedia-demo-mpeg4aacdec   +=3D "${bindir}/runMpeg4AacDe=
c.sh"
-FILES_matrix-multimedia-demo-mpeg4dec     +=3D "${bindir}/runMpeg4Dec.sh=
"
-FILES_matrix-multimedia-demo-ivahdh264dec               +=3D "${bindir}/=
runIvahdH264Dec.sh"
-FILES_matrix-multimedia-demo-ivahdh264enc               +=3D "${bindir}/=
runIvahdH264Enc.sh"
-FILES_matrix-multimedia-demo-ivahdmjpegenc              +=3D "${bindir}/=
runIvahdMjpegEnc.sh"
-FILES_matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   +=3D "${bindir}/=
runIvahdVipVpeMpeg4EncDec.sh"
-FILES_matrix-multimedia-demo-h265dec      +=3D "${bindir}/runH265Dec.sh"
-FILES_matrix-multimedia-demo-dsp66imgproc    +=3D "${bindir}/runDsp66Img=
Proc.sh"
-FILES_matrix-multimedia-demo-dsp66imgproc-f2f    +=3D "${bindir}/runDsp6=
6ImgProcSave2File.sh"
+FILES:matrix-multimedia-demo-aac +=3D "${bindir}/runAACDec.sh"
+FILES:matrix-multimedia-demo-audiocapture +=3D "${bindir}/runAudioCaptur=
e.sh"
+FILES:matrix-multimedia-demo-h264dec      +=3D "${bindir}/runH264Dec.sh"
+FILES:matrix-multimedia-demo-mpeg4aacdec   +=3D "${bindir}/runMpeg4AacDe=
c.sh"
+FILES:matrix-multimedia-demo-mpeg4dec     +=3D "${bindir}/runMpeg4Dec.sh=
"
+FILES:matrix-multimedia-demo-ivahdh264dec               +=3D "${bindir}/=
runIvahdH264Dec.sh"
+FILES:matrix-multimedia-demo-ivahdh264enc               +=3D "${bindir}/=
runIvahdH264Enc.sh"
+FILES:matrix-multimedia-demo-ivahdmjpegenc              +=3D "${bindir}/=
runIvahdMjpegEnc.sh"
+FILES:matrix-multimedia-demo-vip-vpe-ivahdmpeg4encdec   +=3D "${bindir}/=
runIvahdVipVpeMpeg4EncDec.sh"
+FILES:matrix-multimedia-demo-h265dec      +=3D "${bindir}/runH265Dec.sh"
+FILES:matrix-multimedia-demo-dsp66imgproc    +=3D "${bindir}/runDsp66Img=
Proc.sh"
+FILES:matrix-multimedia-demo-dsp66imgproc-f2f    +=3D "${bindir}/runDsp6=
6ImgProcSave2File.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demo=
s_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_=
2.0.bb
index a2eba7b5..b0f38e16 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.b=
b
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-opencl-demos_2.0.b=
b
@@ -13,24 +13,24 @@ S =3D "${WORKDIR}/git/opencl_apps"
 # Make sure opencl submenu and app images has been installed
 OPENCL_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-opencl"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 PACKAGES =3D "matrix-opencl-demo-dsplibfft  \
             matrix-opencl-demo-vecadd     \
             matrix-opencl-demo-floatcompute \
 "
=20
-RDEPENDS_matrix-opencl-demo-dsplibfft     =3D "${OPENCL_RDEPENDS}"
-RDEPENDS_matrix-opencl-demo-vecadd        =3D "${OPENCL_RDEPENDS}"
-RDEPENDS_matrix-opencl-demo-floatcompute  =3D "${OPENCL_RDEPENDS}"
+RDEPENDS:matrix-opencl-demo-dsplibfft     =3D "${OPENCL_RDEPENDS}"
+RDEPENDS:matrix-opencl-demo-vecadd        =3D "${OPENCL_RDEPENDS}"
+RDEPENDS:matrix-opencl-demo-floatcompute  =3D "${OPENCL_RDEPENDS}"
=20
 # Split the matrix files by opencl demos
-FILES_matrix-opencl-demo-dsplibfft     =3D "${MATRIX_APP_DIR}/opencl_dsp=
lib_fft/*"
-FILES_matrix-opencl-demo-vecadd        =3D "${MATRIX_APP_DIR}/opencl_vec=
add/*"
-FILES_matrix-opencl-demo-floatcompute  =3D "${MATRIX_APP_DIR}/opencl_flo=
at_compute/*"
+FILES:matrix-opencl-demo-dsplibfft     =3D "${MATRIX_APP_DIR}/opencl_dsp=
lib_fft/*"
+FILES:matrix-opencl-demo-vecadd        =3D "${MATRIX_APP_DIR}/opencl_vec=
add/*"
+FILES:matrix-opencl-demo-floatcompute  =3D "${MATRIX_APP_DIR}/opencl_flo=
at_compute/*"
=20
=20
 # Split the ${bindir} files by opencl demos
-FILES_matrix-opencl-demo-dsplibfft     +=3D "${bindir}/runOclDsplibFFT.s=
h"
-FILES_matrix-opencl-demo-vecadd        +=3D "${bindir}/runOclVecadd.sh"
-FILES_matrix-opencl-demo-floatcompute  +=3D "${bindir}/runOclFloatComput=
e.sh"
+FILES:matrix-opencl-demo-dsplibfft     +=3D "${bindir}/runOclDsplibFFT.s=
h"
+FILES:matrix-opencl-demo-vecadd        +=3D "${bindir}/runOclVecadd.sh"
+FILES:matrix-opencl-demo-floatcompute  +=3D "${bindir}/runOclFloatComput=
e.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-de=
mos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-de=
mos_2.0.bb
index 6411c45f..2235b49f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0=
.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-oprofile-demos_2.0=
.bb
@@ -11,6 +11,6 @@ S =3D "${WORKDIR}/git/oprofile_apps"
 # Make sure profiling submenu and app images  has been installed
 # Include am-sysinfo because that package has the sample
 # executables for profiling.
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-oprofile=
 oprofile oprofile-example"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-oprofile=
 oprofile oprofile-example"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index a9ebb84f..3daffbd5 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -9,8 +9,8 @@ inherit allarch
 S =3D "${WORKDIR}/git/power_apps"
=20
 # Make sure power submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power ma=
trix-gui-generic-pm"
-ALLOW_EMPTY_${PN} =3D "1"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-power ma=
trix-gui-generic-pm"
+ALLOW_EMPTY:${PN} =3D "1"
=20
 # Break out the individual files into separate packages.  That way only =
the
 # PM features supported for each device can be installed.  Prepend the l=
ist
@@ -18,18 +18,18 @@ ALLOW_EMPTY_${PN} =3D "1"
 PACKAGES =3D+ "${PN}-count ${PN}-dump-reg ${PN}-snapshot1 ${PN}-snapshot=
2 ${PN}-suspend ${PN}-governor"
=20
 # Split the matrix files by PM app
-FILES_${PN}-count +=3D "${MATRIX_APP_DIR}/pm_count/*"
-FILES_${PN}-dump-reg +=3D "${MATRIX_APP_DIR}/pm_dump_reg/*"
-FILES_${PN}-snapshot1 +=3D "${MATRIX_APP_DIR}/pm_snapshot_1/*"
-FILES_${PN}-snapshot2 +=3D "${MATRIX_APP_DIR}/pm_snapshot_2/*"
-FILES_${PN}-suspend +=3D "${MATRIX_APP_DIR}/pm_suspend/*"
-FILES_${PN}-governor +=3D "${MATRIX_APP_DIR}/pm_userspace_governor/* \
+FILES:${PN}-count +=3D "${MATRIX_APP_DIR}/pm_count/*"
+FILES:${PN}-dump-reg +=3D "${MATRIX_APP_DIR}/pm_dump_reg/*"
+FILES:${PN}-snapshot1 +=3D "${MATRIX_APP_DIR}/pm_snapshot_1/*"
+FILES:${PN}-snapshot2 +=3D "${MATRIX_APP_DIR}/pm_snapshot_2/*"
+FILES:${PN}-suspend +=3D "${MATRIX_APP_DIR}/pm_suspend/*"
+FILES:${PN}-governor +=3D "${MATRIX_APP_DIR}/pm_userspace_governor/* \
                          ${MATRIX_APP_DIR}/pm_ondemand_governor/*"
=20
 # Split the ${bindir} files by PM app
-FILES_${PN}-count +=3D "${bindir}/pm_count.sh"
-FILES_${PN}-dump-reg +=3D "${bindir}/pm_dump_reg.sh"
-FILES_${PN}-snapshot1 +=3D "${bindir}/pm_snapshot_1.sh"
-FILES_${PN}-snapshot2 +=3D "${bindir}/pm_snapshot_2.sh"
-FILES_${PN}-suspend +=3D "${bindir}/pm_suspend.sh"
-FILES_${PN}-governor +=3D "${bindir}/setgovernor.sh"
+FILES:${PN}-count +=3D "${bindir}/pm_count.sh"
+FILES:${PN}-dump-reg +=3D "${bindir}/pm_dump_reg.sh"
+FILES:${PN}-snapshot1 +=3D "${bindir}/pm_snapshot_1.sh"
+FILES:${PN}-snapshot2 +=3D "${bindir}/pm_snapshot_2.sh"
+FILES:${PN}-suspend +=3D "${bindir}/pm_suspend.sh"
+FILES:${PN}-governor +=3D "${bindir}/setgovernor.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2=
.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
index e95409d9..afae3424 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pru-demos_2.0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/pru_apps"
=20
 # Make sure pru submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-pru"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-pru"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2=
.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
index 081bde7d..ed0da382 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt4-demos_2.0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/qt4_apps"
=20
 # Make sure qt4 submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-qt4"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-qt4"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2=
.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
index f9b1e8fc..c5084c49 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git/qt5_apps"
 # Make sure qt5 submenu and app images has been installed
 QT5_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-qt5"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
 PACKAGES =3D "matrix-qt5-demo-animated \
             matrix-qt5-demo-browser \
             matrix-qt5-demo-calculator \
@@ -19,15 +19,15 @@ PACKAGES =3D "matrix-qt5-demo-animated \
             matrix-qt5-demo-webkit-browser \
 "
=20
-RDEPENDS_matrix-qt5-demo-animated =3D "${QT5_RDEPENDS}"
-RDEPENDS_matrix-qt5-demo-browser =3D "${QT5_RDEPENDS}"
-RDEPENDS_matrix-qt5-demo-calculator =3D "${QT5_RDEPENDS}"
-RDEPENDS_matrix-qt5-demo-deform =3D "${QT5_RDEPENDS}"
-RDEPENDS_matrix-qt5-demo-webkit-browser =3D "${QT5_RDEPENDS}"
+RDEPENDS:matrix-qt5-demo-animated =3D "${QT5_RDEPENDS}"
+RDEPENDS:matrix-qt5-demo-browser =3D "${QT5_RDEPENDS}"
+RDEPENDS:matrix-qt5-demo-calculator =3D "${QT5_RDEPENDS}"
+RDEPENDS:matrix-qt5-demo-deform =3D "${QT5_RDEPENDS}"
+RDEPENDS:matrix-qt5-demo-webkit-browser =3D "${QT5_RDEPENDS}"
=20
 # Split the matrix files by qt5 demos
-FILES_matrix-qt5-demo-animated =3D "${MATRIX_APP_DIR}/qt5_animated_tiles=
/*"
-FILES_matrix-qt5-demo-browser =3D "${MATRIX_APP_DIR}/qt5_browser/*"
-FILES_matrix-qt5-demo-calculator =3D "${MATRIX_APP_DIR}/qt5_calculator/*=
"
-FILES_matrix-qt5-demo-deform =3D "${MATRIX_APP_DIR}/qt5_deform/*"
-FILES_matrix-qt5-demo-webkit-browser =3D "${MATRIX_APP_DIR}/qt5_webkit_b=
rowser/*"
+FILES:matrix-qt5-demo-animated =3D "${MATRIX_APP_DIR}/qt5_animated_tiles=
/*"
+FILES:matrix-qt5-demo-browser =3D "${MATRIX_APP_DIR}/qt5_browser/*"
+FILES:matrix-qt5-demo-calculator =3D "${MATRIX_APP_DIR}/qt5_calculator/*=
"
+FILES:matrix-qt5-demo-deform =3D "${MATRIX_APP_DIR}/qt5_deform/*"
+FILES:matrix-qt5-demo-webkit-browser =3D "${MATRIX_APP_DIR}/qt5_webkit_b=
rowser/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-de=
mos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-de=
mos_2.0.bb
index 80f5a1f5..5a26ae24 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0=
.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-settings-demos_2.0=
.bb
@@ -17,8 +17,8 @@ SETTINGS_DEMOS_RDEPENDS =3D " \
     am-sysinfo \
 "
=20
-RDEPENDS_${PN} +=3D "${SETTINGS_DEMOS_RDEPENDS}"
-RDEPENDS_matrix-gui-weston-terminal-demo +=3D "${SETTINGS_DEMOS_RDEPENDS=
}"
+RDEPENDS:${PN} +=3D "${SETTINGS_DEMOS_RDEPENDS}"
+RDEPENDS:matrix-gui-weston-terminal-demo +=3D "${SETTINGS_DEMOS_RDEPENDS=
}"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
-FILES_matrix-gui-weston-terminal-demo =3D "${MATRIX_APP_DIR}/terminal"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:matrix-gui-weston-terminal-demo =3D "${MATRIX_APP_DIR}/terminal"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.=
0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index dce40212..71714ef2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -76,31 +76,31 @@ PACKAGES +=3D " ${PN}-arm \
 "
=20
 # Make sure app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images bash"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images bash"
=20
 # Add the files for each submenu package
-FILES_${PN}-arm =3D "${MATRIX_APP_DIR}/arm_submenu/*"
-FILES_${PN}-3d =3D "${MATRIX_APP_DIR}/3d_submenu/*"
-FILES_${PN}-cryptos =3D "${MATRIX_APP_DIR}/cryptos_submenu/*"
-FILES_${PN}-display =3D "${MATRIX_APP_DIR}/display_submenu/*"
-FILES_${PN}-ethernet =3D "${MATRIX_APP_DIR}/ethernet_submenu/*"
-FILES_${PN}-multimedia =3D "${MATRIX_APP_DIR}/multimedia_submenu/*"
-FILES_${PN}-power =3D "${MATRIX_APP_DIR}/power_submenu/*"
-FILES_${PN}-pru =3D "${MATRIX_APP_DIR}/pru_submenu/*"
-FILES_${PN}-qt4 =3D "${MATRIX_APP_DIR}/qt4_submenu/*"
-FILES_${PN}-qt5 =3D "${MATRIX_APP_DIR}/qt5_submenu/*"
-FILES_${PN}-settings =3D "${MATRIX_APP_DIR}/settings_submenu/*"
-FILES_${PN}-usb =3D "${MATRIX_APP_DIR}/usb_submenu/*"
-FILES_${PN}-wifi =3D "${MATRIX_APP_DIR}/wifi_submenu/*"
-FILES_${PN}-oprofile =3D "${MATRIX_APP_DIR}/oprofile_submenu/*"
-FILES_${PN}-camera =3D "${MATRIX_APP_DIR}/camera_submenu/*"
-FILES_${PN}-utility =3D "${MATRIX_APP_DIR}/utilities_submenu/*"
-FILES_${PN}-mc-demo =3D "${MATRIX_APP_DIR}/mc_demo_submenu/*"
-FILES_${PN}-opencl =3D "${MATRIX_APP_DIR}/opencl_submenu/*"
-FILES_${PN}-videoanalytics =3D "${MATRIX_APP_DIR}/videoanalytics_submenu=
/*"
-FILES_${PN}-machinevision =3D "${MATRIX_APP_DIR}/machinevision_submenu/*=
"
-FILES_${PN}-touch =3D "${MATRIX_APP_DIR}/touch_submenu/*"
-FILES_${PN}-browser =3D "${MATRIX_APP_DIR}/browser_submenu/*"
-FILES_${PN}-hmi =3D "${MATRIX_APP_DIR}/hmi_submenu/*"
-FILES_${PN}-tidl =3D "${MATRIX_APP_DIR}/tidl_submenu/*"
-FILES_${PN}-analytics =3D "${MATRIX_APP_DIR}/analytics_submenu/*"
+FILES:${PN}-arm =3D "${MATRIX_APP_DIR}/arm_submenu/*"
+FILES:${PN}-3d =3D "${MATRIX_APP_DIR}/3d_submenu/*"
+FILES:${PN}-cryptos =3D "${MATRIX_APP_DIR}/cryptos_submenu/*"
+FILES:${PN}-display =3D "${MATRIX_APP_DIR}/display_submenu/*"
+FILES:${PN}-ethernet =3D "${MATRIX_APP_DIR}/ethernet_submenu/*"
+FILES:${PN}-multimedia =3D "${MATRIX_APP_DIR}/multimedia_submenu/*"
+FILES:${PN}-power =3D "${MATRIX_APP_DIR}/power_submenu/*"
+FILES:${PN}-pru =3D "${MATRIX_APP_DIR}/pru_submenu/*"
+FILES:${PN}-qt4 =3D "${MATRIX_APP_DIR}/qt4_submenu/*"
+FILES:${PN}-qt5 =3D "${MATRIX_APP_DIR}/qt5_submenu/*"
+FILES:${PN}-settings =3D "${MATRIX_APP_DIR}/settings_submenu/*"
+FILES:${PN}-usb =3D "${MATRIX_APP_DIR}/usb_submenu/*"
+FILES:${PN}-wifi =3D "${MATRIX_APP_DIR}/wifi_submenu/*"
+FILES:${PN}-oprofile =3D "${MATRIX_APP_DIR}/oprofile_submenu/*"
+FILES:${PN}-camera =3D "${MATRIX_APP_DIR}/camera_submenu/*"
+FILES:${PN}-utility =3D "${MATRIX_APP_DIR}/utilities_submenu/*"
+FILES:${PN}-mc-demo =3D "${MATRIX_APP_DIR}/mc_demo_submenu/*"
+FILES:${PN}-opencl =3D "${MATRIX_APP_DIR}/opencl_submenu/*"
+FILES:${PN}-videoanalytics =3D "${MATRIX_APP_DIR}/videoanalytics_submenu=
/*"
+FILES:${PN}-machinevision =3D "${MATRIX_APP_DIR}/machinevision_submenu/*=
"
+FILES:${PN}-touch =3D "${MATRIX_APP_DIR}/touch_submenu/*"
+FILES:${PN}-browser =3D "${MATRIX_APP_DIR}/browser_submenu/*"
+FILES:${PN}-hmi =3D "${MATRIX_APP_DIR}/hmi_submenu/*"
+FILES:${PN}-tidl =3D "${MATRIX_APP_DIR}/tidl_submenu/*"
+FILES:${PN}-analytics =3D "${MATRIX_APP_DIR}/analytics_submenu/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_=
2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.=
bb
index f05dd4c8..dd80d087 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git/tidl_apps"
 # Make sure tidl submenu and app images has been installed
 TIDLDEMO_RDEPENDS +=3D "matrix-gui-apps-images matrix-gui-submenus-tidl"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
=20
 PACKAGES =3D "matrix-tidl-demo-staticimg \
             matrix-tidl-demo-staticimg-lg2 \
@@ -25,72 +25,72 @@ PACKAGES =3D "matrix-tidl-demo-staticimg \
             matrix-tidl-demo-segment \
 "
=20
-RDEPENDS_matrix-tidl-demo-staticimg =3D " \
+RDEPENDS:matrix-tidl-demo-staticimg =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-staticimg-lg2 =3D " \
+RDEPENDS:matrix-tidl-demo-staticimg-lg2 =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-staticimg-dsponly =3D " \
+RDEPENDS:matrix-tidl-demo-staticimg-dsponly =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-pnexamples =3D " \
+RDEPENDS:matrix-tidl-demo-pnexamples =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-livecam =3D " \
+RDEPENDS:matrix-tidl-demo-livecam =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-livecam-lg2 =3D " \
+RDEPENDS:matrix-tidl-demo-livecam-lg2 =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-dogbreeds =3D " \
+RDEPENDS:matrix-tidl-demo-dogbreeds =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-objdet =3D " \
+RDEPENDS:matrix-tidl-demo-objdet =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-objdet-livecam =3D " \
+RDEPENDS:matrix-tidl-demo-objdet-livecam =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-RDEPENDS_matrix-tidl-demo-segment =3D " \
+RDEPENDS:matrix-tidl-demo-segment =3D " \
     ${TIDLDEMO_RDEPENDS} \
 "
=20
-FILES_matrix-tidl-demo-staticimg =3D "${MATRIX_APP_DIR}/tidl_demo_static=
img/*"
-FILES_matrix-tidl-demo-staticimg +=3D "${bindir}/runTidlStaticImg.sh"
+FILES:matrix-tidl-demo-staticimg =3D "${MATRIX_APP_DIR}/tidl_demo_static=
img/*"
+FILES:matrix-tidl-demo-staticimg +=3D "${bindir}/runTidlStaticImg.sh"
=20
-FILES_matrix-tidl-demo-staticimg-lg2 =3D "${MATRIX_APP_DIR}/tidl_demo_st=
aticimg_lg2/*"
-FILES_matrix-tidl-demo-staticimg-lg2 +=3D "${bindir}/runTidlStaticImg_lg=
2.sh"
+FILES:matrix-tidl-demo-staticimg-lg2 =3D "${MATRIX_APP_DIR}/tidl_demo_st=
aticimg_lg2/*"
+FILES:matrix-tidl-demo-staticimg-lg2 +=3D "${bindir}/runTidlStaticImg_lg=
2.sh"
=20
-FILES_matrix-tidl-demo-staticimg-dsponly =3D "${MATRIX_APP_DIR}/tidl_dem=
o_staticimg_dsponly/*"
-FILES_matrix-tidl-demo-staticimg-dsponly +=3D "${bindir}/runTidlStaticIm=
g_dsponly.sh"
+FILES:matrix-tidl-demo-staticimg-dsponly =3D "${MATRIX_APP_DIR}/tidl_dem=
o_staticimg_dsponly/*"
+FILES:matrix-tidl-demo-staticimg-dsponly +=3D "${bindir}/runTidlStaticIm=
g_dsponly.sh"
=20
-FILES_matrix-tidl-demo-pnexamples =3D "${MATRIX_APP_DIR}/tidl_demo_pnexa=
mples/*"
-FILES_matrix-tidl-demo-pnexamples +=3D "${bindir}/runTidlPnExamples.sh"
+FILES:matrix-tidl-demo-pnexamples =3D "${MATRIX_APP_DIR}/tidl_demo_pnexa=
mples/*"
+FILES:matrix-tidl-demo-pnexamples +=3D "${bindir}/runTidlPnExamples.sh"
=20
-FILES_matrix-tidl-demo-livecam   =3D "${MATRIX_APP_DIR}/tidl_demo_liveca=
m/*"
-FILES_matrix-tidl-demo-livecam   +=3D "${bindir}/runTidlLiveCam.sh"
+FILES:matrix-tidl-demo-livecam   =3D "${MATRIX_APP_DIR}/tidl_demo_liveca=
m/*"
+FILES:matrix-tidl-demo-livecam   +=3D "${bindir}/runTidlLiveCam.sh"
=20
-FILES_matrix-tidl-demo-livecam-lg2  =3D "${MATRIX_APP_DIR}/tidl_demo_liv=
ecam_lg2/*"
-FILES_matrix-tidl-demo-livecam-lg2  +=3D "${bindir}/runTidlLiveCam_lg2.s=
h"
+FILES:matrix-tidl-demo-livecam-lg2  =3D "${MATRIX_APP_DIR}/tidl_demo_liv=
ecam_lg2/*"
+FILES:matrix-tidl-demo-livecam-lg2  +=3D "${bindir}/runTidlLiveCam_lg2.s=
h"
=20
-FILES_matrix-tidl-demo-dogbreeds =3D "${MATRIX_APP_DIR}/tidl_demo_dogbre=
eds/*"
-FILES_matrix-tidl-demo-dogbreeds +=3D "${bindir}/runTidlDogBreeds.sh"
+FILES:matrix-tidl-demo-dogbreeds =3D "${MATRIX_APP_DIR}/tidl_demo_dogbre=
eds/*"
+FILES:matrix-tidl-demo-dogbreeds +=3D "${bindir}/runTidlDogBreeds.sh"
=20
-FILES_matrix-tidl-demo-objdet   =3D "${MATRIX_APP_DIR}/tidl_demo_objdet/=
*"
-FILES_matrix-tidl-demo-objdet   +=3D "${bindir}/runTidlObjdet.sh"
+FILES:matrix-tidl-demo-objdet   =3D "${MATRIX_APP_DIR}/tidl_demo_objdet/=
*"
+FILES:matrix-tidl-demo-objdet   +=3D "${bindir}/runTidlObjdet.sh"
=20
-FILES_matrix-tidl-demo-objdet-livecam   =3D "${MATRIX_APP_DIR}/tidl_demo=
_objdet_livecam/*"
-FILES_matrix-tidl-demo-objdet-livecam   +=3D "${bindir}/runTidlObjdet_li=
vecam.sh"
+FILES:matrix-tidl-demo-objdet-livecam   =3D "${MATRIX_APP_DIR}/tidl_demo=
_objdet_livecam/*"
+FILES:matrix-tidl-demo-objdet-livecam   +=3D "${bindir}/runTidlObjdet_li=
vecam.sh"
=20
-FILES_matrix-tidl-demo-segment   =3D "${MATRIX_APP_DIR}/tidl_demo_segmen=
t/*"
-FILES_matrix-tidl-demo-segment   +=3D "${bindir}/runTidlSegment.sh"
+FILES:matrix-tidl-demo-segment   =3D "${MATRIX_APP_DIR}/tidl_demo_segmen=
t/*"
+FILES:matrix-tidl-demo-segment   +=3D "${bindir}/runTidlSegment.sh"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos=
_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.=
0.bb
index 99fd3951..8e4ba444 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-touch-demos_2.0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/touch_apps"
=20
 # Make sure touch submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-touch"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-touch"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2=
.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
index 404b037a..de6c8e4a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-usb-demos_2.0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/usb_apps"
=20
 # Make sure usb submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-usb bonn=
ie++ matrix-gui-helper-scripts"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-usb bonn=
ie++ matrix-gui-helper-scripts"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-dem=
os_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demo=
s_2.0.bb
index 8cb6cf29..44653d01 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.=
bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-utility-demos_2.0.=
bb
@@ -8,7 +8,7 @@ inherit allarch
=20
 S =3D "${WORKDIR}/git/utilities_apps"
=20
-do_install_prepend(){
+do_install:prepend(){
    install -d ${D}${MATRIX_BASE_DIR}/html-apps/
    cp -rf ${S}/utility_eeprom/eeprom ${D}${MATRIX_BASE_DIR}/html-apps/
    cp -rf ${S}/utility_filesystem/filesystem ${D}${MATRIX_BASE_DIR}/html=
-apps/
@@ -16,7 +16,7 @@ do_install_prepend(){
    cp -rf ${S}/utility_stats/stats ${D}${MATRIX_BASE_DIR}/html-apps/
 }
=20
-do_install_append(){
+do_install:append(){
     rm ${D}${MATRIX_APP_DIR}/utility_eeprom/eeprom-utility.php
     rm ${D}${MATRIX_APP_DIR}/utility_filesystem/filesystem-utility.php
     rm ${D}${MATRIX_APP_DIR}/utility_info/info-utility.php
@@ -24,8 +24,8 @@ do_install_append(){
 }
=20
 # Make sure utility submenu and app images has been installed.
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-utility"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-utility"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/html-apps/ \
                 ${MATRIX_BASE_DIR}/apps/ \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_=
2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.=
bb
index 1dd0d950..79360796 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-v4l2-demos_2.0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/v4l2_apps"
=20
 # Make sure display submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-display =
av-examples"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-display =
av-examples"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analy=
tics-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-vide=
o-analytics-demos_2.0.bb
index 4c900506..d0cf5233 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-de=
mos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-video-analytics-de=
mos_2.0.bb
@@ -18,11 +18,11 @@ PACKAGES =3D "matrix-video-analytics-opencv-opencl-op=
engl-demo \
 "
=20
 #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro=
_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('=
MACHINE_FEATURES', 'gpu dsp', True, False, d)]}
-RDEPENDS_matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
+RDEPENDS:matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
     ${VIDEO_ANALYTICS_DEMO_RDEPENDS} \
 "
=20
 # Split the matrix files by demos
-FILES_matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
+FILES:matrix-video-analytics-opencv-opencl-opengl-demo =3D " \
     ${MATRIX_APP_DIR}/videoanalytics_opencv_opencl_opengl_demo/* \
 "
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_=
2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.=
bb
index b5060ace..2c77953b 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-wifi-demos_2.0.bb
@@ -9,6 +9,6 @@ inherit allarch
 S =3D "${WORKDIR}/git/wifi_apps"
=20
 # Make sure wifi submenu and app images has been installed
-RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-wifi"
+RDEPENDS:${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-wifi"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini b/m=
eta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
index 900a86b8..350e6122 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/php.ini
@@ -502,7 +502,7 @@ magic_quotes_runtime =3D Off
 magic_quotes_sybase =3D Off
=20
 ; Automatically add files before or after any PHP document.
-auto_prepend_file =3D
+auto:prepend_file =3D
 auto_append_file =3D
=20
 ; As of 4.0b4, PHP always outputs a character encoding by default in
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/me=
ta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 4c9c5386..7cd5c82e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -7,7 +7,7 @@ SECTION =3D "multimedia"
=20
 PR =3D "r37"
=20
-SYSTEMD_SERVICE_${PN} =3D "matrix-gui-2.0.service"
+SYSTEMD_SERVICE:${PN} =3D "matrix-gui-2.0.service"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -58,6 +58,6 @@ do_install(){
=20
 GUIDEPS =3D "${@bb.utils.contains('MACHINE_FEATURES','gpu',"matrix-gui-b=
rowser refresh-screen",'',d)}"
=20
-RDEPENDS_${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi=
 lighttpd-module-deflate lighttpd-module-expire php php-cgi php-cli ${GUI=
DEPS}"
+RDEPENDS:${PN} +=3D "matrix-lighttpd-config lighttpd lighttpd-module-cgi=
 lighttpd-module-deflate lighttpd-module-expire php php-cgi php-cli ${GUI=
DEPS}"
=20
-FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
+FILES:${PN} +=3D "${MATRIX_BASE_DIR}/*"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
index 8a89aa3b..95f75b52 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -19,10 +19,10 @@ do_install() {
 	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/light=
tpd/lighttpd.conf.matrix
 }
=20
-FILES_${PN} =3D "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
-RDEPENDS_${PN} =3D "lighttpd lighttpd-module-setenv"
+FILES:${PN} =3D "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
+RDEPENDS:${PN} =3D "lighttpd lighttpd-module-setenv"
=20
-pkg_postinst_ontarget_${PN} () {
+pkg_postinst_ontarget:${PN} () {
 if [ -f ${sysconfdir}/lighttpd/lighttpd.conf ] ; then
 	cp ${sysconfdir}/lighttpd/lighttpd.conf.matrix ${sysconfdir}/lighttpd/l=
ighttpd.conf
 else
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolcha=
in.bb b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
index e4323891..bbae8622 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
@@ -17,9 +17,9 @@ EXCLUDE_FROM_SHLIBS =3D "1"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
=20
-INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so sta=
ticdev file-rdeps"
-INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so fil=
e-rdeps"
-INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-s=
o file-rdeps"
+INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so sta=
ticdev file-rdeps"
+INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so fil=
e-rdeps"
+INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-s=
o file-rdeps"
=20
 PROVIDES =3D "\
 	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
@@ -40,7 +40,7 @@ libexecdir =3D "${exec_prefix}/libexec"
 datadir =3D "${exec_prefix}/share"
 gcclibdir =3D "${libdir}/gcc"
=20
-FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
+FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
 	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
 	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
 	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
@@ -52,7 +52,7 @@ FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D =
"\
 	${libexecdir}/* \
 "
=20
-FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
+FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
 	${bindir}/${TARGET_PREFIX}gdb \
 	${bindir}/${TARGET_PREFIX}gdbtui \
 	${datadir}/gdb/* \
@@ -60,7 +60,7 @@ FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D =
"\
 	${datadir}/man/man1/${TARGET_PREFIX}* \
 "
=20
-FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
+FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
 	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
 	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
 	${prefix}/${EAT_TARGET_SYS}/bin/strip \
@@ -86,22 +86,22 @@ FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARC=
H} =3D "\
 	${bindir}/${TARGET_PREFIX}size \
 "
=20
-DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "The GNU cc=
 and gcc C compilers"
-DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb - GNU =
debugger"
-DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "A GNU=
 collection of binary utilities"
+DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "The GNU cc=
 and gcc C compilers"
+DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb - GNU =
debugger"
+DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "A GNU=
 collection of binary utilities"
=20
 #LICENSE =3D "${ARG_LIC_LIBC}"
-#LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LIC_GCC=
}"
-#LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LIC_GDB=
}"
-#LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LI=
C_BFD}"
+#LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LIC_GCC=
}"
+#LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LIC_GDB=
}"
+#LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${ARG_LI=
C_BFD}"
=20
 PKGV =3D "${EAT_VER_MAIN}"
-PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GCC}"
-PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GDB}"
-PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_BF=
D}"
+PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GCC}"
+PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GDB}"
+PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_BF=
D}"
=20
 LIBDIR =3D "lib"
-LIBDIR_aarch64 =3D "lib64"
+LIBDIR:aarch64 =3D "lib64"
=20
 do_install() {
 	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.b=
bappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbap=
pend
index 5a51aaa0..478ba2ba 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -1,6 +1,6 @@
 ORIG_TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('T=
ARGET_OS'), ''][d.getVar('TARGET_OS') =3D=3D ('' or 'custom')]}"
=20
-do_install_append() {
+do_install:append() {
 	install -d ${D}${base_sbindir}
 	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/libc/${base_sbindir}/ldconfig=
 ${D}${base_sbindir}/
 	install -d ${D}${sysconfdir}
@@ -25,11 +25,11 @@ do_install_append() {
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 }
=20
-# Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move =
in ${libdir}/gcc
+# Below FILES:* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move =
in ${libdir}/gcc
 # to enable native compile on the target
-FILES_libgcov-staticdev =3D "${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/li=
bgcov.a"
+FILES:libgcov-staticdev =3D "${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/li=
bgcov.a"
=20
-FILES_libgfortran-dev =3D "\
+FILES:libgfortran-dev =3D "\
     ${libdir}/libgfortran*.so \
     ${libdir}/libgfortran.spec \
     ${libdir}/libgfortran.la \
@@ -38,11 +38,11 @@ FILES_libgfortran-dev =3D "\
     ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/finclude/ \
 "
=20
-FILES_gcc-sanitizers =3D "${libdir}/*.spec ${libdir}/gcc/${ORIG_TARGET_S=
YS}/${BINV}/include/sanitizer/*.h"
+FILES:gcc-sanitizers =3D "${libdir}/*.spec ${libdir}/gcc/${ORIG_TARGET_S=
YS}/${BINV}/include/sanitizer/*.h"
=20
 # This is provided by gcc:
 #    ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include
-FILES_libgcc-dev =3D "\
+FILES:libgcc-dev =3D "\
     ${base_libdir}/libgcc*.so \
     ${@oe.utils.conditional('BASETARGET_SYS', '${ORIG_TARGET_SYS}', '', =
'${libdir}/${BASETARGET_SYS}', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}* \
@@ -50,24 +50,24 @@ FILES_libgcc-dev =3D "\
     ${libdir}/gcc/${TARGET_SYS} \
 "
=20
-FILES_libssp-dev =3D "\
+FILES:libssp-dev =3D "\
     ${libdir}/libssp*.so \
     ${libdir}/libssp*_nonshared.a \
     ${libdir}/libssp*.la \
     ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/ssp \
 "
=20
-FILES_libquadmath-dev =3D "\
+FILES:libquadmath-dev =3D "\
     ${libdir}/libquadmath*.so \
     ${libdir}/libquadmath.la \
     ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/quadmath* \
 "
=20
-FILES_libgomp-dev =3D "\
+FILES:libgomp-dev =3D "\
     ${libdir}/libgomp*${SOLIBSDEV} \
     ${libdir}/libgomp*.la \
     ${libdir}/libgomp.spec \
     ${libdir}/gcc/${ORIG_TARGET_SYS}/${BINV}/include/omp.h \
 "
=20
-INSANE_SKIP_libgcc-dev +=3D "staticdev"
+INSANE_SKIP:libgcc-dev +=3D "staticdev"
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte=
.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index f0cefb0d..41dff492 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -10,7 +10,7 @@ PR =3D "r20"
 QT_MKSPECS_LOCATION =3D "${libdir}"
 QT_MKSPECS_DIR =3D "linux-oe-g++"
=20
-toolchain_create_sdk_env_script_append() {
+toolchain_create_sdk_env_script:append() {
 	echo 'export PATH=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:=
$PATH' >> $script
 	echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
 	echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 0523ada7..b89f54c7 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -88,7 +88,7 @@ EOF
=20
 }
=20
-SDK_POSTPROCESS_COMMAND_prepend =3D "arago_sdk_fixup; "
+SDK_POSTPROCESS_COMMAND:prepend =3D "arago_sdk_fixup; "
=20
 arago_sdk_fixup () {
 	# Remove broken .la files
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/pack=
agegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
index 1498f70d..4d2a98ad 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-qte-toolchain-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-qte-toolchain-host.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
=20
 inherit packagegroup nativesdk
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     nativesdk-packagegroup-arago-tisdk-host \
     nativesdk-qtbase \
     nativesdk-qttools \
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroup=
s/nativesdk-packagegroup-arago-tisdk-host.bb
index 904f2577..859d9eab 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-tisdk-host.bb
@@ -24,7 +24,7 @@ EXTRA_TI_TOOLS =3D " \
     ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")=
} \
 "
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     nativesdk-packagegroup-sdk-host \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-waylan=
d-dev', '', d)} \
     nativesdk-python3-distutils \
@@ -34,6 +34,6 @@ RDEPENDS_${PN} =3D "\
     ${EXTRA_TI_TOOLS} \
 "
=20
-RDEPENDS_${PN}_remove =3D "\
+RDEPENDS:${PN}:remove =3D "\
     nativesdk-meson \
 "
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-ar=
ago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroup=
s/packagegroup-arago-qte-toolchain-target.bb
index f14877e0..e0fb9a1d 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte=
-toolchain-target.bb
@@ -7,7 +7,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-RDEPENDS_${PN} +=3D " \
+RDEPENDS:${PN} +=3D " \
         packagegroup-arago-standalone-sdk-target \
         libsqlite3-dev \
         qtbase-mkspecs \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-ar=
ago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegrou=
ps/packagegroup-arago-standalone-sdk-target.bb
index 936ed17c..9c5a2644 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-sta=
ndalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-sta=
ndalone-sdk-target.bb
@@ -6,7 +6,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     libgcc \
     libgcc-dev \
     libstdc++-dev \
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-s=
w-app-loader_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-app-lo=
ader/ti-pru-sw-app-loader_1.00.00.bb
index d531324b..8cbfc7a4 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-l=
oader_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-l=
oader_1.00.00.bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://interface/prussdrv.c;beginline=3D1;endline=3D=
47;md5=3D6012fea45c1fbced663277bc90d2163a"
=20
-RRECOMMENDS_${PN} =3D "kernel-module-uio-pru"
+RRECOMMENDS:${PN} =3D "kernel-module-uio-pru"
 PR =3D "r0"
-PV_append =3D "+svn${SRCPV}"
+PV:append =3D "+svn${SRCPV}"
=20
 COMPATIBLE_MACHINE =3D "omapl138"
=20
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru=
-sw-edma-library_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-ed=
ma-library/ti-pru-sw-edma-library_1.00.00.bb
index 6b6d5853..d41f4a66 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edm=
a-library_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edm=
a-library_1.00.00.bb
@@ -5,15 +5,15 @@ LIC_FILES_CHKSUM =3D "file://edma.c;beginline=3D1;endli=
ne=3D46;md5=3Df6bde95a8e2277050e3
=20
 DEPENDS +=3D "virtual/kernel"
=20
-RDEPENDS_${PN} +=3D "ti-pru-sw-edma-driver"
+RDEPENDS:${PN} +=3D "ti-pru-sw-edma-driver"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 COMPATIBLE_MACHINE =3D "omapl138"
=20
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR:append =3D "a"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV_append =3D "+svn${SRCPV}"
+PV:append =3D "+svn${SRCPV}"
=20
 SRC_URI =3D "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dh=
ttps;user=3Danonymous;pswd=3D''"
=20
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-=
examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/t=
i-pru-sw-examples_1.00.00.bb
index e7cb229b..6e602bf0 100644
--- a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-example=
s_1.00.00.bb
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-example=
s_1.00.00.bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dc4fd8ee7443c1b2b6238b4b5d=
f796481"
 DEPENDS =3D "ti-pru-sw-app-loader ti-pru-sw-edma-library"
-RDEPENDS_${PN} =3D "ti-pru-sw-edma-driver"
+RDEPENDS:${PN} =3D "ti-pru-sw-edma-driver"
 PR =3D "r0"
-PV_append =3D "+svn${SRCPV}"
+PV:append =3D "+svn${SRCPV}"
=20
 COMPATIBLE_MACHINE =3D "omapl138"
=20
@@ -27,5 +27,5 @@ do_install () {
         install -m 0755 ${S}/example_apps/bin/* ${D}/usr/share/ti/ti-pru=
-eg/
 }
=20
-FILES_${PN} +=3D "${datadir}/ti/ti-pru-eg/*"
-FILES_${PN}-dbg +=3D "${datadir}/ti/ti-pru-eg/.debug/*"
+FILES:${PN} +=3D "${datadir}/ti/ti-pru-eg/*"
+FILES:${PN}-dbg +=3D "${datadir}/ti/ti-pru-eg/.debug/*"
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules=
.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
index c12c0e27..da661a91 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -15,4 +15,4 @@ EXTRA_OECMAKE +=3D "-DBUILD_TESTING=3Doff"
=20
 inherit cmake
=20
-FILES_${PN}-dev +=3D "${datadir}/ECM"
+FILES:${PN}-dev +=3D "${datadir}/ECM"
diff --git a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb b/meta-ara=
go-extras/recipes-devtools/dt/dt_17.07.bb
index 22fd6acf..4ef15f60 100644
--- a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
+++ b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
@@ -19,7 +19,7 @@ do_compile() {
 	${MAKE} -f Makefile.linux
 }
=20
-SRC_URI_append_libc-uclibc =3D " file://no_aio.patch "
+SRC_URI:append:libc-uclibc =3D " file://no_aio.patch "
=20
 do_install() {
 	install -d ${D}${bindir}
diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1=
.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.1=
1.0.bb
index abcbbba5..92363915 100644
--- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.b=
b
+++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.b=
b
@@ -5,8 +5,8 @@ LICENSE =3D "Apache-2.0"
=20
 PACKAGE_BEFORE_PN =3D "${PN}-compiler"
=20
-RDEPENDS_${PN}-compiler =3D "${PN}"
-RDEPENDS_${PN}-dev +=3D "${PN}-compiler"
+RDEPENDS:${PN}-compiler =3D "${PN}"
+RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da873c5645c184d51e0f9b34e1=
d7cf559"
=20
@@ -29,6 +29,6 @@ inherit cmake
=20
 S =3D "${WORKDIR}/git"
=20
-FILES_${PN}-compiler =3D "${bindir}"
+FILES:${PN}-compiler =3D "${bindir}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1=
.0.bb b/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
index 6fbc8b60..18efcd53 100644
--- a/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
+++ b/meta-arago-extras/recipes-devtools/input-utils/input-utils_1.0.bb
@@ -8,7 +8,7 @@ PV =3D "1.0"
 PR =3D "r0"
=20
 SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/i/input-utils/inp=
ut-utils_1.0.orig.tar.gz"
-SRC_URI_append_arm =3D " file://0001-autoconf-fix-for-cross-compilation-=
for-ARM.patch"
+SRC_URI:append:arm =3D " file://0001-autoconf-fix-for-cross-compilation-=
for-ARM.patch"
=20
 SRC_URI[md5sum] =3D "3e58772e8647093b1de2f2c90bfb9ee8"
 SRC_URI[sha256sum] =3D "ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc5=
5a349b3bff4e3b13"
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.=
bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index e9431796..f3fcdad3 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -1,5 +1,5 @@
-FILESEXTRAPATHS_prepend :=3D "${COREBASE}/meta/recipes-extended/ltp/ltp:=
"
-FILESEXTRAPATHS_prepend :=3D "${ARAGOBASE}/meta-arago-extras/recipes-ext=
ended/ltp/ltp:"
+FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/recipes-extended/ltp/ltp:=
"
+FILESEXTRAPATHS:prepend :=3D "${ARAGOBASE}/meta-arago-extras/recipes-ext=
ended/ltp/ltp:"
=20
 require recipes-extended/ltp/ltp_${PV}.bb
=20
@@ -12,24 +12,24 @@ DEPENDS +=3D "alsa-lib"
=20
 PE =3D "1"
 PR =3D "r5"
-PV_append =3D "+git${SRCPV}"
+PV:append =3D "+git${SRCPV}"
=20
 SRCREV =3D "cfff0a2c889f29c03b9a3ee547a147b1c6727e2c"
 BRANCH ?=3D "master"
=20
-SRC_URI_remove =3D "git://github.com/linux-test-project/ltp.git;protocol=
=3Dhttps;branch=3Dmaster"
-SRC_URI_prepend =3D "git://git.ti.com/test-automation/ltp-ddt.git;branch=
=3D${BRANCH} "
+SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;protocol=
=3Dhttps;branch=3Dmaster"
+SRC_URI:prepend =3D "git://git.ti.com/test-automation/ltp-ddt.git;branch=
=3D${BRANCH} "
=20
 export prefix =3D "/opt/ltp"
 export exec_prefix =3D "/opt/ltp"
=20
-EXTRA_OEMAKE_append =3D " \
+EXTRA_OEMAKE:append =3D " \
     KERNEL_USR_INC=3D${STAGING_INCDIR} \
     ALSA_INCPATH=3D${STAGING_INCDIR} \
     ALSA_LIBPATH=3D${STAGING_LIBDIR} \
 "
=20
-RDEPENDS_${PN} +=3D "\
+RDEPENDS:${PN} +=3D "\
     acl \
     at \
     pm-qa \
@@ -37,7 +37,7 @@ RDEPENDS_${PN} +=3D "\
     memtester \
 "
=20
-do_install_prepend() {
+do_install:prepend() {
 	# Upstream ltp recipe wants to remove this test case in do_install
 	install -d ${D}${prefix}/runtest/
 	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
diff --git a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappen=
d b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
index aadca84b..aec6a1ac 100644
--- a/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
+++ b/meta-arago-extras/recipes-devtools/mtd/mtd-utils_git.bbappend
@@ -1,14 +1,14 @@
-PR_append =3D ".arago1"
+PR:append =3D ".arago1"
=20
 BBCLASSEXTEND +=3D "nativesdk"
=20
 EXTRA_OEMAKE =3D "'CC=3D${CC} ${CFLAGS} ${@bb.utils.contains('PACKAGECON=
FIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'RANLIB=3D${RAN=
LIB}' 'AR=3D${AR}' 'BUILDDIR=3D${S}'"
=20
-do_compile_append() {
+do_compile:append() {
 	oe_runmake tests
 }
=20
-do_install_append() {
+do_install:append() {
 	install -m 0755 io_update ${D}${sbindir}/
 	install -m 0755 volrefcnt ${D}${sbindir}/
 	install -m 0755 integ ${D}${sbindir}/
@@ -25,7 +25,7 @@ do_install_append() {
=20
 PACKAGES =3D+ "mtd-utils-ubifs-tests"
=20
-FILES_mtd-utils-ubifs-tests =3D " \
+FILES:mtd-utils-ubifs-tests =3D " \
 ${sbindir}/io_update \
 ${sbindir}/volrefcnt \
 ${sbindir}/integ \
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion=
.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
index 6055507c..df0b1440 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -13,5 +13,5 @@ do_install() {
                     ${D}${datadir}/bash-completion/completions/opkg
 }
=20
-FILES_${PN} =3D "${datadir}/bash-completion/completions/opkg"
-RDEPENDS_${PN} =3D "bash-completion"
+FILES:${PN} =3D "${datadir}/bash-completion/completions/opkg"
+RDEPENDS:${PN} =3D "bash-completion"
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-uti=
lity_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pi=
nmux-utility_1.0.1076.3.bb
index 81c8a805..2dfb731d 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.=
0.1076.3.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.=
0.1076.3.bb
@@ -31,4 +31,4 @@ do_install() {
     cp -rf ${S}/configurations ${D}/${installdir}/
 }
=20
-FILES_${PN} +=3D "${installdir}/*"
+FILES:${PN} +=3D "${installdir}/*"
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-uti=
lity_2.5.2.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmu=
x-utility_2.5.2.0.bb
index 9d770751..c924e8de 100644
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
+++ b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.=
5.2.0.bb
@@ -21,4 +21,4 @@ do_install() {
     install ${S}/Release_Notes.txt ${D}/${installdir}
 }
=20
-FILES_${PN} +=3D "${installdir}/*"
+FILES:${PN} +=3D "${installdir}/*"
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta=
-arago-extras/recipes-devtools/statcol/statcol.bb
index 41c18501..ee2b12d2 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -9,7 +9,7 @@ SRCREV =3D "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
 SRC_URI =3D "git://git.ti.com/glsdk/statcol.git;protocol=3D${PROTOCOL};b=
ranch=3D${BRANCH}"
=20
 DEPENDS =3D "ti-rpmsg-char websocketd"
-RDEPENDS_${PN} =3D "bash"
+RDEPENDS:${PN} =3D "bash"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -19,6 +19,6 @@ do_install() {
 	DESTDIR=3D${D} make install
 }
=20
-PR_append =3D "_3"
+PR:append =3D "_3"
=20
-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-s=
cripts.bb b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-sc=
ripts.bb
index 9dd2cd39..49337130 100644
--- a/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
+++ b/meta-arago-extras/recipes-devtools/util-scripts/glsdk-util-scripts.=
bb
@@ -5,7 +5,7 @@ PR =3D "r1"
=20
 COMPATIBLE_MACHINE =3D "omap-a15|j7"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-RDEPENDS_${PN} +=3D "bash"
+RDEPENDS:${PN} +=3D "bash"
=20
 SRC_URI =3D "git://git.ti.com/glsdk/util-scripts.git"
=20
@@ -28,4 +28,4 @@ do_install() {
=20
 }
=20
-FILES_${PN} +=3D "${datadir}/ti/util-scripts/*"
+FILES:${PN} +=3D "${datadir}/ti/util-scripts/*"
diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4=
.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 39e180d5..2ec6a19a 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -15,4 +15,4 @@ SRCREV =3D "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
 export http_proxy
=20
 # Development package contains all the examples in different languages
-INSANE_SKIP_${PN}-dev =3D "file-rdeps"
+INSANE_SKIP:${PN}-dev =3D "file-rdeps"
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb b/met=
a-arago-extras/recipes-extended/ltp/ltp_20200120.bb
index 6633755a..0ecfcc9e 100644
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb
@@ -15,18 +15,18 @@ LIC_FILES_CHKSUM =3D "\
 "
=20
 DEPENDS =3D "attr libaio libcap acl openssl zip-native"
-DEPENDS_append_libc-musl =3D " fts "
-EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
-EXTRA_OECONF_append_libc-musl =3D " LIBS=3D-lfts "
+DEPENDS:append:libc-musl =3D " fts "
+EXTRA_OEMAKE:append:libc-musl =3D " LIBC=3Dmusl "
+EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
=20
 # since ltp contains x86-64 assembler which uses the frame-pointer regis=
ter,
 # set -fomit-frame-pointer x86-64 to handle cases where optimisation
 # is set to -O0 or frame pointers have been enabled by -fno-omit-frame-p=
ointer
 # earlier in CFLAGS, etc.
-CFLAGS_append_x86-64 =3D " -fomit-frame-pointer"
+CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
=20
-CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
-CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
+CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
+CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
 SRCREV =3D "4079aaf264d0e9ead042b59d1c5f4e643620d0d5"
=20
 SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
@@ -80,7 +80,7 @@ do_install(){
     sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
 }
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     attr \
     bash \
     bc \
@@ -109,14 +109,14 @@ RDEPENDS_${PN} =3D "\
     tar \
 "
=20
-FILES_${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_gro=
ups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}=
/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testc=
ases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_te=
stsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/function=
al/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcas=
es/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuit=
e/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/tes=
tcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
+FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_gro=
ups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}=
/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testc=
ases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_te=
stsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/function=
al/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcas=
es/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuit=
e/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/tes=
tcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
=20
 # Avoid stripping some generated binaries otherwise some of the ltp test=
s such as ldd01 & nm01 fail
 INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/=
testcases/bin/ldd01"
-INSANE_SKIP_${PN} +=3D "already-stripped staticdev"
+INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
=20
 # Avoid file dependency scans, as LTP checks for things that may or may =
not
 # exist on the running system.  For instance it has specific checks for
 # csh and ksh which are not typically part of OpenEmbedded systems (but
 # can be added via additional layers.)
-SKIP_FILEDEPS_${PN} =3D '1'
+SKIP_FILEDEPS:${PN} =3D '1'
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb b/met=
a-arago-extras/recipes-extended/ltp/ltp_20210524.bb
index 4cc97421..2836f1bc 100644
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
@@ -15,18 +15,18 @@ LIC_FILES_CHKSUM =3D "\
 "
=20
 DEPENDS =3D "attr libaio libcap acl openssl zip-native"
-DEPENDS_append_libc-musl =3D " fts "
-EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
-EXTRA_OECONF_append_libc-musl =3D " LIBS=3D-lfts "
+DEPENDS:append:libc-musl =3D " fts "
+EXTRA_OEMAKE:append:libc-musl =3D " LIBC=3Dmusl "
+EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
=20
 # since ltp contains x86-64 assembler which uses the frame-pointer regis=
ter,
 # set -fomit-frame-pointer x86-64 to handle cases where optimisation
 # is set to -O0 or frame pointers have been enabled by -fno-omit-frame-p=
ointer
 # earlier in CFLAGS, etc.
-CFLAGS_append_x86-64 =3D " -fomit-frame-pointer"
+CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
=20
-CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
-CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
+CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
+CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
 SRCREV =3D "0fb171f2beddaf64bd27597577c206c0f892b3cd"
=20
 SRC_URI =3D "git://github.com/linux-test-project/ltp.git;protocol=3Dhttp=
s;branch=3Dmaster \
@@ -75,7 +75,7 @@ do_install(){
     sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
 }
=20
-RDEPENDS_${PN} =3D "\
+RDEPENDS:${PN} =3D "\
     attr \
     bash \
     bc \
@@ -105,11 +105,11 @@ RDEPENDS_${PN} =3D "\
     tar \
 "
=20
-FILES_${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_gro=
ups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}=
/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testc=
ases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_te=
stsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/function=
al/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcas=
es/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuit=
e/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/tes=
tcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
+FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_gro=
ups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}=
/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testc=
ases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_te=
stsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/function=
al/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcas=
es/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuit=
e/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/tes=
tcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
=20
 # Avoid stripping some generated binaries otherwise some of the ltp test=
s such as ldd01 & nm01 fail
 INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/=
testcases/bin/ldd01"
-INSANE_SKIP_${PN} +=3D "already-stripped staticdev"
+INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
=20
 remove_broken_musl_sources() {
 	[ "${TCLIBC}" =3D "musl" ] || return 0
@@ -135,5 +135,5 @@ do_patch[postfuncs] +=3D "remove_broken_musl_sources"
 # exist on the running system.  For instance it has specific checks for
 # csh and ksh which are not typically part of OpenEmbedded systems (but
 # can be added via additional layers.)
-SKIP_FILEDEPS_${PN} =3D '1'
+SKIP_FILEDEPS:${PN} =3D '1'
=20
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb b/meta-a=
rago-extras/recipes-graphics/glfw/glfw_git.bb
index c4ff59fe..0e83979f 100644
--- a/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
+++ b/meta-arago-extras/recipes-graphics/glfw/glfw_git.bb
@@ -21,4 +21,4 @@ inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "-DGLFW_USE_WAYLAND=3DON -DGLFW_BUILD_EXAMPLES=3DOFF =
-DGLFW_BUILD_TESTS=3DOFF"
=20
-FILES_${PN}-dev +=3D "${libdir}/cmake"
+FILES:${PN}-dev +=3D "${libdir}/cmake"
diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-=
example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/g=
lsdk-example-apps.bb
index 3e2452f4..a11d8192 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example=
-apps.bb
@@ -18,7 +18,7 @@ SRCREV=3D"52466430609c402a9f1c0667ccf727d096336d0d"
=20
 PR =3D "r52"
=20
-do_install_append () {
+do_install:append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
     install -m 0644 ${S}/bandwidth-tool/config.ini ${D}${sysconfdir}/gls=
dkstatcoll/.
     install -m 0644 ${S}/bandwidth-tool/initiators.cfg ${D}${sysconfdir}=
/glsdkstatcoll/.
@@ -28,6 +28,6 @@ do_install_append () {
     install -m 0644 ${S}/cpuload-plugins/scripts/*.cfg ${D}${sysconfdir}=
/visualization_scripts/.
 }
=20
-FILES_${PN} +=3D "${sysconfdir}/glsdkstatcoll/* ${sysconfdir}/visualizat=
ion_scripts/*"
+FILES:${PN} +=3D "${sysconfdir}/glsdkstatcoll/* ${sysconfdir}/visualizat=
ion_scripts/*"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3=
.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.=
2.bb
index 6c9953d0..d855d191 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -15,7 +15,7 @@ COMPATIBLE_MACHINE =3D "omap-a15|ti43x|ti33x|k3"
=20
 S =3D "${WORKDIR}/git"
 SRC_DIR =3D "arm"
-SRC_DIR_k3 =3D "arm64"
+SRC_DIR:k3 =3D "arm64"
=20
 do_install () {
     CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
@@ -49,7 +49,7 @@ do_install () {
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/DRM/OGLES2=
FilmTV ${D}${bindir}/SGX/demos/DRM/
 }
=20
-do_install_append_j7 () {
+do_install:append:j7 () {
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESDeferredShading ${D}${bindir}/SGX/demos/Wayland/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESGaussianBlur ${D}${bindir}/SGX/demos/Wayland/
     install -m 755 ${S}/targetfs/${SRC_DIR}/Examples/Advanced/Wayland/Op=
enGLESImageBasedLighting ${D}${bindir}/SGX/demos/Wayland/
@@ -72,12 +72,12 @@ do_install_append_j7 () {
 }
=20
=20
-RDEPENDS_${PN} =3D "libegl"
+RDEPENDS:${PN} =3D "libegl"
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
=20
-INSANE_SKIP_${PN} +=3D "dev-so staticdev already-stripped ldflags file-r=
deps"
+INSANE_SKIP:${PN} +=3D "dev-so staticdev already-stripped ldflags file-r=
deps"
=20
-FILES_${PN} +=3D " \
+FILES:${PN} +=3D " \
     /opt/img-powervr-sdk/* \
 "
diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta=
-arago-extras/recipes-graphics/kms++/kms++_git.bb
index b10aa5dd..519b8299 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -18,14 +18,14 @@ DEPENDS =3D "drm fmt"
=20
 PACKAGES =3D+ "${PN}-python"
=20
-RDEPENDS_${PN}-python +=3D "python3-core"
+RDEPENDS:${PN}-python +=3D "python3-core"
=20
-FILES_${PN}-python +=3D "${libdir}/python*/site-packages"
+FILES:${PN}-python +=3D "${libdir}/python*/site-packages"
=20
 S =3D "${WORKDIR}/git"
=20
 inherit python3native meson update-alternatives
=20
 ALTERNATIVE_PRIORITY =3D "100"
-ALTERNATIVE_${PN} =3D "kmstest"
+ALTERNATIVE:${PN} =3D "kmstest"
 ALTERNATIVE_LINK_NAME[kmstest] =3D "${bindir}/kmstest"
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-t=
ests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-=
gc320-tests_5.0.11.p7.bb
index 9138f27f..e84195ff 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.=
0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.=
0.11.p7.bb
@@ -32,5 +32,5 @@ do_install() {
 	done
 }
=20
-INSANE_SKIP_${PN} +=3D "ldflags already-stripped libdir"
-INSANE_SKIP_${PN}-dbg +=3D "libdir"
+INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir"
+INSANE_SKIP:${PN}-dbg +=3D "libdir"
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1=
.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index 747a9ef9..1f66158b 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -1,7 +1,7 @@
 # This recipe installs an init script that can be used to invoke ts_cali=
brate
 # on systems that need this done during the boot sequence.
 DESCRIPTION =3D "TS calibration init script"
-RDEPENDS_${PN} +=3D "tslib"
+RDEPENDS:${PN} +=3D "tslib"
=20
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://init;beginline=3D2;endline=3D11;md5=3D4b2e3=
b15f01cf63d2cb7988afdcc6c60"
diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols=
_%.bbappend b/meta-arago-extras/recipes-graphics/wayland/wayland-protocol=
s_%.bbappend
index c7803c38..332e9c97 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbap=
pend
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland-protocols_%.bbap=
pend
@@ -1,13 +1,13 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PR_append =3D ".arago2"
+PR:append =3D ".arago2"
=20
 SRC_URI +=3D " \
     file://0001-wayland-drm-Add-wayland-drm-protocol-to-stable.patch \
     file://0002-wayland-drm-Update-to-version-2.patch \
 "
=20
-do_install_append() {
+do_install:append() {
 	install -d ${D}${datadir}/wayland-protocols/stable/wayland-drm
 	cp ${S}/stable/wayland-drm/wayland-drm.xml ${D}${datadir}/wayland-proto=
cols/stable/wayland-drm/
 }
diff --git a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4=
.1.bb b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
index f801cf08..c9151c03 100644
--- a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
+++ b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
@@ -21,4 +21,4 @@ do_install () {
 	install -m 0755 ${S}/Documentation/networking/timestamping/timestamping=
 ${D}${bindir}
 }
=20
-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av=
-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk=
-av-files_1.4.bb
index c1caa980..2d9f41b0 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_=
1.4.bb
@@ -9,14 +9,14 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 VIDEO_FILES =3D "video_480p "
=20
-VIDEO_FILES_append_ti33x       =3D "video_wvga \
+VIDEO_FILES:append:ti33x       =3D "video_wvga \
                                   video_wqvga"
-VIDEO_FILES_append_ti43x       =3D "video_wqvga"
-VIDEO_FILES_append_dra7xx      =3D "video_wvga \
+VIDEO_FILES:append:ti43x       =3D "video_wqvga"
+VIDEO_FILES:append:dra7xx      =3D "video_wvga \
                                   video_1080p \
                                   video_720p \
                                   video_yuv"
-VIDEO_FILES_append_k3          =3D "video_720p"
+VIDEO_FILES:append:k3          =3D "video_720p"
=20
 BRANCH =3D "master"
=20
@@ -39,4 +39,4 @@ do_install() {
     done
 }
=20
-FILES_${PN} +=3D "${datadir}/ti/*"
+FILES:${PN} +=3D "${datadir}/ti/*"
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-c=
amera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo=
/dual-camera-demo_1.0.bb
index eaa52a7b..f2fff127 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-d=
emo_1.0.bb
@@ -37,11 +37,11 @@ do_install() {
=20
 PACKAGES +=3D "matrix-gui-apps-dual-camera"
=20
-RDEPENDS_${PN} +=3D "libdrm libdrm-omap"
+RDEPENDS:${PN} +=3D "libdrm libdrm-omap"
=20
-RDEPENDS_matrix-gui-apps-dual-camera  =3D "matrix-gui-apps-images matrix=
-gui-submenus-camera ${PN}"
+RDEPENDS:matrix-gui-apps-dual-camera  =3D "matrix-gui-apps-images matrix=
-gui-submenus-camera ${PN}"
=20
 # Add the matrix directory to the FILES
-FILES_${PN} =3D "/usr/bin/*"
+FILES:${PN} =3D "/usr/bin/*"
=20
-FILES_matrix-gui-apps-dual-camera =3D "${MATRIX_APP_DIR}/*"
+FILES:matrix-gui-apps-dual-camera =3D "${MATRIX_APP_DIR}/*"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-dsp66_git.bb b/meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-dsp66_git.bb
index 4f7f73e5..c9505652 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-dsp66_git.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES =3D "opencl"
=20
 PR =3D "r1"
=20
-RDEPENDS_${PN} +=3D "opencl-runtime"
+RDEPENDS:${PN} +=3D "opencl-runtime"
=20
 EXTRA_OEMAKE =3D " TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
                  TI_OCL_CGT_INSTALL=3D${STAGING_DIR_NATIVE}/usr/share/ti=
/cgt-c6x \
@@ -38,13 +38,13 @@ do_configure() {
 EXTRA_OECONF +=3D "--enable-maintainer-mode"
 EXTRA_OEMAKE +=3D "'ERROR_CFLAGS=3D-Wno-deprecated-declarations'"
=20
-FILES_${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
-FILES_${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
+FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
+FILES:${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
+FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
=20
-FILES_${PN} +=3D "${libdir}/*.so"
-FILES_${PN}-dbg +=3D "${libdir}/.debug"
-FILES_${PN}-dev +=3D "${libdir}/*.la"
+FILES:${PN} +=3D "${libdir}/*.so"
+FILES:${PN}-dbg +=3D "${libdir}/.debug"
+FILES:${PN}-dev +=3D "${libdir}/*.la"
 FILES_SOLIBSDEV =3D ""
=20
-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plu=
gins-ti/gstreamer1.0-plugins-ducati_git.bb
index ccf0fd55..e45de0dd 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ducati_git.bb
@@ -18,4 +18,4 @@ SRC_URI =3D " \
     file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.pat=
ch \
 "
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugi=
ns-ti/gstreamer1.0-plugins-hevc_git.bb
index 78dd4d3c..33537f6e 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-hevc_git.bb
@@ -27,8 +27,8 @@ EXTRA_OECONF +=3D "--enable-maintainer-mode"
 EXTRA_OEMAKE +=3D "'ERROR_CFLAGS=3D-Wno-deprecated-declarations'"
 CFLAGS +=3D "-fcommon"
=20
-FILES_${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
-FILES_${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
+FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
+FILES:${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
+FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
=20
-INSANE_SKIP_${PN} =3D "textrel"
+INSANE_SKIP:${PN} =3D "textrel"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-ti.inc b/meta-arago-extras/recipes-multimedia/gst-plugins-ti=
/gstreamer1.0-plugins-ti.inc
index 2a1fa06b..d29fb87e 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ti.inc
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-ti.inc
@@ -20,6 +20,6 @@ do_configure() {
 EXTRA_OECONF +=3D "--enable-maintainer-mode"
 EXTRA_OEMAKE +=3D "'ERROR_CFLAGS=3D-Wno-deprecated-declarations'"
=20
-FILES_${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
-FILES_${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
+FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
+FILES:${PN}-dbg +=3D "${libdir}/gstreamer-1.0/.debug"
+FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 64929729..5975b92e 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.16.%.bbappend
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PACKAGECONFIG_append =3D " faad kms"
+PACKAGECONFIG:append =3D " faad kms"
=20
 GSTDRM_WAYLANDSINK_PATCHES =3D " \
     file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
@@ -12,30 +12,30 @@ GSTDRM_WAYLANDSINK_PATCHES =3D " \
     file://0001-gstdrm-Remove-wayland-as-required-dependency.patch \
 "
=20
-SRC_URI_append_ti43x =3D " \
+SRC_URI:append:ti43x =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
-SRC_URI_append_ti33x =3D " \
+SRC_URI:append:ti33x =3D " \
     file://0001-waylandsink-Add-mouse-drag-and-drop-support.patch \
 "
=20
-SRC_URI_append_omap-a15 =3D " \
+SRC_URI:append:omap-a15 =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
-SRC_URI_append_am65xx =3D " \
+SRC_URI:append:am65xx =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
-SRC_URI_append_j7-evm =3D " \
+SRC_URI:append:j7-evm =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
-SRC_URI_append_j7-hs-evm =3D " \
+SRC_URI:append:j7-hs-evm =3D " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-PR_append =3D ".arago4"
+PR:append =3D ".arago4"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-good_1.18.%.bbappend b/meta-arago-extras/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-good_1.18.%.bbappend
index 4864f4b8..fdb5b63f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.18.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-good_1.18.%.bbappend
@@ -1,6 +1,6 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-PACKAGECONFIG_append =3D " qt5"
+PACKAGECONFIG:append =3D " qt5"
=20
 SRC_URI +=3D " \
     file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
@@ -9,4 +9,4 @@ SRC_URI +=3D " \
     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch=
 \
 "
=20
-PR_append =3D ".arago3"
+PR:append =3D ".arago3"
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-a=
rm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder=
/hevc-arm-decoder_git.bb
index 9a262311..997ed451 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-deco=
der_git.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-deco=
der_git.bb
@@ -46,8 +46,8 @@ do_install() {
     done
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/*  \
 "
=20
-INSANE_SKIP_${PN} +=3D "ldflags"
+INSANE_SKIP:${PN} +=3D "ldflags"
diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/=
meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
index 59372b05..12ac1b51 100644
--- a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
@@ -30,5 +30,5 @@ do_install() {
     cp -R --no-dereference --preserve=3Dmode,links ${S}/* ${D}${datadir}=
/examples/webengine/webbrowser/.
 }
=20
-FILES_${PN} +=3D  "${bindir}/qtwebbrowser"
-FILES_${PN}-examples +=3D  "${datadir}/examples/webengine/webbrowser/*"
+FILES:${PN} +=3D  "${bindir}/qtwebbrowser"
+FILES:${PN}-examples +=3D  "${datadir}/examples/webengine/webbrowser/*"
diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-co=
mpute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-libr=
ary/arm-compute-library_git.bb
index 07e91e00..3612f7b9 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
@@ -18,7 +18,7 @@ SRCREV =3D "35c3eb011d8e2813d83c6a6cbe28a446534e4a14"
=20
 S =3D "${WORKDIR}/git"
=20
-do_compile_prepend() {
+do_compile:prepend() {
     sed -i 's/arm-linux-gnueabihf-/${TOOLCHAIN_SYS}-/' SConstruct
     sed -i 's/aarch64-linux-gnu-/${TOOLCHAIN_SYS}-/' SConstruct
     sed -i "s#env.Append(LINKFLAGS =3D \['-fopenmp'\])#env.Append(LINKFL=
AGS =3D \['-fopenmp','--sysroot=3D${STAGING_DIR_TARGET}'\])#" SConstruct
@@ -28,7 +28,7 @@ do_compile_prepend() {
 inherit scons
=20
 EXTRA_OESCONS =3D "arch=3Darmv7a extra_cxx_flags=3D"-fPIC -Wno-unused-bu=
t-set-variable -Wno-ignored-qualifiers -Wno-noexcept ${TOOLCHAIN_OPTIONS}=
" benchmark_tests=3D1 validation_tests=3D0 neon=3D1 openmp=3D1 opencl=3D0=
 set_soname=3D1"
-EXTRA_OESCONS_aarch64 =3D "arch=3Darm64-v8a extra_cxx_flags=3D"-fPIC -Wn=
o-unused-but-set-variable -Wno-ignored-qualifiers -Wno-noexcept ${TOOLCHA=
IN_OPTIONS}" benchmark_tests=3D1 validation_tests=3D0 neon=3D1 openmp=3D1=
 opencl=3D0 set_soname=3D1"
+EXTRA_OESCONS:aarch64 =3D "arch=3Darm64-v8a extra_cxx_flags=3D"-fPIC -Wn=
o-unused-but-set-variable -Wno-ignored-qualifiers -Wno-noexcept ${TOOLCHA=
IN_OPTIONS}" benchmark_tests=3D1 validation_tests=3D0 neon=3D1 openmp=3D1=
 opencl=3D0 set_soname=3D1"
=20
 LIBS +=3D "-larmpl_lp64_mp"
=20
@@ -53,9 +53,9 @@ do_install() {
     cp $CP_ARGS ${S}/support ${D}${datadir}/${BPN}/.
 }
=20
-INSANE_SKIP_${PN} =3D "ldflags"
-INSANE_SKIP_${PN}-dev =3D "dev-elf ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
+INSANE_SKIP:${PN}-dev =3D "dev-elf ldflags"
=20
-FILES_${PN}-source =3D "${datadir}/${BPN}"
-INSANE_SKIP_${PN}-source =3D "ldflags libdir staticdev"
+FILES:${PN}-source =3D "${datadir}/${BPN}"
+INSANE_SKIP:${PN}-source =3D "ldflags libdir staticdev"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb =
b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
index 21d59b0e..083eaf39 100644
--- a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -41,4 +41,4 @@ do_install() {
     install -m 644 ${S}/CCIEF-BASIC_Slave/sample/SlaveParameter.csv ${D}=
${datadir}/cclink
 }
=20
-FILES_${PN} +=3D "${datadir}/cclink"
+FILES:${PN} +=3D "${datadir}/cclink"
diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend b=
/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
index 281b76a1..f282b247 100644
--- a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
+++ b/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 SRC_URI +=3D " \
 file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/met=
a-arago-extras/recipes-support/mstpctl/mstpd_git.bb
index 02d49314..f4a3c248 100644
--- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -13,12 +13,12 @@ SRCREV =3D "e4f0ba5a48649a3253f8b353c87c965e12aafc50"
 S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "python3"
-RDEPENDS_${PN} =3D "python3-core"
+RDEPENDS:${PN} =3D "python3-core"
=20
 inherit autotools
=20
 EXTRA_OECONF =3D "--sbindir=3D/sbin"
=20
-do_configure_prepend() {
+do_configure:prepend() {
 	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifq=
uery
 }
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow=
-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/ten=
sorflow-lite-demo_git.bb
index c45acf4f..c1e47def 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-d=
emo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-d=
emo_git.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8927f3331d2=
b3e321b7dd1925166d25"
 inherit features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opencv"
-REQUIRED_DISTRO_FEATURES_append_dra7xx =3D " opencl"
+REQUIRED_DISTRO_FEATURES:append:dra7xx =3D " opencl"
=20
 DEPENDS =3D "tensorflow-lite flatbuffers opencv"
-DEPENDS_append_dra7xx =3D " tidl-api"
+DEPENDS:append:dra7xx =3D " tidl-api"
=20
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -46,7 +46,7 @@ EXTRA_OEMAKE +=3D "SYSROOT_INCDIR=3D"${STAGING_INCDIR}"=
 SYSROOT_LIBDIR=3D"${STAGING_LI
                  TIDL_API_DIR=3D"${STAGING_DATADIR}/ti/tidl""
=20
 TIDL =3D "no"
-TIDL_dra7xx =3D "yes"
+TIDL:dra7xx =3D "yes"
 do_compile() {
     oe_runmake -f Makefile TIDL_ACC=3D${TIDL}
 }
@@ -61,4 +61,4 @@ do_install() {
     install -m 0755 ${S}/scripts/run*.sh ${D}${datadir}/tensorflow-lite/=
demos
 }
=20
-FILES_${PN} =3D "${datadir}/tensorflow-lite/demos"
+FILES:${PN} =3D "${datadir}/tensorflow-lite/demos"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow=
-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorf=
low-lite_1.15.bb
index e9739d83..defb6447 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1=
.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1=
.15.bb
@@ -32,15 +32,15 @@ PR =3D "r5"
 S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "zlib"
-TARGET_CFLAGS_remove =3D "-O2"
-TARGET_CPPFLAGS_remove =3D "-O2"
-TARGET_CXXFLAGS_remove =3D "-O2"
-CFLAGS_append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALL=
BACK \
+TARGET_CFLAGS:remove =3D "-O2"
+TARGET_CPPFLAGS:remove =3D "-O2"
+TARGET_CXXFLAGS:remove =3D "-O2"
+CFLAGS:append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALL=
BACK \
     -I${STAGING_INCDIR}"
-CPPFLAGS_append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FA=
LLBACK \
+CPPFLAGS:append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FA=
LLBACK \
     -I${STAGING_INCDIR}"
-LDFLAGS_remove =3D "-Wl,-O1"
-CXXFLAGS_append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FA=
LLBACK \
+LDFLAGS:remove =3D "-Wl,-O1"
+CXXFLAGS:append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FA=
LLBACK \
     -I${STAGING_INCDIR}"
 LIBS =3D "-lstdc++ -lpthread -lm -lz -ldl -lrt"
 BUILD_DEPS_DOWNLOAD_DIR_PREFIX =3D "${S}/tensorflow/lite/tools/make/down=
loads/"
diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb b/meta-ara=
go-extras/recipes-ti/fftlib/fftlib_git.bb
index e0d758d3..3f7ea874 100644
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib_git.bb
@@ -17,7 +17,7 @@ DEPENDS =3D "common-csl-ip-rtos libarch ti-xdctools-nat=
ive doxygen-native ti-cgt6x
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
=20
-TARGET_dra7xx =3D "SOC_AM572x"
+TARGET:dra7xx =3D "SOC_AM572x"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git"
@@ -96,8 +96,8 @@ do_install() {
=20
 }
=20
-FILES_${PN}-dev +=3D "${FFTLIB_INSTALL_DIR_RECIPE}"
+FILES:${PN}-dev +=3D "${FFTLIB_INSTALL_DIR_RECIPE}"
=20
 # skip checking binary against ARM architecture
-INSANE_SKIP_${PN}-dev =3D "arch"
-ALLOW_EMPTY_${PN} =3D "1"
+INSANE_SKIP:${PN}-dev =3D "arch"
+ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb =
b/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
index 130504b4..9e3347cb 100644
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw-examples_git.bb
@@ -10,7 +10,7 @@ PR =3D "${INC_PR}.0"
=20
 DEPENDS =3D "ti-fftw"
=20
-RDEPENDS_${PN} +=3D "ti-fftw-staticdev"
+RDEPENDS:${PN} +=3D "ti-fftw-staticdev"
=20
 S =3D "${WORKDIR}/git/ti/fftw/examples"
=20
@@ -21,5 +21,5 @@ do_install() {
     cp -r ./* ${D}${datadir}/ti/examples/fftw
 }
=20
-FILES_${PN} =3D "${datadir}/ti/examples/fftw"
-INSANE_SKIP_${PN} =3D "ldflags"
+FILES:${PN} =3D "${datadir}/ti/examples/fftw"
+INSANE_SKIP:${PN} =3D "ldflags"
diff --git a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb b/meta-ar=
ago-extras/recipes-ti/fftlib/ti-fftw_git.bb
index 5cb4e5df..70d5e0c3 100644
--- a/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
+++ b/meta-arago-extras/recipes-ti/fftlib/ti-fftw_git.bb
@@ -16,10 +16,10 @@ PR =3D "${INC_PR}.0"
=20
 DEPENDS =3D "common-csl-ip-rtos common-csl-ip ti-xdctools-native ti-sysb=
ios ti-cgt6x-native ti-xdais libulm fftlib dsplib-c66x opencl clocl-nativ=
e libarch"
=20
-RDEPENDS_${PN} +=3D "opencl-runtime"
+RDEPENDS:${PN} +=3D "opencl-runtime"
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
-TARGET_dra7xx =3D "SOC_AM572x"
+TARGET:dra7xx =3D "SOC_AM572x"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/ti/fftw"
@@ -58,6 +58,6 @@ do_install() {
     rm -rf ${D}${datadir}/ti
 }
=20
-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
=20
-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb=
 b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
index 8ea5b656..f7b893f7 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
@@ -5,7 +5,7 @@ include libarch.inc
 PR =3D "${INC_PR}.0"
=20
 DEPENDS +=3D "libarch clocl-native"
-RDEPENDS_${PN} +=3D "opencl-runtime"
+RDEPENDS:${PN} +=3D "opencl-runtime"
=20
 export LIBARCH_DIR    =3D "${LIBARCH_INSTALL_DIR}"
 export TARGET_ROOTDIR =3D "${STAGING_DIR_TARGET}"
@@ -27,10 +27,10 @@ do_install() {
     cp examples/Makefile ${D}${datadir}/ti/examples/libarch
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/examples/libarch/* \ "
=20
-FILES_${PN}-dbg +=3D "\
+FILES:${PN}-dbg +=3D "\
     ${datadir}/ti/examples/libarch/*/.debug \ "
=20
-INSANE_SKIP_${PN} =3D "arch ldflags textrel"
+INSANE_SKIP:${PN} =3D "arch ldflags textrel"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arag=
o-extras/recipes-ti/libarch/libarch.inc
index ee3bc747..1985a6b4 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -33,4 +33,4 @@ export XDAIS_DIR =3D "${XDAIS_INSTALL_DIR}"
 export FC_DIR =3D "${FC_INSTALL_DIR}"
 export PDK_DIR =3D "${PDK_INSTALL_DIR}"
=20
-TARGET_dra7xx =3D "SOC_AM572x"
+TARGET:dra7xx =3D "SOC_AM572x"
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb b/meta-a=
rago-extras/recipes-ti/libarch/libarch_git.bb
index f125c4ac..4151e1c4 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
+++ b/meta-arago-extras/recipes-ti/libarch/libarch_git.bb
@@ -13,8 +13,8 @@ do_install() {
     cp -r exports/libarch_*/* ${D}${LIBARCH_INSTALL_DIR_RECIPE}
 }
=20
-FILES_${PN}-dev +=3D "${LIBARCH_INSTALL_DIR_RECIPE}"
+FILES:${PN}-dev +=3D "${LIBARCH_INSTALL_DIR_RECIPE}"
=20
 # skip checking binary against ARM architecture
-INSANE_SKIP_${PN}-dev =3D "arch"
-ALLOW_EMPTY_${PN} =3D "1"
+INSANE_SKIP:${PN}-dev =3D "arch"
+ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb b=
/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
index 350c5cf8..0871193f 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
@@ -4,7 +4,7 @@ include linalg.inc
 PR =3D "${INC_PR}.0"
=20
 DEPENDS +=3D "linalg"
-RDEPENDS_${PN} +=3D "opencl-runtime"
+RDEPENDS:${PN} +=3D "opencl-runtime"
=20
 export LINALG_DIR =3D "${LINALG_INSTALL_DIR}"
=20
@@ -23,12 +23,12 @@ do_install() {
     cp -r examples/arm+dsp/* ${D}${datadir}/ti/examples/linalg
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/examples/linalg/* \
 "
=20
-FILES_${PN}-dbg +=3D "\
+FILES:${PN}-dbg +=3D "\
     ${datadir}/ti/examples/linalg/*/.debug \
 "
=20
-INSANE_SKIP_${PN} =3D "arch ldflags textrel"
+INSANE_SKIP:${PN} =3D "arch ldflags textrel"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-ara=
go-extras/recipes-ti/linalg/linalg_git.bb
index 3b9220a9..aa87f5f2 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -3,8 +3,8 @@ DESCRIPTION =3D "TI Linear Algebra Library"
 include linalg.inc
 PR =3D "${INC_PR}.0"
=20
-TARGET_dra7xx        =3D "SOC_AM572x"
-MEM_MODEL_dra7xx     =3D "Small"
+TARGET:dra7xx        =3D "SOC_AM572x"
+MEM_MODEL:dra7xx     =3D "Small"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 do_compile() {
@@ -17,9 +17,9 @@ do_install() {
 }
=20
 # to create a package for LINALG
-FILES_${PN}-dev +=3D "${LINALG_INSTALL_DIR_RECIPE}"
+FILES:${PN}-dev +=3D "${LINALG_INSTALL_DIR_RECIPE}"
=20
-INSANE_SKIP_${PN}-dev =3D "arch staticdev"
-ALLOW_EMPTY_${PN} =3D "1"
+INSANE_SKIP:${PN}-dev =3D "arch staticdev"
+ALLOW_EMPTY:${PN} =3D "1"
=20
-RDEPENDS_${PN}-dev +=3D "bash perl"
+RDEPENDS:${PN}-dev +=3D "bash perl"
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb b/me=
ta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
index 5bf1e565..2054b1bb 100644
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
@@ -19,7 +19,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git"
 RELEASE_TARGET =3D ""
-RELEASE_TARGET_omap-a15 =3D "am57xx"
+RELEASE_TARGET:omap-a15 =3D "am57xx"
=20
 CLEANBROKEN =3D "1"
=20
@@ -55,10 +55,10 @@ do_install() {
     done
 }
=20
-FILES_${PN} +=3D "${LLVM_RTOS_INSTALL_DIR_RECIPE}"
+FILES:${PN} +=3D "${LLVM_RTOS_INSTALL_DIR_RECIPE}"
=20
 # This package contains one x86-64 executable and a few static libraries
-INSANE_SKIP_${PN} =3D "arch file-rdeps staticdev"
+INSANE_SKIP:${PN} =3D "arch file-rdeps staticdev"
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb b/me=
ta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
index fad8d77b..086497ec 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-rtos_git.bb
@@ -13,8 +13,8 @@ DEPENDS =3D "ti-llvm3.6-native boost-native"
=20
 S =3D "${WORKDIR}/git/host"
=20
-TARGET_class-target =3D "am57xx"
-TARGET_class-native =3D "x86"
+TARGET:class-target =3D "am57xx"
+TARGET:class-native =3D "x86"
=20
 export WANT_LLVM_RELEASE =3D "3.6-ti"
 export DESTDIR=3D"${D}${OCL_RTOS_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb b/met=
a-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
index 230c34aa..18d304b7 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/clocl-win_git.bb
@@ -21,7 +21,7 @@ COMPATIBLE_MACHINE =3D "omap-a15"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 RELEASE_TARGET =3D ""
-RELEASE_TARGET_omap-a15 =3D "am57xx"
+RELEASE_TARGET:omap-a15 =3D "am57xx"
=20
 S =3D "${WORKDIR}/git"
 export DESTDIR=3D"${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGE=
T}-${PV}/packages/ti/opencl"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_g=
it.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 71685ba2..2aa130ba 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -37,13 +37,13 @@ OCL_EXAMPLE_LIST =3D " abort_exit \
 "
=20
 RELEASE_TARGET =3D ""
-RELEASE_TARGET_omap-a15 =3D "am57xx"
+RELEASE_TARGET:omap-a15 =3D "am57xx"
=20
 export BIOS_INSTALL_DIR =3D "${SYSBIOS_INSTALL_DIR}"
 export DESTDIR=3D"${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGE=
T}-${PV}"
 export TI_OCL_INSTALL =3D "${DESTDIR}/packages/ti/opencl"
=20
-python do_unpack_append() {
+python do_unpack:append() {
     import shutil
=20
     git_dir =3D d.expand("${WORKDIR}/git/examples")
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_gi=
t.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index 6b96eb4c..81ab0fa4 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -26,10 +26,10 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/monitor"
=20
-BUILD_TARGET_omap-a15   =3D "ARM_AM57"
+BUILD_TARGET:omap-a15   =3D "ARM_AM57"
=20
 RELEASE_TARGET =3D ""
-RELEASE_TARGET_omap-a15 =3D "am57xx"
+RELEASE_TARGET:omap-a15 =3D "am57xx"
=20
 export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
 export PDK_DIR =3D "${PDK_INSTALL_DIR}"
@@ -72,5 +72,5 @@ do_install() {
     install -m ${OCL_FPERMS} cmds/monitor.am57x_rtos.cmd ${SHARE_PATH}
 }
=20
-FILES_${PN} +=3D "${OCL_RTOS_INSTALL_DIR_RECIPE}"
-INSANE_SKIP_${PN} =3D "arch"
+FILES:${PN} +=3D "${OCL_RTOS_INSTALL_DIR_RECIPE}"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/m=
eta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index 5e179ec1..aa30b52a 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -25,9 +25,9 @@ DEPENDS =3D "cmake-native \
            ti-cgt6x-native \
 "
=20
-#RDEPENDS_${PN}-dev +=3D " opencl-monitor-rtos"
+#RDEPENDS:${PN}-dev +=3D " opencl-monitor-rtos"
=20
-ALLOW_EMPTY_${PN}-runtime =3D "1"
+ALLOW_EMPTY:${PN}-runtime =3D "1"
=20
=20
 S =3D "${WORKDIR}/git/host"
@@ -35,13 +35,13 @@ B =3D "${WORKDIR}/build"
=20
 export WANT_LLVM_RELEASE =3D "3.6-ti"
=20
-OCL_BUILD_TARGET_omap-a15   =3D "ARM_AM57"
+OCL_BUILD_TARGET:omap-a15   =3D "ARM_AM57"
=20
 ENABLE_ULM =3D "0"
 SHMEM_MANAGER =3D "CMEM"
=20
 RELEASE_TARGET =3D ""
-RELEASE_TARGET_omap-a15 =3D "am57xx"
+RELEASE_TARGET:omap-a15 =3D "am57xx"
=20
 export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
 export ARM_LLVM_DIR=3D"${LLVM_RTOS_INSTALL_DIR}"
@@ -94,7 +94,7 @@ do_install() {
     install -m 755 ${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tre=
e/bin/x86/clocl ${D}/usr/share/ti/opencl/bin/x86
 }
=20
-FILES_${PN}-dev +=3D "/usr/share/ti/opencl ${OCL_RTOS_INSTALL_DIR_RECIPE=
}"
+FILES:${PN}-dev +=3D "/usr/share/ti/opencl ${OCL_RTOS_INSTALL_DIR_RECIPE=
}"
=20
-INSANE_SKIP_${PN} =3D "already-stripped"
-INSANE_SKIP_${PN}-dev =3D "staticdev file-rdeps arch"
+INSANE_SKIP:${PN} =3D "already-stripped"
+INSANE_SKIP:${PN}-dev =3D "staticdev file-rdeps arch"
diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-e=
xtras/recipes-ti/ocl/clocl_git.bb
index df77d7ed..5638ef4d 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -12,9 +12,9 @@ S =3D "${WORKDIR}/git/host"
=20
 export WANT_LLVM_RELEASE =3D "3.6-ti"
=20
-TARGET_class-target =3D "arm"
-TARGET_class-native =3D "x86"
-TARGET_class-nativesdk =3D "x86"
+TARGET:class-target =3D "arm"
+TARGET:class-native =3D "x86"
+TARGET:class-nativesdk =3D "x86"
=20
 EXTRA_OEMAKE =3D " -C ${S}/clocl \
                  _PRODUCT_VERSION=3D${PV} \
@@ -31,5 +31,5 @@ do_install() {
   install -m 755 ${S}/clocl/${TARGET}/clocl ${D}${bindir}
 }
=20
-RDEPENDS_${PN} +=3D "ti-cgt6x"
+RDEPENDS:${PN} +=3D "ti-cgt6x"
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb b/met=
a-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
index bff4e634..c8934154 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
@@ -3,7 +3,7 @@ LICENSE =3D "MIT"
=20
 LIC_FILES_CHKSUM =3D "file://../GL/gl.h;startline=3D1;endline=3D24;md5=3D=
10424a07c8d8310e34ced799b95f0fb6"
=20
-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
=20
 SRC_URI =3D " \
     file://GL/gl.h \
diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras=
/recipes-ti/ocl/ocl.inc
index c1b475a3..b03d2040 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -4,7 +4,7 @@ INC_PR =3D "r0"
=20
 LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3D2e3965a73a8a49c23=
836467266120dff"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/ocl:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/ocl:"
=20
 OCL_GIT_URI =3D "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL =3D "git"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/me=
ta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 8e77302e..7e5aaeb8 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -14,17 +14,17 @@ DEPENDS =3D "opencl opencl-monitor ti-cgt6x-native cl=
ocl-native"
=20
 OCL_PERSISTENT_DEPENDS =3D "ti-xdctools-native ti-ipc-rtos ti-sysbios"
=20
-DEPENDS_append_dra7xx =3D " ${OCL_PERSISTENT_DEPENDS}"
+DEPENDS:append:dra7xx =3D " ${OCL_PERSISTENT_DEPENDS}"
=20
 # Split examples into two groups:
 # - offline-compile: examples who's kernels are precompiled (offline).
 # - runtime-compile: examples who's kernels are compiled during runtime.
 PACKAGES =3D+ "${PN}-runtime-compile ${PN}-runtime-compile-dbg ${PN}-off=
line-compile ${PN}-offline-compile-dbg"
=20
-RDEPENDS_${PN} =3D "${PN}-runtime-compile ${PN}-offline-compile"
-RDEPENDS_${PN}-dev +=3D "libgomp-dev"
-RDEPENDS_${PN}-offline-compile +=3D "opencl-runtime"
-RDEPENDS_${PN}-runtime-compile +=3D "opencl"
+RDEPENDS:${PN} =3D "${PN}-runtime-compile ${PN}-offline-compile"
+RDEPENDS:${PN}-dev +=3D "libgomp-dev"
+RDEPENDS:${PN}-offline-compile +=3D "opencl-runtime"
+RDEPENDS:${PN}-runtime-compile +=3D "opencl"
=20
 S =3D "${WORKDIR}/git/opencl_example_src"
 B =3D "${S}"
@@ -74,18 +74,18 @@ OCL_PERSISTENT_EXAMPLE_LIST =3D " persistent_clock_co=
ncurrent \
                                 persistent_task_spanning \
 "
=20
-OCL_EXAMPLE_LIST_append_dra7xx =3D " ${OCL_PERSISTENT_EXAMPLE_LIST}"
+OCL_EXAMPLE_LIST:append:dra7xx =3D " ${OCL_PERSISTENT_EXAMPLE_LIST}"
=20
 OCL_MPAX_EXAMPLE_LIST =3D " vecadd_mpax \
                           vecadd_mpax_openmp \
 "
=20
-python do_unpack_append() {
+python do_unpack:append() {
     s =3D d.getVar("S")
     os.makedirs(s)
 }
=20
-python do_patch_append() {
+python do_patch:append() {
     import shutil
     git_dir =3D d.expand("${WORKDIR}/git/examples")
     s =3D d.getVar("S")
@@ -117,28 +117,28 @@ do_install() {
 }
=20
 # First package the examples which require run-time kernel compilation.
-FILES_${PN}-runtime-compile +=3D "\
+FILES:${PN}-runtime-compile +=3D "\
     ${@' '.join(['${datadir}/ti/examples/opencl/' + example for example =
in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
 "
=20
-FILES_${PN}-runtime-compile-dbg +=3D "\
+FILES:${PN}-runtime-compile-dbg +=3D "\
     ${@' '.join(['${datadir}/ti/examples/opencl/' + example + '/.debug' =
for example in d.getVar('OCL_RUNTIME_COMPILE_EXAMPLE_LIST').split()])} \
 "
=20
 # Remaining examples will fall through to the "offline" package.
-FILES_${PN}-offline-compile +=3D "\
+FILES:${PN}-offline-compile +=3D "\
     ${datadir}/ti/examples/opencl/ \
 "
=20
-FILES_${PN}-offline-compile-dbg +=3D "\
+FILES:${PN}-offline-compile-dbg +=3D "\
     ${datadir}/ti/examples/opencl/*/.debug \
 "
=20
 # Add makefiles to dev package
-FILES_${PN}-dev =3D "${datadir}/ti/examples/opencl/Makefile \
+FILES:${PN}-dev =3D "${datadir}/ti/examples/opencl/Makefile \
                    ${datadir}/ti/examples/opencl/make.inc"
=20
-ALLOW_EMPTY_${PN} =3D "1"
-INSANE_SKIP_${PN} =3D "arch ldflags textrel staticdev"
-INSANE_SKIP_${PN}-offline-compile =3D "arch ldflags textrel staticdev"
-INSANE_SKIP_${PN}-runtime-compile =3D "arch ldflags textrel staticdev"
+ALLOW_EMPTY:${PN} =3D "1"
+INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
+INSANE_SKIP:${PN}-offline-compile =3D "arch ldflags textrel staticdev"
+INSANE_SKIP:${PN}-runtime-compile =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb b=
/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
index 0e7e4540..44000977 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor-ipu_git.bb
@@ -50,15 +50,15 @@ do_install() {
     install -m ${OCL_FPERMS} bin/release/server_ipu1.xem4 ${D}${base_lib=
dir}/firmware/dra7-ipu1-fw.xem4.opencl-monitor
 }
=20
-ALTERNATIVE_${PN} =3D "dra7-ipu1-fw.xem4"
+ALTERNATIVE:${PN} =3D "dra7-ipu1-fw.xem4"
 ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] =3D "${base_libdir}/firmware/dr=
a7-ipu1-fw.xem4"
 ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] =3D "${base_libdir}/firmware/dra7-=
ipu1-fw.xem4.opencl-monitor"
 ALTERNATIVE_PRIORITY =3D "100"
=20
 MONITOR_IPU_FIRMWARE =3D "${base_libdir}/firmware/dra7-ipu1-fw.*"
=20
-FILES_${PN} +=3D " \
+FILES:${PN} +=3D " \
     ${MONITOR_IPU_FIRMWARE} \
 "
=20
-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 4beadb36..930d270b 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -30,7 +30,7 @@ DEPENDS =3D " ti-llvm3.6-native \
             openmp-rtos \
 "
=20
-DEPENDS_append_dra7xx =3D " opencl-tidl-fw \
+DEPENDS:append:dra7xx =3D " opencl-tidl-fw \
 "
=20
 COMPATIBLE_MACHINE =3D "dra7xx"
@@ -38,7 +38,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 S =3D "${WORKDIR}/git/monitor"
=20
-BUILD_TARGET_dra7xx =3D "ARM_AM57"
+BUILD_TARGET:dra7xx =3D "ARM_AM57"
=20
 export TI_OCL_CGT_INSTALL =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6=
x"
 export PDK_DIR =3D "${PDK_INSTALL_DIR}"
@@ -78,14 +78,14 @@ install_dsp_objs() {
     install -m ${OCL_FPERMS} monitor_${1}/dsp0.syms ${SHARE_PATH}/dsp.sy=
ms
 }
=20
-do_install_append_dra7xx() {
+do_install:append:dra7xx() {
     install_dsp_objs am57x
     install -m ${OCL_DPERMS} -d ${D}${base_libdir}/firmware
     install -m ${OCL_FPERMS} monitor_am57x/dsp0.out ${D}${base_libdir}/f=
irmware/dra7-dsp1-fw.xe66.${BPN}
     install -m ${OCL_FPERMS} monitor_am57x/dsp1.out ${D}${base_libdir}/f=
irmware/dra7-dsp2-fw.xe66.${BPN}
 }
=20
-ALTERNATIVE_${PN}_dra7xx =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
+ALTERNATIVE:${PN}:dra7xx =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
 ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp1-fw.xe66"
 ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp1-fw.xe66.${BPN}"
 ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp2-fw.xe66"
@@ -93,11 +93,11 @@ ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] =3D "${base_lib=
dir}/firmware/dra7-dsp2-fw.xe
 ALTERNATIVE_PRIORITY =3D "100"
=20
 MONITOR_FIRMWARE =3D ""
-MONITOR_FIRMWARE_dra7xx =3D "${base_libdir}/firmware/*"
+MONITOR_FIRMWARE:dra7xx =3D "${base_libdir}/firmware/*"
=20
-FILES_${PN} +=3D " \
+FILES:${PN} +=3D " \
     ${datadir}/ti/opencl/* \
     ${MONITOR_FIRMWARE} \
 "
=20
-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/met=
a-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
index 0e8b46d6..67d1769a 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
@@ -30,9 +30,9 @@ do_install() {
     done
 }
=20
-FILES_${PN} +=3D "${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
+FILES:${PN} +=3D "${OCL_TIDL_FW_INSTALL_DIR_RECIPE}"
=20
-INSANE_SKIP_${PN} =3D "arch"
+INSANE_SKIP:${PN} =3D "arch"
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-=
extras/recipes-ti/ocl/opencl_git.bb
index d6399432..4ee67332 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -17,7 +17,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 PACKAGES =3D+ "${PN}-runtime"
=20
 MONITORS                      =3D " opencl-monitor"
-MONITORS_append_dra7xx        =3D " opencl-monitor-ipu"
+MONITORS:append:dra7xx        =3D " opencl-monitor-ipu"
=20
 DEPENDS =3D " ocl-gl-headers \
             ${MONITORS} \
@@ -37,20 +37,20 @@ DEPENDS =3D " ocl-gl-headers \
             json-c \
 "
=20
-DEPENDS_append_dra7xx =3D " ti-ipc virtual/kernel"
+DEPENDS:append:dra7xx =3D " ti-ipc virtual/kernel"
=20
-RDEPENDS_${PN}-runtime +=3D "bash ${MONITORS}"
-RDEPENDS_${PN}-dev +=3D "ocl-gl-headers-dev"
-RDEPENDS_${PN} +=3D "${PN}-runtime clocl bash"
+RDEPENDS:${PN}-runtime +=3D "bash ${MONITORS}"
+RDEPENDS:${PN}-dev +=3D "ocl-gl-headers-dev"
+RDEPENDS:${PN} +=3D "${PN}-runtime clocl bash"
=20
 # Use main package to pull in full support
-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
=20
 S =3D "${WORKDIR}/git/host"
=20
 export WANT_LLVM_RELEASE =3D "3.6-ti"
=20
-OCL_BUILD_TARGET_dra7xx =3D "ARM_AM57"
+OCL_BUILD_TARGET:dra7xx =3D "ARM_AM57"
=20
 ENABLE_ULM =3D "1"
 SHMEM_MANAGER =3D "CMEM"
@@ -61,19 +61,19 @@ EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KER=
NEL_DIR} LINUX_DEVKIT_ROOT=3D${ST
 export KERNEL_INSTALL_DIR =3D "${STAGING_KERNEL_DIR}"
=20
 MCTD =3D ""
-MCTD_dra7xx =3D "${S}/mct-daemon/ti-mct-daemon.service.am57x"
+MCTD:dra7xx =3D "${S}/mct-daemon/ti-mct-daemon.service.am57x"
=20
-do_install_append() {
+do_install:append() {
     install -d ${D}${systemd_system_unitdir}
     install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.s=
ervice
 }
=20
 SYSTEMD_PACKAGES =3D "${PN}-runtime"
-SYSTEMD_SERVICE_${PN}-runtime =3D "ti-mct-daemon.service"
-SYSTEMD_AUTO_ENABLE_${PN}-runtime =3D "${@oe.utils.conditional("RESERVE_=
CMEM", "1", "enable", "disable", d)}"
+SYSTEMD_SERVICE:${PN}-runtime =3D "ti-mct-daemon.service"
+SYSTEMD_AUTO_ENABLE:${PN}-runtime =3D "${@oe.utils.conditional("RESERVE_=
CMEM", "1", "enable", "disable", d)}"
=20
-FILES_${PN}-runtime +=3D "${bindir} ${systemd_system_unitdir} ${sysconfd=
ir}/ti-mctd ${libdir}/lib*${SOLIBS}"
+FILES:${PN}-runtime +=3D "${bindir} ${systemd_system_unitdir} ${sysconfd=
ir}/ti-mctd ${libdir}/lib*${SOLIBS}"
=20
-FILES_${PN} +=3D " \
+FILES:${PN} +=3D " \
     ${datadir}/ti/opencl/* \
 "
diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-a=
rago-extras/recipes-ti/openmpacc/clacc_git.bb
index 8cb25da2..4d78e7b7 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
@@ -5,13 +5,13 @@ include openmpacc.inc
 PR =3D "${INC_PR}.0"
=20
 DEPENDS =3D "boost elfutils perl-native"
-RDEPENDS_${PN} +=3D "clocl"
+RDEPENDS:${PN} +=3D "clocl"
=20
 S =3D "${WORKDIR}/git/host"
=20
-TARGET_class-target =3D "clacc_arm"
-TARGET_class-native =3D "clacc_x86"
-TARGET_class-nativesdk =3D "clacc_x86"
+TARGET:class-target =3D "clacc:arm"
+TARGET:class-native =3D "clacc:x86"
+TARGET:class-nativesdk =3D "clacc:x86"
=20
 export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_HOST}"
 export X86_HOST_ROOT =3D "${STAGING_DIR_HOST}"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_gi=
t.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
index 39902f8f..260daf03 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -5,7 +5,7 @@ include openmpacc.inc
 PR =3D "${INC_PR}.1"
=20
 DEPENDS =3D "openmpacc clacc-native clocl-native ti-cgt6x-native"
-RDEPENDS_${PN} +=3D "opencl-runtime"
+RDEPENDS:${PN} +=3D "opencl-runtime"
=20
 S =3D "${WORKDIR}/git/openmpacc-examples-src"
=20
@@ -24,7 +24,7 @@ OMPACC_EXAMPLE_LIST =3D " target_update \
                         sub_section \
 "
=20
-python do_unpack_append() {
+python do_unpack:append() {
     import shutil
=20
     git_dir =3D d.expand("${WORKDIR}/git/examples")
@@ -68,12 +68,12 @@ do_install() {
     done
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${datadir}/ti/examples/openmpacc \
 "
=20
-FILES_${PN}-dbg +=3D "\
+FILES:${PN}-dbg +=3D "\
     ${datadir}/ti/examples/openmpacc/*/.debug \
 "
=20
-INSANE_SKIP_${PN} =3D "arch ldflags textrel staticdev"
+INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-=
arago-extras/recipes-ti/openmpacc/openmpacc.inc
index 1c01f5ac..7bcccb13 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -5,8 +5,8 @@ LICENSE =3D "BSD"
 inherit features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_MACHINE_FEATURES_class-native =3D ""
-REQUIRED_MACHINE_FEATURES_class-nativesdk =3D ""
+REQUIRED_MACHINE_FEATURES:class-native =3D ""
+REQUIRED_MACHINE_FEATURES:class-nativesdk =3D ""
 REQUIRED_DISTRO_FEATURES =3D "opencl openmp"
=20
 PV =3D "1.5.6.0"
@@ -14,7 +14,7 @@ INC_PR =3D "r0"
=20
 LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3Daaa2a0939d0819713=
2fc382e97b62eb0"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/openmpacc:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/openmpacc:"
=20
 OMPACC_GIT_URI =3D "git://git.ti.com/openmp/ti-openmpacc.git"
 OMPACC_GIT_PROTOCOL =3D "git"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/me=
ta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
index 44b59a4f..7a18e47e 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
@@ -7,8 +7,8 @@ PR =3D "${INC_PR}.1"
 inherit cmake
=20
 DEPENDS =3D "boost boost-native opencl"
-RDEPENDS_${PN} +=3D "opencl-runtime"
-RDEPENDS_${PN}-dev +=3D "clacc"
+RDEPENDS:${PN} +=3D "opencl-runtime"
+RDEPENDS:${PN}-dev +=3D "clacc"
=20
 S =3D "${WORKDIR}/git/host"
=20
@@ -17,4 +17,4 @@ export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_HOST}"
=20
 EXTRA_OECMAKE +=3D "-DVERSION=3D"${PV}" -DBUILD_OUTPUT=3Dlib"
=20
-FILES_${PN} +=3D "/usr/share/ti/openmpacc/*"
+FILES:${PN} +=3D "/usr/share/ti/openmpacc/*"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-ar=
ago-extras/recipes-ti/tidl-api/tidl-api.inc
index c70ff8a8..1f6bb442 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -16,6 +16,6 @@ S =3D "${WORKDIR}/git"
 inherit features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "dsp"
-REQUIRED_MACHINE_FEATURES_class-native =3D ""
-REQUIRED_MACHINE_FEATURES_class-nativesdk =3D ""
+REQUIRED_MACHINE_FEATURES:class-native =3D ""
+REQUIRED_MACHINE_FEATURES:class-nativesdk =3D ""
 REQUIRED_DISTRO_FEATURES =3D "opencl opencv"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta=
-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
index 4dd8c685..27760ebc 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
@@ -20,7 +20,7 @@ DEPENDS =3D "opencv \
            clocl-native \
 "
=20
-RDEPENDS_${PN} +=3D "opencl-runtime \
+RDEPENDS:${PN} +=3D "opencl-runtime \
                    opencv \
 "
=20
@@ -49,9 +49,9 @@ do_install() {
     install ${S}/readme.md ${D}${TIDL_INSTALL_DIR}/
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${TIDL_INSTALL_DIR} \
 "
=20
=20
-INSANE_SKIP_${PN} =3D "arch ldflags textrel staticdev"
+INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b=
/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
index d59ee405..96c9d860 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
@@ -18,7 +18,7 @@ DEPENDS =3D "opencv \
            json-c \
 "
=20
-RDEPENDS_${PN} +=3D "tidl-api \
+RDEPENDS:${PN} +=3D "tidl-api \
                    opencl-runtime \
                    opencv \
                    json-c \
@@ -44,9 +44,9 @@ do_install() {
     cp ${CP_ARGS} ${S}/examples/* ${D}${TIDL_INSTALL_DIR}/examples/
 }
=20
-FILES_${PN} +=3D "\
+FILES:${PN} +=3D "\
     ${TIDL_INSTALL_DIR} \
 "
=20
=20
-INSANE_SKIP_${PN} =3D "arch ldflags textrel staticdev"
+INSANE_SKIP:${PN} =3D "arch ldflags textrel staticdev"
diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/m=
eta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
index 5690c77e..aa143a7c 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
@@ -9,12 +9,12 @@ PR =3D "${INC_PR}.0"
=20
 DEPENDS =3D "boost boost-native ti-cgt6x-native clocl-native"
=20
-TARGET_class-target =3D "arm"
-TARGET_class-native =3D "x86"
-TARGET_class-nativesdk =3D "x86"
+TARGET:class-target =3D "arm"
+TARGET:class-native =3D "x86"
+TARGET:class-nativesdk =3D "x86"
=20
-CXXFLAGS_append_class-native    =3D " -DPLATFORM_64BIT "
-CXXFLAGS_append_class-nativesdk =3D " -DPLATFORM_64BIT "
+CXXFLAGS:append:class-native    =3D " -DPLATFORM_64BIT "
+CXXFLAGS:append:class-nativesdk =3D " -DPLATFORM_64BIT "
=20
 EXTRA_OEMAKE =3D " -C ${S}/viewer \
                  TARGET=3D${TARGET} \
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b=
/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index c4c66049..3c1b81ff 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -22,7 +22,7 @@ EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUXENV=3Dx8=
6 LINUX_IMPORT_TOOL=3D64BIT \
                    PROTOBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROT=
OBUF_INC_DIR=3D${STAGING_DIR_NATIVE}/usr/include \
                    FLATBUFFERS_INC_DIR=3D${STAGING_DIR_NATIVE}$/usr/incl=
ude/flatbuffers \
                    TF_LITE_GENERATED_PATH=3D${STAGING_DIR_NATIVE}/usr/in=
clude/tensorflow/lite/schema"
-EXTRA_MAKE_ARGS_class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/=
bin/${TARGET_PREFIX} \
+EXTRA_MAKE_ARGS:class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/=
bin/${TARGET_PREFIX} \
                                 PROTOBUF_LIB_DIR=3D${STAGING_LIBDIR} PRO=
TOBUF_INC_DIR=3D${STAGING_INCDIR} \
                                 FLATBUFFERS_INC_DIR=3D${STAGING_INCDIR}/=
flatbuffers \
                                 TF_LITE_GENERATED_PATH=3D${STAGING_INCDI=
R}/tensorflow/lite/schema LINUXENV=3Doearm"
@@ -41,6 +41,6 @@ do_install () {
     install -m 755 ${S}/modules/ti_dl/utils/tidlModelImport/out/tidl_mod=
el_import.out ${D}${bindir}
 }
=20
-INSANE_SKIP_${PN} =3D "ldflags"
+INSANE_SKIP:${PN} =3D "ldflags"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta=
-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
index 554cf09a..e8aad51c 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -7,13 +7,13 @@ require ./tidl-utils.inc
=20
 LIC_FILES_CHKSUM =3D "file://docs/LICENSE.txt;md5=3Da93aa5af7a3bbbb6fb34=
c8df59efaa5c"
=20
-RDEPENDS_${PN}_class-target +=3D "tidl-api tidl-examples"
+RDEPENDS:${PN}:class-target +=3D "tidl-api tidl-examples"
=20
 S =3D "${WORKDIR}/git"
=20
-TARGET_class-target =3D "arm"
-TARGET_class-native =3D "x86"
-TARGET_class-nativesdk =3D "x86"
+TARGET:class-target =3D "arm"
+TARGET:class-native =3D "x86"
+TARGET:class-nativesdk =3D "x86"
=20
 CP_ARGS =3D "-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership=
"
=20
@@ -26,9 +26,9 @@ do_install() {
   cp ${CP_ARGS} ${S}/docs/* ${D}${datadir}/ti/tidl/utils/docs/.
 }
=20
-FILES_${PN} +=3D "${datadir}/ti/tidl/utils \
+FILES:${PN} +=3D "${datadir}/ti/tidl/utils \
                 ${bindir}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-INSANE_SKIP_${PN} +=3D "build-deps ldflags already-stripped"
+INSANE_SKIP:${PN} +=3D "build-deps ldflags already-stripped"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb b/meta-=
arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
index 74006810..ec8355e0 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
@@ -6,9 +6,9 @@ Same package includes IPC implementation (MessageQ based)=
 needed for communicati
 LICENSE =3D "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM =3D "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_ma=
nifest.html;md5=3D247d7c56d783f583bf802490d5c93db3"
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
-SRC_URI_append +=3D "\
+SRC_URI:append =3D "\
      file://setenv.sh \
 "
=20
@@ -20,7 +20,7 @@ require recipes-ti/includes/arago-paths.inc
 require tiovx-sys.inc
=20
 DEPENDS =3D "tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv udev"
-RDEPENDS_${PN} =3D "tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-h=
ost ti-ipc cmem"
+RDEPENDS:${PN} =3D "tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-h=
ost ti-ipc cmem"
=20
 PR =3D "r3"
=20
@@ -52,9 +52,9 @@ do_install () {
 }
=20
 PACKAGES +=3D "${PN}-examples"
-FILES_${PN}-examples =3D "${datadir}/ti/examples/openvx"
-RDEPENDS_${PN}-examples =3D "tiovx-lib-host-staticdev tiovx-lib-host-dev=
"
+FILES:${PN}-examples =3D "${datadir}/ti/examples/openvx"
+RDEPENDS:${PN}-examples =3D "tiovx-lib-host-staticdev tiovx-lib-host-dev=
"
=20
-FILES_${PN} +=3D "${bindir}/*"
-INSANE_SKIP_${PN} =3D "ldflags"
-INSANE_SKIP_${PN}-examples =3D "dev-deps"
+FILES:${PN} +=3D "${bindir}/*"
+INSANE_SKIP:${PN} =3D "ldflags"
+INSANE_SKIP:${PN}-examples =3D "dev-deps"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb b/meta-=
arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
index 16f23398..71b85d40 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-lib-host.bb
@@ -36,7 +36,7 @@ do_install () {
     cp ${CP_ARGS} ${S}/include/TI/* ${D}${includedir}/VX/TI
 }
=20
-FILES_${PN}-staticdev =3D "${libdir}"
-FILES_${PN}-dev =3D "${includedir}"
+FILES:${PN}-staticdev =3D "${libdir}"
+FILES:${PN}-dev =3D "${includedir}"
=20
-ALLOW_EMPTY_${PN} =3D "1"
+ALLOW_EMPTY:${PN} =3D "1"
diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb b/meta=
-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
index 80e3fa70..3a900e5f 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-sys-iface.bb
@@ -17,7 +17,7 @@ inherit update-alternatives features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "dsp"
=20
-SRC_URI_append +=3D "\
+SRC_URI:append =3D "\
      file://reload-dsp-fw.sh \
 "
=20
@@ -37,15 +37,15 @@ do_install () {
     install -m 0755 ${WORKDIR}/reload-dsp-fw.sh ${D}${bindir}
 }
=20
-ALTERNATIVE_${PN} =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
+ALTERNATIVE:${PN} =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66"
 ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp1-fw.xe66"
 ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp1-fw.xe66.openvx"
 ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dr=
a7-dsp2-fw.xe66"
 ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] =3D "${base_libdir}/firmware/dra7-=
dsp2-fw.xe66.openvx"
 ALTERNATIVE_PRIORITY =3D "20"
=20
-FILES_${PN} +=3D "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
+FILES:${PN} +=3D "${TIOVX_INSTALL_DIR_RECIPE}/sys-iface/* "
 PACKAGES =3D+ "${PN}-firmware"
-FILES_${PN}-firmware =3D "${base_libdir}/firmware/*"
+FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
=20
-INSANE_SKIP_${PN}-firmware =3D "arch"
+INSANE_SKIP:${PN}-firmware =3D "arch"
--=20
2.25.1


