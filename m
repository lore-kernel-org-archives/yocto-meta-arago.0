Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 7A86052A20
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 23:00:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1M006OCL98A060@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 26 Feb 2014 17:00:45 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 421F120086; Wed,
	26 Feb 2014 18:00:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 26 Feb 2014 18:00:43 -0500
Message-id: <1393455643-2139-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] packagegroup-*-tisdk-addons: mmc-utils requires >=3.8 kernel
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
X-List-Received-Date: Wed, 26 Feb 2014 23:00:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

It breaks for older platforms. For now, only enable mmc-utils for newer
platforms that are known to use latest kernel.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 18c97cc..f3c20f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 inherit packagegroup
 
@@ -17,16 +17,19 @@ UTILS = " \
     dropbear \
     openssh-sftp-server \
     ptpd \
-    mmc-utils \
 "
 
+UTILS_append_ti33x = " mmc-utils"
+UTILS_append_ti43x = " mmc-utils"
+UTILS_append_omap-a15 = " mmc-utils"
+
 # Add PRU examples for am180x-evm devices
 UTILS_append_am180x-evm = " ti-pru-sw-examples"
 
 UTILS_append_omap3 = " canutils"
 UTILS_append_ti33x = " canutils"
 UTILS_append_ti43x = " canutils"
-UTILS_append_omap-a15 = "parted"
+UTILS_append_omap-a15 = " parted"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
-- 
1.8.3.2


