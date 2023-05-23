Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA57CC7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 19:44:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.12636.1684871077802987897
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 12:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B21D740BA8;
	Tue, 23 May 2023 19:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CC7tAFPqdm54; Tue, 23 May 2023 19:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7C8BF40027;
	Tue, 23 May 2023 19:44:35 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DF20D163902;
	Tue, 23 May 2023 15:43:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] ltp: remove old versions
Date: Tue, 23 May 2023 19:44:22 +0000
Message-Id: <20230523194422.3680441-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 19:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14455

From: Denys Dmytriyenko <denys@konsulko.com>

ltp is normally provided by OE-Core. We need to overlay a specific versio=
n of
it in meta-arago as it is used as a base for ltp-ddt and is version speci=
fic.
With 20230127 in place, remove all previous versions and their correspond=
ing
patches.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ltp/0001-Add-more-musl-exclusions.patch   |  44 ------
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  31 ----
 ...option-to-select-libc-implementation.patch | 102 -------------
 ...or-time64-unsafe-syscalls-before-usi.patch | 122 ---------------
 ...BC_PREREQ-is-defined-before-using-it.patch |  55 -------
 .../0004-guard-mallocopt-with-__GLIBC__.patch |  34 -----
 .../ltp/0007-Fix-test_proc_kill-hanging.patch |  32 ----
 ...k-nfsv4-acl-acl1.c-Security-fix-on-s.patch |  42 ------
 .../recipes-extended/ltp/ltp_20200120.bb      | 122 ---------------
 .../recipes-extended/ltp/ltp_20210524.bb      | 139 ------------------
 10 files changed, 723 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0001-Add-m=
ore-musl-exclusions.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0001-Remov=
e-OOM-tests-from-runtest-mm.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0001-build=
-Add-option-to-select-libc-implementation.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0001-sysca=
lls-Check-for-time64-unsafe-syscalls-before-usi.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0003-Check=
-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0004-guard=
-mallocopt-with-__GLIBC__.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0007-Fix-t=
est_proc_kill-hanging.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0008-testc=
ases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20200120.b=
b
 delete mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20210524.b=
b

diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0001-Add-more-mus=
l-exclusions.patch b/meta-arago-extras/recipes-extended/ltp/ltp/0001-Add-=
more-musl-exclusions.patch
deleted file mode 100644
index 02c2fef5..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0001-Add-more-musl-exclu=
sions.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 788c47ceef7f115ab7f7aa17f918e58795f4e6c7 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 20 Dec 2019 13:06:05 +0100
-Subject: [PATCH] Add more musl exclusions
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-[ pvorel: rebase for 20200120: enable fanotify13, fanotify15, setxattr03=
 ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- testcases/kernel/syscalls/accept4/Makefile      | 4 ++++
- testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/accept4/Makefile b/testcases/kern=
el/syscalls/accept4/Makefile
-index 504042e11..94db06266 100644
---- a/testcases/kernel/syscalls/accept4/Makefile
-+++ b/testcases/kernel/syscalls/accept4/Makefile
-@@ -20,4 +20,8 @@ top_srcdir		?=3D ../../../..
-=20
- include $(top_srcdir)/include/mk/testcases.mk
-=20
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS        :=3D accept4_01
-+endif
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases=
/kernel/syscalls/timer_create/Makefile
-index 8de247075..eb240f432 100644
---- a/testcases/kernel/syscalls/timer_create/Makefile
-+++ b/testcases/kernel/syscalls/timer_create/Makefile
-@@ -20,6 +20,10 @@ top_srcdir		?=3D ../../../..
-=20
- include $(top_srcdir)/include/mk/testcases.mk
-=20
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS        :=3D timer_create01 timer_create03
-+endif
-+
- CPPFLAGS		+=3D -D_GNU_SOURCE -I$(abs_srcdir)/../include
-=20
- LDLIBS			+=3D -lpthread -lrt
---
-2.25.1
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0001-Remove-OOM-t=
ests-from-runtest-mm.patch b/meta-arago-extras/recipes-extended/ltp/ltp/0=
001-Remove-OOM-tests-from-runtest-mm.patch
deleted file mode 100644
index e51950f1..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-fr=
om-runtest-mm.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 93772c511d954d755cc9128c58ed8968a5af541b Mon Sep 17 00:00:00 2001
-From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
-Date: Wed, 29 Jul 2020 08:47:09 -0400
-Subject: [PATCH] Remove OOM tests from runtest/mm
-
-Disable OOM tests, as they might cause oeqa ssh connection lost
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-
----
- runtest/mm | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/runtest/mm b/runtest/mm
-index 481d39691..cf207d10e 100644
---- a/runtest/mm
-+++ b/runtest/mm
-@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
-=20
- cpuset01 cpuset01
-=20
--oom01 oom01
--oom02 oom02
--oom03 oom03
--oom04 oom04
--oom05 oom05
--
- swapping01 swapping01 -i 5
-=20
- thp01 thp01 -I 120
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0001-build-Add-op=
tion-to-select-libc-implementation.patch b/meta-arago-extras/recipes-exte=
nded/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
deleted file mode 100644
index b1a99959..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0001-build-Add-option-to=
-select-libc-implementation.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From be453d1be826b862d47e08663fd69eea9dd62730 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 18:19:03 +0000
-Subject: [PATCH 1/6] build: Add option to select libc implementation
-
-There are more than glibc for C library implementation available on
-linux now a days, uclibc cloaked like glibc but musl e.g. is very
-different and does not implement all GNU extentions
-
-Disable tests specifically not building _yet_ on musl based systems
-
-Upstream-Status: Pending
-
-rt_tgsigqueueinfo fails with:
-rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
-rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>=
'} has no member named '_sifields'; did you mean '__si_fields'?
-   42 |  sigval_rcv =3D uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
-      |                      ^~~~~~~~~
-      |                      __si_fields
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[ pvorel: rebase for 20200120: enable mallopt, profil, rpc016,
-rt_sigsuspend, sbrk_mutex, setdomainname, sethostname, sigsuspend,
-testpi-3, testpi-5, testpi-6, ustat; move rt_tgsigqueueinfo
-from 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch ]
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
----
- Makefile                           | 5 +++++
- testcases/kernel/Makefile          | 5 ++++-
- testcases/kernel/sched/Makefile    | 4 +++-
- testcases/kernel/syscalls/Makefile | 4 ++++
- 4 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 768ca4606..e9d679a71 100644
---- a/Makefile
-+++ b/Makefile
-@@ -41,6 +41,11 @@ vpath %.mk		$(top_srcdir)/mk:$(top_srcdir)/mk/include
- UCLINUX			?=3D 0
- export UCLINUX
-=20
-+# System C library implementation (glibc,uclibc,musl etc.)
-+# default to glibc if not set
-+LIBC			?=3D glibc
-+export LIBC
-+
- # CLEAN_TARGETS:	Targets which exist solely in clean.
- # COMMON_TARGETS:	Targets which exist in all, clean, and install.
- # INSTALL_TARGETS:	Targets which exist in clean and install (contains
-diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
-index 3319b3163..94ea362c8 100644
---- a/testcases/kernel/Makefile
-+++ b/testcases/kernel/Makefile
-@@ -49,13 +49,16 @@ SUBDIRS			+=3D connectors \
- 			   logging \
- 			   mem \
- 			   numa \
--			   pty \
- 			   sched \
- 			   security \
- 			   sound \
- 			   tracing \
- 			   uevents \
-=20
-+ifneq ($(LIBC),musl)
-+SUBDIRS			+=3D pty
-+endif
-+
- ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
- SUBDIRS			+=3D power_management
- endif
-diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Ma=
kefile
-index 6a57d79ee..74bb93370 100644
---- a/testcases/kernel/sched/Makefile
-+++ b/testcases/kernel/sched/Makefile
-@@ -23,5 +23,7 @@
- top_srcdir		?=3D ../../..
-=20
- include $(top_srcdir)/include/mk/env_pre.mk
--
-+ifeq ($(LIBC),musl)
-+	FILTER_OUT_DIRS +=3D process_stress
-+endif
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/sysca=
lls/Makefile
-index 45a00cf7d..af5a591a0 100644
---- a/testcases/kernel/syscalls/Makefile
-+++ b/testcases/kernel/syscalls/Makefile
-@@ -29,6 +29,10 @@ FILTER_OUT_DIRS	+=3D capget capset chmod chown clone =
fork getcontext llseek \
- 		   mincore mprotect nftw profil remap_file_pages sbrk
- endif
-=20
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_DIRS	+=3D confstr fmtmsg getcontext ioctl rt_tgsigqueueinfo
-+endif
-+
- ifeq ($(UCLIBC),1)
- FILTER_OUT_DIRS	+=3D profil
- endif
---
-2.25.1
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0001-syscalls-Che=
ck-for-time64-unsafe-syscalls-before-usi.patch b/meta-arago-extras/recipe=
s-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-=
usi.patch
deleted file mode 100644
index ac8f08ef..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0001-syscalls-Check-for-=
time64-unsafe-syscalls-before-usi.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 89c5841bd148a7ae70c65f4a1ca5996b7f0cddfa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Feb 2020 22:52:04 -0800
-Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using=
 them
-
-musl is using 64bit time_t now on 32bit architectures and these syscalls
-no longer exist, therefore its better to check for them being available
-before using them
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream-Status: accepted as 5b57ae2913e2d2d167cbd3822784b4c4ba336812
----
- lib/tst_clocks.c                                 | 16 ++++++----------
- .../syscalls/gettimeofday/gettimeofday01.c       |  6 ++----
- .../syscalls/gettimeofday/gettimeofday02.c       |  8 +++-----
- 3 files changed, 11 insertions(+), 19 deletions(-)
-
-diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
-index 5195da38f..fa2f1cb84 100644
---- a/lib/tst_clocks.c
-+++ b/lib/tst_clocks.c
-@@ -3,28 +3,24 @@
-  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
-  */
-
--/*
-- * clock_gettime() and clock_getres() functions
-- */
--
--#define _GNU_SOURCE
--#include <unistd.h>
- #include <time.h>
--#include <sys/syscall.h>
-
-+#define TST_NO_DEFAULT_MAIN
-+#include "tst_test.h"
- #include "tst_clocks.h"
-+#include "lapi/syscalls.h"
-=20
- int tst_clock_getres(clockid_t clk_id, struct timespec *res)
- {
--	return syscall(SYS_clock_getres, clk_id, res);
-+	return tst_syscall(__NR_clock_getres, clk_id, res);
- }
-=20
- int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
- {
--	return syscall(SYS_clock_gettime, clk_id, ts);
-+	return tst_syscall(__NR_clock_gettime, clk_id, ts);
- }
-=20
- int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
- {
--	return syscall(SYS_clock_settime, clk_id, ts);
-+	return tst_syscall(__NR_clock_settime, clk_id, ts);
- }
-diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/t=
estcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-index 583d8f7b9..08ea1673a 100644
---- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
-@@ -38,10 +38,8 @@
- #include <sys/time.h>
- #include <errno.h>
- #include "test.h"
--#include <sys/syscall.h>
- #include <unistd.h>
--
--#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
-+#include "lapi/syscalls.h"
-=20
- char *TCID =3D "gettimeofday01";
- int TST_TOTAL =3D 1;
-@@ -63,7 +61,7 @@ int main(int ac, char **av)
- 	for (lc =3D 0; TEST_LOOPING(lc); lc++) {
- 		tst_count =3D 0;
-=20
--		TEST(gettimeofday((void *)-1, (void *)-1));
-+		TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-1));
-=20
- 		/* gettimeofday returns an int, so we need to turn the long
- 		 * TEST_RETURN into an int to test with */
-diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/t=
estcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-index 1d60f448e..5170ad2f7 100644
---- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
-@@ -16,14 +16,12 @@
- #include <stdint.h>
- #include <sys/time.h>
- #include <stdlib.h>
--#include <sys/syscall.h>
- #include <unistd.h>
- #include <time.h>
- #include <errno.h>
-=20
- #include "tst_test.h"
--
--#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
-+#include "lapi/syscalls.h"
-=20
- static volatile sig_atomic_t done;
- static char *str_rtime;
-@@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
-=20
- 	alarm(rtime);
-=20
--	if (gettimeofday(&tv1, NULL)) {
-+	if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
- 		tst_res(TBROK | TERRNO, "gettimeofday() failed");
- 		return;
- 	}
-=20
- 	while (!done) {
--		if (gettimeofday(&tv2, NULL)) {
-+		if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
- 			tst_res(TBROK | TERRNO, "gettimeofday() failed");
- 			return;
- 		}
---
-2.25.1
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0003-Check-if-__G=
LIBC_PREREQ-is-defined-before-using-it.patch b/meta-arago-extras/recipes-=
extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.=
patch
deleted file mode 100644
index df3e8831..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PR=
EREQ-is-defined-before-using-it.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 1ce47a6ed811fd78ed04ea2f82e6321c6bca57b6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 19:40:08 +0000
-Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using it
-
-__GLIBC_PREREQ is specific to glibc so it should be checked if it is
-defined or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
----
- testcases/kernel/syscalls/accept4/accept4_01.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/=
kernel/syscalls/accept4/accept4_01.c
-index 29e18f27d..07444a46f 100644
---- a/testcases/kernel/syscalls/accept4/accept4_01.c
-+++ b/testcases/kernel/syscalls/accept4/accept4_01.c
-@@ -38,6 +38,7 @@
- static struct sockaddr_in *conn_addr, *accept_addr;
- static int listening_fd;
-=20
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if !(__GLIBC_PREREQ(2, 10))
- static int
- accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int f=
lags)
-@@ -56,6 +57,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_=
t *addrlen, int flags)
- #endif
- }
- #endif
-+#endif
-=20
- static int create_listening_socket(void)
- {
-@@ -114,12 +116,17 @@ static void verify_accept4(unsigned int nr)
- 	SAFE_CONNECT(connfd, (struct sockaddr *)conn_addr, sizeof(*conn_addr))=
;
- 	addrlen =3D sizeof(*accept_addr);
-=20
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if !(__GLIBC_PREREQ(2, 10))
- 	TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr, &addrlen=
,
- 				tcase->cloexec | tcase->nonblock));
- #else
- 	TEST(accept4(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
- 				tcase->cloexec | tcase->nonblock));
-+#endif
-+#else
-+	TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
-+				tcase->cloexec | tcase->nonblock));
- #endif
- 	if (TST_RET =3D=3D -1) {
- 		if (TST_ERR =3D=3D ENOSYS)
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0004-guard-malloc=
opt-with-__GLIBC__.patch b/meta-arago-extras/recipes-extended/ltp/ltp/000=
4-guard-mallocopt-with-__GLIBC__.patch
deleted file mode 100644
index 5622a64d..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0004-guard-mallocopt-wit=
h-__GLIBC__.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d0fc9ca5d3366f9b8907e463222403cd2327be10 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 06:51:20 +0000
-Subject: [PATCH] guard mallocopt() with __GLIBC__
-
-mallocopt is not available on non glibc implementations
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/benchmark/ebizzy-0.3/ebizzy.c b/utils/benchmark/ebizz=
y-0.3/ebizzy.c
-index 5bb8eff..934d951 100644
---- a/utils/benchmark/ebizzy-0.3/ebizzy.c
-+++ b/utils/benchmark/ebizzy-0.3/ebizzy.c
-@@ -215,10 +215,10 @@ static void read_options(int argc, char *argv[])
- 			"\"never mmap\" option specified\n");
- 		usage();
- 	}
--
-+#ifdef __GLIBC__
- 	if (never_mmap)
- 		mallopt(M_MMAP_MAX, 0);
--
-+#endif
- 	if (chunk_size < record_size) {
- 		fprintf(stderr, "Chunk size %u smaller than record size %u\n",
- 			chunk_size, record_size);
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0007-Fix-test_pro=
c_kill-hanging.patch b/meta-arago-extras/recipes-extended/ltp/ltp/0007-Fi=
x-test_proc_kill-hanging.patch
deleted file mode 100644
index 0e726457..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-=
hanging.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f4fafbdffae3a63c81f65cef98c72dda26283e06 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 16:17:17 +0800
-Subject: [PATCH] Fix test_proc_kill hanging
-
-Sometimes the signal is delivered to memcg_process before the framework =
took
-into consideration its pid entered in the tasks. Fixed by delaying the s=
ignal
-send command.
-
-Upstream-Status: Pending
-
-Signed-off-by: George Nita <george.nita@enea.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/kernel/controllers/memcg/functional/memcg_lib.sh | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh =
b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-index aadaae4..deea5d6 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-@@ -291,6 +291,7 @@ test_proc_kill()
- 	pid=3D$!
- 	TST_CHECKPOINT_WAIT 0
- 	echo $pid > tasks
-+	sleep 1
-=20
- 	signal_memcg_process $pid $3
-=20
---=20
-2.7.4
-
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp/0008-testcases-ne=
twork-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta-arago-extras/recipe=
s-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-o=
n-s.patch
deleted file mode 100644
index 350091a7..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp/0008-testcases-network-n=
fsv4-acl-acl1.c-Security-fix-on-s.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 4b7db094d6fc5659001ae8dc17078bb65d46b9c9 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inux.intel.com>
-Date: Fri, 13 May 2016 11:11:28 -0500
-Subject: [PATCH] acl: Security fix on string printf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error when compiled with -Werror=3Dformat-security:
-
-acl1.c: In function =E2=80=98test_acl_default=E2=80=99:
-acl1.c:305:2: error: format not a string literal and no format arguments=
 [-Werror=3Dformat-security]
-  305 |  printf(cmd);
-
-Patch taken from openembedded-core,
-original bug report: https://bugzilla.yoctoproject.org/9548
-
-[YOCTO #9548]
-
-Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream-Status: accepted in 4b7db094d6fc5659001ae8dc17078bb65d46b9c9
----
- testcases/network/nfsv4/acl/acl1.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv=
4/acl/acl1.c
-index aae9484e5..ad778cd33 100644
---- a/testcases/network/nfsv4/acl/acl1.c
-+++ b/testcases/network/nfsv4/acl/acl1.c
-@@ -302,7 +302,7 @@ void test_acl_default(char *dir, acl_t acl)
- 	char *cmd =3D malloc(256);
-=20
- 	strcpy(cmd, "chmod 7777 ");
--	printf(cmd);
-+	printf(cmd, NULL);
- 	strcat(cmd, dir);
- 	system(cmd);
- 	acl2 =3D acl_get_file(path, ACL_TYPE_ACCESS);
---=20
-2.25.1
-
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb b/met=
a-arago-extras/recipes-extended/ltp/ltp_20200120.bb
deleted file mode 100644
index e0086141..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20200120.bb
+++ /dev/null
@@ -1,122 +0,0 @@
-SUMMARY =3D "Linux Test Project"
-DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM=
, OSDL, and Bull with a goal to deliver test suites to the open source co=
mmunity that validate the reliability, robustness, and stability of Linux=
. The Linux Test Project is a collection of tools for testing the Linux k=
ernel and related features."
-HOMEPAGE =3D "https://linux-test-project.github.io/"
-SECTION =3D "console/utils"
-LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-=
2.1-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "\
-    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-    file://testcases/kernel/controllers/freezer/COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
-    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=
=3D5;endline=3D17;md5=3D86a61d2c042d59836ffb353a21456498 \
-    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=3De04a2e5=
42b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=3De04a2e542b=
2b8629bf9cd2ba29b0fe41 \
-    file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30=
ec2cf884ae699947 \
-    file://testcases/realtime/COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4=
ca7e \
-    file://utils/benchmark/kernbench-0.42/COPYING;md5=3D94d55d512a9ba36c=
aa9b7df079bae19f \
-"
-
-DEPENDS =3D "attr libaio libcap acl openssl zip-native"
-DEPENDS:append:libc-musl =3D " fts "
-EXTRA_OEMAKE:append:libc-musl =3D " LIBC=3Dmusl "
-EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
-
-# since ltp contains x86-64 assembler which uses the frame-pointer regis=
ter,
-# set -fomit-frame-pointer x86-64 to handle cases where optimisation
-# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-p=
ointer
-# earlier in CFLAGS, etc.
-CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
-
-CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
-CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
-SRCREV =3D "4079aaf264d0e9ead042b59d1c5f4e643620d0d5"
-
-SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
-           file://0001-build-Add-option-to-select-libc-implementation.pa=
tch \
-           file://0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-i=
t.patch \
-           file://0004-guard-mallocopt-with-__GLIBC__.patch \
-           file://0007-Fix-test_proc_kill-hanging.patch \
-           file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-o=
n-s.patch \
-           file://0001-Add-more-musl-exclusions.patch \
-           file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-=
usi.patch \
-           "
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools-brokensep
-
-TARGET_CC_ARCH +=3D "${LDFLAGS}"
-
-export prefix =3D "/opt/${PN}"
-export exec_prefix =3D "/opt/${PN}"
-
-PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl,"
-EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF =3D " --with-power-management-testsuite --with-realtime-tes=
tsuite --with-open-posix-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF +=3D " --without-tirpc "
-
-do_install(){
-    install -d ${D}${prefix}/
-    oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install
-
-    # fixup not deploy STPfailure_report.pl to avoid confusing about it =
fails to run
-    # as it lacks dependency on some perl moudle such as LWP::Simple
-    # And this script previously works as a tool for analyzing failures =
from LTP
-    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly acc=
esses
-    # http://khack.osdl.org to retrieve ltp test results run on
-    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unac=
cessible
-    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
-
-    # Copy POSIX test suite into ${D}${prefix}/testcases by manual
-    cp -r testcases/open_posix_testsuite ${D}${prefix}/testcases
-
-    # Makefile were configured in the build system
-    find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
-         -e 's@[^ ]*-fdebug-prefix-map=3D[^ "]*@@g' \
-         -e 's@[^ ]*-fmacro-prefix-map=3D[^ "]*@@g' \
-         -e 's@[^ ]*--sysroot=3D[^ "]*@@g'=20
-
-    # The controllers memcg_stree test seems to cause us hangs and takes=
 900s
-    # (maybe we expect more regular output?), anyhow, skip it
-    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
-}
-
-RDEPENDS:${PN} =3D "\
-    attr \
-    bash \
-    bc \
-    coreutils \
-    cpio \
-    cronie \
-    curl \
-    e2fsprogs \
-    e2fsprogs-mke2fs \
-    expect \
-    file \
-    gawk \
-    gdb \
-    gzip \
-    iproute2 \
-    ldd \
-    libaio \
-    logrotate \
-    perl \
-    python3-core \
-    procps \
-    quota \
-    unzip \
-    util-linux \
-    which \
-    tar \
-"
-
-FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_gro=
ups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}=
/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testc=
ases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_te=
stsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/function=
al/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcas=
es/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuit=
e/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/tes=
tcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
-
-# Avoid stripping some generated binaries otherwise some of the ltp test=
s such as ldd01 & nm01 fail
-INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/=
testcases/bin/ldd01"
-INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
-
-# Avoid file dependency scans, as LTP checks for things that may or may =
not
-# exist on the running system.  For instance it has specific checks for
-# csh and ksh which are not typically part of OpenEmbedded systems (but
-# can be added via additional layers.)
-SKIP_FILEDEPS:${PN} =3D '1'
diff --git a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb b/met=
a-arago-extras/recipes-extended/ltp/ltp_20210524.bb
deleted file mode 100644
index 0b84727e..00000000
--- a/meta-arago-extras/recipes-extended/ltp/ltp_20210524.bb
+++ /dev/null
@@ -1,139 +0,0 @@
-SUMMARY =3D "Linux Test Project"
-DESCRIPTION =3D "The Linux Test Project is a joint project with SGI, IBM=
, OSDL, and Bull with a goal to deliver test suites to the open source co=
mmunity that validate the reliability, robustness, and stability of Linux=
. The Linux Test Project is a collection of tools for testing the Linux k=
ernel and related features."
-HOMEPAGE =3D "https://linux-test-project.github.io/"
-SECTION =3D "console/utils"
-LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-=
2.1-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "\
-    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-    file://testcases/kernel/controllers/freezer/COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
-    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=
=3D5;endline=3D17;md5=3D86a61d2c042d59836ffb353a21456498 \
-    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=3De04a2e5=
42b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=3De04a2e542b=
2b8629bf9cd2ba29b0fe41 \
-    file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30=
ec2cf884ae699947 \
-    file://testcases/realtime/COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4=
ca7e \
-    file://utils/benchmark/kernbench-0.42/COPYING;md5=3D94d55d512a9ba36c=
aa9b7df079bae19f \
-"
-
-DEPENDS =3D "attr libaio libcap acl openssl zip-native"
-DEPENDS:append:libc-musl =3D " fts "
-EXTRA_OEMAKE:append:libc-musl =3D " LIBC=3Dmusl "
-EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
-
-# since ltp contains x86-64 assembler which uses the frame-pointer regis=
ter,
-# set -fomit-frame-pointer x86-64 to handle cases where optimisation
-# is set to -O0 or frame pointers have been enabled by -fno-omit-frame-p=
ointer
-# earlier in CFLAGS, etc.
-CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
-
-CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
-CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
-SRCREV =3D "0fb171f2beddaf64bd27597577c206c0f892b3cd"
-
-SRC_URI =3D "git://github.com/linux-test-project/ltp.git;protocol=3Dhttp=
s;branch=3Dmaster \
-           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           "
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig
-
-TARGET_CC_ARCH +=3D "${LDFLAGS}"
-
-export prefix =3D "/opt/${PN}"
-export exec_prefix =3D "/opt/${PN}"
-
-PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl,"
-EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF =3D " --with-realtime-testsuite --with-open-posix-testsuite=
 "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF +=3D " --without-tirpc "
-
-do_install(){
-    install -d ${D}${prefix}/
-    oe_runmake DESTDIR=3D${D} SKIP_IDCHECK=3D1 install include-install
-
-    # fixup not deploy STPfailure_report.pl to avoid confusing about it =
fails to run
-    # as it lacks dependency on some perl moudle such as LWP::Simple
-    # And this script previously works as a tool for analyzing failures =
from LTP
-    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly acc=
esses
-    # http://khack.osdl.org to retrieve ltp test results run on
-    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unac=
cessible
-    rm -rf ${D}${prefix}/bin/STPfailure_report.pl
-
-    # Copy POSIX test suite into ${D}${prefix}/testcases by manual
-    cp -r testcases/open_posix_testsuite ${D}${prefix}/testcases
-
-    # Makefile were configured in the build system
-    find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
-         -e 's@[^ ]*-fdebug-prefix-map=3D[^ "]*@@g' \
-         -e 's@[^ ]*-fmacro-prefix-map=3D[^ "]*@@g' \
-         -e 's@[^ ]*-ffile-prefix-map=3D[^ "]*@@g' \
-         -e 's@[^ ]*--sysroot=3D[^ "]*@@g'
-
-    # The controllers memcg_stree test seems to cause us hangs and takes=
 900s
-    # (maybe we expect more regular output?), anyhow, skip it
-    sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
-}
-
-RDEPENDS:${PN} =3D "\
-    attr \
-    bash \
-    bc \
-    coreutils \
-    cpio \
-    cronie \
-    curl \
-    e2fsprogs \
-    e2fsprogs-mke2fs \
-    expect \
-    file \
-    gawk \
-    gdb \
-    gzip \
-    iproute2 \
-    ldd \
-    libaio \
-    logrotate \
-    net-tools \
-    perl \
-    python3-core \
-    procps \
-    quota \
-    unzip \
-    util-linux \
-    which \
-    tar \
-"
-
-FILES:${PN} +=3D "${prefix}/* ${prefix}/runtest/* ${prefix}/scenario_gro=
ups/* ${prefix}/testcases/bin/* ${prefix}/testcases/bin/*/bin/* ${prefix}=
/testscripts/* ${prefix}/testcases/open_posix_testsuite/* ${prefix}/testc=
ases/open_posix_testsuite/conformance/* ${prefix}/testcases/open_posix_te=
stsuite/Documentation/* ${prefix}/testcases/open_posix_testsuite/function=
al/* ${prefix}/testcases/open_posix_testsuite/include/* ${prefix}/testcas=
es/open_posix_testsuite/scripts/* ${prefix}/testcases/open_posix_testsuit=
e/stress/* ${prefix}/testcases/open_posix_testsuite/tools/* ${prefix}/tes=
tcases/data/nm01/lib.a ${prefix}/lib/libmem.a"
-
-# Avoid stripping some generated binaries otherwise some of the ltp test=
s such as ldd01 & nm01 fail
-INHIBIT_PACKAGE_STRIP_FILES =3D "${prefix}/testcases/bin/nm01 ${prefix}/=
testcases/bin/ldd01"
-INSANE_SKIP:${PN} +=3D "already-stripped staticdev"
-
-remove_broken_musl_sources() {
-	[ "${TCLIBC}" =3D "musl" ] || return 0
-
-	cd ${S}
-	echo "WARNING: remove unsupported tests (until they're fixed)"
-
-	# sync with upstream
-	# https://github.com/linux-test-project/ltp/blob/master/travis/alpine.s=
h#L33
-	rm -rfv \
-		testcases/kernel/sched/process_stress/process.c \
-		testcases/kernel/syscalls/confstr/confstr01.c \
-		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
-		testcases/kernel/syscalls/getcontext/getcontext01.c \
-		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
-		testcases/kernel/syscalls/timer_create/timer_create01.c \
-		testcases/kernel/syscalls/timer_create/timer_create03.c \
-		utils/benchmark/ebizzy-0.3
-}
-do_patch[postfuncs] +=3D "remove_broken_musl_sources"
-
-# Avoid file dependency scans, as LTP checks for things that may or may =
not
-# exist on the running system.  For instance it has specific checks for
-# csh and ksh which are not typically part of OpenEmbedded systems (but
-# can be added via additional layers.)
-SKIP_FILEDEPS:${PN} =3D '1'
-
--=20
2.25.1


