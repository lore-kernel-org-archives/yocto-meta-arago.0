Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934D6EB64DA
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 01:11:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.29722.1688173868821520932
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jun 2023 18:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GYrP4nZ+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3611B42g118642;
	Fri, 30 Jun 2023 20:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688173864;
	bh=u9/+zfQnPZb4fY4tJAPA5Qh+1xEhdhtN+zHu8T1Bf+Q=;
	h=From:To:Subject:Date;
	b=GYrP4nZ+RrxAVYYmkAySWlupcTA83Q6aP2dUnfw2VQfT7LE7nVpNo8JqiWT6GdXs4
	 KUBc+9xQyd7cz7vNGdSF83YUGB2h9diEuQ95hrkhPGl0vRpXwG5rHMgLOj680xBDSj
	 6XYS5izp1+ork8QmUskac2RPhTBypdbOzRGUrUgQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3611B4YR013531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Jun 2023 20:11:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 Jun 2023 20:11:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 Jun 2023 20:11:04 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3611B4vl052195;
	Fri, 30 Jun 2023 20:11:04 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qFP8h-0002Iy-Vi; Fri, 30 Jun 2023 20:11:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] tisdk-bundle: Change name of image files when extracting rootfs files
Date: Fri, 30 Jun 2023 20:11:03 -0500
Message-ID: <20230701011103.8820-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 01 Jul 2023 01:11:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14746

There was a recent commit on oe-core master [1] that changes how the
names of the images files are built up.  This recipe uses a number of
variables to assembles the path to the images files so that it can
extract part of the rootfs.  We need to update that path to match
what upstream is now producing.

[1] https://git.openembedded.org/openembedded-core/commit/?id=26d97acc71379ab6702fa54a23b6542a3f51779c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: After testing, there were more places I needed to add the
    rootfs to a path.

 meta-arago-distro/classes/tisdk-bundle.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index dbdc9a5a..34349db3 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -408,12 +408,12 @@ sw_manifest_target() {
     for image in ${TARGET_IMAGES}
     do
         # Only extract tar.gz or tar.bz2 types
-        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz ]
+        if [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.rootfs.tar.xz ]
         then
-            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
-        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz ]
+            tar xJf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.rootfs.tar.xz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+        elif [ -e ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.rootfs.tar.gz ]
         then
-            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
+            tar xzf ${IMAGE_ROOTFS}/filesystem/${image}-${MACHINE}.rootfs.tar.gz -C ${IMAGE_ROOTFS}/filesystem --wildcards *.control
         fi
     done
 
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


