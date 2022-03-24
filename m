Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DF1C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.10761.1648128331287480818
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L8xmnzTH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSKv067435;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=H7IDBjuRWeGHpmCX6/M96sZ47Az3Z9EEIkc30t8w1Ts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L8xmnzTHPf9++GX8JIYc1+bNyKiH5YbphCJ603x2XZ6JV0icLONR3PU2o7pD0rjd/
	 9hFQsj7idCcMaQhz8bRo49XREsCJJuUIi0a43+3n4vNwNcPZtzi1yLKwO0KPyIP4YN
	 YHyyy9DTKU7wuc2P7fGUVbYDAbnWnU18RFP00Sew=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPSil081315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSLb008942;
	Thu, 24 Mar 2022 08:25:28 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 12/12] images: Build tisdk-bootstrap-image
 with tisdk-core-bundle
Date: Thu, 24 Mar 2022 08:25:26 -0500
Message-ID: <20220324132526.26497-13-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13744

Add tisdk-bootstrap-image to the list of TARGET_IMAGES for
tisdk-core-bundle.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V5: None

V5: https://lore.kernel.org/all/20220322174808.16341-13-nm@ti.com/

 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 5ce688ef24b7..db73abd27fc2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
 DTB_FILTER_j7 = "j721e"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
+TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
 
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
-- 
2.31.1


