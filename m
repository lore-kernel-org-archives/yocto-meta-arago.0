Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 56AC3529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 18:49:27 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NL4006MJ49T0YB0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 12 Mar 2015 13:49:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpCc6mbq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8 a=t7CeM3EgAAAA:8	a=HihYlcsHAAAA:8
	a=rKx0EpNa7FU9hkYhagMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2A2DC20088;	Thu,
	12 Mar 2015 14:49:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Mar 2015 14:49:04 -0400
Message-id: <1426186144-2658-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: fix yylex issue and __NR_* syscall issue
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
X-List-Received-Date: Thu, 12 Mar 2015 18:49:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-Do-not-link-against-libfl.patch    | 31 ++++++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 12 ++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
new file mode 100644
index 0000000..3e4aa73
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
@@ -0,0 +1,31 @@
+From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 11 Mar 2014 14:47:22 +0800
+Subject: [PATCH] ltp: Don't link against libfl
+
+We have already defined yywrap function in scan.l file. After this, we no longer need to
+link against libfl and so no longer get errors about undefined references to yylex.
+
+Upstream-status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ pan/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pan/Makefile b/pan/Makefile
+index 4cc6466..a4b575b 100644
+--- a/pan/Makefile
++++ b/pan/Makefile
+@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)
+ 
+-LDLIBS			+= -lm $(LEXLIB)
++LDLIBS			+= -lm
+ 
+ LFLAGS			+= -l
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index f8c9da0..a31568c 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -16,7 +16,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRCREV = "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+    file://ltp-Do-not-link-against-libfl.patch \
+"
 
 S = "${WORKDIR}/git"
 
@@ -66,6 +68,14 @@ do_configure_append() {
     (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
 }
 
+# The makefiles make excessive use of make -C and several include testcases.mk
+# which triggers a build of the syscall header. To reproduce, build ltp,
+# then delete the header, then "make -j XX" and watch regen.sh run multiple
+# times. Its easier to generate this once here instead.
+do_compile_prepend () {
+    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
+}
+
 do_compile_append () {
     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
     oe_runmake modules
-- 
2.2.0


