Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CA4C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:20:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.8599.1685697641133077377
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 02:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RHgsz5pv;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3529Kdkl045463
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Jun 2023 04:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685697639;
	bh=4KTyFcxPREVP7m34NCoy+0W/4cm2U81HFo538rB+fv0=;
	h=From:To:CC:Subject:Date;
	b=RHgsz5pv2TZfBGTy28HxjN+iIkSTScqxFcTwzN1pmN3hGBUc1JPksqftSw7apDzVQ
	 /GRIwroGWF+ARvSnyj1K25lqQhiaaAkzUsgfgc6y5aJSASDUnXl6jVENr6JAlmH4R0
	 wiKIg7bmlEPOf73caLEOCNVgfDS8iWYHroFoHbhU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3529Kdug069982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Jun 2023 04:20:39 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 04:20:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Jun 2023 04:20:39 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3529Kccp027246;
	Fri, 2 Jun 2023 04:20:38 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>,
        <dannenberg@ti.com>
Subject: [kirkstone][PATCH] meta-arago-distro: Add branding for jailhouse build and recipe for jailhouse image
Date: Fri, 2 Jun 2023 14:50:29 +0530
Message-ID: <20230602092029.2576186-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Jun 2023 09:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14489

Add a branding for jailhouse to change preferred uboot and kernel which
will be used for building a jailhouse image.
Add recipe to build and package jailhouse image. image will be named as
tisdk-jailhouse-image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../include/branding-processor-sdk-jailhouse.inc   |  5 +++++
 .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk-jailhouse.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk-jailhouse.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk-jailhouse.inc
new file mode 100644
index 00000000..952c7057
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk-jailhouse.inc
@@ -0,0 +1,5 @@
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-jailhouse"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-jailhouse"
+
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-jailhouse"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
new file mode 100644
index 00000000..af880d30
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -0,0 +1,14 @@
+# Produces wic image for jailhouse
+
+require recipes-core/images/tisdk-default-image.bb
+
+COMPATIBLE_MACHINE = "am62xx-evm"
+
+IMAGE_INSTALL:append:am62xx-evm = " jailhouse"
+
+# Package overlay for jailhouse
+KERNEL_DEVICETREE:append:am62xx-evm = " ti/k3-am625-base-board-jailhouse.dtbo"
+
+export IMAGE_BASENAME = "tisdk-jailhouse-image"
+
+WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
-- 
2.34.1


