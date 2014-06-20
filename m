Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id D003852A9B
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H0057KB757420@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5D38720086; Fri,
	20 Jun 2014 13:57:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:30 -0400
Message-id: <1403287009-11256-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 00/19] Daisy migration
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is the first set of patches for migrating meta-arago to Daisy.

Denys Dmytriyenko (19):
  README: update with Daisy info
  linux-libc-headers: remove old 2.6.37 version
  gcc: remove the old overlay of 4.5 version
  binutils: remove the old overlay of 2.20.1 version
  eglibc: remove the old overlay of 2.12 version
  linux-ti-staging: remove 3.8 bbappend, as recipe is gone from meta-ti
  libjpeg-turbo: remove bbappend for SVN URI, as main recipe uses
    tarball now
  icu: remove bbappend and patch to disable LDFLAGSICUDT, applied
    upstream
  recipes: update bbappends to match newer versions in lower layers
  gadget-init: LICENSE from oe-core has changed, update hash
  wl18xx-firmware: specify the branch being used for this version
  hostap-daemon: specify the branch being used for this version
  wpa-supplicant: specify the branch being used for this version
  toolchain-external: bb.which() is not part of bb.utils module
  toolchain-linaro/gcc: remove DEFAULTTUNE settings that went to meta-ti
  arago-prefs, toolchain-linaro: update system versions
  arago.conf: with unification on mainline, remove PACKAGE_ARCH logic
  tisdk-image: upstream got new rootfs/image framework, unbreak parsing
  arago.conf: update version, remove FETCHCMD_wget workaround

 meta-arago-distro/README                           |    12 +-
 meta-arago-distro/classes/tisdk-image.bbclass      |     2 +-
 meta-arago-distro/conf/distro/arago.conf           |    14 +-
 .../conf/distro/include/arago-prefs.inc            |    12 +-
 .../conf/distro/include/toolchain-external.inc     |     2 +-
 .../conf/distro/include/toolchain-gcc.inc          |     5 -
 .../conf/distro/include/toolchain-linaro.inc       |    13 +-
 ...enssh_6.2p2.bbappend => openssh_6.5p1.bbappend} |     0
 ...box_1.21.1.bbappend => busybox_1.22.1.bbappend} |     0
 .../{dbus_1.6.10.bbappend => dbus_1.6.18.bbappend} |     0
 ..._2013.58.bbappend => dropbear_2014.63.bbappend} |     0
 .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |     3 -
 ...ype_2.4.12.bbappend => freetype_2.5.2.bbappend} |     0
 .../linux/linux-ti-staging_3.8.bbappend            |    17 -
 .../{libav_0.8.8.bbappend => libav_0.8.9.bbappend} |     0
 ...eaudio_4.0.bbappend => pulseaudio_5.0.bbappend} |     0
 .../{curl_7.32.0.bbappend => curl_7.35.0.bbappend} |     0
 .../icu/icu/disable-ldflagsicudt.patch             |    12 -
 .../recipes-support/icu/icu_51.2.bbappend          |     5 -
 .../recipes-tisdk/gadget-init/gadget-init.bb       |     2 +-
 meta-arago-extras/README                           |    12 +-
 .../wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb    |     2 +-
 .../hostap/hostap-daemon-wl18xx_r8.a8.10.bb        |     1 +
 .../recipes-connectivity/hostap/hostap.inc         |     2 +-
 .../wpa-supplicant-wl18xx_r8.a8.10.bb              |     1 +
 .../wpa-supplicant/wpa-supplicant.inc              |     2 +-
 .../eglibc/cross-localedef-native_2.12.bb          |    43 -
 .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |    17 -
 .../eglibc-2.12/armv4-eabi-compile-fix.patch       |    25 -
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    21 -
 .../recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf |     0
 .../eglibc/eglibc-2.12/generate-supported.mk       |    11 -
 .../eglibc/eglibc-2.12/ld-search-order.patch       |    56 -
 .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |    23 -
 .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |    26 -
 .../eglibc-2.12/shorten-build-commands.patch       |    81 -
 .../recipes-core/eglibc/eglibc-common.inc          |     9 -
 .../recipes-core/eglibc/eglibc-initial.inc         |    73 -
 .../recipes-core/eglibc/eglibc-initial_2.12.bb     |     6 -
 .../recipes-core/eglibc/eglibc-ld.inc              |    54 -
 .../recipes-core/eglibc/eglibc-locale.inc          |    97 -
 .../recipes-core/eglibc/eglibc-locale_2.12.bb      |     1 -
 .../recipes-core/eglibc/eglibc-options.inc         |   129 -
 .../recipes-core/eglibc/eglibc-package.inc         |   118 -
 .../recipes-core/eglibc/eglibc-testing.inc         |    79 -
 meta-arago-extras/recipes-core/eglibc/eglibc.inc   |    58 -
 .../recipes-core/eglibc/eglibc_2.12.bb             |   109 -
 .../eglibc/ldconfig-native-2.12.1/32and64bit.patch |   331 -
 .../eglibc/ldconfig-native-2.12.1/README           |     8 -
 .../endian-ness_handling.patch                     |   454 -
 .../ldconfig-native-2.12.1/endianess-header.patch  |   113 -
 .../eglibc/ldconfig-native-2.12.1/flag_fix.patch   |    24 -
 .../ldconfig-native-2.12.1.tar.bz2                 |   Bin 21491 -> 0 bytes
 .../eglibc/ldconfig-native-2.12.1/ldconfig.patch   |   471 -
 .../ldconfig_aux-cache_path_fix.patch              |    36 -
 .../recipes-core/eglibc/site_config/funcs          |   474 -
 .../recipes-core/eglibc/site_config/headers        |   156 -
 .../recipes-core/eglibc/site_config/types          |    21 -
 .../binutils-2.20.1/110-arm-eabi-conf.patch        |    22 -
 .../152_arm_branches_to_weak_symbols.patch         |   240 -
 .../binutils-2.20.1/200_elflink_%B_fixes.patch     |    65 -
 .../201_elflink_improve_noaddneeded_errors.patch   |    70 -
 .../202_elflink_noaddneeded_vs_weak.patch          |    87 -
 .../binutils-2.20.1/binutils-2.16.1-e300c2c3.patch |    18 -
 .../binutils-2.19.1-ld-sysroot.patch               |    37 -
 .../binutils-2.20.1/binutils-mips-pie.patch        |    29 -
 .../binutils/binutils-2.20.1/binutils-poison.patch |   253 -
 .../binutils-uclibc-100-uclibc-conf.patch          |    34 -
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    50 -
 ...binutils-uclibc-300-006_better_file_error.patch |    43 -
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    47 -
 .../binutils-uclibc-gas-needs-libm.patch           |    38 -
 .../binutils-x86_64_i386_biarch.patch              |    26 -
 .../binutils-2.20.1/libiberty_path_fix.patch       |    20 -
 .../binutils-2.20.1/libtool-2.4-update.patch       | 31174 -------------------
 .../binutils-2.20.1/libtool-rpath-fix.patch        |    36 -
 .../binutils/binutils-cross-canadian.inc           |    22 -
 .../binutils/binutils-cross-canadian_2.20.1.bb     |     3 -
 .../recipes-devtools/binutils/binutils-cross.inc   |    30 -
 .../binutils/binutils-cross_2.20.1.bb              |     3 -
 .../binutils/binutils-crosssdk_2.20.1.bb           |    12 -
 .../recipes-devtools/binutils/binutils.inc         |   149 -
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |    52 -
 meta-arago-extras/recipes-devtools/gcc/gcc-4.5.inc |   274 -
 .../gcc/gcc-4.5/100-uclibc-conf.patch              |    37 -
 .../gcc/gcc-4.5/602-sdk-libstdc++-includes.patch   |    20 -
 .../recipes-devtools/gcc/gcc-4.5/64bithack.patch   |    68 -
 .../gcc/gcc-4.5/740-sh-pr24836.patch               |    29 -
 .../gcc/gcc-4.5/800-arm-bigendian.patch            |    34 -
 .../gcc/gcc-4.5/904-flatten-switch-stmt-00.patch   |    74 -
 .../gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch          |    23 -
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   178 -
 .../recipes-devtools/gcc/gcc-4.5/Makefile.in.patch |    30 -
 ...ismatch-between-conditions-of-an-IT-block.patch |    18 -
 .../gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch     |    36 -
 .../gcc/gcc-4.5/cache-amnesia.patch                |    31 -
 .../gcc/gcc-4.5/cpp-honour-sysroot.patch           |    36 -
 .../gcc/gcc-4.5/disable_relax_pic_calls_flag.patch |    44 -
 .../gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch  |   114 -
 .../gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch      |   284 -
 .../gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch    |    65 -
 .../gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch  |   550 -
 .../fedora/gcc43-java-debug-iface-type.patch       |    19 -
 .../gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch    |    48 -
 .../gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch |  2797 --
 .../gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch   |    90 -
 .../gcc/gcc-4.5/fedora/gcc43-pr27898.patch         |    16 -
 .../gcc/gcc-4.5/fedora/gcc43-pr32139.patch         |    19 -
 .../gcc/gcc-4.5/fedora/gcc43-pr33763.patch         |   159 -
 .../gcc/gcc-4.5/fedora/gcc43-rh251682.patch        |    89 -
 .../gcc/gcc-4.5/fedora/gcc43-rh330771.patch        |    31 -
 .../gcc/gcc-4.5/fedora/gcc43-rh341221.patch        |    32 -
 .../gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch   |    60 -
 .../gcc/gcc-4.5/fortran-cross-compile-hack.patch   |    30 -
 .../gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch           |   319 -
 .../gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |    31 -
 .../gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2  |   Bin 6957305 -> 0 bytes
 .../gcc-4.5/gcc-arm-volatile-bitfield-fix.patch    |   103 -
 .../gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch    |    29 -
 .../gcc/gcc-4.5/gcc-flags-for-build.patch          |   178 -
 .../gcc/gcc-4.5/gcc-ice-hack.dpatch                |   331 -
 .../gcc/gcc-4.5/gcc-poison-dir-extend.patch        |    25 -
 .../gcc/gcc-4.5/gcc-poison-parameters.patch        |    83 -
 .../gcc-4.5/gcc-poison-system-directories.patch    |   201 -
 .../gcc/gcc-4.5/gcc-ppc-config-fix.patch           |   221 -
 .../gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch    |   117 -
 .../gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch  |    63 -
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |    67 -
 .../gcc/gcc-4.5/gcc-with-linker-hash-style.patch   |   212 -
 .../gcc-4.5/gcc_revert_base_version_to_4.5.0.patch |     9 -
 .../libstdc++-emit-__cxa_end_cleanup-in-text.patch |    40 -
 .../gcc/gcc-4.5/libstdc++-pic.dpatch               |    71 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch |   207 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch | 26654 ----------------
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch |    62 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch |  3094 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch |   674 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch |   244 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch |   131 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch |    81 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch |    52 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch |  1401 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch |   138 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch |   112 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch |    36 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch |   714 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch |    37 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch |   433 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch |    57 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch |    76 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch |   118 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch |   197 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch |   138 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch |    28 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch |    53 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch |   688 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch |   109 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch |   174 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch |    86 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch |   132 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch |    68 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch |   138 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch |    95 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch |    36 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch |   111 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch |   236 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch |    43 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch |    28 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch |    76 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch |   132 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch |    30 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch |    30 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch |   170 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch |    37 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch |   401 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch |   184 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch |   548 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch |   118 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch |   298 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch |   384 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch |   181 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch |   376 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch |    27 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch |    38 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch |    27 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch |  1759 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch | 17586 -----------
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch |    95 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch |   511 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch |    38 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch |    26 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch |    49 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch |   342 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch |    53 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch |   663 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch |   380 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch |   360 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch |    72 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch |   146 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch |    35 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch |    28 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch |   159 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch |  2011 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch |  2985 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch |   512 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch |   369 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch |  1202 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch |   151 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch |   191 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch |    43 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch |    33 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch |    45 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch |    26 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch |  1721 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch |  3565 ---
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch |    76 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch |  1268 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch |   176 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch |   386 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch |    36 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch |    20 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch |    33 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch |   603 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch |    18 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch |    32 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch |    21 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch |   316 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch |    26 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch |    46 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch |   130 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch |    53 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch |    25 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch |   734 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch |    38 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch |    94 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch |   114 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch |   697 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch |   128 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch |    41 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch |  1257 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch |    70 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch |    40 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch |    30 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch |    32 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch |   210 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch |    27 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch |  1500 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch |    78 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch |    33 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch |    23 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch |   873 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch |   183 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch |    34 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch |   104 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch |    45 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch |   201 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch |    72 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch |    46 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch |    65 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch |  3163 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch |  4236 ---
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch |   157 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch |    94 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch |    38 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch |   811 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch |   409 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch |  3346 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch |  4075 ---
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch |    74 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch |   101 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch |    64 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch |    63 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch |   230 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch |    42 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch |    22 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch |    61 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch |  1272 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch |   784 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch |   186 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch |   134 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch |  6070 ----
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch |    26 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch |    21 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch |    20 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch |    24 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch |   582 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch |    32 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch |    45 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch |    25 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch |   166 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch |   210 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch |   119 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch |   209 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch |    67 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch |   138 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch |   741 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch |    27 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch |    25 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch |   456 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch |    63 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch |    39 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch |    33 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch |   105 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch |    23 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch |    80 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch |   460 -
 .../gcc/gcc-4.5/mips64-nomultilib.patch            |    52 -
 .../gcc/gcc-4.5/more-epilogues.patch               |    83 -
 .../gcc/gcc-4.5/optional_libstdc.patch             |    23 -
 .../recipes-devtools/gcc/gcc-4.5/pr30961.dpatch    |   179 -
 .../recipes-devtools/gcc/gcc-4.5/pr35942.patch     |    38 -
 .../gcc/gcc-4.5/sh4-multilib.patch                 |    25 -
 .../gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch |    57 -
 .../gcc/gcc-4.5/zecke-no-host-includes.patch       |    31 -
 .../gcc/gcc-4.5/zecke-xgcc-cpp.patch               |    28 -
 .../recipes-devtools/gcc/gcc-common.inc            |   112 -
 .../recipes-devtools/gcc/gcc-configure-common.inc  |   122 -
 .../recipes-devtools/gcc/gcc-configure-cross.inc   |    26 -
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    55 -
 .../recipes-devtools/gcc/gcc-configure-sdk.inc     |    48 -
 .../recipes-devtools/gcc/gcc-configure-target.inc  |     5 -
 .../recipes-devtools/gcc/gcc-cross-canadian.inc    |     8 -
 .../recipes-devtools/gcc/gcc-cross-canadian_4.5.bb |    24 -
 .../recipes-devtools/gcc/gcc-cross-initial.inc     |    29 -
 .../recipes-devtools/gcc/gcc-cross-initial_4.5.bb  |     4 -
 .../gcc/gcc-cross-intermediate.inc                 |    69 -
 .../gcc/gcc-cross-intermediate_4.5.bb              |     3 -
 .../recipes-devtools/gcc/gcc-cross.inc             |   101 -
 .../recipes-devtools/gcc/gcc-cross4.inc            |     3 -
 .../recipes-devtools/gcc/gcc-cross_4.5.bb          |     9 -
 .../recipes-devtools/gcc/gcc-crosssdk-initial.inc  |     8 -
 .../gcc/gcc-crosssdk-initial_4.5.bb                |     3 -
 .../gcc/gcc-crosssdk-intermediate.inc              |    11 -
 .../gcc/gcc-crosssdk-intermediate_4.5.bb           |     3 -
 .../recipes-devtools/gcc/gcc-crosssdk.inc          |    10 -
 .../recipes-devtools/gcc/gcc-crosssdk_4.5.bb       |     3 -
 .../recipes-devtools/gcc/gcc-package-cross.inc     |    59 -
 .../recipes-devtools/gcc/gcc-package-runtime.inc   |    76 -
 .../recipes-devtools/gcc/gcc-package-sdk.inc       |    67 -
 .../recipes-devtools/gcc/gcc-package-target.inc    |   137 -
 .../recipes-devtools/gcc/gcc-runtime_4.5.bb        |     8 -
 meta-arago-extras/recipes-devtools/gcc/gcc_4.5.bb  |     7 -
 .../recipes-devtools/gcc/libgcc_4.5.bb             |    41 -
 .../{opkg_svn.bbappend => opkg_0.2.1.bbappend}     |     0
 .../linux-libc-headers_2.6.37.2.bb                 |    10 -
 345 files changed, 30 insertions(+), 158881 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssh/{openssh_6.2p2.bbappend => openssh_6.5p1.bbappend} (100%)
 rename meta-arago-distro/recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_1.22.1.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.10.bbappend => dbus_1.6.18.bbappend} (100%)
 rename meta-arago-distro/recipes-core/dropbear/{dropbear_2013.58.bbappend => dropbear_2014.63.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
 rename meta-arago-distro/recipes-graphics/freetype/{freetype_2.4.12.bbappend => freetype_2.5.2.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.8.bbappend
 rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.8.bbappend => libav_0.8.9.bbappend} (100%)
 rename meta-arago-distro/recipes-multimedia/pulseaudio/{pulseaudio_4.0.bbappend => pulseaudio_5.0.bbappend} (100%)
 rename meta-arago-distro/recipes-support/curl/{curl_7.32.0.bbappend => curl_7.35.0.bbappend} (100%)
 delete mode 100644 meta-arago-distro/recipes-support/icu/icu/disable-ldflagsicudt.patch
 delete mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bbappend
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/cross-localedef-native_2.12.bb
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-common.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-initial_2.12.bb
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-ld.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-locale.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-locale_2.12.bb
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-options.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-package.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc-testing.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc.inc
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/eglibc_2.12.bb
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/README
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/site_config/funcs
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/site_config/headers
 delete mode 100644 meta-arago-extras/recipes-core/eglibc/site_config/types
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/152_arm_branches_to_weak_symbols.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/200_elflink_%B_fixes.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/201_elflink_improve_noaddneeded_errors.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/202_elflink_noaddneeded_vs_weak.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-2.16.1-e300c2c3.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-2.19.1-ld-sysroot.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-mips-pie.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-poison.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-100-uclibc-conf.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-001_ld_makefile_patch.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-006_better_file_error.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-uclibc-gas-needs-libm.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-x86_64_i386_biarch.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/libiberty_path_fix.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/libtool-2.4-update.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/libtool-rpath-fix.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-cross-canadian.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-cross-canadian_2.20.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-cross.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-cross_2.20.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-crosssdk_2.20.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/100-uclibc-conf.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/602-sdk-libstdc++-includes.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/64bithack.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/740-sh-pr24836.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/800-arm-bigendian.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/904-flatten-switch-stmt-00.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/COLLECT_GCC_OPTIONS.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/Makefile.in.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/arm-lib1funcs.as-fix-mismatch-between-conditions-of-an-IT-block.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/arm-unbreak-eabi-armv4t.dpatch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/cache-amnesia.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/cpp-honour-sysroot.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/disable_relax_pic_calls_flag.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-c++-builtin-redecl.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-cpp-pragma.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-i386-libgomp.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ia64-libunwind.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-debug-iface-type.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-java-nomulti.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-libgomp-speedup.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-ppc32-retaddr.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr27898.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr32139.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-pr33763.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh251682.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh330771.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc43-rh341221.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fedora/gcc45-no-add-needed.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/fortran-cross-compile-hack.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-4.0.2-e300c2c3.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-4.5.0_to_svn_162697.patch.bz2
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-armv4-pass-fix-v4bx-to-ld.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-flags-for-build.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-ice-hack.dpatch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-poison-dir-extend.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-poison-parameters.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-poison-system-directories.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-pr43698-arm-rev-instr.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-scalar-widening-pr45847.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/gcc_revert_base_version_to_4.5.0.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/libstdc++-emit-__cxa_end_cleanup-in-text.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/libstdc++-pic.dpatch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99297.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99298.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99299.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99300.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99302.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99303.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99304.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99305.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99306.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99307.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99308.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99310.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99312.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99313.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99314.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99315.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99316.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99318.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99319.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99320.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99321.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99322.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99323.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99324.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99325.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99326.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99327.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99332.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99335.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99336.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99337.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99338.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99339.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99340.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99341.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99342.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99343.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99344.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99345.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99346.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99348.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99349.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99353.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99354.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99355.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99356.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99357.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99358.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99359.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99360.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99361.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99363.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99364.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99365.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99366.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99367.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99368.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99369.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99371.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99372.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99373.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99374.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99375.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99376.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99377.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99378.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99379.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99381.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99383.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99384.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99385.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99388.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99391.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99392.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99393.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99395.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99397.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99398.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99402.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99403.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99404.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99405.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99406.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99407.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99408.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99409.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99410.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99411.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99412.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99413.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99415.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99416.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99417.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99418.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99419.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99420.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99421.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99423.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99425.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99426.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99429.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99432.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99433.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99434.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99435.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99437.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99439.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99440.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99441.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99442.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99443.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99444.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99530.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99531.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99532.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99533.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99534.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99536.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99537.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99540.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/mips64-nomultilib.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/more-epilogues.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/optional_libstdc.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/pr30961.dpatch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/pr35942.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/sh4-multilib.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/use-defaults.h-and-t-oe-in-B.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/zecke-no-host-includes.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-4.5/zecke-xgcc-cpp.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-common.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-configure-common.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-configure-cross.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-configure-runtime.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-configure-sdk.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-configure-target.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-initial.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-initial_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-intermediate.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross4.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-crosssdk-initial.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-crosssdk.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-crosssdk_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-package-cross.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-package-runtime.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-package-sdk.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-package-target.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-runtime_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc_4.5.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/libgcc_4.5.bb
 rename meta-arago-extras/recipes-devtools/opkg/{opkg_svn.bbappend => opkg_0.2.1.bbappend} (100%)
 delete mode 100644 meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb

-- 
2.0.0


