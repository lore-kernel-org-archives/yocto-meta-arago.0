Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 6A9AB52A20
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 22:55:05 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1M00BC5KYYEGC0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 26 Feb 2014 16:54:50 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6CC2720086; Wed,
	26 Feb 2014 17:54:34 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 26 Feb 2014 17:54:33 -0500
Message-id: <1393455273-32719-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] arago-source-ipk, packagegroup-*-crypto-sdk-host: enable cryptodev sources
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
X-List-Received-Date: Wed, 26 Feb 2014 22:55:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf                 | 4 ++++
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb       | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index d2a9600..691ba60 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -187,6 +187,10 @@ CREATE_SRCIPK_pn-linux-omapl1 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl1 = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omapl1 = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-cryptodev = "1"
+SRCIPK_INSTALL_DIR_pn-cryptodev = "board-support/cryptodev-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-cryptodev = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
 SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index f86accf..0026ea3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -11,6 +11,10 @@ CRYPTO_RDEPENDS = ""
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
 CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
 
+CRYPTO_RDEPENDS_append_ti33x = " cryptodev-src"
+CRYPTO_RDEPENDS_append_ti43x = " cryptodev-src"
+CRYPTO_RDEPENDS_append_dra7xx-evm = " cryptodev-src"
+
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
 "
-- 
1.8.3.2


