Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5043EC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 06:51:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.77269.1717397459029037822
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 02 Jun 2024 23:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ktJ0E1EO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4536owFN041179
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 01:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717397458;
	bh=X+iqAJ3g8RrD1xdPk+VTOWrlG5X8FDauwj9udq2lqes=;
	h=From:To:CC:Subject:Date;
	b=ktJ0E1EOF4r0WNck9KR98NzKXjgFx+kPz8yCxCYYCe7q3eMGsPdBzwFa9WNMnDmol
	 QKaQGVcs3Vmijym2lxsBzvYi1kBB38YncAlsiNanQVsSPXdksCYqESZzj335q5wMaw
	 D8VoPtnlCkPITHedjfDw0F/tb86+b2+4y+njJNU8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4536owMZ086248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 01:50:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 01:50:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 01:50:58 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4536ovQi098326;
	Mon, 3 Jun 2024 01:50:57 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: packagegroup-arago-tisdk-addons: Add watchdog
Date: Mon, 3 Jun 2024 12:20:55 +0530
Message-ID: <20240603065055.2824576-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Jun 2024 06:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15351

Add watchdog daemon which is an essential utility to check if
your system is still working.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index d25c9eb1..0db51a40 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -18,6 +18,7 @@ UTILS = " \
     open62541-examples \
     open62541-tests \
     sudo \
+    watchdog \
 "
 
 UTILS_UBOOT_FW = "libubootenv-bin"
-- 
2.34.1


