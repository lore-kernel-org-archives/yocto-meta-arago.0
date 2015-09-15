Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id C08A552979
	for <meta-arago@arago-project.org>;
	Tue, 15 Sep 2015 14:11:14 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUQ005EG21V1MM0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 15 Sep 2015 09:10:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=aprn67ld-uTk3lLVa_oA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ABC52161C39;	Tue,
	15 Sep 2015 10:10:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 15 Sep 2015 10:10:43 -0400
Message-id: <1442326243-22551-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-*-amsdk-sdk-host: re-enable tisdk-makefile
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
X-List-Received-Date: Tue, 15 Sep 2015 14:11:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 6857b21..361f595 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r24"
+PR = "r25"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -25,12 +25,11 @@ EXTRA_FILES = ""
 EXTRA_FILES_ti43x = "tisdk-uenv"
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
 
-# ti-tisdk-makefile
-
 RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
     ${EXTRA_FILES} \
+    ti-tisdk-makefile \
     ${U-BOOT_SRC} \
     ${KERNEL_SRC} \
     ${@base_conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshallow-repositories','',d)} \
-- 
2.2.0


