Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 3230952A63
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 01:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 337FE20AC4;
	Fri,  3 Feb 2017 01:14:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8sbb1XM5bLgj; Fri,  3 Feb 2017 01:14:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 029FE208D1;
	Fri,  3 Feb 2017 01:14:47 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 1B0CE16233E;
	Thu,  2 Feb 2017 20:14:47 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  2 Feb 2017 20:14:46 -0500
Message-Id: <1486084486-30921-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] conf/distro: switch to 4.9 kernel
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
X-List-Received-Date: Fri, 03 Feb 2017 01:14:49 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc      | 5 -----
 meta-arago-distro/conf/distro/include/branding-core.inc    | 8 ++++++++
 meta-arago-distro/conf/distro/include/toolchain-gcc.inc    | 4 ++--
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 4 ++--
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 10475f0..353f918 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -23,11 +23,6 @@ PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
-PREFERRED_VERSION_linux-ti-staging = "4.4%"
-
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
-PREFERRED_VERSION_u-boot-ti-staging = "2016.05%"
 
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index a506e3c..ffdd690 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -10,3 +10,11 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
+
+# Temporarily disable "sgx" machine feature for all SOCs while building
+# latest code base, until it is fixed for 4.9 kernel
+MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
+
+# Temporarily disable "opencl" machine feature for all SOCs while building
+# latest code base, until it is fixed for 4.9 kernel
+MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('opencl', '')}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
index 09b11c3..762a6a5 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
@@ -20,7 +20,7 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-can
 SDKGCCVERSION ?= "6.2%"
 SDKBINUVERSION ?= "2.27%"
 SDKGLIBCVERSION ?= "2.24%"
-SDKLINUXLIBCVERSION ?= "4.4%"
+SDKLINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
@@ -38,7 +38,7 @@ GCCVERSION ?= "6.2%"
 BINUVERSION ?= "2.27%"
 GLIBCVERSION ?= "2.24%"
 GLIBCINITVERSION ?= "2.24%"
-LINUXLIBCVERSION ?= "4.4"
+LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index bbe6fd1..65b7beb 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -32,7 +32,7 @@ PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
 SDKGCCVERSION ?= "linaro-6.2%"
 SDKBINUVERSION ?= "linaro-2.27%"
 SDKGLIBCVERSION ?= "2.24%"
-SDKLINUXLIBCVERSION ?= "4.4%"
+SDKLINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -51,7 +51,7 @@ GCCVERSION ?= "linaro-6.2%"
 BINUVERSION ?= "linaro-2.27%"
 GLIBCVERSION ?= "2.24%"
 GLIBCINITVERSION ?= "2.24%"
-LINUXLIBCVERSION ?= "4.4"
+LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-- 
2.7.4


