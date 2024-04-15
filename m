Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649F2C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 05:06:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14061.1713157611954640864
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 22:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OxE5NatK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43F56moN048498;
	Mon, 15 Apr 2024 00:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713157608;
	bh=SGZmefwlN5eM78+GSZAh0/Fbu2yMhGfAwJliT9QYhRE=;
	h=From:To:CC:Subject:Date;
	b=OxE5NatKZbOG7WjknWosgsthLh22e58seSTJX/WPD7hl6wJFM+pXXKWmHEnYfk/pc
	 SfkWuEmoMCW7HkOj2f6jKPBnatIL8vPrHwPCgIhkGOXwnldkwAUZUKYPTOMvYZCRmd
	 jiFbQ8tyJ70PFQWEneWF6Nk2/JugAaNbXni2jYJc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43F56men073087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Apr 2024 00:06:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Apr 2024 00:06:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Apr 2024 00:06:48 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43F56lQg021020;
	Mon, 15 Apr 2024 00:06:47 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-connectivity: mbedtls: Remove redundant bbappend
Date: Mon, 15 Apr 2024 10:36:34 +0530
Message-ID: <20240415050634.3336328-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Apr 2024 05:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15279

This has been fixed upstream [1]. Hence, remove this bbappend.

[1]: https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=e012fe075d6de6050e1a37d23bfbb70b5278f0a5

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_%.bbappend           | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
deleted file mode 100644
index f3c16796..00000000
--- a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit update-alternatives
-
-ALTERNATIVE:${PN}-programs += "hello"
-ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
-- 
2.34.1


