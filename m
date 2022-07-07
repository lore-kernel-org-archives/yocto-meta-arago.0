Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B20CCA480
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 20:26:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.2646.1657225587644904908
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 13:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DizI22ff;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267KQQrO098962;
	Thu, 7 Jul 2022 15:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657225586;
	bh=FJYE6OcQq6QVf2ltQcHpK56R7Eo2/HygrlLlj4GUuSs=;
	h=From:To:Subject:Date;
	b=DizI22ff5I2dskczDj43htO2PbRh+dCJ0uqoGzLaxFGHuJYP5xTmVBbEXKKFc1sYB
	 kYa0Oa2hsCCBQkcfWD4YYHakudV/VgN2UHKMJ9Nn6qeYrkMv1sMDX/uHJ2bU4qeGAU
	 8ZnJuB5kw2rZsZ9gkC4Fyq6t/Wyv719zrzRx9BEU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267KQQC9017004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Jul 2022 15:26:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 15:26:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 15:26:26 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267KQQGW109019;
	Thu, 7 Jul 2022 15:26:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o9Y4w-0005b6-Dl; Thu, 07 Jul 2022 15:26:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.04.00.004 release
Date: Thu, 7 Jul 2022 15:26:26 -0500
Message-ID: <20220707202626.21475-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Jul 2022 20:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13943

Updated the ltp-ddt version for 08.04.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 04385e23..8a6f6c98 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "f6d83ac3370b693481442a42060ba59a63e87550"
+SRCREV = "54f4e2ef83734d7cc121fc4674914b592bef91b0"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.17.1


