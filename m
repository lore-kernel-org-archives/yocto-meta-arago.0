Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2235C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 19:08:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.3317.1747681711071907351
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 12:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n6RerfeZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JJ8RuU979648;
	Mon, 19 May 2025 14:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747681707;
	bh=JXHSbdKNfzKGEaXiY91DSlsKqqI50MbXxCWzotMaJew=;
	h=From:To:CC:Subject:Date;
	b=n6RerfeZeXVs6rQpCuDItkCr3PCNRK124yyhLktWT5AOsHzOdnxzYEJmAJ7IinPC1
	 J/L1mJL0HC3rQr1DfPq1VQvH7a11vLRh491xcZIA1f9JqIYI853OBA2sX3/aQGkil+
	 7TUbbByvRyHu4TwA4GUHzANgdc35S1Ip4sIhIpek=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JJ8RC81640487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 14:08:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 14:08:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 14:08:27 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JJ8Rfw055939;
	Mon, 19 May 2025 14:08:27 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] packagegroup-arago-tisdk-graphics: add mesa-demos
Date: Mon, 19 May 2025 14:08:18 -0500
Message-ID: <20250519190818.3530849-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 19:08:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16228

From: Randolph Sapp <rs@ti.com>

Add the new mesa-demos package to this group so that users and scripts
can use eglinfo to query information about supported extensions and
configs for multiple platforms.

It also adds vkgears and es2gears to test Vulkan and GLES 2
respectively.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index fc1a5be3..f4bcb560 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -9,6 +9,7 @@ inherit packagegroup
 GFX_WAYLAND = "\
     weston-init-arago \
     weston-examples \
+    mesa-demos \
 "
 
 RDEPENDS:${PN} = "\
-- 
2.49.0


