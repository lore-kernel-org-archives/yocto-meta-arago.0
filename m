Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id DD6E652A67
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 20:40:30 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSV007DEW32IE40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Aug 2015 15:40:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=9csD-MWywxPdj1PYAZwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8A5DC161B6F;	Mon,
	10 Aug 2015 16:40:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Aug 2015 16:40:11 -0400
Message-id: <1439239212-31651-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH 1/2] ltp-ddt: disable IPC tests until 4.1 is ready
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
X-List-Received-Date: Mon, 10 Aug 2015 20:40:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch   | 29 ++++++++++++++++++++++
 .../ltp-ddt/ltp-ddt_1.0.0.bbappend                 |  3 +++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch
 create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch
new file mode 100644
index 0000000..e996c58
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-Disable-IPC-Tests.patch
@@ -0,0 +1,29 @@
+From 88bde7669f9bd2e76295567e4ea93045979f1040 Mon Sep 17 00:00:00 2001
+From: Carlos Hernandez <ceh@ti.com>
+Date: Tue, 4 Aug 2015 16:34:40 -0400
+Subject: [PATCH] Disable IPC Tests
+
+Disable IPC tests until IPC support is added to kernel 4.1
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ testcases/ddt/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/testcases/ddt/Makefile b/testcases/ddt/Makefile
+index 0ca6218..b6d6503 100644
+--- a/testcases/ddt/Makefile
++++ b/testcases/ddt/Makefile
+@@ -30,6 +30,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
+ # Disabling EDMA tests until 3.8+ compatible tests are available
+ FILTER_OUT_DIRS                 += edma_test_suite
+ 
++# Disabling IPC tests until 4.1 kernel support is added
++FILTER_OUT_DIRS                 += ipc_test_suite
++
+ ifeq ($(PLATFORM),dra7xx-evm)
+ FILTER_OUT_DIRS                 += mc_test_suite
+ endif
+-- 
+2.4.4
+
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend
new file mode 100644
index 0000000..573f535
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " file://0001-Disable-IPC-Tests.patch"
-- 
2.2.0


