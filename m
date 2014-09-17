Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id D6AB15296D
	for <meta-arago@arago-project.org>;
	Wed, 17 Sep 2014 00:09:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC000EW6R3G8W20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 16 Sep 2014 19:09:22 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 70CF1200AC; Tue,
	16 Sep 2014 20:09:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Sep 2014 20:09:14 -0400
Message-id: <1410912554-5062-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] u-boot-ti-staging: recover lost UBOOT_LOCALVERSION
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
X-List-Received-Date: Wed, 17 Sep 2014 00:09:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-ti-staging_2014.07.bbappend      |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
index b81d74e..54a1691 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bbappend
@@ -1,7 +1,11 @@
 # Append the base 2014.07 u-boot mainline recipe to AUTOREV for now so that
 # we can test the latest mainline
 
-PR_append = "-arago3+gitr${SRCPV}"
+PR_append = "-arago4"
+
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
+
+SRCREV = "${AUTOREV}"
 
 # AM57x EVM is currently on a seperate git tree/branch.
 # Once the software has been integrated to the u-boot-ti-staging
@@ -13,5 +17,3 @@ SRC_URI_am57xx-evm := "${@oe_filter_out('git://git.ti.com/ti-u-boot/ti-u-boot.gi
 BRANCH_am57xx-evm = "beaglex15"
 
 SRC_URI_am57xx-evm += "git://github.com/felipebalbi/u-boot.git;protocol=git;branch=${BRANCH}"
-
-SRCREV = "${AUTOREV}"
-- 
1.7.9.5


