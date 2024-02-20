Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3670AC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:19:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.15504.1708442368865559901
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hcpHKMAw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KFJR6w029055;
	Tue, 20 Feb 2024 09:19:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708442367;
	bh=uwwrPJiAsmrgoB7YxPSE+xZBLhw3AZUATr3VXM8RVnI=;
	h=From:To:CC:Subject:Date;
	b=hcpHKMAwrQuW2l+HaLk7trxNG6ojTr/LwAjTFJtdFZMduavUY3AlrtRv1kGYgyNYT
	 fisx5Nhm51v6GCjDikT6IRl+6OCnPfiuxf13jTE/1pWH+7mxvInJFV84KxBncysUPG
	 HWPEITsPtAad9IFiRzL90jG3CNeUrpE3t5p1KT2s=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KFJR8u010439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Feb 2024 09:19:27 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 09:19:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 09:19:27 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KFJRmH084598;
	Tue, 20 Feb 2024 09:19:27 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2] packagegroup-arago-tisdk-addons: Disable big-data-ipc-demo
Date: Tue, 20 Feb 2024 09:19:26 -0600
Message-ID: <20240220151926.16264-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:19:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15203

Temporarily disable big-data-ipc-demo until a fix for missing
kernel header dma_buf_phys.h is complete.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Comment out whole section

 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 4dec290a..11d10596 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -88,9 +88,9 @@ EXTRA_PACKAGES:omapl138 = " \
 EXTRA_PACKAGES:append:omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES:append:omapl138 = " ti-ipc-examples-linux"
 
-EXTRA_PACKAGES:append:omap-a15 = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
-"
+#EXTRA_PACKAGES:append:omap-a15 = " \
+#    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big-data-ipc-demo-firmware','',d)} \
+#"
 
 # acontis-atemsys
 #EXTRA_PACKAGES:append:am335x-evm = " pruss-lld-apps"
-- 
2.39.2


