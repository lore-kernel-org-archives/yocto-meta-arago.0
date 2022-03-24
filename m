Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C6CC41535
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.10614.1648128332760610438
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=djdOcOhY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSxA022719;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=bKJtNwDiZ6ZXEwP+h/JTqPtLyVya6o0SaIXE/cMoU/I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=djdOcOhYnZfDytStWo+23X+JN7sIUFhbouS6gP4JUjXpczupBpwcEKkLAncdqxBv9
	 xV10hlRONs9Z+TzwPeQ2C7pRJ+xND+VieiVmaGNeD0lWV/kNsezMaf55T8h6tWFGCk
	 KjMTR31TKyFDaewo43EkdjQXY8YM2mX/KUCSfSZI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPSCB016940
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPR7g114530;
	Thu, 24 Mar 2022 08:25:27 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 04/12] tisdk-base-image: Reformat
 documentation and clarify usage
Date: Thu, 24 Mar 2022 08:25:18 -0500
Message-ID: <20220324132526.26497-5-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13747

Reformat the documentation to indicate the summary and description
in a standardized manner.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V5: None

V5: https://lore.kernel.org/all/20220322174808.16341-5-nm@ti.com/

 meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 76668831354f..8698816df52d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -1,5 +1,7 @@
-# Arago TI SDK base image with test tools
-# Suitable for initramfs
+SUMMARY = " Arago TI SDK base image with test tools"
+
+DESCRIPTION = "Arago SDK base image suitable for initramfs containing\
+ comprehensive test tools."
 
 require arago-image.inc
 
-- 
2.31.1


