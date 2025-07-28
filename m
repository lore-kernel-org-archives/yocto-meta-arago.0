Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2CAC83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 18:19:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.88768.1753726784318494969
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 11:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Mx9yK2xM;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SIJhoK2817349;
	Mon, 28 Jul 2025 13:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753726783;
	bh=LRQBqGz5rxqE/drFlrNq25zSAqcDZWPdtBl/ByrHEjw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Mx9yK2xM5anwF6YHkpaRp9MAfqOxQJ/86ntVEwddQKzM56MHS//qUuqPiFT5Q8BZO
	 zUUqgQRrXpo3ST2Al0u1akCF4DQoMmmEWHscSOoedsjPHaYc5ky1K67AMfro4uYXFz
	 ISPJW+90TYFDbhESWZtynPDjjZ6UPGa25p4Rh+5Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SIJhgO2199556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 13:19:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 13:19:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 13:19:42 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SIJgOH2180972;
	Mon, 28 Jul 2025 13:19:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 2/2] packagegroup-arago-base: Include OP-TEE packages again and remove test
Date: Mon, 28 Jul 2025 13:19:42 -0500
Message-ID: <20250728181942.579152-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250728181942.579152-1-afd@ti.com>
References: <20250728181942.579152-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 18:19:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16330

OPTEEOUTPUTMACHINE is no longer defined, instead add OP-TEE packages if
OPTEEMACHINE is defined. While here remove optee-test as that is added
by the ti-test packagegroup and not needed for "base" images.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 95e4250b..5cb4e30c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -58,7 +58,6 @@ ARAGO_EXTRA:append:arago = "\
 OPTEE_PKGS = " \
     optee-os \
     optee-client \
-    optee-test \
     optee-examples \
 "
 
@@ -68,7 +67,7 @@ RDEPENDS:${PN} = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
     ${ARAGO_BASE} \
     ${ARAGO_EXTRA} \
-    ${@bb.utils.contains_any('OPTEEOUTPUTMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
+    ${@"${OPTEE_PKGS}" if d.getVar('OPTEEMACHINE') else ""} \
 "
 
 RDEPENDS:${PN}:append:k3 = " ${OPTEE_PKGS}"
-- 
2.39.2


