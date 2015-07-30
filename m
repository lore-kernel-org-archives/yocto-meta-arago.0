Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id C2204529B5
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2015 16:03:32 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSB00GPE5XBSV60@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jul 2015 11:03:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=3Paew7jVrbC7I7t5X4wA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CF7AA161B13;	Thu,
	30 Jul 2015 12:03:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jul 2015 12:03:07 -0400
Message-id: <1438272191-15395-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/5] HACK: disable cryptodev modules for now, until fixed against 4.1
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
X-List-Received-Date: Thu, 30 Jul 2015 16:03:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb  |  8 ++++----
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb              | 10 +++++-----
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb           |  9 +++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index b572e6a..570dfec 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,9 +11,9 @@ CRYPTO_RDEPENDS = ""
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
 CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
 
-CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
-CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
+#CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
+#CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
+#CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 1cd6d99..63a1bd2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
 CRYPTO_API = ""
-CRYPTO_API_ti33x = "cryptodev-module-dev"
-CRYPTO_API_ti43x = "cryptodev-module-dev"
-CRYPTO_API_dra7xx = "cryptodev-module-dev"
-CRYPTO_API_keystone = "cryptodev-module-dev"
+#CRYPTO_API_ti33x = "cryptodev-module-dev"
+#CRYPTO_API_ti43x = "cryptodev-module-dev"
+#CRYPTO_API_dra7xx = "cryptodev-module-dev"
+#CRYPTO_API_keystone = "cryptodev-module-dev"
 
 RDEPENDS_${PN} = "\
     openssl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 60a4657..d9e8a60 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,9 +15,10 @@ CRYPTO_SUPPORT = "\
     openssl-engines \
     "
 
-CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples cryptodev-module cryptodev-tests"
+# all 3 below - cryptodev-module cryptodev-tests
+CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples"
+CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples"
+CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples"
 
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
-- 
2.2.0


