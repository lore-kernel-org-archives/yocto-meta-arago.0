Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 954B3529B0
	for <meta-arago@arago-project.org>;
	Fri,  5 Feb 2016 16:46:58 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O2300MC22LUFLA0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Feb 2016 10:46:43 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8
	a=PqpS4GuionrRl7GZ8xcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8612E161E7C;	Fri,
	5 Feb 2016 11:46:42 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 05 Feb 2016 11:46:41 -0500
Message-id: <1454690801-22391-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] cryptodev-tests: don't use STAGING_KERNEL_DIR, fix re-packaging in multi-machine builds
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
X-List-Received-Date: Fri, 05 Feb 2016 16:46:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Backport from oe-core/master:
http://cgit.openembedded.org/openembedded-core/commit/?id=547c2b30573ee0e9e796acf7d8f0411063033282

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/layer.conf                                     | 1 -
 .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend            | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 4529040..f7e4631 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -14,6 +14,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 "
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    cryptodev-module \
     udev \
 "
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
index 0a3d1be..05219fa 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
@@ -1,7 +1,9 @@
-PR_append = "-arago6"
+PR_append = "-arago7"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://0001-allow-for-cross-compiling-cryptodev.patch"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
-- 
2.2.0


