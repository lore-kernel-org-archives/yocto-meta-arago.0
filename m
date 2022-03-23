Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF90C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 15:34:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.10737.1648049694283835403
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o29BR9MR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NFYqXw032410;
	Wed, 23 Mar 2022 10:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648049692;
	bh=CqhJtvzffbjTLLcXKL5wfoj4UgsmiyvlscVI1uYB+BU=;
	h=From:To:Subject:Date;
	b=o29BR9MRamNJaz9gBG4aPfOSxtziaVC8EGqKuUB89CB1lImuDjQXebjL8c5e+UJvg
	 Sa70BB1D22OGnaYJAnkdFj1BTOFJaedsUglP9xT85wGoUeThYX1SK1edQnP0dGVuFL
	 GoeYFXPRfGnmZ6sppjex2bDsijskpb+RQZB3I5bg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NFYqho005430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 10:34:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 10:34:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 10:34:51 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NFYp2Y125186;
	Wed, 23 Mar 2022 10:34:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nX30d-00043P-Pu; Wed, 23 Mar 2022 10:34:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH v2] images: Build
 tisdk-thinlinux-image with tisdk-core-bundle
Date: Wed, 23 Mar 2022 10:34:51 -0500
Message-ID: <20220323153451.15543-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 15:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13726

Add tisdk-thinlinux-image to the list of TARGET_IMAGES for
tisdk-core-bundle.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>

-
v2 - Fix typos in commit message.

---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 9f0e65db..5ce688ef 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -32,7 +32,7 @@ DTB_FILTER_am65xx = "am65"
 DTB_FILTER_j7 = "j721e"
 
 # List of target side images to build for the SDK
-TARGET_IMAGES = "tisdk-base-image tisdk-default-image"
+TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image"
 
 # dra71 lcard requires an initramfs with modules for NFS boot
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
-- 
2.17.1


