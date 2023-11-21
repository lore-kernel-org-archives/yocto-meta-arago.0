Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154ABC61D88
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 10:55:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.37281.1700564134469470715
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 02:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WaZmr48G;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ALAtXni113806
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Nov 2023 04:55:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700564133;
	bh=sd+lQR3diuaB31nppSMHkIGemPFEgVxKSV7xNBjZwF0=;
	h=From:To:CC:Subject:Date;
	b=WaZmr48G14I0hpXLFqBOR70gb2OFlQZfmVjPaeI5kz3/zZ/98jJ365gpPHW0ql+X0
	 pBPNzxjDMxjnFN4aBuQCJgAAbND4inhBqd23gfuWPf1xtnIs9xvmJTT8lgoQE8ZOC3
	 6T6R+CS8px+tjoaxgyu87rLILyZLDuhIB0cSYyE4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ALAtXck022537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 21 Nov 2023 04:55:33 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Nov 2023 04:55:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Nov 2023 04:55:33 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ALAtWsc019581;
	Tue, 21 Nov 2023 04:55:33 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] Add am62pxx as compatible machine for jailhouse image
Date: Tue, 21 Nov 2023 16:25:11 +0530
Message-ID: <20231121105511.3628347-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Nov 2023 10:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15018

Add am62pxx as compatible machine for jailhouse image. Also since
this image is primarily for jailhouse remove the machine in
IMAGE_INSTALL:append.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-core/images/tisdk-jailhouse-image.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index 267fcc2d..b7ee1757 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -2,9 +2,9 @@
 
 require recipes-core/images/tisdk-default-image.bb
 
-COMPATIBLE_MACHINE = "am62xx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
 
-IMAGE_INSTALL:append:am62xx = " jailhouse"
+IMAGE_INSTALL:append = " jailhouse"
 
 export IMAGE_BASENAME = "tisdk-jailhouse-image"
 
-- 
2.34.1


