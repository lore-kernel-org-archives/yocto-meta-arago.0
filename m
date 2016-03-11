Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 2CBBE529C7
	for <meta-arago@arago-project.org>;
	Fri, 11 Mar 2016 19:19:32 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3W000VK2ZZAVA0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 11 Mar 2016 13:19:12 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=lH_c-ZoV6C5kqe6wiJUA:9
Received: by 100.15.86.14 with SMTP id 40e04d96; Fri, 11 Mar 2016 19:19:12 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 47C0E161F21;	Fri,
	11 Mar 2016 14:19:11 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 11 Mar 2016 14:19:10 -0500
Message-id: <1457723950-5452-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: update to the latest, drop upstreamed patch
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
X-List-Received-Date: Fri, 11 Mar 2016 19:19:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...dt-filter-out-test-cases-for-HS-platforms.patch | 44 ----------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |  5 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-filter-out-test-cases-for-HS-platforms.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-filter-out-test-cases-for-HS-platforms.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-filter-out-test-cases-for-HS-platforms.patch
deleted file mode 100644
index f459de1..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-filter-out-test-cases-for-HS-platforms.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 68458ee412f0e8ea465705b157f978d76f4772a4 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 25 Feb 2016 13:51:17 -0500
-Subject: [PATCH] testcases/ddt: filter out test cases for HS platforms
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- testcases/ddt/Makefile | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/testcases/ddt/Makefile b/testcases/ddt/Makefile
-index d3e95e7..a08136e 100644
---- a/testcases/ddt/Makefile
-+++ b/testcases/ddt/Makefile
-@@ -38,6 +38,10 @@ ifeq ($(PLATFORM),dra72x-evm)
- FILTER_OUT_DIRS                 += mc_test_suite
- endif
- 
-+ifeq ($(PLATFORM),dra7xx-hs-evm)
-+FILTER_OUT_DIRS                 += mc_test_suite
-+endif
-+
- ifeq ($(PLATFORM),am57xx-evm)
- FILTER_OUT_DIRS                 += mc_test_suite
- endif
-@@ -140,6 +144,15 @@ FILTER_OUT_DIRS                 += edma_test_suite
- FILTER_OUT_DIRS                 += ipc_test_suite
- endif
- 
-+ifeq ($(PLATFORM),am437x-hs-evm)
-+FILTER_OUT_DIRS                 += v4l2_capture_test_suite
-+FILTER_OUT_DIRS                 += v4l2_display_test_suite
-+FILTER_OUT_DIRS                 += mc_test_suite
-+FILTER_OUT_DIRS                 += v4l2_display_davinci_test_suite
-+FILTER_OUT_DIRS                 += edma_test_suite
-+FILTER_OUT_DIRS                 += ipc_test_suite
-+endif
-+
- ifeq ($(PLATFORM),am437x-sk)
- FILTER_OUT_DIRS                 += v4l2_capture_test_suite
- FILTER_OUT_DIRS                 += v4l2_display_test_suite
--- 
-2.2.0
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 1d6c1ba..1d01ca1 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r10"
+PR = "r11"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -16,12 +16,11 @@ inherit autotools-brokensep module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "4a2129a1fefdd065dcaedb415ffa1da46ef9ceb6"
+SRCREV = "7e8dfc07a3f4f8b7d6d8fc381be1db7affad67ef"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
     file://ltp-Do-not-link-against-libfl.patch \
-    file://0001-testcases-ddt-filter-out-test-cases-for-HS-platforms.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.2.0


