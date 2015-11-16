Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 3AD595299A
	for <meta-arago@arago-project.org>;
	Mon, 16 Nov 2015 14:26:53 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXW00CQLW48PR50@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Nov 2015 08:26:32 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=HihYlcsHAAAA:8	a=iXVVjzekYKSsZXh_z0EA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 18BFF161D1A;	Mon,
	16 Nov 2015 09:26:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Nov 2015 09:26:31 -0500
Message-id: <1447683991-21693-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: patch is upstream, drop locally
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
X-List-Received-Date: Mon, 16 Nov 2015 14:26:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ddt-Makefile-filter-out-testcases-for-k2g.patch | 35 ----------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-Makefile-filter-out-testcases-for-k2g.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-Makefile-filter-out-testcases-for-k2g.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-Makefile-filter-out-testcases-for-k2g.patch
deleted file mode 100644
index 241d39b..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-Makefile-filter-out-testcases-for-k2g.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d11ed6ff267c24c6adfa7acf5e2cda63f4df5edf Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Fri, 13 Nov 2015 19:02:10 -0500
-Subject: [PATCH] testcases/ddt/Makefile: filter out testcases for k2g
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- testcases/ddt/Makefile | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/testcases/ddt/Makefile b/testcases/ddt/Makefile
-index beed4f2..d3e95e7 100644
---- a/testcases/ddt/Makefile
-+++ b/testcases/ddt/Makefile
-@@ -339,6 +339,17 @@ FILTER_OUT_DIRS                 += ipc_test_suite
- FILTER_OUT_DIRS                 += gpio_test_suite
- endif
- 
-+ifeq ($(PLATFORM),k2g-evm)
-+FILTER_OUT_DIRS                 += edma_test_suite
-+FILTER_OUT_DIRS                 += fbdev_display_test_suite
-+FILTER_OUT_DIRS                 += mc_test_suite
-+FILTER_OUT_DIRS                 += v4l2_capture_test_suite
-+FILTER_OUT_DIRS                 += v4l2_display_test_suite
-+FILTER_OUT_DIRS                 += v4l2_display_davinci_test_suite
-+FILTER_OUT_DIRS                 += ipc_test_suite
-+FILTER_OUT_DIRS                 += gpio_test_suite
-+endif
-+
- ifeq ($(PLATFORM),dragonboard410c)
- FILTER_OUT_DIRS                 += v4l2_capture_test_suite
- FILTER_OUT_DIRS                 += v4l2_display_test_suite
--- 
-2.2.0
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index e9bbc21..2bf9de4 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r7"
+PR = "r8"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -16,12 +16,11 @@ inherit autotools-brokensep module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "9bfb8a0805cbe7b8f534b61c6ea503c092858d66"
+SRCREV = "23dd00e6f29ff5777dd1b851fd41103ebccecacd"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
     file://ltp-Do-not-link-against-libfl.patch \
-    file://0001-testcases-ddt-Makefile-filter-out-testcases-for-k2g.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.2.0


