Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52CBC6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:34:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1097.1675899241026273628
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cHck70G/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NY0di059451;
	Wed, 8 Feb 2023 17:34:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899240;
	bh=5q/FrbjLbE5Un0i0Vdred+Wod9iI5ZsXnnx2XxPKqaA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cHck70G/qnxf2axLnRE9z8KxCXSrzAC15PJQyx2XyDOvOYJkZ1FGWMdBlqnVbxPFX
	 CBudIkaBLGW+h4dkrmFGt+W0JcndQnD8YlmUJQ1X+JZAfc1XIoO1a++6giYjY1RY/H
	 6az6OXnbNiYLTryJA6I4HyIY14nXRopEXX2Ud0/s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NY0wa024647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:34:00 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:33:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:33:59 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NXwlG002011;
	Wed, 8 Feb 2023 17:33:59 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 3/3] qtbase-conf: Drop unneeded eglfs_kms_cfg settings
Date: Wed, 8 Feb 2023 17:33:58 -0600
Message-ID: <20230208233358.19714-3-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208233358.19714-1-afd@ti.com>
References: <20230208233358.19714-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14209

The output selection happens automatically and correctly now. The set
output selection was only correct for one old EVM before. Drop this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json     | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
index ac19b8ec..5667d11f 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
@@ -1,14 +1,5 @@
 {
   "device": "/dev/dri/card0",
   "hwcursor": false,
-  "pbuffers": true,
-  "outputs": [
-    {
-      "name": "VGA1",
-      "mode": "off"
-    },
-    {
-      "name": "HDMI1"
-    }
-  ]
+  "pbuffers": true
 }
-- 
2.39.1


