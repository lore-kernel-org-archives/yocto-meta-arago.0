Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38598C53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 05:22:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.57581.1672723369617903679
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 21:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jJFMoKqX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3035Mm7C017126
	for <meta-arago@lists.yoctoproject.org>; Mon, 2 Jan 2023 23:22:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672723368;
	bh=r7qlTgdSgmlV9tIKwvfQDw/4WEmgpmLP7YkdYoowUCk=;
	h=From:To:CC:Subject:Date;
	b=jJFMoKqX4o5OUaP6on2NxGT8qk3rwWy2v5qFdbc2XAgCXtu8Qz+bqBiCeck2gyc3w
	 qWNP2BU0g5/D+ocJYpWN4bVm/fzXRgQ+fSUSBU5mgtq0Q673q5gwtruOo1+8sbQg/I
	 JBl04xGEcDqhpiRyfA7tRgf7MO0ND1dPmU7gnxLg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3035MmbH084631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 2 Jan 2023 23:22:48 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 2
 Jan 2023 23:22:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 2 Jan 2023 23:22:47 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3035MkoD014584;
	Mon, 2 Jan 2023 23:22:47 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [oe-layersetup][master][PATCH] Revert "configs: processor-sdk: add config for 08.05.00.13 and 08.05.00.14"
Date: Tue, 3 Jan 2023 10:52:16 +0530
Message-ID: <20230103052216.2288-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Jan 2023 05:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14140

This reverts commit 253e85b8f0fca3827cd8cbd4117a3af74ffe7e9f. These are not
the final config files for 8.05 release.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../processor-sdk-08.05.00.13-config.txt          | 15 ---------------
 .../processor-sdk-08.05.00.14-config.txt          | 15 ---------------
 2 files changed, 30 deletions(-)
 delete mode 100644 configs/processor-sdk/processor-sdk-08.05.00.13-config.txt
 delete mode 100644 configs/processor-sdk/processor-sdk-08.05.00.14-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.05.00.13-config.txt b/configs/processor-sdk/processor-sdk-08.05.00.13-config.txt
deleted file mode 100644
index cdd31cd..0000000
--- a/configs/processor-sdk/processor-sdk-08.05.00.13-config.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
-meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,702abbc518cad8412f9451adf25a2ca8edb24726,layers=
-meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.007,layers=meta-arago-distro:meta-arago-extras
-# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.007,layers=
-meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,dunfell,408bf1b4bb4f4ed126c17fb3676f9fa0513065ba,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.05.00.14-config.txt b/configs/processor-sdk/processor-sdk-08.05.00.14-config.txt
deleted file mode 100644
index f852396..0000000
--- a/configs/processor-sdk/processor-sdk-08.05.00.14-config.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
-meta-processor-sdk,https://git.ti.com/cgit/processor-sdk/meta-processor-sdk,dunfell,8d8d2240ac45f964575ae7fe4af09bf4d2efcfaf,layers=
-meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.007,layers=meta-arago-distro:meta-arago-extras
-# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.007,layers=
-meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,dunfell,408bf1b4bb4f4ed126c17fb3676f9fa0513065ba,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


