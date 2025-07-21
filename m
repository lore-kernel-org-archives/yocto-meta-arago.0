Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB60C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 14:51:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.42897.1753109508617041253
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BoINtgJu;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LEpk9i826221;
	Mon, 21 Jul 2025 09:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753109506;
	bh=5Vx85z1Bql96H1bvPXj7Z/buhQuNl/KF5tsFuxHmpTA=;
	h=From:To:Subject:Date;
	b=BoINtgJu525+6XuqTaj3rAO8dD+14UdlgU1ve9fX+PCT3JPRHi0SnQiXqInaIYFnC
	 DzEInLYzrbaWWrwtxdysv8o9CaxtWMCYF14KvVcYtyIr/Evjhgl61iNXv31GW2s6AM
	 NesG7R2a5KLTHQJZAV8eeboOrN8ePJ6udglRXoEk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LEpkrA943962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 09:51:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 09:51:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 09:51:46 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LEpkUG4005743;
	Mon, 21 Jul 2025 09:51:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1udrrm-0005WL-6X; Mon, 21 Jul 2025 09:51:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] dma-heap-tests: Update SRCREV to fix CMake 4.0 issue
Date: Mon, 21 Jul 2025 09:51:46 -0500
Message-ID: <20250721145146.21181-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 14:51:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16314

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
index 69f95391..c0eeaaaa 100644
--- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
+++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -7,7 +7,7 @@ PV = "1.0"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
-SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
+SRCREV = "ead2ea8a9c3b81e97324da44c76cd9295e6c5efc"
 
 DEPENDS = "googletest"
 
-- 
2.17.1


