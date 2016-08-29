Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id B77F8529DA
	for <meta-arago@arago-project.org>;
	Mon, 29 Aug 2016 22:19:27 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCO00ECQZC05900@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 29 Aug 2016 17:19:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=2ZVzV38F-fAty9POtDYA:9
Received: by 100.15.86.14 with SMTP id 18a4b9f1; Mon, 29 Aug 2016 22:19:12 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id E49611620DB;	Mon, 29 Aug 2016 18:19:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 29 Aug 2016 18:19:10 -0400
Message-id: <1472509151-4874-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] packagegroups: cleanup inclusion of strongswan and cmem-test
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
X-List-Received-Date: Mon, 29 Aug 2016 22:19:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb  | 3 +--
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb | 9 ++++-----
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 6 ++----
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 3d54838..3d8b891 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -154,7 +154,6 @@ RDEPENDS_${PN} = "\
     vsftpd \
     syslog-ng \
     dtc \
-    strongswan \
     procps \
     dhcp-client \
     kexec \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index c4f50ea..e463f99 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,15 +11,13 @@ TEST_ADDONS = " \
     bridge-utils \
     linuxptp \
     openntpd \
-    strongswan \
     "
 
-TEST_ADDONS_TI = " \
-    cmem-test \
-    "
+TEST_ADDONS_TI = ""
 
 TEST_ADDONS_TI_append_omap-a15 = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+    cmem-test \
     "
 
 TEST_ADDONS_TI_append_keystone = " \
@@ -36,6 +34,7 @@ TEST_ADDONS_TI_append_keystone = " \
     traceframework-test \
     udma-test \
     ipsecmgr \
+    cmem-test \
     "
 
 # The following are not yet ready for k2g-evm
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 0e3e1c6..db841ce 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r52"
+PR = "r53"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -23,6 +23,7 @@ UTILS = " \
     libdrm-kms \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     stream \
+    strongswan \
 "
 
 UTILS_UBOOT_FW = "u-boot-fw-utils"
@@ -32,7 +33,6 @@ UTILS_append_ti33x = " mmc-utils \
                        canutils \
                        switch-config \
                        pru-icss \
-                       strongswan \
 "
 
 UTILS_append_ti43x = " mmc-utils \
@@ -40,7 +40,6 @@ UTILS_append_ti43x = " mmc-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
-                       strongswan \
 "
 
 UTILS_append_omap-a15 = " mmc-utils \
@@ -49,7 +48,6 @@ UTILS_append_omap-a15 = " mmc-utils \
                           libdrm-omap \
                           stream-openmp \
                           pru-icss \
-                          strongswan \
                           ti-ipc-rtos-fw \
                           uio-test-pruss \
                           uio-module-drv-test \
-- 
2.7.4


