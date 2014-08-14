Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id B0A0152981
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 01:20:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NA900J53VP8Z9B1@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 13 Aug 2014 20:19:56 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4073E200E2; Wed,
	13 Aug 2014 21:19:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Aug 2014 21:19:52 -0400
Message-id: <1407979193-12037-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH 1/2] ltp-ddt: update with latest changes in Makefile to pass kernel dir
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
X-List-Received-Date: Thu, 14 Aug 2014 01:20:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Lots of other local updates were upstreamed, so can be removed from bbappend

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 | 34 ++++------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 9fcc92f..8915917 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,38 +1,14 @@
-PR_append = "-arago3+gitr${SRCPV}"
+PR_append = "-arago4+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
 # Auto rev so we pick up the latest changes
 SRCREV = "${AUTOREV}"
 
-FILES_${PN}-dbg += " \
-	${LTPROOT}/testcases/realtime/*/*/.debug \
-"
+SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch"
 
-do_compile_kmodules() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake modules
-}
-
-addtask compile_kmodules after do_compile before do_install
-
-# Grab a portion of the module.bbclass to provide the needed kernel application
-# scripts/basic/fixdep. This issue is discussed in the following thread.
-# http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/005536.html
+EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
 
-inherit module-base
-
-#
-# Ensure the hostprogs are available for module compilation. Modules that
-# inherit this recipe and override do_compile() should be sure to call
-# do_make_scripts() or ensure the scripts are built independently.
-#
-do_make_scripts() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} scripts
+do_compile_prepend () {
+    do_make_scripts
 }
-
-addtask make_scripts before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[deptask] = "do_populate_sysroot"
-- 
2.0.4


