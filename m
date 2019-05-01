Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 68534529B8
	for <meta-arago@arago-project.org>;
	Wed,  1 May 2019 20:24:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x41KODnE006983
	for <meta-arago@arago-project.org>; Wed, 1 May 2019 15:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556742253;
	bh=BmsvoGY09mCjEeOEKU7gsRda8c9PJr96RbbZzexc2bY=;
	h=From:To:CC:Subject:Date;
	b=KG4JT7WY5n34fpE2tWy6c3vCusEUPjzARnVR9YYe7oHN9IGOZtx/yFGY4iiEAia2l
	c422zZTiOdTTbE/WMc6Y3VNs298SnlPiZ1/AUwEwzKEhKUth5OKD2vJAOhi7b5egw/
	whNqQspTNdEDcEho/TcvazQBaqrD0hQtSI01aa5Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x41KODGm049102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 1 May 2019 15:24:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 1 May 2019 15:24:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 1 May 2019 15:24:13 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x41KODoR086865;
	Wed, 1 May 2019 15:24:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 May 2019 20:13:19 +0000
Message-ID: <20190501201319.6765-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] openssl10, packagegroup-crypto: un-clash and install 1.0 binaries and engines
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
X-List-Received-Date: Wed, 01 May 2019 20:24:43 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/openssl/openssl10_%.bbappend | 11 +++++++++++
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb  |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
index e74bcba6..a0938ca4 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
@@ -13,3 +13,14 @@ CRYPTODEV_AFALG_PATCHES = " \
 "
 
 SRC_URI += "${CRYPTODEV_AFALG_PATCHES}"
+
+# override this from upstream to preserve engine libs, binaries and config
+# w/o clashing with 1.1
+openssl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc`; do
+                rm $file
+        done
+        mv ${PKGD}/usr/bin/openssl ${PKGD}/usr/bin/openssl10
+        mv ${PKGD}/usr/bin/c_rehash ${PKGD}/usr/bin/c_rehash10
+        mv ${PKGD}/etc/ssl/openssl.cnf ${PKGD}/etc/ssl/openssl10.cnf
+}
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 56e4e89e..4fe7057e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,6 +11,8 @@ CRYPTO_SUPPORT = "\
     openssl-bin \
     openssl-conf \
     openssl-engines \
+    openssl10 \
+    openssl10-engines \
 "
 
 CRYPTO_SUPPORT_append_ti33x = " ti-crypto-examples cryptodev-module cryptodev-tests"
-- 
2.17.1


