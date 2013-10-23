Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 725105299B
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 15:41:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9NFf9sR015554
	for <meta-arago@arago-project.org>; Wed, 23 Oct 2013 10:41:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9NFf9sI030616
	for <meta-arago@arago-project.org>; Wed, 23 Oct 2013 10:41:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 23 Oct 2013 10:41:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9NFf6ns007726;
	Wed, 23 Oct 2013 10:41:07 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 23 Oct 2013 11:33:21 -0500
Message-ID: <1382546001-12823-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] u-boot-ti-staging: adapt to base recipe name change
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
X-List-Received-Date: Wed, 23 Oct 2013 15:41:10 -0000
Content-Type: text/plain

* The base recipe being appended is now the 2013.10 recipe and
  not _git so this bbappend needs to be updated.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../u-boot/u-boot-ti-staging_2013.10.bbappend      |   13 +++++++++++++
 .../u-boot/u-boot-ti-staging_git.bbappend          |   13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
new file mode 100644
index 0000000..8174bc7
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
@@ -0,0 +1,13 @@
+PR_append = "-arago0"
+
+SRCREV = "${AUTOREV}"
+
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
+
+do_compile_prepend() {
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
+    fi
+}
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend
deleted file mode 100644
index 8174bc7..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_git.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-PR_append = "-arago0"
-
-SRCREV = "${AUTOREV}"
-
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-
-do_compile_prepend() {
-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-    then
-        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-    fi
-}
-- 
1.7.0.4


