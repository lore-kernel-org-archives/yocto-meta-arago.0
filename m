Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D72DC25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 11:09:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.37215.1716116942627145404
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 19 May 2024 04:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MJyfAaDt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44JB8wLJ057684;
	Sun, 19 May 2024 06:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716116938;
	bh=vj0c0zCB3euje3OmtbQ8W+FjeEVED+Z9Uf77mjbqxtI=;
	h=From:To:CC:Subject:Date;
	b=MJyfAaDtodqDkfbW60SXcJ4uugOij0UF5zx4u7kqbggaXKROYVdMwcD+rP5k6Te9s
	 fotMAZZwjweHv3TwYmGndmfiPC2JXcf+PVFkEOH81EVGweCzby3YXBpBkRnSotftqt
	 tuBQhcn3GkojcK0lViQbD3mL+/slPhNJiX32Z0Lg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44JB8wJH104434
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 May 2024 06:08:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 19
 May 2024 06:08:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 19 May 2024 06:08:58 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44JB8vxM018328;
	Sun, 19 May 2024 06:08:58 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>, Vignesh <vigneshr@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: images: Package dtc in tisdk-default-image
Date: Sun, 19 May 2024 16:38:46 +0530
Message-ID: <20240519110846.1608365-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 19 May 2024 11:09:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15334

- This commit adds dtc to tisdk-default-image. This package
would be highly beneficial for onboard debugging.

Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 858a10d4..ef3ebb2a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -54,6 +54,7 @@ DEVTOOLS = " \
     build-essential \
     packagegroup-core-tools-debug \
     git \
+    dtc \
 "
 
 OPENCL = " \
-- 
2.34.1


