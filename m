Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 00AA5520DE
	for <meta-arago@arago-project.org>;
	Tue, 25 Aug 2020 01:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF4CB40C24;
	Tue, 25 Aug 2020 01:02:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oILq505tz540; Tue, 25 Aug 2020 01:02:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B565240020;
	Tue, 25 Aug 2020 01:02:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7ACAF172DF3;
	Mon, 24 Aug 2020 21:02:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 24 Aug 2020 21:02:33 -0400
Message-Id: <1598317353-46128-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] rtos, gcc-arm-none-eabi: rename gcc-arm-none-eabi to gcc-arm-baremetal
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
X-List-Received-Date: Tue, 25 Aug 2020 01:05:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Follow a similar rename in meta-ti

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb          | 4 ++--
 meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb               | 4 ++--
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb     | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb      | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb              | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 5a453b6..97ee2cb 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host packages for a standalone Arago SDK with TI tools"
-PR = "r0"
+PR = "r1"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
@@ -20,7 +20,7 @@ EXTRA_TI_TOOLS = " \
     ${@oe.utils.all_distro_features(d, "opencl openmp", "nativesdk-clacc")} \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
-    nativesdk-gcc-arm-none-eabi \
+    nativesdk-gcc-arm-baremetal \
     ${@oe.utils.all_distro_features(d, "opencl opencv", "${TIDL_TOOLS}")} \
 "
 
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
index ee4d7f2..5bf1e56 100644
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Bare-metal build of a subset of LLVM 3.6 with support for TI C66x"
 HOMEPAGE = "http://git.ti.com/opencl/llvm"
-DESCRIPTION = "A subset of LLVM 3.6 libraries built using gcc-arm-none-eabi-native. Used in the OpenCL running over a TI-RTOS based host."
+DESCRIPTION = "A subset of LLVM 3.6 libraries built using gcc-arm-baremetal-native. Used in the OpenCL running over a TI-RTOS based host."
 
 # 3-clause BSD-like
 # University of Illinois/NCSA Open Source License
@@ -12,7 +12,7 @@ require recipes-ti/includes/arago-paths.inc
 
 PR = "${INC_PR}.0"
 
-DEPENDS = "gcc-arm-none-eabi-native cmake-native"
+DEPENDS = "gcc-arm-baremetal-native cmake-native"
 
 COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
index 15ac0af..71685ba 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-examples-rtos_git.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl-rtos ti-cgt6x-native clocl-rtos-native opencl-monitor-rtos \
-           clocl-win gcc-arm-none-eabi-native ti-xdctools-native ti-sysbios \
+           clocl-win gcc-arm-baremetal-native ti-xdctools-native ti-sysbios \
 "
 
 S = "${WORKDIR}/git/opencl_example_src"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index 637b427..6b96eb4 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -18,7 +18,7 @@ DEPENDS = " ti-llvm3.6-native \
             ti-framework-components \
             libaet \
             openmp-rtos \
-            gcc-arm-none-eabi-native \
+            gcc-arm-baremetal-native \
 "
 
 COMPATIBLE_MACHINE = "omap-a15"
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index fd7e53c..5e179ec 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -16,7 +16,7 @@ PACKAGES += " ${PN}-runtime"
 DEPENDS = "cmake-native \
            llvm-rtos \
            libloki \
-           gcc-arm-none-eabi-native \
+           gcc-arm-baremetal-native \
            ti-sysbios \
            ti-xdctools-native \
            ti-ipc-rtos  \
-- 
2.7.4


