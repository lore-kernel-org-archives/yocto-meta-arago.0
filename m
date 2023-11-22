Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F45C61D96
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:32:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.13861.1700634768089951615
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 22:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=B8lHlLld;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AM6Wlvo060494
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Nov 2023 00:32:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700634767;
	bh=TseincOCbGld6iX/HQcDj63Nxrw/L/18z/GXlhnCdJI=;
	h=From:To:CC:Subject:Date;
	b=B8lHlLldqrU7Q8I3VgLrTYYzoLbV9Guw2qdwr23hlYXIWPBF6owo+CRKNqdmJ6SFf
	 w37n4l6Xyjp4Zb6NhP/sXCULVUVE1yAQR8HoBLjiWczS98X7aLwy0gQ4zzJWQTSftB
	 LYvZBE02Q7al//NCfiSKjLyiR9knhClO17XHTUNc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AM6WlHa027153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 22 Nov 2023 00:32:47 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Nov 2023 00:32:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Nov 2023 00:32:46 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AM6WkCB002854;
	Wed, 22 Nov 2023 00:32:46 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH v2] Add am62pxx as compatible machine for jailhouse image
Date: Wed, 22 Nov 2023 12:02:37 +0530
Message-ID: <20231122063237.466610-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Nov 2023 06:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15020

Add am62pxx as compatible machine for jailhouse image. Also since
this image is primarily for jailhouse remove the machine in
IMAGE_INSTALL:append.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-core/images/tisdk-jailhouse-image.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index 267fcc2d..b28dfd5a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -2,9 +2,9 @@
 
 require recipes-core/images/tisdk-default-image.bb
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
-IMAGE_INSTALL:append:am62xx = " jailhouse"
+IMAGE_INSTALL += " jailhouse"
 
 export IMAGE_BASENAME = "tisdk-jailhouse-image"
 
-- 
2.34.1


