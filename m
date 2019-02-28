Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EB30852A1E
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2019 05:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C68E40AF7;
	Thu, 28 Feb 2019 05:04:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LFuz2WK0YchB; Thu, 28 Feb 2019 05:04:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D123040A55;
	Thu, 28 Feb 2019 05:04:43 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E51B316BA10;
	Thu, 28 Feb 2019 00:04:42 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2019 00:04:40 -0500
Message-Id: <1551330281-32330-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] strace: overlay 4.26 from oe-core/master
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
X-List-Received-Date: Thu, 28 Feb 2019 05:04:50 -0000

Thud comes with strace 4.24 that can't build against 4.19 kernel, due to
changed header API.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...hen-using-non-glibc-libc-implementation-o.patch |  34 ++++++
 .../0001-caps-abbrev.awk-fix-gawk-s-path.patch     |  47 ++++++++
 .../strace/strace/0001-mips-o32-fix-build.patch    |  98 ++++++++++++++++
 ...tion-Check-for-mips-and-alpha-before-usin.patch |  34 ++++++
 .../strace/strace/Makefile-ptest.patch             |  49 ++++++++
 .../strace/strace/disable-git-version-gen.patch    |  37 ++++++
 .../strace/strace/mips-SIGEMT.patch                |  33 ++++++
 ...-robust-test-for-m32-mx32-compile-support.patch |  45 ++++++++
 .../recipes-devtools/strace/strace/run-ptest       |   2 +
 .../strace/strace/update-gawk-paths.patch          | 127 +++++++++++++++++++++
 .../recipes-devtools/strace/strace_4.26.bb         |  57 +++++++++
 11 files changed, 563 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/Makefile-ptest.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/disable-git-version-gen.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/mips-SIGEMT.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
 create mode 100755 meta-arago-distro/recipes-devtools/strace/strace/run-ptest
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace/update-gawk-paths.patch
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace_4.26.bb

diff --git a/meta-arago-distro/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch b/meta-arago-distro/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
new file mode 100644
index 0000000..daafceb
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
@@ -0,0 +1,34 @@
+From af1fdce78bff4343f3c84ea118abdc3c739fc646 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Apr 2016 16:23:56 +0000
+Subject: [PATCH] Fix build when using non-glibc libc implementation on ppc
+
+glibc includes the kernel header into its own header for macros
+musl does not
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ ptrace.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/ptrace.h b/ptrace.h
+index 89d4b95..b3f45bb 100644
+--- a/ptrace.h
++++ b/ptrace.h
+@@ -30,7 +30,13 @@
+ # define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
+ #endif
+ 
+-#include <linux/ptrace.h>
++#if defined(POWERPC) && !defined(__GLIBC__)
++#define pt_regs uapi_pt_regs
++#endif
++# include <linux/ptrace.h>
++#if defined(POWERPC) && !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #ifdef HAVE_STRUCT_IA64_FPREG
+ # undef ia64_fpreg
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch b/meta-arago-distro/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
new file mode 100644
index 0000000..52d2cdc
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
@@ -0,0 +1,47 @@
+From d225aaa8841f47ba8aa7b353b0ac3028d5913efe Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 9 Feb 2017 01:27:49 -0800
+Subject: [PATCH] caps-abbrev.awk: fix gawk's path
+
+It should be /usr/bin/gawk as other scripts use in this package.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+---
+ tests-m32/caps-abbrev.awk  | 2 +-
+ tests-mx32/caps-abbrev.awk | 2 +-
+ tests/caps-abbrev.awk      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
+index c00023b..a56cd56 100644
+--- a/tests-m32/caps-abbrev.awk
++++ b/tests-m32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
+index c00023b..a56cd56 100644
+--- a/tests-mx32/caps-abbrev.awk
++++ b/tests-mx32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
+index c00023b..a56cd56 100644
+--- a/tests/caps-abbrev.awk
++++ b/tests/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch b/meta-arago-distro/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
new file mode 100644
index 0000000..a5dccfb
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/0001-mips-o32-fix-build.patch
@@ -0,0 +1,98 @@
+From 2c8b6de913973274e877639658e9e7273a012adb Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Tue, 8 Jan 2019 19:23:44 +0000
+Subject: [PATCH] mips o32: fix build
+
+Upstream-Status: Backport
+
+Commit 917c2ccf3a67 "Refactor stack pointers" moved mips_REG_* macros
+from linux/mips/arch_regs.h to linux/mips/arch_regs.c because these
+macros are no longer used outside syscall.c or files included by
+syscall.c, but this caused a build regression on mips o32 because
+decode_syscall_subcall() uses mips_REG_SP prior to its definition.
+
+* syscall.c (decode_syscall_subcall): Move ...
+* linux/mips/get_syscall_args.c: ... here.
+
+Reported-by: Baruch Siach <baruch@tkos.co.il>
+Fixes: v4.26~61 "Refactor stack pointers"
+---
+ linux/mips/get_syscall_args.c | 26 ++++++++++++++++++++++++++
+ syscall.c                     | 27 ++-------------------------
+ 2 files changed, 29 insertions(+), 25 deletions(-)
+
+diff --git a/linux/mips/get_syscall_args.c b/linux/mips/get_syscall_args.c
+index 387aa852..e2889f98 100644
+--- a/linux/mips/get_syscall_args.c
++++ b/linux/mips/get_syscall_args.c
+@@ -37,3 +37,29 @@ arch_get_syscall_args(struct tcb *tcp)
+ #endif
+ 	return 1;
+ }
++
++#ifdef SYS_syscall_subcall
++static void
++decode_syscall_subcall(struct tcb *tcp)
++{
++	if (!scno_is_valid(tcp->u_arg[0]))
++		return;
++	tcp->scno = tcp->u_arg[0];
++	tcp->qual_flg = qual_flags(tcp->scno);
++	tcp->s_ent = &sysent[tcp->scno];
++	memmove(&tcp->u_arg[0], &tcp->u_arg[1],
++		sizeof(tcp->u_arg) - sizeof(tcp->u_arg[0]));
++	/*
++	 * Fetching the last arg of 7-arg syscalls (fadvise64_64
++	 * and sync_file_range) requires additional code,
++	 * see linux/mips/get_syscall_args.c
++	 */
++	if (tcp->s_ent->nargs == MAX_ARGS) {
++		if (umoven(tcp,
++			   mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
++			   sizeof(tcp->u_arg[0]),
++			   &tcp->u_arg[MAX_ARGS - 1]) < 0)
++		tcp->u_arg[MAX_ARGS - 1] = 0;
++	}
++}
++#endif /* SYS_syscall_subcall */
+diff --git a/syscall.c b/syscall.c
+index d78f51dd..51fcc721 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -349,31 +349,8 @@ decode_ipc_subcall(struct tcb *tcp)
+ #endif /* SYS_ipc_subcall */
+ 
+ #ifdef SYS_syscall_subcall
+-static void
+-decode_syscall_subcall(struct tcb *tcp)
+-{
+-	if (!scno_is_valid(tcp->u_arg[0]))
+-		return;
+-	tcp->scno = tcp->u_arg[0];
+-	tcp->qual_flg = qual_flags(tcp->scno);
+-	tcp->s_ent = &sysent[tcp->scno];
+-	memmove(&tcp->u_arg[0], &tcp->u_arg[1],
+-		sizeof(tcp->u_arg) - sizeof(tcp->u_arg[0]));
+-# ifdef LINUX_MIPSO32
+-	/*
+-	 * Fetching the last arg of 7-arg syscalls (fadvise64_64
+-	 * and sync_file_range) requires additional code,
+-	 * see linux/mips/get_syscall_args.c
+-	 */
+-	if (tcp->s_ent->nargs == MAX_ARGS) {
+-		if (umoven(tcp,
+-			   mips_REG_SP + MAX_ARGS * sizeof(tcp->u_arg[0]),
+-			   sizeof(tcp->u_arg[0]),
+-			   &tcp->u_arg[MAX_ARGS - 1]) < 0)
+-		tcp->u_arg[MAX_ARGS - 1] = 0;
+-	}
+-# endif /* LINUX_MIPSO32 */
+-}
++/* The implementation is architecture specific.  */
++static void decode_syscall_subcall(struct tcb *);
+ #endif /* SYS_syscall_subcall */
+ 
+ static void
+-- 
+2.17.0
+
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta-arago-distro/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
new file mode 100644
index 0000000..becee79
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
@@ -0,0 +1,34 @@
+From 879ae71c472ce522f1b3514d2abf6ad49b4acc07 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Sep 2017 22:51:32 -0700
+Subject: [PATCH] tests/sigaction: Check for mips and alpha before using
+ sa_restorer
+
+local structure does not define restorer member for mips and alpha
+in definition, we need to match that assumption here where they are
+being set
+
+Fixes
+| ../../strace-4.18/tests/sigaction.c:177:36: error: 'struct_set_sa {aka struct set_sa}' has no member named 'restorer'
+|  # define SA_RESTORER_ARGS , new_act->restorer
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ tests/sigaction.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/sigaction.c b/tests/sigaction.c
+index 95be197..54819f9 100644
+--- a/tests/sigaction.c
++++ b/tests/sigaction.c
+@@ -156,7 +156,7 @@ main(void)
+ 	sigdelset(mask.libc, SIGHUP);
+ 
+ 	memcpy(new_act->mask, mask.old, sizeof(mask.old));
+-#ifdef SA_RESTORER
++#if defined(SA_RESTORER) && !defined(MIPS) && !defined(ALPHA)
+ 	new_act->flags = SA_RESTORER;
+ 	new_act->restorer = (unsigned long) 0xdeadfacecafef00dULL;
+ # define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta-arago-distro/recipes-devtools/strace/strace/Makefile-ptest.patch
new file mode 100644
index 0000000..08fa5c5
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -0,0 +1,49 @@
+From ef5040b4f15006a22ac63a3bacfceac36ffc2045 Mon Sep 17 00:00:00 2001
+From: Gabriel Barbu <gabriel.barbu@enea.com>
+Date: Thu, 25 Jul 2013 15:28:33 +0200
+Subject: [PATCH] strace: Add ptest
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ tests/Makefile.am | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 825c989..4623c48 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -14,6 +14,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+ MPERS_NAME =
+ MPERS_CC_FLAGS =
+ ARCH_MFLAGS =
++TEST_SUITE_LOG = test-suite.log
+ AM_CFLAGS = $(WARN_CFLAGS)
+ AM_CPPFLAGS = $(ARCH_MFLAGS) \
+ 	      -I$(builddir) \
+@@ -477,3 +478,21 @@ BUILT_SOURCES = ksysent.h
+ CLEANFILES = ksysent.h
+ 
+ include ../scno.am
++
++buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
++
++install-ptest:
++	install $(BUILDDIR)/strace $(DESTDIR)
++	install $(srcdir)/../strace-log-merge $(DESTDIR)
++	install -d $(DESTDIR)/$(TESTDIR)
++	cp $(BUILDDIR)/$(TESTDIR)/Makefile $(DESTDIR)/$(TESTDIR)
++	sed -i -e 's/^Makefile:/_Makefile:/' $(DESTDIR)/$(TESTDIR)/Makefile
++	sed -i -e 's/bash/sh/' $(DESTDIR)/$(TESTDIR)/Makefile
++	for file in $(check_PROGRAMS); do \
++		install $(BUILDDIR)/$(TESTDIR)/$$file $(DESTDIR)/$(TESTDIR); \
++	done
++	for file in $(EXTRA_DIST); do \
++		install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
++		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
++	done
++	for i in net scm_rights-fd rt_sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta-arago-distro/recipes-devtools/strace/strace/disable-git-version-gen.patch
new file mode 100644
index 0000000..d6354bf
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/disable-git-version-gen.patch
@@ -0,0 +1,37 @@
+From ed30a4fc4dc264ce5f5881462e03ae13c921bfed Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 18 Jan 2016 13:33:50 -0800
+Subject: [PATCH] strace: remove need for scripts
+
+git-version-gen copyright-year-gen file-date-gen are not included in
+tarball releases, so we need to avoid attempts to call them.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8045ebd..4319709 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -12,12 +12,12 @@
+ 
+ AC_PREREQ(2.57)
+ AC_INIT([strace],
+-	m4_esyscmd([./git-version-gen .tarball-version]),
++	m4_esyscmd_s([cat .tarball-version]),
+ 	[strace-devel@lists.strace.io],
+ 	[strace],
+ 	[https://strace.io])
+-m4_define([copyright_year], m4_esyscmd([./copyright-year-gen .year]))
+-m4_define([manpage_date], m4_esyscmd([./file-date-gen strace.1.in]))
++m4_define([copyright_year], m4_esyscmd_s([cat .year]))
++m4_define([manpage_date], m4_esyscmd_s([cat .strace.1.in.date]))
+ AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
+ AC_CONFIG_SRCDIR([strace.c])
+ AC_CONFIG_AUX_DIR([.])
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/mips-SIGEMT.patch b/meta-arago-distro/recipes-devtools/strace/strace/mips-SIGEMT.patch
new file mode 100644
index 0000000..0d3192b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/mips-SIGEMT.patch
@@ -0,0 +1,33 @@
+From 20c184a7ab3fb7be67fb7626c411e756ea61d2f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Aug 2016 23:47:57 -0700
+Subject: [PATCH] strace: Fix build with mips/mips64 on musl
+
+SIGEMT is not defined everywhere e.g musl does
+not define it. Therefore check it being defined
+before using it.
+
+Fixes errors e.g.
+../../strace-4.13/tests/signal2name.c:45:7: error: 'SIGEMT' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+---
+ tests/signal2name.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/signal2name.c b/tests/signal2name.c
+index 1d8e7c5..6722aa1 100644
+--- a/tests/signal2name.c
++++ b/tests/signal2name.c
+@@ -49,7 +49,9 @@ signal2name(int sig)
+ 	CASE(SIGEMT);
+ 	CASE(SIGLOST);
+ #elif defined MIPS
++#ifdef SIGEMT
+ 	CASE(SIGEMT);
++#endif
+ 	CASE(SIGIOT);
+ 	CASE(SIGPWR);
+ #else
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta-arago-distro/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
new file mode 100644
index 0000000..a9bd900
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
@@ -0,0 +1,45 @@
+From cc97307e8e39a81999c6a365d057487a02e6128e Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 18 Jan 2016 11:00:00 -0800
+Subject: [PATCH] mpers.m4: more robust test for -m32/-mx32 compile support
+
+When using the default OE toolchain for x86-64, the basic checks for
+-m32 and -mx32 compile support in mpers.m4 pass but later attempts to
+actually use the toolchain with -m32 fail, e.g.
+
+ | In file included from /home/andre/build/tmp/sysroots/qemux86-64/usr/include/sys/syscall.h:31:0,
+ |                  from ../strace-4.11/defs.h:55,
+ |                  from mpers-m32/kernel_dirent.c:32:
+ | /home/andre/build/tmp/sysroots/qemux86-64/usr/include/bits/syscall.h:41:29: fatal error: bits/syscall-32.h: No such file or directory
+
+Make the mpers.m4 tests more robust so that configure correctly
+detects the limitations of the OE toolchain.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+---
+ m4/mpers.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/mpers.m4 b/m4/mpers.m4
+index 13725d7..d8578ea 100644
+--- a/m4/mpers.m4
++++ b/m4/mpers.m4
+@@ -88,6 +88,7 @@ case "$arch" in
+ 	CFLAGS="$CFLAGS MPERS_CFLAGS $IFLAG"
+ 	AC_CACHE_CHECK([for mpers_name personality compile support], [st_cv_cc],
+ 		[AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
++						     #include <sys/syscall.h>
+ 						     int main(){return 0;}]])],
+ 				   [st_cv_cc=yes],
+ 				   [st_cv_cc=no])])
+@@ -95,6 +96,7 @@ case "$arch" in
+ 		AC_CACHE_CHECK([for mpers_name personality runtime support],
+ 			[st_cv_runtime],
+ 			[AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
++							 #include <sys/syscall.h>
+ 							 int main(){return 0;}]])],
+ 				       [st_cv_runtime=yes],
+ 				       [st_cv_runtime=no],
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/run-ptest b/meta-arago-distro/recipes-devtools/strace/strace/run-ptest
new file mode 100755
index 0000000..8070d83
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -B -C tests -k test-suite.log
diff --git a/meta-arago-distro/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta-arago-distro/recipes-devtools/strace/strace/update-gawk-paths.patch
new file mode 100644
index 0000000..7077048
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -0,0 +1,127 @@
+From f0d7ebf48441e0b090c3e6053b8c845d0a4a3b18 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 18 Jan 2016 11:01:00 -0800
+Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
+
+The default path to gawk is /usr/bin/gawk, so update test scripts etc
+from #!/bin/gawk to #!/usr/bin/gawk. Fixes missing RDPENDS QA tests:
+
+  WARNING: QA Issue: /usr/lib/strace/ptest/tests/unix-yy-accept.awk_strace-ptest contained in package strace-ptest requires /bin/gawk, but no providers found in its RDEPENDS [file-rdeps]
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+---
+ mpers.awk                   | 2 +-
+ tests-m32/caps.awk          | 2 +-
+ tests-m32/match.awk         | 2 +-
+ tests-m32/rt_sigaction.awk  | 2 +-
+ tests-mx32/caps.awk         | 2 +-
+ tests-mx32/match.awk        | 2 +-
+ tests-mx32/rt_sigaction.awk | 2 +-
+ tests/caps.awk              | 2 +-
+ tests/match.awk             | 2 +-
+ tests/rt_sigaction.awk      | 2 +-
+ 10 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/mpers.awk b/mpers.awk
+index 17f8f2b..d69dcd5 100644
+--- a/mpers.awk
++++ b/mpers.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
+ # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
+diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
+index 941564a..0bcc3ff 100644
+--- a/tests-m32/caps.awk
++++ b/tests-m32/caps.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-m32/match.awk b/tests-m32/match.awk
+index d91c518..ee5d908 100644
+--- a/tests-m32/match.awk
++++ b/tests-m32/match.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests-m32/rt_sigaction.awk b/tests-m32/rt_sigaction.awk
+index 81dd813..9cd9549 100644
+--- a/tests-m32/rt_sigaction.awk
++++ b/tests-m32/rt_sigaction.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
+index 941564a..0bcc3ff 100644
+--- a/tests-mx32/caps.awk
++++ b/tests-mx32/caps.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-mx32/match.awk b/tests-mx32/match.awk
+index d91c518..ee5d908 100644
+--- a/tests-mx32/match.awk
++++ b/tests-mx32/match.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests-mx32/rt_sigaction.awk b/tests-mx32/rt_sigaction.awk
+index 81dd813..9cd9549 100644
+--- a/tests-mx32/rt_sigaction.awk
++++ b/tests-mx32/rt_sigaction.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests/caps.awk b/tests/caps.awk
+index 941564a..0bcc3ff 100644
+--- a/tests/caps.awk
++++ b/tests/caps.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests/match.awk b/tests/match.awk
+index d91c518..ee5d908 100644
+--- a/tests/match.awk
++++ b/tests/match.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2018 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests/rt_sigaction.awk b/tests/rt_sigaction.awk
+index 81dd813..9cd9549 100644
+--- a/tests/rt_sigaction.awk
++++ b/tests/rt_sigaction.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
diff --git a/meta-arago-distro/recipes-devtools/strace/strace_4.26.bb b/meta-arago-distro/recipes-devtools/strace/strace_4.26.bb
new file mode 100644
index 0000000..24f92c9
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace_4.26.bb
@@ -0,0 +1,57 @@
+SUMMARY = "System call tracing tool"
+HOMEPAGE = "http://strace.io"
+SECTION = "console/utils"
+LICENSE = "LGPL-2.1+ & GPL-2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5c84d1c6e48e7961ccd2cd2ae32f7bf1"
+
+SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+           file://disable-git-version-gen.patch \
+           file://more-robust-test-for-m32-mx32-compile-support.patch \
+           file://update-gawk-paths.patch \
+           file://Makefile-ptest.patch \
+           file://run-ptest \
+           file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
+           file://mips-SIGEMT.patch \
+           file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
+           file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
+           file://0001-mips-o32-fix-build.patch \
+           "
+SRC_URI[md5sum] = "daa51acc0c7c696221ec03cf0b30a7af"
+SRC_URI[sha256sum] = "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f59f6a1183bfa1e1c"
+
+inherit autotools ptest bluetooth
+
+PACKAGECONFIG_class-target ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+"
+
+PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+
+EXTRA_OECONF += "--enable-mpers=no"
+
+CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
+
+TESTDIR = "tests"
+PTEST_BUILD_HOST_PATTERN = "^(DEB_CHANGELOGTIME|RPM_CHANGELOGTIME|WARN_CFLAGS_FOR_BUILD|LDFLAGS_FOR_BUILD)"
+
+do_install_append() {
+	# We don't ship strace-graph here because it needs perl
+	rm ${D}${bindir}/strace-graph
+}
+
+do_compile_ptest() {
+	oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
+	install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
+	install -m 644 ${B}/config.h ${D}${PTEST_PATH}
+        sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
+}
+
+RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
+
+BBCLASSEXTEND = "native"
+TOOLCHAIN = "gcc"
-- 
2.7.4


