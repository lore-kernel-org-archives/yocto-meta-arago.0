Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D1BC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:09:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1528.1709665775786848217
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 11:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=w5jhdkYc;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425J9Yd8098276;
	Tue, 5 Mar 2024 13:09:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709665774;
	bh=HrgsCk6jwQkRDF4If2/WNuMlz36dBzWk1QG9iIvDgbI=;
	h=From:To:CC:Subject:Date;
	b=w5jhdkYcnDwpvWkaVrlMBdwRHd7JA0eo1kwwtQsC9LN6WcdXgL8A1oo+C5kWtCBxn
	 3xKeoH5gaFKIpk5QXCLnJE2cu7CLdLS9V+CSrX6q87rjT614Fl+9hdbsREL+AB7QR0
	 fPcaIY6qap/4Vzs/BvMWdW/iEi4qolOrIP/Dr79o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425J9YcB005555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 13:09:34 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 13:09:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 13:09:33 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425J9XZA110784;
	Tue, 5 Mar 2024 13:09:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] at: Remove append for bison-native dependency
Date: Tue, 5 Mar 2024 13:09:32 -0600
Message-ID: <20240305190932.66840-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 19:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15217

This has been fixed upstream. Remove this bbappends.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-extended/at/at_%.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-extended/at/at_%.bbappend

diff --git a/meta-arago-distro/recipes-extended/at/at_%.bbappend b/meta-arago-distro/recipes-extended/at/at_%.bbappend
deleted file mode 100644
index ab5a588b..00000000
--- a/meta-arago-distro/recipes-extended/at/at_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-DEPENDS += "bison-native"
-- 
2.39.2


