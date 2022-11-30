Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5CCC47088
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:17:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.26681.1669846643977855899
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XH/dYlDI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMHLOp130658;
	Wed, 30 Nov 2022 16:17:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669846641;
	bh=DtphCmJYGO9UPuT1f6EmIlOWdrDLXipFTtK8xbLIRII=;
	h=From:To:Subject:Date;
	b=XH/dYlDI3UanApejcS07bW01qpsl8tDlVS21ikXB4oVGvdNF06xhz38ex625wLO7Z
	 wb0eR3qkKgh0bH/u/SwKAQufaZqNX12yAH7RkHdIw98MtTOu+SO7zhfPknLYppgdoH
	 UOPxoCyErlNpv5/FrFGVGV2fwJtfatag6Wa8TD0s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUMHLwo068890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Nov 2022 16:17:21 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 16:17:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 16:17:21 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMHLq2001965;
	Wed, 30 Nov 2022 16:17:21 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p0VOL-0002Kt-FJ; Wed, 30 Nov 2022 16:17:21 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-addons: Remove libdrm-kms from the dependencies
Date: Wed, 30 Nov 2022 16:17:21 -0600
Message-ID: <20221130221721.8936-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:17:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14123

KMS support was removed from DRM upstream [1].  If it does not exist,
then we should not depend on it.

[1] https://gitlab.freedesktop.org/mesa/drm/-/commit/2b997bb4bb688be00620887c8646ff24ccb9396b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 07ae8b07..e6368267 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -16,7 +16,6 @@ UTILS = " \
     oprofile \
     netkit-ftp \
     ptpd \
-    libdrm-kms \
     strongswan \
     kexec \
     kdump \
-- 
2.17.1


