Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7D2C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 08:31:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10416.1739349055515412107
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 00:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=s5wJmMyU;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51C8UpZi402031
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 02:30:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739349051;
	bh=8Yr++wpi8a5TYXS0sxF6JAP8JWI0cDZbLG9pBUBdL/M=;
	h=From:To:CC:Subject:Date;
	b=s5wJmMyUEEHbBhDcp0p7Vq7JZymj57GlyUPpyVdBPQr+ZydI7TU6B4HvtxJmOXN1q
	 G556qNJ+VvV1WUB/iQhkt3tMTfy4xXeoyu4s+EX8MPi6wx8F6+yJqBvLQkXlReY/Sa
	 slDICSYXJZmjH6A/LRZES7+/6gwCd+yrzB6WWrwQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51C8UpDe002384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 02:30:51 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 02:30:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 02:30:51 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51C8UoUw007093;
	Wed, 12 Feb 2025 02:30:51 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <j-sahu@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH] Add am62lxx as compatible machine for jailhouse images
Date: Wed, 12 Feb 2025 14:00:02 +0530
Message-ID: <20250212083002.3945780-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Feb 2025 08:31:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15841

Add am62lxx as compatible machine for jailhouse image and jailhouse
inmate image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb  | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index 9ab4fc65..1f96781a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -7,7 +7,7 @@ contains additional firmware and management tools for Jailhouse.\
 
 require recipes-core/images/tisdk-default-image.bb
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 
 IMAGE_INSTALL += " jailhouse"
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
index aba5ee13..1a051161 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
@@ -7,7 +7,7 @@ packages for OOB demo.\
 
 require recipes-core/images/tisdk-tiny-initramfs.bb
 
-COMPATIBLE_MACHINE = "am62xx|am62pxx"
+COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 
 IMAGE_FSTYPES += "cpio"
 
-- 
2.34.1


