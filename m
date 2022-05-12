Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2DBC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 10:01:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.2343.1652349708359148949
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 03:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BUABzeIt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-adivi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CA1lsD118257
	for <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 05:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652349707;
	bh=f707eOQ62yQ+hfq7MkiOMryRrzpO36n7TO/1VExbxtg=;
	h=From:To:CC:Subject:Date;
	b=BUABzeItvAbmXk8Pny6hzeazxZWUy1ANcIkDI2Y7RXdvkUFgKPTctZzfMOkQrcm1p
	 aTmP+WFHSnDJv5yN0bAaIBWNMQzhyHahpij9Yw64RgS+oW7l2PYp/tteq7A00wZ5Kr
	 k2BIeJktGNApiUuqBSAspjUEvGcMkxHCBd6/4zsw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CA1ldN060965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 05:01:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 05:01:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 05:01:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CA1k08054071;
	Thu, 12 May 2022 05:01:46 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <devarsht@ti.com>, <a-m1@ti.com>
Subject: [meta-arago][dunfell][PATCH] qtbase-conf: Unset fixed HDMI mode
Date: Thu, 12 May 2022 15:31:43 +0530
Message-ID: <20220512100143.12268-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 10:01:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13847

HDMI mode is set to 1024x768 in eglfs_kms_cfg.json. This needs to be
unset since not all devices use the same resolution display.

When mode is not defined, the system's preferred mode is chosen.
Ref: https://doc.qt.io/qt-5/embedded-linux.html#display-output

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
index 61b834be..ac19b8ec 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
@@ -8,8 +8,7 @@
       "mode": "off"
     },
     {
-      "name": "HDMI1",
-      "mode": "1024x768"
+      "name": "HDMI1"
     }
   ]
-}
\ No newline at end of file
+}
-- 
2.17.1


