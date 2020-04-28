Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8CE9C52A62
	for <meta-arago@arago-project.org>;
	Tue, 28 Apr 2020 22:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B77DA40BDF;
	Tue, 28 Apr 2020 22:55:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bK46eAJsWled; Tue, 28 Apr 2020 22:55:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 92CA140AB5;
	Tue, 28 Apr 2020 22:55:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2EEF517272F;
	Tue, 28 Apr 2020 18:55:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 28 Apr 2020 18:55:49 -0400
Message-Id: <1588114549-16198-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ltp-ddt: rebase on top of 20200120 release, use corresponding ltp recipe as a base
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
X-List-Received-Date: Tue, 28 Apr 2020 22:58:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...re-time-check-for-getdents-getdents64-API.patch | 77 ------------------
 ...name-getcpu-to-avoid-conflict-with-glibc-.patch | 55 -------------
 ...ernel-syscalls-disable-stime-due-to-glibc.patch | 25 ------
 ...-check-for-RES_USE_INET6-during-configure.patch | 66 ---------------
 .../0003-Add-knob-to-control-tirpc-support.patch   | 43 ----------
 .../{ltp-ddt_20200217.bb => ltp-ddt_20200120.bb}   | 94 +++-------------------
 6 files changed, 11 insertions(+), 349 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20200217.bb => ltp-ddt_20200120.bb} (13%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
deleted file mode 100644
index 460c8e5..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 830872e2b50011b9a18b6cd2546550c8bf223e82 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 10:32:29 -0700
-Subject: [PATCH] Add configure time check for getdents/getdents64 APIs
-
-glibc 2.30 has added wrapper for getdents64 this will help in detecting
-right condition to use fallback
-
-Check for getdents API as well while here
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012954.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure.ac                                  |  2 ++
- testcases/kernel/syscalls/getdents/getdents.h | 12 ++++++++++--
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5c8d4ea..63912a4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,6 +55,8 @@ AC_CHECK_HEADERS([ \
- AC_CHECK_FUNCS([ \
-     profil \
-     ustat \
-+    getdents \
-+    getdents64 \
- ])
- 
- # Tools knobs
-diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
-index 702b0bd..c24ed6c 100644
---- a/testcases/kernel/syscalls/getdents/getdents.h
-+++ b/testcases/kernel/syscalls/getdents/getdents.h
-@@ -23,7 +23,7 @@
- #include <stdint.h>
- #include "test.h"
- #include "lapi/syscalls.h"
--
-+#include "config.h"
- /*
-  * See fs/compat.c struct compat_linux_dirent
-  */
-@@ -34,12 +34,17 @@ struct linux_dirent {
- 	char            d_name[];
- };
- 
-+#if HAVE_GETDENTS
-+#include <unistd.h>
-+#else
- static inline int
- getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents, fd, dirp, size);
- }
- 
-+#endif /* HAVE_GETDENTS */
-+
- struct linux_dirent64 {
- 	uint64_t	d_ino;
- 	int64_t		d_off;
-@@ -48,10 +53,13 @@ struct linux_dirent64 {
- 	char		d_name[];
- };
- 
-+#if HAVE_GETDENTS64
-+#include <unistd.h>
-+#else
- static inline int
- getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
- }
--
-+#endif /* HAVE_GETDENTS64 */
- #endif /* GETDENTS_H */
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
deleted file mode 100644
index 5dc369f..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 574b03aa9e4648a3c62c94e815f7962d7ef8088e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Dec 2018 06:44:02 -0800
-Subject: [PATCH] getcpu01: Rename getcpu to avoid conflict with glibc >= 2.29
-
-glibc has added getcpu() API starting with glibc 2.29 release, this
-makes the static function in conflict and signatures are not same as
-well.
-
-Renaming helps to keep ltp build going
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-December/010321.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- testcases/kernel/syscalls/getcpu/getcpu01.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
-index c927512..e850fe8 100644
---- a/testcases/kernel/syscalls/getcpu/getcpu01.c
-+++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
-@@ -82,7 +82,7 @@ int sys_support = 0;
- 
- void cleanup(void);
- void setup(void);
--static inline int getcpu(unsigned int *, unsigned int *, void *);
-+static inline int get_cpu(unsigned int *, unsigned int *, void *);
- unsigned int set_cpu_affinity(void);
- unsigned int get_nodeid(unsigned int);
- unsigned int max_cpuid(size_t, cpu_set_t *);
-@@ -124,7 +124,7 @@ int main(int ac, char **av)
- #ifdef __i386__
- 		node_set = get_nodeid(cpu_set);
- #endif
--		TEST(getcpu(&cpu_id, &node_id, NULL));
-+		TEST(get_cpu(&cpu_id, &node_id, NULL));
- 		if (TEST_RETURN == 0) {
- 			if (cpu_id != cpu_set) {
- 				tst_resm(TFAIL, "getcpu() returned wrong value"
-@@ -157,10 +157,10 @@ int main(int ac, char **av)
- }
- 
- /*
-- * getcpu() - calls the system call
-+ * get_cpu() - calls the system call
-  */
--static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
--			 void *cache_struct)
-+static inline int get_cpu(unsigned *cpu_id, unsigned *node_id,
-+			  void *cache_struct)
- {
- #if defined(__i386__)
- 	return syscall(318, cpu_id, node_id, cache_struct);
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch
deleted file mode 100644
index dbe4f50..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a7b8b39581a195e5f7d5bd4185d59ad146d54bce Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 6 Apr 2020 18:15:12 -0400
-Subject: [PATCH] testcases/kernel/syscalls: disable stime due to glibc-2.31
- deprecation
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- testcases/kernel/syscalls/Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index 45a00cf..d7b1d3b 100644
---- a/testcases/kernel/syscalls/Makefile
-+++ b/testcases/kernel/syscalls/Makefile
-@@ -45,4 +45,6 @@ FILTER_OUT_DIRS	+= \
- 	setdomainname sethostname symlinkat ulimit ustat vfork vhangup vmsplice
- endif
- 
-+FILTER_OUT_DIRS	+= stime
-+
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
deleted file mode 100644
index 1fa8055..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 9349acba7f68d05995a3e20ae3959ab9a5751b57 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 10:55:28 -0700
-Subject: [PATCH] check for RES_USE_INET6 during configure
-
-glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
-since 2.26 release, this check ensures that we detect it before using it
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012955.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure.ac                                        | 13 +++++++++++++
- testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
- 2 files changed, 19 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 63912a4..236d18d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -59,6 +59,19 @@ AC_CHECK_FUNCS([ \
-     getdents64 \
- ])
- 
-+#check defines
-+AC_MSG_CHECKING([for RES_USE_INET6])
-+AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include <resolv.h>]],
-+  [[char dummy[RES_USE_INET6];]])],
-+  [
-+    AC_MSG_RESULT([yes])
-+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to 1 if you have the RES_USE_INET6 macro.])
-+  ],
-+  [
-+    AC_MSG_RESULT([no])
-+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to 1 if you have the RES_USE_INET6 macro.])
-+  ]
-+)
- # Tools knobs
- 
- # Expect
-diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
-index a5c5d01..106693d 100644
---- a/testcases/network/multicast/mc_gethost/mc_gethost.c
-+++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
-@@ -17,6 +17,8 @@
- #include <string.h>
- #include <stdlib.h>
- 
-+#include "config.h"
-+
- #ifndef LOG_PERROR
- #define LOG_PERROR 0
- #endif
-@@ -52,8 +54,12 @@ usage:
- 		argv++, argc--;
- 	}
- 	if (argc >= 1 && !strcmp(*argv, "-6")) {
-+#if HAVE_RES_USE_INET6
- 		af = AF_INET6, size = IN6ADDRSZ;
- 		_res.options |= RES_USE_INET6;
-+#else
-+		af = AF_INET, size = INADDRSZ;
-+#endif
- 		argv++, argc--;
- 	}
- 	if (argc >= 1 && !strcmp(*argv, "-f")) {
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
deleted file mode 100644
index 5898389..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 87e3825943b2e52f48c49916018bbbc7d4c2f745 Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fathi.boudra@linaro.org>
-Date: Thu, 7 Jan 2016 17:36:19 +0000
-Subject: [PATCH] Add knob to control tirpc support
-
-allow to disable tirpc. Helps to disable it at top level for eg. musl it
-does not yet work.
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure.ac | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 236d18d..b10197d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -123,6 +123,13 @@ if test "x$with_python" = xyes; then
- else
-     AC_SUBST([WITH_PYTHON],["no"])
- fi
-+
-+# TI RPC
-+AC_ARG_WITH([tirpc],
-+  AC_HELP_STRING([--without-tirpc],
-+    [without libtirpc support]),
-+  [],[with_tirpc=yes],
-+)
- # END tools knobs
- 
- # Testsuites knobs
-@@ -197,7 +204,9 @@ LTP_CHECK_RENAMEAT2
- LTP_CHECK_FALLOCATE
- LTP_CHECK_SYSCALL_FCNTL
- LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
-+if test "x$with_tirpc" = xyes; then
- LTP_CHECK_TIRPC
-+fi
- LTP_CHECK_TEE
- LTP_CHECK_SPLICE
- LTP_CHECK_VMSPLICE
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
similarity index 13%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index 9d36d37..17d22b5 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -1,98 +1,26 @@
+FILESEXTRAPATHS_prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
+
+require recipes-extended/ltp/ltp_${PV}.bb
+
 SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
 HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PR = "r3"
-PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
-DEPENDS = "alsa-lib attr libaio libcap acl openssl zip-native"
 
-RDEPENDS_${PN} = "\
-    acl \
-    at \
-    attr \
-    bash \
-    cpio \
-    cronie \
-    curl \
-    e2fsprogs-mke2fs \
-    expect \
-    gawk \
-    gzip \
-    iproute2 \
-    ldd \
-    libaio \
-    logrotate \
-    perl \
-    pm-qa \
-    python3-core \
-    serialcheck \
-    unzip \
-    util-linux \
-    which \
-    libgcc\
-    memtester\
-"
+DEPENDS += "alsa-lib"
 
-inherit autotools-brokensep
+PE = "1"
+PR = "r0"
+PV_append = "+git${SRCPV}"
 
-SRCREV = "eac44ee24fd0827fb550a8afafe01f0ea3b4b039"
+SRCREV = "45830edc6bfe7ad9faef0bbe3e838b95fb9aa33e"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-    file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch \
-    file://0002-check-for-RES_USE_INET6-during-configure.patch \
-    file://0003-Add-knob-to-control-tirpc-support.patch \
-    file://0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch \
-    file://0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch \
-"
-
-S = "${WORKDIR}/git"
-
-LTPROOT = "/opt/ltp"
-
-# disable TI RPC (Transport-Independent RPC) due to missing dependency
-EXTRA_OECONF += " --without-tirpc"
+SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
+SRC_URI_prepend = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} "
 
 EXTRA_OEMAKE_append = " \
-    prefix=${LTPROOT} \
-    CROSS_COMPILE=${HOST_PREFIX} \
-    SKIP_IDCHECK=1 \
     KERNEL_USR_INC=${STAGING_INCDIR} \
     ALSA_INCPATH=${STAGING_INCDIR} \
     ALSA_LIBPATH=${STAGING_LIBDIR} \
-    RANLIB=${RANLIB} \
-    DESTDIR=${D} \
-    CC='${CC}' \
-"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-FILES_${PN}-dbg += " \
-    ${LTPROOT}/.debug \
-    ${LTPROOT}/bin/.debug \
-    ${LTPROOT}/runtest/.debug \
-    ${LTPROOT}/testcases/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/test/.debug \
-    ${LTPROOT}/testcases/bin/ddt/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
-    ${LTPROOT}/testcases/realtime/*/*/.debug \
 "
-
-FILES_${PN}-staticdev += "${LTPROOT}/lib ${LTPROOT}/lib/libmem.a ${LTPROOT}/testcases/data/nm01/lib.a"
-FILES_${PN} += "${LTPROOT}/*"
-
-do_install() {
-    oe_runmake install
-}
-
-# Avoid file dependency scans, as LTP checks for things that may or may not
-# exist on the running system.  For instance it has specific checks for
-# csh and ksh which are not typically part of OpenEmbedded systems (but
-# can be added via additional layers.)
-SKIP_FILEDEPS_${PN} = '1'
-- 
2.7.4


