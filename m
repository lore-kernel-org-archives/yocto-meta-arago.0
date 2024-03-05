Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5F9C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:12:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1608.1709665928054695954
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 11:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vv8ISK6n;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425JC6kS098986;
	Tue, 5 Mar 2024 13:12:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709665926;
	bh=qQ1S0T+i+UgWNQygeEI6KvESsXf4Bd4C1hEN+CbeVFQ=;
	h=From:To:CC:Subject:Date;
	b=Vv8ISK6n6K8u0zrxAybtSj0xmR4vMCcaFUId6PwDtmeUIWUiEMmu4bAJr/DVylHBn
	 j83m2Cmtpq5y+Wo28GD13as18squSHm/oMkjFHOQkG9elmWGd4L6ZbDQTEKKC+CZbn
	 X1EpjI3PasDI7JoF0VFSOI9xbpnl0PY6dmYJtMNw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425JC642121016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 13:12:06 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 13:12:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 13:12:06 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425JC689107160;
	Tue, 5 Mar 2024 13:12:06 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] make-mod-scripts: Remove append for CROSS_COMPILE
Date: Tue, 5 Mar 2024 13:12:05 -0600
Message-ID: <20240305191205.67958-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 19:12:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15221

This has been fixed upstream. Remove this bbappends.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bbappend               | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend

diff --git a/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend b/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
deleted file mode 100644
index b76af9fc..00000000
--- a/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-EXTRA_OEMAKE += "CROSS_COMPILE=${TARGET_PREFIX}"
-- 
2.39.2


