Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 61C43529A7
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 20:11:31 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NNO00F38TEK7E50@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 01 May 2015 15:11:14 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ZJdgQs+z c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=2sUDGSJzr8o01NrybcgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3E16F20030;	Fri,
	1 May 2015 16:11:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 01 May 2015 16:11:07 -0400
Message-id: <1430511067-12742-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: don't fail do_install when no modules were built
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
X-List-Received-Date: Fri, 01 May 2015 20:11:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

Reported by Sam Nelson, but implemented in more lightweight fashion.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 68e1a3c..3b2132a 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -87,7 +87,7 @@ do_install() {
     oe_runmake install
     install -d ${D}${datadir}
     install -d ${D}${kmoddir}
-    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
+    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir} || true
 }
 
 # do_make_scripts should be a separate task for the lock to work
-- 
1.7.9.5


