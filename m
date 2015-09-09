Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 3B8B352A6D
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 22:53:28 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF00FE2M87PP00@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Sep 2015 17:53:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=ATVkf72kbg0XUU_5-VwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C55E2161BCB;	Wed,
	9 Sep 2015 18:52:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Sep 2015 18:52:55 -0400
Message-id: <1441839175-9770-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: remove temporary patch to disable IPC tests
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
X-List-Received-Date: Wed, 09 Sep 2015 22:53:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch   | 29 ----------------------
 .../ltp-ddt/ltp-ddt_1.0.0.bbappend                 |  3 ---
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch
deleted file mode 100644
index e996c58..0000000
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 88bde7669f9bd2e76295567e4ea93045979f1040 Mon Sep 17 00:00:00 2001
-From: Carlos Hernandez <ceh@ti.com>
-Date: Tue, 4 Aug 2015 16:34:40 -0400
-Subject: [PATCH] Disable IPC Tests
-
-Disable IPC tests until IPC support is added to kernel 4.1
-
-Signed-off-by: Carlos Hernandez <ceh@ti.com>
----
- testcases/ddt/Makefile | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/testcases/ddt/Makefile b/testcases/ddt/Makefile
-index 0ca6218..b6d6503 100644
---- a/testcases/ddt/Makefile
-+++ b/testcases/ddt/Makefile
-@@ -30,6 +30,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
- # Disabling EDMA tests until 3.8+ compatible tests are available
- FILTER_OUT_DIRS                 += edma_test_suite
- 
-+# Disabling IPC tests until 4.1 kernel support is added
-+FILTER_OUT_DIRS                 += ipc_test_suite
-+
- ifeq ($(PLATFORM),dra7xx-evm)
- FILTER_OUT_DIRS                 += mc_test_suite
- endif
--- 
-2.4.4
-
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend
deleted file mode 100644
index 573f535..0000000
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " file://0001-Disable-IPC-Tests.patch"
-- 
2.2.0


