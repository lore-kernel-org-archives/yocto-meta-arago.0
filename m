Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 4982E52A98
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:54 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y003VW6BYNYA0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Sv4y0yS6AAAA:8 a=VwQbUJbxAAAA:8
	a=GqZI9gvVAAAA:8 a=Idv6Z6YtAAAA:8	a=1hj8veolAAAA:8
	a=hp0hd-wVeFjFnI7BwCsA:9
Received: by 100.15.86.14 with SMTP id 678a2e41; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CF893161FBF;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:21 -0400
Message-id: <1461180805-25733-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 12/16] ethtool: oe-core has the latest, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch     | 19 --------
 .../ethtool/ethtool/ethtool-uint.patch             | 50 ----------------------
 .../recipes-extended/ethtool/ethtool/run-ptest     |  2 -
 .../recipes-extended/ethtool/ethtool_3.16.bb       | 31 --------------
 4 files changed, 102 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool/ethtool-uint.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool/run-ptest
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool_3.16.bb

diff --git a/meta-arago-extras/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta-arago-extras/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
deleted file mode 100644
index bf66267..0000000
--- a/meta-arago-extras/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-ptest needs buildtest-TESTS and runtest-TESTS targets.
-serial-tests is required to generate those targets.
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Inappropriate
-(default automake behavior incompatible with ptest)
-
-diff -ruN a/configure.ac b/configure.ac
---- a/configure.ac	2014-05-28 18:19:13.513980977 +0200
-+++ b/configure.ac	2014-05-28 18:19:21.129660215 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(ethtool, 3.14, netdev@vger.kernel.org)
- AC_PREREQ(2.52)
- AC_CONFIG_SRCDIR([ethtool.c])
--AM_INIT_AUTOMAKE([gnu])
-+AM_INIT_AUTOMAKE([gnu serial-tests])
- AC_CONFIG_HEADERS([ethtool-config.h])
- 
- AM_MAINTAINER_MODE
diff --git a/meta-arago-extras/recipes-extended/ethtool/ethtool/ethtool-uint.patch b/meta-arago-extras/recipes-extended/ethtool/ethtool/ethtool-uint.patch
deleted file mode 100644
index bb96a18..0000000
--- a/meta-arago-extras/recipes-extended/ethtool/ethtool/ethtool-uint.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Fix build with musl by using correct uint type names.
-
-This patch is taken from Sabotage Linux, the license statement for patches and
-build scripts in Sabotage Linux says:
-
-    To the extent possible under law, Christian Neukirchen has waived
-    all copyright and related or neighboring rights to this work.
-
-    http://creativecommons.org/publicdomain/zero/1.0/
-
-Therefore this should be good to include in OpenEmbedded.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-
-Upstream-status: Pending
-
-diff -u ethtool-3.14.org/internal.h ethtool-3.14/internal.h
---- ethtool-3.14.org/internal.h
-+++ ethtool-3.14/internal.h
-@@ -7,6 +7,7 @@
- #include "ethtool-config.h"
- #endif
- #include <stdio.h>
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <sys/types.h>
-@@ -17,16 +18,16 @@
- 
- /* ethtool.h expects these to be defined by <linux/types.h> */
- #ifndef HAVE_BE_TYPES
--typedef __uint16_t __be16;
--typedef __uint32_t __be32;
-+typedef uint16_t __be16;
-+typedef uint32_t __be32;
- typedef unsigned long long __be64;
- #endif
- 
- typedef unsigned long long u64;
--typedef __uint32_t u32;
--typedef __uint16_t u16;
--typedef __uint8_t u8;
--typedef __int32_t s32;
-+typedef uint32_t u32;
-+typedef uint16_t u16;
-+typedef uint8_t u8;
-+typedef int32_t s32;
- 
- #include "ethtool-copy.h"
- #include "net_tstamp-copy.h"
diff --git a/meta-arago-extras/recipes-extended/ethtool/ethtool/run-ptest b/meta-arago-extras/recipes-extended/ethtool/ethtool/run-ptest
deleted file mode 100644
index 1e245da..0000000
--- a/meta-arago-extras/recipes-extended/ethtool/ethtool/run-ptest
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-make -k runtest-TESTS
diff --git a/meta-arago-extras/recipes-extended/ethtool/ethtool_3.16.bb b/meta-arago-extras/recipes-extended/ethtool/ethtool_3.16.bb
deleted file mode 100644
index 92a0704..0000000
--- a/meta-arago-extras/recipes-extended/ethtool/ethtool_3.16.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Display or change ethernet card settings"
-DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
-HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
-SECTION = "console/network"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
-
-SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
-           file://run-ptest \
-           file://avoid_parallel_tests.patch \
-           file://ethtool-uint.patch \
-           "
-
-SRC_URI[md5sum] = "3806bae34c153e2b9e2859e85c54788d"
-SRC_URI[sha256sum] = "a6f1433824af7b390ed4e66dfc7cee047d6d1f56dbb8ceef9fe905d63aef5275"
-
-inherit autotools ptest
-RDEPENDS_${PN}-ptest += "make"
-
-do_compile_ptest() {
-   oe_runmake buildtest-TESTS
-}
-
-do_install_ptest () {
-   cp ${B}/Makefile                 ${D}${PTEST_PATH}
-   install ${B}/test-cmdline        ${D}${PTEST_PATH}
-   install ${B}/test-features       ${D}${PTEST_PATH}
-   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
-   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
-}
-- 
2.2.0


