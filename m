Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 9E2C952A5D
	for <meta-arago@arago-project.org>;
	Sat, 14 Dec 2013 07:23:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXS00F4ICIPZ630@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 14 Dec 2013 01:23:19 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B544120179; Sat,
	14 Dec 2013 02:23:13 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 14 Dec 2013 02:23:08 -0500
Message-id: <1387005788-16338-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1387005788-16338-1-git-send-email-denis@denix.org>
References: <1387005788-16338-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] packagegroup-arago-tisdk-crypto: enable cryptodev for ti33, ti43 and dra7
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
X-List-Received-Date: Sat, 14 Dec 2013 07:23:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index d781ddd..6d1275f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -12,10 +12,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 CRYPTO_SUPPORT = "\
     openssl \
     openssl-misc \
+    openssl-engines \
     "
 
-CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples"
-CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples"
+CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev cryptodev-tests"
+CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev cryptodev-tests"
+CRYPTO_SUPPORT_append_dra7xx-evm = " ti-crypto-examples cryptodev cryptodev-tests"
 
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
-- 
1.8.3.2


