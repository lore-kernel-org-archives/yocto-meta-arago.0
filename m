Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 440F952A38
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2013 02:31:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXZ003LSDNYH391@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 Dec 2013 20:31:11 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A60CE20088; Tue,
	17 Dec 2013 21:31:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 17 Dec 2013 21:31:10 -0500
Message-id: <1387333870-8338-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ltp-ddt: update with fixes for crypto and nand/am43x
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
X-List-Received-Date: Wed, 18 Dec 2013 02:31:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 645431a..50f87b3 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,9 +1,9 @@
-PR_append = "-arago4+gitr${SRCPV}"
+PR_append = "-arago5+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
 # Commit corresponds to ti2013.12.00 release
-SRCREV = "c0ed100634b7320c0e2f55773a8937eb2a85fb57"
+SRCREV = "02b425d2618b657748452a87d67b84b792760869"
 
 FILES_${PN}-dbg += " \
 	${LTPROOT}/testcases/realtime/*/*/.debug \
-- 
1.8.3.2


