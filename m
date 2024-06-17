Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A01CC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:37:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.60144.1718638646322004476
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 08:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VGak+OdK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HFbP21044447;
	Mon, 17 Jun 2024 10:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718638645;
	bh=FYtM6w0OkRXLtsxS2hKFv0GeOuTt9E4JTOfwfdXi44Q=;
	h=From:To:Subject:Date;
	b=VGak+OdKMZjRs8Z18Gip41qtVrz+ocE4OkFFN9LwZSA+HQSS5wk6Wsllcy7x9TLjZ
	 IZPlBo4bObf/IZH6CiOOS4vnZviUnMUVGnGX5jjGJH2yb+XLGl3QDsZa+/D8VaCXHQ
	 SwU1cN42RRDQtofyjoujZJc6zf/LDzIrfGlj8Dic=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HFbPSb092123
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 10:37:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 10:37:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 10:37:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HFbOCN047761;
	Mon, 17 Jun 2024 10:37:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sJEQ8-0004UQ-N2; Mon, 17 Jun 2024 10:37:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH]  packagegroup-arago-tisdk-addons: Remove nodejs dependencies
Date: Mon, 17 Jun 2024 10:37:24 -0500
Message-ID: <20240617153724.17219-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Jun 2024 15:37:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15394

Since there are no direct dependencies on nodejs/nodejs-npm in any
meta-arago recipes, we are removing the dependency to reduce the build
time.  If another layer using meta-arago needs nodejs/nodejs-npm then
they should have the dependency for those packaged in their recipes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6954e933..aaf53f3d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -76,8 +76,6 @@ UTILS:append:dra7xx = " \
 #"
 
 EXTRA_PACKAGES = " \
-    nodejs \
-    nodejs-npm \
     protobuf \
     ccief-basic \
     python3-pip \
-- 
2.17.1


