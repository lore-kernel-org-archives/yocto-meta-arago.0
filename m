Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 793CB5299A
	for <meta-arago@arago-project.org>;
	Mon, 30 Nov 2015 22:07:28 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NYN001QFERJ3XE0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 30 Nov 2015 16:06:56 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=PI2g57r6sP5HTgC--qUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 62D64161D31;	Mon,
	30 Nov 2015 17:06:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 30 Nov 2015 17:06:55 -0500
Message-id: <1448921215-27930-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] packagegroup*: re-enable updated mpm-transport and multiprocmanager for keystone
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
X-List-Received-Date: Mon, 30 Nov 2015 22:07:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb        | 14 +++++++-------
 .../packagegroups/packagegroup-arago-test-addons.bb      | 16 +++++++++-------
 .../packagegroup-arago-tisdk-addons-sdk-target.bb        | 11 +++++------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index dfb5712..122b13f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r4"
+PR = "r5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -82,20 +82,15 @@ ARAGO_SECURE_STORAGE = "\
     "
 
 # Disable due to IPC for now
-#    ti-ipc
 #    demo-image-proc
 #    rm-lld
-#    cmem
-#    cmem-mod
 #    pa-lld
 #    qmss-lld
 #    hplib
 #    hplib-mod
-#    multiprocmgr
 #    nwal-lld
 #    netapi
 #    netapi-test
-#    mpm-transport
 #    pktlib
 #    cppi-lld
 #    ipsecmgr-mod
@@ -109,6 +104,11 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     cuia \
     edma3-lld \
     srss-tc \
+    cmem \
+    cmem-mod \
+    ti-ipc \
+    mpm-transport \
+    multiprocmgr \
     "
 
 ARAGO_TI_PKGS = ""
@@ -116,7 +116,7 @@ ARAGO_TI_PKGS = ""
 #    cmem \
 #    cmem-mod \
 #    "
-ARAGO_TI_PKGS_append_keystone = "${ARAGO_TI_KEYSTONE_PKGS}"
+ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
 ARAGO_TI_PKGS_append_k2l-evm = "\
     dfe-lld \
     iqn2-lld \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 9affd75..a437c45 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r3"
+PR = "r4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,11 +15,15 @@ TEST_ADDONS = " \
     gdb \
     "
 
-TEST_ADDONS_TI = ""
+TEST_ADDONS_TI = " \
+    cmem-test \
+    "
+
+TEST_ADDONS_TI_append_keystone = " \
+    mpm-transport-test \
+    multiprocmgr-test \
+    "
 
-#    cmem-test \
-#    "
-#TEST_ADDONS_TI_append_keystone = " \
 #    qmss-lld-test \
 #    pa-lld-test \
 #    cppi-lld-test \
@@ -31,13 +35,11 @@ TEST_ADDONS_TI = ""
 #    sa-lld \
 #    sa-lld-test \
 #    traceframework-test \
-#    multiprocmgr-test \
 #    hplib-test \
 #    hyplnk-lld-test \
 #    nwal-lld \
 #    nwal-lld-test \
 #    udma-test \
-#    mpm-transport-test \
 #    ipc-transport-qmss-test \
 #    ipsecmgr \
 #    netapi-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 9780bde..8ba5a82 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,11 +28,6 @@ TI_SECURE_STORAGE_DEV = "\
 	libp11-staticdev \
 	"
 
-# Old version broken against 4.1, new version is not complete
-#	multiprocmgr-dev
-#	multiprocmgr-staticdev
-#	mpm-transport-dev
-#	mpm-transport-staticdev
 # Broken with 4.1
 #	ipsecmgr-dev
 #	ipsecmgr-staticdev
@@ -71,6 +66,10 @@ EXTRA_LIBS_append_keystone = "\
 	libnl-staticdev \
 	ti-ipc-dev \
 	ti-ipc-staticdev \
+	multiprocmgr-dev \
+	multiprocmgr-staticdev \
+	mpm-transport-dev \
+	mpm-transport-staticdev \
 	edma3-lld-dev \
 	edma3-lld-staticdev \
 	lksctp-tools-dev \
-- 
2.2.0


