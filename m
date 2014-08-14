Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 81CB352981
	for <meta-arago@arago-project.org>;
	Thu, 14 Aug 2014 01:20:10 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NA900ICQVP87P70@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 13 Aug 2014 20:19:57 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 439A620365; Wed,
	13 Aug 2014 21:19:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Aug 2014 21:19:53 -0400
Message-id: <1407979193-12037-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1407979193-12037-1-git-send-email-denis@denix.org>
References: <1407979193-12037-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] ltp-ddt-legacy: remove special version meant for 3.2 kernels
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
X-List-Received-Date: Thu, 14 Aug 2014 01:20:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

No longer supported in meta-ti/meta-arago

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-ddt-legacy_1.0.bbappend            | 32 ----------------------
 .../recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb | 14 ----------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
 delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
deleted file mode 100644
index 65a16f9..0000000
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bbappend
+++ /dev/null
@@ -1,32 +0,0 @@
-PR_append = "-arago0+gitr${SRCPV}"
-
-# Auto rev so we pick up the latest changes
-SRCREV = "${AUTOREV}"
-
-do_compile_kmodules() {
-        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-        oe_runmake modules
-}
-
-addtask compile_kmodules after do_compile before do_install
-
-# Grab a portion of the module.bbclass to provide the needed kernel application
-# scripts/basic/fixdep. This issue is discussed in the following thread.
-# http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/005536.html
-
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
-}
-
-addtask make_scripts before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[deptask] = "do_populate_sysroot"
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
deleted file mode 100644
index af5aa1b..0000000
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-# The master branch is now 3.2+ kernels.
-# This recipe is meant to use the v3.2 that supports 3.2 and older kernels.
-
-require recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
-
-PROVIDES += "ltp-ddt"
-RPROVIDES_${PN} += "ltp-ddt"
-RREPLACES_${PN} += "ltp-ddt"
-RCONFLICTS_${PN} += "ltp-ddt"
-
-PR := "${PR}.0"
-
-SRCREV = "1973c7e79f2ad1b595d5d1687db828f3f3998387"
-BRANCH = "v3.2"
-- 
2.0.4


