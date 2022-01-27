Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.21533.1643242928020573123
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B9F9A40CBF
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcZXZTx2Q0Re for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7D8740C82
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1702D174728
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 00/23] Sync up with Dunfell
Date: Wed, 26 Jan 2022 19:21:41 -0500
Message-Id: <1643242924-25090-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Latest sync up of master branch with all the recent changes in dunfell before
dealing with new override syntax that happened in honister.

Denys Dmytriyenko (4):
  recipes: update github SRC_URIs
  linux-ti-staging: enable necessary configs for running docker
    containers
  packagegroup-arago-base: add docker runtime to the base and default
    rootfs
  linux-ti-staging: move docker.cfg to be accessible by rt/systest
    variants

Praneeth Bajjuri (1):
  Update the ltp-ddt to latest

Priya N S (1):
  ti-tisdk-makefile: Remove barcode-roi snippet

Ryan Eatmon (2):
  ltp-ddt: Bump ltp-ddt version for 08.01.00.005
  dma-heap-tests: patch to fix cmake linking issue

Sidraya (2):
  ti-test: Add viddec-test-app for j7-evm
  ti-test: Add videnc-test-app for j7-evm

Sinthu Raja (3):
  ltp-ddt: Update to latest srcrev for 08.01.00.001
  linux-firmware: Package intel 9260 WiFi and BT firmware
  packagegroups: tisdk-connectivity: package intel-9260 linux firmware
    images

Vivien Didelot (2):
  qtbase-conf: disable the seccomp filter sandbox
  qtwebengine: remove seccomp filter sandbox hack

Yogesh Siraswar (8):
  branding-bleeding: Add AUTOREV support for ti-linux-fw
  arago.conf: bump distro version
  packagegroups: pru-icss: Add support for am64xx
  ltp-ddt: Bump ltp-ddt version for 08.01.00.002
  ltp-ddt: Bump ltp-ddt version for 08.01.00.003
  branding-bleeding: Add AUTOREV for K3 Image Gen
  arago: conf: Add am64x hs platform
  conf: arago: Add j7200 hs platform support

 meta-arago-distro/conf/distro/arago.conf           |  4 ++-
 .../conf/distro/include/branding-bleeding.inc      |  6 ++++
 .../packagegroups/packagegroup-arago-base.bb       |  1 +
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  6 +++-
 .../packagegroup-arago-tisdk-addons.bb             |  4 +--
 .../packagegroup-arago-tisdk-connectivity.bb       |  4 ++-
 .../recipes-core/packagegroups/ti-test.bb          |  2 ++
 .../wayland/wayland-ivi-extension_2.2.0.bb         |  2 +-
 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++-
 meta-arago-distro/recipes-kernel/linux/docker.inc  |  4 +++
 .../recipes-kernel/linux/files/docker.cfg          | 20 ++++++++++++++
 .../linux/linux-ti-staging-rt_%.bbappend           |  1 +
 .../linux/linux-ti-staging-systest_%.bbappend      |  1 +
 .../linux/linux-ti-staging_%.bbappend              |  1 +
 .../recipes-qt/qt5/qtbase-conf/qt_env.sh           |  5 ++++
 .../recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh     |  5 ++++
 ...-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch | 32 ----------------------
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |  4 ---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  8 ++++--
 .../recipes-devtools/cpuloadgen/cpuloadgen_git.bb  |  2 +-
 .../recipes-devtools/dma-heap/dma-heap-tests.bb    |  4 ++-
 ...Variable-name-change-to-fix-compile-error.patch | 32 ++++++++++++++++++++++
 .../recipes-devtools/eventdump/eventdump_git.bb    |  2 +-
 .../recipes-devtools/ion/ion-tests_git.bb          |  2 +-
 .../recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb   |  6 ++--
 .../recipes-devtools/omapconf/omapconf_git.bb      |  2 +-
 .../websocketd/websocketd_0.4.1.bb                 |  2 +-
 .../recipes-extended/ltp/ltp_20210524.bb           |  2 +-
 .../recipes-graphics/devil/devil_1.8.0.bb          |  2 +-
 .../recipes-graphics/glfw/glfw_git.bb              |  2 +-
 .../recipes-graphics/kms++/kms++_git.bb            |  2 +-
 .../recipes-support/mstpctl/mstpd_git.bb           |  2 +-
 meta-arago-extras/recipes-support/stb/stb_git.bb   |  2 +-
 33 files changed, 127 insertions(+), 61 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
 create mode 100644 meta-arago-distro/recipes-kernel/linux/files/docker.cfg
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine/0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch
 create mode 100644 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch

-- 
2.7.4

