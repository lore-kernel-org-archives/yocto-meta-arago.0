Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6559052A33
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CB6540BFE;
	Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LX2zZPsGC3mv; Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4FDB140BCC;
	Sat, 29 Feb 2020 16:15:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9186417442C;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:47 -0500
Message-Id: <1582992888-3508-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 8/9] ti-analytics, ti-demos: create initial packagegroups
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Feb 2020 16:17:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

For now move armnn, tensorflow, voxelsdk and pdm-anomaly

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |  2 ++
 .../packagegroup-arago-tisdk-addons.bb             | 39 +++-------------------
 .../recipes-core/packagegroups/ti-analytics.bb     | 21 ++++++++++++
 .../recipes-core/packagegroups/ti-demos.bb         | 25 ++++++++++++++
 .../recipes-core/packagegroups/ti-world.bb         |  2 ++
 5 files changed, 55 insertions(+), 34 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index fe894d4..7f8b508 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -22,6 +22,8 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
+    ti-analytics \
+    ti-demos \
 "
 
 export IMAGE_BASENAME = "tisdk-rootfs-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index af2c254..2913fa1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -140,45 +140,16 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = ""
-VOXEL_PACKAGES = ""
-#ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
-#VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk', '', d)}"
-
-EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
-                                arm-compute-library \
-                                ${ARMNN_PACKAGES} \
-                                tensorflow-lite-demo \
-                                pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
-                                arm-compute-library \
-                                ${ARMNN_PACKAGES} \
-                                tensorflow-lite-demo \
-                                pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
-                                   big-data-ipc-demo-linux \
-                                   big-data-ipc-demo-linux-firmware \
-                                   arm-compute-library \
-                                   ${ARMNN_PACKAGES} \
-                                   tensorflow-lite-demo \
-                                   pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
-                             ${ARMNN_PACKAGES} \
-                             tensorflow-lite-demo \
-                             pdm-anomaly-detection \
-"
-
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
 
+EXTRA_PACKAGES_append_omap-a15 = " \
+    big-data-ipc-demo-linux \
+    big-data-ipc-demo-linux-firmware \
+"
+
 # acontis-atemsys
 EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
new file mode 100644
index 0000000..ffed472
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -0,0 +1,21 @@
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+ARMNN_PACKAGES = ""
+#ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
+
+ANALYTICS = "\
+    ${ARMNN_PACKAGES} \
+    tensorflow-lite-demo \
+"
+ANALYTICS_keystone = ""
+ANALYTICS_j7-evm = ""
+ANALYTICS_omapl138 = ""
+
+RDEPENDS_${PN} = "\
+    ${ANALYTICS} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
new file mode 100644
index 0000000..07c0b92
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -0,0 +1,25 @@
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+VOXEL_PKG = ""
+#VOXEL_PKG = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk', '', d)}"
+
+VOXELSDK = ""
+VOXELSDK_ti33x = "${VOXEL_PKG}"
+VOXELSDK_ti43x = "${VOXEL_PKG}"
+VOXELSDK_omap-a15 = "${VOXEL_PKG}"
+
+PDM_ANOMALY = ""
+PDM_ANOMALY_ti33x = "pdm-anomaly-detection"
+PDM_ANOMALY_ti43x = "pdm-anomaly-detection"
+PDM_ANOMALY_omap-a15 = "pdm-anomaly-detection"
+PDM_ANOMALY_am65xx = "pdm-anomaly-detection"
+
+RDEPENDS_${PN} = "\
+    ${VOXELSDK} \
+    ${PDM_ANOMALY} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 345a06e..9244d49 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -53,4 +53,6 @@ RDEPENDS_${PN} = "\
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     packagegroup-arago-misc \
+    ti-analytics \
+    ti-demos \
 "
-- 
2.7.4


