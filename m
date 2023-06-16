Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3D9EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 15:47:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2233.1686930460620006765
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 08:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uH41nwT1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35GFlaXf058171;
	Fri, 16 Jun 2023 10:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686930456;
	bh=v//4XOwQPyISB6+oAN5Bv3/PDI7guH7zOOTat7V6AKg=;
	h=From:To:CC:Subject:Date;
	b=uH41nwT17b6Yey/NreTlnzEj3mR5shbKoxcld1T6chHgsLTyGTdhR/A+7ZiaZjQXt
	 5ru05Qf1aSo+3Mv9fanIWRgrJ7Ul6pTzguGV4obmne3HPK7BFYetmBY+zHarvk2XjT
	 //jOUu/muf1x+CLicGHTEuIIl+csl41TP4an7tNI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35GFlagS099068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jun 2023 10:47:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Jun 2023 10:47:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Jun 2023 10:47:36 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35GFla7A019435;
	Fri, 16 Jun 2023 10:47:36 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirktone][PATCH] ti-test-extras: merge recipe with ti-test
Date: Fri, 16 Jun 2023 10:47:27 -0500
Message-ID: <20230616154727.1329965-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 15:47:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14644

From: Randolph Sapp <rs@ti.com>

Merge the ti-test-extras recipe with ti-test.

Fixes:
8b957a07 (ti-test-extras: add package group for large tests, 2023-06-15)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/packagegroups/ti-test-extras.bb | 16 ----------------
 .../recipes-core/packagegroups/ti-test.bb        | 12 ++++++++++++
 2 files changed, 12 insertions(+), 16 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
deleted file mode 100644
index 6d69b165..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "TI Testing packagegroup for big tests"
-LICENSE = "MIT"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-ARAGO_TEST_EXTRAS = "\
-    piglit \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
-"
-
-RDEPENDS:${PN} = "\
-    ${ARAGO_TEST_EXTRAS} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 3e45077b..f97ad756 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -40,6 +40,12 @@ ARAGO_TEST = "\
     cryptodev-tests \
 "
 
+ARAGO_TEST_EXTRAS = " \
+    piglit \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
+"
+
 ARAGO_TEST:append:armv7a = " \
     cpuburn-neon \
 "
@@ -97,3 +103,9 @@ RDEPENDS:${PN} = "\
     ${ARAGO_TEST} \
     ${ARAGO_TI_TEST} \
 "
+
+# Package group for things that should only be present in tisdk-default-image
+PACKAGES += " ${PN}-extras"
+RDEPENDS:${PN}-extras = "\
+    ${ARAGO_TEST_EXTRAS} \
+"
-- 
2.41.0


