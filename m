Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E3C28529F1
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2019 02:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 11A8340BF3;
	Thu, 10 Oct 2019 02:33:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qfOzR9yicWLY; Thu, 10 Oct 2019 02:33:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EBB3D40BF9;
	Thu, 10 Oct 2019 02:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 677A117428E;
	Wed,  9 Oct 2019 22:33:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  9 Oct 2019 22:33:11 -0400
Message-Id: <1570674791-29126-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570674791-29126-1-git-send-email-denys@ti.com>
References: <1570674791-29126-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/3] ltp-ddt: update upstream patches
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
X-List-Received-Date: Thu, 10 Oct 2019 02:34:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...figure-time-check-for-getdents-getdents64-API.patch | 15 ++++++++++-----
 ...1-Rename-getcpu-to-avoid-conflict-with-glibc-.patch |  8 +++-----
 ...0002-check-for-RES_USE_INET6-during-configure.patch | 18 ++++++++----------
 .../0003-Add-knob-to-control-tirpc-support.patch       | 14 ++++++--------
 4 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
index adfe16c..460c8e5 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
@@ -1,7 +1,7 @@
-From 404dfeb4faef213b0450f173b60cd7080edec349 Mon Sep 17 00:00:00 2001
+From 830872e2b50011b9a18b6cd2546550c8bf223e82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Jul 2019 10:32:29 -0700
-Subject: [PATCH 1/2] Add configure time check for getdents/getdents64 APIs
+Subject: [PATCH] Add configure time check for getdents/getdents64 APIs
 
 glibc 2.30 has added wrapper for getdents64 this will help in detecting
 right condition to use fallback
@@ -10,11 +10,14 @@ Check for getdents API as well while here
 
 Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012954.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- configure.ac                                  | 2 ++
- testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
+ configure.ac                                  |  2 ++
+ testcases/kernel/syscalls/getdents/getdents.h | 12 ++++++++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index 5c8d4ea..63912a4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -55,6 +55,8 @@ AC_CHECK_HEADERS([ \
@@ -26,6 +29,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ])
  
  # Tools knobs
+diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
+index 702b0bd..c24ed6c 100644
 --- a/testcases/kernel/syscalls/getdents/getdents.h
 +++ b/testcases/kernel/syscalls/getdents/getdents.h
 @@ -23,7 +23,7 @@
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
index d0c8477..5dc369f 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
@@ -1,4 +1,4 @@
-From c9edb0eaaca83c18ac7b5ea3330faad8d47d3fd1 Mon Sep 17 00:00:00 2001
+From 574b03aa9e4648a3c62c94e815f7962d7ef8088e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Dec 2018 06:44:02 -0800
 Subject: [PATCH] getcpu01: Rename getcpu to avoid conflict with glibc >= 2.29
@@ -12,12 +12,13 @@ Renaming helps to keep ltp build going
 Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-December/010321.html]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  testcases/kernel/syscalls/getcpu/getcpu01.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
-index c927512ca..e850fe844 100644
+index c927512..e850fe8 100644
 --- a/testcases/kernel/syscalls/getcpu/getcpu01.c
 +++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
 @@ -82,7 +82,7 @@ int sys_support = 0;
@@ -52,6 +53,3 @@ index c927512ca..e850fe844 100644
  {
  #if defined(__i386__)
  	return syscall(318, cpu_id, node_id, cache_struct);
--- 
-2.20.0
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
index 12e47eb..1fa8055 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0002-check-for-RES_USE_INET6-during-configure.patch
@@ -1,24 +1,25 @@
-From 7bc134545b7beb09717a60541530c20a1a5740d3 Mon Sep 17 00:00:00 2001
+From 9349acba7f68d05995a3e20ae3959ab9a5751b57 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Jul 2019 10:55:28 -0700
-Subject: [PATCH 2/2] check for RES_USE_INET6 during configure
+Subject: [PATCH] check for RES_USE_INET6 during configure
 
 glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
 since 2.26 release, this check ensures that we detect it before using it
 
 Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012955.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac                                        | 13 +++++++++++++
  testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
  2 files changed, 19 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 2255b5c181..ed7acccb01 100644
+index 63912a4..236d18d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \
-     vmsplice \
+@@ -59,6 +59,19 @@ AC_CHECK_FUNCS([ \
+     getdents64 \
  ])
  
 +#check defines
@@ -38,7 +39,7 @@ index 2255b5c181..ed7acccb01 100644
  
  # Expect
 diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
-index 9cc15d086b..d1cae5441a 100644
+index a5c5d01..106693d 100644
 --- a/testcases/network/multicast/mc_gethost/mc_gethost.c
 +++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
 @@ -17,6 +17,8 @@
@@ -50,7 +51,7 @@ index 9cc15d086b..d1cae5441a 100644
  #ifndef LOG_PERROR
  #define LOG_PERROR 0
  #endif
-@@ -50,8 +52,12 @@ usage:
+@@ -52,8 +54,12 @@ usage:
  		argv++, argc--;
  	}
  	if (argc >= 1 && !strcmp(*argv, "-6")) {
@@ -63,6 +64,3 @@ index 9cc15d086b..d1cae5441a 100644
  		argv++, argc--;
  	}
  	if (argc >= 1 && !strcmp(*argv, "-f")) {
--- 
-2.22.0
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
index bf1176f..5898389 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0003-Add-knob-to-control-tirpc-support.patch
@@ -1,22 +1,23 @@
-From b193011da301b3d944e8fddcf4817513c31c5b88 Mon Sep 17 00:00:00 2001
+From 87e3825943b2e52f48c49916018bbbc7d4c2f745 Mon Sep 17 00:00:00 2001
 From: Fathi Boudra <fathi.boudra@linaro.org>
 Date: Thu, 7 Jan 2016 17:36:19 +0000
-Subject: [PATCH 03/32] Add knob to control tirpc support
+Subject: [PATCH] Add knob to control tirpc support
 
 allow to disable tirpc. Helps to disable it at top level for eg. musl it
 does not yet work.
 
 Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac | 9 +++++++++
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index cc50397..9e2936b 100644
+index 236d18d..b10197d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -98,6 +98,13 @@ if test "x$with_python" = xyes; then
+@@ -123,6 +123,13 @@ if test "x$with_python" = xyes; then
  else
      AC_SUBST([WITH_PYTHON],["no"])
  fi
@@ -30,7 +31,7 @@ index cc50397..9e2936b 100644
  # END tools knobs
  
  # Testsuites knobs
-@@ -169,7 +176,9 @@ LTP_CHECK_RENAMEAT2
+@@ -197,7 +204,9 @@ LTP_CHECK_RENAMEAT2
  LTP_CHECK_FALLOCATE
  LTP_CHECK_SYSCALL_FCNTL
  LTP_CHECK_SYSCALL_PERF_EVENT_OPEN
@@ -40,6 +41,3 @@ index cc50397..9e2936b 100644
  LTP_CHECK_TEE
  LTP_CHECK_SPLICE
  LTP_CHECK_VMSPLICE
--- 
-2.7.0
-
-- 
2.7.4


