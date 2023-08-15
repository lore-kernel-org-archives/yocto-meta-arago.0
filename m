Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62F7C04A94
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:54:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.146843.1692136451693241133
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 14:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=taIsHwkm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FLsAnN106557;
	Tue, 15 Aug 2023 16:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692136450;
	bh=cngNd8vsiZyV/UH6uzlHcJ1pxJnEGOwa+Xdkh2alm1E=;
	h=From:To:Subject:Date;
	b=taIsHwkmvAcxaf2wyasfJVskwXVW7/sLsNUjKOOHpkYdKEHEy7zWlycjaZmhR5eWf
	 VYwQvulMGkkTALzFda0DhDKYrV5OAe70TDi4gJ8KYTuORzbI9ODn40KFNBlvuEz5C0
	 53nTBftHGFt5ylVmHsDXJrf1rbLyIefrF5r1MRvs=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FLsA3a039882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 16:54:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 16:54:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 16:54:10 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FLsAu4021974;
	Tue, 15 Aug 2023 16:54:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qW1zO-0006m6-1h; Tue, 15 Aug 2023 16:54:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] images: Remove VIRTUAL-RUNTIME_initramfs
Date: Tue, 15 Aug 2023 16:54:10 -0500
Message-ID: <20230815215410.25822-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14853

We no longer need to reference VIRTUAL-RUNTIME_initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc     | 1 -
 meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 1c87afd5..905f0191 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -11,7 +11,6 @@ EXTRA_IMAGECMD:ext2.gz += "-i 4096"
 
 IMAGE_INSTALL = " \
 	packagegroup-core-boot \
-	${VIRTUAL-RUNTIME_initramfs} \
 	${CORE_IMAGE_EXTRA_INSTALL} \
 "
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 1a31c9c7..a70a0201 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -13,7 +13,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    ${VIRTUAL-RUNTIME_initramfs} \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
     ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
 "
-- 
2.17.1


