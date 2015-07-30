Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 8BDF352A4E
	for <meta-arago@arago-project.org>;
	Thu, 30 Jul 2015 16:03:50 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSB008P35XCW690@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 30 Jul 2015 11:03:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=LPpE2oyMjXHHnhJY0IkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E6D9C161B2D;	Thu,
	30 Jul 2015 12:03:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jul 2015 12:03:10 -0400
Message-id: <1438272191-15395-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438272191-15395-1-git-send-email-denis@denix.org>
References: <1438272191-15395-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/5] HACK: disable remaining smaller pieces due to breakage with 4.1/IPC
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
X-List-Received-Date: Thu, 30 Jul 2015 16:03:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb  | 14 +++++++++-----
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb             |  5 +++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 82f86cb..8b505f2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,11 +1,12 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r30"
+PR = "r32"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+# perf fails with 4.1 kernel
 ARAGO_TEST = "\
     bonnie++ \
     hdparm \
@@ -21,7 +22,6 @@ ARAGO_TEST = "\
     stress \
     yavta \
     rng-tools \
-    perf \
     v4l-utils \
     smcroute \
     rwmem \
@@ -29,8 +29,10 @@ ARAGO_TEST = "\
     pulseaudio-misc \
     "
 
+# Disable this due to IPC missing in 4.1
+#    ltp-ddt
+
 ARAGO_TI_TEST = "\
-    ltp-ddt \
     input-utils \
     cpuloadgen \
     "
@@ -46,12 +48,14 @@ ARAGO_TI_TEST_append_ti43x = " \
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
     ipc-test-fw \
-    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
     "
+# omap-a15 -    ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}
+
+# vpdma-fw and vpe-tests both provide FW image
+#    vpe-tests
 
 ARAGO_TI_TEST_append_dra7xx = " \
     vpdma-fw \
-    vpe-tests \
     "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index 60e2234..5cb2f86 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -24,11 +24,12 @@ TOOLS_append_am3517-evm = " flash-utility"
 EXTRA_FILES = ""
 EXTRA_FILES_omap-a15 = "tisdk-readme tisdk-uenv"
 
+# ti-tisdk-makefile
+
 RDEPENDS_${PN} = "\
     ${TOOLS} \
     ti-tisdk-setup \
     ${EXTRA_FILES} \
-    ti-tisdk-makefile \
     ${U-BOOT_SRC} \
     ${KERNEL_SRC} \
     ${@base_conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshallow-repositories','',d)} \
-- 
2.2.0


