Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA74DC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 22:49:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.39.1653086931609480467
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 May 2022 15:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Praj9upL;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24KMmnlP108273;
	Fri, 20 May 2022 17:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653086929;
	bh=Xaon9j+5647uiaFN7HulEhnNL8QlTYAYLgNHuN1F2Zk=;
	h=From:To:Subject:Date;
	b=Praj9upLtlrbBMo5r7CwgGe8fhch61XmDg7eFsg2pNqUNwzxxN64qOJ+UTATRod/m
	 9TGgwQo78LtsNshlKlZ50Mr01p62cs8MEIlUXpYw7MpvY3pOvWwgc25QRzh/AgnZfQ
	 dhfognPCtJfaggDMkOTv+QOIAI6rDSyEiekVYZyY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24KMmnP3026583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 May 2022 17:48:49 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 20
 May 2022 17:48:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 20 May 2022 17:48:49 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24KMmnaC082266;
	Fri, 20 May 2022 17:48:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nsBQP-0007yf-2u; Fri, 20 May 2022 17:48:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v3] ti-tisdk-setup: Bump to 08.03.00.005
 release
Date: Fri, 20 May 2022 17:48:49 -0500
Message-ID: <20220520224849.30624-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 May 2022 22:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13875

Updated the ti-tisdk-setup version for 08.03.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Fix git URL again...
v2: Fix git URL.

 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 14fd3fc1..67c57f39 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 PR = "r47"
 
 BRANCH ?= "master"
-SRCREV = "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
-SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
+SRCREV = "eae21af9be4e7a0028045cc3e4038fe2157a266d"
+SRC_URI = "git://git.ti.com/arago-project/tisdk-setup-scripts.git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
-- 
2.17.1


