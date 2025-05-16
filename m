Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24476C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 18:49:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.20728.1747421383128315444
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 May 2025 11:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pgSYHxXr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GInfBB360088;
	Fri, 16 May 2025 13:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747421381;
	bh=jJ5LBZLaSo7UUnVF1f+RWMJITJbpzQv/3Tf2ovaq0hc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pgSYHxXrdwqVexKpExQtqOWiLy9H6KPCJdnypFf9+QhmDi3As5e7Uo2nsWzr2QnyV
	 tYv9Q+rYldeemgKw6k6e3KONasi20/mxrWWnlPcEt00XoVxPYC0/K64b/1rUPJM9Sx
	 xLUHL+f/0PbS6IMDtz6/fjw14ZZqJs3jjPquAjpc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GInfnX3446924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 13:49:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 13:49:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 13:49:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GIneOE089431;
	Fri, 16 May 2025 13:49:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uG07o-0001aq-LB; Fri, 16 May 2025 13:49:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2 3/3] ti-test: Add xdp-tools
Date: Fri, 16 May 2025 13:49:40 -0500
Message-ID: <20250516184940.4818-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250516184940.4818-1-reatmon@ti.com>
References: <20250516184940.4818-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 May 2025 18:49:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16206

Add in the new xdp-tools package.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index f9325af5..98629e36 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -57,6 +57,7 @@ TI_TEST_BASE = "\
     strongswan \
     tcpdump \
     v4l-utils \
+    xdp-tools-arago \
     yavta \
 "
 
-- 
2.17.1


