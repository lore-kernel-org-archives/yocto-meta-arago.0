Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FA1C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 12:19:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12365.1716985143792279833
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 May 2024 05:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NJgTUzuV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44TCJ0hj026795;
	Wed, 29 May 2024 07:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716985140;
	bh=Rwnrdn0PRNEyNM6+o0Zyuh6ODCugmnJ2awPme9rfRAw=;
	h=From:To:CC:Subject:Date;
	b=NJgTUzuVHgrjC5Vm46Q9KF2dpDYmivWjl1X96xGHv/Bpa5E2IubL7hJFFwM97cFYr
	 y5ScwYu8WKIKUXyCSCGOaIkF9PTVuqKtTjnvfbvSCvmFQubwAS++4MOHEtSIE+2vFK
	 xnbvOES2iZyMR5vpXp6XYHeFIJKGXCgM1/Axe7UE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44TCJ0BC017761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 May 2024 07:19:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 May 2024 07:19:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 May 2024 07:19:00 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44TCIx31051128;
	Wed, 29 May 2024 07:18:59 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: tisdk-core-bundle: Update DEPLOY_IMAGES_NAME
Date: Wed, 29 May 2024 17:48:38 +0530
Message-ID: <20240529121838.879330-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 May 2024 12:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15340

- For k3 platforms, deploy Image, fitImage & fitImage-its files in tisdk-core-bundle

- For ti33x & ti43x platforms, deploy extlinux.conf file in tisdk-core-bundle

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 9c2bb015..edbea302 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -10,11 +10,13 @@ require tisdk-core-bundle.inc
 DEPLOY_SPL_NAME:omapl138 = ""
 DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 
-DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin"
+DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin Image fitImage fitImage-its-${MACHINE}"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x_sr2-gp-evm.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-hs-evm = " sysfw-am65x_sr2-hs-evm.itb"
+DEPLOY_IMAGES_NAME:append:ti33x = " extlinux.conf"
+DEPLOY_IMAGES_NAME:append:ti43x = " extlinux.conf"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}${ARAGO_IMAGE_SUFFIX}"
-- 
2.34.1


