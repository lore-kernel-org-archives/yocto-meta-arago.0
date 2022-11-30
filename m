Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5A1C47088
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 22:13:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26807.1669846430728518715
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 14:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=r901acXO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMDmdO080336;
	Wed, 30 Nov 2022 16:13:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669846428;
	bh=DtphCmJYGO9UPuT1f6EmIlOWdrDLXipFTtK8xbLIRII=;
	h=From:To:Subject:Date;
	b=r901acXO+3evKPV4vCFKbzFig8yRc6ib9+5BRevxEpffQ0PgwIVCkPgDMX3YNRYBn
	 Ea2ZuPChvq7nX5+G0UDNvopbItmtI8q2/dgTDfSx4GV1sjcYT9ph9mtVhT057VZOQp
	 aStCDDFkr2P9O07mC58hmdT+CtbW2oh4HKYGG8k8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUMDmGf003152
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Nov 2022 16:13:48 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 16:13:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 16:13:48 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUMDm7Z021403;
	Wed, 30 Nov 2022 16:13:48 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p0VKu-0001mQ-53; Wed, 30 Nov 2022 16:13:48 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] tisdk-addons: Remove libdrm-kms from the dependencies
Date: Wed, 30 Nov 2022 16:13:48 -0600
Message-ID: <20221130221348.6803-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Nov 2022 22:13:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14119

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


