Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15F0C0015E
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 16:43:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1750.1689266606088764614
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Jul 2023 09:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mmxjM2+H;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36DGhNpQ068433;
	Thu, 13 Jul 2023 11:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689266603;
	bh=wmY9mhvoT4GcsBCsIg3qERhA1j01Fa3v0UncD7pDULI=;
	h=From:To:CC:Subject:Date;
	b=mmxjM2+Hw7tITBPkqIv36tN7dJtuBozXCOQP6upGytGOuwZCquW09a2/d7wKXOsS3
	 11ywHCLhQ2YzaaYXhyJ4LtJTI7xmmG6wkb0g6/Ez1k+naByYM/TvNtd1/atWFzim8Q
	 yToHX6UC02xj9ZUGvBzREq5pXABkEl8M6cCFvk9k=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36DGhNR2011310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jul 2023 11:43:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jul 2023 11:43:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jul 2023 11:43:22 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36DGhMQO092203;
	Thu, 13 Jul 2023 11:43:22 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] vulkan-loader: alternative link for qt demos
Date: Thu, 13 Jul 2023 11:43:21 -0500
Message-ID: <20230713164321.2802321-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Jul 2023 16:43:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14801

From: Randolph Sapp <rs@ti.com>

Some applications, like Qt's Vulkan demos, require the libvulkan.so
devlink to point at a valid Vulkan ICD loader. OE-Core has one that we
use so let's just use the alternative hooks to make sure that devlink
gets created without stomping on anything else.

To be dropped if upstream adopts something like this.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/vulkan/vulkan-loader_%.bbappend   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend b/meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend
new file mode 100644
index 00000000..67ece316
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend
@@ -0,0 +1,10 @@
+# Set alternative link for applications like Qt that really need
+# ${libdir}/libvulkan.so to point to an actual ICD loader instead of using
+# libvulkan.so.1
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE:${PN} = "vulkan-loader"
+ALTERNATIVE_LINK_NAME[vulkan-loader] = "${libdir}/libvulkan.so"
+ALTERNATIVE_TARGET[vulkan-loader] = "libvulkan.so.1"
-- 
2.41.0


