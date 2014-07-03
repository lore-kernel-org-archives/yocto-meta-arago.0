Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 55F9952A71
	for <meta-arago@arago-project.org>;
	Thu,  3 Jul 2014 20:36:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s63KaZhS032401
	for <meta-arago@arago-project.org>; Thu, 3 Jul 2014 15:36:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s63KaZnP018925
	for <meta-arago@arago-project.org>; Thu, 3 Jul 2014 15:36:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 3 Jul 2014 15:36:35 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s63KaYsK005347;	Thu, 3 Jul 2014 15:36:34 -0500
Received: from sdit-build04.dal.design.ti.com (sdit-build04.dal.design.ti.com
	[10.247.66.55])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s63KaWqY017499;	Fri, 4 Jul 2014 02:06:32 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 3 Jul 2014 15:36:30 -0500
Message-ID: <1404419790-17652-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ocf-linux: remove ocf-linux usage since it is deprecated
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
X-List-Received-Date: Thu, 03 Jul 2014 20:36:36 -0000
Content-Type: text/plain

* remove use of depricated ocf-linux and move to cryptodev-module
  instead.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../openssl/openssl_1.0.1e.bbappend                |    3 +++
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb  |    6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
index f58edb5..86c72fe 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
@@ -18,6 +18,7 @@ DEPENDS_append_ti33x_class-target = " cryptodev"
 DEPENDS_append_ti43x_class-target = " cryptodev"
 DEPENDS_append_dra7xx-evm_class-target = " cryptodev"
 DEPENDS_append_am57xx-evm_class-target = " cryptodev"
+DEPENDS_append_keystone_class-target = " cryptodev"
 
 python __anonymous () {
     crypdep = d.getVar("DEPENDS").replace("ocf-linux ", "")
@@ -25,6 +26,7 @@ python __anonymous () {
     d.setVar("DEPENDS_ti43x_class-target", crypdep)
     d.setVar("DEPENDS_dra7xx-evm_class-target", crypdep)
     d.setVar("DEPENDS_am57xx-evm_class-target", crypdep)
+    d.setVar("DEPENDS_keystone_class-target", crypdep)
 }
 
 CRYPTODEV_AFALG_PATCHES = " \
@@ -39,6 +41,7 @@ SRC_URI_append_ti33x_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 SRC_URI_append_ti43x_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 SRC_URI_append_dra7xx-evm_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 SRC_URI_append_am57xx-evm_class-target = "${CRYPTODEV_AFALG_PATCHES}"
+SRC_URI_append_keystone_class-target = "${CRYPTODEV_AFALG_PATCHES}"
 
 # Override do_configure to replace target with linux-armv4 to enable ASM code
 # optimization for ARM arch (including armv7) for extra performance
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index b3df987..0b4a6cd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
-PR = "r3"
+PR = "r4"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CRYPTO_API = "ocf-linux-dev"
-
+CRYPTO_API = ""
 CRYPTO_API_ti33x = "cryptodev-module-dev"
 CRYPTO_API_ti43x = "cryptodev-module-dev"
 CRYPTO_API_dra7xx = "cryptodev-module-dev"
+CRYPTO_API_keystone = "cryptodev-module-dev"
 
 RDEPENDS_${PN} = "\
     openssl-dev \
-- 
1.7.9.5


