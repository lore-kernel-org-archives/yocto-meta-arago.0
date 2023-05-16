Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC01AC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:48:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.30183.1684262903217945560
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 11:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SIsX8sZD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GImL5H092638;
	Tue, 16 May 2023 13:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684262901;
	bh=RZh9jvndgsRPyUZcyHGlpE+zRxS2IOaNQeDQ7fbJEJ0=;
	h=From:To:Subject:Date;
	b=SIsX8sZDd2ZoXRMF33s2z6jK0oAb6Rg6D+QkvkDs7J0QAfNlOANl2nNYaw9tjze8y
	 AJ9dN95JvqB2NSIW7LtxhFZcZYc2E8CfTAPMoFqVxm7Ht2wIPsyzWMLB1L2YvA8nk2
	 timfTXCd72XR5DYHE31mFQ6Hwwk6uKLhAKJ9g/BE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GImLgZ027076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 13:48:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 13:48:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 13:48:21 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GImLqC116394;
	Tue, 16 May 2023 13:48:21 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyzif-0003li-GM; Tue, 16 May 2023 13:48:21 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] big-data-ipc-demo: Add dependency on kernel headers in shared workdir
Date: Tue, 16 May 2023 13:48:21 -0500
Message-ID: <20230516184821.13711-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 18:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14415

The previous change added a dependency on virtual/kernel to get the
headers for the compile step, but this additional dependency is needed
to make it work in situations where the sstate causes the kernel to not
be rebuilt and thus not populate the shared workdir with the headers.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
index e7bf1a1d..99434246 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
@@ -23,6 +23,8 @@ DEPENDS = "ti-ipc \
            virtual/kernel \
 "
 
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
 PLATFORM = "UNKNOWN"
 PLATFORM:omap-a15 = "DRA7XX"
 
-- 
2.17.1


