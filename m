Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AE0C6FA86
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.851.1663041767747559477
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F8E740D77
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TdoK5JXlgZ1F for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D54640D4B
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3A9F21666A7
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 00/52] Latest 2022.09 sync-up with Dunfell
Date: Tue, 13 Sep 2022 04:01:54 +0000
Message-Id: <20220913040246.2365077-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13984

From: Denys Dmytriyenko <denys@konsulko.com>

Update to the latest changes in Dunfell.

Anand Gadiyar (1):
  meta-arago-distro: curl: add proxy and verbose support

Andrew Davis (4):
  tisdk-uenv: remove uEnv.txt for k3
  tisdk-bundle: fix prebuilt-images U-Boot binary name for HS
  qtwebengine: bison-native dependency is upstream now remove this
    bbappend
  packagegroup-arago-base-tisdk: Add optee-examples

Aniket Limaye (1):
  conf: arago: Adding tracer-hooks build flag to gstreamer1.0

Aparna M (3):
  matrix-gui-apps-git: Update SRCREV to latest
  ti-tisdk-setup: Update SRCREV to latest
  ti-tisdk-setup: Fixup to bump up PR

Corentin Labbe (1):
  matrix-gui-crypto-demos: Use crypto_apps_script instead of
    crypto_apps_program

Daniel Parks (1):
  cifs-utils: add patch for upstream build bug

Darren Etheridge (1):
  weston-init: fix killproc for thinlinux so that it doesn't kill itself

Denys Dmytriyenko (8):
  devmem2: remove upstreamed fix
  pcitest: upgrade 5.4 -> 5.10
  ltp-ddt: update to the latest
  ti-llvm3.6: specify SRCREV_FORMAT
  ti-llvm3.6: inherit pkgconfig
  arago.conf: disable empty-dirs QA check
  packagegroups: fix remainder of ${PN}-src instances
  all: fix up more bashisms

Jayesh Choudhary (1):
  conf: arago: Add j721s2 hs platform support

Nishanth Menon (14):
  recipes-core: images: Add tisdk-thinlinux-image
  Revert "tisdk-tiny-image: remove packagedata task breaking initramfs
    packaging"
  tisdk-tiny-image: Split common components into include file
  tisdk-tiny-image: Add some usability notes
  tisdk-base-image: Reformat documentation and clarify usage
  tisdk-default-image: Reformat documentation and clarify usage
  tisdk-thinlinux-image: Reformat documentation
  tisdk-core-bundle: Add documentation to clarify usage
  packagegroups: Add a new bootstrap package group
  recipes-core: images: Add a basic bootstrap base image
  recipes-bsp: Create a bootstrap-initrd package
  recipes-core: images: Introduce tisdk-bootstrap-image
  images: Build tisdk-bootstrap-image with tisdk-core-bundle
  meta-arago-extras: recipes-devtools: eventdump: Fix linking against
    local library

Priya N S (2):
  wayland: weston: Disable weston systemd service
  weston-init: Update initscript for weston-calibration

Ryan Eatmon (12):
  images: Build tisdk-thinlinux-image with tisdk-core-bundle
  arm-benchmarks: Bump SRCREV to fix for CPU frequency calculations
  psplash: Update patches to match newer psplash version
  matrix-gui: Disable auto-startup for am62xx-evm
  ti-tisdk-setup: Bump to 08.03.00.005 release
  packagegroups: Mirror ti-test change from meta-ti
  all: Remove reference to arago-project.org
  tisdk-core-bundle: Remove .bin files from being deployed
  all: Stop using git://git.ti.com
  oe-core: Fix rm_work issue with some packages from oe-core.
  ti-test: Remove stream package
  packagegroup-arago-tisdk-addons: Remove stream-openmp

Sai Sree Kartheek Adivi (2):
  qtbase-conf: Unset fixed HDMI mode
  tisdk-default-image: Add docker support

Yogesh Siraswar (1):
  packagegroup-arago-base-tisdk: Fix issue with optee pkgs not being
    included

 meta-arago-distro/README                      |  2 +-
 .../classes/tisdk-bundle.bbclass              | 12 ++---
 meta-arago-distro/conf/distro/arago.conf      | 11 ++--
 .../conf/distro/include/branding-bleeding.inc |  4 +-
 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 ++++++++
 .../linuxptp/linuxptp_3.0.bbappend            |  2 +-
 .../recipes-core/base-files/base-files/issue  |  2 +-
 .../base-files/base-files/issue.net           |  2 +-
 .../feed-config/arago-feed-config_1.0.bb      |  2 +-
 .../recipes-core/images/arago-image.inc       |  1 +
 .../recipes-core/images/arago-tiny-image.inc  |  9 ++++
 .../recipes-core/images/tisdk-base-image.bb   |  6 ++-
 .../images/tisdk-bootstrap-base-image.bb      | 22 ++++++++
 .../images/tisdk-bootstrap-image.bb           | 22 ++++++++
 .../recipes-core/images/tisdk-core-bundle.bb  | 10 +++-
 .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
 .../images/tisdk-default-image.bb             |  6 ++-
 .../images/tisdk-thinlinux-image.bb           | 26 +++++++++
 .../recipes-core/images/tisdk-tiny-image.bb   | 23 ++++----
 .../meta/external-arm-toolchain.bbappend      |  4 +-
 .../packagegroup-arago-base-tisdk.bb          |  5 +-
 .../packagegroup-arago-bootstrap.bb           | 53 +++++++++++++++++++
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  4 +-
 .../packagegroup-arago-tisdk-addons.bb        |  1 -
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |  4 +-
 .../recipes-core/packagegroups/ti-test.bb     |  8 +--
 .../0001-psplash-Add-Arago-custom-color.patch | 19 +++----
 .../psplash/psplash/psplash-18bpp.patch       | 37 +++++++------
 .../opkg-utils/opkg-utils_%.bbappend          |  3 ++
 .../recipes-devtools/swig/swig_%.bbappend     |  3 ++
 .../recipes-extended/bc/bc_%.bbappend         |  3 ++
 .../wayland/weston-init.bbappend              |  5 +-
 .../recipes-graphics/wayland/weston-init/init | 19 +++++--
 .../linux-libc-headers_5.10.bb                |  4 +-
 .../qt5/qtbase-conf/eglfs_kms_cfg.json        |  5 +-
 .../recipes-qt/qt5/qtwebengine_git.bbappend   |  4 --
 ...automake-treat-sbin-as-exec-not-data.patch | 35 ++++++++++++
 .../cifs/cifs-utils_6.14.bbappend             |  4 ++
 .../oe-layersetup/oe-layersetup.bb            |  2 +-
 .../ti-tisdk-makefile_1.0.bb                  |  2 +-
 .../ti-tisdk-setup/ti-tisdk-setup.bb          |  6 +--
 .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------
 .../barcode-demo/barcode-roi_git.bb           |  2 +-
 .../big-data-ipc-demo/big-data-ipc-demo.inc   |  4 +-
 .../recipes-apps/evse-hmi/evse-hmi_git.bb     |  2 +-
 .../image-gallery/image-gallery_git.bb        |  2 +-
 .../mmwavegesture-hmi_git.bb                  |  2 +-
 .../pdm-anomaly-detection_git.bb              |  2 +-
 .../point-cloud-viewer_git.bb                 |  2 +-
 .../protection-relays-hmi_git.bb              |  2 +-
 .../thermostat-demo/qt-tstat_2.0.bb           |  2 +-
 ...-opencv-opencl-opengl-multithreaded_git.bb |  2 +-
 .../arm-benchmarks/arm-benchmarks_1.3.bb      |  4 +-
 .../recipes-benchmark/stream/stream_5.10.bb   |  2 +-
 .../switch-config/switch-config_git.bb        |  2 +-
 .../recipes-connectivity/hostap/hostap.inc    |  2 +-
 .../wpa-supplicant/wpa-supplicant.inc         |  2 +-
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb |  2 +-
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb       | 12 +++--
 .../matrix/matrix-gui-apps-git.inc            |  4 +-
 .../matrix/matrix-gui-browser_2.0.bb          |  2 +-
 .../matrix/matrix-gui-crypto-demos_2.0.bb     |  3 --
 .../recipes-core/matrix/matrix-gui_2.0.bb     |  6 ++-
 .../recipes-core/matrix/refresh-screen_2.0.bb |  2 +-
 .../recipes-core/meta/meta-toolchain-arago.bb | 22 ++++----
 .../oprofile-example/oprofile-example_git.bb  |  2 +-
 .../ti-crypto-examples_git.bb                 |  4 +-
 .../eventdump/eventdump_git.bb                |  7 ++-
 ...Play_nicer_with_bitbake-OpenEmbedded.patch | 34 ++++++++++++
 .../ltp-ddt/ltp-ddt_20210524.bb               |  6 +--
 .../recipes-devtools/statcol/statcol.bb       |  4 +-
 .../util-scripts/glsdk-util-scripts.bb        |  2 +-
 .../glsdk-example-apps/glsdk-example-apps.bb  |  2 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          |  2 +-
 .../omapdrmtest/omapdrmtest_1.0.0.bb          |  2 +-
 .../ti-gc320-tests_5.0.11.p7.bb               |  2 +-
 .../{pcitest_5.4.bb =3D> pcitest_5.10.bb}       |  8 +--
 .../amsdk-av-files/amsdk-av-files_1.4.bb      |  2 +-
 .../dual-camera-demo/dual-camera-demo_1.0.bb  |  2 +-
 .../gstreamer1.0-plugins-dsp66_git.bb         |  2 +-
 .../gstreamer1.0-plugins-ducati_git.bb        |  2 +-
 .../gstreamer1.0-plugins-hevc_git.bb          |  2 +-
 .../gstreamer1.0-plugins-vpe_git.bb           |  2 +-
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb  |  2 +-
 .../recipes-support/cclink/ccief-basic_git.bb |  4 +-
 .../recipes-support/devmem2/devmem2.bbappend  |  5 --
 ...ort-different-page-sizes-at-run-time.patch | 35 ------------
 .../tensorflow-lite-demo_git.bb               |  2 +-
 .../recipes-ti/fftlib/fftlib.inc              |  4 +-
 .../recipes-ti/libarch/libarch.inc            |  2 +-
 .../recipes-ti/linalg/linalg.inc              |  4 +-
 .../recipes-ti/llvm-rtos/llvm-rtos.inc        |  4 +-
 .../recipes-ti/ocl-rtos/clocl-win_git.bb      |  2 +-
 meta-arago-extras/recipes-ti/ocl/ocl.inc      |  4 +-
 .../recipes-ti/ocl/opencl-tidl-fw_git.bb      |  4 +-
 .../recipes-ti/openmpacc/openmpacc.inc        |  4 +-
 .../recipes-ti/tidl-api/tidl-api.inc          |  4 +-
 .../recipes-ti/tidl-utils/tidl-utils.inc      |  2 +-
 .../recipes-ti/tiovx/tiovx-lib-host.bb        |  2 +-
 .../recipes-ti/tiovx/tiovx-sys.inc            |  2 +-
 100 files changed, 461 insertions(+), 234 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootst=
rap-initrd_1.0.bb
 create mode 100644 meta-arago-distro/recipes-core/images/arago-tiny-imag=
e.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap=
-base-image.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap=
-image.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-thinlinux=
-image.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-bootstrap.bb
 create mode 100644 meta-arago-distro/recipes-devtools/opkg-utils/opkg-ut=
ils_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/swig/swig_%.bbappe=
nd
 create mode 100644 meta-arago-distro/recipes-extended/bc/bc_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbap=
pend
 create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils/000=
1-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
 create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils_6.1=
4.bbappend
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv=
/k3/uEnv.txt
 create mode 100644 meta-arago-extras/recipes-devtools/eventdump/files/00=
01-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
 rename meta-arago-extras/recipes-kernel/pcitest/{pcitest_5.4.bb =3D> pci=
test_5.10.bb} (56%)
 delete mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2.bba=
ppend
 delete mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2/000=
1-devmem2-support-different-page-sizes-at-run-time.patch

--=20
2.25.1


