Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 89333520DF
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B732940BF9;
	Thu, 12 Sep 2019 15:38:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LSXCMQr5hrX2; Thu, 12 Sep 2019 15:38:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8E75540A58;
	Thu, 12 Sep 2019 15:38:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 61343173B70;
	Thu, 12 Sep 2019 11:38:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:05 -0400
Message-Id: <1568302717-46518-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 00/32] Prepping up master to work with upcoming Zeus 3.0
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
X-List-Received-Date: Thu, 12 Sep 2019 15:39:52 -0000

The first patchset of fixes to get master into shape to work with upcoming
Zeus 3.0 Yocto Project release, using gcc9 toolchain.

There will be another set with more hacks to disable broken components.

Denys Dmytriyenko (32):
  toolchain-gcc: update to match current internal toolchain versions
  meta-toolchain-arago: tar_sdk() was renamed to archive_sdk() upstream
  sourceipk.bbclass: avoid adding duplicate ${PN}-src
  uboot-sign: sync up with upstream
  kernel-fitimage: replace tabs with spaces in python code
  external-*-bfd-version: replace tabs with spaces in python code
  nativesdk-buildtools-perl-dummy: list additional modules
  strace: drop 4.26 that was temporarily overlayed due to k4.19 api
  ipsec-tools: drop local bbappend, ipsec-tools is deprecated and
    removed
  llvm: replace obsolete ${COREBASE}/LICENSE, point to proper MIT
    license
  openssl10: remove bbappend and local patches
  libnl: update bbappend 3.4.0 -> 3.5.0
  mbedtls: update bbappend 2.13.0 -> 2.16.2
  weston: update bbappend 5.0.0 -> 7.0.0
  weston: our patches need rebasing for 7.0.0, disable for now
  weston-conf: rename 5.0.0 -> 7.0.0 to match main weston version
  linux-firmware: update bbappend to be version-agnostic
  iproute2: overlay 4.19 locally for now, as upstream moved to 5.2
  python-numpy: overlay last version compatible with python2
  opencv: switch from python3 to python2 for now due to issues with 3.7
  systemd: sysinit.target.wants no longer exists
  ltp-ddt: backport fixes for glibc >2.28
  point-cloud-viewer: binary-only package, skip file-rdeps QA checks
  machine_features_check: class for checking MACHINE_FEATURES flags
  opencv: require "dsp" machine feature
  barcode-roi,packagegroups,matrix: require "dsp" machine feature
  armnn,packagegroups: require "dsp" machine feature
  voxelsdk,packagegroups: require "dsp" machine feature
  branding-core: temp disable "dsp" and "mmip" machine features due to
    breakage
  packagegroup-*-graphics: disable wayland-ivi-extension
  packagegroup-*-graphics: disable chromium-wayland
  packagegroup-*-qte: qtwebkit-examples no longer exists

 meta-arago-distro/classes/kernel-fitimage.bbclass  |   6 +-
 .../classes/machine_features_check.bbclass         |  31 ++
 meta-arago-distro/classes/sourceipk.bbclass        |   4 +-
 meta-arago-distro/classes/uboot-sign.bbclass       | 126 +++--
 .../conf/distro/include/branding-core.inc          |   4 +
 .../conf/distro/include/toolchain-gcc.inc          |  12 +-
 .../recipes-apps/voxelsdk/voxelsdk_%.bbappend      |   3 +
 .../recipes-connectivity/iproute2/iproute2.inc     |  54 ++
 .../iproute2/0001-ip-Remove-unneed-header.patch    |  30 ++
 .../0001-libc-compat.h-add-musl-workaround.patch   |  41 ++
 .../iproute2/iproute2/configure-cross.patch        |  32 ++
 .../iproute2/iproute2_4.19.0.bb                    |  14 +
 ...tls_2.13.0.bbappend => mbedtls_2.16.2.bbappend} |   0
 ...1-Add-AF_ALG-interface-support-to-OpenSSL.patch | 578 ---------------------
 ...todev-Fix-issue-with-signature-generation.patch | 445 ----------------
 ...cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch |  59 ---
 ...0002-cryptodev-allow-copying-EVP-contexts.patch | 202 -------
 .../openssl10/0004-Sample-AF_ALG-openssl.cnf.patch |  36 --
 ...ev-Add-SHA224-initialization-to-cryptodev.patch |  27 -
 ...dd-AES-CBC-CTR-modes-for-128-192-256-bit-.patch | 142 -----
 .../openssl/openssl10_%.bbappend                   |  27 -
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |   9 +-
 .../packagegroup-arago-tisdk-addons.bb             |   9 +-
 .../packagegroup-arago-tisdk-graphics.bb           |  14 +-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  12 +-
 ...ckagegroup-arago-tisdk-multimedia-sdk-target.bb |  12 +-
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |   3 -
 .../recipes-core/systemd/systemd_%.bbappend        |   2 +-
 ...h-usr-and-so-on-for-libraries-by-default-.patch |  77 +++
 .../files/0001-npy_cpu-Add-riscv-support.patch     |  24 +
 .../python-numpy/files/aarch64/_numpyconfig.h      |  32 ++
 .../python-numpy/files/aarch64/config.h            | 139 +++++
 .../python-numpy/files/arm/config.h                |  21 +
 .../python-numpy/files/arm/numpyconfig.h           |  17 +
 .../python-numpy/files/armeb/config.h              |  21 +
 .../python-numpy/files/armeb/numpyconfig.h         |  17 +
 .../files/mipsarchn32eb/_numpyconfig.h             |  31 ++
 .../python-numpy/files/mipsarchn32eb/config.h      | 139 +++++
 .../files/mipsarchn32el/_numpyconfig.h             |  31 ++
 .../python-numpy/files/mipsarchn32el/config.h      | 138 +++++
 .../files/mipsarchn64eb/_numpyconfig.h             |  32 ++
 .../python-numpy/files/mipsarchn64eb/config.h      | 139 +++++
 .../files/mipsarchn64el/_numpyconfig.h             |  32 ++
 .../python-numpy/files/mipsarchn64el/config.h      | 138 +++++
 .../files/mipsarcho32eb/_numpyconfig.h             |  32 ++
 .../python-numpy/files/mipsarcho32eb/config.h      | 139 +++++
 .../python-numpy/files/mipsarcho32el/config.h      |  21 +
 .../python-numpy/files/mipsarcho32el/numpyconfig.h |  18 +
 .../python-numpy/files/powerpc/_numpyconfig.h      |  32 ++
 .../python-numpy/files/powerpc/config.h            | 139 +++++
 .../python-numpy/files/powerpc64/_numpyconfig.h    |  32 ++
 .../python-numpy/files/powerpc64/config.h          | 139 +++++
 .../python-numpy/files/riscv64/_numpyconfig.h      |  32 ++
 .../python-numpy/files/riscv64/config.h            | 139 +++++
 .../python-numpy/files/x86-64/_numpyconfig.h       |  32 ++
 .../python-numpy/files/x86-64/config.h             | 139 +++++
 .../python-numpy/files/x86/config.h                | 108 ++++
 .../python-numpy/files/x86/numpyconfig.h           |  24 +
 .../recipes-devtools/python-numpy/python-numpy.inc | 116 +++++
 .../python-numpy/python-numpy_1.16.3.bb            |  10 +
 .../python-numpy/python3-numpy_1.16.3.bb           |   3 +
 ...hen-using-non-glibc-libc-implementation-o.patch |  34 --
 .../0001-caps-abbrev.awk-fix-gawk-s-path.patch     |  47 --
 .../strace/strace/0001-mips-o32-fix-build.patch    |  98 ----
 ...tion-Check-for-mips-and-alpha-before-usin.patch |  34 --
 .../strace/strace/Makefile-ptest.patch             |  49 --
 .../strace/strace/disable-git-version-gen.patch    |  37 --
 .../strace/strace/mips-SIGEMT.patch                |  33 --
 ...-robust-test-for-m32-mx32-compile-support.patch |  45 --
 .../recipes-devtools/strace/strace/run-ptest       |   2 -
 .../strace/strace/update-gawk-paths.patch          | 127 -----
 .../recipes-devtools/strace/strace_4.26.bb         |  57 --
 .../{weston-conf_5.0.0.bb => weston-conf_7.0.0.bb} |   0
 .../recipes-graphics/wayland/weston_5.0.0.bbappend |  31 --
 .../recipes-graphics/wayland/weston_7.0.0.bbappend |  29 ++
 ...ware_git.bbappend => linux-firmware_%.bbappend} |   0
 .../recipes-support/armnn/armnn_%.bbappend         |   3 +
 .../ipsec-tools/ipsec-tools_%.bbappend             |   3 -
 .../{libnl_3.4.0.bbappend => libnl_3.5.0.bbappend} |   0
 .../recipes-support/opencv/opencv_%.bbappend       |   3 +
 .../recipes-support/opencv/opencv_3.1.bbappend     |   3 +
 .../recipes-apps/barcode-demo/barcode-roi_git.bb   |   4 +
 .../point-cloud-viewer/point-cloud-viewer_git.bb   |   2 +-
 meta-arago-extras/recipes-core/llvm/llvm-common.bb |   4 +-
 .../matrix/matrix-gui-machinevision-demos_2.0.bb   |   6 +-
 .../recipes-core/meta/external-arm-bfd-version.inc |   6 +-
 .../meta/external-linaro-bfd-version.inc           |   6 +-
 .../recipes-core/meta/meta-toolchain-arago.bb      |   2 +-
 .../meta/nativesdk-buildtools-perl-dummy.bbappend  |   4 +
 ...re-time-check-for-getdents-getdents64-API.patch |  72 +++
 ...name-getcpu-to-avoid-conflict-with-glibc-.patch |  57 ++
 ...-check-for-RES_USE_INET6-during-configure.patch |  68 +++
 .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |   3 +
 93 files changed, 2775 insertions(+), 2211 deletions(-)
 create mode 100644 meta-arago-distro/classes/machine_features_check.bbclass
 create mode 100644 meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-ip-Remove-unneed-header.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/configure-cross.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bb
 rename meta-arago-distro/recipes-connectivity/mbedtls/{mbedtls_2.13.0.bbappend => mbedtls_2.16.2.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0001-cryptodev-Fix-issue-with-signature-generation.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0002-cryptodev-allow-copying-EVP-contexts.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0004-Sample-AF_ALG-openssl.cnf.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/arm/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/arm/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/armeb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python-numpy.inc
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/Makefile-ptest.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/disable-git-version-gen.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/mips-SIGEMT.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
 delete mode 100755 meta-arago-distro/recipes-devtools/strace/strace/run-ptest
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace/update-gawk-paths.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/strace/strace_4.26.bb
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf_5.0.0.bb => weston-conf_7.0.0.bb} (100%)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
 rename meta-arago-distro/recipes-kernel/linux-firmware/{linux-firmware_git.bbappend => linux-firmware_%.bbappend} (100%)
 create mode 100644 meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.4.0.bbappend => libnl_3.5.0.bbappend} (100%)
 create mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch

-- 
2.7.4


