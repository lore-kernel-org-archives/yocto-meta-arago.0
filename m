Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D64C7EE2F
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 19:54:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.43576.1686513282051496754
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 11 Jun 2023 12:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GzDAB6GN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35BJsdGo003128;
	Sun, 11 Jun 2023 14:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686513279;
	bh=F4T9tsZ/hGGECPJYDWuJOMxcHnVOPB+RYwoVNy4JObk=;
	h=From:To:Subject:Date;
	b=GzDAB6GN5Zg20DHmv2NYGHIN1+iBJNOD2CBpb9QZWs1MAIy7NGkrenBBAUgAyTWC5
	 pM4VlzxVHNMtVRCU1wYEfnUrWmAROjM6OMlUB4aeYu86ZAp3t34advMo3ejM6FTpsf
	 ZZEsy0wKFHkKVoqzEqsq7sV3XuGE/HqDSNI98UtQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35BJsd76029662
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Jun 2023 14:54:39 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 11
 Jun 2023 14:54:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 11 Jun 2023 14:54:39 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35BJsdhN030957;
	Sun, 11 Jun 2023 14:54:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q8R95-0001ax-1I; Sun, 11 Jun 2023 14:54:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][RFC] meta-arago-distro: Add recipe for jailhouse image
Date: Sun, 11 Jun 2023 14:54:38 -0500
Message-ID: <20230611195438.6091-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 11 Jun 2023 19:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14590

From: Paresh Bhagat <p-bhagat@ti.com>

Add a recipe to build and package jailhouse image for am62xx-evm. new
image will be named as tisdk-jailhouse-image. jailhouse recipe will
also package overlay used for jailhouse.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/images/tisdk-jailhouse-image.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
new file mode 100644
index 00000000..7df2404a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -0,0 +1,12 @@
+# Produces wic image for jailhouse
+
+require recipes-core/images/tisdk-default-image.bb
+
+COMPATIBLE_MACHINE = "am62xx-evm"
+
+IMAGE_INSTALL:append:am62xx-evm = " jailhouse"
+
+export IMAGE_BASENAME = "tisdk-jailhouse-image"
+
+WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
+
-- 
2.17.1


