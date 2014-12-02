Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id A1A5052A7E
	for <meta-arago@arago-project.org>;
	Tue,  2 Dec 2014 22:07:07 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NFZ006L36RE5PL0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 02 Dec 2014 16:06:51 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=F/vgrRlI c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=WAboHZsQ--v_HWt4zDkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 98C0420086;	Tue,
	2 Dec 2014 17:06:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 02 Dec 2014 17:06:49 -0500
Message-id: <1417558009-8372-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] branding-core, recipes: move AUTOREV for kernel, u-boot and ltp-ddt
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
X-List-Received-Date: Tue, 02 Dec 2014 22:07:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Move setting AUTOREV for important packages into branding-core, so it won't
affect other SDK products using meta-arago/master.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc            | 5 +++++
 .../recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend          | 7 +------
 meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend  | 5 +----
 .../recipes-kernel/linux/linux-ti-staging_3.14.bbappend            | 4 +---
 4 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index b1ae89b..b759469 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -4,3 +4,8 @@
 # Please avoid creating multiple versions of the same brand, if possible
 # The policy is for the "Core" brand to be the default,
 # hence this file is mostly empty and used as a template
+
+# Auto rev important packages to pick up latest
+SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
+SRCREV_pn-ltp-ddt = "${AUTOREV}"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index 54a1691..872d0b2 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,12 +1,7 @@
-# Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so that
-# we can test the latest mainline
-
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
-SRCREV = "${AUTOREV}"
-
 # AM57x EVM is currently on a seperate git tree/branch.
 # Once the software has been integrated to the u-boot-ti-staging
 # repository these lines can be removed.
diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 8332150..8e49900 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,10 +1,7 @@
-PR_append = "-arago8+gitr${SRCPV}"
+PR_append = "-arago9+gitr${SRCPV}"
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
-# Auto rev so we pick up the latest changes
-SRCREV = "${AUTOREV}"
-
 SRC_URI_remove = "file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch"
 
 EXTRA_OEMAKE += "KERNEL_PATH="${STAGING_KERNEL_DIR}""
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
index b178b5e..22d1f4f 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_3.14.bbappend
@@ -1,4 +1,4 @@
-MACHINE_KERNEL_PR_append = "-arago1"
+MACHINE_KERNEL_PR_append = "-arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
@@ -6,8 +6,6 @@ require copy-defconfig.inc
 
 KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
 
-SRCREV = "${AUTOREV}"
-
 kernel_do_configure_prepend() {
     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
     then
-- 
2.1.2


