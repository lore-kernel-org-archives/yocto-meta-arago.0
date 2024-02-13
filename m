Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB78FC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:51:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28523.1707864706380891544
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 14:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lQBJVk7z;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41DMpjvK111716;
	Tue, 13 Feb 2024 16:51:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707864705;
	bh=Y9tSOZjmifcPTiYx+7hP1u0codlf2lCwQ/5JlF25UBE=;
	h=From:To:CC:Subject:Date;
	b=lQBJVk7zssDECHB4SuyiLtq65UshlPjBpbPdwSpJTmjevvHMa81AQ/unwHoGwm5uO
	 gutpIjLHDbjHmbF6vkTyGqbr06HEP/DTN34tqR9x/w5C2y6Am0xcuf+yFEOpHegZzn
	 1gfL891KWOBUuEs4Qy9gT/Aazy9Nc/zauWvaJ5yM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41DMpiHP116449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Feb 2024 16:51:45 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Feb 2024 16:51:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Feb 2024 16:51:44 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41DMpiKV108281;
	Tue, 13 Feb 2024 16:51:44 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] packagegroup-arago-tisdk-addons: Disable big-data-ipc-demo
Date: Tue, 13 Feb 2024 16:51:43 -0600
Message-ID: <20240213225143.1590112-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 22:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15182

Temporarily disable big-data-ipc-demo until a fix for missing
kernel header dma_buf_phys.h is complete.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 4dec290a..87782326 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -88,8 +88,8 @@ EXTRA_PACKAGES:omapl138 = " \
 EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
 
+# ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)}
 EXTRA_PACKAGES:append:omap-a15 = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
 "
 
 # acontis-atemsys
-- 
2.39.2


