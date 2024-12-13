Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8213E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:20:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.17843.1734103193495825358
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=m3eAu6J4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFJqLr050189;
	Fri, 13 Dec 2024 09:19:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734103192;
	bh=x1P+HdGGDQZ4j/xzRSxafTR0GbhBCBNBvGFtQJQllhQ=;
	h=From:To:CC:Subject:Date;
	b=m3eAu6J4l+DtudV7vtOj9Ba/1cBeF4zmGUMQozy3fYRoPmcjJWaBP+vJPrikhR+2w
	 Yxky2LcTPFT6pKFtS4UHZLMCZz6TrWdNfidyvpe/SskJbmtEcxLOUEH3frJEiNGI/R
	 S1o7jE6onp2Id2Bm21VS7Go0+0izoFGcMFQCrKZ8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDFJqqw020968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 09:19:52 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 09:19:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 09:19:51 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDFJpbK120159;
	Fri, 13 Dec 2024 09:19:51 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] tisdk-uenv: Remove OMAP5 and AM437 specific uEnv.txt
Date: Fri, 13 Dec 2024 09:19:51 -0600
Message-ID: <20241213151951.55228-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15656

OMAP5 is not supported and the changes for AM437 are no longer valid.
Remove those.

As the package is now no longer different based on machine, remove
PACKAGE_ARCH setting from recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb          |  2 --
 .../tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt       | 13 -------------
 .../tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt        | 11 -----------
 3 files changed, 26 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 7bd601a0..08289822 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -9,8 +9,6 @@ SRC_URI = "\
 PR = "r3"
 PV = "1.0"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt
deleted file mode 100644
index 89f89f0d..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/am437x-evm/uEnv.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-# This uEnv.txt file can contain additional environment settings that you
-# want to set in U-Boot at boot time.  This can be simple variables such
-# as the serverip or custom variables.  The format of this file is:
-#    variable=value
-# NOTE: This file will be evaluated after the bootcmd is run and the
-#       bootcmd must be set to load this file if it exists (this is the
-#       default on all newer U-Boot images.  This also means that some
-#       variables such as bootdelay cannot be changed by this file since
-#       it is not evaluated until the bootcmd is run.
-optargs=video=HDMI-A-1:800x600
-
-# Uncomment the following line to enable HDMI display and disable LCD display.
-#fdtfile=am437x-gp-evm-hdmi.dtb
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt
deleted file mode 100644
index 6f726f58..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/omap5-evm/uEnv.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-# This uEnv.txt file can contain additional environment settings that you
-# want to set in U-Boot at boot time.  This can be simple variables such
-# as the serverip or custom variables.  The format of this file is:
-#    variable=value
-# NOTE: This file will be evaluated after the bootcmd is run and the
-#       bootcmd must be set to load this file if it exists (this is the
-#       default on all newer U-Boot images.  This also means that some
-#       variables such as bootdelay cannot be changed by this file since
-#       it is not evaluated until the bootcmd is run.
-bootdir=/boot
-bootpart=0:2
-- 
2.39.2


