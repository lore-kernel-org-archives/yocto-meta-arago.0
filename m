Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3A4C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:03:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.759.1686060190356497769
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LcaekN2O;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356E3913095988
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 09:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686060189;
	bh=oNAtOpO49UFHnV/CTzGw+XCvpRW3NmGhQdSjfo3EeYA=;
	h=From:To:CC:Subject:Date;
	b=LcaekN2OXNYk3gmNaJ9MeMys1U/+wkjKKf81mClZccUR567oJwBHyiMOQXFbkLKCV
	 Yt6r+hdPIt94WC+Ovz0zRpfeKcyfjBOQ/i7pyJt+SNEotGy6PQH3t7GsZUI8KTNHSx
	 Pj0bRvHegkpPHdsgGezdseTjATDtYWrwNhhPDuJ8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356E39RD019701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 09:03:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 09:03:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 09:03:09 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356E38Y9027358;
	Tue, 6 Jun 2023 09:03:08 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH v2] meta-arago-distro: Add recipe for jailhouse image and update kernel and u-boot repo for jailhouse build.
Date: Tue, 6 Jun 2023 19:32:37 +0530
Message-ID: <20230606140237.178008-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:03:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14496

Add a recipe to build and package jailhouse image for am62xx-evm. new image will
be named as tisdk-jailhouse-image. jailhouse recipe will also package overlay
used for jailhouse.

Add functionality to change kernel and u-boot source via MACHINE_FEATURES for
jailhouse. so if MACHINE_FEATURES:append = " jailhouse" is added to local.conf
different recipe for kernel (linux-ti-extras) and u-boot (u-boot-ti-extras) will
be used.

So for jailhouse build for am62xx-evm user will have to add
MACHINE_FEATURES:append = " jailhouse" to local.conf and then start a jailhouse
build with MACHINE=am62xx-evm bitbake -k tisdk-jailhouse-image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |  7 +++++++
 .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 34c3c539..40269b56 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -19,3 +19,10 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
+
+# change kernel when jailhouse image is build
+PREFERRED_PROVIDER_virtual/kernel = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','linux-ti-extras','linux-ti-staging',d)}"
+
+#Change uboot source when jailhouse image is build
+PREFERRED_PROVIDER_virtual/bootloader = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
+PREFERRED_PROVIDER_u-boot = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
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


