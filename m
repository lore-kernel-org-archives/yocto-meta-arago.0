Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72B2CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 13:43:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13440.1758721379504479077
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 06:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I5Bc/RsT;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ODgvxm1681862;
	Wed, 24 Sep 2025 08:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758721377;
	bh=XhfoHfEfcPbV0FQxjVthZsHxDV7KvTMU2W0LxPI38Do=;
	h=From:To:Subject:Date;
	b=I5Bc/RsT8VxC7S7ksW78YhQ/tco4hU+9wxNMghpj8pqhVIePFbVfSKfcOEoZq16Xw
	 opcXQPGFz99mFJPJuQwGEKAyRd4BSOFz91t3w0O2gkk02r8hIcDd7Jn7Lcqpg8sfMJ
	 s7tOz+NiqB5E3NgFQ50dpI7D3kPPZfYmFSLKtFIw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ODgvVk3606116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 08:42:57 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 08:42:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 08:42:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ODgvRH1823532;
	Wed, 24 Sep 2025 08:42:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v1Plp-00053m-0H; Wed, 24 Sep 2025 08:42:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] check_yocto_rules: Flip to regex for files
Date: Wed, 24 Sep 2025 08:42:56 -0500
Message-ID: <20250924134256.18304-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 13:43:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16619

To better support changing recipe versions that have exceptions, change
to regex instead of full path for file matching.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index f6ce22a3..f8be0d01 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -4,11 +4,11 @@
     },
     "APPEND-2" : {
         "skip_vars" : [ "PR", "PV" ],
-        "files" : {
-            "meta-arago-distro/conf/distro/include/arago-prefs.inc" : {
+        "file_regex" : {
+            "meta-arago-distro\\/conf\\/distro\\/include\\/arago-prefs\\.inc" : {
                 "skip_vars": [ "PREFERRED_PROVIDER_virtual/kernel" ]
             },
-            "meta-arago-distro/recipes-graphics/emptty/emptty_0.13.0.bb" : {
+            "meta-arago-distro\\/recipes-graphics\\/emptty\\/emptty_\\S+\\.bb" : {
                 "skip_vars" : [ "GO_TAGS" ]
             }
         }
-- 
2.17.1


