Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id DB237529CA
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 21:53:05 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7U009P7VG2Z740@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 27 May 2016 16:52:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=TN5SbgX9tSh-YHPD03MA:9
Received: by 100.15.86.14 with SMTP id 3e9b4b96; Fri, 27 May 2016 21:52:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05FCB161A4C;	Fri,
	27 May 2016 17:52:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 27 May 2016 17:52:49 -0400
Message-id: <1464385969-8101-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagrgoup*: re-enable ipsecmgr and netapi
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
X-List-Received-Date: Fri, 27 May 2016 21:53:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 51cdd4eaefd05f3801d0ba17e6d20403849f9f10.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb      | 16 ++++++++--------
 .../packagegroups/packagegroup-arago-test-addons.bb    | 10 +++++-----
 .../packagegroup-arago-tisdk-addons-sdk-host.bb        |  4 ++--
 .../packagegroup-arago-tisdk-addons-sdk-target.bb      | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index c5352bc..5820ee3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -81,7 +81,6 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
-#    ipsecmgr-mod
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -104,6 +103,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     hplib-mod \
     pktlib \
     cppi-lld \
+    ipsecmgr-mod \
     "
 
 # The following packages are not yet ready for k2g-evm
@@ -114,31 +114,31 @@ ARAGO_TI_KEYSTONE_PKGS = "\
 
 ARAGO_TI_PKGS = ""
 ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
-#    netapi
-#    netapi-test
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
+    netapi \
+    netapi-test \
     hplib \
     nwal-lld \
     "
 
-#    netapi
-#    netapi-test
 ARAGO_TI_PKGS_append_k2hk-evm = "\
     srio-lld \
     mmap-lld \
     hyplnk-lld \
     aif2-lld \
+    netapi \
+    netapi-test \
     hplib \
     nwal-lld \
     "
 
-#    netapi
-#    netapi-test
 ARAGO_TI_PKGS_append_k2e-evm = "\
     mmap-lld \
     hyplnk-lld \
+    netapi \
+    netapi-test \
     hplib \
     nwal-lld \
     "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 51bfc2f..5d5ee6e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,7 +18,6 @@ TEST_ADDONS_TI = " \
     cmem-test \
     "
 
-#    ipsecmgr
 TEST_ADDONS_TI_append_keystone = " \
     mpm-transport-test \
     multiprocmgr-test \
@@ -32,6 +31,7 @@ TEST_ADDONS_TI_append_keystone = " \
     sa-lld-test \
     traceframework-test \
     udma-test \
+    ipsecmgr \
     "
 
 # The following are not yet ready for k2g-evm
@@ -41,7 +41,6 @@ TEST_ADDONS_TI_append_keystone = " \
 #    ipc-transport-qmss-test
 #    netapi-test
 
-#    netapi-test
 TEST_ADDONS_TI_append_k2hk-evm = " \
     srio-lld-test \
     ipc-transport-srio-test \
@@ -52,9 +51,9 @@ TEST_ADDONS_TI_append_k2hk-evm = " \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
+    netapi-test \
     "
 
-#    netapi-test
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
@@ -62,9 +61,9 @@ TEST_ADDONS_TI_append_k2l-evm = " \
     hplib-test \
     nwal-lld \
     ipc-transport-qmss-test \
+    netapi-test \
     "
 
-#    netapi-test
 TEST_ADDONS_TI_append_k2e-evm = " \
     mmap-lld-test \
     hyplnk-lld-test \
@@ -72,6 +71,7 @@ TEST_ADDONS_TI_append_k2e-evm = " \
     hplib-test \
     nwal-lld \
     ipc-transport-qmss-test \
+    netapi-test \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index e026089..6fcd6b0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r27"
+PR = "r28"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -43,11 +43,11 @@ EXTRA_LIBS_append_dra7xx = " \
     gdbserverproxy-module-drv-src \
 "
 
-#    ipsecmgr-mod-src
 EXTRA_LIBS_append_keystone = " \
     cmem-mod-src \
     uio-module-drv-src \
     hplib-mod-src \
+    ipsecmgr-mod-src \
 "
 
 EXTRA_LIBS_append_k2hk-evm = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 5bc9218..b768c70 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r32"
+PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,8 +28,6 @@ TI_SECURE_STORAGE_DEV = "\
 	libp11-staticdev \
 	"
 
-#	ipsecmgr-dev
-#	ipsecmgr-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
 	cmem-dev \
@@ -69,23 +67,23 @@ EXTRA_LIBS_append_keystone = "\
 	lksctp-tools-staticdev \
 	ipc-transport-qmss-dev \
 	ipc-transport-qmss-staticdev \
+	ipsecmgr-dev \
+	ipsecmgr-staticdev \
 	"
 
-#	netapi-dev
-#	netapi-staticdev
 EXTRA_LIBS_append_k2l-evm = "\
 	dfe-lld-dev \
 	dfe-lld-staticdev \
 	iqn2-lld-dev \
 	iqn2-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
 	nwal-lld-staticdev \
 	"
 
-#	netapi-dev
-#	netapi-staticdev
 EXTRA_LIBS_append_k2hk-evm = "\
 	srio-lld-dev \
 	srio-lld-staticdev \
@@ -95,6 +93,8 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
@@ -103,13 +103,13 @@ EXTRA_LIBS_append_k2hk-evm = "\
 	aif2-lld-staticdev \
 	"
 
-#	netapi-dev
-#	netapi-staticdev
 EXTRA_LIBS_append_k2e-evm = "\
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
 	hyplnk-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
 	hplib-dev \
 	hplib-staticdev \
 	nwal-lld-dev \
-- 
2.2.0


