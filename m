Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B515EB64DA
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 21:41:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.25883.1688161302857223232
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jun 2023 14:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B4l7yuMo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35ULff5W092995;
	Fri, 30 Jun 2023 16:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688161301;
	bh=7IfDHSB1Ts9/yhKG8ZtYnJSRR+jDiUC9uS8fFhFU1wg=;
	h=From:To:Subject:Date;
	b=B4l7yuMoZQIkz6tdBJYHxd8f5IEWRzqlCaQT6ZF0N/yMJcz/nyt6t2+sGqy5YRj3f
	 Zu7pBUBwG1pCO5dMO8agvUB1mPiURDKWJsLyqKaXALaz/H0a7Bsh6z4WlpLMN5l7wI
	 Cc5kZbCDSgYDpmyIdczyyRwE2LDhyUwvyZj4rGtM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35ULffOJ001602
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Jun 2023 16:41:41 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 Jun 2023 16:41:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 Jun 2023 16:41:41 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35ULffDP004307;
	Fri, 30 Jun 2023 16:41:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qFLs5-000392-9C; Fri, 30 Jun 2023 16:41:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-bundle: Change name of image files when extracting rootfs files
Date: Fri, 30 Jun 2023 16:41:41 -0500
Message-ID: <20230630214141.12048-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jun 2023 21:41:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14743

There was a recent commit on oe-core master [1] that changes how the
names of the images files are built up.  This recipe uses a number of
variables to assembles the path to the images files so that it can
extract part of the rootfs.  We need to update that path to match
what upstream is now producing.

[1] https://git.openembedded.org/openembedded-core/commit/?id=26d97acc71379ab6702fa54a23b6542a3f51779c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index dbdc9a5a..83938d52 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -756,9 +756,9 @@ tisdk_image_build () {
     do
         for type in ${TARGET_IMAGE_TYPES}
         do
-            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ]
+            if [ -e ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.rootfs.${type} ]
             then
-                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.${type} ${IMAGE_ROOTFS}/filesystem/
+                cp ${DEPLOY_DIR_IMAGE}/${image}-${MACHINE}.rootfs.${type} ${IMAGE_ROOTFS}/filesystem/
             fi
         done
     done
-- 
2.17.1


