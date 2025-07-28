Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3536CC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 18:39:29 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.89268.1753727966124485244
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 11:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AsfFFkT9;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SIdNcG2788067;
	Mon, 28 Jul 2025 13:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753727963;
	bh=OBaDNj1w/ANdz2M3agsmwRLvKoP9nD2PnzV2onXPoxY=;
	h=From:To:CC:Subject:Date;
	b=AsfFFkT9HdTa1cT5UvM1jAXr8FRK4Q1r+yvCsqGnb7SWSFafTs1zAEmf8m2Cngpcn
	 ec4+9RK5JC1rbkU7jxqNakUfSIVNaNmX8i0m/UFdWKrkjU5MQXEn7yMofzCDnsy4Xc
	 u4XSzre2h5PJlzu238k21K7rSJ9p7fTXIT7WISIo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SIdNA82209011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 13:39:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 13:39:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 13:39:23 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SIdNf32501453;
	Mon, 28 Jul 2025 13:39:23 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/2] tisdk-uenv: Do not deploy to prebuilt images dir from recipe
Date: Mon, 28 Jul 2025 13:39:21 -0500
Message-ID: <20250728183922.580652-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 18:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16333

The "prebuilt-images" dir is not part of any normal filesystem, it is
for our "TI-SDK" bundle, so this file should be placed there by that
bbclass, not as part of normal package building.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass       |  6 ++++++
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb           | 12 +++---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index a554a261..fb2073ef 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -179,6 +179,12 @@ tisdk_image_build () {
         return 1
     fi
 
+    # Copy the U-Boot uEnv.txt file if is exists
+    if [ -e ${DEPLOY_DIR_IMAGE}/uEnv.txt ]
+    then
+        cp ${DEPLOY_DIR_IMAGE}/uEnv.txt ${prebuilt_dir}/
+    fi
+
     # Copy the Kernel image if it exists
     if [ -e ${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin ]
     then
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 1fb83acd..2f17d973 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Install a uEnv.txt file into the SDK prebuilt-binaries directory"
+SUMMARY = "Add a uEnv.txt file into the deploy directory"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
@@ -6,20 +6,14 @@ SRC_URI = "\
     file://uEnv.txt \
 "
 
-PR = "r3"
+PR = "r4"
 PV = "1.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}"
 
-do_install () {
-    install -d ${D}/board-support/prebuilt-images
-
-    install -m 0644 ${S}/uEnv.txt ${D}/board-support/prebuilt-images/
-}
-
-FILES:${PN} += "board-support/*"
+inherit nopackages
 
 # deploy files for wic image
 inherit deploy
-- 
2.39.2


