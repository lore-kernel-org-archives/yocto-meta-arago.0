Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755F3C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:58:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.10924.1665511085961085524
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GJNuYbYY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHw5JS015412;
	Tue, 11 Oct 2022 12:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665511085;
	bh=3H5lcx/eL9hUg3rpFEnK7cvHiwE4AszVL6VUBLijQqg=;
	h=From:To:CC:Subject:Date;
	b=GJNuYbYYRt5KK7d94oTFzEdTQsf5FfDYgcdM/r1yT157Aihlipl4arixWt/bvPngg
	 i3bgMSNllWzrFc9CvS4eY29J9ML+pEXtTgIgfnGuCDrfo9fjBQnOwMZSQ4EZ7wxOKK
	 ye2MP3O+smfAaD2KsoLMqB4cX5Q0zr6SVpn56Ypg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHw4xK000763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:58:04 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:58:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:58:04 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHw4Eg056157;
	Tue, 11 Oct 2022 12:58:04 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2] meta-arago: Use new J7 SoC
 names over specific board names
Date: Tue, 11 Oct 2022 12:58:04 -0500
Message-ID: <20221011175804.27214-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 17:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14077

Now that we have SoC names, we can avoid adding features based on the
board name. We expect folks to create their own boards based on these
SoCs, and so using the TI made EVM board name everywhere adds extra churn
when adding a new board. Plus it is more correct for most of these
features as they depend on the SoC, not on the EVM board.

One other thing we do here is to not use the generic "j7" name,
the current and future J7 devices are far to feature diverse
to group at this level. Grouping like that will lead to the wrong
things getting enabled as new J7 SoCs are added.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v1:
 - Dropped ti-analytics.bb change
 - Reworked ti-test.bb change to only include J721e

 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb  | 3 +--
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc | 4 +++-
 .../packagegroup-arago-tisdk-addons-sdk-host.bb             | 6 +-----
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb     | 2 +-
 .../ti-tisdk-makefile/Makefile_sysfw-image                  | 6 ++----
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend      | 6 +-----
 6 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index ec4e0344..b49548a6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -12,8 +12,7 @@ DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j721e-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME:append:j721e-hs-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 3c31ba18..296eef7a 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -24,7 +24,9 @@ DTB_FILTER:am57xx-hs-evm = "${DTB_FILTER:am57xx-evm}"
 DTB_FILTER:ti43x = "am43"
 DTB_FILTER:omapl138 = "da850"
 DTB_FILTER:am65xx = "am65"
-DTB_FILTER:j7 = "j721e"
+DTB_FILTER:j721e = "j721e"
+DTB_FILTER:j7200 = "j7200"
+DTB_FILTER:j721s2 = "j721s2"
 
 # List of target side images to build for the SDK
 TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index d79d2756..78fa44bc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -37,11 +37,7 @@ UTILS:append:k3 = " \
     trusted-firmware-a-source \
 "
 
-UTILS:append:j721e-evm = " \
-    pru-icss-source \
-"
-
-UTILS:append:j721e-hs-evm = " \
+UTILS:append:j721e = " \
     pru-icss-source \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 3e76a527..2934827a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -80,7 +80,7 @@ ARAGO_TI_TEST:append:k3 = " \
     k3conf \
 "
 
-ARAGO_TI_TEST:append:j7 = " \
+ARAGO_TI_TEST:append:j721e = " \
     ufs-utils \
 "
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index cee03bc2..09918cbc 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -7,10 +7,8 @@ PLATFORM_TYPE = $(PLATFORM_TYPE_$(PLATFORM))
 SYSFW_CONFIG = evm
 
 SYSFW_SOC_$(PLATFORM) = NULL
-SYSFW_SOC_am65xx-evm = am65x
-SYSFW_SOC_am65xx-hs-evm = am65x
-SYSFW_SOC_j721e-evm = j721e
-SYSFW_SOC_j721e-hs-evm = j721e
+SYSFW_SOC_am65xx = am65x
+SYSFW_SOC_j721e = j721e
 SYSFW_SOC = $(SYSFW_SOC_$(PLATFORM))
 
 SYSFW_PREFIX = ti-sci-firmware
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index de9f1c7d..5cc57460 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -28,11 +28,7 @@ SRC_URI:append:am65xx = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI:append:j721e-evm = " \
-    ${GSTDRM_WAYLANDSINK_PATCHES} \
-"
-
-SRC_URI:append:j721e-hs-evm = " \
+SRC_URI:append:j721e = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-- 
2.37.3


