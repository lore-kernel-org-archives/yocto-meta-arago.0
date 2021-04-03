Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5F45F52A27
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E511540C56;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lR2I24OXncDE; Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE31240C93;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BAB40174585;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:28 -0400
Message-Id: <1617408644-2675-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 13/29] lmbench: remove very old SDK optimization that no longer apply
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:53 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-Makefile-Add-TI-SDK-Modifications.patch   | 75 ----------------------
 .../recipes-benchmark/lmbench/lmbench_%.bbappend   | 23 -------
 2 files changed, 98 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
 delete mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch b/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
deleted file mode 100644
index c8486e7..0000000
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From b698c2e18982eb0125c3b4cb3d0eb403e5a6140e Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 3 Oct 2017 16:22:39 -0400
-Subject: [PATCH] Makefile: Add TI SDK Modifications
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- src/Makefile | 24 +++++++++++++++---------
- 1 file changed, 15 insertions(+), 9 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 96467d7..09cdcfe 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -34,11 +34,17 @@
- # I finally know why Larry Wall's Makefile says "Grrrr".
- SHELL=/bin/sh
- 
--CC=`../scripts/compiler`
-+CC?=`../scripts/compiler`
- MAKE=`../scripts/make`
--AR=ar
-+AR?=ar
- ARCREATE=cr
--RANLIB=ranlib
-+RANLIB?=ranlib
-+
-+OPTIMIZATIONS = -O3 -ffast-math -ftree-vectorize -funsafe-math-optimizations -fprefetch-loop-arrays
-+
-+CFLAGS ?=
-+CFLAGS += $(OPTIMIZATIONS)
-+
- 
- # base of installation location
- BASE=/usr/local
-@@ -112,8 +118,8 @@ LIBOBJS= $O/lib_tcp.o $O/lib_udp.o $O/lib_unix.o $O/lib_timing.o 	\
- 	$O/lib_sched.o
- 
- lmbench: $(UTILS)
--	@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
--	-@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
-+	@env CFLAGS="$(CFLAGS)" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
-+	-@env CFLAGS="$(CFLAGS)" MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
- 
- results: lmbench
- 	@env OS="${OS}" ../scripts/config-run
-@@ -137,7 +143,7 @@ os: lmbench
- 	@env OS="${OS}" BENCHMARK_HARDWARE=NO  BENCHMARK_OS=YES ../scripts/results
- 
- install: lmbench
--	@env CFLAGS+=-O MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
-+	@env MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
- 
- install-target:
- 	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
-@@ -158,13 +164,13 @@ $(ASMS):
- 	$(CC) -S $(CFLAGS) $(CPPFLAGS) -o $@ `basename $@ .s`.c $(LDFLAGS)
- 
- Wall:
--	@env CFLAGS+="-g -O -Wall" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
-+	@env CFLAGS+=-Wall  MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
- 
- debug:
--	@env CFLAGS+="-g -O -DDEBUG" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
-+	@env CFLAGS+=-DDEBUG MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
- 
- assembler:
--	@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
-+	@env MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
- 
- 
- tag:
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
deleted file mode 100644
index 64000b8..0000000
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-DEPENDS += "libtirpc"
-
-INSANE_SKIP_${PN} += "ldflags"
-
-PR_append = ".arago3"
-
-SRC_URI += "file://0001-Makefile-Add-TI-SDK-Modifications.patch"
-
-EXTRA_OEMAKE = ""
-CFLAGS = "-I${STAGING_INCDIR}/tirpc"
-LDFLAGS = "-ltirpc"
-
-do_compile () {
-    oe_runmake -C src
-}
-
-do_install_append() {
-    rm -rf ${D}${datadir}
-}
-
-RDEPENDS_${PN}_remove = "perl"
-- 
2.7.4


