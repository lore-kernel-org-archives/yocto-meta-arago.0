Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFC5C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 20:55:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.145333.1692132953086606968
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 13:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U8HbKKv1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FKtplF002316;
	Tue, 15 Aug 2023 15:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692132951;
	bh=PvvgQ/wfdl7hzVAUIy/V7VwDaoZJB35mKbpYoatLsI0=;
	h=From:To:Subject:Date;
	b=U8HbKKv1LelOp93qMsdfVHg1nqGMljKzWwbsUfODpZUxSP79UD1hYPAfaRzHPnriy
	 pxl0aOemYRQcfVP/30WxZwM/fdUamEOpr4zOQG44UnxI14eI2IWG+JZwauFzoRh8nl
	 zIBHjubssvKrUXm9g7ByC3T2Z104Ea2NerHpq5iY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FKtpAe075402
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 15:55:51 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 15:55:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 15:55:51 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FKtp5R100233;
	Tue, 15 Aug 2023 15:55:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qW14x-0006a4-0F; Tue, 15 Aug 2023 15:55:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Disable INITRAMFS_MAXSIZE
Date: Tue, 15 Aug 2023 15:55:50 -0500
Message-ID: <20230815205550.25257-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 20:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14845

We are seeing an increase in almost all files between kirkstone and
master.  While we investigate we want to go ahead and take the previous
patches as the basis for moving forward.  So we are temporarily
disabling the INITRAMFS_MAXSIZE check.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/images/tisdk-tiny-initramfs.bb              | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index 0bea8276..242a34c7 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -16,8 +16,9 @@ inherit remove-boot-dir
 IMAGE_FEATURES:remove = "package-management"
 
 INITRAMFS_FSTYPES = "cpio cpio.xz"
-INITRAMFS_MAXSIZE = "65536"
-IMAGE_OVERHEAD_FACTOR = "1"
+
+#INITRAMFS_MAXSIZE = "65536"
+#IMAGE_OVERHEAD_FACTOR = "1"
 
 IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
-- 
2.17.1


