Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 197D352A40
	for <meta-arago@arago-project.org>;
	Tue,  5 Dec 2017 01:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84B4F20867;
	Tue,  5 Dec 2017 01:20:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vl8HSezEUQoN; Tue,  5 Dec 2017 01:20:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 639C0207BA;
	Tue,  5 Dec 2017 01:20:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D0B1D162753;
	Mon,  4 Dec 2017 20:20:01 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  4 Dec 2017 20:20:01 -0500
Message-Id: <1512436801-26330-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ltp-ddt: drop 0001-dirtyc0w-Include-stdint.h.patch already present upstream
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
X-List-Received-Date: Tue, 05 Dec 2017 01:20:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch   | 34 ----------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb   |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch
deleted file mode 100644
index 5c73be4..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1b30d8dac1a37dc0abbb3b545db2824d6489e23f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 9 Jun 2017 09:32:13 -0700
-Subject: [PATCH] dirtyc0w: Include stdint.h
-
-uintptr_t is defined in stdint.h
-
-Fixes
-| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
-|    lseek(mfd, (uintptr_t) map, SEEK_SET);
-|                ^~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- testcases/kernel/security/dirtyc0w/dirtyc0w_child.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
-index 5328a9bc4..49abdd6ba 100644
---- a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
-+++ b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
-@@ -23,6 +23,7 @@
- #include <sys/stat.h>
- #include <string.h>
- #include <stdlib.h>
-+#include <stdint.h>
- #include <pwd.h>
- 
- #include "tst_safe_pthread.h"
--- 
-2.13.1
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index af56d03..f836a04 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r3"
+PR = "r4"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -42,7 +42,6 @@ BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
     file://0003-Add-knob-to-control-tirpc-support.patch \
-    file://0001-dirtyc0w-Include-stdint.h.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


