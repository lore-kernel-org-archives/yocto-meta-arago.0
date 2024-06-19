Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0712AC2BA18
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 01:49:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10911.1718761735092750260
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 18:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=svxS88wO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45J1mqXg077911;
	Tue, 18 Jun 2024 20:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718761732;
	bh=TzCruI05XUmjFkeZNvweeupeTlOBW1mQrC5U2G9eKDE=;
	h=From:To:CC:Subject:Date;
	b=svxS88wOyUDvRIvltKEHB6sMcXXBREfcM204pq4YatOU8iIqFGcH4ENyNPX9qF3wB
	 /fjHFJM/vKcpT0rbIAmUOvbsPREN0E7F9UUNiDKi/y7Hxpan167BbTLcAfG08qmX5s
	 phKa3urSFYPmeQZdjus/eTMmBYnqbMakOShX2bqU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45J1mqx9055951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 20:48:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 20:48:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 20:48:52 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45J1mpRG030499;
	Tue, 18 Jun 2024 20:48:51 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-distro: recipes-tisdk: Drop oe-layersetup
Date: Wed, 19 Jun 2024 07:18:45 +0530
Message-ID: <20240619014845.1700633-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Jun 2024 01:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15402

- Users are advised to clone oe-layersetup to trigger
yocto builds [1] for machine configurations that are
under meta-ti.

- So having a recipe for it in Yocto doesn't make any sense,
hence drop it.

[1]: https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_02_01_10/exports/docs/linux/Overview_Building_the_SDK.html#build-steps

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-tisdk/oe-layersetup/oe-layersetup.bb    | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb

diff --git a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb b/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
deleted file mode 100644
index 1600b679..00000000
--- a/meta-arago-distro/recipes-tisdk/oe-layersetup/oe-layersetup.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Package that contains a script to setup oe-core development environment"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PR = "r1"
-
-inherit allarch
-
-BRANCH ?= "master"
-SRCREV = "e58f941784fb45fd826779a45b33973e6342700f"
-SRC_URI = "git://git.ti.com/git/git/arago-project/oe-layersetup.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-- 
2.34.1


