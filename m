Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id CB9C1529F8
	for <meta-arago@arago-project.org>;
	Fri, 11 Sep 2015 20:41:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUJ008OI5H0A150@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 11 Sep 2015 15:41:40 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=Q_ZZ66OwBiOzni1K9NoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5E203161BE3;	Fri,
	11 Sep 2015 16:41:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 11 Sep 2015 16:41:23 -0400
Message-id: <1442004083-19135-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] Revert "HACK: disable CMEM and DSP tools until IPC gets merged to 4.1"
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
X-List-Received-Date: Fri, 11 Sep 2015 20:41:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 0feeb899d914eee640ac15f825db26b97c2e78f6.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb      | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb    | 7 +++----
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 +++----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 50f7ed2..525655f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r12"
+PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,8 +26,8 @@ UTILS_append_ti33x = " \
 "
 
 EXTRA_LIBS = ""
-#EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
-#EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src gdbserverproxy-module-drv-src"
+EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
+EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src gdbserverproxy-module-drv-src"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index d2c4959..41dc86a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -101,12 +101,11 @@ UTILS_append_ti43x = " canutils-dev"
 UTILS_append_dra7xx = " canutils-dev"
 
 EXTRA_LIBS = ""
-#EXTRA_LIBS_append_omap-a15 = " cmem-dev"
+EXTRA_LIBS_append_omap-a15 = " cmem-dev"
 EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
+                             gdbserver-c6x-dev \
 "
-# dra7xx - gdbserver-c6x-dev
-
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 3ac08e2..c9b1009 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r28"
+PR = "r29"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -35,8 +35,7 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 UTILS_append_omap3 = " canutils"
 UTILS_append_ti33x = " canutils"
 UTILS_append_ti43x = " canutils"
-UTILS_append_dra7xx = " canutils"
-# dra7xx - gdbc6x  dsptop
+UTILS_append_dra7xx = " canutils dsptop gdbc6x"
 UTILS_append_omap-a15 = " parted"
 
 UTILS_append_ti33x = " switch-config"
@@ -44,7 +43,7 @@ UTILS_append_ti43x = " switch-config libdrm-omap"
 UTILS_append_omap-a15 = " switch-config libdrm-omap stream-openmp"
 
 EXTRA_LIBS = ""
-#EXTRA_LIBS_append_omap-a15 = " cmem"
+EXTRA_LIBS_append_omap-a15 = " cmem"
 
 DEVTOOLS = " \
     packagegroup-core-buildessential \
-- 
2.2.0


