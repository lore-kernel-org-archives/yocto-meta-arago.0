Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 445EE529C2
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 19:54:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RJsWjv022467
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWMp012376
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 13:54:32 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RJsWna017718;
	Wed, 27 Jan 2016 13:54:32 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aOWAi-0007F8-1E; Wed, 27 Jan 2016 14:54:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jan 2016 14:54:27 -0500
Message-ID: <1453924469-27790-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
References: <1453924469-27790-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] ti-tisdk-makefile: Add OpenCL and related targets for keystone
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
X-List-Received-Date: Wed, 27 Jan 2016 19:54:33 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 1988b8b..bccb22d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -44,7 +44,7 @@ SRC_URI = "\
     file://Makefile_pru-icss \
 "
 
-PR = "r62"
+PR = "r63"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -123,6 +123,21 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               uio-module-drv \
 "
 
+MAKEFILES_append_k2hk-evm = " opencl-examples \
+                              gdbserverproxy-module-drv \
+                              debugss-module-drv \
+"
+
+MAKEFILES_append_k2l-evm = " opencl-examples \
+                             gdbserverproxy-module-drv \
+                             debugss-module-drv \
+"
+
+MAKEFILES_append_k2e-evm = " opencl-examples \
+                             gdbserverproxy-module-drv \
+                             debugss-module-drv \
+"
+
 # Use ARCH format expected by the makefile
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
@@ -139,9 +154,11 @@ PVR_NULLDRM_omap-a15 = "0"
 
 PLATFORM_DEBUGSS = ""
 PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
+PLATFORM_DEBUGSS_keystone = "KEYSTONE_PLATFORM"
 
 PLATFORM_GDBSERVERPROXY = ""
 PLATFORM_GDBSERVERPROXY_dra7xx = "DRA7xx_PLATFORM"
+PLATFORM_GDBSERVERPROXY_keystone = "KEYSTONE_PLATFORM"
 
 PRU_ICSS_INSTALL_TARGET = "pru-icss_install_none"
 PRU_ICSS_INSTALL_TARGET_ti33x = "pru-icss_install_am335x"
-- 
1.9.1


