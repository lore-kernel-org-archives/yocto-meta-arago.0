Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9F95652A29
	for <meta-arago@arago-project.org>;
	Wed, 20 Feb 2013 22:26:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KMQ0xm031936
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:01 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KMQ0WY010003
	for <meta-arago@arago-project.org>; Wed, 20 Feb 2013 16:26:00 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Feb 2013 16:26:00 -0600
Received: from localhost.localdomain (gtdev04-a0850405.am.dhcp.ti.com
	[10.218.102.32])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1KMQ0RL022750;	Wed, 20 Feb 2013 16:26:00 -0600
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Feb 2013 17:42:55 -0500
Message-ID: <1361400177-5858-2-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361400177-5858-1-git-send-email-ceh@ti.com>
References: <1361400177-5858-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] ltp-ddt: avoid compilation of old test code
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
X-List-Received-Date: Wed, 20 Feb 2013 22:26:23 -0000
Content-Type: text/plain

Do not include ltp-ddt test apps that are not compatible with
recent Linux kernel versions (3.7 or higher).
Include ltp-ddt binaries directory in PATH enviroment variable.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../0001-tmp-disable-fbdev-i2c-rtc-edma.patch      |   41 ++++++++++++++++++++
 .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |   14 +++++++
 2 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-tmp-disable-fbdev-i2c-rtc-edma.patch

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-tmp-disable-fbdev-i2c-rtc-edma.patch b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-tmp-disable-fbdev-i2c-rtc-edma.patch
new file mode 100644
index 0000000..aa0cc2d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt/0001-tmp-disable-fbdev-i2c-rtc-edma.patch
@@ -0,0 +1,41 @@
+From 98469baf75d71d5f91419ac1ae6087b1771c6a3c Mon Sep 17 00:00:00 2001
+From: Carlos Hernandez <ceh@ti.com>
+Date: Fri, 30 Nov 2012 10:27:02 -0500
+Subject: [PATCH] tmp disable fbdev,i2c,rtc,edma
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ Makefile               |    2 +-
+ testcases/ddt/Makefile |    4 ++++
+ 2 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 054ac6d..45471f0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -216,7 +216,7 @@ endif
+
+ ## Compile Modules
+ MODULES_TO_BUILD :=
+-PLATFORMSwEDMA   := am180x-evm|am181x-evm|am389x-evm|am387x-evm|am335x-evm|dm385-evm|dm813x-evm|da830-omapl137-evm|am170x-evm
++PLATFORMSwEDMA   := am180x-evm|am181x-evm|am389x-evm|am387x-evm|dm385-evm|dm813x-evm|da830-omapl137-evm|am170x-evm
+
+ ifneq (,$(findstring $(PLATFORM),$(PLATFORMSwEDMA)))
+ MODULES_TO_BUILD += modules_edma
+diff --git a/testcases/ddt/Makefile b/testcases/ddt/Makefile
+index fc1f4b1..e2acf3e 100644
+--- a/testcases/ddt/Makefile
++++ b/testcases/ddt/Makefile
+@@ -84,6 +84,10 @@ FILTER_OUT_DIRS                 += v4l2_display_davinci_test_suite
+ endif
+
+ ifeq ($(PLATFORM),am335x-evm)
++FILTER_OUT_DIRS                 += edma_test_suite
++FILTER_OUT_DIRS                 += rtc_test_suite
++FILTER_OUT_DIRS                 += i2c_test_suite
++FILTER_OUT_DIRS                 += fbdev_display_test_suite
+ FILTER_OUT_DIRS                 += v4l2_capture_test_suite
+ FILTER_OUT_DIRS                 += v4l2_display_test_suite
+ FILTER_OUT_DIRS                 += mc_test_suite
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 65a16f9..4dc8e52 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,3 +1,6 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 PR_append = "-arago0+gitr${SRCPV}"
 
 # Auto rev so we pick up the latest changes
@@ -30,3 +33,14 @@ do_make_scripts() {
 addtask make_scripts before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[deptask] = "do_populate_sysroot"
+
+# Temp patch to avoid compilation issues w/ 3.7 kernel
+SRC_URI += " file://0001-tmp-disable-fbdev-i2c-rtc-edma.patch"
+
+pkg_postinst_ltp-ddt() {
+    #!/bin/sh -e
+    if [ x"$D" = "x" ]; then
+        echo "PATH=\$PATH:/opt/ltp/testcases/bin:/opt/ltp/testcases/bin/ddt"  >>  /etc/profile
+        echo "export PATH" >>  /etc/profile
+    fi
+}
-- 
1.7.0.4


