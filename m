Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 692E752AA4
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00BZYB7AXFC0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:15 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2C45F201C2; Fri,
	20 Jun 2014 13:57:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:35 -0400
Message-id: <1403287009-11256-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
X-Mailman-Approved-At: Fri, 20 Jun 2014 17:59:09 +0000
Subject: [PATCH 05/19] eglibc: remove the old overlay of 2.12 version
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../eglibc/cross-localedef-native_2.12.bb          |  43 --
 .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |  17 -
 .../eglibc-2.12/armv4-eabi-compile-fix.patch       |  25 --
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |  21 -
 .../recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf |   0
 .../eglibc/eglibc-2.12/generate-supported.mk       |  11 -
 .../eglibc/eglibc-2.12/ld-search-order.patch       |  56 ---
 .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |  23 -
 .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |  26 --
 .../eglibc-2.12/shorten-build-commands.patch       |  81 ----
 .../recipes-core/eglibc/eglibc-common.inc          |   9 -
 .../recipes-core/eglibc/eglibc-initial.inc         |  73 ----
 .../recipes-core/eglibc/eglibc-initial_2.12.bb     |   6 -
 .../recipes-core/eglibc/eglibc-ld.inc              |  54 ---
 .../recipes-core/eglibc/eglibc-locale.inc          |  97 -----
 .../recipes-core/eglibc/eglibc-locale_2.12.bb      |   1 -
 .../recipes-core/eglibc/eglibc-options.inc         | 129 ------
 .../recipes-core/eglibc/eglibc-package.inc         | 118 -----
 .../recipes-core/eglibc/eglibc-testing.inc         |  79 ----
 meta-arago-extras/recipes-core/eglibc/eglibc.inc   |  58 ---
 .../recipes-core/eglibc/eglibc_2.12.bb             | 109 -----
 .../eglibc/ldconfig-native-2.12.1/32and64bit.patch | 331 --------------
 .../eglibc/ldconfig-native-2.12.1/README           |   8 -
 .../endian-ness_handling.patch                     | 454 --------------------
 .../ldconfig-native-2.12.1/endianess-header.patch  | 113 -----
 .../eglibc/ldconfig-native-2.12.1/flag_fix.patch   |  24 --
 .../ldconfig-native-2.12.1.tar.bz2                 | Bin 21491 -> 0 bytes
 .../eglibc/ldconfig-native-2.12.1/ldconfig.patch   | 471 --------------------
 .../ldconfig_aux-cache_path_fix.patch              |  36 --
 .../recipes-core/eglibc/site_config/funcs          | 474 ---------------------
 .../recipes-core/eglibc/site_config/headers        | 156 -------
 .../recipes-core/eglibc/site_config/types          |  21 -
 32 files changed, 3124 deletions(-)
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

diff --git a/meta-arago-extras/recipes-core/eglibc/cross-localedef-native_2.12.bb b/meta-arago-extras/recipes-core/eglibc/cross-localedef-native_2.12.bb
deleted file mode 100644
index 51a410e..0000000
--- a/meta-arago-extras/recipes-core/eglibc/cross-localedef-native_2.12.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "Cross locale generation tool for eglibc"
-HOMEPAGE = "http://www.eglibc.org/home"
-SECTION = "libs"
-LICENSE = "LGPL"
-
-LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
-LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
-      file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-      file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://${LIC_DIR}/COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
-
-
-inherit native
-inherit autotools
-
-PR = "r1"
-SRCREV="11982"
-EGLIBC_BRANCH="eglibc-2_12"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
-S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
-
-do_unpack_append() {
-    bb.build.exec_func('do_move_ports', d)
-}
-
-do_move_ports() {
-        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
-	    rm -rf ${WORKDIR}/libc/ports
-	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${WORKDIR}/libc/
-	fi
-}
-
-EXTRA_OECONF = "--with-glibc=${WORKDIR}/${EGLIBC_BRANCH}/libc"
-
-do_configure () {
-	./configure ${EXTRA_OECONF}
-}
-
-
-do_install() {
-	install -d ${D}${bindir} 
-	install -m 0755 ${S}/localedef ${D}${bindir}/cross-localedef
-}
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
deleted file mode 100644
index 46b1584..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/IO-acquire-lock-fix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
-
-Index: libc/bits/stdio-lock.h
-===================================================================
---- libc.orig/bits/stdio-lock.h	2009-10-28 14:34:19.000000000 -0700
-+++ libc/bits/stdio-lock.h	2009-10-28 14:34:54.000000000 -0700
-@@ -50,6 +50,8 @@ __libc_lock_define_recursive (typedef, _
-   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
-   _IO_flockfile (_fp)
- 
-+# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
-+
- # define _IO_release_lock(_fp) \
-   _IO_funlockfile (_fp);						      \
-   _IO_cleanup_region_end (0)
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
deleted file mode 100644
index c2407ee..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Source: http://sourceware.org/bugzilla/show_bug.cgi?id=12097
-Upstream-Status: Submitted
-
-The patch should be merged into glibc-ports
-
--Khem
-Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-===================================================================
---- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
-@@ -16,6 +16,8 @@
-    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-    02111-1307 USA.  */
- 
-+#if defined(__thumb__)
-+
- #include <sysdep.h>
- 
- /* Out-of-line syscall stub.  We expect the system call number in ip
-@@ -41,3 +43,5 @@ ENTRY (__libc_do_syscall)
- 	pop	{r7, pc}
- 	.fnend
- END (__libc_do_syscall)
-+
-+#endif /* __thumb__ */
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
deleted file mode 100644
index 1e7dfa7..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/eglibc-svn-arm-lowlevellock-include-tls.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-In file included from ../nptl/sysdeps/unix/sysv/linux/libc-lowlevellock.c:21:
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c: In function '__lll_lock_wait_private':
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: warning: implicit declaration of function 'THREAD_GETMEM'
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'THREAD_SELF' undeclared (first use in this function)
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: (Each undeclared identifier is reported only once
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: for each function it appears in.)
-../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'header' undeclared (first use in this function)
-make[4]: *** [/var/tmp/portage/sys-libs/glibc-2.7-r1/work/build-default-armv4l-unknown-linux-gnu-nptl/nptl/rtld-libc-lowlevellock.os] Error 1
-
---- libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h.orig
-+++ libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
-@@ -25,6 +25,7 @@
- #include <atomic.h>
- #include <sysdep.h>
- #include <kernel-features.h>
-+#include <tls.h>
- 
- #define FUTEX_WAIT		0
- #define FUTEX_WAKE		1
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/etc/ld.so.conf
deleted file mode 100644
index e69de29..0000000
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/generate-supported.mk b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
deleted file mode 100644
index d2a28c2..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/generate-supported.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/usr/bin/make
-
-include $(IN)
-
-all:
-	rm -f $(OUT)
-	touch $(OUT)
-	for locale in $(SUPPORTED-LOCALES); do \
-		[ $$locale = true ] && continue; \
-		echo $$locale | sed 's,/, ,' >> $(OUT); \
-	done
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
deleted file mode 100644
index 40ae6d3..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ld-search-order.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-The default lib search path order is:
-
-  1) LD_LIBRARY_PATH
-  2) RPATH from the binary
-  3) ld.so.cache
-  4) default search paths embedded in the linker
-
-For nativesdk binaries which are being used alongside binaries on a host system, we 
-need the search paths to firstly search the shipped nativesdk libs but then also
-cover the host system. For example we want the host system's libGL and this may be
-in a non-standard location like /usr/lib/mesa. The only place the location is know 
-about is in the ld.so.cache of the host system.
-
-Since nativesdk has a simple structure and doesn't need to use a cache itself, we 
-repurpose the cache for use as a last resort in finding host system binaries. This 
-means we need to switch the order of 3 and 4 above to make this work effectively.
-
-RP 14/10/2010
-
-Index: libc/elf/dl-load.c
-===================================================================
---- libc.orig/elf/dl-load.c
-+++ libc/elf/dl-load.c
-@@ -2107,6 +2107,15 @@ _dl_map_object (struct link_map *loader,
- 			&loader->l_runpath_dirs, &realname, &fb, loader,
- 			LA_SER_RUNPATH, &found_other_class);
- 
-+      /* try the default path.  */
-+      if (fd == -1
-+	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
-+	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
-+	  && rtld_search_dirs.dirs != (void *) -1)
-+	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
-+			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
-+
-+      /* Finally try ld.so.cache */
-       if (fd == -1
- 	  && (__builtin_expect (! (mode & __RTLD_SECURE), 1)
- 	      || ! INTUSE(__libc_enable_secure)))
-@@ -2169,14 +2178,6 @@ _dl_map_object (struct link_map *loader,
- 	    }
- 	}
- 
--      /* Finally, try the default path.  */
--      if (fd == -1
--	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
--	      || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
--	  && rtld_search_dirs.dirs != (void *) -1)
--	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
--			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
--
-       /* Add another newline when we are tracing the library loading.  */
-       if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0))
- 	_dl_debug_printf ("\n");
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
deleted file mode 100644
index 186c705..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/mips-rld-map-check.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Pending
-
-On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
-section if a --version-script sets _RLD_MAP to local. This is apparently
-a binutils bug, but libc shouldn't segfault in this case.
-
-see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
-
-9/19/2010 - added by Qing He <qing.he@intel.com>
----
-diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
---- glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h	2009-05-16 16:36:20.000000000 +0800
-+++ glibc-2.10.1/ports/sysdeps/mips/dl-machine.h	2010-09-19 09:11:53.000000000 +0800
-@@ -70,7 +70,8 @@
- /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it in
-    with the run-time address of the r_debug structure  */
- #define ELF_MACHINE_DEBUG_SETUP(l,r) \
--do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
-+do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
-+         (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) \
-        *(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) = \
-        (ElfW(Addr)) (r); \
-    } while (0)
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
deleted file mode 100644
index 70d3aed..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-We now pass --with-cpu option to eglibc this ends up with configure errors if we do
-not pass a cpu which eglibc has support for in sysdeps
-
-| checking sysdep dirs... configure: error: The 603e subspecies of powerpc is not supported.
-| + bbfatal 'oe_runconf failed'
-| + echo 'ERROR: oe_runconf failed'
-
-We fix this by adding the 603e sub directories with Implies to generic
-powerpc to overcome this error
-
-Upstream-Status: Inappropriate [OE config related]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libc/ports/sysdeps/powerpc/powerpc32/603e/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/ports/sysdeps/powerpc/powerpc32/603e/fpu/Implies	2011-12-05 22:18:14.151326027 -0800
-@@ -0,0 +1 @@
-+powerpc/powerpc32/fpu
-Index: libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	2011-12-05 22:16:11.751326040 -0800
-@@ -0,0 +1 @@
-+powerpc/powerpc32/603e/fpu
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch b/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
deleted file mode 100644
index 90e644e..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-2.12/shorten-build-commands.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Pending
-
-Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
-
-This patch scratches an itch.  Each individual gcc command in the
-glibc build is over 1K, which means it takes up a good chunk of my
-terminal.  Most of that is include paths.  Any version of GCC new
-enough to build glibc supports response files, which were added in
-2005.  So use a response file for the static list of include paths.
-Now the build commands are a lot shorter, and easier to use when
-developing glibc.
-
-Tested on x86_64-linux-gnu.  Please apply if acceptable.
-
--- 
-Daniel Jacobowitz
-CodeSourcery
-
-2010-03-30  Daniel Jacobowitz  <dan@codesourcery.com>
-
-	* Makeconfig (+common-includes): Define.
-	(+includes): Use @$(common-objpfx)includes.
-	* Makefile (postclean): Remove includes and includes.mk.
-	* Makerules ($(common-objpfx)includes.mk): Include and create
-	includes.mk.  Create includes.
-
-Index: libc/Makeconfig
-===================================================================
---- libc.orig/Makeconfig	2009-10-13 22:55:12.000000000 -0700
-+++ libc/Makeconfig	2010-03-31 16:02:37.120489733 -0700
-@@ -678,9 +678,10 @@ endif	# $(+cflags) == ""
- # library source directory, in the include directory, and in the
- # current directory.
- +sysdep-includes = $(addprefix -I,$(+sysdep_dirs))
-++common-includes = $(+sysdep-includes) $(includes) $(sysincludes)
- +includes = -I$(..)include $(if $(subdir),$(objpfx:%/=-I%)) \
--	    $(+sysdep-includes) $(includes) \
--	    $(patsubst %/,-I%,$(..)) $(libio-include) -I. $(sysincludes)
-+	    @$(common-objpfx)includes \
-+	    $(patsubst %/,-I%,$(..)) $(libio-include) -I.
- 
- # Since libio has several internal header files, we use a -I instead
- # of many little headers in the include directory.
-Index: libc/Makefile
-===================================================================
---- libc.orig/Makefile	2009-12-09 12:06:28.000000000 -0800
-+++ libc/Makefile	2010-03-31 16:02:37.132481508 -0700
-@@ -247,7 +247,7 @@ parent-mostlyclean: common-mostlyclean #
- parent-clean: parent-mostlyclean common-clean
- 
- postclean = $(addprefix $(common-objpfx),$(postclean-generated)) \
--	    $(addprefix $(objpfx),sysd-dirs sysd-rules) \
-+	    $(addprefix $(objpfx),sysd-dirs sysd-rules includes includes.mk) \
- 	    $(addprefix $(objpfx),sysd-sorted soversions.mk soversions.i)
- 
- clean: parent-clean
-Index: libc/Makerules
-===================================================================
---- libc.orig/Makerules	2009-12-09 12:06:28.000000000 -0800
-+++ libc/Makerules	2010-03-31 16:02:37.140481645 -0700
-@@ -254,6 +254,20 @@ ifndef sysd-rules-done
- no_deps=t
- endif
- 
-+-include $(common-objpfx)includes.mk
-+ifneq ($(+common-includes),$(saved-includes))
-+# Recreate includes.mk (and includes).
-+includes-force = FORCE
-+FORCE:
-+endif
-+$(common-objpfx)includes.mk: $(includes-force)
-+	-@rm -f $@T $(common-objpfx)includesT
-+	for inc in $(+common-includes); do echo "$$inc"; done \
-+	  > $(common-objpfx)includesT
-+	mv -f $(common-objpfx)includesT $(common-objpfx)includes
-+	echo 'saved-includes := $(+common-includes)' > $@T
-+	mv -f $@T $@
-+
- define o-iterator-doit
- $(objpfx)%$o: %.S $(before-compile); $$(compile-command.S)
- endef
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-common.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-common.inc
deleted file mode 100644
index d18786a..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-common.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Embedded GLIBC (GNU C Library)"
-DESCRIPTION = "Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC) that is designed to work well on embedded systems. EGLIBC strives to be source and binary compatible with GLIBC. EGLIBC's goals include reduced footprint, configurable components, better support for cross-compilation and cross-testing."
-HOMEPAGE = "http://www.eglibc.org/home"
-SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
-      file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc
deleted file mode 100644
index b90a7d8..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-initial.inc
+++ /dev/null
@@ -1,73 +0,0 @@
-DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
-PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-
-PACKAGES = ""
-PACKAGES_DYNAMIC = ""
-
-STAGINGCC = "gcc-cross-initial"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
-
-do_configure () {
-	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
-	chmod +x ${S}/configure
-        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
-        find ${S} -name "configure" | xargs touch
-	${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
-		--prefix=/usr \
-		--without-cvs --disable-sanity-checks \
-		--with-headers=${STAGING_DIR_TARGET}${includedir} \
-		--enable-hacker-mode --enable-addons
-}
-
-do_compile () {
-	:
-}
-
-do_install () {
-       oe_runmake cross-compiling=yes install_root=${D} \
-       includedir='${includedir}' prefix='${prefix}' \
-       install-bootstrap-headers=yes install-headers
-
-       oe_runmake csu/subdir_lib
-       # Two headers -- stubs.h and features.h -- aren't installed by install-headers,
-       # so do them by hand.  We can tolerate an empty stubs.h for the moment.
-       # See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
-       mkdir -p ${D}${includedir}/gnu/
-       touch ${D}${includedir}/gnu/stubs.h
-       cp ${S}/include/features.h ${D}${includedir}/features.h
-
-       if [ -e ${B}/bits/stdio_lim.h ]; then
-               cp ${B}/bits/stdio_lim.h  ${D}${includedir}/bits/
-       fi
-       mkdir -p ${D}${libdir}/
-       install -m 644 csu/crt[1in].o ${D}${libdir}
-       ${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-               -o ${D}${libdir}/libc.so
-
-	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
-	for t in linux asm asm-generic; do
-		ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
-	done
-}
-
-do_install_locale() {
-	:
-}
-
-do_siteconfig () {
-	:
-}
-
-SSTATEPOSTINSTFUNCS += "eglibcinitial_sstate_postinst"
-eglibcinitial_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Recreate the symlinks to ensure they point to the correct location
-		for t in linux asm asm-generic; do
-			rm -f ${STAGING_DIR_TCBOOTSTRAP}${includedir}/$t
-			ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${STAGING_DIR_TCBOOTSTRAP}${includedir}/
-		done
-	fi
-}
-
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-initial_2.12.bb b/meta-arago-extras/recipes-core/eglibc/eglibc-initial_2.12.bb
deleted file mode 100644
index 6951e52..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-initial_2.12.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require eglibc_${PV}.bb
-require recipes-core/eglibc/eglibc-initial.inc
-
-do_configure_prepend () {
-        unset CFLAGS
-}
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-ld.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-ld.inc
deleted file mode 100644
index b3eb46e..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-ld.inc
+++ /dev/null
@@ -1,54 +0,0 @@
-def ld_append_if_tune_exists(d, infos, dict):
-	tune = d.getVar("DEFAULTTUNE", True) or ""
-	libdir = d.getVar("base_libdir", True) or ""
-	if dict.has_key(tune):
-		infos['ldconfig'].add('{"' + libdir + '/' + dict[tune][0] + '",' + dict[tune][1] + ' }')
-		infos['lddrewrite'].add(libdir+'/'+dict[tune][0])
-
-def eglibc_dl_info(d):
-	ld_info_all = {
-		"mips": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mipsel": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64el-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"mips64el-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-		"powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-		"powerpc64-nf": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-		"core2": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-		"core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
-		"x86": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-		"x86-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
-		"i586": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
-	}
-
-	infos = {'ldconfig':set(), 'lddrewrite':set()}
-	ld_append_if_tune_exists(d, infos, ld_info_all)
-
-	#DEFAULTTUNE_MULTILIB_ORIGINAL
-	original_tune=d.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL",True)
-	if original_tune:
-		localdata = bb.data.createCopy(d)
-		localdata.setVar("DEFAULTTUNE", original_tune)
-		ld_append_if_tune_exists(localdata, infos, ld_info_all)
-
-	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
-	for item in variants.split():
-		localdata = bb.data.createCopy(d)
-		overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-		localdata.setVar("OVERRIDES", overrides)
-		bb.data.update_data(localdata)
-		ld_append_if_tune_exists(localdata, infos, ld_info_all)
-	infos['ldconfig'] = ','.join(infos['ldconfig'])
-	infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
-	return infos
-
-EGLIBC_KNOWN_INTERPRETER_NAMES = "${@eglibc_dl_info(d)['ldconfig']}"
-RTLDLIST = "${@eglibc_dl_info(d)['lddrewrite']}"
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-locale.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-locale.inc
deleted file mode 100644
index c35a52a..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-locale.inc
+++ /dev/null
@@ -1,97 +0,0 @@
-INHIBIT_DEFAULT_DEPS = "1"
-LICENSE = "GPLv2 & LGPLv2.1"
-
-BPN = "eglibc"
-
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-
-# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
-# is set. The idea is to avoid running localedef on the target (at first boot)
-# to decrease initial boot time and avoid localedef being killed by the OOM
-# killer which used to effectively break i18n on machines with < 128MB RAM.
-
-# default to disabled 
-ENABLE_BINARY_LOCALE_GENERATION ?= "0"
-ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-eglibc-locale = "0"
-
-#enable locale generation on these arches
-# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
-
-# set "1" to use cross-localedef for locale generation
-# set "0" for qemu emulation of native localedef for locale generation
-LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
-
-PR = "r20"
-
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-
-PROVIDES = "virtual/libc-locale"
-
-PACKAGES = "localedef ${PN}-dbg"
-
-PACKAGES_DYNAMIC = "locale-base-* \
-                    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
-                    glibc-gconv-*  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
-
-# Create a eglibc-binaries package
-ALLOW_EMPTY_${BPN}-binaries = "1"
-PACKAGES += "${BPN}-binaries"
-RRECOMMENDS_${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-binary") != -1])}"
-
-# Create a eglibc-charmaps package
-ALLOW_EMPTY_${BPN}-charmaps = "1"
-PACKAGES += "${BPN}-charmaps"
-RRECOMMENDS_${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-charmap") != -1])}"
-
-# Create a eglibc-gconvs package
-ALLOW_EMPTY_${BPN}-gconvs = "1"
-PACKAGES += "${BPN}-gconvs"
-RRECOMMENDS_${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-gconv") != -1])}"
-
-# Create a eglibc-localedatas package
-ALLOW_EMPTY_${BPN}-localedatas = "1"
-PACKAGES += "${BPN}-localedatas"
-RRECOMMENDS_${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-localedata") != -1])}"
-
-DESCRIPTION_localedef = "eglibc: compile locale definition files"
-
-# eglibc-gconv is dynamically added into PACKAGES, thus
-# FILES_eglibc-gconv will not be automatically extended in multilib.
-# Explicitly add ${MLPREFIX} for FILES_eglibc-gconv.
-FILES_${MLPREFIX}eglibc-gconv = "${libdir}/gconv/*"
-FILES_${PN}-dbg += "${libdir}/gconv/.debug/*"
-FILES_localedef = "${bindir}/localedef"
-
-LOCALETREESRC = "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}"
-
-do_install () {
-	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
-	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
-		cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
-	fi
-	if [ -e ${LOCALETREESRC}/${libdir}/locale ]; then
-		cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
-	fi
-	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
-		cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
-	fi
-	if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
-		cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
-	fi
-	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
-		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
-	fi
-	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
-}
-
-inherit libc-package
-
-do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-locale_2.12.bb b/meta-arago-extras/recipes-core/eglibc/eglibc-locale_2.12.bb
deleted file mode 100644
index bf682e7..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-locale_2.12.bb
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-core/eglibc/eglibc-locale.inc
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-options.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-options.inc
deleted file mode 100644
index 6009278..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-options.inc
+++ /dev/null
@@ -1,129 +0,0 @@
-def eglibc_cfg(feature, features, tokens, cnf):
-    if type(tokens) == type(""):
-        tokens = [tokens]
-    if type(features) == type([]) and feature in features:
-        cnf.extend([token + ' = y' for token in tokens])
-    else:
-        for token in tokens:
-            cnf.extend([token + ' = n'])
-            if token == 'OPTION_EGLIBC_NSSWITCH':
-                cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
-                cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
-
-# arrange the dependencies among eglibc configuable options according to file option-groups.def from eglibc source code
-def distro_features_check_deps(distro_features):
-    new_dep = True
-    while new_dep:
-        new_dep = False
-
-        if 'ipv6' in distro_features and 'ipv4' not in distro_features:
-            new_dep = True
-            distro_features.extend(['ipv4'])
-
-        if 'ipv4' in distro_features and 'libc-nsswitch' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-nsswitch'])
-
-        if 'libc-cxx-tests' in distro_features:
-            if 'libc-posix-wchar-io' not in distro_features:
-                new_dep = True
-                distro_features.extend(['libc-posix-wchar-io'])
-            if 'libc-libm' not in distro_features:
-                new_dep = True
-                distro_features.extend(['libc-libm'])
-
-        if 'libc-catgets' in distro_features and 'libc-locale-code' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-locale-code'])
-
-        if 'libc-crypt-ufc' in distro_features and 'libc-crypt' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-crypt'])
-
-        if 'libc-getlogin' in distro_features and 'libc-utmp' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-utmp'])
-
-        if 'libc-inet-anl' in distro_features and 'ipv4' not in distro_features:
-            new_dep = True
-            distro_features.extend(['ipv4'])
-
-        if 'libc-locale-code' in distro_features and 'libc-posix-clang-wchar' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-posix-clang-wchar'])
-
-        if 'libc-nis' in distro_features:
-            if 'ipv4' not in distro_features:
-                new_dep = True
-                distro_features.extend(['ipv4'])
-            if 'libc-sunrpc' not in distro_features:
-                new_dep = True
-                distro_features.extend(['libc-sunrpc'])
-
-        if 'libc-rcmd' in distro_features and 'ipv4' not in distro_features:
-            new_dep = True
-            distro_features.extend(['ipv4'])
-
-        if 'libc-sunrpc' in distro_features and 'ipv4' not in distro_features:
-            new_dep = True
-            distro_features.extend(['ipv4'])
-
-        if 'libc-utmpx' in distro_features and 'libc-utmp' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-utmp'])
-
-        if 'libc-posix-regexp-glibc' in distro_features and 'libc-posix-regexp' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-posix-regexp'])
-
-        if 'libc-posix-wchar-io' in distro_features and 'libc-posix-clang-wchar' not in distro_features:
-            new_dep = True
-            distro_features.extend(['libc-posix-clang-wchar'])
-
-# Map distro features to eglibc options settings
-def features_to_eglibc_settings(d):
-        cnf = ([])
-        distro_features = (d.getVar('DISTRO_FEATURES', True) or '').split()
-
-        distro_features_check_deps(distro_features)
-
-        eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
-        eglibc_cfg('libc-backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
-        eglibc_cfg('libc-big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
-        eglibc_cfg('libc-bsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
-        eglibc_cfg('libc-cxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
-        eglibc_cfg('libc-catgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
-        eglibc_cfg('libc-charsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
-        eglibc_cfg('libc-crypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
-        eglibc_cfg('libc-crypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
-        eglibc_cfg('libc-db-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
-        eglibc_cfg('libc-envz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
-        eglibc_cfg('libc-fcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
-        eglibc_cfg('libc-fmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
-        eglibc_cfg('libc-fstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
-        eglibc_cfg('libc-ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
-        eglibc_cfg('libc-getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
-        eglibc_cfg('libc-idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
-        eglibc_cfg('ipv4',      distro_features, 'OPTION_EGLIBC_INET', cnf)
-        eglibc_cfg('libc-inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
-        eglibc_cfg('libc-libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
-        eglibc_cfg('libc-libm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
-        eglibc_cfg('libc-locales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
-        eglibc_cfg('libc-locale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
-        eglibc_cfg('libc-memusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
-        eglibc_cfg('libc-nis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
-        eglibc_cfg('libc-nsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
-        eglibc_cfg('libc-rcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
-        eglibc_cfg('libc-rtld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
-        eglibc_cfg('libc-spawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
-        eglibc_cfg('libc-streams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
-        eglibc_cfg('libc-sunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
-        eglibc_cfg('libc-utmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
-        eglibc_cfg('libc-utmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
-        eglibc_cfg('libc-wordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
-        eglibc_cfg('libc-posix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
-        eglibc_cfg('libc-posix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
-        eglibc_cfg('libc-posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
-        eglibc_cfg('libc-posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
-
-        return "\n".join(cnf)
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-package.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-package.inc
deleted file mode 100644
index 0354f3d..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-package.inc
+++ /dev/null
@@ -1,118 +0,0 @@
-#
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a eglibc one if our build
-# is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
-
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) != None)
-    if uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
-}
-
-# Set this to zero if you don't want ldconfig in the output package
-USE_LDCONFIG ?= "1"
-
-PACKAGES = "${PN}-dbg ${PN} catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-extra-nss eglibc-thread-db ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss"
-
-# The ld.so in this eglibc supports the GNU_HASH
-RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
-RPROVIDES_${PN}-utils = "glibc-utils"
-RPROVIDES_${PN}-mtrace = "glibc-mtrace libc-mtrace"
-RPROVIDES_${PN}-pic = "glibc-pic"
-RPROVIDES_${PN}-dev = "glibc-dev"
-RPROVIDES_${PN}-staticdev = "glibc-staticdev"
-RPROVIDES_${PN}-doc = "glibc-doc"
-RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
-RPROVIDES_eglibc-thread-db = "glibc-thread-db"
-RPROVIDES_${PN}-pcprofile = "glibc-pcprofile"
-RPROVIDES_${PN}-dbg = "glibc-dbg"
-libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
-
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
-FILES_ldd = "${bindir}/ldd"
-FILES_libsegfault = "${base_libdir}/libSegFault*"
-FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
-FILES_libmemusage = "${base_libdir}/libmemusage.so"
-FILES_eglibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
-FILES_sln = "/sbin/sln"
-FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
-FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
-FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
-	${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
-FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
-FILES_nscd = "${sbindir}/nscd*"
-FILES_${PN}-mtrace = "${bindir}/mtrace"
-FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
-FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
-FILES_catchsegv = "${bindir}/catchsegv"
-RDEPENDS_catchsegv = "libsegfault"
-RDEPENDS_${PN}-utils += "bash"
-RDEPENDS_${PN}-mtrace += "perl"
-FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
-FILES_eglibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
-RPROVIDES_${PN}-dev += "libc-dev"
-RPROVIDES_${PN}-staticdev += "libc-staticdev"
-
-SUMMARY_sln = "The static ln."
-DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
-SUMMARY_nscd = "Name service cache daemon"
-DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups for the passwd, group and hosts information.  It can damatically improvide performance with remote, such as NIS or NIS+, name services."
-SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
-DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
-SUMMARY_ldd = "print shared library dependencies"
-DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
-SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
-DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
-SUMMARY_${PN}-mtrace = "mtrace utility provided by eglibc"
-DESCRIPTION_${PN}-mtrace = "mtrace utility provided by eglibc"
-DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
-
-inherit libc-common multilib_header
-
-PERLPATH = "${bindir}/env perl"
-PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
-
-do_install_append () {
-	rm -f ${D}${sysconfdir}/localtime
-
-	oe_multilib_header bits/syscall.h
-
-	if [ -f ${D}${bindir}/mtrace ]; then
-		sed -i -e '1s,#!.*perl,#! ${PERLPATH},' -e '2s,exec.*perl,exec ${PERLPATH},' ${D}${bindir}/mtrace
-	fi
-}
-
-do_install_locale () {
-	dest=${D}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
-	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
-	if [ "${base_libdir}" != "${libdir}" ]; then
-		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
-	fi
-	if [ -e ${D}${bindir}/localedef ]; then
-		mv -f ${D}${bindir}/localedef ${dest}${bindir}
-	fi
-	if [ -e ${D}${libdir}/gconv ]; then
-		mv -f ${D}${libdir}/gconv ${dest}${libdir}
-	fi
-	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
-	if [ -e ${D}${datadir}/i18n ]; then
-		mv ${D}${datadir}/i18n ${dest}${datadir}
-	fi
-	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
-	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
-}
-
-addtask do_install_locale after do_install before do_populate_sysroot do_package
-
-PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
-
-eglibc_package_preprocess () {
-	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
-	rm -rf ${PKGD}/${libdir}/locale
-}
-
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc-testing.inc b/meta-arago-extras/recipes-core/eglibc/eglibc-testing.inc
deleted file mode 100644
index a5ce773..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc-testing.inc
+++ /dev/null
@@ -1,79 +0,0 @@
-do_compile_append () {
-	# now generate script to drive testing
-	echo "#!/usr/bin/env sh" >${B}/${HOST_PREFIX}testeglibc
-	set >> ${B}/${HOST_PREFIX}testeglibc
-	# prune out the unneeded vars
-	sed -i -e "/^BASH/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^USER/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^OPT/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^DIRSTACK/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^EUID/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^FUNCNAME/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^GROUPS/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^HOST/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^HOME/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^IFS/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^LC_ALL/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^LOGNAME/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^MACHTYPE/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^OSTYPE/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^PIPE/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^SHELL/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^'/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^UID/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^TERM/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^PATCH_GET/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^PKG_/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^POSIXLY_/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^PPID/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^PS4/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^Q/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^SHLVL/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^STAGING/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${HOST_PREFIX}testeglibc
-	sed -i -e "/^PSEUDO/d" ${B}/${HOST_PREFIX}testeglibc
-
-	# point to real sysroot not the toolchain bootstrap sysroot
-	sed -i -e "s/\-tcbootstrap//g" ${B}/${HOST_PREFIX}testeglibc
-
-	# use the final cross-gcc to test since some tests need libstdc++
-	sed -i -e "s/^PATH=.*\.gcc-cross-intermediate\:/PATH=/g" ${B}/${HOST_PREFIX}testeglibc
-
-	# append execution part script
-cat >> ${B}/${HOST_PREFIX}testeglibc << STOP
-target="\$1"
-if [ "x\$target" = "x" ]
-then
-	echo "Please specify the target machine and remote user in form of user@target"
-	exit 1;
-fi
-ssh \$target ls \$PWD\  2>&1 > /dev/null
-if [ "x\$?" != "x0" ]
-then
-	echo "Failed connecting to \$target it could be because of:"
-	echo "1. You dont have passwordless ssh setup to access \$target"
-	echo "2. NFS share on \$target is not mounted or if mounted then not matching the build tree layout."
-	echo "   The tree should be accessible at same location on build host and target"
-	echo "   You can add nfs-server to IMAGE_FEATURES to get the nfs client on target"
-	echo "3. nfs server on build host is not running."
-	echo "   Please make sure that you have 'no_root_squash' added in /etc/exports if you want"
-	echo "   to test as root user on target (usually its recommended to create a non"
-	echo "   root user."
-	echo "   As a sanity check make sure that target can read/write to the eglibc build tree"
-	echo "   Please refer to ${S}/EGLIBC.cross-testing for further instructions on setup"
-	exit 1
-fi
-	echo "# we test using cross compiler from real sysroot therefore override the" > ${B}/configparms
-	echo "# definitions that come from ${B}/config.make" >> ${B}/configparms
-
-	fgrep tcbootstrap ${B}/config.make > ${B}/configparms
-	sed -i -e "s/\-tcbootstrap//g" ${B}/configparms
-wrapper="${S}/scripts/cross-test-ssh.sh \$target"
-localedef="${STAGING_BINDIR_NATIVE}/cross-localedef --little-endian --uint32-align=4"
-make tests-clean
-make cross-localedef="\$localedef" cross-test-wrapper="\$wrapper" -k check
-rm -rf ${B}/configparms
-STOP
-
-	chmod +x ${B}/${HOST_PREFIX}testeglibc
-}
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc.inc b/meta-arago-extras/recipes-core/eglibc/eglibc.inc
deleted file mode 100644
index 51061bc..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-require eglibc-common.inc
-require eglibc-ld.inc
-require eglibc-testing.inc
-
-STAGINGCC = "gcc-cross-intermediate"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
-
-# siteconfig.bbclass runs configure which needs a working compiler
-# For the compiler to work we need a working libc yet libc isn't 
-# in the sysroots directory at this point. This means the libc.so
-# linker script won't work as the --sysroot setting isn't correct.
-# Here we create a hacked up libc linker script and pass in the right
-# flags to let configure work. Ugly.
-EXTRASITECONFIG = "CFLAGS='${CFLAGS} -Wl,-L${WORKDIR}/site_config_libc -L${WORKDIR}/site_config_libc -L${SYSROOT_DESTDIR}${libdir} -L${SYSROOT_DESTDIR}${base_libdir} -Wl,-L${SYSROOT_DESTDIR}${libdir} -Wl,-L${SYSROOT_DESTDIR}${base_libdir}'"
-siteconfig_do_siteconfig_gencache_prepend = " \
-	mkdir -p ${WORKDIR}/site_config_libc; \
-	cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
-	sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
-"
-
-# nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
-# nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
-PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools
-require eglibc-options.inc
-
-LEAD_SONAME = "libc.so"
-
-CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
-                       ac_cv_path_BASH_SHELL=${base_bindir}/bash"
-GLIBC_EXTRA_OECONF ?= ""
-GLIBC_EXTRA_OECONF_virtclass-nativesdk = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-ARM_INSTRUCTION_SET = "arm"
-
-# eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
-# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
-EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
-EXTRA_OEMAKE[vardepsexclude] += "EGLIBCPARALLELISM"
-EXTRA_OEMAKE += "${EGLIBCPARALLELISM}"
-PARALLEL_MAKE = ""
-
-OE_FEATURES = "${@features_to_eglibc_settings(d)}"
-do_configure_prepend() {
-	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
-	echo '${OE_FEATURES}' > ${B}/option-groups.config
-}
-
-GLIBC_ADDONS ?= "ports,nptl,libidn"
-SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
-GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"
diff --git a/meta-arago-extras/recipes-core/eglibc/eglibc_2.12.bb b/meta-arago-extras/recipes-core/eglibc/eglibc_2.12.bb
deleted file mode 100644
index a867ac9..0000000
--- a/meta-arago-extras/recipes-core/eglibc/eglibc_2.12.bb
+++ /dev/null
@@ -1,109 +0,0 @@
-require recipes-core/eglibc/eglibc.inc
-
-DEPENDS += "gperf-native"
-PR = "r28"
-
-SRCREV = "15872"
-
-EGLIBC_BRANCH="eglibc-2_12"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
-           file://eglibc-svn-arm-lowlevellock-include-tls.patch \
-           file://IO-acquire-lock-fix.patch \
-           file://shorten-build-commands.patch \
-           file://mips-rld-map-check.patch \
-           file://armv4-eabi-compile-fix.patch \
-           file://ppc-enable-603e-cpu.patch \
-           file://etc/ld.so.conf \
-           file://generate-supported.mk \
-	  "
-SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch"
-S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
-B = "${WORKDIR}/build-${TARGET_SYS}"
-
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
-# the -isystem in bitbake.conf screws up glibc do_stage
-BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
-
-GLIBC_ADDONS ?= "ports,nptl,libidn"
-
-GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
-
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
-#
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a glibc one if our build
-# is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
-
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) != None)
-    if uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   bb.data.getVar('TARGET_OS', d, 1))
-}
-
-export libc_cv_slibdir = "${base_libdir}"
-
-EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
-                --without-cvs --disable-profile --disable-debug --without-gd \
-                --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
-                --with-headers=${STAGING_INCDIR} \
-                --without-selinux \
-                ${GLIBC_EXTRA_OECONF}"
-
-EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-
-do_unpack_append() {
-    bb.build.exec_func('do_move_ports', d)
-}
-
-do_move_ports() {
-        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
-	    rm -rf ${S}/ports
-	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
-	fi
-}
-
-do_configure () {
-# override this function to avoid the autoconf/automake/aclocal/autoheader
-# calls for now
-# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
-# version check and doesn't really help with anything
-        if [ -z "`which rpcgen`" ]; then
-                echo "rpcgen not found.  Install glibc-devel."
-                exit 1
-        fi
-        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
-        find ${S} -name "configure" | xargs touch
-        CPPFLAGS="" oe_runconf
-}
-
-rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
-	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
-	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
-
-do_compile () {
-	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
-	unset LDFLAGS
-	base_do_compile
-	(
-		cd ${S}/sunrpc/rpcsvc
-		for r in ${rpcsvc}; do
-			h=`echo $r|sed -e's,\.x$,.h,'`
-			rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
-		done
-	)
-}
-
-require recipes-core/eglibc/eglibc-package.inc
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
deleted file mode 100644
index cdfeaea..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/32and64bit.patch
+++ /dev/null
@@ -1,331 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-We run the ldconfig in the cross fashion. make the code bitsize aware so that 
-we can cross build ldconfig cache for various architectures.
-
-Richard Purdie <richard.purdie@linuxfoundation.org> 2009/05/19
-Nitin A Kamble <nitin.a.kamble@intel.com> 2009/03/29
-
-Index: ldconfig-native-2.12.1/readelflib.c
-===================================================================
---- ldconfig-native-2.12.1.orig/readelflib.c
-+++ ldconfig-native-2.12.1/readelflib.c
-@@ -40,39 +40,212 @@ do								\
- 
- /* Returns 0 if everything is ok, != 0 in case of error.  */
- int
--process_elf_file (const char *file_name, const char *lib, int *flag,
-+process_elf_file32 (const char *file_name, const char *lib, int *flag,
- 		  unsigned int *osversion, char **soname, void *file_contents,
- 		  size_t file_length)
- {
-   int i;
-   unsigned int j;
--  ElfW(Addr) loadaddr;
-+  Elf32_Addr loadaddr;
-   unsigned int dynamic_addr;
-   size_t dynamic_size;
-   char *program_interpreter;
- 
--  ElfW(Ehdr) *elf_header;
--  ElfW(Phdr) *elf_pheader, *segment;
--  ElfW(Dyn) *dynamic_segment, *dyn_entry;
-+  Elf32_Ehdr *elf_header;
-+  Elf32_Phdr *elf_pheader, *segment;
-+  Elf32_Dyn *dynamic_segment, *dyn_entry;
-   char *dynamic_strings;
- 
--  elf_header = (ElfW(Ehdr) *) file_contents;
-+  elf_header = (Elf32_Ehdr *) file_contents;
-   *osversion = 0;
- 
--  if (elf_header->e_ident [EI_CLASS] != ElfW (CLASS))
-+  if (elf_header->e_type != ET_DYN)
-     {
--      if (opt_verbose)
-+      error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
-+	     elf_header->e_type);
-+      return 1;
-+    }
-+
-+  /* Get information from elf program header.  */
-+  elf_pheader = (Elf32_Phdr *) (elf_header->e_phoff + file_contents);
-+  check_ptr (elf_pheader);
-+
-+  /* The library is an elf library, now search for soname and
-+     libc5/libc6.  */
-+  *flag = FLAG_ELF;
-+
-+  loadaddr = -1;
-+  dynamic_addr = 0;
-+  dynamic_size = 0;
-+  program_interpreter = NULL;
-+  for (i = 0, segment = elf_pheader;
-+       i < elf_header->e_phnum; i++, segment++)
-+    {
-+      check_ptr (segment);
-+
-+      switch (segment->p_type)
- 	{
--	  if (elf_header->e_ident [EI_CLASS] == ELFCLASS32)
--	    error (0, 0, _("%s is a 32 bit ELF file.\n"), file_name);
--	  else if (elf_header->e_ident [EI_CLASS] == ELFCLASS64)
--	    error (0, 0, _("%s is a 64 bit ELF file.\n"), file_name);
--	  else
--	    error (0, 0, _("Unknown ELFCLASS in file %s.\n"), file_name);
-+	case PT_LOAD:
-+	  if (loadaddr == (Elf32_Addr) -1)
-+	    loadaddr = segment->p_vaddr - segment->p_offset;
-+	  break;
-+
-+	case PT_DYNAMIC:
-+	  if (dynamic_addr)
-+	    error (0, 0, _("more than one dynamic segment\n"));
-+
-+	  dynamic_addr = segment->p_offset;
-+	  dynamic_size = segment->p_filesz;
-+	  break;
-+
-+	case PT_INTERP:
-+	  program_interpreter = (char *) (file_contents + segment->p_offset);
-+	  check_ptr (program_interpreter);
-+
-+	  /* Check if this is enough to classify the binary.  */
-+	  for (j = 0; j < sizeof (interpreters) / sizeof (interpreters [0]);
-+	       ++j)
-+	    if (strcmp (program_interpreter, interpreters[j].soname) == 0)
-+	      {
-+		*flag = interpreters[j].flag;
-+		break;
-+	      }
-+	  break;
-+
-+	case PT_NOTE:
-+	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
-+	    {
-+	      Elf32_Word *abi_note = (Elf32_Word *) (file_contents
-+						     + segment->p_offset);
-+	      Elf32_Addr size = segment->p_filesz;
-+
-+	      while (abi_note [0] != 4 || abi_note [1] != 16
-+		     || abi_note [2] != 1
-+		     || memcmp (abi_note + 3, "GNU", 4) != 0)
-+		{
-+#define ROUND(len) (((len) + sizeof (Elf32_Word)) - 1) & -sizeof (Elf32_Word)))
-+		  Elf32_Addr) note_size = 3 * sizeof (Elf32_Word))
-+					 + ROUND (abi_note[0])
-+					 + ROUND (abi_note[1]);
-+
-+		  if (size - 32 < note_size || note_size == 0)
-+		    {
-+		      size = 0;
-+		      break;
-+		    }
-+		  size -= note_size;
-+		  abi_note = (void *) abi_note + note_size;
-+		}
-+
-+	      if (size == 0)
-+		break;
-+
-+	      *osversion = (abi_note [4] << 24) |
-+			   ((abi_note [5] & 0xff) << 16) |
-+			   ((abi_note [6] & 0xff) << 8) |
-+			   (abi_note [7] & 0xff);
-+	    }
-+	  break;
-+
-+	default:
-+	  break;
-+	}
-+
-+    }
-+  if (loadaddr == (Elf32_Addr) -1)
-+    {
-+      /* Very strange. */
-+      loadaddr = 0;
-+    }
-+
-+  /* Now we can read the dynamic sections.  */
-+  if (dynamic_size == 0)
-+    return 1;
-+
-+  dynamic_segment = (Elf32_Dyn *) (file_contents + dynamic_addr);
-+  check_ptr (dynamic_segment);
-+
-+  /* Find the string table.  */
-+  dynamic_strings = NULL;
-+  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
-+       ++dyn_entry)
-+    {
-+      check_ptr (dyn_entry);
-+      if (dyn_entry->d_tag == DT_STRTAB)
-+	{
-+	  dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
-+	  check_ptr (dynamic_strings);
-+	  break;
- 	}
--      return 1;
-     }
- 
-+  if (dynamic_strings == NULL)
-+    return 1;
-+
-+  /* Now read the DT_NEEDED and DT_SONAME entries.  */
-+  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
-+       ++dyn_entry)
-+    {
-+      if (dyn_entry->d_tag == DT_NEEDED || dyn_entry->d_tag == DT_SONAME)
-+	{
-+	  char *name = dynamic_strings + dyn_entry->d_un.d_val;
-+	  check_ptr (name);
-+
-+	  if (dyn_entry->d_tag == DT_NEEDED)
-+	    {
-+
-+	      if (*flag == FLAG_ELF)
-+		{
-+		  /* Check if this is enough to classify the binary.  */
-+		  for (j = 0;
-+		       j < sizeof (known_libs) / sizeof (known_libs [0]);
-+		       ++j)
-+		    if (strcmp (name, known_libs [j].soname) == 0)
-+		      {
-+			*flag = known_libs [j].flag;
-+			break;
-+		      }
-+		}
-+	    }
-+
-+	  else if (dyn_entry->d_tag == DT_SONAME)
-+	    *soname = xstrdup (name);
-+
-+	  /* Do we have everything we need?  */
-+	  if (*soname && *flag != FLAG_ELF)
-+	    return 0;
-+	}
-+    }
-+
-+  /* We reach this point only if the file doesn't contain a DT_SONAME
-+     or if we can't classify the library.  If it doesn't have a
-+     soname, return the name of the library.  */
-+  if (*soname == NULL)
-+    *soname = xstrdup (lib);
-+
-+  return 0;
-+}
-+
-+int
-+process_elf_file64 (const char *file_name, const char *lib, int *flag,
-+		  unsigned int *osversion, char **soname, void *file_contents,
-+		  size_t file_length)
-+{
-+  int i;
-+  unsigned int j;
-+  Elf64_Addr loadaddr;
-+  unsigned int dynamic_addr;
-+  size_t dynamic_size;
-+  char *program_interpreter;
-+
-+  Elf64_Ehdr *elf_header;
-+  Elf64_Phdr *elf_pheader, *segment;
-+  Elf64_Dyn *dynamic_segment, *dyn_entry;
-+  char *dynamic_strings;
-+
-+  elf_header = (Elf64_Ehdr *) file_contents;
-+  *osversion = 0;
-+
-   if (elf_header->e_type != ET_DYN)
-     {
-       error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
-@@ -81,7 +254,7 @@ process_elf_file (const char *file_name,
-     }
- 
-   /* Get information from elf program header.  */
--  elf_pheader = (ElfW(Phdr) *) (elf_header->e_phoff + file_contents);
-+  elf_pheader = (Elf64_Phdr *) (elf_header->e_phoff + file_contents);
-   check_ptr (elf_pheader);
- 
-   /* The library is an elf library, now search for soname and
-@@ -100,7 +273,7 @@ process_elf_file (const char *file_name,
-       switch (segment->p_type)
- 	{
- 	case PT_LOAD:
--	  if (loadaddr == (ElfW(Addr)) -1)
-+	  if (loadaddr == (Elf64_Addr) -1)
- 	    loadaddr = segment->p_vaddr - segment->p_offset;
- 	  break;
- 
-@@ -129,16 +302,16 @@ process_elf_file (const char *file_name,
- 	case PT_NOTE:
- 	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
- 	    {
--	      ElfW(Word) *abi_note = (ElfW(Word) *) (file_contents
-+	      Elf64_Word *abi_note = (Elf64_Word *) (file_contents
- 						     + segment->p_offset);
--	      ElfW(Addr) size = segment->p_filesz;
-+	      Elf64_Addr size = segment->p_filesz;
- 
- 	      while (abi_note [0] != 4 || abi_note [1] != 16
- 		     || abi_note [2] != 1
- 		     || memcmp (abi_note + 3, "GNU", 4) != 0)
- 		{
--#define ROUND(len) (((len) + sizeof (ElfW(Word)) - 1) & -sizeof (ElfW(Word)))
--		  ElfW(Addr) note_size = 3 * sizeof (ElfW(Word))
-+#define ROUND(len) (((len) + sizeof (Elf64_Word) - 1) & -sizeof (Elf64_Word))
-+		  Elf64_Addr note_size = 3 * sizeof (Elf64_Word)
- 					 + ROUND (abi_note[0])
- 					 + ROUND (abi_note[1]);
- 
-@@ -166,7 +339,7 @@ process_elf_file (const char *file_name,
- 	}
- 
-     }
--  if (loadaddr == (ElfW(Addr)) -1)
-+  if (loadaddr == (Elf64_Addr) -1)
-     {
-       /* Very strange. */
-       loadaddr = 0;
-@@ -176,7 +349,7 @@ process_elf_file (const char *file_name,
-   if (dynamic_size == 0)
-     return 1;
- 
--  dynamic_segment = (ElfW(Dyn) *) (file_contents + dynamic_addr);
-+  dynamic_segment = (Elf64_Dyn *) (file_contents + dynamic_addr);
-   check_ptr (dynamic_segment);
- 
-   /* Find the string table.  */
-@@ -233,3 +406,33 @@ process_elf_file (const char *file_name,
- 
-   return 0;
- }
-+/* Returns 0 if everything is ok, != 0 in case of error.  */
-+int
-+process_elf_file (const char *file_name, const char *lib, int *flag,
-+		  unsigned int *osversion, char **soname, void *file_contents,
-+		  size_t file_length)
-+{
-+  int i;
-+  unsigned int j;
-+  ElfW(Addr) loadaddr;
-+  unsigned int dynamic_addr;
-+  size_t dynamic_size;
-+  char *program_interpreter;
-+
-+  ElfW(Ehdr) *elf_header;
-+  ElfW(Phdr) *elf_pheader, *segment;
-+  ElfW(Dyn) *dynamic_segment, *dyn_entry;
-+  char *dynamic_strings;
-+
-+  elf_header = (ElfW(Ehdr) *) file_contents;
-+  *osversion = 0;
-+
-+  if (elf_header->e_ident [EI_CLASS] == ELFCLASS32)
-+    return process_elf_file32(file_name, lib,flag, osversion, soname, file_contents, file_length);
-+  else if (elf_header->e_ident [EI_CLASS] == ELFCLASS64)
-+    return process_elf_file64(file_name, lib,flag, osversion, soname, file_contents, file_length);
-+  error (0, 0, _("Unknown ELFCLASS in file %s.\n"), file_name);
-+  return 1;
-+}
-+
-+
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/README b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/README
deleted file mode 100644
index 43fb983..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/README
+++ /dev/null
@@ -1,8 +0,0 @@
-The files are pulled verbatim from glibc 2.5 and then patched to allow
-standalone compilation of ldconfig.
-
-Richard Purdie
-OpenedHand Ltd.
-
-Upgraded the ldconfig recipe to eglibc 2.12.1
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/03/29
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
deleted file mode 100644
index 7f8e4db..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
+++ /dev/null
@@ -1,454 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Do data input/output handling according to endien-ness of the library file. That 
-enables use of ldconfig in the cross fashion for any architecture.
-
-2011/04/04
-Richard Purdie <richard.purdie@linuxfoundation.org>
-Nitin Kamble <nitin.a.kamble@intel.com>
-
-Index: ldconfig-native-2.12.1/readelflib.c
-===================================================================
---- ldconfig-native-2.12.1.orig/readelflib.c
-+++ ldconfig-native-2.12.1/readelflib.c
-@@ -38,6 +38,28 @@ do								\
-   }								\
-  while (0);
- 
-+int be;
-+static uint16_t read16(uint16_t x, int be)
-+{
-+  if (be)
-+        return be16toh(x);
-+  return le16toh(x);
-+}
-+
-+static uint32_t read32(uint32_t x, int be)
-+{
-+  if (be)
-+        return be32toh(x);
-+  return le32toh(x);
-+}
-+
-+static uint64_t read64(uint64_t x, int be)
-+{
-+  if (be)
-+        return be64toh(x);
-+  return le64toh(x);
-+}
-+
- /* Returns 0 if everything is ok, != 0 in case of error.  */
- int
- process_elf_file32 (const char *file_name, const char *lib, int *flag,
-@@ -59,15 +81,17 @@ process_elf_file32 (const char *file_nam
-   elf_header = (Elf32_Ehdr *) file_contents;
-   *osversion = 0;
- 
--  if (elf_header->e_type != ET_DYN)
-+  be = (elf_header->e_ident[EI_DATA] == ELFDATA2MSB);
-+
-+  if (read16(elf_header->e_type, be) != ET_DYN)
-     {
-       error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
--	     elf_header->e_type);
-+	     read16(elf_header->e_type, be));
-       return 1;
-     }
- 
-   /* Get information from elf program header.  */
--  elf_pheader = (Elf32_Phdr *) (elf_header->e_phoff + file_contents);
-+  elf_pheader = (Elf32_Phdr *) (read32(elf_header->e_phoff, be) + file_contents);
-   check_ptr (elf_pheader);
- 
-   /* The library is an elf library, now search for soname and
-@@ -79,27 +103,27 @@ process_elf_file32 (const char *file_nam
-   dynamic_size = 0;
-   program_interpreter = NULL;
-   for (i = 0, segment = elf_pheader;
--       i < elf_header->e_phnum; i++, segment++)
-+       i < read16(elf_header->e_phnum, be); i++, segment++)
-     {
-       check_ptr (segment);
- 
--      switch (segment->p_type)
-+      switch (read32(segment->p_type, be))
- 	{
- 	case PT_LOAD:
- 	  if (loadaddr == (Elf32_Addr) -1)
--	    loadaddr = segment->p_vaddr - segment->p_offset;
-+	    loadaddr = read32(segment->p_vaddr, be) - read32(segment->p_offset, be);
- 	  break;
- 
- 	case PT_DYNAMIC:
- 	  if (dynamic_addr)
- 	    error (0, 0, _("more than one dynamic segment\n"));
- 
--	  dynamic_addr = segment->p_offset;
--	  dynamic_size = segment->p_filesz;
-+	  dynamic_addr = read32(segment->p_offset, be);
-+	  dynamic_size = read32(segment->p_filesz, be);
- 	  break;
- 
- 	case PT_INTERP:
--	  program_interpreter = (char *) (file_contents + segment->p_offset);
-+	  program_interpreter = (char *) (file_contents + read32(segment->p_offset, be));
- 	  check_ptr (program_interpreter);
- 
- 	  /* Check if this is enough to classify the binary.  */
-@@ -113,20 +137,20 @@ process_elf_file32 (const char *file_nam
- 	  break;
- 
- 	case PT_NOTE:
--	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
-+	  if (!*osversion && read32(segment->p_filesz, be) >= 32 && segment->p_align >= 4)
- 	    {
- 	      Elf32_Word *abi_note = (Elf32_Word *) (file_contents
--						     + segment->p_offset);
--	      Elf32_Addr size = segment->p_filesz;
-+						     + read32(segment->p_offset, be));
-+	      Elf32_Addr size = read32(segment->p_filesz, be);
- 
--	      while (abi_note [0] != 4 || abi_note [1] != 16
--		     || abi_note [2] != 1
-+	      while (read32(abi_note [0], be) != 4 || read32(abi_note [1], be) != 16
-+		     || read32(abi_note [2], be) != 1
- 		     || memcmp (abi_note + 3, "GNU", 4) != 0)
- 		{
--#define ROUND(len) (((len) + sizeof (Elf32_Word)) - 1) & -sizeof (Elf32_Word)))
--		  Elf32_Addr) note_size = 3 * sizeof (Elf32_Word))
--					 + ROUND (abi_note[0])
--					 + ROUND (abi_note[1]);
-+#define ROUND(len) (((len) + sizeof (Elf32_Word) - 1) & -sizeof (Elf32_Word))
-+		  Elf32_Addr note_size = 3 * sizeof (Elf32_Word)
-+					 + ROUND (read32(abi_note[0], be))
-+					 + ROUND (read32(abi_note[1], be));
- 
- 		  if (size - 32 < note_size || note_size == 0)
- 		    {
-@@ -140,10 +164,10 @@ process_elf_file32 (const char *file_nam
- 	      if (size == 0)
- 		break;
- 
--	      *osversion = (abi_note [4] << 24) |
--			   ((abi_note [5] & 0xff) << 16) |
--			   ((abi_note [6] & 0xff) << 8) |
--			   (abi_note [7] & 0xff);
-+	      *osversion = (read32(abi_note [4], be) << 24) |
-+			   ((read32(abi_note [5], be) & 0xff) << 16) |
-+			   ((read32(abi_note [6], be) & 0xff) << 8) |
-+			   (read32(abi_note [7], be) & 0xff);
- 	    }
- 	  break;
- 
-@@ -167,13 +191,13 @@ process_elf_file32 (const char *file_nam
- 
-   /* Find the string table.  */
-   dynamic_strings = NULL;
--  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
-+  for (dyn_entry = dynamic_segment; read32(dyn_entry->d_tag, be) != DT_NULL;
-        ++dyn_entry)
-     {
-       check_ptr (dyn_entry);
--      if (dyn_entry->d_tag == DT_STRTAB)
-+      if (read32(dyn_entry->d_tag, be) == DT_STRTAB)
- 	{
--	  dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
-+	  dynamic_strings = (char *) (file_contents + read32(dyn_entry->d_un.d_val, be) - loadaddr);
- 	  check_ptr (dynamic_strings);
- 	  break;
- 	}
-@@ -183,15 +207,15 @@ process_elf_file32 (const char *file_nam
-     return 1;
- 
-   /* Now read the DT_NEEDED and DT_SONAME entries.  */
--  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
-+  for (dyn_entry = dynamic_segment; read32(dyn_entry->d_tag, be) != DT_NULL;
-        ++dyn_entry)
-     {
--      if (dyn_entry->d_tag == DT_NEEDED || dyn_entry->d_tag == DT_SONAME)
-+      if (read32(dyn_entry->d_tag, be) == DT_NEEDED || read32(dyn_entry->d_tag, be) == DT_SONAME)
- 	{
--	  char *name = dynamic_strings + dyn_entry->d_un.d_val;
-+	  char *name = dynamic_strings + read32(dyn_entry->d_un.d_val, be);
- 	  check_ptr (name);
- 
--	  if (dyn_entry->d_tag == DT_NEEDED)
-+	  if (read32(dyn_entry->d_tag, be) == DT_NEEDED)
- 	    {
- 
- 	      if (*flag == FLAG_ELF)
-@@ -208,7 +232,7 @@ process_elf_file32 (const char *file_nam
- 		}
- 	    }
- 
--	  else if (dyn_entry->d_tag == DT_SONAME)
-+	  else if (read32(dyn_entry->d_tag, be) == DT_SONAME)
- 	    *soname = xstrdup (name);
- 
- 	  /* Do we have everything we need?  */
-@@ -246,15 +270,17 @@ process_elf_file64 (const char *file_nam
-   elf_header = (Elf64_Ehdr *) file_contents;
-   *osversion = 0;
- 
--  if (elf_header->e_type != ET_DYN)
-+  be = (elf_header->e_ident[EI_DATA] == ELFDATA2MSB);
-+
-+  if (read16(elf_header->e_type, be) != ET_DYN)
-     {
-       error (0, 0, _("%s is not a shared object file (Type: %d).\n"), file_name,
--	     elf_header->e_type);
-+	     read16(elf_header->e_type, be));
-       return 1;
-     }
- 
-   /* Get information from elf program header.  */
--  elf_pheader = (Elf64_Phdr *) (elf_header->e_phoff + file_contents);
-+  elf_pheader = (Elf64_Phdr *) (read64(elf_header->e_phoff, be) + file_contents);
-   check_ptr (elf_pheader);
- 
-   /* The library is an elf library, now search for soname and
-@@ -266,27 +292,27 @@ process_elf_file64 (const char *file_nam
-   dynamic_size = 0;
-   program_interpreter = NULL;
-   for (i = 0, segment = elf_pheader;
--       i < elf_header->e_phnum; i++, segment++)
-+       i < read16(elf_header->e_phnum, be); i++, segment++)
-     {
-       check_ptr (segment);
- 
--      switch (segment->p_type)
-+      switch (read32(segment->p_type, be))
- 	{
- 	case PT_LOAD:
- 	  if (loadaddr == (Elf64_Addr) -1)
--	    loadaddr = segment->p_vaddr - segment->p_offset;
-+	    loadaddr = read64(segment->p_vaddr, be) - read64(segment->p_offset, be);
- 	  break;
- 
- 	case PT_DYNAMIC:
- 	  if (dynamic_addr)
- 	    error (0, 0, _("more than one dynamic segment\n"));
- 
--	  dynamic_addr = segment->p_offset;
--	  dynamic_size = segment->p_filesz;
-+	  dynamic_addr = read64(segment->p_offset, be);
-+	  dynamic_size = read32(segment->p_filesz, be);
- 	  break;
- 
- 	case PT_INTERP:
--	  program_interpreter = (char *) (file_contents + segment->p_offset);
-+	  program_interpreter = (char *) (file_contents + read64(segment->p_offset, be));
- 	  check_ptr (program_interpreter);
- 
- 	  /* Check if this is enough to classify the binary.  */
-@@ -300,20 +326,21 @@ process_elf_file64 (const char *file_nam
- 	  break;
- 
- 	case PT_NOTE:
--	  if (!*osversion && segment->p_filesz >= 32 && segment->p_align >= 4)
-+	  if (!*osversion && read32(segment->p_filesz, be) >= 32 && read32(segment->p_align, be) >= 4)
- 	    {
- 	      Elf64_Word *abi_note = (Elf64_Word *) (file_contents
--						     + segment->p_offset);
--	      Elf64_Addr size = segment->p_filesz;
-+						     + read64(segment->p_offset, be));
-+	      Elf64_Addr size = read32(segment->p_filesz, be);
- 
--	      while (abi_note [0] != 4 || abi_note [1] != 16
--		     || abi_note [2] != 1
-+	      while (read32(abi_note [0], be) != 4 || read32(abi_note [1], be) != 16
-+		     || read32(abi_note [2], be) != 1
- 		     || memcmp (abi_note + 3, "GNU", 4) != 0)
- 		{
-+#undef ROUND
- #define ROUND(len) (((len) + sizeof (Elf64_Word) - 1) & -sizeof (Elf64_Word))
- 		  Elf64_Addr note_size = 3 * sizeof (Elf64_Word)
--					 + ROUND (abi_note[0])
--					 + ROUND (abi_note[1]);
-+					 + ROUND (read32(abi_note[0], be))
-+					 + ROUND (read32(abi_note[1], be));
- 
- 		  if (size - 32 < note_size || note_size == 0)
- 		    {
-@@ -327,10 +354,10 @@ process_elf_file64 (const char *file_nam
- 	      if (size == 0)
- 		break;
- 
--	      *osversion = (abi_note [4] << 24) |
--			   ((abi_note [5] & 0xff) << 16) |
--			   ((abi_note [6] & 0xff) << 8) |
--			   (abi_note [7] & 0xff);
-+	      *osversion = (read32(abi_note [4], be) << 24) |
-+			   ((read32(abi_note [5], be) & 0xff) << 16) |
-+			   ((read32(abi_note [6], be) & 0xff) << 8) |
-+			   (read32(abi_note [7], be) & 0xff);
- 	    }
- 	  break;
- 
-@@ -354,13 +381,13 @@ process_elf_file64 (const char *file_nam
- 
-   /* Find the string table.  */
-   dynamic_strings = NULL;
--  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
-+  for (dyn_entry = dynamic_segment; read64(dyn_entry->d_tag, be) != DT_NULL;
-        ++dyn_entry)
-     {
-       check_ptr (dyn_entry);
--      if (dyn_entry->d_tag == DT_STRTAB)
-+      if (read64(dyn_entry->d_tag, be) == DT_STRTAB)
- 	{
--	  dynamic_strings = (char *) (file_contents + dyn_entry->d_un.d_val - loadaddr);
-+	  dynamic_strings = (char *) (file_contents + read64(dyn_entry->d_un.d_val, be) - loadaddr);
- 	  check_ptr (dynamic_strings);
- 	  break;
- 	}
-@@ -370,15 +397,15 @@ process_elf_file64 (const char *file_nam
-     return 1;
- 
-   /* Now read the DT_NEEDED and DT_SONAME entries.  */
--  for (dyn_entry = dynamic_segment; dyn_entry->d_tag != DT_NULL;
-+  for (dyn_entry = dynamic_segment; read64(dyn_entry->d_tag, be) != DT_NULL;
-        ++dyn_entry)
-     {
--      if (dyn_entry->d_tag == DT_NEEDED || dyn_entry->d_tag == DT_SONAME)
-+      if (read64(dyn_entry->d_tag, be) == DT_NEEDED || read64(dyn_entry->d_tag, be) == DT_SONAME)
- 	{
--	  char *name = dynamic_strings + dyn_entry->d_un.d_val;
-+	  char *name = dynamic_strings + read64(dyn_entry->d_un.d_val, be);
- 	  check_ptr (name);
- 
--	  if (dyn_entry->d_tag == DT_NEEDED)
-+	  if (read64(dyn_entry->d_tag, be) == DT_NEEDED)
- 	    {
- 
- 	      if (*flag == FLAG_ELF)
-@@ -395,7 +422,7 @@ process_elf_file64 (const char *file_nam
- 		}
- 	    }
- 
--	  else if (dyn_entry->d_tag == DT_SONAME)
-+	  else if (read64(dyn_entry->d_tag, be) == DT_SONAME)
- 	    *soname = xstrdup (name);
- 
- 	  /* Do we have everything we need?  */
-Index: ldconfig-native-2.12.1/readlib.c
-===================================================================
---- ldconfig-native-2.12.1.orig/readlib.c
-+++ ldconfig-native-2.12.1/readlib.c
-@@ -169,7 +169,8 @@ process_file (const char *real_file_name
-       ret = 1;
-     }
-   /* Libraries have to be shared object files.  */
--  else if (elf_header->e_type != ET_DYN)
-+  else if ((elf_header->e_ident[EI_DATA] == ELFDATA2MSB && be16toh(elf_header->e_type) != ET_DYN) ||
-+      (elf_header->e_ident[EI_DATA] == ELFDATA2LSB && le16toh(elf_header->e_type) != ET_DYN))
-     ret = 1;
-   else if (process_elf_file (file_name, lib, flag, osversion, soname,
- 			     file_contents, statbuf.st_size))
-Index: ldconfig-native-2.12.1/cache.c
-===================================================================
---- ldconfig-native-2.12.1.orig/cache.c
-+++ ldconfig-native-2.12.1/cache.c
-@@ -39,6 +39,29 @@
- # define N_(msgid)  msgid
- #define _(msg) msg
- 
-+extern int be;
-+
-+static uint16_t write16(uint16_t x, int be)
-+{
-+  if (be)
-+        return htobe16(x);
-+  return htole16(x);
-+}
-+
-+static uint32_t write32(uint32_t x, int be)
-+{
-+  if (be)
-+        return htobe32(x);
-+  return htole32(x);
-+}
-+
-+static uint64_t write64(uint64_t x, int be)
-+{
-+  if (be)
-+        return htobe64(x);
-+  return htole64(x);
-+}
-+
- struct cache_entry
- {
-   char *lib;			/* Library name.  */
-@@ -279,7 +302,12 @@ save_cache (const char *cache_name)
-   /* Number of normal cache entries.  */
-   int cache_entry_old_count = 0;
- 
--  for (entry = entries; entry != NULL; entry = entry->next)
-+    if (be)
-+      printf("saving cache in big endian encoding\n");
-+    else
-+      printf("saving cache in little endian encoding\n");
-+
-+    for (entry = entries; entry != NULL; entry = entry->next)
-     {
-       /* Account the final NULs.  */
-       total_strlen += strlen (entry->lib) + strlen (entry->path) + 2;
-@@ -310,7 +338,7 @@ save_cache (const char *cache_name)
-       memset (file_entries, '\0', sizeof (struct cache_file));
-       memcpy (file_entries->magic, CACHEMAGIC, sizeof CACHEMAGIC - 1);
- 
--      file_entries->nlibs = cache_entry_old_count;
-+      file_entries->nlibs = write32(cache_entry_old_count, be);
-     }
- 
-   struct cache_file_new *file_entries_new = NULL;
-@@ -330,8 +358,8 @@ save_cache (const char *cache_name)
-       memcpy (file_entries_new->version, CACHE_VERSION,
- 	      sizeof CACHE_VERSION - 1);
- 
--      file_entries_new->nlibs = cache_entry_count;
--      file_entries_new->len_strings = total_strlen;
-+      file_entries_new->nlibs = write32(cache_entry_count, be);
-+      file_entries_new->len_strings = write32(total_strlen, be);
-     }
- 
-   /* Pad for alignment of cache_file_new.  */
-@@ -358,9 +386,9 @@ save_cache (const char *cache_name)
-       /* First the library.  */
-       if (opt_format != 2 && entry->hwcap == 0)
- 	{
--	  file_entries->libs[idx_old].flags = entry->flags;
-+	  file_entries->libs[idx_old].flags = write32(entry->flags, be);
- 	  /* XXX: Actually we can optimize here and remove duplicates.  */
--	  file_entries->libs[idx_old].key = str_offset + pad;
-+	  file_entries->libs[idx_old].key = write32(str_offset + pad, be);
- 	}
-       if (opt_format != 0)
- 	{
-@@ -368,10 +396,10 @@ save_cache (const char *cache_name)
- 	     not doing so makes the code easier, the string table
- 	     always begins at the beginning of the the new cache
- 	     struct.  */
--	  file_entries_new->libs[idx_new].flags = entry->flags;
--	  file_entries_new->libs[idx_new].osversion = entry->osversion;
--	  file_entries_new->libs[idx_new].hwcap = entry->hwcap;
--	  file_entries_new->libs[idx_new].key = str_offset;
-+	  file_entries_new->libs[idx_new].flags = write32(entry->flags, be);
-+	  file_entries_new->libs[idx_new].osversion = write32(entry->osversion, be);
-+	  file_entries_new->libs[idx_new].hwcap = write64(entry->hwcap, be);
-+	  file_entries_new->libs[idx_new].key = write32(str_offset, be);
- 	}
- 
-       size_t len = strlen (entry->lib) + 1;
-@@ -379,9 +407,9 @@ save_cache (const char *cache_name)
-       str_offset += len;
-       /* Then the path.  */
-       if (opt_format != 2 && entry->hwcap == 0)
--	file_entries->libs[idx_old].value = str_offset + pad;
-+	file_entries->libs[idx_old].value = write32(str_offset + pad, be);
-       if (opt_format != 0)
--	file_entries_new->libs[idx_new].value = str_offset;
-+	file_entries_new->libs[idx_new].value = write32(str_offset, be);
-       len = strlen (entry->path) + 1;
-       str = mempcpy (str, entry->path, len);
-       str_offset += len;
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
deleted file mode 100644
index a18b2c2..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/endianess-header.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Upstream-Status: Inappropriate [fix poky patch]
-
-This patch fixes build issues with a previous endian-ness_handling.patch on
-distros that don't have macros referenced
-
-7/20/2011
-Matthew McClintock <msm@freescale.com>
-
-diff -purN ldconfig-native-2.12.1.orig/endian_extra.h ldconfig-native-2.12.1/endian_extra.h
---- ldconfig-native-2.12.1.orig/endian_extra.h	1969-12-31 18:00:00.000000000 -0600
-+++ ldconfig-native-2.12.1/endian_extra.h	2011-07-19 18:09:14.323048417 -0500
-@@ -0,0 +1,64 @@
-+/* Copyright (C) 1992, 1996, 1997, 2000, 2008 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <endian.h>
-+
-+#ifndef	_ENDIAN_EXTRA_H
-+#define	_ENDIAN_EXTRA_H	1
-+
-+/* Don't redefine these macros if they already exist */
-+#ifndef htobe16
-+#ifdef __USE_BSD
-+/* Conversion interfaces.  */
-+# include <byteswap.h>
-+
-+# if __BYTE_ORDER == __LITTLE_ENDIAN
-+#  define htobe16(x) __bswap_16 (x)
-+#  define htole16(x) (x)
-+#  define be16toh(x) __bswap_16 (x)
-+#  define le16toh(x) (x)
-+
-+#  define htobe32(x) __bswap_32 (x)
-+#  define htole32(x) (x)
-+#  define be32toh(x) __bswap_32 (x)
-+#  define le32toh(x) (x)
-+
-+#  define htobe64(x) __bswap_64 (x)
-+#  define htole64(x) (x)
-+#  define be64toh(x) __bswap_64 (x)
-+#  define le64toh(x) (x)
-+# else
-+#  define htobe16(x) (x)
-+#  define htole16(x) __bswap_16 (x)
-+#  define be16toh(x) (x)
-+#  define le16toh(x) __bswap_16 (x)
-+
-+#  define htobe32(x) (x)
-+#  define htole32(x) __bswap_32 (x)
-+#  define be32toh(x) (x)
-+#  define le32toh(x) __bswap_32 (x)
-+
-+#  define htobe64(x) (x)
-+#  define htole64(x) __bswap_64 (x)
-+#  define be64toh(x) (x)
-+#  define le64toh(x) __bswap_64 (x)
-+# endif
-+#endif
-+#endif
-+
-+#endif	/* endian_extra.h */
-diff -purN ldconfig-native-2.12.1.orig/cache.c ldconfig-native-2.12.1/cache.c
---- ldconfig-native-2.12.1.orig/cache.c	2011-07-19 18:21:28.347041301 -0500
-+++ ldconfig-native-2.12.1/cache.c	2011-07-19 18:22:54.118048064 -0500
-@@ -39,6 +39,8 @@
- # define N_(msgid)  msgid
- #define _(msg) msg
- 
-+#include "endian_extra.h"
-+
- extern int be;
- 
- static uint16_t write16(uint16_t x, int be)
-diff -purN ldconfig-native-2.12.1.orig/readelflib.c ldconfig-native-2.12.1/readelflib.c
---- ldconfig-native-2.12.1.orig/readelflib.c	2011-07-19 18:21:28.346041593 -0500
-+++ ldconfig-native-2.12.1/readelflib.c	2011-07-19 18:23:05.324059875 -0500
-@@ -25,6 +25,9 @@
- 
- /* check_ptr checks that a pointer is in the mmaped file and doesn't
-    point outside it.  */
-+
-+#include "endian_extra.h"
-+
- #undef check_ptr
- #define check_ptr(ptr)						\
- do								\
-diff -purN ldconfig-native-2.12.1.orig/readlib.c ldconfig-native-2.12.1/readlib.c
---- ldconfig-native-2.12.1.orig/readlib.c	2011-07-19 18:21:28.346041593 -0500
-+++ ldconfig-native-2.12.1/readlib.c	2011-07-19 18:23:23.877046210 -0500
-@@ -40,6 +40,8 @@
- 
- #include "ldconfig.h"
- 
-+#include "endian_extra.h"
-+
- #define _(msg) msg
- 
- #define Elf32_CLASS ELFCLASS32
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
deleted file mode 100644
index 4e9aab9..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-The native version of ldconfig was using native definition of LD_SO (i.e. 
-ld-linux-x86-64.so.2 ) which is not correct for doing the cross ldconfig.
-This was causing libc.so on the target marked as ELF lib rather than 
-FLAG_ELF_LIBC6 in the ld.so.cache.
-
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/4
-
-Index: ldconfig-native-2.12.1/readlib.c
-===================================================================
---- ldconfig-native-2.12.1.orig/readlib.c
-+++ ldconfig-native-2.12.1/readlib.c
-@@ -51,6 +51,10 @@ struct known_names
-   int flag;
- };
- 
-+/* don't use host's definition of LD_SO */
-+#undef LD_SO 
-+#define LD_SO "ld.so.1"
-+
- static struct known_names interpreters[] =
- {
-   { "/lib/" LD_SO, FLAG_ELF_LIBC6 },
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2 b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2
deleted file mode 100644
index dc1e79888e9bf28226cf18513ebd4478ec90175f..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 21491
zcmV()K;OSYT4*^jL0KkKSzNplS^$e*|NsB+0D*h||NsC0|NsC0|Nj6$0t5gA00962
z004jx00>}o9{1DbKmvVzDYv|Oo@Idd)&QPl`WXNy6zLn^T+aJFJ@xJHcJ(j5^}OEz
z8{PFaqTAjmX}$Aq(Durg+s;0^QlCt=)lQn~!262meCXQ+o>U5bXs3@iDt%-d-(Pv~
zKH2X0ci!{X_ulRAWG!S;gi;&5LVd*9)33dyT}f1d6e)Im&wI)?we`!~-S01U_15Z|
z*{;rZvtFJO<IZVZ4c)eOS6$CXU<cEy*{_G*<Z!PZ`+DuCmt&VKYwl$^t%^(A9p2sQ
znR&kZ$9o@l7V6h^w_Wb<eYZY#+?lQ@pmomK%b`x(aXRa=mpGlTuDyZjSAE*=c5r+t
z+P$8uJ9};1_Vvv1L(|i)*KGH9Ofy?Hw$c|px4gtL5GH^?35W>Mq|u6cnUOOpeu*}d
z%}Rc$>66lfAZYb81_3FcLI_O+CL(PDqx4hsru9eYBzlMHPt_h!+DE7W7>0lV2{ef!
zOp_A|dNN6<{HgeYPe^)Al)(eh1JnVdKzdCEngO6fk`W1lWK+{dO-G=ZihB`H$xVpV
z@uVivsp&L&BSwG#03t|&WHca5fJw4wCQ^RXdYWpU(KSC&<caD(RKjgfYMKCghol;L
zK@uV+flLEYrh!jNc~g3A6pvB)4JIk&1NA0=c}J)K004dH>->MK`=bcS=f9vIRwbb_
zMw%EY4A4NyLEaa=4n8~J4}kb<IOEWz2Tc4x^OSdMEZZ0J-wWZ4Rp$k1S@G3S;%^uX
z;zp6HBtghfOqE9z92Xr(4g(*^LMfz#Q&7+dtPBPs5V948BLHepAP1lEdXK2cew$63
z{8w_9Lc+hk)PIovTypfsCWHEahni-cz|_{XU>h8cS=XOF=sO>h&LBG`l_~{6D8=YY
zw`3F)Mhrn>kx?n3n4%gt%)f1$F__tidOwTN=>1z9blk{-B7%m5C<rK;D5Yr_sflI;
zf)R#^h=!^_kL>?uCx-YKe{MRC?Q+ooOj3mcQj}E%4HVHuRWU^oOw?5rG$}<T1rWp%
z4J}bZQZ$WFOq2xzP}4v$G!RuuQwE&I3MeFqsu-zou!M;q>x_#mT$apEim!g^`#(<y
z67s{Q)iOYnEmbiz(^S<{RRq*PL@Pl70+A39Ddzs!`aJ)h=ds7DqW%moJ%)b-CJ2Tn
z^3R)0HTbYT?w&k7{L}mCQPQP#&P@a3_FvPb6T(xj&Y3N2chvLll<S1M3cJHpF6wd@
zgmicgZXE?_0O&@XadyaWbXngg1WdK9y|7cHDixZ6K?2AWfq@c06oq?sc248&W{2*}
zp6yxcpw+2*y@mO2DY=7`Lw~*2atx`q=0?HxIP0ZzGT^;)n5McWT*&)Qc{JZ2`rg5#
z!3Cn=ZgHRDy7cSe{Q2LUZf8g=${~W%&ldfN4Pg&!!?0YXl`EFaNpjX{mgGC(ap8e&
zl<N$7<`*7i=3tDM4jHPv+}}?Oq|}dMAz|tZPAn-znFQ_bFuneqf6^Ys_@nNB=MN2i
zkqHbls{lW?i_4r69K`Yl7DSb>ML-A;-PggxP(mIO?bi7J9vknneZDyjdZ{RZtWBqH
zZu+Gu0+yZ4!`z0cDk@r2vNC&PDnm0OQ&EjO#$Nt86uq)J2}=_<Ut*q^2SKr2_+mv1
zZ9E#Nj96n;Shm#_WI<-BqM(CTH563?6h#FBqNF=NAHwyIjrQ8_M-9xKuis7@B~Z4v
zhYtj4(~MffP{Om0a<->*DGnt{0}fiphNl%en73woOd2%p;G!KNIQ4r$KUJ9z<<ok*
zN#mwr9*pjRBVtp7@{VvPnhcDP$#n*&QIaN9v;{FB(p6rZ4b(i66-5C;(83lFIs}3W
z7wEm@pPS{sUDIbBYwV-r_2a>KbzNcUuO3>f^xEfF0eUI#atfv`6kBcR_Gf>RmpR?u
z+K?70q|MyJS}CoD>0{uih>9v|6^07Bg=Z|(sPL*@VU_{`o4J>s!MeJbWR|L9$9oQ(
zX|=sH$5>l&>dx9@oa0*V=PqGRHe-SbhRV!Lr#VM--6{y0(K{iJ9Ar1Hi=8rwH*qf<
zC^$l4{wfOJn@fmDP0<<Ya`nOcfoy*wIziSDbDt(7Uik6*)6^%4Oj9*A&nPXBclBaA
zBy<C#{`^N9tl17z1@H3TGA0>aFZ^WEBMC}7#{@Jc7Eedr_+ch6!C5&FHC}F94bH}3
zrXTGY!vk?D<)MOQGSdjFD{eG085mV$u2H8-LX4)Q#%Q*RShcHzDq!|;!LraOS|hnw
zu2tNtjHFc_HMy80IMib8)n*e?<Sf*|Fd3yR8$@E!D$_9=Qp%ZS$9Cvo!mKMT%*bk4
zQ!<Hj5dwl#R}{FnFd7zXu5Dr<hEXY&;w(p8!)6`L?kONbL5w7rb$s9T>i>5SZdyFv
z*ynlk3)_<YUU%|#Bkn>9&syJS){g~#8zv!`Vi;)idOB|7^s7{)5Z|W?SJLZF`#Q&O
zICl0Qw{4<Fi{{Mn#MZH-AetW-%7Tt?21~5I;rDYw2j+#zM`@Y!bf?;T;r4QG`0&l_
zcg~W=*21SpB`{gmy0>YA5f)z_LZYaQk4>nwNU23d1jSUD?75u7+z+NUWA9Z#)_zXE
zk7VLFgML}GZ4@1ovTQ!GN>Q#gO#8Xqll9hRpFqE<6#+fSzz`5WQuxgkQ28?mU|N`B
zppk-#Xd-AL2!f(YXenBn0hJN~loEsWVT4r-Oau{0M3hiaP+U$(($G+fMS_G89{XS3
zKRWfBFYj;f?ME$Cyt{h5H!*p+onCcbvR3AolTMzt?5|BU+0m;xfdnH>0YpPcLsL;q
zEh5z|0YeZZO%%k`)RdGog$YAQP_ZpEQb{QlP|-0FKvfG6P^?8UK_L<pkwp~~5g}DE
z5i=Y~l0?xFBoO+!;H#)b>GWyP8$uXCLNvq#9!VI<bAdgO2l;AHK8O%Mo<~qbsuT;v
zJaTHN)&y8JGL)3DRS^`a6;f4+j*|hZIE6-HfMIC}%q@gq#uHN1Bc}`pq780jz+f1r
zAWcN#Qk4)TG!;=f0h1+0Sfx2-5d@I66F|$Dm^3+xVGa^w1r)Gm1Azrq6a@@XQv}pW
zOw`p8QB4yC08kXsNkIfzf`yS1treh+C5@<xqg1LM8F85rAj~wh1i@5MNR)|`9}mf(
zO^IR~Wy-=sF~VgGz(_Dhr{H>#<cF$bF?X}BKj0!p0RvI@B#U>eLxXgmoR=|n)28ED
zR{87IXTzcnT+4mVuif}bJci_t(F4_fQ~gKR>-}c_d+$saXCLd<TVG6S2^vB4;qSbE
zO7!mFUQmqrBZ)sK_(*?;DM)Q(1gvX6Pbo}<qYk{gvFkl-FBXu}2_y7+`F5Z($M}%#
zAGArc5d!A@pO1^~9_z8+OI+P>fVpq3r7F!#Wnt^>1e;R=QW$~y0f&wqD&Z=E0M%7h
zRrq}bgHT^YixU%{>(Rpl5_lEa@6cZf##q;x@{kfj>Z9EFN;A9gAh!CCf0XII*L0Eu
zEr<HyxaveT`#J6VaKs;z%Ggr`-w5yV73<95d6xoT5$l8@9eV?n@nU^dobcb?Aa`A0
zL_`*Vn;}dU;t}4%Bz+Jcd0(F~l&&iXTpr30zz2|BPVKJ1BD2N`>fzBHxqN|*z{rA8
z&H7kKdTjKT6(6=aEyGLG9hRNu7ZC>glfdlsIaYqz9up!}pk!d8lNdiWF%M<!ogC1s
z9QqR@hg{Q#1}U7VFuX{Vo<2pUht)U+pJ$-Ooz2I0Jy~AGdg|Hrou9YPS=}CKdN>rc
zhWk*?#vFb2>^UKn+m_fA9~8S8!NC?Fmak=%;ecw#?);wnp?4UWL$U{25YWbVMZ+7+
zJ^xJ%$31NfK)@}B9k3clu=K_Uz!7$E=M)m7Nbs4Qx2%pW<{j<XGPd=}0qOq-xzAp`
zbAiKvfS%?Y0y|`HGBe&r(9z0!oO=W;vUnK)T|PVO$E=3kITv>LJ(5lBCwSFKuwEVp
zoK$r<`K_TMRuGttaFz&dLPTXu`8SCaSIvKK5%K;Ta)&LS&TCRgcH#vS6qxIj7(E1)
zAp1SydSLi3au4FES`i494<rfvG8%!EKnW+aT{rNfI0uS~TG;NeyNLRE*P5F7&E5xZ
zZ|jmq5$Dw==yM};o=-rOE*4Lb++3kFgPqh=UL=7rxM|P0-f#MHTP|IGLqNitw5lM~
zOGdP4PIH~CJc8}Hl!q+jk}!rpKv|$J4V;4wt!#uOnG#+CL&f%w%1%UwG1B-?eZaxo
zWnzBp@OQc4L>!@amtsA%`rDZ~Gk_P1J!|XsJA}SQc2D!OsAFt}p}0m<P$!Ym@9<`R
z7f9*7y?nk+ViL;C!xE-D^`UQa1tKB~S$~tqA|DQ(B0f?Ak^oUMKCpCO%kO)NwuCL|
z{FP*qMIzQzP*9~Rgi#X~u&L{T$N__;J@MCh`ga4uRQct^gz+8}ugBN%vL1(PvnM;G
zxCBVatgj2AO%8wG!KQh4^l0Xj44!_To3oy&s~nAJFkmRA31&DY1J6U>!dcs(P~C!L
zf#FsbeiIZ*0h+#9`K8;ekl!r>SP<w(QUKtsmbea>$}J9fGl*-yr{C<(5xp&}k-(sn
zN5}lh?vr`MsPtb&f97bw<A1@~mu%e1`8geFBS8IRsPj7DZ{GIeY3VJ{^!bi3<TfTc
z$o>8z#LMn#9Q)5`?JLi}d{p^wk3S*RJI`cxQrf3b^O!ilOyk2ayfg<Dw+XYuiP(I*
z$Mv2m$K`ztTi{fLB#*PRn|An2c3579j2n1&-vh^IdE`tSrrt<&(1$SG8`GwHWIa{x
zlQ|C1Oe9P^`N7qwHQ_AUZEbsX?L)(sX|`+<$7-_Vx)m1hJ1fT?5KptE^<>+}SBJR@
zt-?yqBF&n2#S!FTp$Nc=O|-sF2k_a_F_8_V8%&P0DeK9{r>9o&u3LfRa7rBUjnlEh
zZG=fh9>FA;x)|nSK_nd^)Ng8H5;5djZG<ymfnL#!OeK_MMXf?nZ<vRMC^oMd5#l(u
zc#DLWb8Q{+JE=QfTtsLv|I)IFhA2^4$IjOKKs~-6!?4HDNUIJn#MS!Z8$dkL0a|5C
zKX8qjh8m#zt)p0LG#YT<z5|gVDN@p3LDAOn53(|ekU391Ry=WI=A84Bc^(;5Cgt42
zFmH9Fs!NLuXE2;=F?z`+IfJe_G64b?MLpkb|Ec`ac`;KVj;6mYluX76z)ryknGVNP
z!QFJq0kV`ZX=)mcA31+c|Lbqxu~ols=FHoWm`eM^kOS=-NHHRrsdBsu9MsdlQM1!O
zwzN}hO~_;L-n~7Yne%#}>Xb~Q%Ckssq4%PwT3^evkdhx?6$;VDg3gCNoPRJjuA1lg
zszSU*1vjAe1FBMxU62jg-zkwXSFamjR@3PFYm}HzVXL6oNRkBHff55n8|g7mq-g(o
zo1>LiJU&ZI(?q2}K>4muz|>C+hYWiS8!`Ko_Nhu@NCZ>SpCS%gF#fNbz{9V481tnH
zh%&cbHLBLSq$q=LCC@LccbE4kOZcRW&rz=j9T^I+^Ng)DP(YI<?fip{ne=biC2)R3
zj(DoIloK7z6!N3z7=)}$A$5-hV3wL_7YWn%PRvF3dmC(VtK)_%3EUNkI;`th2b(y_
zgv@=AeF`c{0(R;k-H(2CSVGtlKwcUI8Ahl(YB!Y8JSO(vZ2SdU{cDwt>c!95GDqh8
z`INAll6KgyTNH^D&*_HZMVCcmx=&)2ssJOn4ifhc4NDrRjJI2F*KYothT~qJ1yV=R
zSq;~V<euZ(*fsgEAPsv%6QvX+&f{2QfJ6JCK-Y~*88uTZlsDgQe52bU!C3`tNg5+D
zRP0-JS<)ua{XIUs#4CdfC?4$I;zUlCnQaUdzpr-DAux%6&*}MpQS|z>J3UQqbtv(5
zfYVGj3-wB6<kH3?T8Uc%4N$|HvTK;=32x<N@0%BFnbX5Q?5s81ExeI<LIIiGi2XP*
znhecIxXk;=QcaUPwky3JWD-wZ*R=#A@v|O|-u?Amdmn$t1EzbMujai_9RcLBBsC{Y
za)Sk8MX3s+n9y5F3kD)Fh>9SnvLlUQ`a9>E*Wc~xACGu)dE@vk-rPL-GaPzq{s+=>
zbcd~vQYVsl`6?{;o%$XdzOOsb_!nt}_{peZVl>s{d2-YS@2k7DPXg&vJX}~QYO7%j
zBVgw$04x2(4O<*c$pwX@lkKS^l3x?gOTPNpC75zPU5-yq7Xg&%{9D)O8!@{JnwF9`
z$e+Aog4H@Wu?J2OW^TqIwdwsDjN&axwdsEiVZNme0SYHykhsIP6^4<gfRBO{4_49;
zW?^=m{C?D#m@ELT<alt`XqveKOykFH1HO16Hr(vvp-5NK>cYZeo`*eQQXsZx#x7uO
z*%jErcmu(Vpjedz&Wc$XNKq?nclfIpQ&TV;*Q4#x?{NA|14*-<pA)wt*~$$3z`UcF
zi!c&fos+11+_Lo2_nlhdRs!{GSRz6}0R$Z-a7S`CBMTKATr{1J!ybJAUL1*{$P0r)
z4(UI9pfPka7DRlVB(HUECyq{J>ksI>h#-a`7;U}0UT{dJC>KOJA;OCr?j#LY*S;};
z<LWY<MMN5WC{UIMW*_GFW^&eeardEZDQ<D~TGo_wk<ghzgfETFF^0ooFdkA2xt`cD
zj^}r9efApc&@^Ap+n%D+(JpfE%bjn#WtR;VN3c<_tK+F4ny5Xn_s4vab5kAnP{e*S
z&_@SsIoP<GI`Ng{(cV4l!Iw&iJYnm4W5#2}>vcmA1wll#hZF3o;K-o7p}$3|V}eMS
zlnP{sqFMrliAofuDWGCquyN1q6o%d#Ub#E1o~(%$*c6)dY!2a?8bcB_+rBWsj6!$x
z{<@g?BH5G#&{>;j0z!djc*;Ccf0XQxi($#nS{m)L5Yy9!BI*jX=^kfjEDa<}ARM9*
z5awH9W(^i&dBzSxCPAk$<({9p3!cP#Tl?I3-wwSGMJ*d2C4++kBVq{%ry>BrOx67o
z_vq*Bmo(|C+u~5oBPvb^;yzToT=En)+~}xCj>>p(o_gg#DR?;$#EC%&o1LKHE~c_7
zcL`tG9$?SBCgq|vfm}p@Yd|p6zoUiY)BAUasGpx>^zP0OnM5R+ChXE8#}VlvHSsU=
zMB?$!tnXzfN3?Bncs4fk)ALET3>-%-zgO?`XzaXk)pe*tEf*`}6`6TL(PlFe*K&W$
zRr=xF-I+%ZC!we^r1A(A<ySTX*<*b3vUFh8!ppn)J6MkylQ{amoNeemw;G40A6;?P
zXmpoGeD&{T(pu5W8jTbWNn(=EeZQb~q>;4b+a`?@80<zuyLts8bg*L<61WsXByE=K
zqI~LxA_N#Yon7^w)YNe+e{OouM`@XGo;~z*nMK1^&()L=H=+@4>Q;dYu#^C3WXw`l
z+1S*K(E@W7bQHW879?%o>c0-JuSKg1_&8VMHxe7EG@~*%2&Iz%k91o>sAo@0<D&|$
zuR-(E7R+uoMocC@IN#G_XeiU*QKC%mKNR;P0I;&gkak!BWU_Wrh)gCq#yomcS=rms
z4d7H8S-j2M9D9&%mQ1+v2Zim>d!l}jcv~Jhc21j6ZemdhB-4356CPse^fd6sG-xM@
zJw$a;(T04Ro*s_)eexV29A<==L}EQs8l!Z#w{q-PQy0QR?d92=?x<F5j4fN2gU8j1
z>|<{vie6yL-j1*~<=go#Sf*le5q4RNMq$O`=7AikmB_+$ButTpoV?Ybd#}*p?#pHR
z=Nai#b!!|$u*JabId`?kv2S=6GTHW<#4QB|prREbXtl?u;TKx&x*7#VzF#Hqyl)td
z0|peIKOUidw~1rFQg_|<5;#J@tD{iD0;2A|LIya{OEi#`fVGu9e!REueZJ@PVv6*0
z3%QwiT+sRhgSN#@ntCGP_2rlcc7Y9+3p22DRvsHG<;(#c;fq4d2UCbu223%$iXQ;1
z9&jzj!N7GQ$WG86okh85->fhn7!o%jjX@)`&*>l=T+!c7%fo2n!uP{Ymbif9P8NuW
zkn%dI%To?$gos2hdj`uU4606kiK<sYEL9AIo{FnQD7#C~Y1LkTB{;yTkud3Ly`qN1
zH(1=kK>#~zfQ6@P3(y7Uml`+s*Q%*YT6r+^W41#pY?Sh;f^$<OhzFir>6{q}tJ@S*
zn<HaZQB_sF=0mJm86zh&(tvJe?Ac#?lZ~n9)F$uKru=oDB*tbG^8V`*ifbbdKNz4|
zemYb>tH)G9T7Z$?OvWe9-V9#d-gd*rF}5FQs%}TmN2eO%FhLvNF@<4x{WHN&mw%<l
zjF^e+raLQ<(xWfuGEI3Jq7v3@hXzf8D~~v}J2~$>m$>5j<3=Vt)W<vWCzMS{obV1X
zVPOdd;d4vp!)i6(eWG4^Fm_%xuww!ZZPN#f4XiE3@n;yfa5j+7nDDSixKxqNrXHUA
z05?$#Kn{`<mo~JK!ULn6a2ypp_cr!Q)k?5ilQRSbZIGrt8YUc%pX_31efM_Vc_#c;
z?q(f(qIPME9*SP<YNR{c^3Bl5v*x=SPzB>cL`f9Wc_8Is_W!f`qff83|F5UzU0<ql
z&))6`Z>j9{V~6cXr|g0UNT3!=Mxh}XZRY$rO+*~{q<wdb1G^RgAVL5kUD^=%I`^*@
z?+F_#IEI&6=D~tOJ((d7W5N-LWL12g(eC$Cy1rW&K{BakK`>;35HM$EA(ANC9|Obn
zzDXg`=x5*Xvfkl`i$50V6?d!c`Tdfg!?xYMEB|R^SuEhm!Pc@iDhWsdsK>U+l7fWg
zVvP(H4J<;%ep~sVHD+dIm@v^@e{3Jd{z5;LjS8k>ieI5<wDy<zE}-=g3=#wp_lXbs
zh01milj!cVMfMNUhCxdpNV5tT_D_f5$_LF^nF&nEwCp;?i&8sJjX^a9ML`f`P&x4@
zXLa~94t?1@f|Nlo#4)4vGl1|dR14Ga{y)R`eb)E?x7qOYWqBE^-vu?-UVHZA&zCNI
zm#PB}N(X5kFni#`-%1X&T^b~N<^AOWLlhw@6s#~ZzWkpl8%j`62V9ASDqk*SAJmXN
zHWCbwx{<;eAUKrKJpQd|P{<U>nN%yrM<fsUtT_q^Kz8OJP_%u70DdiC4HQ@4RUkT_
zaX<lbMFY|JakT>xKtc&12h@NbB{4;-c9=FlN|P&;7rKm>@AY~7u=swD&9_=2ZS~pn
z#>?zf9#)6iCFJ%`752h2t2W-gtD<eepYS{{x9DCg)6b`QjBmnnWkfT*{Y$L)Rk;00
zA|%c~3{@|i2g}*&?_}MozjXN9;i=$*tP>ofKEd_*VyU0E?H<nD!b0bR46VN*aFBiP
zz3IRE+`6qTt~w8*Z+AITa(A)gsSmnDieP~r$JddTc+~z9JtaXJc+SWOTLIBHDBSV!
z#eT7y#C(lK&nI-)O1JGob3<+Y7E;M{9S^P|t3yFmtV!Z;gW*|WAHwkm-x~fpyYIEl
zEJLEvXAjQk`r6Apw`xDPc-tzeVd1I^b8708bVada6&c620g!fTzNk~<qhEb#F3p!u
z<9BKn?rZc6ew%(@?9Jq`^nL%Hp2CpkJD45;Jp#r|8JO7)KPI;y9%(jcmK5SE2}HUR
z8-7OfLNme>$mGZd?*VTlO^rMKz0i(sIq>a{Z&zePIWfn!o8jAXrTsSNUdU`N_;z8~
zKI9lDB87%AbO?o8$o?+Q$iQs3J@w(2R4tcL)+_n-TKF!GaCrKww&`3D>!U~}Q&=oe
zu?vsSNmX`cH@XzL+bd(P6JVC7xepiNz4NTSCrBPi4fz42kn<wN7V5G)XvfL;u&Uq5
ztn6SbRu-?K=ED|+v8_6*F{(P=s3Bm~S9&}0Inilpel^hs+VJLbt#jI-p=Ep#^C9Q6
z5psZQsOIKv7LHfL(PO+tex9#2mdsySi}tAvFu5vUuiw4l1+iIMuIP#GToO}^9?bUX
z*sa55Ukw(9=|gjvXN&|Ps#%k-gG+L{tVM3N7ROPMV{lY<ZiW#?U(e9^r14dZ4e7sn
zTBm{RN{qj6WnKDAp2aC#!ynPFTn#SVF27IEm9e8<)7zW{y71AnL?kSWK?lmzHPV{Q
z#DiO|R%EiAD~>G;Fz@4`Oi!J?nXjaQ?<j-_pikqRWC!eo5I@5K`pJ0{a>b!sBX~<}
z2Sv(Kku4h1WFY?ivrz2>K@!Y^sRJU6jqWO%gNT8M1NVeMAq36nS^@kZ242qjI=ud(
zr{&jv^Yxc;8?vvIlw+LZYD7JdM}MEArA3*zx7_X3(EVZ(mwzbMJ$346)+=@QU3F#>
z6B1D-Z5dyU4+K_m#u&HD!u&&MZ>^Y&e$UbVHUd85x%Oc3TOrVXkF9z2mMK(q$1Bfs
zA9AusrS{vNu7hHTnAJhNVciU#XCxx*s(LqT9-R?LB&jM_I68&?Zg~gJdJ}#)LH&LD
zcoty^FpLd^0uVB`z66V5KeMAP?6?0Q2Ep}2-eu+!Ut3C1c4c5^XJ!{a-blTn8GHq#
ziZKaH@8?f>Mo}OJZ)=h}&mOB^O!`-U3M|Mn8tNP>p8u+synUH3zat>V0FneGfJCKa
zUye6l8<$Hr9C34O+o(=1Q(34S8)pXyhJ(~N<+YPP3f2ijr#khI-?#le{vEbOy{RYW
zEeSFK4TN*oqkTRmSm7{}2M@!V@T8!EUE@}ZwD~Q@!yODT7lD99EE%A6>S`fXG%lMq
zVMX(toJ827*1()wUVJfS6K!zCtKo3g<c>o}D%;Tw8V;d)lg6S42x+OqU&&2Tt2JOS
zKhQ^=#BpT7vYZY0Zn$AFGI=vCzK&Z$yJ(Qu*5i<%V5_h`LTxu_MhyZ(-;ca@c~_Di
zXMVpgXiLnj4NxqVlbokB=tY071c;wR;}4+xXXW=7kZeTl_&F(LJCEL*quJu$!@=Y3
zT?TfNq3X=B3>qq8C0U5+^x!hsI8dBNgyH4*I30GrQfoy~TaF}{6<~5*n)-_%rZ#nu
z&6Lz6bjhK*_ZY+GBvsx(xDk`;3=nW8EIUPO!|E1%q-*V<4e1SUaRx+cZyQs;PA)TX
z^OqyX(Ga&l7I2bINI>UvsH+~qks~`{Do=rI(=YXYUHzJ>&LvMcd4m;K9`1-RgW8JV
zuUFgl?PmUuyaFGFitO#Uy7hX>hwMwgzBg=dW9~sx>%DxC(<^*Dj_LPAVJ$>h`geOA
zB)7xIGmo-<Pp`H&tm|~-Cxl-wI*5#5+{^JLc>+*=Dq@vs6!8KOv(-VgDVN&6v5P9+
zwBmkU^6pA8=TuYFvlEYw_*P@$-l#YJA9NX8A6z0zc59y9A@_BuWUquge>bPZNCY>f
zDDN!MDA$Rr5aGiX^lZku{CcczGInUjA}U1I(AJSLA{dWR2lf>Dxb?(pV_)UPMZL|m
zXB_H`<3z1_8$ld%HnTh$#-R8?w#@i6tbKcgVYm$S46vAPso3uKzJF5Y)-qrlk8#^{
zL1rgb7@0KF3x{{KRRiK2v?@Hr^P*eypP=*n_PywoN)n7}ZN?@wEl8jJg_SX~GR9WK
zM(fOlim`KZ8fC>oqPUnDM#RcxF|?ym8*>J^o0TxO7PDq?IL;ijXAA_+VqMEyPBeFs
z;2vsZPLT>49f2e%iaw)r)#~Z)L8FuIZii8m&-dPR4vIrUE-Bm(Eg&OHWT?fAa|hxz
z;-B0M61yOuQ7GJEn8L*xeuXRm*ho*F^4XR|ejVC;-;Yl}$DVNor1}2;*ZaS+-*vyf
zSf2Qg{o*;gXh;$YRU9RQHWMLz6V>aGwbE_t12nL<l@8JutCyX1%cgjUznw=DA5b?L
z6u{COrgHDqj#c!ZMsDXfV>Ri~qgZ-zsA%IVqJ}9-Lj;J|8h)RuEcjrIaLh{v`>&A$
zrW(u$q3B*38vGdANMc64gc$VN38PYX5*n)LN|AeQ>cSv)^9e_Pi!OL}_j=u*!lI-`
z0q%XN+h4y2Bw|`=p``m%Sf1gQ8IacNv}dK{G&XJ-J`aIli-&<eMv8M0xiyG^2N{Qc
zC|`E$zUY&1z8ulHqz<_wX(dz|fSEhEr5y@uckG#t&t7-yykGG~B~Acz$CJlsCmNQf
zV995!M3ZG&t;UwRVTQ&~8AAv_D+vtnBvlM-f4}2tW@6p{q=NXM4VAH7b`a%#l#50%
zmFBbHU}gtL>_a8S&j?^VP{g?4@TC!;?(ZA&{SE=MS&p1L447%R*h{?D`=!N=ySdOz
z!w<{tdeqoyE`y^aH%JUbzWW3tFU-vh*Rz=PsKO4qW)a6gS=Kr!$~jEqj^Z#Egew=o
z<APyDasjWw%fJJ8Al|#k)uXqc>DlN*Q3Hph+N`IXt=p@YO}KGP4-e<*CV{=$A@oF<
z^?|Iizs3RJAq=wH#yZ0eQ<F(_5GP{;$oDXH<C^1LHpRVD^cZEuOzL_ZhWjHirHA14
z{^Od~d5v^tH$S4q;$@$5V}uPbbnZST2~;G?90;I92nSEutML8(V(;UB8$Y)O%v|&%
zT8^vcKymbYh8}MlZXRIXpJe06FK+ZdVl>gFRuc;Ze`nnv*3z}0?gNGvDhT;5rX%f9
z9`J<%HtUAEH@&bJe%J?uD#h)05ozoUqC>pa9&@fDl|LIqw^SGX$0ZYo4`sipaIH#-
zlLmO!8U73({!MD+xTB0Tz3QlFs|HtVTIA58B5-0g)G=86+f*pDAp|z~Qyio&n4T6&
z42B7*oLgmGeC85M3%%_Xp7Sy(Pnm<$jr}o9VcpU3Xg{vh7zhj{p~bV|2pHdnzv_<c
zLm%CPzu1dyVfc8U<3`tZK(*{(n@dwBIq!sF6+RJtw#QpA*ApZ-sG^WV!E?qCLwVbi
z+7>IRdy}jY6Hg%yC!#wyAte?4kq2YtDQ$-6P2$n~n~m`=BtY=C1jrEt59h6m{&#M_
z-^b5bSK;kbZsXS8nxK@E7LV2O!NMiVh%}oB`4-BP-p>WCbtCA%pIFnop&b;bL&G(u
zIr4L5D7HBHv_=nx@rLY;{$D?yT2_;xAo<pi+B1vea}jbIQ6H-bhXWl=q7fa^<snwZ
z$=ZQA1O+7bEtu5z^2Kvc{(Kqr@A!%7sgAMJibat9)a3)uRjXC!<o&xRH5^W8*4^OW
zwPac5*f=;h5yuoAR@Nm1A!Z#g5kTv`g|KZM*I|XPR4naSS#L|}ymCzJ7HkeG?J(1z
zP-l}+hAL368+FpLu-RP~4N<;~u6XFL46UR(`!KpzQUV|&)gZ$w5T2_rl3dUmR;d@P
zqXYv$HBh32{k53Tx4zgy?mbqogCPLJ35Uy-&PInsv&gt+bM~By0~6rMAlkR-p#B9c
zr|kUSqv-_xW@rKmgw%q+us^Pds)|4Ahasj5pcUFsoIuhr%Fr8$QCSfr%#}e+F#$vn
zF|j};px8tB8!?pSb4?8}VhAOog|Q25VuH4a*p#)3z(y*9f{F?VrGTV~6Ly-!WG1Gh
z0}z_Z$e<u9NNFV^Y9dtJhxp{)S~rj9fWl5>9N~^wF9a_-icsTx4dQ`1k9fOP1Il_)
zs3077;Wq?8?%9x(A&~%2H&<JX!8HTb^dB;O>H7#cgHVU&{YpZgb>Kg@{NGrMJ;D27
zgP?yb5Iuka^(y}TLsMU=9mn$n#Y{0$E+L@^FbKmycf8HopOH%kV>^`97;z{}tAmrl
z*msGz17Wc~WQZT82i4QK6r^HE9<MGOiQw~4;Qf(8V2{9g0n%)va0dQNLn(;}ff$Fy
z*a5@4kTfBPKocD<?+yWlVs%3r3QV=H1Np+FkWL`?7B}}vbUDP|3E&Vx5=AHaP=~<h
zrAkl=kCBuu%7_zq^LUnHkYH?4y8HqOL`B%I#}q8+ZeWzQ2aF_nlbU#Ls@5iHdi&>$
zBM6o$)Ly!SetFUaFz&Owz*|I+*7<R1>v3_gaQ{PGoq*-{*({t$N(9S~C<^tEHw4?*
zH&0-VS@JLtP;~~$#B4~+j-gASUuQwq%jF9Y;W$s-jzmRd;B4;jg#jSRqOV&?VKKyp
z3eYHBJca|@J}`0(bKnzj(7yB;3ZK(7sg~!eisdvQX*#NzMcncSiIM%@9FW1zfoUp`
zxfC)GGKsJr2=>^r%Lriw0G-N2I(s%SfZ5qy2NoXRU;45-ksmULhCtA_J47VFJqYYO
zfrvRb9D}>MZp-1=ft^FvCvz7-;;cu_N(XR1sRvU4)$2~kNDCOZAe;{Es*;LWYwWAS
zU?pdGyy7X>6<$CAVD3j@JzDP`G#3dUQgee_>;chGvph<$H-}8Y-iO-|8^jp_3EE?t
zPUppa{0Vd}X6S>^J46mBsmcx=W4g+9hwrri3iJ?18B)~K(LmUBt<W?uu=%-~2bM#G
zPX}{}0?(|zWz#P#Z;jy{1BP6Z&rmR2tH30C$0=4Ab%&Z8X!S-Ts}#|DQCt*5!ZHJy
z6*0v^kT4DbSm=~}km(ibUAx{vV4df_A%}6L&4J83%ID)ZnN6`_yF+D9VbXF)4;=z(
zhNC_zY*6TAPD8wo#UJe`fuT=S$sU|@j6wtA#O@+s^)DC~kv+$&Ky2=!jD$aZI0%8j
z@&n7ZfUSa*%he8K5U2uhA(v#>9YOK4sLd2h164dq9D|~BI}l)am$|)(!q!vTWWljv
z#ZIN5@;7wqn~a7Y%nnA*z{2MBC=)ez?`{mD!D8n<2YeG?xMxDzG~iDqx)A0=ka1JA
zz=6QwxF1=)_IPjNfsmcj8<OB2LrORW$QYc#if}U_vcDT1x5zzZkcsxZ;bG}LITd<E
zN#-4t=hY5Zsk8@Xi|oS-VDl~~MLG>DiHJB{z!~9g{RPp$?8qHdvYW4&o=D__lJjqj
zjD`lGN^$@XWKitb+=}=<ro7<9Jz)e#268odq+O792YR01&@!gvFnE#>+pykT2_BI&
z68geUbp198eVxB-0w_m;2scyk08vUrG&hBn(IRn9^MULj<XE851_Ty|6Zf9PJ3Hc@
zVAThS8&k{A&9x|adQJ*%C(H0ZTmJ#~{tACSEA7GWzrg(0fio;(VhMLj|9|*Nl_|A|
z>H2A`gY<+WY4n9FM5qCjlL9)K<Py*8-0kfL;DYHP6;Jj=+VyCcy$rQURe+3pgUBV^
zNIH7W&Y2+1smKlO+!+7OnzNKwmf;cik3dNT5dEy(eo@Ex{}1IakLoA+Ru<A#-6i*n
zExT-O6aDPuJM|)ElG_v4ne@6?(j15T|5*Hf@7)aP)J6zCojuc^-+}Th)11fZgOgo7
zUJ*3y)1oQo*nWY(NIIXdKC?@x9H4?=s)(6gd^z?0bGc8pd_O<vH@7N_gkQD%;q!di
zKSLkRWcZMUnwWR&KcXOXfJl~Zy8`aANCX&zlDXWFEWD4i1M`q@FmfkDf+drqz2)J)
zqf}Y4{=iEOi#L>dIdS86F0S~4sD7V8HhG)mgpiLTw7a*8QM@_^r4(dbZkNxG*?>|Q
z9vrVjk<W3G<QRt8p`v17SJIppwnj-OkKIrEtxbMc=}*zn{?z)9RQ$o~_~eq;A#&k@
zesaYrNYJGL$$oxtY8#9TE0dwkvZ<n_GOCfOs}%|<ZpEava=^(7QcQ>RIziaZDT;~M
zHUZc_L0~@bmKhu2GHza2=hqLi1w`*VO1u(pG7g9Ilt7e0ARmhTy2r7NTE`Ot3av+f
zFyTb5?Q-j7fRGyrIX%bRHGFgq!@KUCB^bUiQ%F!WRO<|n6c_=c`yEg^WCOwIA+eSr
zA-Usz2LiaY4WT1CE~E$?gwQr%9TTYi*65T_5PAL0FG>eub|+h_!m!MF*0V!QJSSl*
zZN&@1nCx{281BWCSl)Fn1Vx*fxT!f(meFw~WJHymVC9z6T)C43Mo?CB3NZ~{b0oQ8
zJfeAJJTE0$wGL=8B&eXE)Jco@k=Zo^e4?R2lr>yBx#AnnH(VhjBFQ7x7?|M3=1moD
z&f*4v8dy~*7UmroJx%IkqiAmy@d`QUlJ=1~trHURT2h`8l&&6S)DfiVusHHjj6}7h
z35L@En|3wXS6tqNgoLDbhhNLYeX*|3vaGi#s02i|0wjotyv$c9rHCLisXgJ$sR6Qa
zmCf!;IPucWRn;Ttzfc}%<EYe%P?sWarG2&vLzG0K4NmNTvjD(C4_6;@$cAo^HW#{}
z_M3^Zu*E}Jat#Gj--@9i2)6l-mFb2#lW2U9?Tx`hVOcz+`o6p9am>EwS7>yfA9?eP
z_SVv0mMR9Yv{(EFyH3>@kO6^S@?@>WPk20%_?(o&_;@h5fWf`gkm>|)lQ^Gw@Z&h3
z9_i+5j92ip8POf;CKx$b0}qfMCOgj<W2ap^Devn5))jLwz~W;?rPR4m3yXw(5evq{
z2`p2y-$x}Zy8t;QNF9itFpEL>WywsOB~cCilJwL}(eRkBKIC(>HwUUxh%3;`@vwMA
z-uDKYM1+bYGt52$Ou^}2Lv`?>@Vy9ZF%Ty!A*!JOla9#25jYV$duaG41vo_^A?Lzm
za#%pSR5Y~EHq9b!ubJXz1}^}h|CfCjK_oFJL=3s_M&}Pv5Yz}PK*{n&s)3X}$rsOt
zK3QIU5#Tq0D;JeOvFb{f1=y?XozXd-uDplEfNq+=dI8l714`1jY2%U@?F#8r%^}sn
z4N7h(WQz9!eKHuPnLBzmjHd516Ek4Y<xoWV044<K1oJ>dD7&gUcEs5>RNZBiLe$-q
za^N)+m>Qf<tM>Hws&+~0?UATS`*E8@`XgRCSV<#gQAHHB0HP<^1@dnM?)MU{7&43X
zcXgCQ)SkEDBjnBWsA^fXKrb%zj07~|4p2y>J}s-1&m-nRvqJ;r?mlV@KkG>{dt3VU
zM`#9VIf9v_0vyI@d-Zz3Fg2hGQ<I_B33BPE7SR<UfE3DY+21FOCx=E2n1iB*2(w)p
z$IKIo$m|F}UVu_RUs?&Fcs_8XP?21JXjK3`lzhy>j4=StM*<iq_Sskg6gspn{(NOT
z%TOu&Aw%e+7Ya6#C=h^oQB4>e5+5knyq_tgV|9YcWS;`4Uf)fjZXQ;G_1$nhV4Nvu
z0f?d~u>9)T2d|o%>L{bg*OpNgMyT5ptds$es^(N!m^j;p{QH~St7k14y=Ge0MpQhX
zRP{#Ay%MGcfiyKoJEt1JW)OtQnzpI<2n+&FAi9M<JU4`p3ZSE*<oSNuQ_o7(2?&)P
z6rmyYvx@haFgD!!2=&s#6EI66vhwNekBEwJB!&+x4J<-L6jBaA<WLPMKxdm5XiZ$v
zKxFW4B%yW8>BKB}pSL`h_fH}O-U{p~N+y=Fo%0DHdO4>d<dmgwq7hnwA~>6vabfI8
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

diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
deleted file mode 100644
index 52986e6..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch
+++ /dev/null
@@ -1,471 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-enable standalone building of ldconfig
-
----
- cache.c        |   11 +-
- chroot_canon.c |    7 +
- dl-cache.c     |  235 ---------------------------------------------------------
- dl-cache.h     |    3 
- ldconfig.c     |   27 ++++--
- readlib.c      |    7 +
- xstrdup.c      |   11 --
- 7 files changed, 45 insertions(+), 256 deletions(-)
-
-Index: ldconfig-native-2.12.1/cache.c
-===================================================================
---- ldconfig-native-2.12.1.orig/cache.c
-+++ ldconfig-native-2.12.1/cache.c
-@@ -16,6 +16,9 @@
-    along with this program; if not, write to the Free Software Foundation,
-    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
- 
-+#define _LARGEFILE64_SOURCE
-+#define _GNU_SOURCE
-+
- #include <errno.h>
- #include <error.h>
- #include <dirent.h>
-@@ -31,8 +34,10 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- 
--#include <ldconfig.h>
--#include <dl-cache.h>
-+#include "ldconfig.h"
-+#include "dl-cache.h"
-+# define N_(msgid)  msgid
-+#define _(msg) msg
- 
- struct cache_entry
- {
-Index: ldconfig-native-2.12.1/chroot_canon.c
-===================================================================
---- ldconfig-native-2.12.1.orig/chroot_canon.c
-+++ ldconfig-native-2.12.1/chroot_canon.c
-@@ -17,6 +17,9 @@
-    along with this program; if not, write to the Free Software Foundation,
-    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
- 
-+#define _LARGEFILE64_SOURCE
-+#define _GNU_SOURCE
-+
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
-@@ -27,7 +30,9 @@
- #include <stddef.h>
- #include <stdint.h>
- 
--#include <ldconfig.h>
-+#include "ldconfig.h"
-+
-+#define __set_errno(Val) errno = (Val)
- 
- #ifndef PATH_MAX
- #define PATH_MAX 1024
-Index: ldconfig-native-2.12.1/dl-cache.c
-===================================================================
---- ldconfig-native-2.12.1.orig/dl-cache.c
-+++ ldconfig-native-2.12.1/dl-cache.c
-@@ -20,12 +20,12 @@
- 
- #include <assert.h>
- #include <unistd.h>
--#include <ldsodefs.h>
-+//#include "ldsodefs.h"
- #include <sys/mman.h>
- #include <dl-cache.h>
- #include <dl-procinfo.h>
- 
--#include <stdio-common/_itoa.h>
-+//#include "_itoa.h"
- 
- #ifndef _DL_PLATFORMS_COUNT
- # define _DL_PLATFORMS_COUNT 0
-@@ -39,103 +39,7 @@ static size_t cachesize;
- /* 1 if cache_data + PTR points into the cache.  */
- #define _dl_cache_verify_ptr(ptr) (ptr < cache_data_size)
- 
--#define SEARCH_CACHE(cache) \
--/* We use binary search since the table is sorted in the cache file.	      \
--   The first matching entry in the table is returned.			      \
--   It is important to use the same algorithm as used while generating	      \
--   the cache file.  */							      \
--do									      \
--  {									      \
--    left = 0;								      \
--    right = cache->nlibs - 1;						      \
--									      \
--    while (left <= right)						      \
--      {									      \
--	__typeof__ (cache->libs[0].key) key;				      \
--									      \
--	middle = (left + right) / 2;					      \
--									      \
--	key = cache->libs[middle].key;					      \
--									      \
--	/* Make sure string table indices are not bogus before using	      \
--	   them.  */							      \
--	if (! _dl_cache_verify_ptr (key))				      \
--	  {								      \
--	    cmpres = 1;							      \
--	    break;							      \
--	  }								      \
--									      \
--	/* Actually compare the entry with the key.  */			      \
--	cmpres = _dl_cache_libcmp (name, cache_data + key);		      \
--	if (__builtin_expect (cmpres == 0, 0))				      \
--	  {								      \
--	    /* Found it.  LEFT now marks the last entry for which we	      \
--	       know the name is correct.  */				      \
--	    left = middle;						      \
--									      \
--	    /* There might be entries with this name before the one we	      \
--	       found.  So we have to find the beginning.  */		      \
--	    while (middle > 0)						      \
--	      {								      \
--		__typeof__ (cache->libs[0].key) key;			      \
--									      \
--		key = cache->libs[middle - 1].key;			      \
--		/* Make sure string table indices are not bogus before	      \
--		   using them.  */					      \
--		if (! _dl_cache_verify_ptr (key)			      \
--		    /* Actually compare the entry.  */			      \
--		    || _dl_cache_libcmp (name, cache_data + key) != 0)	      \
--		  break;						      \
--		--middle;						      \
--	      }								      \
--									      \
--	    do								      \
--	      {								      \
--		int flags;						      \
--		__typeof__ (cache->libs[0]) *lib = &cache->libs[middle];      \
--									      \
--		/* Only perform the name test if necessary.  */		      \
--		if (middle > left					      \
--		    /* We haven't seen this string so far.  Test whether the  \
--		       index is ok and whether the name matches.  Otherwise   \
--		       we are done.  */					      \
--		    && (! _dl_cache_verify_ptr (lib->key)		      \
--			|| (_dl_cache_libcmp (name, cache_data + lib->key)    \
--			    != 0)))					      \
--		  break;						      \
--									      \
--		flags = lib->flags;					      \
--		if (_dl_cache_check_flags (flags)			      \
--		    && _dl_cache_verify_ptr (lib->value))		      \
--		  {							      \
--		    if (best == NULL || flags == GLRO(dl_correct_cache_id))   \
--		      {							      \
--			HWCAP_CHECK;					      \
--			best = cache_data + lib->value;			      \
--									      \
--			if (flags == GLRO(dl_correct_cache_id))		      \
--			  /* We've found an exact match for the shared	      \
--			     object and no general `ELF' release.  Stop	      \
--			     searching.  */				      \
--			  break;					      \
--		      }							      \
--		  }							      \
--	      }								      \
--	    while (++middle <= right);					      \
--	    break;							      \
--	}								      \
--									      \
--	if (cmpres < 0)							      \
--	  left = middle + 1;						      \
--	else								      \
--	  right = middle - 1;						      \
--      }									      \
--  }									      \
--while (0)
--
--
- int
--internal_function
- _dl_cache_libcmp (const char *p1, const char *p2)
- {
-   while (*p1 != '\0')
-@@ -172,139 +76,3 @@ _dl_cache_libcmp (const char *p1, const 
-     }
-   return *p1 - *p2;
- }
--
--
--/* Look up NAME in ld.so.cache and return the file name stored there,
--   or null if none is found.  */
--
--const char *
--internal_function
--_dl_load_cache_lookup (const char *name)
--{
--  int left, right, middle;
--  int cmpres;
--  const char *cache_data;
--  uint32_t cache_data_size;
--  const char *best;
--
--  /* Print a message if the loading of libs is traced.  */
--  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0))
--    _dl_debug_printf (" search cache=%s\n", LD_SO_CACHE);
--
--  if (cache == NULL)
--    {
--      /* Read the contents of the file.  */
--      void *file = _dl_sysdep_read_whole_file (LD_SO_CACHE, &cachesize,
--					       PROT_READ);
--
--      /* We can handle three different cache file formats here:
--	 - the old libc5/glibc2.0/2.1 format
--	 - the old format with the new format in it
--	 - only the new format
--	 The following checks if the cache contains any of these formats.  */
--      if (file != MAP_FAILED && cachesize > sizeof *cache
--	  && memcmp (file, CACHEMAGIC, sizeof CACHEMAGIC - 1) == 0)
--	{
--	  size_t offset;
--	  /* Looks ok.  */
--	  cache = file;
--
--	  /* Check for new version.  */
--	  offset = ALIGN_CACHE (sizeof (struct cache_file)
--				+ cache->nlibs * sizeof (struct file_entry));
--
--	  cache_new = (struct cache_file_new *) ((void *) cache + offset);
--	  if (cachesize < (offset + sizeof (struct cache_file_new))
--	      || memcmp (cache_new->magic, CACHEMAGIC_VERSION_NEW,
--			 sizeof CACHEMAGIC_VERSION_NEW - 1) != 0)
--	    cache_new = (void *) -1;
--	}
--      else if (file != MAP_FAILED && cachesize > sizeof *cache_new
--	       && memcmp (file, CACHEMAGIC_VERSION_NEW,
--			  sizeof CACHEMAGIC_VERSION_NEW - 1) == 0)
--	{
--	  cache_new = file;
--	  cache = file;
--	}
--      else
--	{
--	  if (file != MAP_FAILED)
--	    __munmap (file, cachesize);
--	  cache = (void *) -1;
--	}
--
--      assert (cache != NULL);
--    }
--
--  if (cache == (void *) -1)
--    /* Previously looked for the cache file and didn't find it.  */
--    return NULL;
--
--  best = NULL;
--
--  if (cache_new != (void *) -1)
--    {
--      uint64_t platform;
--
--      /* This is where the strings start.  */
--      cache_data = (const char *) cache_new;
--
--      /* Now we can compute how large the string table is.  */
--      cache_data_size = (const char *) cache + cachesize - cache_data;
--
--      platform = _dl_string_platform (GLRO(dl_platform));
--      if (platform != (uint64_t) -1)
--	platform = 1ULL << platform;
--
--#define _DL_HWCAP_TLS_MASK (1LL << 63)
--      uint64_t hwcap_exclude = ~((GLRO(dl_hwcap) & GLRO(dl_hwcap_mask))
--				 | _DL_HWCAP_PLATFORM | _DL_HWCAP_TLS_MASK);
--
--      /* Only accept hwcap if it's for the right platform.  */
--#define HWCAP_CHECK \
--      if (lib->hwcap & hwcap_exclude)					      \
--	continue;							      \
--      if (GLRO(dl_osversion) && lib->osversion > GLRO(dl_osversion))	      \
--	continue;							      \
--      if (_DL_PLATFORMS_COUNT						      \
--	  && (lib->hwcap & _DL_HWCAP_PLATFORM) != 0			      \
--	  && (lib->hwcap & _DL_HWCAP_PLATFORM) != platform)		      \
--	continue
--      SEARCH_CACHE (cache_new);
--    }
--  else
--    {
--      /* This is where the strings start.  */
--      cache_data = (const char *) &cache->libs[cache->nlibs];
--
--      /* Now we can compute how large the string table is.  */
--      cache_data_size = (const char *) cache + cachesize - cache_data;
--
--#undef HWCAP_CHECK
--#define HWCAP_CHECK do {} while (0)
--      SEARCH_CACHE (cache);
--    }
--
--  /* Print our result if wanted.  */
--  if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_LIBS, 0)
--      && best != NULL)
--    _dl_debug_printf ("  trying file=%s\n", best);
--
--  return best;
--}
--
--#ifndef MAP_COPY
--/* If the system does not support MAP_COPY we cannot leave the file open
--   all the time since this would create problems when the file is replaced.
--   Therefore we provide this function to close the file and open it again
--   once needed.  */
--void
--_dl_unload_cache (void)
--{
--  if (cache != NULL && cache != (struct cache_file *) -1)
--    {
--      __munmap (cache, cachesize);
--      cache = NULL;
--    }
--}
--#endif
-Index: ldconfig-native-2.12.1/dl-cache.h
-===================================================================
---- ldconfig-native-2.12.1.orig/dl-cache.h
-+++ ldconfig-native-2.12.1/dl-cache.h
-@@ -101,5 +101,4 @@ struct cache_file_new
- (((addr) + __alignof__ (struct cache_file_new) -1)	\
-  & (~(__alignof__ (struct cache_file_new) - 1)))
- 
--extern int _dl_cache_libcmp (const char *p1, const char *p2)
--     internal_function;
-+extern int _dl_cache_libcmp (const char *p1, const char *p2);
-Index: ldconfig-native-2.12.1/ldconfig.c
-===================================================================
---- ldconfig-native-2.12.1.orig/ldconfig.c
-+++ ldconfig-native-2.12.1/ldconfig.c
-@@ -16,6 +16,9 @@
-    along with this program; if not, write to the Free Software Foundation,
-    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
- 
-+#define _LARGEFILE64_SOURCE
-+#define _GNU_SOURCE
-+
- #define PROCINFO_CLASS static
- #include <alloca.h>
- #include <argp.h>
-@@ -39,10 +42,20 @@
- #include <glob.h>
- #include <libgen.h>
- 
--#include <ldconfig.h>
--#include <dl-cache.h>
-+#include "ldconfig.h"
-+#include "dl-cache.h"
-+
-+#include "dl-procinfo.h"
-+
-+#include "argp.h"
-+
-+
-+#define SYSCONFDIR "/etc"
-+#define LIBDIR "/usr/lib"
-+#define SLIBDIR "/lib"
-+# define N_(msgid)  msgid
-+#define _(msg) msg
- 
--#include <dl-procinfo.h>
- 
- #ifdef _DL_FIRST_PLATFORM
- # define _DL_FIRST_EXTRA (_DL_FIRST_PLATFORM + _DL_PLATFORMS_COUNT)
-@@ -55,7 +68,7 @@
- #endif
- 
- /* Get libc version number.  */
--#include <version.h>
-+#include "version.h"
- 
- #define PACKAGE _libc_intl_domainname
- 
-@@ -152,8 +165,8 @@ static const struct argp_option options[
-   { NULL, 0, NULL, 0, NULL, 0 }
- };
- 
--#define PROCINFO_CLASS static
--#include <dl-procinfo.c>
-+//#define PROCINFO_CLASS static
-+//#include <dl-procinfo.c>
- 
- /* Short description of program.  */
- static const char doc[] = N_("Configure Dynamic Linker Run Time Bindings.");
-@@ -291,6 +304,7 @@ parse_opt (int key, char *arg, struct ar
-   return 0;
- }
- 
-+#define REPORT_BUGS_TO "mailing list : poky@yoctoproject.org"
- /* Print bug-reporting information in the help message.  */
- static char *
- more_help (int key, const char *text, void *input)
-@@ -315,7 +329,7 @@ For bug reporting instructions, please s
- static void
- print_version (FILE *stream, struct argp_state *state)
- {
--  fprintf (stream, "ldconfig %s%s\n", PKGVERSION, VERSION);
-+  fprintf (stream, "ldconfig (Hacked Poky Version)\n");
-   fprintf (stream, gettext ("\
- Copyright (C) %s Free Software Foundation, Inc.\n\
- This is free software; see the source for copying conditions.  There is NO\n\
-@@ -1233,6 +1247,7 @@ set_hwcap (void)
-     hwcap_mask = strtoul (mask, NULL, 0);
- }
- 
-+const char _libc_intl_domainname[] = "libc";
- 
- int
- main (int argc, char **argv)
-Index: ldconfig-native-2.12.1/readlib.c
-===================================================================
---- ldconfig-native-2.12.1.orig/readlib.c
-+++ ldconfig-native-2.12.1/readlib.c
-@@ -22,6 +22,9 @@
-    development version.  Besides the simplification, it has also been
-    modified to read some other file formats.  */
- 
-+#define _LARGEFILE64_SOURCE
-+#define _GNU_SOURCE
-+
- #include <a.out.h>
- #include <elf.h>
- #include <error.h>
-@@ -35,7 +38,9 @@
- #include <sys/stat.h>
- #include <gnu/lib-names.h>
- 
--#include <ldconfig.h>
-+#include "ldconfig.h"
-+
-+#define _(msg) msg
- 
- #define Elf32_CLASS ELFCLASS32
- #define Elf64_CLASS ELFCLASS64
-Index: ldconfig-native-2.12.1/xstrdup.c
-===================================================================
---- ldconfig-native-2.12.1.orig/xstrdup.c
-+++ ldconfig-native-2.12.1/xstrdup.c
-@@ -16,15 +16,10 @@
-    along with this program; if not, write to the Free Software Foundation,
-    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
- 
--#ifdef HAVE_CONFIG_H
--# include <config.h>
--#endif
-+#define _GNU_SOURCE
-+
-+#include <string.h>
- 
--#if defined STDC_HEADERS || defined HAVE_STRING_H || _LIBC
--# include <string.h>
--#else
--# include <strings.h>
--#endif
- void *xmalloc (size_t n) __THROW;
- char *xstrdup (char *string) __THROW;
- 
diff --git a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch b/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
deleted file mode 100644
index 27bc411..0000000
--- a/meta-arago-extras/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending
-
-Coming from this bug: http://sourceware.org/bugzilla/show_bug.cgi?id=11149
-
-Nitin A Kamble <nitin.a.kamble@intel.com>2011/03/29
-
---- ldconfig-native-2.12.1.orig/ldconfig.c	
-+++ ldconfig-native-2.12.1/ldconfig.c	
-@@ -1359,14 +1359,9 @@ main (int argc, char **argv)
- 
-   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
-   if (opt_chroot)
--    {
--      aux_cache_file = chroot_canon (opt_chroot, aux_cache_file);
--      if (aux_cache_file == NULL)
--	error (EXIT_FAILURE, errno, _("Can't open cache file %s\n"),
--	       _PATH_LDCONFIG_AUX_CACHE);
--    }
-+    aux_cache_file = chroot_canon (opt_chroot, aux_cache_file);
- 
--  if (! opt_ignore_aux_cache)
-+  if (! opt_ignore_aux_cache && aux_cache_file)
-     load_aux_cache (aux_cache_file);
-   else
-     init_aux_cache ();
-@@ -1376,7 +1371,8 @@ main (int argc, char **argv)
-   if (opt_build_cache)
-     {
-       save_cache (cache_file);
--      save_aux_cache (aux_cache_file);
-+      if (aux_cache_file)
-+        save_aux_cache (aux_cache_file);
-     }
- 
-   return 0;
-
diff --git a/meta-arago-extras/recipes-core/eglibc/site_config/funcs b/meta-arago-extras/recipes-core/eglibc/site_config/funcs
deleted file mode 100644
index ccc8539..0000000
--- a/meta-arago-extras/recipes-core/eglibc/site_config/funcs
+++ /dev/null
@@ -1,474 +0,0 @@
-a64l
-abs
-access
-__adjtimex
-alarm
-alphasort
-argz_append
-__argz_count
-argz_create_sep
-argz_insert
-__argz_next
-argz_next
-__argz_stringify
-argz_stringify
-asprintf
-atexit
-atof
-atoi
-bcmp
-bcopy
-bindresvport
-bind_textdomain_codeset
-btowc
-bzero
-calloc
-canonicalize_file_name
-catgets
-cfgetospeed
-cfsetispeed
-cfsetspeed
-chmod
-chown
-chroot
-clock
-close
-closedir
-closelog
-confstr
-connect
-daemon
-dcgettext
-difftime
-dirfd
-dirname
-dngettext
-dup2
-ecvt
-endgrent
-endmntent
-endpwent
-endutent
-endutxent
-epoll_ctl
-err
-ether_hostton
-ether_ntohost
-euidaccess
-execv
-fchdir
-fchmod
-fchmodat
-fchown
-fchownat
-fcntl
-fcvt
-fdatasync
-fdopendir
-feof_unlocked
-fgets_unlocked
-fgetxattr
-finite
-flistxattr
-flock
-flockfile
-fnmatch
-fork
-fpathconf
-__fpending
-fprintf
-free
-freeaddrinfo
-freeifaddrs
-fseeko
-__fsetlocking
-fsetxattr
-fstat64
-fstat
-fstatfs
-fsync
-ftello
-ftime
-ftruncate
-funlockfile
-futimes
-futimesat
-gai_strerror
-gcvt
-getaddrinfo
-getc_unlocked
-getcwd
-getdelim
-getdomainname
-getdtablesize
-getegid
-getenv
-geteuid
-getgid
-getgrent
-getgrent_r
-getgrgid_r
-getgrnam
-getgrnam_r
-getgrouplist
-getgroups
-gethostbyaddr_r
-gethostbyname2
-gethostbyname
-gethostbyname_r
-gethostent
-gethostid
-gethostname
-getifaddrs
-getline
-getloadavg
-getmntent
-getmsg
-getnameinfo
-getnetbyaddr_r
-getnetgrent_r
-getopt
-getopt_long
-getopt_long_only
-getpagesize
-getpass
-getpeername
-getpgrp
-getpid
-getppid
-getprotoent_r
-getpwent
-getpwent_r
-getpwnam
-getpwnam_r
-getpwuid
-getpwuid_r
-getresuid
-getrlimit
-getrusage
-getservbyname
-getservbyname_r
-getservbyport_r
-getservent
-getservent_r
-getspnam
-getspnam_r
-gettimeofday
-getttyent
-getttynam
-getuid
-getusershell
-getutent
-getutid
-getutline
-getutmp
-getutmpx
-getutxent
-getutxid
-getutxline
-getwd
-getxattr
-glob
-gmtime
-gmtime_r
-grantpt
-group_member
-herror
-hstrerror
-iconv
-iconv_open
-if_freenameindex
-if_indextoname
-if_nameindex
-if_nametoindex
-index
-inet_addr
-inet_aton
-inet_ntoa
-inet_ntop
-inet_pton
-initgroups
-innetgr
-iruserok
-isascii
-isatty
-isblank
-isgraph
-isinf
-isnan
-isprint
-isspace
-iswalnum
-iswcntrl
-iswctype
-iswprint
-iswspace
-iswupper
-isxdigit
-kill
-killpg
-lchown
-lckpwdf
-lgetxattr
-link
-listxattr
-llistxattr
-localtime
-localtime_r
-lockf
-lrand48
-lsearch
-lseek64
-lsetxattr
-lstat
-mallinfo
-malloc
-mblen
-mbrlen
-mbrtowc
-mbsinit
-mbsrtowcs
-mbtowc
-memalign
-memchr
-memcmp
-memcpy
-memmove
-mempcpy
-memrchr
-memset
-mkdir
-mkdirat
-mkdtemp
-mkfifo
-mknod
-mkstemp64
-mkstemp
-mktime
-mlock
-mmap
-mtrace
-munlock
-munmap
-nanosleep
-nice
-nl_langinfo
-ntp_adjtime
-ntp_gettime
-_obstack_free
-on_exit
-open64
-open
-openat
-opendir
-openlog
-pathconf
-pipe
-poll
-popen
-posix_memalign
-prctl
-pread
-printf
-__progname
-pselect
-pthread_mutex_lock
-ptsname
-putenv
-putgrent
-putpwent
-putspent
-pututline
-pututxline
-putwc
-pwrite
-qsort
-raise
-rand
-random
-rand_r
-read
-readdir
-readdir_r
-readlink
-realloc
-realpath
-re_comp
-recvmsg
-re_exec
-regcomp
-regexec
-remove
-rename
-re_search
-rmdir
-rpmatch
-rresvport_af
-ruserok
-ruserok_af
-sbrk
-scandir
-sched_setscheduler
-sched_yield
-__secure_getenv
-select
-semctl
-semget
-sendmsg
-setbuf
-setbuffer
-setegid
-setenv
-seteuid
-setgid
-setgroups
-sethostname
-setitimer
-_setjmp
-setjmp
-setlinebuf
-setlocale
-setmntent
-setpgid
-setpgrp
-setpriority
-setregid
-setresgid
-setresuid
-setreuid
-setrlimit
-setsid
-setsockopt
-settimeofday
-setuid
-setutent
-setutxent
-setvbuf
-setxattr
-sgetspent
-shmat
-shmctl
-shmdt
-shmget
-shutdown
-sigaction
-sigaddset
-sigaltstack
-sigblock
-sigemptyset
-sighold
-siginterrupt
-signal
-sigprocmask
-sigset
-sigsetmask
-sigstack
-sigsuspend
-sigvec
-snprintf
-socket
-socketpair
-sprintf
-srand48
-srand
-srandom
-sscanf
-stat
-statfs
-statvfs
-stime
-stpcpy
-strcasecmp
-strcasestr
-strchr
-strchrnul
-strcmp
-strcspn
-strdup
-strerror
-strerror_r
-strftime
-strlen
-strncasecmp
-strncmp
-strndup
-strnlen
-strpbrk
-strptime
-strrchr
-strsep
-strsignal
-strspn
-strstr
-strtod
-strtoimax
-strtok_r
-strtol
-strtoll
-strtoul
-strtoull
-strtoumax
-strverscmp
-strxfrm
-symlink
-sync
-sysconf
-sysctl
-sysinfo
-syslog
-_sys_siglist
-sys_siglist
-system
-tcgetattr
-tcgetpgrp
-tcsetattr
-tcsetpgrp
-time
-timegm
-times
-timezone
-tmpnam
-towlower
-towupper
-truncate
-tsearch
-ttyname
-tzset
-ulimit
-umask
-uname
-unlink
-unsetenv
-unshare
-updwtmp
-updwtmpx
-usleep
-ustat
-utime
-utimes
-utmpname
-utmpxname
-valloc
-vasprintf
-verrx
-vfork
-vfprintf
-vfscanf
-vhangup
-vprintf
-vsnprintf
-vsprintf
-wait3
-wait4
-waitpid
-wcrtomb
-wcscoll
-wcsdup
-wcslen
-wctob
-wctomb
-wctype
-wcwidth
-wmemchr
-wmemcpy
-wmempcpy
diff --git a/meta-arago-extras/recipes-core/eglibc/site_config/headers b/meta-arago-extras/recipes-core/eglibc/site_config/headers
deleted file mode 100644
index 609ab53..0000000
--- a/meta-arago-extras/recipes-core/eglibc/site_config/headers
+++ /dev/null
@@ -1,156 +0,0 @@
-aio.h
-alloca.h
-argz.h
-arpa/inet.h
-arpa/nameser.h
-asm/byteorder.h
-asm/ioctls.h
-asm/page.h
-asm/types.h
-assert.h
-byteswap.h
-crypt.h
-ctype.h
-dirent.h
-dlfcn.h
-elf.h
-endian.h
-err.h
-errno.h
-execinfo.h
-fcntl.h
-features.h
-float.h
-fstab.h
-ftw.h
-getopt.h
-glob.h
-grp.h
-iconv.h
-ifaddrs.h
-inttypes.h
-langinfo.h
-lastlog.h
-libgen.h
-libintl.h
-limits.h
-linux/capability.h
-linux/fd.h
-linux/fs.h
-linux/hayesesp.h
-linux/hdreg.h
-linux/icmp.h
-linux/in6.h
-linux/joystick.h
-linux/ptrace.h
-linux/serial.h
-linux/sonypi.h
-linux/unistd.h
-linux/utsname.h
-linux/version.h
-locale.h
-malloc.h
-math.h
-mcheck.h
-memory.h
-mntent.h
-mqueue.h
-netdb.h
-net/if.h
-netinet/ether.h
-netinet/in.h
-netinet/ip6.h
-netinet/ip.h
-netinet/tcp.h
-netinet/udp.h
-netipx/ipx.h
-net/route.h
-paths.h
-poll.h
-pthread.h
-pty.h
-pwd.h
-regex.h
-resolv.h
-rpc/rpc.h
-rpc/types.h
-sched.h
-scsi/scsi.h
-search.h
-semaphore.h
-setjmp.h
-sgtty.h
-shadow.h
-signal.h
-stdarg.h
-stdbool.h
-stdc
-stddef.h
-stdint.h
-stdio.h
-stdlib.h
-string.h
-strings.h
-stropts.h
-sys/bitypes.h
-sys/cdefs.h
-sys/dir.h
-sys/epoll.h
-sysexits.h
-sys/fcntl.h
-sys/file.h
-sys/fsuid.h
-sys/ioctl.h
-sys/ipc.h
-syslog.h
-sys/mman.h
-sys/mount.h
-sys/mtio.h
-sys/param.h
-sys/poll.h
-sys/prctl.h
-sys/ptrace.h
-sys/queue.h
-sys/reg.h
-sys/resource.h
-sys/select.h
-sys/sem.h
-sys/shm.h
-sys/signal.h
-sys/socket.h
-sys/socketvar.h
-sys/soundcard.h
-sys/statfs.h
-sys/stat.h
-sys/statvfs.h
-sys/stropts.h
-sys/swap.h
-sys/sysctl.h
-sys/sysinfo.h
-sys/sysmacros.h
-sys/termios.h
-sys/timeb.h
-sys/time.h
-sys/times.h
-sys/timex.h
-sys/types.h
-sys/uio.h
-sys/un.h
-sys/unistd.h
-sys/user.h
-sys/utsname.h
-sys/vfs.h
-sys/wait.h
-termio.h
-termios.h
-time.h
-ttyent.h
-ulimit.h
-unistd.h
-ustat.h
-utime.h
-utmp.h
-utmpx.h
-values.h
-wchar.h
-wctype.h
diff --git a/meta-arago-extras/recipes-core/eglibc/site_config/types b/meta-arago-extras/recipes-core/eglibc/site_config/types
deleted file mode 100644
index 178bd85..0000000
--- a/meta-arago-extras/recipes-core/eglibc/site_config/types
+++ /dev/null
@@ -1,21 +0,0 @@
-char
-char *
-double
-float
-int
-long
-long double
-long int
-long long
-long long int
-short
-short int
-signed char
-unsigned char
-unsigned int
-unsigned long
-unsigned long int
-unsigned long long int
-unsigned short
-unsigned short int
-void *
-- 
2.0.0


