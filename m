Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556EDC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:48:59 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.694.1752763731599978169
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 07:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tyLUEr0j;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HEmo87034190;
	Thu, 17 Jul 2025 09:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752763730;
	bh=Y6rPH6w60XzxhmXQ0l3ehaeV/rQBejuDA2UeskKgqQc=;
	h=From:To:Subject:Date;
	b=tyLUEr0jUGDF4dLAbS8U7SCSL1fZEbTK38UxOWZCc/wzrL4dSPRVv1H25NOmeuCbU
	 OWjfGc1qwmNVicd/XnJLD2/ew+GxCZoU+pLll30mtLr5KmWbQWPe3fvhCntlYQh350
	 Rv7g0zNEWml5bL66NwXtk5IYO5UNXXKuY1mtcMPk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HEmoST2259046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 09:48:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 09:48:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 09:48:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HEmoxW2023500;
	Thu, 17 Jul 2025 09:48:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ucPuj-00008W-Ow; Thu, 17 Jul 2025 09:48:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 1/3] check_yocto_rules: Add new rules
Date: Thu, 17 Jul 2025 09:48:47 -0500
Message-ID: <20250717144849.471-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Jul 2025 14:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16305

- RPROVIDES does not need the space check for APPEND-1.
- emptty recipe does not need a space for GO_TAGS in APPEND-2.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 9cf776df..f6ce22a3 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -1,12 +1,15 @@
 {
     "APPEND-1" : {
-        "skip_vars" : [ "FILES", "RDEPENDS" ]
+        "skip_vars" : [ "FILES", "RDEPENDS", "RPROVIDES" ]
     },
     "APPEND-2" : {
         "skip_vars" : [ "PR", "PV" ],
         "files" : {
             "meta-arago-distro/conf/distro/include/arago-prefs.inc" : {
                 "skip_vars": [ "PREFERRED_PROVIDER_virtual/kernel" ]
+            },
+            "meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb" : {
+                "skip_vars" : [ "GO_TAGS" ]
             }
         }
     },
-- 
2.17.1


