Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D13C282D2
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 15:01:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.55196.1741014108198100640
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 07:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dHBl3tXu;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523F1kKV3308779
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Mar 2025 09:01:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741014106;
	bh=zyJKloLLuYLX2DjWV5uOHvdkVjnjTrWGMR+K0FNRHyg=;
	h=From:To:CC:Subject:Date;
	b=dHBl3tXujtkdsnt2MVMrrA1u6ghqsVGngvUO7sjRxTM6x0tjfLlEQyybVJNyUvLIo
	 ELg69umoFwMbE+WqJ9uFw2z1m1pap2TVjm0EjKa2PFaRvMZ144YRALtnl6bORlz8Dk
	 AlFsnbpfpc4OySoLYj19lMLViL80H5KZ2CL3cKs0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523F1kOk009872;
	Mon, 3 Mar 2025 09:01:46 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 09:01:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 09:01:46 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523F1k5n046753;
	Mon, 3 Mar 2025 09:01:46 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] tisdk-readme: Remove this recipe
Date: Mon, 3 Mar 2025 09:01:45 -0600
Message-ID: <20250303150145.495200-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Mar 2025 15:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15934

These README files for the TI SDK should go up in the SDK layers.
They have not been updated in years and do not include useful nor
up to date information. Remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |  4 +--
 .../tisdk-readme/tisdk-readme.bb              | 22 ----------------
 .../tisdk-readme/tisdk-readme/README          | 22 ----------------
 .../tisdk-readme/tisdk-readme/k3/README       | 26 -------------------
 4 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
 delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 9d4889c9..c20bed7a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -8,8 +8,8 @@ inherit packagegroup
 
 EXTRA_FILES = ""
 EXTRA_FILES:ti43x = "tisdk-uenv"
-EXTRA_FILES:omap-a15 = "tisdk-readme tisdk-uenv"
-EXTRA_FILES:k3 = "tisdk-readme tisdk-uenv"
+EXTRA_FILES:omap-a15 = "tisdk-uenv"
+EXTRA_FILES:k3 = "tisdk-uenv"
 
 RDEPENDS:${PN} = "\
     ${EXTRA_FILES} \
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
deleted file mode 100644
index 59df0c97..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Package that will install a README file into the SDK prebuilt-binaries directory"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "\
-    file://README \
-"
-
-PR = "r0"
-PV = "1.0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}"
-
-do_install () {
-    install -d ${D}/board-support/prebuilt-images
-
-    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
-}
-
-FILES:${PN} += "board-support/*"
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
deleted file mode 100644
index 873d1e86..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
+++ /dev/null
@@ -1,22 +0,0 @@
-The files contained in this directory represent the images that were built
-as part of the original SDK build and packaging process.  They are meant
-to serve as a restore and starting point for your development.  In order
-to use these images with an SD card they should be placed in the appropriate
-locations.
-
-By default these locations are:
-
-================================================================================
-|       FILE       |                  LOCATION                                 |
-================================================================================
-|    MLO           | boot partition
-|    u-boot.img    | boot partition
-|    uEnv.txt      | boot partition
-|    uImage        | /boot directory of the rootfs partition
-|    *.dtb         | /boot directory of the rootfs partition
-================================================================================
-
-By default the boot loaders are read from the first FAT partition, which is
-usually called the "boot" partition.  Then the bootloader will look for the
-uImage and DTB files in the /boot directory of the EXT partition, which is
-usually called the "rootfs" partition.
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README
deleted file mode 100644
index 0eb6dd3c..00000000
--- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README
+++ /dev/null
@@ -1,26 +0,0 @@
-The files contained in this directory represent the images that were built
-as part of the original SDK build and packaging process.  They are meant
-to serve as a restore and starting point for your development.  In order
-to use these images with an SD card they should be placed in the appropriate
-locations.
-
-By default these locations are:
-
-+-------------+-----------------------------------------+
-|    File     |                Location                 |
-+-------------+-----------------------------------------+
-| tiboot3.bin | boot partition                          |
-| tispl.bin   | boot partition                          |
-| u-boot.img  | boot partition                          |
-| sysfw.itb   | boot partition                          |
-| uEnv.txt    | boot partition                          |
-+-------------+-----------------------------------------+
-| Image       | /boot directory of the rootfs partition |
-| *.dtb       | /boot directory of the rootfs partition |
-| *.dtbo      | /boot directory of the rootfs partition |
-+-------------+-----------------------------------------+
-
-By default the boot loaders are read from the first FAT partition, which is
-usually called the "boot" partition.  Then the bootloader will look for the
-Image and .dtb .dtbo files in the /boot directory of the ext4 partition, which is
-usually called the "rootfs" partition.
-- 
2.39.2


