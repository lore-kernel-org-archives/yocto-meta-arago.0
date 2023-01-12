Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFF2C46467
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 01:53:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.44373.1673488430161534877
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 17:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JIZgT5RZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30C1rmdT079448;
	Wed, 11 Jan 2023 19:53:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673488428;
	bh=R+JT1nV4CUH+k9WCBWoExBrRwO/gk5Lj8e6YejvK5CE=;
	h=From:To:Subject:Date;
	b=JIZgT5RZsEi3KgBihDmHd5sBP6MdS9zKGLzzofvOV9YXr8hNyanO1a4Wj7eP3fzPg
	 TWbcZiRrSr/jRsLoSl5JlCDLE0bx4TWsjzYMhNodaM/TIrp1HG5/gJj96TmrshL1fB
	 pjXkRhrKAtbrAb/CzqFehelZ+0Q4pvvhaADAyk8k=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30C1rmPH026641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 19:53:48 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 19:53:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 19:53:48 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30C1rmxq028020;
	Wed, 11 Jan 2023 19:53:48 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pFmmq-0007ZF-2g; Wed, 11 Jan 2023 19:53:48 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Deploy the unsigned versions of bl31 and bl32
Date: Wed, 11 Jan 2023 19:53:48 -0600
Message-ID: <20230112015348.29047-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Jan 2023 01:53:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14165

In addition to releasing the signed versions of the bl31.bin and
bl32.bin files, also release the unsigned original versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 6df454fc..aa3c3b5b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -15,7 +15,7 @@ DEPLOY_SPL_NAME_k2e = ""
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
 DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
-DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
+DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin bl31.bin.unsigned bl32.bin.unsigned"
 DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
-- 
2.17.1


