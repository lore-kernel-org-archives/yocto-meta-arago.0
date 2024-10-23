Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EA0D0BB42
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 22:10:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.633.1729721449539987637
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 15:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tTR9udaq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NMAk6G020048;
	Wed, 23 Oct 2024 17:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729721446;
	bh=bidQP0SZdvuYcw0/cISD3+LlzR2ODDUbYyiPCWGXOsE=;
	h=From:To:CC:Subject:Date;
	b=tTR9udaqk5G++jz/fb5zkDoWOu+dyo1jSacqXU8KY5Vo59ZX5AkepxZmlo9rhQLP0
	 xM4yxU3h2ezFL6v+MySvyYPQmqrZ2GwJMjvntmhsbfAz+HvyFr71+O02bkvLTgRtug
	 KcduazQ8W04+rB2IyPbl3q6HeDG/FOgO/+Gs0ueI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NMAkWG014846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 17:10:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 17:10:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 17:10:45 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NMAj4M026862;
	Wed, 23 Oct 2024 17:10:45 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: packagegroup-arago-console: Add ti-rtos-firmware
Date: Thu, 24 Oct 2024 03:40:38 +0530
Message-ID: <20241023221038.3303369-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Oct 2024 22:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15581

Add ti-rtos-firmware in packagegroup-arago-console which
ensures that TI IPC firmwares are packaged in initramfs based
filesystems like tisdk-base-image

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index cd2960c1..31e7e4b8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -64,6 +64,7 @@ ARAGO_SDK_PREREQ = "\
     jpeg \
     jpeg-tools \
     freetype \
+    ti-rtos-firmware \
     "
 
 ARAGO_CONSOLE = "\
-- 
2.34.1


