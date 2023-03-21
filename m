Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FEEC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 11:14:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10363.1679397252253583456
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 04:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xb7Ula8i;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LBE6Fv054445;
	Tue, 21 Mar 2023 06:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679397246;
	bh=a+KRlCng3VGEFZayMk6A0bFpLClyhM0QX/bYZSo3YmI=;
	h=From:To:CC:Subject:Date;
	b=xb7Ula8iTry2iAYi1P2MvI6eIwL+25Fl2T7eRgc/Eori1ftTz+1hf2rQgAGke9OI9
	 R0QtmW06VLpXjNmJ/yKwUr9i5EYnp+Uhlj7Csqx9xumV8/iepLf4Okz8PjneZtXq9N
	 BIzC11oDLdG5O+kD2d4BjrR4+//59hsOp72g4gLk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LBE6mc005077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Mar 2023 06:14:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 06:14:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 06:14:05 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LBE4SB094324;
	Tue, 21 Mar 2023 06:14:05 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <g-gupta@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell/kirkstone][PATCH] tisdk-core-bundle: AM65x: Deploy sysfw.itb for SR2.0, SR1.0 GP and HS
Date: Tue, 21 Mar 2023 16:44:02 +0530
Message-ID: <20230321111402.26620-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Mar 2023 11:14:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14264

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

am65xx-evm machine will build for SR2.0, SR1.0 HS and GP platforms.
So deploy the sysfw.itb binaries for all 4 platforms.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index aa3c3b5b..d51f4ffe 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -19,7 +19,7 @@ DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.unsigned"
 DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
+DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x_sr2-gp-evm.itb sysfw-am65x_sr2-hs-evm.itb sysfw-am65x-gp-evm.itb sysfw-am65x-hs-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


