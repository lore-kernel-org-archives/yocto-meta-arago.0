Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C7C30658
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 16:53:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1290.1719593621333350298
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 09:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YkHosamN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45SGrcvp087483;
	Fri, 28 Jun 2024 11:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719593618;
	bh=8ch0JSToAwjCtdYnD0bea+6BgruwCH6bVE8k3kgDgAs=;
	h=From:To:CC:Subject:Date;
	b=YkHosamNBfM4HEqLxosmvBnNM0nEjGq5eQiQLUJeBJjaFFCxFHWqyv4k/EK27JQuv
	 LzHcr77DWxkFQVUZPiYJqu7iaaiKD23wTIMcJ9GGH0YAsyVLy5a5DjG1n8PJ4pm/KB
	 AWwkZvjz9nCZc2HUzS3zPcRSRlZ0fytJaARw09tY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45SGrcOC011239
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 11:53:38 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 11:53:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 11:53:38 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45SGrcdQ106206;
	Fri, 28 Jun 2024 11:53:38 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] vulkan-cts: remove workaround for createMeshShaderMiscTestsEXT
Date: Fri, 28 Jun 2024 11:52:52 -0500
Message-ID: <20240628165251.2970123-2-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jun 2024 16:53:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15418

From: Randolph Sapp <rs@ti.com>

This change has been introduced into meta-openembedded scarthgap as of
commit: 952ea2bab1a0d444d48372e88328a9d78ef4e3f8

This reverts commit 0aeecfdf013d4b374414897a72a07d5d4ffacd2b.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Should have know the second I submitted a temp fix that the upstream fix would
be merged :)

 .../recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend      | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend

diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
deleted file mode 100644
index 7af2057f..00000000
--- a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
-OECMAKE_CXX_FLAGS:remove:toolchain-gcc:aarch64 = "-O2"
-- 
2.45.1


