Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B54ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 17:55:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2180.1661968515643836115
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 10:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b4qcXgOc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27VHtESY005064;
	Wed, 31 Aug 2022 12:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661968514;
	bh=u/L2YZrwHiJwZmvWEJDR5WbGH/7+Yv+3EV6CDUvr83A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b4qcXgOc/1j2o79b08GfSBuhfvxifXumUSFooSv1D4vyiLSP3ZuvHZUcONTETFfTZ
	 lfiec9LXthvJlVtIPDylucmpWPbIWFf6dHssIemkEgLMbrCaLFrDQd3Wr8e1ZtJmuy
	 sFRPM8PCYv45A03n3g8VsYRQmTyizcPbZ67hPhtc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27VHtEh1081051
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Aug 2022 12:55:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 31
 Aug 2022 12:55:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 31 Aug 2022 12:55:14 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27VHtDkA046210;
	Wed, 31 Aug 2022 12:55:13 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell][PATCH 2/2] meta-arago: Use new J7 SoC names
 over specific board names
Date: Wed, 31 Aug 2022 12:55:13 -0500
Message-ID: <20220831175513.16160-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220831175513.16160-1-afd@ti.com>
References: <20220831175513.16160-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 Aug 2022 17:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13980

Now that we have SoC names, we can avoid adding features based on the
board name. We expect folks to create their own boards based on these
SoCs, and so using the TI made EVM board name everywhere adds extra churn
when adding a new board. Plus it is more correct for most of these
features as they depend on the SoC, not on the EVM board.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 3 +--
 .../packagegroup-arago-tisdk-addons-sdk-host.bb            | 6 +-----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 3 +--
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb    | 7 +------
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend     | 6 +-----
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 6b3745f4..58d5b09d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -17,8 +17,7 @@ DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin"
 DEPLOY_IMAGES_NAME_append_am65xx = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_j721e-evm = " sysfw.itb"
-DEPLOY_IMAGES_NAME_append_j721e-hs-evm = " sysfw.itb"
+DEPLOY_IMAGES_NAME_append_j721e = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index bd72b7d9..593b9191 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -41,11 +41,7 @@ UTILS_append_k3 = " \
     trusted-firmware-a-src \
 "
 
-UTILS_append_j721e-evm = " \
-    pru-icss-src \
-"
-
-UTILS_append_j721e-hs-evm = " \
+UTILS_append_j721e = " \
     pru-icss-src \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8a56a235..5273ca08 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -68,8 +68,7 @@ UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
-UTILS_append_j721e-evm = " pru-icss"
-UTILS_append_j721e-hs-evm = " pru-icss"
+UTILS_append_j721e = " pru-icss"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 42de2614..1aeb8d12 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -84,12 +84,7 @@ ARAGO_TI_TEST_append_j7 = " \
     ufs-utils \
 "
 
-ARAGO_TI_TEST_append_j721e-evm = " \
-    viddec-test-app \
-    videnc-test-app \
-"
-
-ARAGO_TI_TEST_append_j721e-hs-evm = " \
+ARAGO_TI_TEST_append_j721e = " \
     viddec-test-app \
     videnc-test-app \
 "
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 258bf733..eb7098e5 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -28,11 +28,7 @@ SRC_URI_append_am65xx = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-SRC_URI_append_j721e-evm = " \
-    ${GSTDRM_WAYLANDSINK_PATCHES} \
-"
-
-SRC_URI_append_j721e-hs-evm = " \
+SRC_URI_append_j721e = " \
     ${GSTDRM_WAYLANDSINK_PATCHES} \
 "
 
-- 
2.36.1


