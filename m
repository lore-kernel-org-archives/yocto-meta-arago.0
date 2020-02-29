Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8173852A4E
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6ECBB40C30;
	Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id l8cyDMtC3f-E; Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 559DB40C20;
	Sat, 29 Feb 2020 16:15:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8385817442B;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:46 -0500
Message-Id: <1582992888-3508-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 7/9] ti-test: combine and rename arago-test and arago-test-addons
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

Also remove test package from base rootfs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-base-tisdk-image.bb  |  1 -
 .../recipes-core/images/tisdk-rootfs-image.bb      |  3 +-
 .../packagegroups/packagegroup-arago-test.bb       | 92 --------------------
 ...ackagegroup-arago-test-addons.bb => ti-test.bb} | 98 +++++++++++++++++++---
 .../recipes-core/packagegroups/ti-world.bb         |  3 +-
 5 files changed, 89 insertions(+), 108 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-test-addons.bb => ti-test.bb} (61%)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index e926724..ebb1d42 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -10,7 +10,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    packagegroup-arago-test \
     ${VIRTUAL-RUNTIME_initramfs} \
     "
 
diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 3efb578..fe894d4 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -8,8 +8,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    packagegroup-arago-test \
-    packagegroup-arago-test-addons \
+    ti-test \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
deleted file mode 100644
index 066bdf8..0000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ /dev/null
@@ -1,92 +0,0 @@
-DESCRIPTION = "Extended task to get System Test specific apps"
-LICENSE = "MIT"
-PR = "r50"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit packagegroup
-
-ARAGO_TEST = "\
-    bonnie++ \
-    hdparm \
-    iozone3 \
-    lmbench \
-    rt-tests \
-    evtest \
-    bc \
-    memtester \
-    libdrm-tests \
-    powertop \
-    stress \
-    stress-ng \
-    yavta \
-    rng-tools \
-    perf \
-    v4l-utils \
-    smcroute \
-    rwmem \
-    pulseaudio-misc \
-    kselftests \
-    cpuset \
-    procps \
-    mtd-utils-ubifs-tests \
-    pcitest \
-    mstpd \
-    fio \
-"
-
-ARAGO_TEST_append_armv7a = " \
-    cpuburn-neon \
-"
-
-ARAGO_TEST_append_armv7ve = " \
-    cpuburn-neon \
-"
-
-# timestamping
-ARAGO_TI_TEST = " \
-    ltp-ddt \
-    input-utils \
-    cpuloadgen \
-    uvc-gadget \
-"
-
-ARAGO_TI_TEST_append_ti33x = " \
-    omapconf \
-"
-
-ARAGO_TI_TEST_append_ti43x = " \
-    omapconf \
-"
-
-ARAGO_TI_TEST_append_omap-a15 = " \
-    omapconf \
-    ti-ipc-test \
-"
-
-ARAGO_TI_TEST_append_k3 = " \
-    k3conf \
-"
-
-ARAGO_TI_TEST_append_am65xx = " \
-    ti-ipc-test \
-"
-
-ARAGO_TI_TEST_append_j7-evm = " \
-    viddec-test-app \
-    videnc-test-app \
-    ufs-tool \
-"
-
-ARAGO_TI_TEST_append_keystone = " \
-    ti-ipc-test \
-"
-
-ARAGO_TI_TEST_append_omapl138 = " \
-    ti-ipc-test \
-"
-
-RDEPENDS_${PN} = "\
-    ${ARAGO_TEST} \
-    ${ARAGO_TI_TEST} \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
similarity index 61%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
rename to meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 53954f7..500d3a9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -1,28 +1,102 @@
-DESCRIPTION = "Task to install additional utilities/demos for test image"
+SUMMARY = "TI Testing packagegroup"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+ARAGO_TEST = "\
+    bonnie++ \
+    hdparm \
+    iozone3 \
+    lmbench \
+    rt-tests \
+    evtest \
+    bc \
+    memtester \
+    libdrm-tests \
+    powertop \
+    stress \
+    stress-ng \
+    yavta \
+    rng-tools \
+    perf \
+    v4l-utils \
+    smcroute \
+    rwmem \
+    pulseaudio-misc \
+    kselftests \
+    cpuset \
+    procps \
+    mtd-utils-ubifs-tests \
+    pcitest \
+    mstpd \
+    fio \
+"
+
+ARAGO_TEST_append_armv7a = " \
+    cpuburn-neon \
+"
+
+ARAGO_TEST_append_armv7ve = " \
+    cpuburn-neon \
+"
+
+#    timestamping
+ARAGO_TI_TEST = " \
+    ltp-ddt \
+    input-utils \
+    cpuloadgen \
+    uvc-gadget \
+"
+
+ARAGO_TI_TEST_append_ti33x = " \
+    omapconf \
+"
+
+ARAGO_TI_TEST_append_ti43x = " \
+    omapconf \
+"
+
+ARAGO_TI_TEST_append_omap-a15 = " \
+    omapconf \
+    ti-ipc-test \
+"
+
+ARAGO_TI_TEST_append_am65xx = " \
+    ti-ipc-test \
+"
+
+ARAGO_TI_TEST_append_j7-evm = " \
+    viddec-test-app \
+    videnc-test-app \
+    ufs-tool \
+"
+
+ARAGO_TI_TEST_append_keystone = " \
+    ti-ipc-test \
+"
+
+ARAGO_TI_TEST_append_omapl138 = " \
+    ti-ipc-test \
+"
+
 TEST_ADDONS = " \
     bridge-utils \
     linuxptp \
     openntpd \
-    "
+"
 
 TEST_ADDONS_TI = ""
 
 TEST_ADDONS_TI_append_ti43x = " \
     cmem-test \
-    "
+"
 
 TEST_ADDONS_TI_append_omap-a15 = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
     cmem-test \
-    "
+"
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr
@@ -40,7 +114,7 @@ TEST_ADDONS_TI_append_keystone = " \
     traceframework-test \
     udma-test \
     cmem-test \
-    "
+"
 
 # The following are not yet ready for k2g-evm
 #    nwal-lld-test
@@ -62,7 +136,7 @@ TEST_ADDONS_TI_append_k2hk = " \
     hyplnk-lld-test \
     mmap-lld-test \
     aif2-lld-test \
-    "
+"
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
@@ -74,7 +148,7 @@ TEST_ADDONS_TI_append_k2l = " \
     dfe-lld-test \
     iqn2-lld-test \
     ipc-transport-qmss-test \
-    "
+"
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
@@ -86,9 +160,11 @@ TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
     ipc-transport-qmss-test \
-    "
+"
 
 RDEPENDS_${PN} = "\
+    ${ARAGO_TEST} \
+    ${ARAGO_TI_TEST} \
     ${TEST_ADDONS} \
     ${TEST_ADDONS_TI} \
-    "
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index ce94572..345a06e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -32,8 +32,7 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     packagegroup-arago-base-tisdk \
-    packagegroup-arago-test \
-    packagegroup-arago-test-addons \
+    ti-test \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte qt3d-examples','',d)} \
-- 
2.7.4


