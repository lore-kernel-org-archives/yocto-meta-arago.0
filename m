Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49C5C7EE2E
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:50:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.103.1686243015372452681
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 09:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hAuLDCTb;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358GoECC033112
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 11:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686243014;
	bh=aBgugUVnTacYMbxkJah6RsmgO0NrRoWlSMNDhTG8OiQ=;
	h=From:To:CC:Subject:Date;
	b=hAuLDCTbapZVXECTboLzWWmHwglguZYtFsWYZ/jpqsq9Tqg9v4SwW27g99M95EV0k
	 V40NfJ4vEcWJ7ADEisAtDx4/e5IkZ2r1dyRHbVFZbMzaxDjQLUnS09AdwmMRJiVJ1Q
	 HhysclBBAghi3Q+e3czIoNUeN1sv1bvrwrjMFSGg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358GoEvD040185
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 8 Jun 2023 11:50:14 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 11:50:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 11:50:13 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358GoDHi009403;
	Thu, 8 Jun 2023 11:50:13 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH v3] meta-arago-distro: Add recipe for jailhouse image and new branding processor-sdk-extras
Date: Thu, 8 Jun 2023 22:19:58 +0530
Message-ID: <20230608164958.357880-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 16:50:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14540

Add a recipe to build and package jailhouse image for am62xx-evm. new
image will be named as tisdk-jailhouse-image. jailhouse recipe will
also package overlay used for jailhouse.

Add a new branding processor-sdk-extras to change preferred_providers for
uboot and kernel to u-boot-ti-extras and ti-linux-extras. For jailhouse build
for am62xx-evm, user will have to add ARAGO_BRAND = "processor-sdk-extras" to
change preferred_providers and MACHINE_FEATURES:append = " jailhouse" to
switch to jailhouse branches to local.conf. And then start a jailhouse build
with MACHINE=am62xx-evm bitbake -k tisdk-jailhouse-image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../include/branding-processor-sdk-extras.inc      |  5 +++++
 .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc
new file mode 100644
index 00000000..a9d9f5be
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk-extras.inc
@@ -0,0 +1,5 @@
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-extras"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-extras"
+
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-extras"
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


