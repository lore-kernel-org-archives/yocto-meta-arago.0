Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBB1C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 15:59:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1107.1685462354169076073
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 May 2023 08:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EQ7Zhe2b;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UFxBdW048910;
	Tue, 30 May 2023 10:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685462351;
	bh=0daTEVs1Xd1+3zqMqwBth5qzYjyBHmsQIp4UkzTeCMk=;
	h=From:To:CC:Subject:Date;
	b=EQ7Zhe2b2nFh0mMQQ5kd0uBkK806d2h2xBxhyIz5jNnIrjPtrCeMjnKxnBZwnmLZ6
	 bTmrBSnvAneZN8kQbZImDrH56S4qALZCL0H+5NXCocg31VNab0DVRCALPkZqhUZ9dG
	 C/wFDb2VJO57xbCBnk5gUxJ1JI+6zg0QD9icbIQw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UFxB0d042276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 10:59:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 10:59:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 10:59:11 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UFxBY3038506;
	Tue, 30 May 2023 10:59:11 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] tisdk-core-bundle: Do not try to deploy unsigned TF-A or OP-TEE images
Date: Tue, 30 May 2023 10:59:10 -0500
Message-ID: <20230530155910.35663-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 May 2023 15:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14478

These images are signed as part of U-Boot binman build now, so the base
images are unsigned and the .unsigned version are not created anymore.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index e412849c..20a9f3a7 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -10,7 +10,7 @@ require tisdk-core-bundle.inc
 DEPLOY_SPL_NAME:omapl138 = ""
 DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 
-DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.unsigned"
+DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x-gp-evm.itb"
-- 
2.39.2


