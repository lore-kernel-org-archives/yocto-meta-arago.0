Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 186765299C
	for <meta-arago@arago-project.org>;
	Thu, 13 Feb 2014 22:47:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0Y0099CHXVYDD0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 13 Feb 2014 16:46:43 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A0B34201BF; Thu,
	13 Feb 2014 17:46:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 13 Feb 2014 17:46:41 -0500
Message-id: <1392331601-23980-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ltp-ddt: update with latest fixes
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
X-List-Received-Date: Thu, 13 Feb 2014 22:47:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index bb5462e..e8bc2f6 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,9 +1,9 @@
-PR_append = "-arago8+gitr${SRCPV}"
+PR_append = "-arago9+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
 # Commit corresponds to ti2013.12.01 release
-SRCREV = "ed54f16df631bcbb6d6817d7e3540587e7f03123"
+SRCREV = "54b3562fffbb8ace4dc16b3977361e517c976a07"
 
 FILES_${PN}-dbg += " \
 	${LTPROOT}/testcases/realtime/*/*/.debug \
-- 
1.8.3.2


