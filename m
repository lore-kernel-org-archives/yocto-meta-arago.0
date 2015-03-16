Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 2D0C8529FC
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2015 22:52:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB009H6U6WM7R0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 17:52:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=Opkrdet0qHU53uoW5_4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4533220086;	Mon,
	16 Mar 2015 18:52:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 18:51:55 -0400
Message-id: <1426546322-25230-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 0/7] Enable target gcc compilation
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
X-List-Received-Date: Mon, 16 Mar 2015 22:52:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

This patch set enables target gcc compilation by utilizing 2013.03 prebuilt
Linaro cross toolchain for runtime and building corresponding gcc 4.7 binaries
from sources for the target, as that's not part of Linaro cross toolchain.

There are 2 ways to add compiler and build tools into the rootfs:
* By explicitly pulling packagegroup-core-buildessential, which provides all
  the necessary tools to do compilation on target. The added size is ~25MB
* By adding tools-sdk to EXTRA_IMAGE_FEATURES, which automatically pulls the
  above build essentials and some extra tools and utils. Adds ~36MB

Also, one might want to add dev-pkgs to EXTRA_IMAGE_FEATURES to pull -dev
packages of all installed packages on the rootfs, which is useful for
development against libs in the image.

Denys Dmytriyenko (7):
  toolchain-gcc: update versions for internal toolchain build
  toolchain-linaro: prefer prebuilt Linaro runtime
  gcc: overlay old 4.7 versions of core and linaro gcc recipes
  gcc: handle different TARGET_SYS of OE vs. Linaro via symlinks
  external-linaro-toolchain: package libgcc-dev stubs and libs for
    compilation
  arago-prefs: set up preferences for target gcc
  packagegroup-*-tisdk-addons: enable compiler and build essentials on
    omap-a15

 .../conf/distro/include/arago-prefs.inc            |   11 +-
 .../conf/distro/include/toolchain-gcc.inc          |    8 +-
 .../conf/distro/include/toolchain-linaro.inc       |    5 +
 .../packagegroup-arago-tisdk-addons.bb             |    4 +-
 meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc |  146 +
 ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 +
 ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 +
 .../gcc/gcc-4.7/100-uclibc-conf.patch              |   39 +
 .../gcc/gcc-4.7/200-uclibc-locale.patch            | 2810 ++++++++++++++++++++
 .../gcc/gcc-4.7/203-uclibc-locale-no__x.patch      |  235 ++
 .../gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch  |   54 +
 .../gcc/gcc-4.7/205-uclibc-locale-update.patch     |  521 ++++
 .../gcc/gcc-4.7/301-missing-execinfo_h.patch       |   15 +
 .../gcc/gcc-4.7/302-c99-snprintf.patch             |   15 +
 .../gcc/gcc-4.7/303-c99-complex-ugly-hack.patch    |   16 +
 .../gcc/gcc-4.7/304-index_macro.patch              |   30 +
 .../gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch  |   51 +
 .../gcc/gcc-4.7/306-libstdc++-namespace.patch      |   40 +
 .../recipes-devtools/gcc/gcc-4.7/64bithack.patch   |   63 +
 .../gcc/gcc-4.7/740-sh-pr24836.patch               |   31 +
 .../gcc/gcc-4.7/800-arm-bigendian.patch            |   36 +
 .../gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch          |   25 +
 .../gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch         |  165 ++
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 +
 .../gcc/gcc-4.7/avoid-oob-array-access.patch       |   45 +
 .../gcc/gcc-4.7/cpp-honor-sysroot.patch            |   40 +
 .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 +
 .../gcc/gcc-4.7/disable-texinfo-5.patch            |  107 +
 .../gcc/gcc-4.7/disable_relax_pic_calls_flag.patch |   48 +
 .../recipes-devtools/gcc/gcc-4.7/disablesdt.patch  |   32 +
 .../gcc/gcc-4.7/fix-g++-sysroot.patch              |  428 +++
 .../gcc/gcc-4.7/fortran-cross-compile-hack.patch   |   32 +
 .../gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |   33 +
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  116 +
 .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 +
 .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 +
 .../gcc/gcc-4.7/gcc-poison-dir-extend.patch        |   27 +
 .../gcc-4.7/gcc-poison-system-directories.patch    |  223 ++
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   72 +
 .../gcc/gcc-4.7/libgcc-sjlj-check.patch            |   61 +
 .../recipes-devtools/gcc/gcc-4.7/libtool.patch     |   29 +
 .../gcc/gcc-4.7/mips64-default-n64.patch           |   19 +
 .../gcc/gcc-4.7/optional_libstdc.patch             |   86 +
 .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   72 +
 .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ++++++
 .../gcc/gcc-4.7/ppce5500-e6500-support.patch       |  713 +++++
 .../recipes-devtools/gcc/gcc-4.7/pr32219.patch     |   72 +
 .../gcc/gcc-4.7/rs6000-tables.patch                |  135 +
 .../gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch |   77 +
 .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |   87 +
 .../gcc/gcc-4.7/wcast-qual-PR55383.patch           |   43 +
 .../recipes-devtools/gcc/gcc-common.inc            |  124 +
 .../recipes-devtools/gcc/gcc-configure-common.inc  |  133 +
 .../recipes-devtools/gcc/gcc-linaro-4.7.inc        |   22 +
 .../gcc/gcc-linaro-4.7/64bithack.patch             |   27 +
 .../gcc/gcc-linaro-4.7/fix-g++-sysroot.patch       |   78 +
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   33 +
 .../gcc/gcc-linaro-4.7/optional_libstdc.patch      |   86 +
 .../use-defaults.h-and-t-oe-in-B.patch             |   80 +
 .../recipes-devtools/gcc/gcc-linaro-common-4.7.inc |    2 +
 .../recipes-devtools/gcc/gcc-multilib-config.inc   |  191 ++
 .../recipes-devtools/gcc/gcc-target.inc            |  154 ++
 meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb  |    2 +
 .../recipes-devtools/gcc/gcc_linaro-4.7.bb         |    4 +
 .../recipes-devtools/gcc/gcc_linaro-4.7.bbappend   |   73 +
 .../meta/external-linaro-toolchain.bbappend        |   11 +-
 66 files changed, 9049 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/64bithack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/disablesdt.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/libtool.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/pr32219.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-common.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-configure-common.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/64bithack.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/fix-g++-sysroot.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/optional_libstdc.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-4.7/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-linaro-common-4.7.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-multilib-config.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc-target.inc
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bb
 create mode 100644 meta-arago-distro/recipes-devtools/gcc/gcc_linaro-4.7.bbappend

-- 
2.2.0


