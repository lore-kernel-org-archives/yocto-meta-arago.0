Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5177BC7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 17:13:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.65841.1686590013862605838
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 10:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lZ8gP0RA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35CHDVdq067725;
	Mon, 12 Jun 2023 12:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686590011;
	bh=BldRbUmjVBkwJmuU7j1/wMnCYI6rf0f+pVf66SmBuoY=;
	h=From:To:CC:Subject:Date;
	b=lZ8gP0RAjkhJIShLkdho3/nWFzB/2H1PtfTtYWqJms+NJAKaKKQGTmNVdtAA7hxbK
	 6KJ1K4pcyYCCpZjm6Fkc+nkcpRfL2EsJIlMWuwJvgW7ElLKGNl46fDxj8GMOhBy1Hv
	 RSgaTuZ8d3O22520ftJvVBTzTtFS1urycipp+JDA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35CHDUQc107853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 12:13:30 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 12:13:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Jun 2023 12:13:30 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35CHDTmc028616;
	Mon, 12 Jun 2023 12:13:30 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>, Khasim <khasim@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] packagegroups: packagegroup-arago-tisdk-addons: Add sudo in arago filesystem
Date: Mon, 12 Jun 2023 22:43:15 +0530
Message-ID: <20230612171315.1663628-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Jun 2023 17:13:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14600

This commit adds sudo to the Arago filesystem. The addition of sudo is necessary due to weston running rootless.
Hence, Customers who are working on applications which requires weston may now need sudo for that extra privileges.
Furthermore, the inclusion of sudo is in response to past customer requests for this feature.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index af701d85..7885cfbd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -21,6 +21,7 @@ UTILS = " \
     kdump \
     open62541-examples \
     open62541-tests \
+    sudo \
 "
 
 UTILS_UBOOT_FW = "libubootenv-bin"
-- 
2.34.1


