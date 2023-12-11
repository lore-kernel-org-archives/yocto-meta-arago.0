Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16A6C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 21:09:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3087.1702328960076209152
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 13:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qUjy5Q3A;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BBL9Ig6095559;
	Mon, 11 Dec 2023 15:09:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702328958;
	bh=UJZP2m3YeKFnGHo6B/SKhsGnOIoHb6N2pObqIiWTjDk=;
	h=From:To:Subject:Date;
	b=qUjy5Q3A7w9PXOIiEEuEQMYVhpCkbf9LlQdVd6WZgLbC0b2eAbginOlZDWeYr6eUv
	 k9b2BNo6F7gsccIp7bnics50L9nyMOPGTq1BKVT2zUcOK9H7byMx/xNC0PL+9BzEiN
	 R2mUPF+yqJBVczwFs9Ja+g3ecUxOHxTDyFFnsZUs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BBL9Ibc045329
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 15:09:18 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 15:09:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 15:09:18 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BBL9HnQ112147;
	Mon, 11 Dec 2023 15:09:18 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rCnWf-0008TB-S2; Mon, 11 Dec 2023 15:09:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] branding-ltsprep: Move to kernel 6.6 and uboot 2024.01
Date: Mon, 11 Dec 2023 15:09:17 -0600
Message-ID: <20231211210917.32514-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Dec 2023 21:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15056

Move the kernel version overrides to 6.6 and the uboot version overrides
to 2024.01 for the next LTS prep.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add uboot.

 .../conf/distro/include/branding-ltsprep.inc              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index fb831225..f0634e7a 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1,8 +1,8 @@
 
-PREFERRED_VERSION_linux-ti-staging = "6.1%"
-PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
-PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
-PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
+PREFERRED_VERSION_linux-ti-staging = "6.6%"
+PREFERRED_VERSION_linux-ti-staging-rt = "6.6%"
+PREFERRED_VERSION_linux-ti-staging-systest = "6.6%"
+PREFERRED_VERSION_u-boot-ti-staging = "2024.01%"
 
 # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
 MACHINE_FEATURES:remove = "mmip"
-- 
2.17.1


