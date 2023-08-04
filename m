Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57630C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 14:25:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12419.1691159140938121722
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Aug 2023 07:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z8461wmO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 374EPcCg119373;
	Fri, 4 Aug 2023 09:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691159138;
	bh=j9glTxLL9AGDuH7oNz3wGWFRwTzDXTnDsTJlxew3+wY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z8461wmOHg7AVWkGp4dTPsy+8weVs+GBUjr5k8TZDUwgMjvjKMlshRBGQjbJUOEci
	 rYe5w8HN8FdakF3WHsmxGp3DO61z7fOZGOBW88HapULfoo+du9QCHP6UAWS9/zRkTr
	 rFMuUCUqRfgUEfGsQF4fohJMW0UwAy9ZFo45o9OQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 374EPcOR004231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Aug 2023 09:25:38 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Aug 2023 09:25:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Aug 2023 09:25:37 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 374EPbUa004741;
	Fri, 4 Aug 2023 09:25:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qRvkH-0005kp-Js; Fri, 04 Aug 2023 09:25:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2 3/3] tisdk-tiny-image: Add dependency on tisdk-tiny-initramfs
Date: Fri, 4 Aug 2023 09:25:37 -0500
Message-ID: <20230804142537.22072-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230804142537.22072-1-reatmon@ti.com>
References: <20230804142537.22072-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Aug 2023 14:25:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14819

Even if we do not tell the build that the initramfs should be bundled
into the kernel, we want to build the initramfs with every build so that
it can be manually specified through alternative testing schemes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add this missing patch to the series.

 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 1f63ca0b..12e73876 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -23,4 +23,6 @@ IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
+DEPENDS += " tisdk-tiny-initramfs"
+
 export IMAGE_BASENAME = "tisdk-tiny-image"
-- 
2.17.1


