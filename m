Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2A003529CF
	for <meta-arago@arago-project.org>;
	Sat, 16 Dec 2017 18:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A493C209AE;
	Sat, 16 Dec 2017 18:09:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id t_333bxZZTju; Sat, 16 Dec 2017 18:09:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D58D201FD;
	Sat, 16 Dec 2017 18:09:34 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 09BD01631EF;
	Sat, 16 Dec 2017 13:09:34 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat, 16 Dec 2017 13:09:33 -0500
Message-Id: <1513447773-21409-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: "Mertz, Timothy" <timothy.mertz@garmin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [morty][PATCH] recipes: update for ti-xdctools-native change in meta-ti
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
X-List-Received-Date: Sat, 16 Dec 2017 18:09:38 -0000

Cc: "Mertz, Timothy" <timothy.mertz@garmin.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb       | 2 +-
 meta-arago-extras/recipes-ti/libarch/libarch.inc                        | 2 +-
 meta-arago-extras/recipes-ti/linalg/linalg.inc                          | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb        | 2 +-
 meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb                | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb                 | 2 +-
 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb                  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
index 8f7820b..858dc2d 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
@@ -4,7 +4,7 @@ require recipes-ti/includes/ti-paths.inc
 require big-data-ipc-demo.inc
 
 DEPENDS = "ti-ipc \
-           ti-xdctools \
+           ti-xdctools-native \
            ti-sysbios \
            ti-ipc-rtos \
            cmem \
diff --git a/meta-arago-extras/recipes-ti/libarch/libarch.inc b/meta-arago-extras/recipes-ti/libarch/libarch.inc
index 5575f95..a21333b 100644
--- a/meta-arago-extras/recipes-ti/libarch/libarch.inc
+++ b/meta-arago-extras/recipes-ti/libarch/libarch.inc
@@ -17,7 +17,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "common-csl-ip-rtos ti-xdctools ti-sysbios ti-cgt6x-native ti-xdais ti-framework-components opencl opencl-monitor doxygen-native zip-native"
+DEPENDS = "common-csl-ip-rtos ti-xdctools-native ti-sysbios ti-cgt6x-native ti-xdais ti-framework-components opencl opencl-monitor doxygen-native zip-native"
 
 export CGTROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index c60387e..60a9b4b 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -22,7 +22,7 @@ SRCREV = "01960b319783b29aacf12b2a72606b28d657b78e"
 DEPENDS = " \
 	common-csl-ip \
 	libarch \
-	ti-xdctools \
+	ti-xdctools-native \
 	ti-ipc-rtos \
 	ti-sysbios \
 	ti-cgt6x-native \
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
index b6f21aa..8add3ef 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-monitor-rtos_git.bb
@@ -11,7 +11,7 @@ inherit cmake
 
 DEPENDS = " ti-llvm3.6-native \
             common-csl-ip-rtos \
-            ti-xdctools \
+            ti-xdctools-native \
             ti-ipc-rtos \
             ti-sysbios \
             ti-cgt6x-native \
diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index 41b6653..40f3f98 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -18,7 +18,7 @@ DEPENDS = "cmake-native \
            libloki \
            gcc-arm-none-eabi-native \
            ti-sysbios \
-           ti-xdctools \
+           ti-xdctools-native \
            ti-ipc-rtos  \
            opencl-monitor-rtos  \
            clocl-rtos-native  \
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index 0f769f4..9f39edc 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "opencl ti-cgt6x-native clocl-native"
 
-OCL_PERSISTENT_DEPENDS = "ti-xdctools ti-ipc-rtos ti-sysbios"
+OCL_PERSISTENT_DEPENDS = "ti-xdctools-native ti-ipc-rtos ti-sysbios"
 
 DEPENDS_append_dra7xx = " ${OCL_PERSISTENT_DEPENDS}"
 
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
index 44050f1..42a257d 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
@@ -11,7 +11,7 @@ inherit cmake update-alternatives
 
 DEPENDS = " ti-llvm3.6-native \
             common-csl-ip-rtos \
-            ti-xdctools \
+            ti-xdctools-native \
             ti-ipc-rtos \
             ti-sysbios \
             ti-cgt6x-native \
-- 
2.7.4


