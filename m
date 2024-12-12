Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF766E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:56:11 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.21374.1734015362445943189
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Dec 2024 06:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G5SLzZ1N;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BCEu1Tm3261470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 08:56:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734015361;
	bh=ypURLxEOY/hHsdUKk7D35RCbvlh1aKDgmblDyESeKXM=;
	h=From:To:CC:Subject:Date;
	b=G5SLzZ1NhfA8HqgL6mthCEmDPHSLdjfB+Swlu3pT9Y2eUB/pzT7B9kQ9VCrStT13R
	 EGixiVm6P54/99cmcR2d5e6yTGAzIBoETN1RPNWsY0XITDfVbTcrDyUyKTfVbRYhnn
	 Llb8p2s+pab1Cis7YOl4cG8mKnEJ1YNkyE8M2um8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BCEu1gX008313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Dec 2024 08:56:01 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Dec 2024 08:56:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Dec 2024 08:56:00 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BCEu0b3119322;
	Thu, 12 Dec 2024 08:56:00 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] images: Remove unneeded removal of ubi images from omapl138
Date: Thu, 12 Dec 2024 08:56:00 -0600
Message-ID: <20241212145600.11989-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Dec 2024 14:56:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15652

This machine does not add these image types to begin with, so
no change is made.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb  | 4 ----
 .../recipes-core/images/tisdk-thinlinux-image.bb              | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index faae53d3..6c46c423 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -31,10 +31,6 @@ IMAGE_INSTALL += "\
 
 export IMAGE_BASENAME = "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
 
-# Disable ubi/ubifs as the filesystem requires more space than is
-# available on the HW.
-IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
-
 EXTRABROWSERS = " \
     qtwebbrowser-examples \
     qtwebengine-qmlplugins \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index 34494976..5d1c26d8 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -22,7 +22,3 @@ IMAGE_INSTALL += "\
 "
 
 export IMAGE_BASENAME = "tisdk-thinlinux-image${ARAGO_IMAGE_SUFFIX}"
-
-# Disable ubi/ubifs as the filesystem requires more space than is
-# available on the HW.
-IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
-- 
2.39.2


