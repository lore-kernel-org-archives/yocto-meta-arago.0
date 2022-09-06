Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6597ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 18:14:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2682.1662488095489997601
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 11:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T0atQw09;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286IErUO062505;
	Tue, 6 Sep 2022 13:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662488093;
	bh=L2CQ6sGepvFldnidZZ6xr4t+hErQB06n2E2PEJlJGKo=;
	h=From:To:CC:Subject:Date;
	b=T0atQw09N6xBwltyUpsak6G89R5WNwSpZt7Dddvt8m2dSOktAQxDtHJs2FTSYE1BZ
	 peLsqxoR4YzM1Ljgl+gvrSejsUzdmWXUkkZyfjJ3APUASRDUYssYCk0FaQTp27Z/v2
	 L9XV+wbwfFBv6x7Pg87IXBVk/uND6HBWsaQR1f6A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286IErOv013372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Sep 2022 13:14:53 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 13:14:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 13:14:53 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286IEqgF062003;
	Tue, 6 Sep 2022 13:14:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell][PATCH] packagegroup-arago-base-tisdk: Add
 optee-examples
Date: Tue, 6 Sep 2022 13:14:52 -0500
Message-ID: <20220906181452.19031-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Sep 2022 18:14:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13983

This includes demos of secure storage that we can use for testing DKEK and
RPMB support. Add this package next to the other OP-TEE support packages.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 551e0230..c32a11f0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -9,6 +9,7 @@ inherit packagegroup
 OPTEE_PKGS = " \
     optee-client \
     optee-test \
+    optee-examples \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.36.1


