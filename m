Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id D01045296D
	for <meta-arago@arago-project.org>;
	Fri,  8 Apr 2016 21:41:00 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5C00AN0475IJ20@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Apr 2016 16:40:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=P6QGjI3FBNviG28g3tIA:9
Received: by 100.15.86.14 with SMTP id 686fd303; Fri, 08 Apr 2016 21:40:30 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 087DF161F54;	Fri,
	8 Apr 2016 17:40:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Apr 2016 17:40:15 -0400
Message-id: <1460151615-14010-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: recipes: disable cmem due to breakage
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
X-List-Received-Date: Fri, 08 Apr 2016 21:41:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

src/cmem/module/cmemk.c:920:12: error: void value not ignored as it ought to be

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb     | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb    | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 +++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 4 ++--
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 2fc335e..3f94c0e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -81,6 +81,8 @@ ARAGO_SECURE_STORAGE = "\
     engine-pkcs11 \
     "
 
+#    cmem-mod
+#    cmem
 ARAGO_TI_KEYSTONE_PKGS = "\
     ${ARAGO_SECURE_STORAGE} \
     uio-module-drv \
@@ -91,8 +93,6 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     cuia \
     edma3-lld \
     srss-tc \
-    cmem \
-    cmem-mod \
     ti-ipc \
     mpm-transport \
     multiprocmgr \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 35d9c96..f61714f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -14,9 +14,9 @@ TEST_ADDONS = " \
     strongswan \
     "
 
-TEST_ADDONS_TI = " \
-    cmem-test \
-    "
+#TEST_ADDONS_TI = " \
+#    cmem-test \
+#    "
 
 TEST_ADDONS_TI_append_keystone = " \
     mpm-transport-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 46e9271..c39e54b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -54,8 +54,8 @@ UTILS_append_k2e-evm = " \
 
 EXTRA_LIBS = ""
 
+#    cmem-mod-src
 EXTRA_LIBS_append_omap-a15 = " \
-    cmem-mod-src \
     pru-icss-src \
 "
 
@@ -64,8 +64,8 @@ EXTRA_LIBS_append_dra7xx = " \
     gdbserverproxy-module-drv-src \
 "
 
+#    cmem-mod-src
 EXTRA_LIBS_append_keystone = " \
-    cmem-mod-src \
     uio-module-drv-src \
     hplib-mod-src \
     ipsecmgr-mod-src \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index a5b4828..58c75be 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -28,10 +28,10 @@ TI_SECURE_STORAGE_DEV = "\
 	libp11-staticdev \
 	"
 
+#	cmem-dev
+#	cmem-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
-	cmem-dev \
-	cmem-staticdev \
 	udma-dev \
 	udma-staticdev \
 	traceframework-dev \
@@ -141,7 +141,7 @@ UTILS_append_k2e-evm = " \
 UTILS_append_k2g-evm = " canutils-dev"
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem-dev"
+#EXTRA_LIBS_append_omap-a15 = " cmem-dev"
 EXTRA_LIBS_append_dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 517f6a6..55def38 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -90,7 +90,7 @@ UTILS_append_k2e-evm = " \
 UTILS_append_k2g-evm = " canutils"
 
 EXTRA_LIBS = ""
-EXTRA_LIBS_append_omap-a15 = " cmem"
+#EXTRA_LIBS_append_omap-a15 = " cmem"
 
 DEVTOOLS = " \
     packagegroup-core-buildessential \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f7871b3..5e0ae41 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -107,11 +107,11 @@ MAKEFILES_append_dra7xx = " cryptodev \
                             qt-opencv-opencl-opengl-multithreaded \
 "
 
+#                              cmem-mod
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
                               omapconf \
                               linux-dtbs \
-                              cmem-mod \
                               omapdrm-pvr \
                               pru-icss \
 "
@@ -119,10 +119,10 @@ MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
 "
 
+#                              cmem-mod
 MAKEFILES_append_keystone = " u-boot-spl \
                               linux-dtbs \
                               boot-monitor \
-                              cmem-mod \
                               cryptodev \
                               ti-crypto-examples \
                               hplib-mod \
-- 
2.2.0


