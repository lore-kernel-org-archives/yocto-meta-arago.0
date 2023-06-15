Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB3BEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:28:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.24769.1686850099439014184
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 10:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NPtI4FU6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FHSFvR003661;
	Thu, 15 Jun 2023 12:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686850095;
	bh=BpE0UzBX7onv6FepW1Qy++u3eHpeJkM7yzL+EFc4zQA=;
	h=From:To:CC:Subject:Date;
	b=NPtI4FU6Ss5fU4t3jM4UUnCGqlTZYzA5F4ArNvePyVdr1wDA5+ByDCOsdDxVc43hi
	 T/uVb1IsE83TPksPf76nKVD7OH0Drv9s/IzTmJW39m41Q3VPpp1KSkOmDiClpFfsMV
	 2wf1dLUtNXwlCokRSfgeC/OvTHPwzItDw90GEDvQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FHSFKF069593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 12:28:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 12:28:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 12:28:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FHSF7g022837;
	Thu, 15 Jun 2023 12:28:15 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] ti-test-extras: add package group for large tests
Date: Thu, 15 Jun 2023 12:28:07 -0500
Message-ID: <20230615172807.673971-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jun 2023 17:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14636

From: Randolph Sapp <rs@ti.com>

This is required for images that expect ti-test to be installed but
actually use a ramdisk for primary storage. Piglit and the corresponding
cts tests are the real problems at the moment so we're moving those
first. Other tests may follow.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb   |  1 +
 .../recipes-core/packagegroups/ti-test-extras.bb | 16 ++++++++++++++++
 .../recipes-core/packagegroups/ti-test.bb        |  3 ---
 3 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 3b9747c1..bb825e09 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -12,6 +12,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
     ti-test \
+    ti-test-extras \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte','',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
new file mode 100644
index 00000000..6d69b165
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
@@ -0,0 +1,16 @@
+SUMMARY = "TI Testing packagegroup for big tests"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+ARAGO_TEST_EXTRAS = "\
+    piglit \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
+"
+
+RDEPENDS:${PN} = "\
+    ${ARAGO_TEST_EXTRAS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 210bc5a9..3e45077b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -38,9 +38,6 @@ ARAGO_TEST = "\
     nbench-byte \
     stream \
     cryptodev-tests \
-    piglit \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
 "
 
 ARAGO_TEST:append:armv7a = " \
-- 
2.41.0


