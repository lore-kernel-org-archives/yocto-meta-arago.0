Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id D4A9A52AAF
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 19:57:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZX00MF78SENA20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jan 2014 13:57:50 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 390A520099; Fri,
	24 Jan 2014 14:57:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Jan 2014 14:57:49 -0500
Message-id: <1390593469-30757-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Joel Fernandes <joelf@ti.com>
Subject: [PATCH] openssl: drop NO_ONESHOT patch to unbreak SHA1 and MD5
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
X-List-Received-Date: Fri, 24 Jan 2014 19:57:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is no longer required, according to Joel's testing.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Joel Fernandes <joelf@ti.com>
---
 meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
index 4154225..9b6bf00 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
@@ -12,7 +12,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = "-arago8"
+PR_append = "-arago9"
 
 DEPENDS_append_ti33x_class-target = " cryptodev"
 DEPENDS_append_ti43x_class-target = " cryptodev"
@@ -27,7 +27,6 @@ python __anonymous () {
 
 CRYPTODEV_AFALG_PATCHES = " \
 	file://0001-Add-AF_ALG-interface-support-to-OpenSSL.patch \
-	file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch \
 	file://0004-Sample-AF_ALG-openssl.cnf.patch \
 	file://0001-eng_cryptodev.c-update-to-cryptodev-1.6.patch \
 	file://0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch \
-- 
1.8.3.2


