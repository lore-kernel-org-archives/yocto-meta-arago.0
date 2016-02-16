Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id A1C48529B9
	for <meta-arago@arago-project.org>;
	Tue, 16 Feb 2016 20:44:11 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2N00CJAQW40140@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 16 Feb 2016 14:43:17 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=2tDr40hsVwCCKIzrFskA:9
Received: by 100.15.86.14 with SMTP id 4528a2e7; Tue, 16 Feb 2016 20:43:17 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 68848161E9D;	Tue,
	16 Feb 2016 15:43:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Feb 2016 15:43:15 -0500
Message-id: <1455655395-27834-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: allow easily selecting systest kernel variant
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
X-List-Received-Date: Tue, 16 Feb 2016 20:44:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                          | 8 +++++++-
 meta-arago-distro/conf/distro/include/arago-prefs.inc             | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-systest_%.bbappend      | 5 +++++
 3 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 96e2b2c..f4f499e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -61,9 +61,15 @@ PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
+ARAGO_KERNEL_SUFFIX ?= ""
+
 # Set real-time kernel suffix
 ARAGO_RT_ENABLE ?= "0"
-ARAGO_RT_SUFFIX = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
+ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt", "", d)}"
+
+# Set systest kernel suffix
+ARAGO_SYSTEST_ENABLE ?= "0"
+ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index ec6238d..8acd156 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -65,7 +65,7 @@ PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
 # Use latest TI staging kernel and u-boot trees
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_RT_SUFFIX}"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
 PREFERRED_VERSION_linux-ti-staging = "4.1%"
 
 PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
new file mode 100644
index 0000000..b93b610
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bbappend
@@ -0,0 +1,5 @@
+MACHINE_KERNEL_PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+require copy-defconfig.inc
-- 
2.2.0


