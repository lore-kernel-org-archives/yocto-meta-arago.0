Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE15EC001DE
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 04:39:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5873.1691296791771757905
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 05 Aug 2023 21:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z/o+9MlP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3764dnmk018771;
	Sat, 5 Aug 2023 23:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691296789;
	bh=YzuBOmlwkRUVZ73GF07hKts148k+kf+iFm4J2iSBl10=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z/o+9MlPH6KnZBBe268grt8+jMPzuK1RDT1O40PyZDNAQPOKhyPNI70m93KkXZDpA
	 vsqv4NhHft4UO2BE5GOn91NqbXhjCV0G+TWDiBNQSZ5TiApEL15QZ1UVz+aS9M+nRY
	 N33xL+HXmZzsCBS1khhaCpaOn2noozY3/qzMZU+g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3764dnPB060010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 5 Aug 2023 23:39:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 5
 Aug 2023 23:39:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 5 Aug 2023 23:39:49 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3764dnHE027862;
	Sat, 5 Aug 2023 23:39:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qSVYT-000575-1r; Sat, 05 Aug 2023 23:39:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v3 2/2] tisdk-tiny-image: Add dependency on tisdk-tiny-initramfs
Date: Sat, 5 Aug 2023 23:39:48 -0500
Message-ID: <20230806043948.19613-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230806043948.19613-1-reatmon@ti.com>
References: <20230806043948.19613-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 06 Aug 2023 04:39:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14828

Even if we do not tell the build that the initramfs should be bundled
into the kernel, we want to build the initramfs with every build so that
it can be manually specified through alternative testing schemes.

Also, we no longer want to build the cpio from the tiny-image, that is
the purpose of the dedicated tisdk-tiny-initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add this missing patch to the series.
v3: Remove the cpio from the IMAGE_FSTYPES.

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


