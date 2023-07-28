Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93648C04A94
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:20:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.22560.1690503636747996298
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ndM7d/uN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYvh027745;
	Thu, 27 Jul 2023 19:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690503635;
	bh=Doquf0me2kNvyyHhpz90nidA+6i3mi+itM7cDl+8vfg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ndM7d/uNVJW6aUUa+cVfoQ5UG34E/1Tl7VGX51B8rCeX3FXiFHcycQ3KW06pLHnU4
	 s6JjRyn3u58ZqmrYgAFdS410jj7aTHAv/CnZvkYD/ewONICE+jwrNnlNT4wlFpaXsh
	 ZzpaJE1FVISFleHsC9RegXN1UPCDnoH2NQ70XVKM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36S0KYjd081126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jul 2023 19:20:34 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jul 2023 19:20:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jul 2023 19:20:34 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36S0KYfH025363;
	Thu, 27 Jul 2023 19:20:34 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <afd@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Randolph
 Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 5/5] arago-tiny-image: add packagegroup-arago-boot to IMAGE_INSTALL
Date: Thu, 27 Jul 2023 19:20:32 -0500
Message-ID: <20230728002032.853330-6-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728002032.853330-1-rs@ti.com>
References: <20230728002032.853330-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jul 2023 00:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14811

From: Randolph Sapp <rs@ti.com>

This image install override is interesting. Perhaps we should move to
the separate build target distro configs like pokey uses [1] to avoid
configuration collisions while still allowing for some base image
templating through include files like arago-image.inc

[1] https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky-tiny.conf?h=kirkstone

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-tiny-image.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
index 242e763c..77ee9ea2 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -6,4 +6,5 @@ IMAGE_FEATURES:remove = "splash"
 
 IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
+	packagegroup-arago-boot \
 "
-- 
2.41.0


