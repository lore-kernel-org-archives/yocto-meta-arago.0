Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619C8C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 08:07:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15069.1669190834170272965
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 00:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BF4XGFM+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN87Cqu018236
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Nov 2022 02:07:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669190832;
	bh=o+6hBLhWY3tg+TF8D6SuWeubozlSjn2283/xE0DCyko=;
	h=From:To:CC:Subject:Date;
	b=BF4XGFM++8mOIaDvRWwaaLbZ4x8/qCNVH5BUWUOmNG9T516MNXcfAGkYSqOUXRGat
	 8gweDObsRf5tTSD0HFqptkl3YFq3X9uRzyMVxrP6J9RNRYPrjV97Rp7DM+2H85LuIU
	 05ynzGZ3iAuIwsfhIUa1ENd68ImT9pZRnF+Q9t0M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN87Cha031593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 23 Nov 2022 02:07:12 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 23
 Nov 2022 02:07:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 23 Nov 2022 02:07:12 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN87BaA002573;
	Wed, 23 Nov 2022 02:07:12 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [dunfell][PATCH] recipes-tisdk: ti-tisdk-setup: Update commit hash for ti-tisdk-setup
Date: Wed, 23 Nov 2022 13:36:18 +0530
Message-ID: <20221123080618.5450-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Nov 2022 08:07:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14117

Update the commit hash for ti-tisdk-setup to pick up updates
in create-sdcard.sh and setup.sh scripts.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index b1c1485c..b1da7aaa 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 PR = "r47"
 
 BRANCH ?= "master"
-SRCREV = "eae21af9be4e7a0028045cc3e4038fe2157a266d"
+SRCREV = "8ae27de014cf02728f26bbbe7c9766ea25197e8f"
 SRC_URI = "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
2.17.1


