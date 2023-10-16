Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFCDCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:39:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.135464.1697481584355250629
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qii88YRd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GIdgQ5117957;
	Mon, 16 Oct 2023 13:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697481582;
	bh=F+bcnqQmdVRMd8Vjq+jRS/xXdKLcaUPDHthuL4y0v2A=;
	h=From:To:CC:Subject:Date;
	b=qii88YRd/2iYUIClK6R+3sOHEr2QlocfCc2X2LtBjC3DgpXEFD0Du/ydTU9zXxQJc
	 xVnzHz7P1jlnmc9fiPzo5DZrgJNvT6bsNjtX+dYTKRzi4sXpmlYuAFeLUOTcApVZpS
	 rnF+jk/oAiOExIMnh9PVlaruq28ZCQU6s/4Waq8w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GIdgiN070919
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 13:39:42 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 13:39:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 13:39:42 -0500
Received: from ula0226330.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GIdf74121684;
	Mon, 16 Oct 2023 13:39:41 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] branding-processor-sdk: Remove more CMEM leftovers
Date: Mon, 16 Oct 2023 13:39:41 -0500
Message-ID: <20231016183941.21511-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:39:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14936

These definitions are not needed as CMEM support has been removed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc           | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 25bb1b8c..7873daa7 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -1,10 +1,5 @@
 ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
 
-# Set CMEM reserved memory region
-RESERVE_CMEM = "${@bb.utils.contains('MACHINE_FEATURES','dsp','1','0',d)}"
-CMEM_BASE:omap-a15 ?= "a0000000"
-CMEM_SIZE:omap-a15 ?= "08000000"
-
 # To create newlines in the message \n is used and the slash must be escaped
 # to function properly
 
-- 
2.39.2


