Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4DDC3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:33:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.31270.1721687604512317306
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fSKpr3H1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: t-lannynd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MMXNpG099718
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jul 2024 17:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721687603;
	bh=3AzYiDoOpwLH654czrTEGHgQVVr4Ig25W3zPDEKk+kc=;
	h=From:To:CC:Subject:Date;
	b=fSKpr3H1pL/gR9UyKeHTRWm5WuhOeKOYrW2G0gPWhPHFi9nwiQXcWzzuBo2hLLOZ6
	 RcWVPsJJEwVtQZLAyCC52Z+fggxHXDpOVMemCe61WxfWKHEAAHIVP1laGqeK9kOWNh
	 WeRvaZbmHGMbIjCZXLOS8o+auEqUYXH8XiFfhWUQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MMXNV1033270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jul 2024 17:33:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 17:33:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 17:33:23 -0500
Received: from thorsten-Precision-T5600.dhcp.ti.com (thorsten-precision-t5600.dhcp.ti.com [128.247.75.246])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MMXNZd126872;
	Mon, 22 Jul 2024 17:33:23 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Thorsten Lannynd <t-lannynd@ti.com>
Subject: [scarthgap][PATCH] Added ffmpeg package to scarthgap
Date: Mon, 22 Jul 2024 17:16:58 -0500
Message-ID: <20240722221657.157473-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15462

Added ffmpeg package to scarthgap

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 6571d484..2085ad09 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -8,6 +8,7 @@ inherit packagegroup
 
 MULTIMEDIA = " \
     amsdk-av-files \
+    ffmpeg \
     libcamera \
     libcamera-gst \
 "
-- 
2.34.1


