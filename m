Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id 4615D52A04
	for <meta-arago@arago-project.org>;
	Thu, 14 Apr 2016 14:14:49 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5M008AGNK9II20@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Apr 2016 09:14:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=TN5SbgX9tSh-YHPD03MA:9
Received: by 100.15.86.14 with SMTP id 0d2d7d19; Thu, 14 Apr 2016 14:14:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B7A84161FA2;	Thu,
	14 Apr 2016 10:14:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 14 Apr 2016 10:14:32 -0400
Message-id: <1460643272-6615-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: packagrgoup*: ipsecmgr won't build against 4.4, disable it and netapi
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
X-List-Received-Date: Thu, 14 Apr 2016 14:14:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb      | 16 ++++++++--------
 .../packagegroups/packagegroup-arago-test-addons.bb    | 10 +++++-----
 .../packagegroup-arago-tisdk-addons-sdk-host.bb        |  4 ++--
 .../packagegroup-arago-tisdk-addons-sdk-target.bb      | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index adc6108..d9b7eab 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -86,6 +86,7 @@ ARAGO_SECURE_STORAGE = "\
 #    mpm-transport
 #    multiprocmgr
 #    qmss-lld
+#    ipsecmgr-mod
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -103,7 +104,6 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     hplib-mod \
     pktlib \
     cppi-lld \
-    ipsecmgr-mod \
     "
 
 # The following packages are not yet ready for k2g-evm
@@ -114,31 +114,31 @@ ARAGO_TI_KEYSTONE_PKGS = "\
 
 ARAGO_TI_PKGS = ""
 ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
+#    netapi
+#    netapi-test
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
-    netapi \
-    netapi-test \
     hplib \
     nwal-lld \
     "
 
 #    srio-lld
+#    netapi
+#    netapi-test
 ARAGO_TI_PKGS_append_k2hk-evm = "\
     mmap-lld \
     hyplnk-lld \
     aif2-lld \
-    netapi \
-    netapi-test \
     hplib \
     nwal-lld \
     "
 
+#    netapi
+#    netapi-test
 ARAGO_TI_PKGS_append_k2e-evm = "\
     mmap-lld \
     hyplnk-lld \
-    netapi \
-    netapi-test \
     hplib \
     nwal-lld \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index f59d0db..fd1f5e9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,6 +22,7 @@ TEST_ADDONS = " \
 #    multiprocmgr-test
 #    qmss-lld-test
 #    mpm-transport-test
+#    ipsecmgr
 TEST_ADDONS_TI_append_keystone = " \
     pa-lld-test \
     cppi-lld-test \
@@ -32,7 +33,6 @@ TEST_ADDONS_TI_append_keystone = " \
     sa-lld-test \
     traceframework-test \
     udma-test \
-    ipsecmgr \
     "
 
 # The following are not yet ready for k2g-evm
@@ -45,6 +45,7 @@ TEST_ADDONS_TI_append_keystone = " \
 #    srio-lld-test
 #    ipc-transport-srio-test
 #    ipc-transport-qmss-test
+#    netapi-test
 TEST_ADDONS_TI_append_k2hk-evm = " \
     hyplnk-lld-test \
     mmap-lld-test \
@@ -52,27 +53,26 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    netapi-test \
     "
 
 #    ipc-transport-qmss-test
+#    netapi-test
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    netapi-test \
     "
 
 #    ipc-transport-qmss-test
+#    netapi-test
 TEST_ADDONS_TI_append_k2e-evm = " \
     mmap-lld-test \
     hyplnk-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    netapi-test \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c5628ef..e27f382 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -65,10 +65,10 @@ EXTRA_LIBS_append_dra7xx = " \
 "
 
 #    cmem-mod-src
+#    ipsecmgr-mod-src
 EXTRA_LIBS_append_keystone = " \
     uio-module-drv-src \
     hplib-mod-src \
-    ipsecmgr-mod-src \
 "
 
 EXTRA_LIBS_append_k2hk-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 32f3f4d..7d3647e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r28"
+PR = "r29"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -38,6 +38,8 @@ TI_SECURE_STORAGE_DEV = "\
 #	qmss-lld-staticdev
 #	ipc-transport-qmss-dev
 #	ipc-transport-qmss-staticdev
+#	ipsecmgr-dev
+#	ipsecmgr-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
 	udma-dev \
@@ -67,17 +69,15 @@ EXTRA_LIBS_append_keystone = "\
 	edma3-lld-staticdev \
 	lksctp-tools-dev \
 	lksctp-tools-staticdev \
-	ipsecmgr-dev \
-	ipsecmgr-staticdev \
 	"
 
+#	netapi-dev
+#	netapi-staticdev
 EXTRA_LIBS_append_k2l-evm = "\
 	dfe-lld-dev \
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
@@ -88,13 +88,13 @@ EXTRA_LIBS_append_k2l-evm = "\
 #	srio-lld-staticdev
 #	ipc-transport-srio-dev
 #	ipc-transport-srio-staticdev
+#	netapi-dev
+#	netapi-staticdev
 EXTRA_LIBS_append_k2hk-evm = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
@@ -103,13 +103,13 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	aif2-lld-staticdev \
 	"
 
+#	netapi-dev
+#	netapi-staticdev
 EXTRA_LIBS_append_k2e-evm = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
-	netapi-dev \
-	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
-- 
2.2.0


