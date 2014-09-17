Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id E1CAB52A48
	for <meta-arago@arago-project.org>;
	Wed, 17 Sep 2014 22:08:40 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC200I10G5JZRE0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 17 Sep 2014 17:08:17 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CF6DD20015; Wed,
	17 Sep 2014 18:08:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 17 Sep 2014 18:08:05 -0400
Message-id: <1410991685-27983-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] ltp-ddt: automatically add ddt kernel modules into RDEPENDS
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
X-List-Received-Date: Wed, 17 Sep 2014 22:08:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index d8b525b..8332150 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago7+gitr${SRCPV}"
+PR_append = "-arago8+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
@@ -9,6 +9,8 @@ SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplev
 
 EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
 
+KERNEL_MODULES_META_PACKAGE = "${PN}"
+
 # do_make_scripts should be a separate task for the lock to work
 addtask make_scripts before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-- 
2.0.4


