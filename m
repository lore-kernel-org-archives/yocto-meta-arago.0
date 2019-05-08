Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 62BF952A05
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2019 01:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 11A2B40BA7;
	Wed,  8 May 2019 01:58:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qmQb9yaey9jx; Wed,  8 May 2019 01:58:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB0F5407DA;
	Wed,  8 May 2019 01:58:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3317216E8CC;
	Tue,  7 May 2019 21:58:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 May 2019 21:58:12 -0400
Message-Id: <1557280692-49213-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] packagegroup, tisdk-makefile: disable debugss and gdbserverproxy modules
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
X-List-Received-Date: Wed, 08 May 2019 01:58:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    | 32 +++++++++++-----------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 16 +++++------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index e2de61a..f74e357 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -48,10 +48,10 @@ EXTRA_LIBS_append_omap-a15 = " \
     big-data-ipc-demo-linux-src \
 "
 
-EXTRA_LIBS_append_dra7xx = " \
-    debugss-module-drv-src \
-    gdbserverproxy-module-drv-src \
-"
+#EXTRA_LIBS_append_dra7xx = " \
+#    debugss-module-drv-src \
+#    gdbserverproxy-module-drv-src \
+#"
 
 EXTRA_LIBS_append_ti33x = " \
     uio-module-drv-src \
@@ -71,20 +71,20 @@ EXTRA_LIBS_append_keystone = " \
     uio-module-drv-src \
 "
 
-EXTRA_LIBS_append_k2hk = " \
-    debugss-module-drv-src \
-    gdbserverproxy-module-drv-src \
-"
+#EXTRA_LIBS_append_k2hk = " \
+#    debugss-module-drv-src \
+#    gdbserverproxy-module-drv-src \
+#"
 
-EXTRA_LIBS_append_k2l = " \
-    debugss-module-drv-src \
-    gdbserverproxy-module-drv-src \
-"
+#EXTRA_LIBS_append_k2l = " \
+#    debugss-module-drv-src \
+#    gdbserverproxy-module-drv-src \
+#"
 
-EXTRA_LIBS_append_k2e = " \
-    debugss-module-drv-src \
-    gdbserverproxy-module-drv-src \
-"
+#EXTRA_LIBS_append_k2e = " \
+#    debugss-module-drv-src \
+#    gdbserverproxy-module-drv-src \
+#"
 
 RDEPENDS_${PN} = "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 26490db..7f6f3c8 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -112,9 +112,9 @@ MAKEFILES_append_ti43x = " u-boot-spl \
 			   mmwavegesture-hmi \
 "
 
+#                            debugss-module-drv 
+#                            gdbserverproxy-module-drv 
 MAKEFILES_append_dra7xx = " cryptodev \
-                            debugss-module-drv \
-                            gdbserverproxy-module-drv \
                             opencl-examples \
                             openmpacc-examples \
                             qt-opencv-opencl-opengl-multithreaded \
@@ -149,22 +149,22 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               barcode-roi \
 "
 
+#                              gdbserverproxy-module-drv 
+#                              debugss-module-drv 
 MAKEFILES_append_k2hk = " opencl-examples \
-                              gdbserverproxy-module-drv \
-                              debugss-module-drv \
                               openmpacc-examples \
                               linalg-examples \
 "
 
+#                             gdbserverproxy-module-drv 
+#                             debugss-module-drv 
 MAKEFILES_append_k2l = " opencl-examples \
-                             gdbserverproxy-module-drv \
-                             debugss-module-drv \
                              openmpacc-examples \
 "
 
+#                             gdbserverproxy-module-drv 
+#                             debugss-module-drv 
 MAKEFILES_append_k2e = " opencl-examples \
-                             gdbserverproxy-module-drv \
-                             debugss-module-drv \
                              openmpacc-examples \
 "
 
-- 
2.7.4


