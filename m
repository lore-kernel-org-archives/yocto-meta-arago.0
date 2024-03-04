Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81006C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:59:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.92869.1709535545466042400
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 03 Mar 2024 22:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RyMHwIM5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4246x4DO112217
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Mar 2024 00:59:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709535544;
	bh=b4fGWYNtriWS9BtovCYgb+TC5Em1qBynE7btKgJtU5A=;
	h=From:To:CC:Subject:Date;
	b=RyMHwIM5PU7lTcXOguI2W/UhVIhhPXbHhIifpj6YEGCyJvMuwLMOXdkNxlSncSqNF
	 gp9WAVqqKtMeCSstEVBD3hU/i/RaKiUYhrhkZcoTw+FfUw+SJteA7ChIJ23h0YPUr7
	 qNFW0LCjKq0AW8aibfxO063n+mS3qRDMUCUBSqV4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4246x4Ce063391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Mar 2024 00:59:04 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Mar 2024 00:59:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Mar 2024 00:59:03 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4246x3L5026307;
	Mon, 4 Mar 2024 00:59:03 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] Add description and summary for jailhouse image recipe
Date: Mon, 4 Mar 2024 12:28:53 +0530
Message-ID: <20240304065853.452896-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Mar 2024 06:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15215

Image recipe for jailhouse does not have a summary and description. Due to
which oe-layersetup also shows No Summary available for tisdk-jailhouse-image
as compared to other targets for which we have proper summary.

So to ensure good practice and help other users understand the purpose and
functionality of recipe, add a summary and description for jailhouse image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-core/images/tisdk-jailhouse-image.bb           | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index b28dfd5a..c53cf9c0 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -1,4 +1,9 @@
-# Produces wic image for jailhouse
+SUMMARY = "Arago TI SDK image for Jailhouse Hypervisor"
+
+DESCRIPTION = "Arago TI SDK image meant for running Jailhouse, a partitioning \
+Hypervisor based on Linux. This image is derived from tisdk-default-image and \
+contains additional firmware and management tools for Jailhouse.\
+"
 
 require recipes-core/images/tisdk-default-image.bb
 
-- 
2.34.1


