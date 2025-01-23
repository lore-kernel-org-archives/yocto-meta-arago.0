Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694C2C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:23:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.21816.1737663790069664675
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 12:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ybv0PuAa;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NKN7OL428234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 14:23:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737663787;
	bh=N3jKrpIz6uC6yNP8Qztr9ZGx+8wuqHoz21O21nOBZnE=;
	h=From:To:CC:Subject:Date;
	b=ybv0PuAa7iCujGj1TaxLI1zkNqLNGv5ICLN8KJXpBjHiECzhdyyxJ4UhO0K6X24LZ
	 QaBin6r7anKiVW6dyqnhewr0jNw46PUpxKdifh25H23OvYsAP6u9sWDktRtBHBWkY6
	 JR9tNdBHyfjywmeo69M0BqqY8smAYoMa9OilP4xY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NKN7vF027395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 14:23:07 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 14:23:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 14:23:06 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NKN6a6024268;
	Thu, 23 Jan 2025 14:23:06 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <afd@ti.com>, <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-arago][master][PATCH] arago.conf: enable opencl distro feature
Date: Thu, 23 Jan 2025 14:22:59 -0600
Message-ID: <20250123202259.2846410-1-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15747

From: Randolph Sapp <rs@ti.com>

The GPU (for rogue devices) is now capable of supplying required OpenCL
libraries. Additional tests for this feature will be pulled in later.

This was previously disabled due to an outdated opencl library on legacy
devices. The offending library has since been removed.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 79d2208d..178b43d3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -48,7 +48,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 # Add additional distro features
 DISTRO_FEATURES:append = " pam wayland opengl"
 DISTRO_FEATURES:remove = "x11"
-#DISTRO_FEATURES:append = " opencl"
+DISTRO_FEATURES:append = " opencl"
 DISTRO_FEATURES:append = " vulkan"
 
 # Normally target distro features will not be applied to native builds:
-- 
2.47.1


