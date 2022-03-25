Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49535C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:46:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.623.1648233978321694949
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 11:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AeZwxt8J;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PIkG7j014915;
	Fri, 25 Mar 2022 13:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648233976;
	bh=JYJ00vHMlleFk5yW9w9FdDcUlKkIhaUaUWYNSIIDbQI=;
	h=From:To:CC:Subject:Date;
	b=AeZwxt8JPB+dHF4wE/wje9nmAS6XUXpdqCGH4vDWtoGB2fSSlZ3IJOv6glqvV89+f
	 7zCvG1XN6SSZNT7cNWOTSWGp6/Z7ee9YFXZMcvWGQXn7MpMig5F2x3/mGX2QOLsOAf
	 /+uTIGXhJmYwA49JvmaCYAh+LUfAc2GWan/2LEV4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PIkGR4022898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 13:46:16 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 13:46:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 13:46:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PIkFGZ031373;
	Fri, 25 Mar 2022 13:46:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] meta-arago: rename j7-evm to
 j721e-evm
Date: Fri, 25 Mar 2022 13:46:14 -0500
Message-ID: <20220325184615.17398-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 25 Mar 2022 18:46:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13755

In many places we use "j7" the family when we should be using a
specific SoC or EVM and vice-versa. For instance when including
graphics drivers we add for all "j7" family, but what we really
want is only for some specific j7 SoC.

First step in untangling this is to make it clear that there is
no SoC called j7. There is a SoC called j721e with a j721e-evm.

Fix up this naming here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                    | 4 ++--
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb  | 6 +++---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 4 ++--
 .../ti-tisdk-makefile/Makefile_sysfw-image                  | 6 +++---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 4 ++--
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend      | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d3f03f2e..b2246537 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -49,12 +49,12 @@ KERNEL_IMAGETYPES:dra7xx-hs-evm = "zImage fitImage"
 # FIT image for K3 secure devices
 KERNEL_CLASSES:append:am64xx-hs-evm = " kernel-fitimage"
 KERNEL_CLASSES:append:am65xx-hs-evm = " kernel-fitimage"
-KERNEL_CLASSES:append:j7-hs-evm = " kernel-fitimage"
+KERNEL_CLASSES:append:j721e-hs-evm = " kernel-fitimage"
 KERNEL_CLASSES:append:j7200-hs-evm = " kernel-fitimage"
 
 KERNEL_IMAGETYPES:am64xx-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES:am65xx-hs-evm = "Image fitImage"
-KERNEL_IMAGETYPES:j7-hs-evm = "Image fitImage"
+KERNEL_IMAGETYPES:j721e-hs-evm = "Image fitImage"
 KERNEL_IMAGETYPES:j7200-hs-evm = "Image fitImage"
 
 # FIT image settings
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index feff7842..36693ab0 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -5,10 +5,10 @@ DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j7-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j7-hs-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:j721e-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:j721e-hs-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
-DEPLOY_IMAGES_NAME:append:j7-evm = " ti-fs-firmware-j721e-gp.bin"
+DEPLOY_IMAGES_NAME:append:j721e-evm = " ti-fs-firmware-j721e-gp.bin"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 8d7cad24..a741eb03 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -37,11 +37,11 @@ UTILS:append:k3 = " \
     trusted-firmware-a-source \
 "
 
-UTILS:append:j7-evm = " \
+UTILS:append:j721e-evm = " \
     pru-icss-source \
 "
 
-UTILS:append:j7-hs-evm = " \
+UTILS:append:j721e-hs-evm = " \
     pru-icss-source \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 600da50f..363602b5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -68,8 +68,8 @@ UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
 #UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
 UTILS:append:j7 = " ti-rtos-firmware"
-UTILS:append:j7-evm = " pru-icss"
-UTILS:append:j7-hs-evm = " pru-icss"
+UTILS:append:j721e-evm = " pru-icss"
+UTILS:append:j721e-hs-evm = " pru-icss"
 
 UTILS:append:omapl138 = " ti-ipc-rtos-fw"
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 96efa538..cee03bc2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,7 +1,7 @@
 # Define the following to support multple platforms
 PLATFORM_TYPE_$(PLATFORM) = gp
 PLATFORM_TYPE_am65xx-hs-evm = hs
-PLATFORM_TYPE_j7-hs-evm = hs
+PLATFORM_TYPE_j721e-hs-evm = hs
 PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
 
 SYSFW_CONFIG = evm
@@ -9,8 +9,8 @@ SYSFW_CONFIG = evm
 SYSFW_SOC_$(PLATFORM) = NULL
 SYSFW_SOC_am65xx-evm = am65x
 SYSFW_SOC_am65xx-hs-evm = am65x
-SYSFW_SOC_j7-evm = j721e
-SYSFW_SOC_j7-hs-evm = j721e
+SYSFW_SOC_j721e-evm = j721e
+SYSFW_SOC_j721e-hs-evm = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 
 SYSFW_PREFIX = ti-sci-firmware
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index c8b19d58..85b99bf2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -300,8 +300,8 @@ do_install () {
 K3_UBOOT_MACHINE_R5 = ""
 K3_UBOOT_MACHINE_R5:am65xx-evm = "am65x_evm_r5_defconfig"
 K3_UBOOT_MACHINE_R5:am65xx-hs-evm = "am65x_hs_evm_r5_defconfig"
-K3_UBOOT_MACHINE_R5:j7-evm = "j721e_evm_r5_config"
-K3_UBOOT_MACHINE_R5:j7-hs-evm = "j721e_hs_evm_r5_config"
+K3_UBOOT_MACHINE_R5:j721e-evm = "j721e_evm_r5_config"
+K3_UBOOT_MACHINE_R5:j721e-hs-evm = "j721e_hs_evm_r5_config"
 
 do_install:append:k3() {
     cat >> ${D}/Rules.make << __EOF__
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 5975b92e..de9f1c7d 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -28,11 +28,11 @@ SRC_URI:append:am65xx = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI:append:j7-evm = " \
+SRC_URI:append:j721e-evm = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI:append:j7-hs-evm = " \
+SRC_URI:append:j721e-hs-evm = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-- 
2.17.1


