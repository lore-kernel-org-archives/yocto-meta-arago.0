Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3662AC87FCB
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 18:39:29 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.88844.1753727966203202140
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 11:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xmRGXuTn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SIdNPJ2788071;
	Mon, 28 Jul 2025 13:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753727963;
	bh=fziG/i1axlMov9bvo8eXs8lyAGs1zaBAhT3VrnEVFy4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xmRGXuTnjRQImTu+7TL4czvNJBsxCQ0y0dq0eJjPFrGt6LpSoUBTRiTl/oaBnlARI
	 bJae0xmwW++c4hi27OVHslJGQMOZKoeJPR77BxCIrpWtVY9Y3NNTVRdzDf9HCDAoqy
	 Lu5BOunhd7hODn1Ed2EitRT56eCusGTm7oTO4wq8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SIdNBh2209014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 13:39:23 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 13:39:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 13:39:23 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SIdNf42501453;
	Mon, 28 Jul 2025 13:39:23 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/2]  packagegroup-arago-tisdk-amsdk-sdk-host: Remove this recipe
Date: Mon, 28 Jul 2025 13:39:22 -0500
Message-ID: <20250728183922.580652-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250728183922.580652-1-afd@ti.com>
References: <20250728183922.580652-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 18:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16334

This recipe only now exists to add "tisdk-uenv" to tisdk-core-bundle
images so uEnv.txt can be packaged into prebuilt-images. We only need
to package the uEnv.txt as a "prebuilt-image" if some bundled image
includes it, no need to manually add this for all images.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/tisdk-core-bundle.inc    |  4 ----
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb   | 16 ----------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 43b1ef5f..5f72e7b0 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -33,7 +33,3 @@ TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisd
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
-
-IMAGE_INSTALL = "\
-    packagegroup-arago-tisdk-amsdk-sdk-host \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
deleted file mode 100644
index 9562310f..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Task to install additional scripts and applications into the SDK"
-LICENSE = "MIT"
-PR = "r30"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-EXTRA_FILES = ""
-EXTRA_FILES:ti43x = "tisdk-uenv"
-EXTRA_FILES:omap-a15 = "tisdk-uenv"
-EXTRA_FILES:k3 = "tisdk-uenv"
-
-RDEPENDS:${PN} = "\
-    ${EXTRA_FILES} \
-"
-- 
2.39.2


