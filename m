Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD194C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:07:45 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.14014.1747404457704098389
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DW4CF+7X;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54GE7anQ4044921
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 09:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747404457;
	bh=HTqMJdX5dOhaV+DKcUXWubSKxIaS6FA08ph2mZDffHo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DW4CF+7XKjKGUSs5zybMq3Ti1+CSHRuM2ERQ/KpPA7Jd6z+0H91Po6WvR7KDOZykZ
	 5b1ich2Ty1gSKV+OpwqwdeURi+E+332kpt5v1t0lTUu6uN0xVAVnkpywbsaVTTqh4s
	 LuepH06uB4i51rFNDL4ffehS9z9ypmzht61KhfXQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54GE7auP029970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 May 2025 09:07:36 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 09:07:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 09:07:36 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GE7a6i030356;
	Fri, 16 May 2025 09:07:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uFviq-00088o-3Z; Fri, 16 May 2025 09:07:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 3/3] ti-test: Add xdp-tools
Date: Fri, 16 May 2025 09:07:35 -0500
Message-ID: <20250516140735.31243-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250516140735.31243-1-reatmon@ti.com>
References: <20250516140735.31243-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 May 2025 14:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16205

Add in the new xdp-tools package.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 3d0c1209..caf8b622 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -55,6 +55,7 @@ TI_TEST_BASE = "\
     stress-ng \
     tcpdump \
     v4l-utils \
+    xdp-tools-arago \
     yavta \
 "
 
-- 
2.17.1


