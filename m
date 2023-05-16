Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC804C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:41:03 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26951.1684255256889435024
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Hl56EYTq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGesut075603;
	Tue, 16 May 2023 11:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255254;
	bh=PdikDMA7kveXm1hdL51bSPA3hPo/FA0DPBpXe6LSW1U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Hl56EYTq7647yBy4SW1E/bgkv3VTLmF4ldU9NCG2tHV0CwNP+Vk4qwuXvan5k0hc3
	 /uyfem+Z4gigoTMbcQWUYHGZctDjurp1/3kMoRVj05ZlOa/mLGlyOKZs/+xPt4Gw1G
	 cB1QABOaIl8h6Z2EY2ypx/IfUMT+xi7hjyDtGwg0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGesRF087175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:40:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:40:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:40:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGeswt002901;
	Tue, 16 May 2023 11:40:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxjK-000381-Bf; Tue, 16 May 2023 11:40:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 1/6] tisdk-core-bundle: Fix am65xx sysfw names
Date: Tue, 16 May 2023 11:40:49 -0500
Message-ID: <20230516164054.11978-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164054.11978-1-reatmon@ti.com>
References: <20230516164054.11978-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14410

k3_image_gen added the suffix to the sysfw binary to differentiate
between GP and HS binaries.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 2a8eb9ef..bf7ed2d4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -13,7 +13,7 @@ DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.unsigned"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
+DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x-gp-evm.itb sysfw-am65x_sr2-gp-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


