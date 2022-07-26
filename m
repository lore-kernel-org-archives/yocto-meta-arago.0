Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEDAC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:39:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6061.1658839174875296533
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 05:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xGSYo5Wo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWDi096785;
	Tue, 26 Jul 2022 07:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658839172;
	bh=mayjnLPaDRwSr0p3ULyJ/03ErWyAIfCqoD849QbaVV4=;
	h=From:To:Subject:Date;
	b=xGSYo5WotJooKOPjd1A95hYigLgYiSFV+8fbuTB+IWltIQELqfNmLTuqOBCQNDeLe
	 6ebbu5iKu4r2rDrEcHPNMQIXgZAaZfsTZVShFKDbBRJPRUXgmMdwqQPrFV08pHbw3l
	 jmTGczBX5P59GOy8+QQSWj4ZywfkFfXGuVntFYUk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QCdWNO024646
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 07:39:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 07:39:31 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdVsx017969;
	Tue, 26 Jul 2022 07:39:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oGJqV-0005G1-Jo; Tue, 26 Jul 2022 07:39:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.04.00.005 release
Date: Tue, 26 Jul 2022 07:39:31 -0500
Message-ID: <20220726123931.20171-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Jul 2022 12:39:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13965

Updated the ltp-ddt version for 08.04.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 4aa39e06..4721a82b 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "54f4e2ef83734d7cc121fc4674914b592bef91b0"
+SRCREV = "e74ed6bb2429ddc28db969331d923a14fc6ff44b"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.17.1


