Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B2AC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 13:18:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13882.1676294328039257904
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 05:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PNpwFZuE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DDIiaP009627;
	Mon, 13 Feb 2023 07:18:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676294324;
	bh=F1SjYyaeaoSzD0C0Zq997lWOomeLxOAhvcKbKD44Xs8=;
	h=From:To:CC:Subject:Date;
	b=PNpwFZuED99V1BgxZYbNPdn6Fe28KQ4ZTidy3P3wsl1pd8m3ZMJcl83gMZQiM4xCg
	 jvtQIRSizLA6Sky02pccmpeiidHcq07BPybHVK650JNdQhntFzTILt11/aqbyu+K4l
	 jOeS7rWkbquTpD/gvbRij5FieUC7Y2ObbYHUknyA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DDIipX124229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 07:18:44 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 07:18:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 07:18:44 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31DDIgau007068;
	Mon, 13 Feb 2023 07:18:43 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][dunfell][PATCH] meta-arago-distro: recipes-tisdk: ti-tisdk-makefile: Update Makefile to take DEVICE_TYPE as argument
Date: Mon, 13 Feb 2023 18:48:33 +0530
Message-ID: <20230213131833.3836244-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Feb 2023 13:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14218

- Take DEVICE_TYPE as a command line argument for buildling sysfw-image for am62xx-evm, am62xx-lp-evm, am64xx-evm and am62axx-evm
- By default, make sysfw-image will generate tiboot3.bin for HS-FS
- To generate tiboot3.bin for GP,
	$ make sysfw-image DEVICE_TYPE=gp

- To generate tiboot3.bin for HS-SE,
	$ make sysfw-image DEVICE_TYPE=hs

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile           | 7 +++++++
 .../ti-tisdk-makefile/Makefile_sysfw-image                 | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
index 66449d4e..51e5be34 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
@@ -1,6 +1,13 @@
 -include Rules.make
 
 MAKE_JOBS ?= 1
+DEVICE_TYPE ?= hs-fs
+DEVICE_TYPE_SEC ?= $(DEVICE_TYPE)
+
+#Device Type should be one of hs, hs-fs and gp. Wrong inputs will build for hs-fs
+ifneq ($(DEVICE_TYPE_SEC),$(filter $(DEVICE_TYPE_SEC),hs hs-fs gp))
+    DEVICE_TYPE_SEC = hs-fs
+endif
 
 all: __ALL_TARGETS__
 clean: __CLEAN_TARGETS__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index fe51de5f..1f497261 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,8 +1,10 @@
 # Define the following to support multiple platforms
 PLATFORM_TYPE_$(PLATFORM) = gp
-PLATFORM_TYPE_am64xx-evm = hs-fs
+PLATFORM_TYPE_am64xx-evm = $(DEVICE_TYPE_SEC)
 PLATFORM_TYPE_am65xx-hs-evm = hs
-PLATFORM_TYPE_am62xx-lp-evm = hs
+PLATFORM_TYPE_am62xx-lp-evm = $(DEVICE_TYPE_SEC)
+PLATFORM_TYPE_am62xx-evm = $(DEVICE_TYPE_SEC)
+PLATFORM_TYPE_am62axx-evm = $(DEVICE_TYPE_SEC)
 PLATFORM_TYPE_j7-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
 
-- 
2.34.1


