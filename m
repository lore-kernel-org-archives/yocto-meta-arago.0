Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id B9BCE52A08
	for <meta-arago@arago-project.org>;
	Thu, 20 Aug 2015 00:36:03 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTC00C89UZN0C20@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 19 Aug 2015 19:35:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=3Paew7jVrbC7I7t5X4wA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3951D161B82;	Wed,
	19 Aug 2015 20:35:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Aug 2015 20:35:35 -0400
Message-id: <1440030941-20751-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1440030941-20751-1-git-send-email-denis@denix.org>
References: <1440030941-20751-1-git-send-email-denis@denix.org>
Subject: [master/fido][PATCH 2/8] Revert "HACK: disable cryptodev modules for now, until fixed against 4.1"
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
X-List-Received-Date: Thu, 20 Aug 2015 00:36:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit ffdcd0ff22be19b45bfb62538905fb64980bc9f9.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb  |  8 ++++----
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb              | 10 +++++-----
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb           |  9 ++++-----
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 570dfec..509642e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,9 +11,9 @@ CRYPTO_RDEPENDS = ""
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
 CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
 
-#CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
-#CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
-#CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 63a1bd2..759276f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
-PR = "r6"
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
 CRYPTO_API = ""
-#CRYPTO_API_ti33x = "cryptodev-module-dev"
-#CRYPTO_API_ti43x = "cryptodev-module-dev"
-#CRYPTO_API_dra7xx = "cryptodev-module-dev"
-#CRYPTO_API_keystone = "cryptodev-module-dev"
+CRYPTO_API_ti33x = "cryptodev-module-dev"
+CRYPTO_API_ti43x = "cryptodev-module-dev"
+CRYPTO_API_dra7xx = "cryptodev-module-dev"
+CRYPTO_API_keystone = "cryptodev-module-dev"
 
 RDEPENDS_${PN} = "\
     openssl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index d9e8a60..99d9253 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,10 +15,9 @@ CRYPTO_SUPPORT = "\
     openssl-engines \
     "
 
-# all 3 below - cryptodev-module cryptodev-tests
-CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples"
-CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples"
-CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples"
+CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_ti43x = " ti-crypto-examples cryptodev-module cryptodev-tests"
+CRYPTO_SUPPORT_append_dra7xx = " ti-crypto-examples cryptodev-module cryptodev-tests"
 
 # Add crypto hardware support for am37x-evm
 # NOTE: this package depends on a kernel patch which also has a TSU
-- 
2.2.0


