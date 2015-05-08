Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 7625F52093
	for <meta-arago@arago-project.org>;
	Fri,  8 May 2015 17:54:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO1000YCLPPM580@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 May 2015 12:54:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AawGxMSu c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=xfjXIoUA8_xJXNyHJbcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 30FBA200EC;	Fri,
	8 May 2015 13:53:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 May 2015 13:53:49 -0400
Message-id: <1431107629-13794-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ltp-ddt: remove old bbappend for 0.0.4 version
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
X-List-Received-Date: Fri, 08 May 2015 17:54:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend      | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
deleted file mode 100644
index 9afc2fc..0000000
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-PR_append = "-arago10+gitr${SRCPV}"
-
-RDEPENDS_${PN} += "linaro-pm-qa-utils serialcheck"
-
-SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch"
-
-SRCREV = "ee4e3d31ff7a45682cabe19d9cf645eb457325e9"
-
-EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
-
-KERNEL_MODULES_META_PACKAGE = "${PN}"
-
-# do_make_scripts should be a separate task for the lock to work
-addtask make_scripts before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[deptask] = "do_populate_sysroot"
-- 
2.2.0


