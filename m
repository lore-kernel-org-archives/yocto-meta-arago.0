Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 231A1529AD
	for <meta-arago@arago-project.org>;
	Thu, 14 Apr 2016 00:37:13 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5L00J52LPIOC50@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 13 Apr 2016 19:37:00 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=uXTowX4D5J2HOpUZlmEA:9
Received: by 100.15.86.14 with SMTP id 385e4c11; Thu, 14 Apr 2016 00:37:00 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A88B0161FA4;	Wed,
	13 Apr 2016 20:36:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 13 Apr 2016 20:36:54 -0400
Message-id: <1460594214-8814-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: packagegroup*: disable mpm/srio/qmss/ocl on K2 due to deps on cmem
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
X-List-Received-Date: Thu, 14 Apr 2016 00:37:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 10 ++---
 .../packagegroup-arago-test-addons.bb              | 21 +++++------
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 30 +++++++--------
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  | 44 +++++++++++-----------
 .../packagegroup-arago-tisdk-addons.bb             | 38 +++++++++----------
 .../packagegroup-arago-tisdk-matrix.bb             | 26 ++++++-------
 6 files changed, 84 insertions(+), 85 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 361fce8..adc6108 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -83,6 +83,9 @@ ARAGO_SECURE_STORAGE = "\
 
 #    cmem-mod
 #    cmem
+#    mpm-transport
+#    multiprocmgr
+#    qmss-lld
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -94,12 +97,9 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     edma3-lld \
     srss-tc \
     ti-ipc \
-    mpm-transport \
-    multiprocmgr \
     rm-lld \
     demo-image-proc \
     pa-lld \
-    qmss-lld \
     hplib-mod \
     pktlib \
     cppi-lld \
@@ -123,8 +123,8 @@ ARAGO_TI_PKGS_append_k2l-evm = "\
     nwal-lld \
     "
 
+#    srio-lld
 ARAGO_TI_PKGS_append_k2hk-evm = "\
-    srio-lld \
     mmap-lld \
     hyplnk-lld \
     aif2-lld \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index f61714f..f59d0db 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r6"
+PR = "r7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,10 +18,11 @@ TEST_ADDONS = " \
 #    cmem-test \
 #    "
 
+#    mpm-transport-test
+#    multiprocmgr-test
+#    qmss-lld-test
+#    mpm-transport-test
 TEST_ADDONS_TI_append_keystone = " \
-    mpm-transport-test \
-    multiprocmgr-test \
-    qmss-lld-test \
     pa-lld-test \
     cppi-lld-test \
     edma3-lld-test \
@@ -30,9 +31,7 @@ TEST_ADDONS_TI_append_keystone = " \
     sa-lld \
     sa-lld-test \
     traceframework-test \
-    multiprocmgr-test \
     udma-test \
-    mpm-transport-test \
     ipsecmgr \
     "
 
@@ -43,36 +42,36 @@ TEST_ADDONS_TI_append_keystone = " \
 #    ipc-transport-qmss-test
 #    netapi-test
 
+#    srio-lld-test
+#    ipc-transport-srio-test
+#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2hk-evm = " \
-    srio-lld-test \
-    ipc-transport-srio-test \
     hyplnk-lld-test \
     mmap-lld-test \
     aif2-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    ipc-transport-qmss-test \
     netapi-test \
     "
 
+#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2l-evm = " \
     dfe-lld-test \
     iqn2-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    ipc-transport-qmss-test \
     netapi-test \
     "
 
+#    ipc-transport-qmss-test
 TEST_ADDONS_TI_append_k2e-evm = " \
     mmap-lld-test \
     hyplnk-lld-test \
     nwal-lld-test \
     hplib-test \
     nwal-lld \
-    ipc-transport-qmss-test \
     netapi-test \
     "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 1faf487..c5628ef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -37,20 +37,20 @@ UTILS_append_dra7xx = " \
 "
 
 #    linalg-examples-src
-UTILS_append_k2hk-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
-
-UTILS_append_k2l-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
-
-UTILS_append_k2e-evm = " \
-    opencl-examples-src \
-    openmpacc-examples-src \
-"
+#UTILS_append_k2hk-evm = " \
+#    opencl-examples-src \
+#    openmpacc-examples-src \
+#"
+
+#UTILS_append_k2l-evm = " \
+#    opencl-examples-src \
+#    openmpacc-examples-src \
+#"
+
+#UTILS_append_k2e-evm = " \
+#    opencl-examples-src \
+#    openmpacc-examples-src \
+#"
 
 EXTRA_LIBS = ""
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 8db75a2..32f3f4d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r27"
+PR = "r28"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -30,6 +30,14 @@ TI_SECURE_STORAGE_DEV = "\
 
 #	cmem-dev
 #	cmem-staticdev
+#	multiprocmgr-dev
+#	multiprocmgr-staticdev
+#	mpm-transport-dev
+#	mpm-transport-staticdev
+#	qmss-lld-dev
+#	qmss-lld-staticdev
+#	ipc-transport-qmss-dev
+#	ipc-transport-qmss-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
 	udma-dev \
@@ -41,8 +49,6 @@ EXTRA_LIBS_append_keystone = "\
 	common-csl-ip-dev \
 	cppi-lld-dev \
 	cppi-lld-staticdev \
-	qmss-lld-dev \
-	qmss-lld-staticdev \
 	pa-lld-dev \
 	pa-lld-staticdev \
 	rm-lld-dev \
@@ -57,16 +63,10 @@ EXTRA_LIBS_append_keystone = "\
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
 	ipsecmgr-dev \
 	ipsecmgr-staticdev \
 	"
@@ -84,11 +84,11 @@ EXTRA_LIBS_append_k2l-evm = "\
 	nwal-lld-staticdev \
 	"
 
+#	srio-lld-dev
+#	srio-lld-staticdev
+#	ipc-transport-srio-dev
+#	ipc-transport-srio-staticdev
 EXTRA_LIBS_append_k2hk-evm = "\
-	srio-lld-dev \
-	srio-lld-staticdev \
-	ipc-transport-srio-dev \
-	ipc-transport-srio-staticdev \
 	mmap-lld \
 	mmap-lld-staticdev \
 	hyplnk-lld-dev \
@@ -126,15 +126,15 @@ UTILS_append_dra7xx = " canutils-dev \
                         openmpacc-dev \
 "
 #                          linalg-dev
-UTILS_append_k2hk-evm = " opencl-staticdev \
-                          openmpacc-dev \
-"
-UTILS_append_k2l-evm = " opencl-staticdev \
-                         openmpacc-dev \
-"
-UTILS_append_k2e-evm = " opencl-staticdev \
-                         openmpacc-dev \
-"
+#UTILS_append_k2hk-evm = " opencl-staticdev \
+#                          openmpacc-dev \
+#"
+#UTILS_append_k2l-evm = " opencl-staticdev \
+#                         openmpacc-dev \
+#"
+#UTILS_append_k2e-evm = " opencl-staticdev \
+#                         openmpacc-dev \
+#"
 UTILS_append_k2g-evm = " canutils-dev"
 
 EXTRA_LIBS = ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a617b7f..206c4d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r46"
+PR = "r47"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -69,20 +69,20 @@ UTILS_append_keystone = " \
     ti-ipc-rtos-fw \
 "
 
+#    opencl-examples
 UTILS_append_k2hk-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
+#    opencl-examples
 UTILS_append_k2l-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
 
+#    opencl-examples
 UTILS_append_k2e-evm = " \
-    opencl-examples \
     gdbc6x \
     dsptop \
 "
@@ -109,21 +109,21 @@ EXTRA_PACKAGES_append_dra7xx = " \
     openmpacc-examples-dev \
 "
 #    linalg-examples
-EXTRA_PACKAGES_append_k2hk-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
-EXTRA_PACKAGES_append_k2l-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
-EXTRA_PACKAGES_append_k2e-evm = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
-"
+#EXTRA_PACKAGES_append_k2hk-evm = " \
+#    opencl-staticdev \
+#    opencl-examples-dev \
+#    openmpacc-examples-dev \
+#"
+#EXTRA_PACKAGES_append_k2l-evm = " \
+#    opencl-staticdev \
+#    opencl-examples-dev \
+#    openmpacc-examples-dev \
+#"
+#EXTRA_PACKAGES_append_k2e-evm = " \
+#    opencl-staticdev \
+#    opencl-examples-dev \
+#    openmpacc-examples-dev \
+#"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 28f4b29..7a02004 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r53"
+PR = "r54"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -171,20 +171,20 @@ MATRIX_APPS_append_keystone = " \
     matrix-mc-demo-ipc          \
 "
 
-MATRIX_APPS_append_k2hk-evm = "      \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
+#MATRIX_APPS_append_k2hk-evm = "      \
+#    matrix-opencl-demo-floatcompute  \
+#    matrix-opencl-demo-vecadd        \
+#"
 
-MATRIX_APPS_append_k2l-evm = "       \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
+#MATRIX_APPS_append_k2l-evm = "       \
+#    matrix-opencl-demo-floatcompute  \
+#    matrix-opencl-demo-vecadd        \
+#"
 
-MATRIX_APPS_append_k2e-evm = "       \
-    matrix-opencl-demo-floatcompute  \
-    matrix-opencl-demo-vecadd        \
-"
+#MATRIX_APPS_append_k2e-evm = "       \
+#    matrix-opencl-demo-floatcompute  \
+#    matrix-opencl-demo-vecadd        \
+#"
 
 RDEPENDS_${PN} = "        \
     ${MATRIX_ESSENTIALS}  \
-- 
2.2.0


