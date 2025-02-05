Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDF3C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:35:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.13247.1738766128791351669
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 06:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pHhhnH9a;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515EZRDi2614159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 08:35:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738766127;
	bh=oHWm3FMeKhvm4KPnAU7DAhJHp9XR0Q0xjMOBs6ExVJI=;
	h=From:To:Subject:Date;
	b=pHhhnH9a12rtkt+t9eqTbkq3uRUKBMVCynqkCAYK4Syl3fkG9vCNIRNiqbUJAmZV4
	 1K3/C0RcVZxKCjwjxs4fOUqKxxCQ/yOICS65FAHYEIHZ8eMnMr15LErKvhnnHIc/7e
	 WuWaR2F8unIYDKwjP9QTMvUCSR13PddS6m9+MNDE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515EZRXZ002721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 08:35:27 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 08:35:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 08:35:27 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515EZRoV086707;
	Wed, 5 Feb 2025 08:35:27 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tfgUw-0006R1-SO; Wed, 05 Feb 2025 08:35:26 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] kms++: Move to meta-arago-test
Date: Wed, 5 Feb 2025 08:35:26 -0600
Message-ID: <20250205143526.24695-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 14:35:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15804

Since we added kms++ as a dependency to ti-test, we missed that kms++
was coming from meta-arago-extras which created a dependency we do not
want.  So move it to meta-arago-test.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/kms++/kms++_git.bb                           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-extras => meta-arago-test}/recipes-graphics/kms++/kms++_git.bb (100%)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-test/recipes-graphics/kms++/kms++_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
rename to meta-arago-test/recipes-graphics/kms++/kms++_git.bb
-- 
2.17.1


