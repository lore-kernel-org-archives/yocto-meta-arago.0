Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E423C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:02:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.75919.1673280176449034558
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wpu22BkR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309G2q93024616;
	Mon, 9 Jan 2023 10:02:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673280172;
	bh=juCE/w9E2xcquAyg4RZWMmgUokqxf3vz8fLDsBfq4e8=;
	h=From:To:CC:Subject:Date;
	b=wpu22BkR5zSj9K/ri1fhrwfrHWjOiVvEZsewHBup92kduU9XlKIJxIh4DE65n/Mwk
	 hYwtvdRU/RB/gDu/rs6fxNVqJqiPF7WYKMykDd0mBq2wEu3pU6n/y33q8cNhH1y8i/
	 qQeuwM53g/DAQPuKmPIScgxUgtQe5HrUQCYjOJfc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309G2qad130965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 10:02:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 10:02:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 10:02:52 -0600
Received: from chirag (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309G2pdQ114369;
	Mon, 9 Jan 2023 10:02:52 -0600
Received: from sadivi by chirag with local (Exim 4.90_1)
	(envelope-from <c-shilwant@ti.com>)
	id 1pEubq-0006xr-5S; Mon, 09 Jan 2023 21:32:50 +0530
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][dunfell][PATCH] ti-tisdk-makefile: k3: u-boot-spl: Remove UBOOT_SYSFW
Date: Mon, 9 Jan 2023 21:32:47 +0530
Message-ID: <20230109160247.26719-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14161

Remove UBOOT_SYSFW as sysfw is no longer used in building u-boot-r5.

Ref - dce21d6d3bd5b9014994a45c22b9ee8d13faa07b

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
index f0bd16df..45ebce40 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
@@ -9,7 +9,6 @@ UBOOT_R5_BUILD_DIR=$(TI_SDK_PATH)/board-support/u-boot_build/r5
 
 UBOOT_ATF=$(TI_SDK_PATH)/board-support/prebuilt-images/bl31.bin
 UBOOT_TEE=$(TI_SDK_PATH)/board-support/prebuilt-images/bl32.bin
-UBOOT_SYSFW=$(TI_SDK_PATH)/board-support/prebuilt-images/sysfw.bin
 UBOOT_DMFW=$(TI_SDK_PATH)/board-support/prebuilt-images/ipc_echo_testb_mcu1_0_release_strip.xer5f
 
 u-boot: u-boot-a53 u-boot-r5
-- 
2.17.1


