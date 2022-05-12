Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5895C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 15:51:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.388.1652370684159339135
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 08:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NLA5FJ3T;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CFpLOe088125;
	Thu, 12 May 2022 10:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652370681;
	bh=WFZY6yTleGPj7uIzlg52fJYOJNgWUvshqvxTXxEnilA=;
	h=From:To:CC:Subject:Date;
	b=NLA5FJ3TmTdhwIZ+VKQeVx67JR2hKjOLx2tJZAYNs5ZNvGNJNCjWGyEpJRM1zu0JC
	 itvMoaAoCJnJG8385hDUabF9FgADlmfk7cgwSzdGc+5TY6zZZK3vlVVNFGvE3IrqKV
	 +3q+rUBVOB3juxIK+fHdJ2BRgcLUfxp1q3a484Lc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CFpL7D032107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 10:51:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 10:51:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 10:51:20 -0500
Received: from uda0867391.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CFpKmg001586;
	Thu, 12 May 2022 10:51:20 -0500
From: Darren Etheridge <detheridge@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>, <denis@denix.org>
CC: <detheridge@ti.com>
Subject: [meta-ti][dunfell][PATCH] ti-graphics: update for 4K/64K page size
 GPU drivers
Date: Thu, 12 May 2022 10:51:07 -0500
Message-ID: <20220512155107.19390-1-detheridge@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 15:51:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13851

Pull in the GPU KM/UMLIBS that enable the unified 4K/64K page
firmware support in the IMG Rogue drivers.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---

Ryan, this is needed for rc4

 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb     | 6 +++---
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb             | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 6d2d68cd..718c7845 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -7,7 +7,7 @@ inherit module features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -17,7 +17,7 @@ DEPENDS = "virtual/kernel"
 
 PROVIDES = "virtual/gpudriver"
 
-BRANCH = "linuxws/dunfell/k5.10/${PV}"
+BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 
 SRC_URI = " \
     git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
@@ -26,7 +26,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
+SRCREV = "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 0f3f9192..1bfb2b93 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -10,12 +10,12 @@ REQUIRED_MACHINE_FEATURES = "gpu"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
 
-PR = "r1"
+PR = "r2"
 
-BRANCH = "linuxws/dunfell/k5.10/${PV}"
+BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
-SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
+SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
-- 
2.17.1


