Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03B9E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:01:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.91956.1734469300621659547
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 13:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C5qof1BX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL1coM041764;
	Tue, 17 Dec 2024 15:01:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469298;
	bh=J0pXAUAKtEHPsfB0uVhI+g2KIm1u9XfMLQeJiwtUaRI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C5qof1BXMN9GukHyzIhXOuhIMxpLLfrXOQLLVdse0ooXP9kqyueRdKH1V51mIfLJU
	 ZOX/vxoNeWgOFxNNK1VXb1JRcYU4HEIfnh5vJhtcSYcSwUE4VpgxTA7vo2QJ6K5rCQ
	 sPiwUBVDGHgyGmT37caRPonegJnzE0VawNUCydJg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHL1c3V008052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:01:38 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:01:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:01:38 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHL1bb7111989;
	Tue, 17 Dec 2024 15:01:38 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 2/2] branding: Disable missing hardware support in the BSP layer
Date: Tue, 17 Dec 2024 15:01:37 -0600
Message-ID: <20241217210137.46974-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217210137.46974-1-afd@ti.com>
References: <20241217210137.46974-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Dec 2024 21:01:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15664

Currently MACHINE_FEATURES are disabled based on branding, but the
branding is not what determines if these are functional, the BSP version
does. While we do select the BSP version here, what is supported or not
by a given version is a property of the BSP layer. Disabling missing
MACHINE_FEATURES for each version should be handled there.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc    | 5 -----
 meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 48fe36e1..3eed685a 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -7,8 +7,3 @@
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY:pn-ti-ipc-rtos = "15"
-
-# GC320 support requires out-of-tree drivers not available in until LTS prep is
-# complete. Disable for now.
-# Remove gc320 - the driver fails to build with gcc12
-MACHINE_FEATURES:remove = "gc320"
diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
index 415eee8d..21e33662 100644
--- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -1,5 +1 @@
 TI_PREFERRED_BSP = "ti-6_12"
-
-# GC320 support requires out-of-tree drivers not available in until LTS prep is
-# complete. Disable for now.
-MACHINE_FEATURES:remove = "gc320"
-- 
2.39.2


