Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 728225299E
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 23:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5E8CB2084E;
	Fri, 18 Nov 2016 23:19:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AmOVzIVcl7Hl; Fri, 18 Nov 2016 23:19:50 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 401DF201BD;
	Fri, 18 Nov 2016 23:19:49 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id BB54016219D;
	Fri, 18 Nov 2016 18:19:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 18:19:48 -0500
Message-Id: <1479511188-11090-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ltp-ddt: fix compile issue with gcc-6
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
X-List-Received-Date: Fri, 18 Nov 2016 23:19:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fixes "trace_sched.c:425:16: error: invalid operands to binary &" when compiled
with gcc-6 toolchain.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0029-trace_shed-Fix-build-with-musl.patch      | 32 ++++++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   |  5 ++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
new file mode 100644
index 0000000..f7ece9e
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
@@ -0,0 +1,32 @@
+From 2f8a57f66a94210d34dd0361659a8297cf3d813f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jan 2016 07:29:24 +0000
+Subject: [PATCH 29/32] trace_shed: Fix build with musl
+
+Errors on musl are
+
+trace_sched.c:425:16: error: invalid operands to binary & (have
+'thread_sched_t * {aka struct <anonymous> *}' and 'int')
+      thrd_ndx, WEXITSTATUS(status));
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/sched/tool/trace_sched.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/sched/tool/trace_sched.c b/testcases/kernel/sched/tool/trace_sched.c
+index 7815686..30dca5f 100644
+--- a/testcases/kernel/sched/tool/trace_sched.c
++++ b/testcases/kernel/sched/tool/trace_sched.c
+@@ -422,7 +422,7 @@ int main(int argc,		/* number of input parameters.                        */
+ 			if (status == (thread_sched_t *) - 1) {
+ 				fprintf(stderr,
+ 					"thread [%d] - process exited with errors %d\n",
+-					thrd_ndx, WEXITSTATUS(status));
++					thrd_ndx, WEXITSTATUS((int)status));
+ 				exit(-1);
+ 			} else {
+ 				exp_prio[thrd_ndx] = status->exp_prio;
+-- 
+2.7.0
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
index ef31576..85016ca 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r7"
+PR = "r8"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -17,7 +17,8 @@ inherit autotools-brokensep
 SRCREV = "2926b663850e0af624b978b402a92b9828e1b187"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+    file://0029-trace_shed-Fix-build-with-musl.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


