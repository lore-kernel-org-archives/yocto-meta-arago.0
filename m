Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B04C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:09:10 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.39456.1741792147314538303
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nepC8Yo0;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF96Hs1533609
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 10:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792146;
	bh=V1Dt9KTjM/6b39SAjSoDHuAEz/NfyMrn+ZH+jmkHRZQ=;
	h=From:To:Subject:Date;
	b=nepC8Yo0LLBvAI5qQJjyQThXvb9ymyD5kDb6pBtvK1qG/7fx9xqiwSMkWZBnIXSK5
	 mq9zFjDPb54Aar0aucImIRabTtuPkRSf8UDrMQfMi5H/F73FWKbrj2qW3vrZT4qtoj
	 eD88NIDqHkuv19k333ntbVMeJDkSfynpWMVJXDrk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF969d035150;
	Wed, 12 Mar 2025 10:09:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:09:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:09:05 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF95Hx035384;
	Wed, 12 Mar 2025 10:09:05 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNhh-0001m6-DT; Wed, 12 Mar 2025 10:09:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: layer.conf: Remove SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Wed, 12 Mar 2025 10:09:05 -0500
Message-ID: <20250312150905.6783-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 15:09:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16010

Remove the setting of SIGGEN_EXCLUDERECIPES_ABISAFE as it is no longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/conf/layer.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 38a4f267..262a64ef 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -22,7 +22,3 @@ LAYERDEPENDS_meta-arago-extras = " \
     networking-layer \
     openembedded-layer \
 "
-
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    gstreamer1.0-plugins-bad \
-"
-- 
2.17.1


