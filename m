Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0938AEE57F6
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:58:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.34882.1726095835869186296
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 16:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VZV2doNX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: jm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48BN3r0u015729;
	Wed, 11 Sep 2024 18:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726095834;
	bh=jODghhJx/xUQmjzGkF6AwdD6Ix4zKfKK2IExzT5shZI=;
	h=From:To:CC:Subject:Date;
	b=VZV2doNXsnh31cHaOX0hRTD+AJLmF0Specg0bZi67IXnVfbVhhTj3DlTgZYKgamON
	 bTHDJvauBgaYUjavVa8iDJGWfJU7/2fPv0HQeE3fFNAqxZzle69SB/+arj8cSzr9Kv
	 E6opHSznLJ4drLln5jPqFcTYiIgn3Cq35t4Qxqow=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48BN3rIG058835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Sep 2024 18:03:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Sep 2024 18:03:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Sep 2024 18:03:53 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48BN3rGW025720;
	Wed, 11 Sep 2024 18:03:53 -0500
From: Judith Mendez <jm@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, Judith Mendez <jm@ti.com>
Subject: [scarthgap PATCH] ti-test: Add rng-tools
Date: Wed, 11 Sep 2024 18:03:52 -0500
Message-ID: <20240911230352.404257-1-jm@ti.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Sep 2024 23:58:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15556

Add rng-tools to the ti-test tool list.

RNG testcases are failing since they require
rngtest, so add rng-tools to ti-test only.

Signed-off-by: Judith Mendez <jm@ti.com>
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


