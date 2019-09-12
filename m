Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D1D0652A47
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C2A6940BF9;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4Rl5DWpvz4fl; Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA10F40C11;
	Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 89861174210;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:27 -0400
Message-Id: <1568302717-46518-23-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 22/32] ltp-ddt: backport fixes for glibc >2.28
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...re-time-check-for-getdents-getdents64-API.patch | 72 ++++++++++++++++++++++
 ...name-getcpu-to-avoid-conflict-with-glibc-.patch | 57 +++++++++++++++++
 ...-check-for-RES_USE_INET6-during-configure.patch | 68 ++++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |  3 +
 4 files changed, 200 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
new file mode 100644
index 0000000..adfe16c
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
@@ -0,0 +1,72 @@
+From 404dfeb4faef213b0450f173b60cd7080edec349 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 10:32:29 -0700
+Subject: [PATCH 1/2] Add configure time check for getdents/getdents64 APIs
+
+glibc 2.30 has added wrapper for getdents64 this will help in detecting
+right condition to use fallback
+
+Check for getdents API as well while here
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012954.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                                  | 2 ++
+ testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,6 +55,8 @@ AC_CHECK_HEADERS([ \
+ AC_CHECK_FUNCS([ \
+     profil \
+     ustat \
++    getdents \
++    getdents64 \
+ ])
+ 
+ # Tools knobs
+--- a/testcases/kernel/syscalls/getdents/getdents.h
++++ b/testcases/kernel/syscalls/getdents/getdents.h
+@@ -23,7 +23,7 @@
+ #include <stdint.h>
+ #include "test.h"
+ #include "lapi/syscalls.h"
+-
++#include "config.h"
+ /*
+  * See fs/compat.c struct compat_linux_dirent
+  */
+@@ -34,12 +34,17 @@ struct linux_dirent {
+ 	char            d_name[];
+ };
+ 
++#if HAVE_GETDENTS
++#include <unistd.h>
++#else
+ static inline int
+ getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents, fd, dirp, size);
+ }
+ 
++#endif /* HAVE_GETDENTS */
++
+ struct linux_dirent64 {
+ 	uint64_t	d_ino;
+ 	int64_t		d_off;
+@@ -48,10 +53,13 @@ struct linux_dirent64 {
+ 	char		d_name[];
+ };
+ 
++#if HAVE_GETDENTS64
++#include <unistd.h>
++#else
+ static inline int
+ getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
+ {
+ 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
+ }
+-
++#endif /* HAVE_GETDENTS64 */
+ #endif /* GETDENTS_H */
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
new file mode 100644
index 0000000..d0c8477
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
@@ -0,0 +1,57 @@
+From c9edb0eaaca83c18ac7b5ea3330faad8d47d3fd1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Dec 2018 06:44:02 -0800
+Subject: [PATCH] getcpu01: Rename getcpu to avoid conflict with glibc >= 2.29
+
+glibc has added getcpu() API starting with glibc 2.29 release, this
+makes the static function in conflict and signatures are not same as
+well.
+
+Renaming helps to keep ltp build going
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-December/010321.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/getcpu/getcpu01.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
+index c927512ca..e850fe844 100644
+--- a/testcases/kernel/syscalls/getcpu/getcpu01.c
++++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
+@@ -82,7 +82,7 @@ int sys_support = 0;
+ 
+ void cleanup(void);
+ void setup(void);
+-static inline int getcpu(unsigned int *, unsigned int *, void *);
++static inline int get_cpu(unsigned int *, unsigned int *, void *);
+ unsigned int set_cpu_affinity(void);
+ unsigned int get_nodeid(unsigned int);
+ unsigned int max_cpuid(size_t, cpu_set_t *);
+@@ -124,7 +124,7 @@ int main(int ac, char **av)
+ #ifdef __i386__
+ 		node_set = get_nodeid(cpu_set);
+ #endif
+-		TEST(getcpu(&cpu_id, &node_id, NULL));
++		TEST(get_cpu(&cpu_id, &node_id, NULL));
+ 		if (TEST_RETURN == 0) {
+ 			if (cpu_id != cpu_set) {
+ 				tst_resm(TFAIL, "getcpu() returned wrong value"
+@@ -157,10 +157,10 @@ int main(int ac, char **av)
+ }
+ 
+ /*
+- * getcpu() - calls the system call
++ * get_cpu() - calls the system call
+  */
+-static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
+-			 void *cache_struct)
++static inline int get_cpu(unsigned *cpu_id, unsigned *node_id,
++			  void *cache_struct)
+ {
+ #if defined(__i386__)
+ 	return syscall(318, cpu_id, node_id, cache_struct);
+-- 
+2.20.0
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
new file mode 100644
index 0000000..12e47eb
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
@@ -0,0 +1,68 @@
+From 7bc134545b7beb09717a60541530c20a1a5740d3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 10:55:28 -0700
+Subject: [PATCH 2/2] check for RES_USE_INET6 during configure
+
+glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
+since 2.26 release, this check ensures that we detect it before using it
+
+Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012955.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                                        | 13 +++++++++++++
+ testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2255b5c181..ed7acccb01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \
+     vmsplice \
+ ])
+ 
++#check defines
++AC_MSG_CHECKING([for RES_USE_INET6])
++AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include <resolv.h>]],
++  [[char dummy[RES_USE_INET6];]])],
++  [
++    AC_MSG_RESULT([yes])
++    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to 1 if you have the RES_USE_INET6 macro.])
++  ],
++  [
++    AC_MSG_RESULT([no])
++    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to 1 if you have the RES_USE_INET6 macro.])
++  ]
++)
+ # Tools knobs
+ 
+ # Expect
+diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
+index 9cc15d086b..d1cae5441a 100644
+--- a/testcases/network/multicast/mc_gethost/mc_gethost.c
++++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
+@@ -17,6 +17,8 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++#include "config.h"
++
+ #ifndef LOG_PERROR
+ #define LOG_PERROR 0
+ #endif
+@@ -50,8 +52,12 @@ usage:
+ 		argv++, argc--;
+ 	}
+ 	if (argc >= 1 && !strcmp(*argv, "-6")) {
++#if HAVE_RES_USE_INET6
+ 		af = AF_INET6, size = IN6ADDRSZ;
+ 		_res.options |= RES_USE_INET6;
++#else
++		af = AF_INET, size = INADDRSZ;
++#endif
+ 		argv++, argc--;
+ 	}
+ 	if (argc >= 1 && !strcmp(*argv, "-f")) {
+-- 
+2.22.0
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
index 09627aa..f4b0c3d 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
@@ -43,7 +43,10 @@ SRCREV = "2a01542a86a76c925f70cf0090350ac2799d4edb"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+    file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch \
+    file://0002-check-for-RES_USE_INET6-during-configure.patch \
     file://0003-Add-knob-to-control-tirpc-support.patch \
+    file://0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


