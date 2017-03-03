Return-Path: <a0850405@a0850405-t7500>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9916852AC7
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 19:34:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23JXqjB023972
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:33:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488569632;
	bh=xQuW/jGNFrUeNC6evsMs1602Var40VlAZcFq1Sd7vcA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mbv8nj09T0SzjK2v/EHNubJ2SYfEmzJScb5JwyNh1poMH+LVuZ6TVaa2mDJbry+bd
	S5XU/IcTlytMPAY/dLCIso8uNlbujhiSEQCfSALfDAS6iU5SeI2xV30aYbVxhc9vda
	/oO25RoHTwG9cqkGFsbUnOGvbxxPlPo6BDcM+RvI=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JXlWn030370
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:33:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 13:33:46 -0600
Received: from a0850405-T7500 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JXkmf023581;
	Fri, 3 Mar 2017 13:33:46 -0600
Received: from a0850405 by a0850405-T7500 with local (Exim 4.86_2)
	(envelope-from <a0850405@a0850405-t7500>)	id 1cjsxT-000BK6-9e;
	Fri, 03 Mar 2017 14:33:43 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Mar 2017 14:33:39 -0500
Message-ID: <1488569619-43487-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488551149-39460-2-git-send-email-ceh@ti.com>
References: <1488551149-39460-2-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Cc: yan-liu@ti.com
Subject: [PATCH v3] ltp-ddt: update to latest ltp release 20170116
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
X-List-Received-Date: Fri, 03 Mar 2017 19:34:03 -0000
Content-Type: text/plain

remove scheduler trace patch no longer required
Latest version of ltp fixes the problem and the patch
0029-trace_shed-Fix-build-with-musl.patch no longer applies.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../0029-trace_shed-Fix-build-with-musl.patch      | 32 ----------------------
 .../{ltp-ddt_20160510.bb => ltp-ddt_20170116.bb}   |  7 ++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20160510.bb => ltp-ddt_20170116.bb} (92%)

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
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
similarity index 92%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index 22b962141dba..2d78fa835c9f 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r10"
+PR = "r11"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,11 +14,10 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
+SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-    file://0029-trace_shed-Fix-build-with-musl.patch"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


