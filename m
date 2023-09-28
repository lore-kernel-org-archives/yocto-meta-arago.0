Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F18E732E5
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:19:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.16004.1695914379304339178
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 08:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EvN9asOK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38SFJb3i104219;
	Thu, 28 Sep 2023 10:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695914377;
	bh=bwP6i9so+roHeiusEtTcKHEtYlzeF2idQpWv5XI2+z0=;
	h=From:To:CC:Subject:Date;
	b=EvN9asOK+HMwILMB7Q2IETqwUVek6o9S2JupXRHGKcJKza6U2HniWYtNv2YutZzoS
	 NZoiiuhCmLAl8up121DmbWj0LqpcB+XC+1pzCL9UiiWfj9u1vSC/cQmoBHgAoVY8Qd
	 ntq1OHtj+0g9JRUeseN7N346Kr1kiunS1BSTG6Ks=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38SFJbQc032436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Sep 2023 10:19:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Sep 2023 10:19:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Sep 2023 10:19:37 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38SFJaGf082742;
	Thu, 28 Sep 2023 10:19:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] packagegroups: crypto: Add pkcs11 tools and example TAs
Date: Thu, 28 Sep 2023 10:19:35 -0500
Message-ID: <20230928151935.18921-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Sep 2023 15:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14906

The OP-TEE package contains some loadable TAs including one used for
pkcs11, add this package to the base image.

To make use of the PKCS#11 API (Cryptoki) that this TA provides, one
can use libckteec already included with optee-client. An example
app that can make use of that library is pkcs11-tool which is part of
opensc. Add this package also.

For example, try:

$ pkcs11-tool --show-info --module /usr/lib/libckteec.so.0

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb  | 1 +
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 03e5a5f9..00f6db61 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -7,6 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 OPTEE_PKGS = " \
+    optee-os \
     optee-client \
     optee-test \
     optee-examples \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 30224244..ec30942b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -12,6 +12,7 @@ CRYPTO_SUPPORT = "\
     openssl-conf \
     openssl-engines \
     cryptodev-module \
+    opensc \
 "
 
 RDEPENDS:${PN} = "\
-- 
2.39.2


