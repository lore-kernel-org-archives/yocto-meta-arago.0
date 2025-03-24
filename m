Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0365FC3600B
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:51:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.41353.1742827908470141989
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pGBz0m00;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52OEpkXn1566090
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Mar 2025 09:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742827906;
	bh=yHoYnbL+7RUcoOXnxH5+Tqm2HG6/zafStK4vroQN2rI=;
	h=From:To:Subject:Date;
	b=pGBz0m00ODeni+0TPsXeYiEzpyCq6d3uba5HQiRM6ieWytWXnv3mWS0HgYOLIyPcb
	 qv8FF/7lbfzSxfhaX5VMXKneAtmMzsDWeNAnZ1fgSlr/h8Okp/ho8TOkn/UaWcx77b
	 HLQGW7n+yrnyqrPL4TIeRo1VknrKo3b9IiQjaAtY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52OEpk1S006104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Mar 2025 09:51:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Mar 2025 09:51:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Mar 2025 09:51:46 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52OEpk2P122565;
	Mon, 24 Mar 2025 09:51:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1twj9W-0003ZT-9J; Mon, 24 Mar 2025 09:51:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] ti-test: Fix appending of TI_TEST_BASE
Date: Mon, 24 Mar 2025 09:51:46 -0500
Message-ID: <20250324145146.13687-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Mar 2025 14:51:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16145

The order of the overrides is incorrect for the append setting for
TI_TEST_BASE.  This results in the value for TI_TEST_BASE being cleared
and not appended to.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index a5a8838f..a73e2869 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -58,7 +58,7 @@ TI_TEST_BASE = "\
     yavta \
 "
 
-TI_TEST_BASE:ti-soc:append = " \
+TI_TEST_BASE:append:ti-soc = " \
     mtd-utils-ubifs-tests \
 "
 
-- 
2.17.1


