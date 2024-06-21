Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0878C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:06:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.70325.1718967968053254364
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 04:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AW8SqdWu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LB67Hl018473
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Jun 2024 06:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718967967;
	bh=g9V0JMlcYF4XtLCy8YC1f3mX8gW/mZynfZCblRPWsn0=;
	h=From:To:CC:Subject:Date;
	b=AW8SqdWu7t7EWg96XE5FdViZuf5nDm4K6r5LwQgjsen5t7Ln3jUiNbMQYXKZvED73
	 0SKiQvdU6PTCfplL+if1NazJXxgu7a1QM9aX4aC9vj5almdVoA5io8gVle7zy54phK
	 PQCMDGmOSBFnqu4TdkKG7Yk/Y8hLvVKbPNk8mhaQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LB67xk010444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Jun 2024 06:06:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 06:06:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 06:06:07 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LB67HA109737;
	Fri, 21 Jun 2024 06:06:07 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [master/scarthgap][PATCH] packagegroup-arago-tisdk-connectivity: add cc33xx utilities and firmware
Date: Fri, 21 Jun 2024 06:05:58 -0500
Message-ID: <20240621110558.1649323-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Jun 2024 11:06:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15409

Enable meta-arago with the required firmware and relevant tools
for operation of the cc33xx WLAN device and kernel driver.

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---

Please note this patch is dependent upon the following series:
https://patchwork.yoctoproject.org/project/ti/list/?series=25844 

---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 623ffc49..7cf2b53b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -27,6 +27,10 @@ WLAN_TI = "\
     wl18xx-calibrator \
     wl18xx-target-scripts \
     wl18xx-fw \
+    cc33xx-fw \
+    cc33xx-target-scripts \
+    cc33conf \
+    cc33calibrator \
 "
 
 BT_COMMON = "\
-- 
2.34.1


