Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id DE68F52A9F
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2015 16:03:42 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSB00I3R5XCMNC0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jul 2015 11:03:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=Q_ZZ66OwBiOzni1K9NoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DC332161B25;	Thu,
	30 Jul 2015 12:03:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jul 2015 12:03:09 -0400
Message-id: <1438272191-15395-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438272191-15395-1-git-send-email-denis@denix.org>
References: <1438272191-15395-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/5] HACK: disable CMEM and DSP tools until IPC gets merged to 4.1
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
X-List-Received-Date: Thu, 30 Jul 2015 16:03:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb      | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb    | 7 ++++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 ++++---
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index e1a5ed0..50f7ed2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,8 +26,8 @@ UTILS_append_ti33x = " \
 "
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
-EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src gdbserverproxy-module-drv-src"
+#EXTRA_LIBS_append_omap-a15 = " cmem-mod-src"
+#EXTRA_LIBS_append_dra7xx = " debugss-module-drv-src gdbserverproxy-module-drv-src"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index f34c299..f52ab30 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -14,11 +14,12 @@ UTILS_append_ti43x = " canutils-dev"
 UTILS_append_dra7xx = " canutils-dev"
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem-dev"
+#EXTRA_LIBS_append_omap-a15 = " cmem-dev"
 EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
-                             gdbserver-c6x-dev \
 "
+# dra7xx - gdbserver-c6x-dev
+
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 7436503..3ac08e2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r27"
+PR = "r28"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -35,7 +35,8 @@ UTILS_append_am180x-evm = " ti-pru-sw-examples"
 UTILS_append_omap3 = " canutils"
 UTILS_append_ti33x = " canutils"
 UTILS_append_ti43x = " canutils"
-UTILS_append_dra7xx = " canutils dsptop gdbc6x"
+UTILS_append_dra7xx = " canutils"
+# dra7xx - gdbc6x  dsptop
 UTILS_append_omap-a15 = " parted"
 
 UTILS_append_ti33x = " switch-config"
@@ -43,7 +44,7 @@ UTILS_append_ti43x = " switch-config libdrm-omap"
 UTILS_append_omap-a15 = " switch-config libdrm-omap stream-openmp"
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem"
+#EXTRA_LIBS_append_omap-a15 = " cmem"
 
 DEVTOOLS = " \
     packagegroup-core-buildessential \
-- 
2.2.0


