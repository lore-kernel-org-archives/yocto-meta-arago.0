Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6F6EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:37:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19139.1686764270214791327
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ebzjX0Jt;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EHbmD0103166;
	Wed, 14 Jun 2023 12:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686764268;
	bh=vzSkinDZi6QDNqsWsL7ZEtxkKm5Tt3fZKJpRKH5ZlGI=;
	h=From:To:Subject:Date;
	b=ebzjX0Jtb5R6rwZAkLHX4NwswHJfTCNctUu478bO+nTdyqZrVSVesyJcfo2d5pOza
	 KdZIxu3rTWrAf78JK51qo99fUzW0XaHN+EY5qIVngxL+1Reb21nGucAMV/E6d1X7uA
	 qxVis5Uc21qI0VcTwDZ0SGrm40qjwQTTacdtpwko=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EHbmps062610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:37:48 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:37:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:37:48 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EHbmea034423;
	Wed, 14 Jun 2023 12:37:48 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q9URI-00013h-77; Wed, 14 Jun 2023 12:37:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] meta-arago-distro: Add recipe for jailhouse image
Date: Wed, 14 Jun 2023 12:37:48 -0500
Message-ID: <20230614173748.4029-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 17:37:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14633

From: Paresh Bhagat <p-bhagat@ti.com>

Add a recipe to build and package jailhouse image for am62xx devices. new
image will be named as tisdk-jailhouse-image. jailhouse recipe will
also package overlay used for jailhouse.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/images/tisdk-jailhouse-image.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
new file mode 100644
index 00000000..267fcc2d
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -0,0 +1,11 @@
+# Produces wic image for jailhouse
+
+require recipes-core/images/tisdk-default-image.bb
+
+COMPATIBLE_MACHINE = "am62xx"
+
+IMAGE_INSTALL:append:am62xx = " jailhouse"
+
+export IMAGE_BASENAME = "tisdk-jailhouse-image"
+
+WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
-- 
2.17.1


