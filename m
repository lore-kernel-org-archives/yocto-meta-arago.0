Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5D7F0529BD
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 22:35:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24MZINV020242
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 16:35:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24MZH5G021766
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 16:35:17 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 16:35:17 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t24MZGYR027033;	Wed, 4 Mar 2015 16:35:16 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t24MZE8W030188;	Thu, 5 Mar 2015 04:05:15 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2015 16:35:12 -0600
Message-ID: <1425508512-21867-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] lmbench: Add SDK Makefile customizations
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
X-List-Received-Date: Wed, 04 Mar 2015 22:35:19 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Tweak the makefile and how the sources are built to insure that the standard
  approached used for TI benchmarking is taken.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-Makefile-Add-TI-SDK-Modifications.patch   |   75 ++++++++++++++++++++
 .../lmbench/lmbench_3.0-a9.bbappend                |   14 ++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
 create mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch b/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
new file mode 100644
index 0000000..39bcaf8
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
@@ -0,0 +1,75 @@
+From 3ed56a3eebce30e1387435eca15c7c82e8f1ed02 Mon Sep 17 00:00:00 2001
+From: "Franklin S. Cooper Jr" <fcooper@ti.com>
+Date: Wed, 4 Mar 2015 15:49:34 -0600
+Subject: [PATCH] Makefile: Add TI SDK Modifications
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ src/Makefile |   24 +++++++++++++++---------
+ 1 file changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index c7e4e3c..0133db8 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -34,11 +34,17 @@
+ # I finally know why Larry Wall's Makefile says "Grrrr".
+ SHELL=/bin/sh
+ 
+-CC=`../scripts/compiler`
++CC?=`../scripts/compiler`
+ MAKE=`../scripts/make`
+-AR=ar
++AR?=ar
+ ARCREATE=cr
+-RANLIB=ranlib
++RANLIB?=ranlib
++
++OPTIMIZATIONS = -O3 -ffast-math -ftree-vectorize -funsafe-math-optimizations -fprefetch-loop-arrays
++
++CFLAGS ?=
++CFLAGS += $(OPTIMIZATIONS)
++
+ 
+ # base of installation location
+ BASE=/usr/local
+@@ -112,8 +118,8 @@ LIBOBJS= $O/lib_tcp.o $O/lib_udp.o $O/lib_unix.o $O/lib_timing.o 	\
+ 	$O/lib_sched.o
+ 
+ lmbench: $(UTILS)
+-	@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
+-	-@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
++	@env CFLAGS="$(CFLAGS)" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
++	-@env CFLAGS="$(CFLAGS)" MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
+ 
+ results: lmbench
+ 	@env OS="${OS}" ../scripts/config-run
+@@ -137,7 +143,7 @@ os: lmbench
+ 	@env OS="${OS}" BENCHMARK_HARDWARE=NO  BENCHMARK_OS=YES ../scripts/results
+ 
+ install: lmbench
+-	@env CFLAGS=-O MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
++	@env MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
+ 
+ install-target:
+ 	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
+@@ -158,13 +164,13 @@ $(ASMS):
+ 	$(CC) -S $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ `basename $@ .s`.c
+ 
+ Wall:
+-	@env CFLAGS="-g -O -Wall" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
++	@env CFLAGS+=-Wall  MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
+ 
+ debug:
+-	@env CFLAGS="-g -O -DDEBUG" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
++	@env CFLAGS+=-DDEBUG MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
+ 
+ assembler:
+-	@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
++	@env MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
+ 
+ 
+ tag:
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
new file mode 100644
index 0000000..3fa38f6
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_3.0-a9.bbappend
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
+
+SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
+
+EXTRA_OEMAKE = ""
+
+do_compile () {
+    unset CFLAGS
+    unset LDFLAGS
+    unset CPPFLAGS
+    oe_runmake -C src
+}
-- 
1.7.9.5


