Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 1B74F52990
	for <meta-arago@arago-project.org>;
	Mon, 16 Dec 2013 00:12:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXV004XQHW7TB70@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 15 Dec 2013 18:12:12 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 19ED72004C; Sun,
	15 Dec 2013 19:12:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 15 Dec 2013 19:12:05 -0500
Message-id: <1387152726-12006-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] openssl: fix the typo in dra7xx-evm name to resolve dependencies
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
X-List-Received-Date: Mon, 16 Dec 2013 00:12:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.1e.bbappend              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
index 25a665a..4154225 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
@@ -12,7 +12,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = "-arago7"
+PR_append = "-arago8"
 
 DEPENDS_append_ti33x_class-target = " cryptodev"
 DEPENDS_append_ti43x_class-target = " cryptodev"
@@ -22,7 +22,7 @@ python __anonymous () {
     crypdep = d.getVar("DEPENDS").replace("ocf-linux ", "")
     d.setVar("DEPENDS_ti33x_class-target", crypdep)
     d.setVar("DEPENDS_ti43x_class-target", crypdep)
-    d.setVar("DEPENDS_dra7xx_class-target", crypdep)
+    d.setVar("DEPENDS_dra7xx-evm_class-target", crypdep)
 }
 
 CRYPTODEV_AFALG_PATCHES = " \
-- 
1.8.3.2


