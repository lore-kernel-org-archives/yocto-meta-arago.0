Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 7A69352ABC
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:21 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW002IZ5RR2RA0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KZwvylsD c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=Jmf-N-4GpBAihQ9NJS8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DD381161AC2;	Thu,
	2 Jul 2015 23:02:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:19 -0400
Message-id: <1435892533-6046-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 00/54] First batch of fixes for fido/master
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is the first batch of fixes for making meta-arago work with Fido/1.8
version of the Yocto Project and prebuilt Linaro gcc-4.9 toolchain. This
patchset enables very rough building of tisdk-rootfs-image but is not yet
complete and hasn't been properly tested and validated yet.

Denys Dmytriyenko (54):
  gcc: remove local overlay of 4.7 recipes
  external-arago-toolchain: remove old gcc-4.5 based arago toolchain
  libnl: remove old local copies of 2.0 and 3.2.24 versions
  opkg: fix accepted upstream, remove locally
  perl-native: upstreamed
  udev-extraconf: fix accepted upstream, remove locally
  ti-csl: available in meta-ti as common-csl-ip
  ti-rm: available in meta-ti as rm-lld
  leveldb: available from meta-oe now, remove locally
  php: update to latest version, drop upstreamed fixes
  crda: remove older version
  powertop: remove upstreamed local fix
  v4l-utils: remove local updates to the older version
  curl: remove local configuration of older version, uses PACKAGECONFIG
    now
  qt4: update bbappends from 4.8.5 to 4.8.6
  packagegroup: now setting PACKAGE_ARCH must be before inherit
    packagegroup
  arm-benchmarks: changes are version-agnostic, rename bbappend
    accordingly
  stream: changes are version-agnostic, rename bbappend accordingly
  openssh: changes are version-agnostic, rename bbappend accordingly
  base-files: changes are version-agnostic, rename bbappend accordingly
  busybox: changes are version-agnostic, rename bbappend accordingly
  dbus: changes are version-agnostic, rename bbappend accordingly
  dropbear: changes are version-agnostic, rename bbappend accordingly
  udev: changes are version-agnostic, rename bbappend accordingly
  bash: changes are version-agnostic, rename bbappend accordingly
  shadow-securetty: changes are version-agnostic, rename bbappend
    accordingly
  init-ifupdown: changes are version-agnostic, rename bbappend
    accordingly
  freetype: changes are version-agnostic, rename bbappend accordingly
  tslib: changes are version-agnostic, rename bbappend accordingly
  gnutls: changes are version-agnostic, rename bbappend accordingly
  boost: changes are version-agnostic, rename bbappend accordingly
  pulseaudio: changes are version-agnostic, rename bbappend accordingly
  thttpd: changes are version-agnostic, rename bbappend accordingly
  lmbench: changes are version-agnostic, rename bbappend accordingly,
    mandir was fixed upstream
  openobex: make bbappend version-agnostic, fix build when B != S
  libnl: install netlink-private headers
  libdrm: update bbappend and patch to the new 2.4.59 version
  oprofile: update to the latest 1.0.0 version
  libav: update to the latest 9.16 version
  gstreamer: update from 1.2.3 to 1.4.5, disable local patches for now
  strongswan: move from extras to distro
  obexd: move from extras to distro, fix build when B != S
  thttpd: fix build issue for B != S
  copy-defconfig: fix when B != S
  iperf: fix build when B != S
  ltp-ddt: fix build when B != S
  openntpd, matrix-gui, omapconf: fix LICENSE field
  ti-wifi-utils: pass CC to fix build issue with new toolchain
  arago-prefs, toolchain*: update toolchain component versions
  external-linaro-toolchain-cross: recipe to stage unwind.h required for
    target gcc
  external-linaro-toolchain: workaround static stdc++, fix conflicting
    uapi .install file
  packagegroup-*-standalone-sdk-target: libstdc++-dev should pull
    libstdc++ automatically
  HACK: packagegroup-*-console: disable ltrace for now, breaks with
    latest toolchain
  HACK: packagegroup-*-connectivity*: disable ti-compat-wireless, as it
    breaks with latest toolchain

 meta-arago-distro/conf/distro/arago.conf           |    3 +
 .../conf/distro/include/arago-prefs.inc            |   22 +-
 .../conf/distro/include/branding-mcsdk.inc         |    2 +-
 .../conf/distro/include/toolchain-gcc.inc          |   12 +-
 .../conf/distro/include/toolchain-linaro.inc       |   10 +-
 ...arks_1.3.bbappend => arm-benchmarks_%.bbappend} |    0
 ...{lmbench_3.0-a9.bbappend => lmbench_%.bbappend} |    6 +-
 .../{stream_5.10.bbappend => stream_%.bbappend}    |    0
 .../openobex_%.bbappend}                           |    8 +-
 .../{openssh_6.5p1.bbappend => openssh_%.bbappend} |    0
 ...files_3.0.14.bbappend => base-files_%.bbappend} |    0
 ...{busybox_1.22.1.bbappend => busybox_%.bbappend} |    0
 .../dbus/{dbus_1.6.18.bbappend => dbus_%.bbappend} |    0
 ...opbear_2014.63.bbappend => dropbear_%.bbappend} |    0
 .../init-ifupdown/init-ifupdown_%.bbappend}        |    0
 .../packagegroup-arago-base-tisdk-server-extra.bb  |    6 +-
 .../packagegroups/packagegroup-arago-base.bb       |    6 +-
 .../packagegroups/packagegroup-arago-console.bb    |   11 +-
 .../packagegroup-arago-gst-sdk-target.bb           |    6 +-
 .../packagegroups/packagegroup-arago-gst.bb        |    6 +-
 .../packagegroups/packagegroup-arago-qte.bb        |    6 +-
 .../packagegroups/packagegroup-arago-test.bb       |    6 +-
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    6 +-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |    6 +-
 .../packagegroup-arago-tisdk-addons.bb             |    6 +-
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    6 +-
 .../packagegroup-arago-tisdk-amsdk.bb              |    6 +-
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    8 +-
 ...agegroup-arago-tisdk-connectivity-sdk-target.bb |    6 +-
 .../packagegroup-arago-tisdk-connectivity.bb       |    8 +-
 .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |    6 +-
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb  |    6 +-
 .../packagegroup-arago-tisdk-crypto.bb             |    6 +-
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  |    6 +-
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb |    6 +-
 .../packagegroup-arago-tisdk-graphics.bb           |    6 +-
 .../packagegroup-arago-tisdk-matrix-sdk-host.bb    |    6 +-
 .../packagegroup-arago-tisdk-matrix.bb             |    6 +-
 ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    6 +-
 .../packagegroup-arago-tisdk-multimedia.bb         |    6 +-
 .../packagegroup-arago-tisdk-qte-sdk-host.bb       |    6 +-
 .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    6 +-
 .../packagegroup-arago-toolchain-tisdk-target.bb   |    6 +-
 .../recipes-core/udev/udev-extraconf/mount.sh      |   76 -
 .../recipes-core/udev/udev-extraconf_1.0.bbappend  |    4 -
 .../udev/{udev_182.bbappend => udev_%.bbappend}    |    0
 meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc |  146 -
 ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 -
 ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 -
 .../gcc/gcc-4.7/100-uclibc-conf.patch              |   39 -
 .../gcc/gcc-4.7/200-uclibc-locale.patch            | 2810 --------------------
 .../gcc/gcc-4.7/203-uclibc-locale-no__x.patch      |  235 --
 .../gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch  |   54 -
 .../gcc/gcc-4.7/205-uclibc-locale-update.patch     |  521 ----
 .../gcc/gcc-4.7/301-missing-execinfo_h.patch       |   15 -
 .../gcc/gcc-4.7/302-c99-snprintf.patch             |   15 -
 .../gcc/gcc-4.7/303-c99-complex-ugly-hack.patch    |   16 -
 .../gcc/gcc-4.7/304-index_macro.patch              |   30 -
 .../gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch  |   51 -
 .../gcc/gcc-4.7/306-libstdc++-namespace.patch      |   40 -
 .../recipes-devtools/gcc/gcc-4.7/64bithack.patch   |   63 -
 .../gcc/gcc-4.7/740-sh-pr24836.patch               |   31 -
 .../gcc/gcc-4.7/800-arm-bigendian.patch            |   36 -
 .../gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch          |   25 -
 .../gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch         |  165 --
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 -
 .../gcc/gcc-4.7/avoid-oob-array-access.patch       |   45 -
 .../gcc/gcc-4.7/cpp-honor-sysroot.patch            |   40 -
 .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 -
 .../gcc/gcc-4.7/disable-texinfo-5.patch            |  107 -
 .../gcc/gcc-4.7/disable_relax_pic_calls_flag.patch |   48 -
 .../recipes-devtools/gcc/gcc-4.7/disablesdt.patch  |   32 -
 .../gcc/gcc-4.7/fix-g++-sysroot.patch              |  428 ---
 .../gcc/gcc-4.7/fortran-cross-compile-hack.patch   |   32 -
 .../gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |   33 -
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  116 -
 .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 -
 .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 -
 .../gcc/gcc-4.7/gcc-poison-dir-extend.patch        |   27 -
 .../gcc-4.7/gcc-poison-system-directories.patch    |  223 --
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   72 -
 .../gcc/gcc-4.7/libgcc-sjlj-check.patch            |   61 -
 .../recipes-devtools/gcc/gcc-4.7/libtool.patch     |   29 -
 .../gcc/gcc-4.7/mips64-default-n64.patch           |   19 -
 .../gcc/gcc-4.7/optional_libstdc.patch             |   86 -
 .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   72 -
 .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ------
 .../gcc/gcc-4.7/ppce5500-e6500-support.patch       |  713 -----
 .../recipes-devtools/gcc/gcc-4.7/pr32219.patch     |   72 -
 .../gcc/gcc-4.7/rs6000-tables.patch                |  135 -
 .../gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch |   77 -
 .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |   87 -
 .../gcc/gcc-4.7/wcast-qual-PR55383.patch           |   43 -
 .../recipes-devtools/gcc/gcc-common.inc            |  124 -
 .../recipes-devtools/gcc/gcc-configure-common.inc  |  133 -
 .../recipes-devtools/gcc/gcc-cross-initial.inc     |   81 -
 .../recipes-devtools/gcc/gcc-cross-initial_4.7.bb  |    2 -
 .../recipes-devtools/gcc/gcc-cross.inc             |  185 --
 .../recipes-devtools/gcc/gcc-cross_4.7.bb          |    3 -
 .../recipes-devtools/gcc/gcc-crosssdk-initial.inc  |    8 -
 .../gcc/gcc-crosssdk-initial_4.7.bb                |    3 -
 .../recipes-devtools/gcc/gcc-crosssdk.inc          |   10 -
 .../recipes-devtools/gcc/gcc-crosssdk_4.7.bb       |    2 -
 .../recipes-devtools/gcc/gcc-linaro-4.7.inc        |   22 -
 .../gcc/gcc-linaro-4.7/64bithack.patch             |   27 -
 .../gcc/gcc-linaro-4.7/fix-g++-sysroot.patch       |   78 -
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   33 -
 .../gcc/gcc-linaro-4.7/optional_libstdc.patch      |   86 -
 .../use-defaults.h-and-t-oe-in-B.patch             |   80 -
 .../recipes-devtools/gcc/gcc-linaro-common-4.7.inc |    2 -
 .../recipes-devtools/gcc/gcc-multilib-config.inc   |  191 --
 .../recipes-devtools/gcc/gcc-runtime.inc           |  166 --
 .../recipes-devtools/gcc/gcc-runtime_4.7.bb        |    3 -
 .../recipes-devtools/gcc/gcc-target.inc            |  154 --
 meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb  |    2 -
 .../recipes-devtools/gcc/gcc_linaro-4.7.bb         |    4 -
 .../recipes-devtools/gcc/gcc_linaro-4.7.bbappend   |   76 -
 meta-arago-distro/recipes-devtools/gcc/libgcc.inc  |  143 -
 .../recipes-devtools/gcc/libgcc_4.7.bb             |    3 -
 .../php/fix-race-condition-during-install.patch    |   10 -
 .../{php_5.4.14.bbappend => php_5.5.21.bbappend}   |   11 +-
 .../bash/{bash_3.2.48.bbappend => bash_%.bbappend} |    0
 .../leveldb/0001-Explicitly-disable-tcmalloc.patch |   48 -
 .../recipes-extended/leveldb/leveldb_git.bb        |   27 -
 ....1.4.3.bbappend => shadow-securetty_%.bbappend} |    0
 .../thttpd/thttpd_%.bbappend}                      |    0
 ...001-Add-option-to-run-a-test-indefinitely.patch |   29 +-
 ...bdrm_2.4.52.bbappend => libdrm_2.4.59.bbappend} |    0
 ...freetype_2.5.2.bbappend => freetype_%.bbappend} |    0
 .../tslib/{tslib_1.1.bbappend => tslib_%.bbappend} |    0
 .../recipes-kernel/linux/copy-defconfig.inc        |    2 +-
 ...file_0.9.8.bbappend => oprofile_1.0.0.bbappend} |    0
 .../recipes-kernel/powertop/powertop_2.5.bbappend  |    3 -
 ....bbappend => gstreamer1.0-libav_1.4.5.bbappend} |    0
 .../{libav_0.8.9.bbappend => libav_9.16.bbappend}  |    0
 ...lseaudio_5.0.bbappend => pulseaudio_%.bbappend} |    0
 .../v4l2apps/v4l-utils_1.0.1.bbappend              |    7 -
 ...bbappend => nativesdk-qt4-tools_4.8.6.bbappend} |    0
 ...5.bbappend => qt4-embedded-gles_4.8.6.bbappend} |    0
 ..._4.8.5.bbappend => qt4-embedded_4.8.6.bbappend} |    0
 .../recipes-support/curl/curl_7.35.0.bbappend      |   23 -
 .../{gnutls_2.12.23.bbappend => gnutls_%.bbappend} |    0
 .../recipes-support/libnl/libnl_3.2.25.bbappend    |    8 +
 .../strongswan/files/strongswan_libsecstore.patch  |    0
 .../strongswan/strongswan_%.bbappend               |    0
 .../recipes-benchmark/iperf/iperf_2.0.5.bb         |    7 +-
 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb |   21 -
 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb   |   49 -
 .../recipes-connectivity/crda/crda_1.1.3.bbappend  |   15 -
 .../{obex => obexd}/obexd_0.34.bb                  |    4 +-
 .../openntpd/openntpd_3.9p1.bb                     |    2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 .../meta/external-arago-sdk-toolchain.bb           |  150 --
 .../recipes-core/meta/external-arago-toolchain.bb  |  261 --
 .../recipes-core/meta/external-arago-toolchain.inc |   76 -
 .../meta/external-arago-toolchain/SUPPORTED        |    4 -
 .../meta/external-linaro-toolchain-cross.bb        |   13 +
 .../meta/external-linaro-toolchain.bbappend        |    6 +-
 .../packagegroup-arago-qte-toolchain-target.bb     |    6 +-
 .../packagegroup-arago-standalone-sdk-target.bb    |    7 +-
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    4 +-
 .../recipes-devtools/omapconf/omapconf_git.bb      |    2 +-
 ...e-send-Collected-errors-messages-to-stder.patch |   32 -
 .../recipes-devtools/opkg/opkg_0.2.1.bbappend      |    6 -
 .../perl/perl-native_5.14.3.bbappend               |    9 -
 .../ti-wifi-utils/ti-wifi-utils-wl18xx.bb          |    3 +-
 .../recipes-extended/thttpd/thttpd_2.25b.bb        |    2 +-
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   23 -
 .../gstreamer1.0-plugins-bad_1.4.5.bbappend        |   23 +
 ...nd => gstreamer1.0-plugins-base_1.4.5.bbappend} |    0
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    6 -
 .../gstreamer1.0-plugins-good_1.4.5.bbappend       |    6 +
 ...ed-gles_4.8.5.bb => qt4-embedded-gles_4.8.6.bb} |    0
 .../{boost_1.55.0.bbappend => boost_%.bbappend}    |    0
 .../libnl/libnl-2.0/fix-pc-file.patch              |   17 -
 .../libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch |   29 -
 .../libnl/libnl-3.2.24/fix-pc-file.patch           |   17 -
 .../libnl-3.2.24/fix-pktloc_syntax_h-race.patch    |   36 -
 .../recipes-support/libnl/libnl_2.0.bb             |   29 -
 .../recipes-support/libnl/libnl_3.2.24.bb          |   49 -
 180 files changed, 212 insertions(+), 10826 deletions(-)
 rename meta-arago-distro/recipes-benchmark/arm-benchmarks/{arm-benchmarks_1.3.bbappend => arm-benchmarks_%.bbappend} (100%)
 rename meta-arago-distro/recipes-benchmark/lmbench/{lmbench_3.0-a9.bbappend => lmbench_%.bbappend} (75%)
 rename meta-arago-distro/recipes-benchmark/stream/{stream_5.10.bbappend => stream_%.bbappend} (100%)
 rename meta-arago-distro/recipes-connectivity/{openobex/openobex_1.5.bbappend => obex/openobex_%.bbappend} (83%)
 rename meta-arago-distro/recipes-connectivity/openssh/{openssh_6.5p1.bbappend => openssh_%.bbappend} (100%)
 rename meta-arago-distro/recipes-core/base-files/{base-files_3.0.14.bbappend => base-files_%.bbappend} (100%)
 rename meta-arago-distro/recipes-core/busybox/{busybox_1.22.1.bbappend => busybox_%.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.18.bbappend => dbus_%.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dropbear/{dropbear_2014.63.bbappend => dropbear_%.bbappend} (100%)
 rename meta-arago-distro/{recipes-extended/thttpd/thttpd_2.25b.bbappend => recipes-core/init-ifupdown/init-ifupdown_%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
 delete mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bbappend
 rename meta-arago-distro/recipes-core/udev/{udev_182.bbappend => udev_%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/64bithack.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libtool.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/pr32219.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-configure-common.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross-initial_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-cross_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-crosssdk_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/64bithack.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/fix-g++-sysroot.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/optional_libstdc.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/use-defaults.h-and-t-oe-in-B.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-common-4.7.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-multilib-config.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-runtime.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-runtime_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-target.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/libgcc.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/gcc/libgcc_4.7.bb
 delete mode 100644 meta-arago-distro/recipes-devtools/php/php/fix-race-condition-during-install.patch
 rename meta-arago-distro/recipes-devtools/php/{php_5.4.14.bbappend => php_5.5.21.bbappend} (70%)
 rename meta-arago-distro/recipes-extended/bash/{bash_3.2.48.bbappend => bash_%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
 delete mode 100644 meta-arago-distro/recipes-extended/leveldb/leveldb_git.bb
 rename meta-arago-distro/recipes-extended/shadow/{shadow-securetty_4.1.4.3.bbappend => shadow-securetty_%.bbappend} (100%)
 rename meta-arago-distro/{recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend => recipes-extended/thttpd/thttpd_%.bbappend} (100%)
 rename meta-arago-distro/recipes-graphics/drm/{libdrm_2.4.52.bbappend => libdrm_2.4.59.bbappend} (100%)
 rename meta-arago-distro/recipes-graphics/freetype/{freetype_2.5.2.bbappend => freetype_%.bbappend} (100%)
 rename meta-arago-distro/recipes-graphics/tslib/{tslib_1.1.bbappend => tslib_%.bbappend} (100%)
 rename meta-arago-distro/recipes-kernel/oprofile/{oprofile_0.9.8.bbappend => oprofile_1.0.0.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-kernel/powertop/powertop_2.5.bbappend
 rename meta-arago-distro/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.3.bbappend => gstreamer1.0-libav_1.4.5.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.9.bbappend => libav_9.16.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/pulseaudio/{pulseaudio_5.0.bbappend => pulseaudio_%.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bbappend
 rename meta-arago-distro/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.5.bbappend => nativesdk-qt4-tools_4.8.6.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded-gles_4.8.5.bbappend => qt4-embedded-gles_4.8.6.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded_4.8.5.bbappend => qt4-embedded_4.8.6.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend
 rename meta-arago-distro/recipes-support/gnutls/{gnutls_2.12.23.bbappend => gnutls_%.bbappend} (100%)
 create mode 100644 meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
 rename {meta-arago-extras => meta-arago-distro}/recipes-support/strongswan/files/strongswan_libsecstore.patch (100%)
 rename meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend => meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend (100%)
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb
 delete mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.3.bbappend
 rename meta-arago-extras/recipes-connectivity/{obex => obexd}/obexd_0.34.bb (93%)
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-toolchain.inc
 delete mode 100644 meta-arago-extras/recipes-core/meta/external-arago-toolchain/SUPPORTED
 create mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg/0001-opkg_message-send-Collected-errors-messages-to-stder.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg_0.2.1.bbappend
 delete mode 100644 meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bbappend
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.3.bbappend => gstreamer1.0-plugins-base_1.4.5.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bbappend
 rename meta-arago-extras/recipes-qt/qt4/{qt4-embedded-gles_4.8.5.bb => qt4-embedded-gles_4.8.6.bb} (100%)
 rename meta-arago-extras/recipes-support/boost/{boost_1.55.0.bbappend => boost_%.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pktloc_syntax_h-race.patch
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl_2.0.bb
 delete mode 100644 meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb

-- 
2.2.0


