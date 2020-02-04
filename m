Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7CE06529A5
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2020 18:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA98040C2E;
	Tue,  4 Feb 2020 18:18:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c56GvEPiJc7m; Tue,  4 Feb 2020 18:18:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A1F8D40A30;
	Tue,  4 Feb 2020 18:18:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 356AC1743D3;
	Tue,  4 Feb 2020 13:18:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  4 Feb 2020 13:18:15 -0500
Message-Id: <1580840296-30685-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580840296-30685-1-git-send-email-denis@denix.org>
References: <1580840296-30685-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 2/3] packagegroups: create initial ti-analytics and ti-demos packagegroups
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
X-List-Received-Date: Tue, 04 Feb 2020 18:20:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |  2 ++
 .../packagegroup-arago-tisdk-addons.bb             | 36 +++-------------------
 .../recipes-core/packagegroups/ti-analytics.bb     |  9 ++++++
 .../recipes-core/packagegroups/ti-demos.bb         |  9 ++++++
 .../recipes-core/packagegroups/ti-world.bb         |  2 ++
 5 files changed, 27 insertions(+), 31 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1b2ffbd..ae026a1 100644
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
index 967fc5d..ddf7785 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -140,42 +140,16 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = "armnn"
-
-EXTRA_PACKAGES_append_ti33x = " voxelsdk \
-                                arm-compute-library \
-                                ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
-                                pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_ti43x = " voxelsdk \
-                                arm-compute-library \
-                                ${ARMNN_PACKAGES} \
-                                tensorflow-lite-examples \
-                                pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
-                                   big-data-ipc-demo-linux \
-                                   big-data-ipc-demo-linux-firmware \
-                                   arm-compute-library \
-                                   ${ARMNN_PACKAGES} \
-                                   tensorflow-lite-examples \
-                                   pdm-anomaly-detection \
-"
-
-EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
-                             ${ARMNN_PACKAGES} \
-                             tensorflow-lite-examples \
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
 EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps acontis-atemsys"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
new file mode 100644
index 0000000..e5a13f6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -0,0 +1,9 @@
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    armnn \
+    tensorflow-lite-examples \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
new file mode 100644
index 0000000..20d73b9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -0,0 +1,9 @@
+SUMMARY = "TI World packagegroup"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    voxelsdk \
+    pdm-anomaly-detection \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 1aa3a39..164ac63 100644
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


