Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76258E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 20:12:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.21520.1733429533921912640
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 12:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SltP6nwd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B5KCCd9053381;
	Thu, 5 Dec 2024 14:12:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733429532;
	bh=IokEgs9htGqM3uuWXm0WXgd0RPf3hAVW3xDP+rYJscs=;
	h=From:To:CC:Subject:Date;
	b=SltP6nwdcFdc2fX3dnl+uBe1A2Ehyl42zyR3vGJ/ZSC8zur3k2n5vBo3+7WKIOIjG
	 o9w2Ds/0jEaV0HIboc5dV84hIBGamkIue9BOi/mP2cox6KZJT0c++tFNYRlq17LNCy
	 ZbQsP1s6Vjp34KXe/dLZB2crqVDjlspVWN80tyN4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5KCCB4051206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 14:12:12 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 14:12:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 14:12:12 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5KCCO8090449;
	Thu, 5 Dec 2024 14:12:12 -0600
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, Judith Mendez <jm@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] ti-test: Add rng-tools
Date: Thu, 5 Dec 2024 14:12:12 -0600
Message-ID: <20241205201212.1114249-1-jm@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Dec 2024 20:12:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15642

Add rng-tools to the ti-test tool list.

RNG testcases are failing since they require
rngtest, so add rng-tools to ti-test only.

Signed-off-by: Judith Mendez <jm@ti.com>
---
This patch has been previously sent and merged to scarthgap
branch, but is also required for kirkstone
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index a80b943b..85398eaf 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -44,6 +44,7 @@ TI_TEST_BASE = "\
     powertop \
     procps \
     pulseaudio-misc \
+    rng-tools \
     rt-tests \
     rwmem \
     smcroute \
-- 
2.46.0


