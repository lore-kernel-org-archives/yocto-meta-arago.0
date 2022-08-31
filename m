Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE2DECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 17:55:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2181.1661968518694607563
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 10:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MFB+V8Au;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27VHtEXY128422;
	Wed, 31 Aug 2022 12:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661968514;
	bh=50gTatuA65gBMItDXSgfmMHzqqr0OO+2fpNQvNqHa7w=;
	h=From:To:CC:Subject:Date;
	b=MFB+V8AudRxXjLyvkRxQ6NrC/X3ZiBpCEkoM88YKeLomkDYOBlbOevMqVPKzyvujy
	 IYvO/xU8W9GExGyNVAg4FpAZdfHtLpbh+p3dlQZHFHp6ZMMZy1qTUCVjoxBpAXZbKp
	 ErZDxMuCi/HwH5gCXOZvc9/j66DN6LXLmKz8SpXc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27VHtE0p048510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Aug 2022 12:55:14 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 31
 Aug 2022 12:55:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 31 Aug 2022 12:55:13 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27VHtDk9046210;
	Wed, 31 Aug 2022 12:55:13 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell][PATCH 1/2] meta-arago: rename j7-evm to
 j721e-evm
Date: Wed, 31 Aug 2022 12:55:12 -0500
Message-ID: <20220831175513.16160-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 Aug 2022 17:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13981

In many places we use "j7" (the family name) when we should be using a
specific SoC or EVM and vice-versa. For instance when including
graphics drivers we add for all "j7" family, but what we really
want is only for some specific j7 SoC.

First step in untangling this is to make it clear that there is
no SoC called j7. There is a SoC called j721e with a j721e-evm.

Fix up this naming here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                    | 2 +-
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb  | 4 ++--
 .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 4 ++--
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb     | 4 ++--
 .../ti-tisdk-makefile/Makefile_sysfw-image                  | 6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 4 ++--
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend      | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 5fca73ba..c2f7c603 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -51,7 +51,7 @@ KERNEL_IMAGETYPES_am437x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am335x-hs-evm = "zImage fitImage"
 KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_am64xx-hs-evm = "Image fitImage"
-KERNEL_IMAGETYPES_j7-hs-evm = "Image fitImage"
+KERNEL_IMAGETYPES_j721e-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_j7200-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES_j721s2-hs-evm = "Image fitImage"
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 6df454fc..6b3745f4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -17,8 +17,8 @@ DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME_append_j721e-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME_append_j721e-hs-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 062948d0..bd72b7d9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -41,11 +41,11 @@ UTILS_append_k3 = " \
     trusted-firmware-a-src \
 "
 
-UTILS_append_j7-evm = " \
+UTILS_append_j721e-evm = " \
     pru-icss-src \
 "
 
-UTILS_append_j7-hs-evm = " \
+UTILS_append_j721e-hs-evm = " \
     pru-icss-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 094c47a2..8a56a235 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -68,8 +68,8 @@ UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
-UTILS_append_j7-evm = " pru-icss"
-UTILS_append_j7-hs-evm = " pru-icss"
+UTILS_append_j721e-evm = " pru-icss"
+UTILS_append_j721e-hs-evm = " pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 5c33f5aa..42de2614 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -84,12 +84,12 @@ ARAGO_TI_TEST_append_j7 = " \
     ufs-utils \
 "
 
-ARAGO_TI_TEST_append_j7-evm = " \
+ARAGO_TI_TEST_append_j721e-evm = " \
     viddec-test-app \
     videnc-test-app \
 "
 
-ARAGO_TI_TEST_append_j7-hs-evm = " \
+ARAGO_TI_TEST_append_j721e-hs-evm = " \
     viddec-test-app \
     videnc-test-app \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 08d80c35..cbb20c51 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -2,7 +2,7 @@
 PLATFORM_TYPE_$(PLATFORM) = gp
 PLATFORM_TYPE_am64xx-hs-evm = hs
 PLATFORM_TYPE_am65xx-hs-evm = hs
-PLATFORM_TYPE_j7-hs-evm = hs
+PLATFORM_TYPE_j721e-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
 
 SYSFW_CONFIG = evm
@@ -13,8 +13,8 @@ SYSFW_SOC_am65xx-hs-evm = am65x
 SYSFW_SOC_am64xx-evm = am64x
 SYSFW_SOC_am64xx-hs-evm = am64x
 SYSFW_SOC_am62xx-evm = am62x
-SYSFW_SOC_j7-evm = j721e
-SYSFW_SOC_j7-hs-evm = j721e
+SYSFW_SOC_j721e-evm = j721e
+SYSFW_SOC_j721e-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 
 SYSFW_PREFIX_$(SYSFW_SOC) = ti-sci-firmware
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 471e2776..5794e67e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -370,8 +370,8 @@ K3_UBOOT_MACHINE_R5_am65xx-evm = "am65x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am64xx-evm = "am64x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5_am64xx-hs-evm = "am64x_hs_evm_r5_defconfig"
-K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
-K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
+K3_UBOOT_MACHINE_R5_j721e-evm = "j721e_evm_r5_config"
+K3_UBOOT_MACHINE_R5_j721e-hs-evm = "j721e_hs_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
 K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
 K3_UBOOT_MACHINE_R5_am62xx-evm = "am62x_evm_r5_config"
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 64929729..258bf733 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -28,11 +28,11 @@ SRC_URI_append_am65xx = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI_append_j7-evm = " \
+SRC_URI_append_j721e-evm = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI_append_j7-hs-evm = " \
+SRC_URI_append_j721e-hs-evm = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-- 
2.36.1


