Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1E76C52AFC
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 00:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 133F420B35;
	Fri,  3 Feb 2017 00:30:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m5Odn4Z31cXl; Fri,  3 Feb 2017 00:30:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5BD9208D1;
	Fri,  3 Feb 2017 00:30:54 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id DBA69162339;
	Thu,  2 Feb 2017 19:30:53 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  2 Feb 2017 19:30:53 -0500
Message-Id: <1486081853-15030-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] HACK: FIXME: packagegroups: disable cmem and deps due to 4.9 kernel breakage
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
X-List-Received-Date: Fri, 03 Feb 2017 00:30:57 -0000

cmem is out-of-tree module and requires update due to recent get_user_pages() API changes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 11 +++++----
 .../packagegroup-arago-test-addons.bb              | 27 +++++++++++++---------
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  8 ++++---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 26 +++++++++++----------
 .../packagegroup-arago-tisdk-addons.bb             |  9 +++++---
 5 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 394482d..7724a94 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -81,6 +81,11 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
+# Disable cmem (and deps) due to 4.9 kernel
+#    cmem
+#    cmem-mod
+#    multiprocmgr
+#    mpm-transport
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -91,11 +96,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     cuia \
     edma3-lld \
     srss-tc \
-    cmem \
-    cmem-mod \
     ti-ipc \
-    mpm-transport \
-    multiprocmgr \
     rm-lld \
     demo-image-proc \
     pa-lld \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 8bc9dec..82c2682 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,17 +15,20 @@ TEST_ADDONS = " \
 
 TEST_ADDONS_TI = ""
 
+# Disable cmem due to 4.9 kernel
+#    cmem-test
 TEST_ADDONS_TI_append_omap-a15 = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
-    cmem-test \
     "
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr
+# Disable cmem (and deps) due to 4.9 kernel
+#    cmem-test
+#    mpm-transport-test
+#    multiprocmgr-test
+#    qmss-lld-test
 TEST_ADDONS_TI_append_keystone = " \
-    mpm-transport-test \
-    multiprocmgr-test \
-    qmss-lld-test \
     pa-lld-test \
     cppi-lld-test \
     edma3-lld-test \
@@ -35,7 +38,6 @@ TEST_ADDONS_TI_append_keystone = " \
     sa-lld-test \
     traceframework-test \
     udma-test \
-    cmem-test \
     "
 
 # The following are not yet ready for k2g-evm
@@ -47,10 +49,11 @@ TEST_ADDONS_TI_append_keystone = " \
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
+# Disable cmem and deps due to 4.9 kernel
+#    srio-lld-test
+#    ipc-transport-srio-test
+#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2hk-evm = " \
-    srio-lld-test \
-    ipc-transport-srio-test \
-    ipc-transport-qmss-test \
     hyplnk-lld-test \
     mmap-lld-test \
     aif2-lld-test \
@@ -61,24 +64,26 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
+# Disable cmem and deps due to 4.9 kernel
+#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    ipc-transport-qmss-test \
     "
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi-test
+# Disable cmem and deps due to 4.9 kernel
+#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2e = " \
     mmap-lld-test \
     hyplnk-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    ipc-transport-qmss-test \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 148e9a3..cd1afa2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r29"
+PR = "r30"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -33,8 +33,9 @@ UTILS_append_ti43x = " \
 
 EXTRA_LIBS = ""
 
+# Disable cmem due to 4.9 kernel
+#    cmem-mod-src
 EXTRA_LIBS_append_omap-a15 = " \
-    cmem-mod-src \
     pru-icss-src \
 "
 
@@ -45,8 +46,9 @@ EXTRA_LIBS_append_dra7xx = " \
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr-mod-src
+# Disable cmem due to 4.9 kernel
+#    cmem-mod-src
 EXTRA_LIBS_append_keystone = " \
-    cmem-mod-src \
     uio-module-drv-src \
     hplib-mod-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index b2586d5..c2836c5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r34"
+PR = "r35"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -33,10 +33,17 @@ TI_SECURE_STORAGE_DEV = "\
 #	ipsecmgr-staticdev
 #	libnl-xfrm-dev
 #	libnl-xfrm-staticdev
+# Disable cmem (and deps) due to 4.9 kernel breakage
+#	cmem-dev
+#	cmem-staticdev
+#	multiprocmgr-dev
+#	multiprocmgr-staticdev
+#	mpm-transport-dev
+#	mpm-transport-staticdev
+#	ipc-transport-qmss-dev
+#	ipc-transport-qmss-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
-	cmem-dev \
-	cmem-staticdev \
 	udma-dev \
 	udma-staticdev \
 	traceframework-dev \
@@ -60,16 +67,10 @@ EXTRA_LIBS_append_keystone = "\
 	libnl-staticdev \
 	ti-ipc-dev \
 	ti-ipc-staticdev \
-	multiprocmgr-dev \
-	multiprocmgr-staticdev \
-	mpm-transport-dev \
-	mpm-transport-staticdev \
 	edma3-lld-dev \
 	edma3-lld-staticdev \
 	lksctp-tools-dev \
 	lksctp-tools-staticdev \
-	ipc-transport-qmss-dev \
-	ipc-transport-qmss-staticdev \
 	"
 
 # Disable netapi due to libnl and xfrm conflict
@@ -89,11 +90,12 @@ EXTRA_LIBS_append_k2l-evm = "\
 # Disable netapi due to libnl and xfrm conflict
 #	netapi-dev
 #	netapi-staticdev
+# Disable cmem (and deps) due to 4.9 kernel breakage
+#	ipc-transport-srio-dev
+#	ipc-transport-srio-staticdev
 EXTRA_LIBS_append_k2hk-evm = "\
 	srio-lld-dev \
 	srio-lld-staticdev \
-	ipc-transport-srio-dev \
-	ipc-transport-srio-staticdev \
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
@@ -129,7 +131,7 @@ UTILS_append_dra7xx = " canutils-dev \
 UTILS_append_k2g = " canutils-dev"
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem-dev"
+#EXTRA_LIBS_append_omap-a15 = " cmem-dev"
 EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 1da4ee8..6e9265f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r55"
+PR = "r56"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -86,13 +86,16 @@ UTILS_append_k2g = " \
 "
 
 EXTRA_LIBS = ""
+
+# Disable cmem due to 4.9 kernel
+#    cmem
 EXTRA_LIBS_append_omap-a15 = " \
-    cmem \
     uio-module-drv \
 "
 
+# Disable cmem due to 4.9 kernel
+#    cmem
 EXTRA_LIBS_append_keystone = " \
-    cmem \
     uio-module-drv \
 "
 
-- 
2.7.4


