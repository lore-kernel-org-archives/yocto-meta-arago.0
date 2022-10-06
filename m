Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A86C4332F
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 15:06:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.148.1665068795740928267
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 08:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DzDd8JBw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 296F6V9G099041;
	Thu, 6 Oct 2022 10:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665068791;
	bh=Bn6UIpTgInNdks5bShbRb6ZMrNzskl+mrZd6RlQmMlc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DzDd8JBw+Sg3vs2itrYv+6maPO48Pszb4McqqatQbHXLQjdnGDpaRU9m0+dhgS2Rw
	 X7Bk/pIYSlVLxXu6iq8LzdnBWMWaRjw/9lWZtPZ5/mfpl1+/KyzG+tZsOqEzvwhW7h
	 VIShYA4yJnWjuKjWeoVtThE5N/VUbJTlAvJ7pY48=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 296F6VrI038889
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Oct 2022 10:06:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 6 Oct
 2022 10:06:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 6 Oct 2022 10:06:30 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 296F6STb021833;
	Thu, 6 Oct 2022 10:06:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 7/7] meta-arago: Use new J7 SoC
 names over specific board names
Date: Thu, 6 Oct 2022 10:06:28 -0500
Message-ID: <20221006150628.17044-7-afd@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006150628.17044-1-afd@ti.com>
References: <20221006150628.17044-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Oct 2022 15:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14058

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
 .../recipes-core/images/tisdk-core-bundle.bb           |  3 +--
 .../recipes-core/images/tisdk-core-bundle.inc          |  4 +++-
 .../packagegroup-arago-tisdk-addons-sdk-host.bb        |  6 +-----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb   |  6 +++---
 .../recipes-core/packagegroups/ti-analytics.bb         |  4 +++-
 .../recipes-core/packagegroups/ti-test.bb              | 10 +++++++++-
 .../ti-tisdk-makefile/Makefile_sysfw-image             |  6 ++----
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend |  6 +-----
 8 files changed, 23 insertions(+), 22 deletions(-)

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
index 9efc2cae..57118775 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -31,11 +31,7 @@ UTILS:append:k3 = " \
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
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f4e72a89..c01e9497 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -61,9 +61,9 @@ UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
 UTILS:append:am62xx = " ti-rtos-firmware"
 #UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
-UTILS:append:j7 = " ti-rtos-firmware"
-UTILS:append:j721e-evm = " pru-icss"
-UTILS:append:j721e-hs-evm = " pru-icss"
+UTILS:append:j721e = " ti-rtos-firmware pru-icss"
+UTILS:append:j7200 = " ti-rtos-firmware"
+UTILS:append:j721s2 = " ti-rtos-firmware"
 
 UTILS:append:omapl138 = " ti-ipc-rtos-fw"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index e16e4d51..e6e0b915 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -19,7 +19,9 @@ ANALYTICS = ""
 #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
 #"
-ANALYTICS:j7 = ""
+ANALYTICS:j721e = ""
+ANALYTICS:j7200 = ""
+ANALYTICS:j721s2 = ""
 ANALYTICS:omapl138 = ""
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 99a6cc82..5f56f8be 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -78,7 +78,15 @@ ARAGO_TI_TEST:append:k3 = " \
     k3conf \
 "
 
-ARAGO_TI_TEST:append:j7 = " \
+ARAGO_TI_TEST:append:j721e = " \
+    ufs-utils \
+"
+
+ARAGO_TI_TEST:append:j7200 = " \
+    ufs-utils \
+"
+
+ARAGO_TI_TEST:append:j721s2 = " \
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


