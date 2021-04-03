Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E42E052A27
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7EEE340C90;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TjCU1tzLHamv; Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 635AD40A77;
	Sat,  3 Apr 2021 00:11:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2B93A174577;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:15 -0400
Message-Id: <1617408644-2675-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 00/29] hardknott/master fixes
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:42 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Set of fixes for meta-arago hardknott/master. Uses "internal" gcc10 toolchain
(selected with TOOLCHAIN_TYPE=internal) and still requires extra fixes to use
external prebuilt Arm toolchain from meta-arm.

gcc10 "multiple definition" errors are currently suppressed. Components with too
many non-trivial gcc10 errors are disabled. Proper fixing in code is needed.

https://gcc.gnu.org/gcc-10/porting_to.html

Denys Dmytriyenko (29):
  arago.conf: remove LIBC_DEPENDENCIES mod needed for
    external-arm-toolchain
  sourceipk,tisdk-bundle,packagegroup-*-sdk-host: rename ${PN}-src to
    ${PN}-source
  toolchain-gcc: update component versions of internal toolchain
  recipes: fix trailing slash in path warning
  nativesdk-packagegroup: fix QA warning for inheriting classes after
    nativesdk
  perl: skip shebang-size QA check for nativesdk-perl packages
  weston: update bbappend 8.0.0 -> 9.0.0
  gstreamer-plugins: unify removal of GFX options for headless platforms
  gstreamer1.0-plugins-good: upgrade 1.16 -> 1.18
  gstreamer1.0-plugins-hevc: suppress gcc10 multiple definitions of
    buffArray
  branding-core: remove mmip, as gstreamer patches need porting to 1.18
  libdrm: massage test patch to apply against latest version
  lmbench: remove very old SDK optimization that no longer apply
  iproute2: drop upstreamed patch for HSR/PRP support
  linuxptp: update bbappend against latest upstream
  kmscube: pin down version before GL3+ features were merged
  netperf: drop upstreamed PACKAGECONFIG, suppress gcc10 multiple
    definition
  packagegroup-*-server-extra: replace dhcp-client with dhcpcd
  meta-toolchain-arago: opkg.conf in SDK now also resides in /etc/opkg/
  php: suppress installed-vs-shipped QA error
  ti-llvm3.6: suppress installed-vs-shipped QA error
  matrix-gui-apps: suppress installed-vs-shipped QA error
  matrix-gui: lighttpd-module-compress replaced with
    lighttpd-module-deflate
  statcol: suppress "ldflags" QA error
  kms++: update to the latest
  FIXME: packagegroup-addons: disable kms++-python bindings, due to
    meson build issues
  FIXME: packagegroup-connectivity: disable net-snmp, IEC-62439-3
    doesn't build with gcc10
  FIXME: ti-test: disable ltp-ddt due to gcc10 build errors
  FIXME: arago.conf: disable opencl, as it's broken

 meta-arago-distro/classes/sourceipk.bbclass        |  22 ++---
 meta-arago-distro/classes/tisdk-bundle.bbclass     |   2 +-
 meta-arago-distro/conf/distro/arago.conf           |   4 +-
 .../conf/distro/include/branding-core.inc          |   3 +
 .../conf/distro/include/toolchain-gcc.inc          |   8 +-
 .../0001-Makefile-Add-TI-SDK-Modifications.patch   |  75 --------------
 .../recipes-benchmark/lmbench/lmbench_%.bbappend   |  23 -----
 ...add-support-for-creating-PRP-device-simil.patch | 109 ---------------------
 .../iproute2/iproute2_%.bbappend                   |   1 -
 .../linuxptp/linuxptp_%.bbappend                   |   6 +-
 .../packagegroup-arago-base-tisdk-server-extra.bb  |   2 +-
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  74 +++++++-------
 .../packagegroup-arago-tisdk-addons.bb             |   2 +-
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |   6 +-
 .../packagegroup-arago-tisdk-connectivity.bb       |   4 +-
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |  16 +--
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  |   4 +-
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb       |  18 ++--
 .../packagegroup-arago-tisdk-matrix-sdk-host.bb    |   6 +-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |  12 +--
 .../packagegroup-arago-tisdk-opencl-sdk-host.bb    |   8 +-
 .../packagegroup-arago-tisdk-qte-sdk-host.bb       |   4 +-
 .../recipes-core/packagegroups/ti-test.bb          |   2 +-
 .../recipes-devtools/perl/perl_%.bbappend          |  12 +++
 .../recipes-devtools/php/php_%.bbappend            |   2 +
 ...001-Add-option-to-run-a-test-indefinitely.patch |  29 +++---
 .../recipes-graphics/kmscube/kmscube_%.bbappend    |   6 +-
 ...weston_8.0.0.bbappend => weston_9.0.0.bbappend} |   0
 ....%.bbappend => gstreamer1.0-plugins-%.bbappend} |   0
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend       |   6 --
 .../gstreamer1.0-plugins-base_1.16.%.bbappend      |   6 --
 .../recipes-support/netperf/netperf_git.bbappend   |   3 +-
 .../recipes-tisdk/oe-layersetup/oe-layersetup.bb   |   2 +-
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |   2 +-
 .../image-gallery/image-gallery_git.bb             |   2 +-
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb   |   2 +-
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb            |   1 +
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |   2 +
 .../recipes-core/matrix/matrix-gui_2.0.bb          |   2 +-
 .../recipes-core/meta/meta-toolchain-arago.bb      |   2 +-
 ...ivesdk-packagegroup-arago-qte-toolchain-host.bb |   2 +-
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |   2 +-
 .../recipes-devtools/statcol/statcol.bb            |   2 +
 .../recipes-graphics/kms++/kms++_git.bb            |  12 ++-
 .../gstreamer1.0-plugins-hevc_git.bb               |   1 +
 ...ix-build-on-EGL-platform-without-X11-head.patch |  36 -------
 ...d => gstreamer1.0-plugins-good_1.18.%.bbappend} |   1 -
 .../recipes-ti/tidl-utils/tidl-import_git.bb       |   2 +-
 48 files changed, 159 insertions(+), 389 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
 delete mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
 create mode 100644 meta-arago-distro/recipes-devtools/perl/perl_%.bbappend
 rename meta-arago-distro/recipes-graphics/wayland/{weston_8.0.0.bbappend => weston_9.0.0.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.%.bbappend => gstreamer1.0-plugins-%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.%.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.%.bbappend => gstreamer1.0-plugins-good_1.18.%.bbappend} (84%)

-- 
2.7.4


