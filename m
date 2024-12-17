Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C43E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:02:10 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.91647.1734469328809152265
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 13:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KkCBO1rp;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL27KO4020552
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 15:02:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469327;
	bh=kCSlOD9ZUqVBi4raMZxbE1Az3EkbZMbN6BfEg6oy2+0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KkCBO1rpU0u+COaV5CblcVVsbYIcY6UYM6c3rXEd5uGSQh7mslJ9lnX3okmu/tOWv
	 09Qa8gsRmcMQ3C9t5WJxQYWGke2DsXfjq+cQAono3AhJj3L6kM5Ss8yX91zGgiB7mQ
	 GSAeem1Qdmd4Ko56Pf9vwV9jXvneRDc5B39XptiM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL27nk008320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:02:07 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:02:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:02:07 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL262b042172;
	Tue, 17 Dec 2024 15:02:07 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/3] ti-demos: Remove this packagegroup
Date: Tue, 17 Dec 2024 15:02:05 -0600
Message-ID: <20241217210206.47052-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217210206.47052-1-afd@ti.com>
References: <20241217210206.47052-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Dec 2024 21:02:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15665

Having a packagegroup for a single package isn't really needed.
If we end up with more demos and want to collect them we can do
that when needed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb         |  2 +-
 .../recipes-core/packagegroups/ti-demos.bb             | 10 ----------
 .../recipes-core/packagegroups/ti-world.bb             |  2 +-
 3 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index faae53d3..ce3c3879 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -24,7 +24,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
-    ti-demos \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','pdm-anomaly-detection','', d)} \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
     packagegroup-arago-tisdk-sysrepo \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
deleted file mode 100644
index 91e469e7..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "TI World packagegroup"
-LICENSE = "MIT"
-
-inherit packagegroup
-
-PDM_ANOMALY = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
-
-RDEPENDS:${PN} = "\
-    ${PDM_ANOMALY} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 438dd8d0..96bfcac8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -50,6 +50,6 @@ RDEPENDS:${PN} = "\
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     packagegroup-arago-misc \
-    ti-demos \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','pdm-anomaly-detection','', d)} \
     ${PREFERRED_PROVIDER_virtual/docker} \
 "
-- 
2.39.2


