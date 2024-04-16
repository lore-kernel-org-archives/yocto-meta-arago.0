Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBCFC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:23:29 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.13777.1713248606912482019
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 23:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IjbvjFPZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43G6NOvF049025;
	Tue, 16 Apr 2024 01:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713248604;
	bh=7ZUxK7k/KJRVK1VWvwDFKXhkozO9OUuS7b43rFhUBds=;
	h=From:To:CC:Subject:Date;
	b=IjbvjFPZrQccHsevvTnY57tPxYGe4k5xy3JFcNCqsbKkCwZ5vpyGXBSJeeMuMNrl7
	 y5JiLpsD/5BTkmQG3D2KynN2nW31KcB+O2opkptP70cRtMZnCQgzm+Ad7M495+ops2
	 ziM2V83ENkvPCRQzhafCXX9+XYK3mebG5Q1zEGrs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43G6NNQA101587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 01:23:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 01:23:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 01:23:23 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43G6NMdP067537;
	Tue, 16 Apr 2024 01:23:23 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-extras: packagegroups: Fix QA Issue
Date: Tue, 16 Apr 2024 11:53:17 +0530
Message-ID: <20240416062317.223194-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 06:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15288

- Since packagegroup.bbclass is using inherit_defer in oe-core, some classes are
now appearing after nativesdk resulting in following QA errors.

 ```
  QA Issue: nativesdk-packagegroup-arago-tisdk-host: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: allarch.bbclass [native-last]
  QA Issue: nativesdk-packagegroup-arago-qte-toolchain-host: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: allarch.bbclass [native-last]

 ```

- To fix this issue, use inherit_defer that was added in bitbake recently [1].

[1]: https://github.com/openembedded/bitbake/commit/5c2e840eafeba1f0f754c226b87bfb674f7bea29

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../nativesdk-packagegroup-arago-qte-toolchain-host.bb         | 3 ++-
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
index 4d2a98ad..23c45abf 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Host packages for Qt Embedded SDK"
 PR = "r10"
 LICENSE = "MIT"
 
-inherit packagegroup nativesdk
+inherit packagegroup
+inherit_defer nativesdk
 
 RDEPENDS:${PN} = "\
     nativesdk-packagegroup-arago-tisdk-host \
diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 7e77d12f..92a80b6b 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -2,7 +2,8 @@ SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
 PR = "r2"
 LICENSE = "MIT"
 
-inherit packagegroup nativesdk
+inherit packagegroup
+inherit_defer nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-- 
2.34.1


