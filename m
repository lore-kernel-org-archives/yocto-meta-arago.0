Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4A5C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 15:29:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17572.1685546989142031667
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 May 2023 08:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xVMKd2iL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34VFTmQB021490;
	Wed, 31 May 2023 10:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685546988;
	bh=4eddSbUXuf4dLL/i82wJaZWskiIpZtfb5TJ2e+C8u08=;
	h=From:To:CC:Subject:Date;
	b=xVMKd2iLixorlQG+eyGMvYARy1eaRBTK87XR6SKpdT7/B/PJJekUrUhDxXaZje1iN
	 ddYsHGBPTg01W3rvpYdjEWCNFFXsras1eQIL7zB/9G9209rA+fmPpc7f0XAFfM0ruE
	 p0ksBlX5P1oDBQr19R8CVFZ0MlAeSCgCw4kCsdiE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34VFTmQA025576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 May 2023 10:29:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 31
 May 2023 10:29:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 31 May 2023 10:29:47 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34VFTlj8015881;
	Wed, 31 May 2023 10:29:47 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] tisdk-core-bundle: Update GP to SR2 firmware
Date: Wed, 31 May 2023 10:29:46 -0500
Message-ID: <20230531152946.149716-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 May 2023 15:29:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14482

SR2.0 firmware binaries should be used here as SR1.0 has been descoped.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 20a9f3a7..9adb4f93 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -13,7 +13,7 @@ DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x-gp-evm.itb"
+DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x_sr2-gp-evm.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-hs-evm = " sysfw-am65x_sr2-hs-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
-- 
2.39.2


