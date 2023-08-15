Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C145CC001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:48:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.146705.1692136095178169389
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 14:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sYqnuQg9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FLmD73016692;
	Tue, 15 Aug 2023 16:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692136093;
	bh=X1l5E/iKP+QflwVGA55thGcEwsyAkYRi53Cl/jdlsWY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sYqnuQg91eEBz0xVUQKzYaduvDbzuUYwM8hgmnw0PL2DXgFmJMnZYboqG76lhW7Gx
	 zu9o5aMrm/jsKwy79erTWoCsa047i8ph72kQU5oHfeZbimrGfkCjZCs0UKJNYXdnOw
	 +91CmByVQKhnpTm1daXqndNHsY4FZCXmNGd5V1vw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FLmDRK036135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 16:48:13 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 16:48:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 16:48:13 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FLmDYv016599;
	Tue, 15 Aug 2023 16:48:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qW1tc-00057i-Vp; Tue, 15 Aug 2023 16:48:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v4 2/2] tisdk-tiny-image: Add dependency on tisdk-tiny-initramfs
Date: Tue, 15 Aug 2023 16:48:12 -0500
Message-ID: <20230815214812.19652-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230815214812.19652-1-reatmon@ti.com>
References: <20230815214812.19652-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14852

Even if we do not tell the build that the initramfs should be bundled
into the kernel, we want to build the initramfs with every build so that
it can be manually specified through alternative testing schemes.

Also, we no longer want to build the cpio from the tiny-image, that is
the purpose of the dedicated tisdk-tiny-initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Remove the cpio from the IMAGE_FSTYPES.
v2: Add this missing patch to the series.

 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 8117ebc5..c8a584bd 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -14,10 +14,10 @@ require arago-tiny-image.inc
 
 IMAGE_FEATURES:remove = "package-management"
 
-IMAGE_FSTYPES += "cpio cpio.xz"
-
 IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
+DEPENDS += " tisdk-tiny-initramfs"
+
 export IMAGE_BASENAME = "tisdk-tiny-image"
-- 
2.17.1


