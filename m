Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 55EB852A6D
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 01:51:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00B1CIHO5OQ0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 20:51:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F193320396; Wed,
	23 Apr 2014 21:51:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 21:51:14 -0400
Message-id: <1398304280-15426-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398304280-15426-1-git-send-email-denis@denix.org>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/8] u-boot-ti-staging: remove UBOOT_LOCALVERSION handling, now upstream
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
X-List-Received-Date: Thu, 24 Apr 2014 01:51:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend | 10 ----------
 .../recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend    | 12 +-----------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
index 911a8ce..1fb654b 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
@@ -1,13 +1,3 @@
 PR_append = "-arago4"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-
-# the lines below can be removed once the U-Boot LOCALVERSION patches are merged
-# into the oe-core danny branch. Update: not coming to danny, wait for dylan.
-do_compile_prepend() {
-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-    then
-        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-    fi
-}
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
index 8174bc7..f015993 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend
@@ -1,13 +1,3 @@
-PR_append = "-arago0"
-
-SRCREV = "${AUTOREV}"
+PR_append = "-arago1"
 
 UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
-
-do_compile_prepend() {
-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-    then
-        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-    fi
-}
-- 
1.9.2


