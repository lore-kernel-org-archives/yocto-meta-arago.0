Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id B15C552972
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 00:39:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAW000DX1SZXW50@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Aug 2014 19:39:10 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BC11A20085; Mon,
	25 Aug 2014 20:38:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Aug 2014 20:38:59 -0400
Message-id: <1409013539-3188-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [dora][PATCH v2] openssl: unconditionally switch from ocf-linux to cryptodev
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
X-List-Received-Date: Tue, 26 Aug 2014 00:39:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Trying to mix both ocf-linux and cryptodev based on the platform is causing
some intermittent issues.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.1e.bbappend   | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
index 9b6bf00..4b60a56 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
@@ -12,17 +12,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = "-arago9"
+PR_append = "-arago10"
 
-DEPENDS_append_ti33x_class-target = " cryptodev"
-DEPENDS_append_ti43x_class-target = " cryptodev"
-DEPENDS_append_dra7xx-evm_class-target = " cryptodev"
+DEPENDS_append_class-target = " cryptodev"
 
 python __anonymous () {
     crypdep = d.getVar("DEPENDS").replace("ocf-linux ", "")
-    d.setVar("DEPENDS_ti33x_class-target", crypdep)
-    d.setVar("DEPENDS_ti43x_class-target", crypdep)
-    d.setVar("DEPENDS_dra7xx-evm_class-target", crypdep)
+    d.setVar("DEPENDS", crypdep)
 }
 
 CRYPTODEV_AFALG_PATCHES = " \
@@ -33,9 +29,7 @@ CRYPTODEV_AFALG_PATCHES = " \
 	file://0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch \
 "
 
-SRC_URI_append_ti33x_class-target = "${CRYPTODEV_AFALG_PATCHES}"
-SRC_URI_append_ti43x_class-target = "${CRYPTODEV_AFALG_PATCHES}"
-SRC_URI_append_dra7xx-evm_class-target = "${CRYPTODEV_AFALG_PATCHES}"
+SRC_URI_append_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 
 # Override do_configure to replace target with linux-armv4 to enable ASM code
 # optimization for ARM arch (including armv7) for extra performance
-- 
2.0.4


