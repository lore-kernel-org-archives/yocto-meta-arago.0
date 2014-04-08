Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id CF98652972
	for <meta-arago@arago-project.org>;
	Tue,  8 Apr 2014 14:50:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3P009TQVW5BR30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 08 Apr 2014 09:50:29 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E6C7B20265; Tue,
	08 Apr 2014 10:50:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 08 Apr 2014 10:50:27 -0400
Message-id: <1396968627-12151-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cryptdev-tests: fix LDFLAGS vs. LDLIBS usage
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
X-List-Received-Date: Tue, 08 Apr 2014 14:50:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

This patch has already been submitted to oe-core.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../cryptodev/cryptodev-tests_1.6.bb               |  7 ++++--
 ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch | 29 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch

diff --git a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
index 618e6e5..9688c87 100644
--- a/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
+++ b/meta-arago-extras/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
@@ -3,10 +3,13 @@ require cryptodev_${PV}.inc
 SUMMARY = "Linux Cryptodev Test Suite"
 DESCRIPTION = "The Cryptodev package contains the test apps"
 
-PR = "r0"
+PR = "r1"
 DEPENDS += "openssl"
 
-SRC_URI += "file://Add-the-compile-and-install-rules-for-cryptodev-test.patch"
+SRC_URI += " \
+file://Add-the-compile-and-install-rules-for-cryptodev-test.patch \
+file://0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch \
+"
 
 do_compile() {
 	oe_runmake testprogs
diff --git a/meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch b/meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
new file mode 100644
index 0000000..f5ab8b4
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/cryptodev/files/0002-Fix-tests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
@@ -0,0 +1,29 @@
+From 47ff1eb9bb4f872c1d731b93d334ee5865bf3439 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 6 Apr 2014 22:16:30 -0400
+Subject: [PATCH] Fix tests Makefile usage of LDLIBS vs. LDFLAGS
+
+Libraries must come after objects, as link order matters, especially
+when using linker flags like -Wl,--as-needed.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
+Upstream-Status: Pending
+---
+ tests/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile b/tests/Makefile
+index cd202af..67c3c83 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -39,5 +39,5 @@ testprogs: $(hostprogs)
+ clean:
+ 	rm -f *.o *~ $(hostprogs)
+ 
+-${comp_progs}: LDFLAGS += -lssl -lcrypto
++${comp_progs}: LDLIBS += -lssl -lcrypto
+ ${comp_progs}: %: %.o openssl_wrapper.o
+-- 
+1.9.1
+
-- 
1.9.1


