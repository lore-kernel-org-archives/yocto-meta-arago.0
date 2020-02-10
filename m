Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 51DAD5298B
	for <meta-arago@arago-project.org>;
	Mon, 10 Feb 2020 21:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D24A440C2E;
	Mon, 10 Feb 2020 21:32:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KK6nhx0BtDEC; Mon, 10 Feb 2020 21:32:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 562E840C18;
	Mon, 10 Feb 2020 21:32:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EF4121743F1;
	Mon, 10 Feb 2020 16:32:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Feb 2020 16:32:02 -0500
Message-Id: <1581370322-26833-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581370322-26833-1-git-send-email-denis@denix.org>
References: <1581370322-26833-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/2] Revert "packagegroup-*-addons: disable uio, as module won't build againsnt K5.4"
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
X-List-Received-Date: Mon, 10 Feb 2020 21:34:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit b34d559fdb547a9c3ddf05bf2fcd107eb38086f7.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  8 ++++----
 .../packagegroup-arago-tisdk-addons.bb             | 24 +++++++++++-----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 701e4a8..90ce00e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -53,9 +53,9 @@ UTILS_append_am65xx = " \
 
 EXTRA_LIBS = ""
 
-# uio-module-drv-src
 EXTRA_LIBS_append_omap-a15 = " \
     cmem-mod-src \
+    uio-module-drv-src \
     big-data-ipc-demo-linux-src \
 "
 
@@ -64,22 +64,22 @@ EXTRA_LIBS_append_omap-a15 = " \
 #    gdbserverproxy-module-drv-src \
 #"
 
-# uio-module-drv-src
 EXTRA_LIBS_append_ti33x = " \
+    uio-module-drv-src \
 "
 
-# uio-module-drv-src
 EXTRA_LIBS_append_ti43x = " \
     cmem-mod-src \
+    uio-module-drv-src \
 "
 
 # Disable ipsecmgr due to libnl and xfrm conflict
 #    ipsecmgr-mod-src
 # Disable hplib-mod-srv due to K4.14 breakage
 #    hplib-mod-src
-# uio-module-drv-src
 EXTRA_LIBS_append_keystone = " \
     cmem-mod-src \
+    uio-module-drv-src \
 "
 
 #EXTRA_LIBS_append_k2hk = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a1b55ee..7cfa4c8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -41,32 +41,32 @@ UTILS_DSP = " \
 "
 
 # switch-config
-# uio-module-drv-test
-# uio-test-pruss
 UTILS_append_ti33x = " mmc-utils \
                        can-utils \
                        pru-icss \
                        pru-swuart-fw \
+                       uio-module-drv-test \
+                       uio-test-pruss \
 "
 
 # switch-config
-# uio-module-drv-test
-# uio-test-pruss
 UTILS_append_ti43x = " mmc-utils \
                        can-utils \
                        libdrm-omap \
                        pru-icss \
+                       uio-module-drv-test \
+                       uio-test-pruss \
 "
 
 # switch-config
-# uio-test-pruss
-# uio-module-drv-test
 UTILS_append_omap-a15 = " mmc-utils \
                           parted \
                           libdrm-omap \
                           stream-openmp \
                           pru-icss \
                           ti-ipc-rtos-fw \
+                          uio-test-pruss \
+                          uio-module-drv-test \
 "
 
 # switch-config
@@ -87,8 +87,8 @@ UTILS_append_dra7xx = " can-utils \
                         ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-example-apps','',d)} \
 "
 
-# uio-module-drv-test
 UTILS_append_keystone = " \
+    uio-module-drv-test \
     ti-ipc-rtos-fw \
 "
 
@@ -104,30 +104,30 @@ UTILS_append_k2e = " \
     ${UTILS_DSP} \
 "
 
-# uio-test-pruss
 UTILS_append_k2g = " \
     can-utils \
     pru-icss \
+    uio-test-pruss \
 "
 
 EXTRA_LIBS = ""
-# uio-module-drv
 EXTRA_LIBS_append_omap-a15 = " \
     cmem \
+    uio-module-drv \
 "
 
-# uio-module-drv
 EXTRA_LIBS_append_keystone = " \
     cmem \
+    uio-module-drv \
 "
 
-# uio-module-drv
 EXTRA_LIBS_append_ti43x = " \
     cmem \
+    uio-module-drv \
 "
 
-# uio-module-drv
 EXTRA_LIBS_append_ti33x = " \
+    uio-module-drv \
 "
 
 DEVTOOLS = " \
-- 
2.7.4


