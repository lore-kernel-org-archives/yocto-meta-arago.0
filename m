Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id CB4B952998
	for <meta-arago@arago-project.org>;
	Mon, 21 Apr 2014 21:51:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4E004Z2I1NMI90@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 21 Apr 2014 16:51:39 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CC00D20120; Mon,
	21 Apr 2014 17:51:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 21 Apr 2014 17:51:23 -0400
Message-id: <1398117083-19098-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] packagegroup-arago-tisdk-addons: disable u-boot-fw-utils for ti43x
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
X-List-Received-Date: Mon, 21 Apr 2014 21:51:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Disable for now, as u-boot version for fw-utils being used is 2013.07 doesn't
have target for ti43x

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 0781b1b..375e5be 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 inherit packagegroup
 
@@ -17,9 +17,11 @@ UTILS = " \
     dropbear \
     openssh-sftp-server \
     ptpd \
-    u-boot-fw-utils \
 "
 
+UTILS_UBOOT_FW = "u-boot-fw-utils"
+UTILS_UBOOT_FW_ti43x = ""
+
 UTILS_append_ti33x = " mmc-utils"
 UTILS_append_ti43x = " mmc-utils"
 UTILS_append_omap-a15 = " mmc-utils"
@@ -34,4 +36,5 @@ UTILS_append_omap-a15 = " parted"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
+    ${UTILS_UBOOT_FW} \
 "
-- 
1.9.2


