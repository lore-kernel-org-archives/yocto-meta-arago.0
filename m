Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA33CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 04:56:08 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.5093.1756875367649839431
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 21:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i1P18Jq7;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5834u7c73182522
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 23:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756875367;
	bh=LmjPzzX91yYAFhcQYhKThyTBrHRE+y8pAhdwtZj1T+0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Post;
	b=i1P18Jq7vPOOgCrGBQlHAselw5gqsaboN5Nf6RNiKvXluEL2ELP+7Axw+T3YzWsqY
	 Si+q9heAOT11SSzJ3HXOMAlo2whoWataXu2v6Z+WDBPxAT4ZvSvYhQdnebnCJvP96D
	 R6KJNzDJ5kc7n0iGhUPDEjZYnXtd9xukcUCKMYuk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5834u7CD3342867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 23:56:07 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 23:56:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 23:56:05 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5834tx7Y998039;
	Tue, 2 Sep 2025 23:56:03 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-patch-review@list.ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <m-shah@ti.com>
Subject: [meta-arago][PATCH 1/1] tisdk-tiny-initramfs.bb: Package initramfs scripts and modules in the image
Date: Wed, 3 Sep 2025 10:25:59 +0530
Message-ID: <20250903045559.830651-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903045559.830651-1-m-shah@ti.com>
References: <20250903045559.830651-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Sep 2025 04:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16516

Package boot essential modules and some other modules required during
boot time, also add initramfs scripts to modprobe the included modules
and eventually perform a switch-root.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../images/tisdk-tiny-initramfs.bb             | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index 37b777f6..2316d191 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -21,7 +21,23 @@ INITRAMFS_FSTYPES = "cpio cpio.xz"
 
 IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
-PACKAGE_INSTALL = "packagegroup-arago-initramfs"
+INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev initramfs-module-nfsrootfs"
+
+MODULES = "\
+    kernel-module-cdns-pltfrm \
+    kernel-module-sdhci-am654 \
+    kernel-module-ti-cpsw-proxy-client \
+    kernel-module-ti-j721e-ufs \
+    kernel-module-tps6594-i2c \
+"
+
+UTILS = "\
+    cifs-utils \
+    nfs-utils \
+    nfs-utils-client \
+"
+
+PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${MODULES} ${UTILS} packagegroup-arago-initramfs "
 
 export IMAGE_BASENAME = "tisdk-tiny-initramfs${ARAGO_IMAGE_SUFFIX}"
 
-- 
2.34.1


