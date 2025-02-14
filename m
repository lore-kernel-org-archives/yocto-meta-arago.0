Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00149C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 19:01:00 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.28832.1739559650861277232
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 11:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=e0yuiDH0;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51EJ0m9a908786
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 14 Feb 2025 13:00:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739559648;
	bh=Pe7Iz6eeogyCHTOsutiEvAcRHUiVDram05YzzJ6PzKo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e0yuiDH0qc7QoAcruUZ459ukx9r6UtKz7ct1Gm9bGasxUUjgfLLfjK4LfPNX1VmJd
	 GskuRnJjQ/gLhW1VvrgVTcjAJAnHrPRDDfg/qaj9MlGYLiChL4b4IIOnlg4BXWnj2a
	 waIc6vj0cnXJLovYNZPnRZagzY16C6fcI57kOM1k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EJ0mae094802;
	Fri, 14 Feb 2025 13:00:48 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Feb 2025 13:00:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Feb 2025 13:00:47 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51EJ0l4r050654;
	Fri, 14 Feb 2025 13:00:48 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-arago][scarthgap][PATCH 1/2] meta-arago: remove dependency on meta-arago-demos
Date: Fri, 14 Feb 2025 13:00:35 -0600
Message-ID: <20250214190036.360301-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214190036.360301-1-rs@ti.com>
References: <20250214190036.360301-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Feb 2025 19:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15850

From: Randolph Sapp <rs@ti.com>

Remove any explicit dependencies on meta-arago-demos. These were the
last of the "demos" in this layer and they were only being built for
legacy devices. Demos should primarily be in layers above this unless
they are used for functionality testing.

This patch does not modify this layer's dependency list because
meta-arago-demos was not previously listed as an explicit dependency,
despite default package groups requiring it.

These modifications are required as part of the effort to make this
layer less dependent on meta-qt5. Moving forward TI builds of arago will
enable and test Qt6 by default, but unlike before this will not be done
in a way that creates an explicit dependency in this layer. This should
allow customers and layers that consume or extend this layer to toggle
Qt support more easily.

A corresponding patch will be sent following this to remove
meta-arago-demos from master oe-layersetup configs and then one more
patch will be submitted to delete the now unreachable contents of
meta-arago-demos.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb  | 13 -------------
 ...ackagegroup-arago-tisdk-addons-sdk-target.bb | 17 -----------------
 .../packagegroup-arago-tisdk-addons.bb          |  2 --
 .../packagegroup-arago-tisdk-hmi.bb             | 11 -----------
 .../recipes-core/packagegroups/ti-world.bb      | 10 +---------
 5 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index ce3c3879..335ee5c2 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -23,8 +23,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','pdm-anomaly-detection','', d)} \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
     packagegroup-arago-tisdk-sysrepo \
 "
@@ -35,16 +33,6 @@ export IMAGE_BASENAME = "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
 # available on the HW.
 IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
 
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
@@ -54,7 +42,6 @@ DEVTOOLS = " \
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
index aaf53f3d..1d489937 100644
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
index ca528d3d..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Task to add HMI related packages"
-LICENSE = "MIT"
-PR = "r0"
-
-inherit packagegroup
-
-RDEPENDS:${PN} = "\
-    evse-hmi \
-    protection-relays-hmi \
-    mmwavegesture-hmi \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 96bfcac8..fc3eac74 100644
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
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','pdm-anomaly-detection','', d)} \
     ${PREFERRED_PROVIDER_virtual/docker} \
 "
-- 
2.48.1


