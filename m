Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 896D152981
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:42:18 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X00FHARLPP070@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:42:00 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=UsUNhGW-_1_obwkpu-4A:9
Received: by 100.15.86.14 with SMTP id 2d157523; Fri, 01 Apr 2016 03:42:00 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AB7BD161F58;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:20 -0400
Message-id: <1459482106-27723-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 00/26] Initial batch of fixes for master/krogoth
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
X-List-Received-Date: Fri, 01 Apr 2016 03:42:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fixes necessary to make meta-arago work with master/krogoth (Yocto Project 2.1)

Denys Dmytriyenko (26):
  recipes-qt: remove all traces of qt4, no longer in oe-core
  gstreamer: remove outdated 0.10.x version, no longer in oe-core
  linux-libc-headers: remove version 4.1, default to 4.4
  linux: remove bbappends for old kernel versions, removed from meta-ti
  wpa-gui-e: remove, as no longer supported and requiring qt4
  u-boot-fw-utils: remove old version
  cryptodev-tests: remove, the change got upstreamed
  udev: rename bbappends to eudev, add symlink for libudev.so.0
  gstreamer: overlay .inc files from fido and update 1.2.3 recipes
  liboil: overlay locally for gstreamer-1.2.3 dependency
  obexd: fix typo in license URL
  cpuloadgen: fix cross-compilation by passing correct parameters
  eventdump: fix cross-compilation by passing correct parameters
  serialcheck: fix cross-compilation by passing correct parameters
  omapconf: bump SRCREV to pick up gcc-5 fixes
  ltp-ddt: fix make scripts failure due to new kernel task dependencies
  python3: fix configure failure to find cross-version of readelf
  packagegroup-arago-console: alsa-utils-alsaconf got renamed to
    alsa-utils-scripts
  HACK: weston-init: overlay locally due to REQUIRED_DISTRO_FEATURES =
    "opengl"
  HACK: dt: disable for now as breaking with gcc-5
  FIXME: external-linaro-toolchain-cross: target Linaro gcc version
    doesn't match cross version
  branding-core: disable SGX for now, until drivers updated for 4.4
  external-linaro-toolchain.bbappend: drop unneeded fixes for broken
    2015.05
  arago-prefs: update toolchain preferences, drop gstreamer 0.10
  toolchain*.inc: update toolchain preferences
  arago.conf: disable bluez5, disable -fstack-protector, restore
    git-native ASSUME_PROVIDED

 meta-arago-distro/conf/distro/arago.conf           |   8 +-
 .../conf/distro/include/arago-prefs.inc            |  27 +-
 .../conf/distro/include/branding-core.inc          |   4 +
 .../conf/distro/include/toolchain-gcc.inc          |   8 +-
 .../conf/distro/include/toolchain-linaro.inc       |   6 +-
 .../recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb  |  33 -
 .../u-boot/u-boot-fw-utils_2014.07.bbappend        |   7 -
 .../packagegroups/packagegroup-arago-console.bb    |   4 +-
 .../packagegroup-arago-tisdk-addons.bb             |   5 +-
 .../keystone => eudev/dra7xx}/udev-cache.default   |   0
 .../dra7xx => eudev/keystone}/udev-cache.default   |   0
 .../recipes-core/udev/{udev => eudev}/local.rules  |   0
 .../udev/{udev => eudev}/usb1-rules.sh             |   0
 .../udev/{udev => eudev}/usb2-rules.sh             |   0
 .../udev/{udev_%.bbappend => eudev_%.bbappend}     |   3 +-
 .../recipes-devtools/python/python3_%.bbappend     |   2 +
 .../cryptodev/cryptodev-tests_1.6.bbappend         |   3 -
 .../linux-libc-headers/linux-libc-headers.inc      |  75 --
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |   7 -
 .../linux/linux-ti-glsdk_3.8.bbappend              |  17 -
 .../linux/sitara-linux-ti-staging_3.14.bbappend    |  13 -
 .../gstreamer/gst-ffmpeg_0.10.13.bbappend          |   5 -
 .../gst-plugins-bad-mm-accel_0.10.23.bbappend      |   9 -
 ...k-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch |  29 -
 ...ink-fixing-calculation-of-bytes-per-pixel.patch |  52 --
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |  15 -
 .../gst-plugins-good-mm-accel_0.10.31.bbappend     |   6 -
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   6 -
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc     |  25 -
 ...-PATCH-make-demos-maximized-for-TISDK-use.patch |  48 -
 .../qt4/files/0002-qwslock-messages.patch          |  67 --
 meta-arago-distro/recipes-qt/qt4/files/qte.sh      |  11 -
 .../qt4/nativesdk-qt4-tools_4.8.6.bbappend         |   9 -
 .../qt4/qt4-embedded-gles_4.8.6.bbappend           |  12 -
 .../recipes-qt/qt4/qt4-embedded_4.8.6.bbappend     |   3 -
 .../recipes-connectivity/obexd/obexd_0.34.bb       |   2 +-
 ...was-not-declared-in-this-scope-when-using.patch |  39 -
 .../wpa-supplicant/wpa-gui-e_git.bb                |  28 -
 .../meta/external-linaro-toolchain-cross.bb        |   7 +-
 .../meta/external-linaro-toolchain.bbappend        |  10 +-
 .../recipes-devtools/cpuloadgen/cpuloadgen_git.bb  |   4 +-
 .../recipes-devtools/eventdump/eventdump_git.bb    |   6 +-
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |   7 +-
 .../recipes-devtools/omapconf/omapconf_git.bb      |   4 +-
 .../serialcheck/serialcheck_1.0.0.bb               |   2 +-
 .../recipes-graphics/wayland/weston-init.bb        |  28 +
 .../recipes-graphics/wayland/weston-init/init      |  60 ++
 .../wayland/weston-init/weston.service             |  15 +
 .../gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb  |  47 -
 .../gstreamer/gst-plugins-base-mm-accel_0.10.36.bb |  45 -
 .../gstreamer/gst-plugins-good-mm-accel_0.10.31.bb |  47 -
 .../gstreamer/gst-plugins-package-mm-accel.inc     |  17 -
 .../gstreamer/gst-plugins-package.inc              |  57 ++
 .../gstreamer/gstreamer-mm-accel.inc               |   9 -
 .../gstreamer/gstreamer-mm-accel_0.10.36.bb        |  41 -
 .../gstreamer/gstreamer1.0-libav.inc               |  31 +
 .../gstreamer/gstreamer1.0-libav_1.2.3.bb          |   1 -
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 135 +++
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb    |   1 -
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  40 +
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  58 ++
 .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bb   |   1 -
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  30 +
 .../gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb   |   1 -
 .../gstreamer/gstreamer1.0-plugins.inc             |  56 ++
 .../recipes-multimedia/gstreamer/gstreamer1.0.inc  |  27 +
 .../gstreamer/gstreamer1.0_1.2.3.bb                |   1 -
 .../recipes-qt/qt-apps/quick-playground_1.0.bb     |  39 -
 ...hanges-for-integrating-with-TI-graphics-S.patch | 719 ---------------
 .../qt4-embedded-gles/0001-wsegl2-support.patch    | 997 ---------------------
 .../qt4/qt4-embedded-gles/002_pvrqwswsegl.c.patch  |  11 -
 .../qt4/qt4-embedded-gles/cursor-hack.diff         |  34 -
 .../recipes-qt/qt4/qt4-embedded-gles/linux.conf    |  68 --
 .../recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb      |  30 -
 .../liboil-0.3.17/0001-Fix-enable-vfp-flag.patch   |  41 +
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |  19 +
 .../liboil/liboil-0.3.17/liboil_fix_for_x32.patch  | 222 +++++
 .../liboil/liboil-0.3.17/no-tests.patch            |  24 +
 .../recipes-support/liboil/liboil_0.3.17.bb        |  27 +
 79 files changed, 921 insertions(+), 2686 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bbappend
 rename meta-arago-distro/recipes-core/udev/{udev/keystone => eudev/dra7xx}/udev-cache.default (100%)
 rename meta-arago-distro/recipes-core/udev/{udev/dra7xx => eudev/keystone}/udev-cache.default (100%)
 rename meta-arago-distro/recipes-core/udev/{udev => eudev}/local.rules (100%)
 rename meta-arago-distro/recipes-core/udev/{udev => eudev}/usb1-rules.sh (100%)
 rename meta-arago-distro/recipes-core/udev/{udev => eudev}/usb2-rules.sh (100%)
 rename meta-arago-distro/recipes-core/udev/{udev_%.bbappend => eudev_%.bbappend} (88%)
 create mode 100644 meta-arago-distro/recipes-devtools/python/python3_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_1.6.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.patch
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad/0001-sys-fbdevsink-fixing-calculation-of-bytes-per-pixel.patch
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/files/0001-PATCH-make-demos-maximized-for-TISDK-use.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/files/0002-qwslock-messages.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/files/qte.sh
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.6.bbappend
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpagui-Fix-was-not-declared-in-this-scope-when-using.patch
 delete mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init.bb
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/init
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad-mm-accel_0.10.23.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base-mm-accel_0.10.36.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good-mm-accel_0.10.31.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel.inc
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer-mm-accel_0.10.36.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0.inc
 delete mode 100644 meta-arago-extras/recipes-qt/qt-apps/quick-playground_1.0.bb
 delete mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/0001-Qt-4.x-v2-Changes-for-integrating-with-TI-graphics-S.patch
 delete mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/0001-wsegl2-support.patch
 delete mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/002_pvrqwswsegl.c.patch
 delete mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/cursor-hack.diff
 delete mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles/linux.conf
 delete mode 100644 meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb
 create mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
 create mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
 create mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
 create mode 100644 meta-arago-extras/recipes-support/liboil/liboil-0.3.17/no-tests.patch
 create mode 100644 meta-arago-extras/recipes-support/liboil/liboil_0.3.17.bb

-- 
2.2.0


