Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 549B752974
	for <meta-arago@arago-project.org>;
	Mon, 30 Nov 2015 17:30:00 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYN000N31WVW0A0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 30 Nov 2015 11:29:30 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=9WQ6s8QZ8ZRQHAifV_YA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8E01D161D28;	Mon,
	30 Nov 2015 12:29:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 30 Nov 2015 12:29:19 -0500
Message-id: <1448904559-30161-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup-*-addons-sdk-target: disable MPM pieces until upgrade fixed in meta-ti
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
X-List-Received-Date: Mon, 30 Nov 2015 17:30:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb             | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 81a4bbb..9780bde 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,6 +28,11 @@ TI_SECURE_STORAGE_DEV = "\
 	libp11-staticdev \
 	"
 
+# Old version broken against 4.1, new version is not complete
+#	multiprocmgr-dev
+#	multiprocmgr-staticdev
+#	mpm-transport-dev
+#	mpm-transport-staticdev
 # Broken with 4.1
 #	ipsecmgr-dev
 #	ipsecmgr-staticdev
@@ -66,10 +71,6 @@ EXTRA_LIBS_append_keystone = "\
 	libnl-staticdev \
 	ti-ipc-dev \
 	ti-ipc-staticdev \
-	multiprocmgr-dev \
-	multiprocmgr-staticdev \
-	mpm-transport-dev \
-	mpm-transport-staticdev \
 	edma3-lld-dev \
 	edma3-lld-staticdev \
 	lksctp-tools-dev \
-- 
2.2.0


