Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CF6C7EE39
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.22919.1750874773436107509
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hdBNlKRJ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6CTR2245816;
	Wed, 25 Jun 2025 13:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874772;
	bh=9k4M5rOPcnLpnjG0u2Dh+E0NvV/C2jkF9n2vjdrmgdY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hdBNlKRJuiFhZn8vjWdXjJxvGLv0ur0hj5i7x6j2neP9iZb6IrLB02SUwpytnxh45
	 f20jBUE96zkprXlA1wHfmXILVdW2uB4xf6X6Ne0zvz+IwFMPV6R3AHCzpyfmeOgfFP
	 hsOroHn3MYj2aeTAYN2rEgp6OvItb79XwUP/hOQA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6BJ01224507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6BuY4075099;
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUVf-0004bO-9t; Wed, 25 Jun 2025 13:06:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 3/5] meta-arago/all: set S to be in UNPACKDIR in recipes that explicitly set S
Date: Wed, 25 Jun 2025 13:06:08 -0500
Message-ID: <20250625180610.17641-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180610.17641-1-reatmon@ti.com>
References: <20250625180610.17641-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16269

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb         | 2 +-
 meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
index 7eda512b..cdcb9f48 100644
--- a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
+++ b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://libloki.sourcearchive.com/downloads/${PV}-3/${BPN}_${PV}.orig.
 SRC_URI[md5sum] = "af532c24a7f2e12d0829be8201934d92"
 SRC_URI[sha256sum] = "0c2094ce916b106731c8be61c32f538a22e1c0f8398bd5d6295b13d08e0c41a3"
 
-S = "${WORKDIR}/${BPN}-${PV}.orig"
+S = "${UNPACKDIR}/${BPN}-${PV}.orig"
 
 do_configure () {
     sed -i -e 's|^prefix.*$|prefix := ${D}${prefix}|g' ${S}/Makefile.common
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb b/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
index 54c6b0fc..11062713 100644
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
+++ b/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
@@ -14,7 +14,7 @@ SRC_URI:append:arm = " file://0001-autoconf-fix-for-cross-compilation-for-ARM.pa
 SRC_URI[md5sum] = "3e58772e8647093b1de2f2c90bfb9ee8"
 SRC_URI[sha256sum] = "ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc55a349b3bff4e3b13"
 
-S = "${WORKDIR}/input-1.0"
+S = "${UNPACKDIR}/input-1.0"
 
 do_compile () {
     oe_runmake
-- 
2.17.1


