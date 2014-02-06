Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 2A2B0529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 00:21:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J00EJXT015K50@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 05 Feb 2014 18:21:37 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 96C3B20086; Wed,
	05 Feb 2014 19:21:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 05 Feb 2014 19:21:33 -0500
Message-id: <1391646093-6544-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1391646093-6544-1-git-send-email-denis@denix.org>
References: <1391646093-6544-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] ltp-ddt: disable AUTOREV and lock SRCREV for release
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 00:21:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend            | 6 +++---
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
index 65a16f9..db5fdb9 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
@@ -1,7 +1,7 @@
-PR_append = "-arago0+gitr${SRCPV}"
+PR_append = "-arago1+gitr${SRCPV}"
 
-# Auto rev so we pick up the latest changes
-SRCREV = "${AUTOREV}"
+# Commit corresponds to ti2013.12.01 release
+SRCREV = "3f1faf23ffce1a150e928775258877680e6176d9"
 
 do_compile_kmodules() {
         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 7d6871a..1be8bea 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,9 +1,9 @@
-PR_append = "-arago6+gitr${SRCPV}"
+PR_append = "-arago7+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
-# Auto rev so we pick up the latest changes
-SRCREV = "${AUTOREV}"
+# Commit corresponds to ti2013.12.01 release
+SRCREV = "3f1faf23ffce1a150e928775258877680e6176d9"
 
 FILES_${PN}-dbg += " \
 	${LTPROOT}/testcases/realtime/*/*/.debug \
-- 
1.8.3.2


