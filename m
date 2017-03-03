Return-Path: <a0850405@a0850405-t7500>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8C8C752A69
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 14:26:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23EQCn5007884
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 08:26:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488551172;
	bh=8hVGNjaSim/Vfr/aDeOcXGVZfA3kekndc4QXhOBRv44=;
	h=From:To:CC:Subject:Date;
	b=trnZC1xjknKJP46ChlyupWYFBcXGzAYBM0F3PCdnnlbc072+Jk3h4MQv+s+0K0p7g
	JTZxLhKmyEkrRcEM9BtC8o3c8pTeoB6bPFaVtTzhuu3Oree+6iLfIiCB31zwL82p1R
	qrErM0wQ14pTcCf3P9tPfreeEpAUEE6k6j+5+iDk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23EQCAY002045
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 08:26:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 08:26:11 -0600
Received: from a0850405-T7500 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23EQCoi010402;
	Fri, 3 Mar 2017 08:26:12 -0600
Received: from a0850405 by a0850405-T7500 with local (Exim 4.86_2)
	(envelope-from <a0850405@a0850405-t7500>)	id 1cjo9o-000AH9-PT;
	Fri, 03 Mar 2017 09:26:08 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Mar 2017 09:25:48 -0500
Message-ID: <1488551149-39460-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: yan-liu@ti.com
Subject: [PATCH 1/2] ltp-ddt: remove scheduler trace patch no longer required
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
X-List-Received-Date: Fri, 03 Mar 2017 14:26:16 -0000
Content-Type: text/plain

Latest version of ltp fixes the problem and the patch
0029-trace_shed-Fix-build-with-musl.patch no longer applies.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../0029-trace_shed-Fix-build-with-musl.patch      | 32 ----------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
deleted file mode 100644
index f7ece9e18ef0..000000000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2f8a57f66a94210d34dd0361659a8297cf3d813f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:29:24 +0000
-Subject: [PATCH 29/32] trace_shed: Fix build with musl
-
-Errors on musl are
-
-trace_sched.c:425:16: error: invalid operands to binary & (have
-'thread_sched_t * {aka struct <anonymous> *}' and 'int')
-      thrd_ndx, WEXITSTATUS(status));
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/sched/tool/trace_sched.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/sched/tool/trace_sched.c b/testcases/kernel/sched/tool/trace_sched.c
-index 7815686..30dca5f 100644
---- a/testcases/kernel/sched/tool/trace_sched.c
-+++ b/testcases/kernel/sched/tool/trace_sched.c
-@@ -422,7 +422,7 @@ int main(int argc,		/* number of input parameters.                        */
- 			if (status == (thread_sched_t *) - 1) {
- 				fprintf(stderr,
- 					"thread [%d] - process exited with errors %d\n",
--					thrd_ndx, WEXITSTATUS(status));
-+					thrd_ndx, WEXITSTATUS((int)status));
- 				exit(-1);
- 			} else {
- 				exp_prio[thrd_ndx] = status->exp_prio;
--- 
-2.7.0
-
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
index 22b962141dba..3bb17c8f8535 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -17,8 +17,7 @@ inherit autotools-brokensep
 SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-    file://0029-trace_shed-Fix-build-with-musl.patch"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


