Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF80AC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:31:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1037.1675899106822186500
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PWu7KPcd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NVi9U059178;
	Wed, 8 Feb 2023 17:31:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899104;
	bh=g5OADMl8kv1fq6klKBPRpDDerRFy5wAJ5PRUQUhrdck=;
	h=From:To:CC:Subject:Date;
	b=PWu7KPcdSSF9BvqXysw/0a8IvNNLzMBXgcMgGLop8Fq4K6nVZNLL9reKq82/gvgFQ
	 dl8DF1IIenj7k8imOmHXB5oIbM1rvUtm5iQeWYYM7BpVaQ5GelMAilWQhp7BdsA4FX
	 X0WKcZckfurEuXLgFjXS2cp4/LQX/vzs9WV5UVzs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NViSg023574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:31:44 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:31:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:31:44 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NVij3045786;
	Wed, 8 Feb 2023 17:31:44 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] packagegroups: crypto: Add Cryptodev support for all machines
Date: Wed, 8 Feb 2023 17:31:44 -0600
Message-ID: <20230208233144.18368-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14205

This works and is useful for all machines, including K3. Add support
for the Cryptodev modules and tests unconditionally.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb          | 7 ++-----
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb       | 7 ++-----
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb    | 1 +
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 01b20759..ff72c007 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,15 +1,12 @@
 DESCRIPTION = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-CRYPTO_API = ""
-CRYPTO_API:ti33x = "cryptodev-module-dev"
-CRYPTO_API:ti43x = "cryptodev-module-dev"
-CRYPTO_API:dra7xx = "cryptodev-module-dev"
+CRYPTO_API = "cryptodev-module-dev"
 
 RDEPENDS:${PN} = "\
     openssl-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index d2189a50..30224244 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,12 +11,9 @@ CRYPTO_SUPPORT = "\
     openssl-bin \
     openssl-conf \
     openssl-engines \
+    cryptodev-module \
 "
 
-CRYPTO_SUPPORT:append:ti33x = " cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT:append:ti43x = " cryptodev-module cryptodev-tests"
-CRYPTO_SUPPORT:append:dra7xx = " cryptodev-module cryptodev-tests"
-
 RDEPENDS:${PN} = "\
     ${CRYPTO_SUPPORT} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index da52d47a..73250ac8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -38,6 +38,7 @@ ARAGO_TEST = "\
     openntpd \
     nbench-byte \
     stream \
+    cryptodev-tests \
 "
 
 ARAGO_TEST:append:armv7a = " \
-- 
2.39.1


