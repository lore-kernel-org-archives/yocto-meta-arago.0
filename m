Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id F32FD5299F
	for <meta-arago@arago-project.org>;
	Fri,  5 Feb 2016 19:11:27 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O23004H899ZPCA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Feb 2016 13:10:58 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=axhNVly-UK7VZa-khH8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D75A7161E69;	Fri,
	5 Feb 2016 14:10:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 05 Feb 2016 14:10:47 -0500
Message-id: <1454699447-25504-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] cryptodev-tests: this time actually change the right file, duh
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
X-List-Received-Date: Fri, 05 Feb 2016 19:11:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend            | 4 +---
 .../recipes-kernel/cryptodev/cryptodev-tests_1.6.bbappend             | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_1.6.bbappend

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
index 05219fa..f34f821 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
@@ -1,9 +1,7 @@
-PR_append = "-arago7"
+PR_append = "-arago8"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://0001-allow-for-cross-compiling-cryptodev.patch"
-
-EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_1.6.bbappend
new file mode 100644
index 0000000..19a031f
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_1.6.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
-- 
2.2.0


