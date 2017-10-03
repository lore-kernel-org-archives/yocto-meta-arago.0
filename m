Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id AE8D1529C7
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 20:28:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93KSYVn019264
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 15:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507062514;
	bh=wvxVwwVItd2jvBztm1eObOHsONg6TZT5aGcT4Po/zEM=;
	h=From:To:CC:Subject:Date;
	b=iqZajzG46DaZNJlgrrAHdcvdUEUufXtHmhBBA5WBtJ1r8eP/y0luYKlz+McGLD2Nk
	IA+oDWU1muPIelLqpquc8U5HTWO6mleRyhjLe1+Uf3be9VhGO2CCh+Fz0jHVGB8OLy
	6sZwV7OvggQCcDgoz5KgGLtgseMUJ2G8D15mc3A0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93KSYbM001230
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 15:28:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 15:28:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 15:28:34 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93KSXCf028894;
	Tue, 3 Oct 2017 15:28:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 16:28:30 -0400
Message-ID: <1507062510-21697-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] lmbench: massage local patch to apply on top of recent musl fixes
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
X-List-Received-Date: Tue, 03 Oct 2017 20:28:35 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Makefile-Add-TI-SDK-Modifications.patch   | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch b/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
index 39bcaf8..c8486e7 100644
--- a/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
+++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench/0001-Makefile-Add-TI-SDK-Modifications.patch
@@ -1,15 +1,15 @@
-From 3ed56a3eebce30e1387435eca15c7c82e8f1ed02 Mon Sep 17 00:00:00 2001
-From: "Franklin S. Cooper Jr" <fcooper@ti.com>
-Date: Wed, 4 Mar 2015 15:49:34 -0600
+From b698c2e18982eb0125c3b4cb3d0eb403e5a6140e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 3 Oct 2017 16:22:39 -0400
 Subject: [PATCH] Makefile: Add TI SDK Modifications
 
-Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- src/Makefile |   24 +++++++++++++++---------
+ src/Makefile | 24 +++++++++++++++---------
  1 file changed, 15 insertions(+), 9 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index c7e4e3c..0133db8 100644
+index 96467d7..09cdcfe 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -34,11 +34,17 @@
@@ -37,8 +37,8 @@ index c7e4e3c..0133db8 100644
  	$O/lib_sched.o
  
  lmbench: $(UTILS)
--	@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
--	-@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
+-	@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
+-	-@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
 +	@env CFLAGS="$(CFLAGS)" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
 +	-@env CFLAGS="$(CFLAGS)" MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
  
@@ -48,28 +48,28 @@ index c7e4e3c..0133db8 100644
  	@env OS="${OS}" BENCHMARK_HARDWARE=NO  BENCHMARK_OS=YES ../scripts/results
  
  install: lmbench
--	@env CFLAGS=-O MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
+-	@env CFLAGS+=-O MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
 +	@env MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
  
  install-target:
  	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
 @@ -158,13 +164,13 @@ $(ASMS):
- 	$(CC) -S $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ `basename $@ .s`.c
+ 	$(CC) -S $(CFLAGS) $(CPPFLAGS) -o $@ `basename $@ .s`.c $(LDFLAGS)
  
  Wall:
--	@env CFLAGS="-g -O -Wall" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
+-	@env CFLAGS+="-g -O -Wall" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
 +	@env CFLAGS+=-Wall  MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
  
  debug:
--	@env CFLAGS="-g -O -DDEBUG" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
+-	@env CFLAGS+="-g -O -DDEBUG" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
 +	@env CFLAGS+=-DDEBUG MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
  
  assembler:
--	@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
+-	@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
 +	@env MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
  
  
  tag:
 -- 
-1.7.9.5
+2.7.4
 
-- 
2.7.4


