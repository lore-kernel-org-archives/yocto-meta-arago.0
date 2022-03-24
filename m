Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B946EC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 19:02:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15442.1648148531349529393
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 12:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b2J0Lpnk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22OJ27Kk104976;
	Thu, 24 Mar 2022 14:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648148527;
	bh=BIqHiMqNtuxZ+5q7rN4F1asVa9M4Evd1je5QEChM2bo=;
	h=From:To:Subject:Date;
	b=b2J0LpnkF7nnW5NzC6qw7pcDHQ3hM4kluJvE8z1b6LPaeaimSYnk01qDhYOOdbwJ4
	 YQpZpdm3uTTk8+pntp0MlM83bOzI0vfkuG+5BOE7trpdiTVo1am4z0ao1CZmjyaoY2
	 F3VIitf461tdUYUpgMMVi8Ts912dWSzkb/4k4RDI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22OJ27bE042994
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 14:02:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 14:02:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 14:02:07 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22OJ27uj107981;
	Thu, 24 Mar 2022 14:02:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nXSik-0007yY-RX; Thu, 24 Mar 2022 14:02:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH v3] images: Build
 tisdk-thinlinux-image with tisdk-core-bundle
Date: Thu, 24 Mar 2022 14:02:06 -0500
Message-ID: <20220324190206.30619-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 19:02:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13751

Add tisdk-thinlinux-image to the list of TARGET_IMAGES for
tisdk-core-bundle.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3 - Move patch versions to the correct location in the email.
v2 - Fix typos in commit message.

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


