Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2321CC2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:20:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.44982.1718882417382831772
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 04:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z/TrqT4/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-luthra@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KBKDSp057042;
	Thu, 20 Jun 2024 06:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718882413;
	bh=xlZC6Y12pcPvqXGUWGKWYa+aJysPwI8M112mTvYwGMI=;
	h=From:To:CC:Subject:Date;
	b=Z/TrqT4/q+Y7jwZDGwpSWVrkczpHG+l9HCikQjzPvEsxNk22rdXTevNLURC1cMT/c
	 3a1yrIhc3Ow2R07IsqbvluaXEproxf7EtxAMEz3UHff1p58AQS7mdU6mcy6cd4Dc7D
	 YxElQ8CGsPfw3K6SLNC+39AV2gXqqk/SuIkjkdsE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KBKDDF018717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 06:20:13 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 06:20:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 06:20:13 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KBKC9H075028;
	Thu, 20 Jun 2024 06:20:12 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar
	<devarsht@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
        Jai Luthra
	<j-luthra@ti.com>
Subject: [master/scarthgap][PATCH] ti-test: Add media-ctl for camera testing
Date: Thu, 20 Jun 2024 16:49:57 +0530
Message-ID: <20240620111957.3733312-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Jun 2024 11:20:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15405

The media-ctl utility is required to configure formats and routes in
embedded v4l2 camera pipelines.

It was automatically packaged in older v4l-utils recipe, but with
v1.26 onwards it needs to be explicitly enabled.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 8cb27f21..914a40c4 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -29,6 +29,7 @@ TI_TEST_BASE = "\
     linuxptp \
     lmbench \
     lsof \
+    media-ctl \
     memtester \
     mstpd \
     mtd-utils \
-- 
2.43.0


