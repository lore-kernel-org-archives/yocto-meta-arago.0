Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.9181.1645504912192609192
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B69040C2E
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Enyp8D2v9ofB for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5EEFE40A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 219BA17476B
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 00/23] initial cleanup and uplift from dunfell to kirkstone
Date: Tue, 22 Feb 2022 04:41:28 +0000
Message-Id: <20220222044151.2844138-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

This patchset uplifts meta-arago to build against the latest kirkstone
version of OE-Core and other layers. More fixes will be following.

Here's a temp git tree with these patches applied to glance at:
https://github.com/denix0/meta-arago/tree/master

Denys Dmytriyenko (23):
  qt-provider/qt-vars: deprecate abstraction between Qt4 and Qt5
  recipes: remove deprecated old platforms
  linux-libc-headers: correct the version to be 5.10
  toolchain-gcc: update preferred versions for internal toolchain
  meta-arago: convert to new override syntax in honister
  conf/machine: remove generic arago machines
  arago.conf: update curl PACKAGECONFIG
  uvc-gadget: explicitly specify source branch
  kms++: inherit pkgconfig class
  packagegroup-arago-base: remove kms++-python
  ti-test: replace kselftests with kernel-selftest
  linuxptp: make bbappend version-specific
  meta-arago: update ambiguous "BSD" license with "BSD-3-Clause"
  uboot-config: remove overlayed class
  classes: rename old customized fitimage classes for legacy HS devices
  arago.conf: drop custom class for image checksums
  meta-arago: set layer compatibility with kirkstone
  arago.conf: rename LICENSE_FLAGS_WHITELIST to LICENSE_FLAGS_ACCEPTED
  HACK: ti-test: disable input-utils due to build failure
  HACK: packagegroup-arago-tisdk-addons: disable pru-pwm-fw for am65x
  HACK: packagegroup-arago-tisdk-addons: disable pru-swuart-fw for
    am335x
  HACK: packagegroup-arago-tisdk-addons: disable pruss-lld-apps for
    AM3/4/5
  HACK: arago-image: disable make_bootfiles_symlinks_relative
    postprocess due to bashisms

 .../classes/image_types_md5.bbclass           |   9 -
 ...class =3D> kernel-fitimage-legacyhs.bbclass} |   4 +-
 meta-arago-distro/classes/sourceipk.bbclass   |  12 +-
 .../classes/tisdk-bundle.bbclass              |  34 +-
 .../classes/uboot-config.bbclass              |  57 --
 ...gn.bbclass =3D> uboot-sign-legacyhs.bbclass} |   6 +-
 meta-arago-distro/conf/distro/arago.conf      | 136 +++--
 .../conf/distro/include/arago-prefs.inc       |  31 +-
 .../conf/distro/include/arago-source-ipk.inc  | 485 +++++++++---------
 .../conf/distro/include/branding-amsdk.inc    |  14 +-
 .../conf/distro/include/branding-bleeding.inc |  24 +-
 .../conf/distro/include/branding-core.inc     |   8 +-
 .../conf/distro/include/branding-glsdk.inc    |   4 +-
 .../conf/distro/include/branding-mainline.inc |   4 +-
 .../distro/include/branding-processor-sdk.inc |  19 +-
 .../conf/distro/include/toolchain-arm.inc     |  16 +-
 .../conf/distro/include/toolchain-gcc.inc     |  16 +-
 meta-arago-distro/conf/layer.conf             |   5 +-
 .../conf/machine/arago-armv5.conf             |  18 -
 .../conf/machine/arago-armv7.conf             |  18 -
 .../conf/machine/arago-armv8.conf             |  21 -
 meta-arago-distro/conf/machine/arago.conf     |   1 -
 .../chromium-ozone-wayland_%.bbappend         |   6 +-
 .../arm-benchmarks/arm-benchmarks_%.bbappend  |   2 +-
 .../glmark2/glmark2_git.bbappend              |   4 +-
 .../stream/stream_%.bbappend                  |   8 +-
 .../alsa-state/alsa-state.bbappend            |   4 +-
 .../recipes-bsp/hplib/hplib-mod_git.bbappend  |   3 -
 .../k2-fw-initrd/k2-fw-initrd_0.0.7.bb        |  43 --
 .../netboot-initrd/files/init-netboot.sh      | 140 -----
 .../netboot-initrd-scripts_0.0.1.bb           |  13 -
 .../netboot-initrd/netboot-initrd_0.0.1.bb    |  47 --
 .../bt-enable/bt-enable.bb                    |   4 +-
 .../iproute2/iproute2_%.bbappend              |   6 +-
 ...uxptp_%.bbappend =3D> linuxptp_3.0.bbappend} |   4 +-
 .../docker/docker%.bbappend                   |   4 +-
 .../arago-gpl-notice/arago-gpl-notice.bb      |   2 +-
 .../base-files/base-files_%.bbappend          |   4 +-
 .../recipes-core/busybox/busybox_%.bbappend   |   6 +-
 .../busybox/softap-udhcpd-config_1.0.bb       |   4 +-
 .../recipes-core/dbus/dbus_%.bbappend         |   2 +-
 .../feed-config/arago-feed-config_1.0.bb      |   4 +-
 .../recipes-core/images/arago-image.inc       |   4 +-
 .../recipes-core/images/tisdk-base-image.bb   |   2 +-
 .../recipes-core/images/tisdk-core-bundle.bb  |  21 +-
 .../recipes-core/images/tisdk-core-bundle.inc |  26 +-
 .../images/tisdk-default-image.bb             |   7 +-
 .../recipes-core/images/tisdk-tiny-image.bb   |   2 +-
 .../init-ifupdown/init-ifupdown_%.bbappend    |   4 +-
 .../meta/external-arm-toolchain.bbappend      |   8 +-
 .../meta/meta-toolchain-arago-tisdk.inc       |   2 +-
 .../packagegroups/build-essential.bb          |   2 +-
 ...kagegroup-arago-base-tisdk-server-extra.bb |  82 +--
 .../packagegroup-arago-base-tisdk.bb          |   2 +-
 .../packagegroups/packagegroup-arago-base.bb  |   8 +-
 .../packagegroup-arago-console.bb             |   4 +-
 .../packagegroup-arago-gst-sdk-target.bb      |   9 +-
 .../packagegroups/packagegroup-arago-gst.bb   |  13 +-
 .../packagegroups/packagegroup-arago-misc.bb  |   2 +-
 .../packagegroups/packagegroup-arago-qte.bb   |  26 +-
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  64 +--
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 162 +-----
 .../packagegroup-arago-tisdk-addons.bb        |  79 +--
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  14 +-
 .../packagegroup-arago-tisdk-amsdk.bb         |   6 +-
 ...oup-arago-tisdk-connectivity-sdk-target.bb |   6 +-
 .../packagegroup-arago-tisdk-connectivity.bb  |  14 +-
 ...ackagegroup-arago-tisdk-crypto-sdk-host.bb |  15 +-
 ...kagegroup-arago-tisdk-crypto-sdk-target.bb |   9 +-
 .../packagegroup-arago-tisdk-crypto.bb        |   9 +-
 ...kagegroup-arago-tisdk-graphics-sdk-host.bb |   2 +-
 ...gegroup-arago-tisdk-graphics-sdk-target.bb |   2 +-
 .../packagegroup-arago-tisdk-graphics.bb      |   4 +-
 ...packagegroup-arago-tisdk-gtk-sdk-target.bb |   2 +-
 .../packagegroup-arago-tisdk-gtk.bb           |   2 +-
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  10 +-
 .../packagegroup-arago-tisdk-hmi.bb           |  10 +-
 ...ackagegroup-arago-tisdk-matrix-sdk-host.bb |   2 +-
 .../packagegroup-arago-tisdk-matrix.bb        |  34 +-
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |  14 +-
 ...group-arago-tisdk-multimedia-sdk-target.bb |  18 +-
 .../packagegroup-arago-tisdk-multimedia.bb    |  18 +-
 ...ackagegroup-arago-tisdk-opencl-sdk-host.bb |   8 +-
 ...kagegroup-arago-tisdk-opencl-sdk-target.bb |   8 +-
 .../packagegroup-arago-tisdk-opencl.bb        |  11 +-
 .../packagegroup-arago-tisdk-qte-sdk-host.bb  |  11 +-
 .../packagegroup-arago-tisdk-qte.bb           |  18 +-
 .../packagegroup-arago-tisdk-recoveryfs.bb    |  21 -
 ...ckagegroup-arago-toolchain-tisdk-target.bb |   5 +-
 .../packagegroup-cross-canadian.bbappend      |   4 +-
 .../packagegroups/ti-analytics.bb             |   9 +-
 .../recipes-core/packagegroups/ti-demos.bb    |  10 +-
 .../recipes-core/packagegroups/ti-opencl.bb   |   4 +-
 .../recipes-core/packagegroups/ti-test.bb     | 101 +---
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
 ...ders_5.4.bb =3D> linux-libc-headers_5.10.bb} |   2 +-
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
 .../recipes-tisdk/parse-ip/parse-ip.bb        |   6 +-
 .../ti-tisdk-makefile/Makefile_ipsecmgr-mod   |  28 -
 .../ti-tisdk-makefile/Makefile_pru-icss       |  13 -
 .../ti-tisdk-makefile_1.0.bb                  | 124 ++---
 .../ti-tisdk-setup/ti-tisdk-setup.bb          |  25 +-
 .../tisdk-install/tisdk-install_1.0.bb        |   2 +-
 .../tisdk-readme/tisdk-readme.bb              |   2 +-
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb    |   2 +-
 .../unshallow-repositories_1.0.bb             |   4 +-
 meta-arago-extras/classes/qt-provider.bbclass |  13 -
 meta-arago-extras/classes/qt-vars.bbclass     |  17 -
 meta-arago-extras/classes/qt5.bbclass         |   2 +-
 meta-arago-extras/conf/layer.conf             |   6 +-
 .../barcode-demo/barcode-roi_git.bb           |   4 +-
 .../big-data-ipc-demo-linux_git.bb            |   6 +-
 .../big-data-ipc-demo/big-data-ipc-demo.inc   |  15 +-
 .../recipes-apps/evse-hmi/evse-hmi_git.bb     |   2 +-
 .../image-gallery/image-gallery_git.bb        |   8 +-
 .../mmwavegesture-hmi_git.bb                  |   2 +-
 .../pdm-anomaly-detection_git.bb              |   4 +-
 .../point-cloud-viewer_git.bb                 |   6 +-
 .../posix-smp-demo/posix-smp-demo.inc         |  20 -
 .../posix-smp-demo/posix-smp-demo_git.bb      |  16 -
 .../protection-relays-hmi_git.bb              |   2 +-
 .../thermostat-demo/qt-tstat_2.0.bb           |  15 +-
 ...-opencv-opencl-opengl-multithreaded_git.bb |   6 +-
 .../arm-benchmarks/arm-benchmarks_1.3.bb      |   2 +-
 .../recipes-benchmark/stream/stream_5.10.bb   |   2 +-
 .../switch-config/switch-config_git.bb        |   4 +-
 .../hostap/hostap-daemon-wl18xx.bb            |  10 +-
 .../recipes-connectivity/hostap/hostap.inc    |   2 +-
 .../open62541/open62541_git.bb                |  14 +-
 .../openntpd/openntpd_3.9p1.bb                |   2 +-
 .../recipes-connectivity/vtun/vtun_3.0.3.bb   |   2 +-
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb   |  14 +-
 .../wpa-supplicant/wpa-supplicant.inc         |  14 +-
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb |   4 +-
 .../recipes-core/llvm/llvm-common.bb          |   6 +-
 .../recipes-core/llvm/llvm-common.bbappend    |   4 +-
 meta-arago-extras/recipes-core/llvm/llvm.inc  |  30 +-
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb       |  22 +-
 .../matrix/matrix-gui-3d-demos_2.0.bb         |  86 ++--
 .../matrix/matrix-gui-analytics-demos_2.0.bb  |   8 +-
 .../matrix/matrix-gui-apps-git.inc            |   2 +-
 .../matrix/matrix-gui-apps-images_2.0.bb      |   2 +-
 .../recipes-core/matrix/matrix-gui-apps.inc   |   2 +-
 .../matrix-gui-armbenchmarks-demos_2.0.bb     |   6 +-
 .../matrix/matrix-gui-browser-demos_2.0.bb    |   6 +-
 .../matrix/matrix-gui-browser_2.0.bb          |  18 +-
 .../matrix/matrix-gui-camera-loopback_2.0.bb  |   4 +-
 .../matrix/matrix-gui-clocks_2.0.bb           |   8 +-
 .../matrix/matrix-gui-crypto-demos_2.0.bb     |  16 +-
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
 .../matrix/matrix-gui-utility-demos_2.0.bb    |  10 +-
 .../matrix/matrix-gui-v4l2-demos_2.0.bb       |   4 +-
 .../matrix-gui-video-analytics-demos_2.0.bb   |   4 +-
 .../matrix/matrix-gui-wifi-demos_2.0.bb       |   4 +-
 .../recipes-core/matrix/matrix-gui/php.ini    |   2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb     |  20 +-
 .../matrix/matrix-lighttpd-config.bb          |   8 +-
 .../recipes-core/matrix/refresh-screen_2.0.bb |   7 +-
 .../meta/external-arm-sdk-toolchain.bb        |  32 +-
 .../meta/external-arm-toolchain.bbappend      |  20 +-
 .../meta/meta-toolchain-arago-qte.bb          |  10 +-
 .../recipes-core/meta/meta-toolchain-arago.bb |   2 +-
 .../oprofile-example/oprofile-example_git.bb  |   2 +-
 ...k-packagegroup-arago-qte-toolchain-host.bb |   7 +-
 ...nativesdk-packagegroup-arago-tisdk-host.bb |   4 +-
 ...packagegroup-arago-qte-toolchain-target.bb |  40 +-
 ...ackagegroup-arago-standalone-sdk-target.bb |   3 +-
 .../ti-crypto-examples_git.bb                 |   2 +-
 .../ti-pru-sw-app-loader_1.00.00.bb           |   6 +-
 .../ti-pru-sw-edma-library_1.00.00.bb         |   8 +-
 .../ti-pru-sw-examples_1.00.00.bb             |  10 +-
 .../cmake/extra-cmake-modules.bb              |   4 +-
 .../cpuloadgen/cpuloadgen_git.bb              |   2 +-
 .../recipes-devtools/dt/dt_17.07.bb           |   2 +-
 .../eventdump/eventdump_git.bb                |   2 +-
 .../flash-utility-1.6.0.0/LICENSE             |  63 ---
 .../flash-utility/flash-utility_1.6.0.0.bb    |  35 --
 .../flatbuffers/flatbuffers_1.11.0.bb         |   6 +-
 .../input-utils/input-utils_1.0.bb            |   2 +-
 .../ltp-ddt/ltp-ddt_20210524.bb               |  16 +-
 .../mtd/mtd-utils_git.bbappend                |   8 +-
 .../recipes-devtools/omapconf/omapconf_git.bb |   2 +-
 .../opkg/opkg-bash-completion.bb              |   4 +-
 .../pinmux-utility_1.0.1076.3.bb              |   4 +-
 .../pinmux-utility/pinmux-utility_2.5.2.0.bb  |   6 +-
 .../recipes-devtools/statcol/statcol.bb       |   6 +-
 .../util-scripts/glsdk-util-scripts.bb        |   4 +-
 .../uvc-gadget/uvc-gadget_git.bb              |   2 +-
 .../websocketd/websocketd_0.4.1.bb            |   2 +-
 .../recipes-extended/ltp/ltp_20200120.bb      |  20 +-
 .../recipes-extended/ltp/ltp_20210524.bb      |  20 +-
 .../recipes-graphics/glfw/glfw_git.bb         |   2 +-
 .../glsdk-example-apps/glsdk-example-apps.bb  |   8 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          |  10 +-
 .../recipes-graphics/kms++/kms++_git.bb       |   8 +-
 .../ti-gc320-tests_5.0.11.p7.bb               |   4 +-
 .../tslib/ts-calibrate-init_1.0.bb            |   2 +-
 .../wayland/wayland-protocols_%.bbappend      |   6 +-
 .../recovery-kernel/recovery-kernel_1.0.bb    |  46 --
 .../timestamping/timestamping_4.1.bb          |   2 +-
 .../amsdk-av-files/amsdk-av-files_1.4.bb      |  16 +-
 .../av-examples/av-examples_1.0.bb            |  34 --
 .../demo-image-proc/demo-image-proc_git.bb    |  26 -
 .../dual-camera-demo/dual-camera-demo_1.0.bb  |  14 +-
 .../gstreamer1.0-plugins-dsp66_git.bb         |  18 +-
 .../gstreamer1.0-plugins-ducati_git.bb        |   2 +-
 .../gstreamer1.0-plugins-hevc_git.bb          |  10 +-
 .../gstreamer1.0-plugins-ti.inc               |   6 +-
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |  18 +-
 .../gstreamer1.0-plugins-good_1.18.%.bbappend |   6 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb  |   6 +-
 .../recipes-qt/examples/qtwebbrowser_1.0.bb   |   6 +-
 .../arm-compute-library_git.bb                |  12 +-
 .../recipes-support/cclink/ccief-basic_git.bb |   2 +-
 .../crash-recovery/crash-recovery.bb          |  19 -
 .../crash-recovery/files/recoveryfs.sh        |  44 --
 .../recipes-support/devmem2/devmem2.bbappend  |   2 +-
 .../ipsecmgr/ipsecmgr-mod_git.bb              |  22 -
 .../recipes-support/ipsecmgr/ipsecmgr.inc     |   6 -
 .../recipes-support/ipsecmgr/ipsecmgr_git.bb  |  35 --
 .../libnl-xfrm/libnl-xfrm_git.bb              |  44 --
 .../recipes-support/liboil/liboil_0.3.17.bb   |   2 +-
 .../recipes-support/mstpctl/mstpd_git.bb      |   4 +-
 .../tensorflow-lite-demo_git.bb               |   8 +-
 .../tensorflow-lite/tensorflow-lite_1.15.bb   |  14 +-
 .../recipes-ti/fftlib/fftlib_git.bb           |  11 +-
 .../recipes-ti/fftlib/ti-fftw-examples_git.bb |   6 +-
 .../recipes-ti/fftlib/ti-fftw_git.bb          |  11 +-
 .../libarch/libarch-examples_git.bb           |   8 +-
 .../recipes-ti/libarch/libarch.inc            |   5 +-
 .../recipes-ti/libarch/libarch_git.bb         |   6 +-
 .../recipes-ti/linalg/linalg-examples_git.bb  |   8 +-
 .../recipes-ti/linalg/linalg.inc              |   2 +-
 .../recipes-ti/linalg/linalg_git.bb           |  14 +-
 .../recipes-ti/llvm-rtos/llvm-rtos_git.bb     |   6 +-
 .../recipes-ti/netapi/netapi-test_git.bb      |  51 --
 .../recipes-ti/netapi/netapi.inc              |  33 --
 .../recipes-ti/netapi/netapi_git.bb           |  32 --
 .../recipes-ti/ocl-rtos/clocl-rtos_git.bb     |   6 +-
 .../recipes-ti/ocl-rtos/clocl-win_git.bb      |   4 +-
 .../ocl-rtos/opencl-examples-rtos_git.bb      |   6 +-
 .../ocl-rtos/opencl-monitor-rtos_git.bb       |  10 +-
 .../recipes-ti/ocl-rtos/opencl-rtos_git.bb    |  16 +-
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb |  10 +-
 ...ondition-during-DSP-firmware-booting.patch |  38 --
 .../recipes-ti/ocl/ocl-gl-headers_git.bb      |   2 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc      |   2 +-
 .../recipes-ti/ocl/opencl-examples_git.bb     |  40 +-
 .../recipes-ti/ocl/opencl-monitor-ipu_git.bb  |   8 +-
 .../recipes-ti/ocl/opencl-monitor_git.bb      |  63 +--
 .../recipes-ti/ocl/opencl-tidl-fw_git.bb      |   4 +-
 .../recipes-ti/ocl/opencl_git.bb              |  39 +-
 .../recipes-ti/openmpacc/clacc_git.bb         |   8 +-
 .../openmpacc/openmpacc-examples_git.bb       |  10 +-
 .../recipes-ti/openmpacc/openmpacc.inc        |   8 +-
 .../recipes-ti/openmpacc/openmpacc_git.bb     |   6 +-
 .../recipes-ti/tidl-api/tidl-api.inc          |   4 +-
 .../recipes-ti/tidl-api/tidl-api_git.bb       |   8 +-
 .../recipes-ti/tidl-api/tidl-examples_git.bb  |   8 +-
 .../recipes-ti/tidl-api/tidl-viewer_git.bb    |  12 +-
 .../recipes-ti/tidl-utils/tidl-import_git.bb  |   4 +-
 .../recipes-ti/tidl-utils/tidl-utils.bb       |  12 +-
 .../recipes-ti/tiovx/tiovx-app-host.bb        |  16 +-
 .../recipes-ti/tiovx/tiovx-lib-host.bb        |   6 +-
 .../recipes-ti/tiovx/tiovx-sys-iface.bb       |  10 +-
 326 files changed, 1543 insertions(+), 3331 deletions(-)
 delete mode 100644 meta-arago-distro/classes/image_types_md5.bbclass
 rename meta-arago-distro/classes/{kernel-fitimage.bbclass =3D> kernel-fi=
timage-legacyhs.bbclass} (99%)
 delete mode 100644 meta-arago-distro/classes/uboot-config.bbclass
 rename meta-arago-distro/classes/{uboot-sign.bbclass =3D> uboot-sign-leg=
acyhs.bbclass} (97%)
 delete mode 100644 meta-arago-distro/conf/machine/arago-armv5.conf
 delete mode 100644 meta-arago-distro/conf/machine/arago-armv7.conf
 delete mode 100644 meta-arago-distro/conf/machine/arago-armv8.conf
 delete mode 120000 meta-arago-distro/conf/machine/arago.conf
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
 rename meta-arago-distro/recipes-connectivity/linuxptp/{linuxptp_%.bbapp=
end =3D> linuxptp_3.0.bbappend} (88%)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-recoveryfs.bb
 rename meta-arago-distro/recipes-kernel/linux-libc-headers/{linux-libc-h=
eaders_5.4.bb =3D> linux-libc-headers_5.10.bb} (97%)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ipsecmgr-mod
 delete mode 100644 meta-arago-extras/classes/qt-provider.bbclass
 delete mode 100644 meta-arago-extras/classes/qt-vars.bbclass
 delete mode 100644 meta-arago-extras/recipes-apps/posix-smp-demo/posix-s=
mp-demo.inc
 delete mode 100644 meta-arago-extras/recipes-apps/posix-smp-demo/posix-s=
mp-demo_git.bb
 mode change 100755 =3D> 100644 meta-arago-extras/recipes-apps/protection=
-relays-hmi/protection-relays-hmi_git.bb
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

--=20
2.25.1

