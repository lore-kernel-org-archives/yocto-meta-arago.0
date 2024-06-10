Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C0C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 20:25:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.30130.1718051121193418278
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Jun 2024 13:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PbgPzFqU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AKPItQ111123;
	Mon, 10 Jun 2024 15:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718051118;
	bh=YCPFllynDj0qtAQyDRou7LrkXYd0xKWgcnnqaC3dMRU=;
	h=From:To:CC:Subject:Date;
	b=PbgPzFqUkLCws2eJ939TYqLVHVUe8Ff5aWTABzb2MAvluxaOTHPS7lF2/dJOypgo8
	 VxbDOejRw2oxNNkAialaEa6uzbIgXbOxBAQmHQBQugmyUXLMxC7d7RCeMYcm3XQ9EU
	 St8kutMUjD4iqWD4I7qvkGvnF1po5W09O+RBOXpA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AKPIC6003316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 15:25:18 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 15:25:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 15:25:17 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AKPHf2009421;
	Mon, 10 Jun 2024 15:25:17 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] vulkan-loader: remove append for libvulkan.so
Date: Mon, 10 Jun 2024 15:25:16 -0500
Message-ID: <20240610202516.2695221-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Jun 2024 20:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15381

From: Randolph Sapp <rs@ti.com>

Remove the append that added libvulkan.so for compatibility with certain
Vulkan applications. The specific application this was added for
(vulkan-cts) fixed it's linking.

This alternative has been broken for a little bit anyway.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/vulkan/vulkan-loader_%.bbappend   | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend b/meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend
deleted file mode 100644
index 67ece316..00000000
--- a/meta-arago-distro/recipes-graphics/vulkan/vulkan-loader_%.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-# Set alternative link for applications like Qt that really need
-# ${libdir}/libvulkan.so to point to an actual ICD loader instead of using
-# libvulkan.so.1
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "10"
-ALTERNATIVE:${PN} = "vulkan-loader"
-ALTERNATIVE_LINK_NAME[vulkan-loader] = "${libdir}/libvulkan.so"
-ALTERNATIVE_TARGET[vulkan-loader] = "libvulkan.so.1"
-- 
2.45.1


