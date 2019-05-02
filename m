Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6BA04529CA
	for <meta-arago@arago-project.org>;
	Thu,  2 May 2019 21:40:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x42Le6ab033496
	for <meta-arago@arago-project.org>; Thu, 2 May 2019 16:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556833206;
	bh=Nua8ydwe0RFGwrBQ1w1pjlyb3g1jQIY7AJTZeQdvnzI=;
	h=From:To:CC:Subject:Date;
	b=qsj9WY1QzUa0wToQDb1TyypQ3FFZnw55+UJwiKWnhKWkzOydRY8Gb2IdkmKQtfoJ6
	15vd5RebvOel0ss+xjgWZY02C9UjC9kXz4XUJjNJePAiV/gcj+3r1csAsVmn7ZdxUQ
	Yn65yZkzap963AZJQPZU5jRjceB/fe+HWqqblFgE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x42Le6aa007973
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 2 May 2019 16:40:06 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 2 May 2019 16:40:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 2 May 2019 16:40:05 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x42Le5t3096433;
	Thu, 2 May 2019 16:40:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 May 2019 21:29:13 +0000
Message-ID: <20190502212913.28231-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] openssl10, packagegroup-crypto: un-clash and install 1.0 binaries and engines
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
X-List-Received-Date: Thu, 02 May 2019 21:40:33 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - remove *.so in libdir, so dev packages won't clash

 .../openssl/openssl10_%.bbappend                     | 12 ++++++++++++
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb |  4 +++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
index e74bcba6..21fcb3e4 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
@@ -13,3 +13,15 @@ CRYPTODEV_AFALG_PATCHES = " \
 "
 
 SRC_URI += "${CRYPTODEV_AFALG_PATCHES}"
+
+# override this from upstream to preserve engine libs, binaries and config
+# w/o clashing with 1.1
+openssl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc`; do
+                rm $file
+        done
+        rm ${PKGD}${libdir}/*.so
+        mv ${PKGD}${bindir}/openssl ${PKGD}${bindir}/openssl10
+        mv ${PKGD}${bindir}/c_rehash ${PKGD}${bindir}/c_rehash10
+        mv ${PKGD}${sysconfdir}/ssl/openssl.cnf ${PKGD}${sysconfdir}/ssl/openssl10.cnf
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


