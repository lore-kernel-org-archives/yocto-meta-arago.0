Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E1AC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.10694.1648128330720588496
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LsxGCxNy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSHi101193;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=4C8w6xlH87wQQKBXkAYXxq57KzgU2eEgafrbs2nTdCs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LsxGCxNyVsquVtkIaNnhw1KlNlfyyW4F/YxC9iHDm5Fy0WbU55Sg4PAjpFv3QDNSj
	 SS9AhJHo7+h+xcrv+nalEQvfGqbNsLIdlNWu47ZwC9u9R1J5iy0+xjtC1SH9THToN6
	 zTOZ9xElDRQzqF0wC2188IbXrbRiR3/q458k1TEg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPStU005055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSI1007792;
	Thu, 24 Mar 2022 08:25:28 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 05/12] tisdk-default-image: Reformat
 documentation and clarify usage
Date: Thu, 24 Mar 2022 08:25:19 -0500
Message-ID: <20220324132526.26497-6-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220324132526.26497-1-nm@ti.com>
References: <20220324132526.26497-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13737

Reformat the documentation to indicate the summary and description
in a standardized manner.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V5: None

V5: https://lore.kernel.org/all/20220322174808.16341-6-nm@ti.com/

 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 152f8572afcb..a84e752c0402 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -1,4 +1,7 @@
-# Arago TI SDK full filesystem image
+SUMMARY = "Arago TI SDK full filesystem image"
+
+DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
+ applications and packages to entitle the SoC."
 
 require arago-image.inc
 
-- 
2.31.1


