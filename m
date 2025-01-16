Return-Path: <d-mittal@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0ECC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 13:54:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.49598.1737035686938379662
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 05:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F9+XpGYg;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: d-mittal@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GDsjAT023666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 07:54:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737035686;
	bh=Rrz4VwDtlAU2Tc/n1xyvI4u6tOXklYx5UXo84dEy19c=;
	h=From:To:CC:Subject:Date;
	b=F9+XpGYgquKUg2va3UQ681PDZKBEwIkVDv9R6qh8mAdas95AO6wjGZwgyQGj4snGg
	 ynW5h1vpx42K60dPFeN3bAVhZ5ke0xwSzTF7zWr3X4ixenCNjNHjd3Sw8vT5qBr3av
	 l4xV6cnqWvSI6MPk6bq1fkyRRqQ7ntTt33ZHCZP4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GDsjGE016303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 07:54:45 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 07:54:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 07:54:45 -0600
Received: from a0507040local.dhcp.ti.com (a0507040local.dhcp.ti.com [172.24.227.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GDsghw102384;
	Thu, 16 Jan 2025 07:54:43 -0600
From: Divyansh Mittal <d-mittal@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Karan Saxena <karan@ti.com>,
        Krunal Bhargav
	<k-bhargav@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        Divyansh Mittal
	<d-mittal@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-base: Add mosquitto packages
Date: Thu, 16 Jan 2025 19:24:31 +0530
Message-ID: <20250116135431.1937360-1-d-mittal@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 13:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15693

Mosquitto is an open source (Eclipse licensed) message broker that
implements the MQ Telemetry Transport protocol providing both an MQTT
broker and several command-line clients.

Signed-off-by: Divyansh Mittal <d-mittal@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 121fa432..7634cb0c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -50,6 +50,11 @@ ARAGO_EXTRA = "\
     cifs-utils \
     phytool \
     lldpd \
+    mosquitto \
+    libmosquitto1 \
+    libmosquittopp1 \
+    mosquitto-clients \
+    mosquitto-dev \
 "
 
 OPTEE_PKGS = " \
-- 
2.34.1


