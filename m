Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B849C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 19:31:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1584.1737055893100309760
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 11:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RlSWKuD5;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GJVTUV056492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 13:31:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737055889;
	bh=k0/JF7edXqJwtqL+OK6ba8z3xEjdiCDfQmJw/VW6rAg=;
	h=From:To:CC:Subject:Date;
	b=RlSWKuD51UWdR31PloKzOWbnX1OfRQ2tJ5FjXkNAU9cXYnywN/uKrlOwIEzoAIfih
	 7u007CLQxxFOqM0+1nfCTEvxEbHzvXtraNPZkZSDMhmMXU0F4I2nH0WHeSB4uaVXuN
	 6q8InoGrjhJxpI9P3Xz9FU329Nwgy95A13H5CI7A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GJVTRa095382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 13:31:29 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 13:31:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 13:31:28 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GJVSxX089165;
	Thu, 16 Jan 2025 13:31:28 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-arago: break dependency on meta-arago-demos
Date: Thu, 16 Jan 2025 13:29:51 -0600
Message-ID: <20250116192950.3391293-2-rs@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 19:31:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15694

From: Randolph Sapp <rs@ti.com>

Remove any explicit dependencies on meta-arago-demos. These were the
last of the "demos" in this layer and they were only being built for
legacy devices. Demos should primarily be in layers above this unless
they are used for functionality testing.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Trying to do this gracefully. Break the dependency first, then update the
oe-layersetup configs, then drop the layer entirely.

 .../images/tisdk-default-image.bb             | 14 +-------
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 17 ---------
 .../packagegroup-arago-tisdk-addons.bb        |  2 --
 .../packagegroup-arago-tisdk-hmi.bb           | 36 -------------------
 .../recipes-core/packagegroups/ti-demos.bb    | 18 ----------
 .../recipes-core/packagegroups/ti-world.bb    | 10 +-----
 6 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 6c46c423..10493415 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -23,24 +23,13 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
-    ti-demos \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
     packagegroup-arago-tisdk-sysrepo \
 "
 
 export IMAGE_BASENAME = "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
 
-EXTRABROWSERS = " \
-    qtwebbrowser-examples \
-    qtwebengine-qmlplugins \
-    qtwebengine-examples \
-"
-
-PYTHON2APPS = " \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
-"
-
 DEVTOOLS = " \
     linux-libc-headers-dev \
     build-essential \
@@ -50,7 +39,6 @@ DEVTOOLS = " \
 "
 
 IMAGE_INSTALL += "\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     docker \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 3e0a2720..8690a874 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -31,24 +31,7 @@ EXTRA_LIBS:append:dra7xx = " libulm-dev \
                              gdbserver-c6x-dev \
 "
 
-PDM_ANOMALY_PKG_DEV = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection-dev', '', d)} \
-"
-
-
 EXTRA_PACKAGES = ""
-#EXTRA_PACKAGES:append:ti33x = " \
-#                                ${PDM_ANOMALY_PKG_DEV} \
-#"
-#EXTRA_PACKAGES:append:ti43x = " \
-#                                ${PDM_ANOMALY_PKG_DEV} \
-#"
-#EXTRA_PACKAGES:append:omap-a15 = " \
-#                                ${PDM_ANOMALY_PKG_DEV} \
-#"
-#EXTRA_PACKAGES:append:am65xx = " \
-#                             ${PDM_ANOMALY_PKG_DEV} \
-#"
 
 IPCDEV = " \
 	ti-ipc-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 6b6533f5..b0d76b28 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -85,10 +85,8 @@ EXTRA_PACKAGES:omapl138 = " \
     protobuf \
 "
 
-# acontis-atemsys
 #EXTRA_PACKAGES:append:am335x-evm = " pruss-lld-apps"
 #EXTRA_PACKAGES:append:am437x-evm = " pruss-lld-apps"
-# acontis-atemsys
 #EXTRA_PACKAGES:append:am57xx-evm = " pruss-lld-apps"
 
 RDEPENDS:${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
deleted file mode 100644
index a8261bf2..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Task to add HMI related packages"
-LICENSE = "MIT"
-PR = "r0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-HMI = " \
-"
-
-
-HMI:append:ti33x = " \
-    evse-hmi \
-    protection-relays-hmi \
-    mmwavegesture-hmi \
-"
-
-HMI:append:ti43x = " \
-    evse-hmi \
-    mmwavegesture-hmi \
-"
-
-HMI:append:omap-a15 = " \
-    evse-hmi \
-    mmwavegesture-hmi \
-"
-
-HMI:append:am65xx = " \
-    evse-hmi \
-    mmwavegesture-hmi \
-"
-
-RDEPENDS:${PN} = "\
-	${HMI} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
deleted file mode 100644
index 7bccb4de..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "TI World packagegroup"
-LICENSE = "MIT"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-PDM_ANOMALY_PKG = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
-
-PDM_ANOMALY = ""
-PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:ti43x = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:omap-a15 = "${PDM_ANOMALY_PKG}"
-PDM_ANOMALY:am65xx = "${PDM_ANOMALY_PKG}"
-
-RDEPENDS:${PN} = "\
-    ${PDM_ANOMALY} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 438dd8d0..fc3eac74 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -15,14 +15,7 @@ CHROMIUM:append:k3 = "\
     chromium-ozone-wayland \
 "
 
-EXTRABROWSERS = " \
-    qtwebbrowser-examples \
-    qtwebengine-qmlplugins \
-    qtwebengine-examples \
-"
-
 PYTHON2APPS = " \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
 "
 
@@ -45,11 +38,10 @@ RDEPENDS:${PN} = "\
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     packagegroup-arago-misc \
-    ti-demos \
     ${PREFERRED_PROVIDER_virtual/docker} \
 "
-- 
2.47.1


