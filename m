Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F849C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 15:39:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.45004.1655825943135803660
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 08:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mArNSnV7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25LFd1EV027695;
	Tue, 21 Jun 2022 10:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655825941;
	bh=TWuYAkl4rlTu2N5fi13phua9+vOBB2uo/hY+S71u8Qo=;
	h=From:To:CC:Subject:Date;
	b=mArNSnV7+6J/naYONACFyNQ/nPMFPUxWZlC/90F4cajiIwqzAEx3Jzo2q0veDYO7g
	 UVawE/drV5HZgSlnTb+bkGZJ9JqXHvmLTDzlzV1wSq0edZae4nq651RO96OYBpAJCw
	 TDqRY87OwPLVHyX6XfJkATX1S0s5j2Ma7l8E/R/M=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25LFd0qs022738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jun 2022 10:39:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Jun 2022 10:39:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Jun 2022 10:39:00 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25LFd0tf116520;
	Tue, 21 Jun 2022 10:39:00 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell/master][PATCH] tisdk-bundle: fix prebuilt-images
 U-Boot binary name for HS
Date: Tue, 21 Jun 2022 10:39:00 -0500
Message-ID: <20220621153900.27066-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jun 2022 15:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13912

HS builds do not generate a -${MACHINE} version of the u-boot.img binary.
Not sure why we deploy these named this way to begin with, maybe a left-
over from when we had multiple machines per SDK.. To fix the HS builds
lets ship the binary named as-is for all platforms.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 7e3f4c26..9e961e1b 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -777,9 +777,9 @@ tisdk_image_build () {
     fi
 
     # Copy the U-Boot image if it exists
-    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ]
+    if [ -e ${DEPLOY_DIR_IMAGE}/u-boot.img ]
     then
-        cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.img ${prebuilt_dir}/
+        cp ${DEPLOY_DIR_IMAGE}/u-boot.img ${prebuilt_dir}/
     elif [ -e ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ]
     then
         cp ${DEPLOY_DIR_IMAGE}/u-boot-${MACHINE}.bin ${prebuilt_dir}/
-- 
2.36.1


