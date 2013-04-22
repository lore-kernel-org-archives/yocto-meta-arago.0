Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 677C352A3E
	for <meta-arago@arago-project.org>;
	Mon, 22 Apr 2013 17:27:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MHRJ1h010785
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MHRJQV030121
	for <meta-arago@arago-project.org>; Mon, 22 Apr 2013 12:27:19 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 12:27:18 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MHRGHA016775;
	Mon, 22 Apr 2013 12:27:17 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Apr 2013 12:27:10 -0500
Message-ID: <1366651633-27986-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] recipes: Fix append += syntax
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
X-List-Received-Date: Mon, 22 Apr 2013 17:27:21 -0000
Content-Type: text/plain

* For these recipes I used the incorrect += or append syntax.
* Correct the syntax to insure the proper logic.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    6 ++--
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   38 ++++++++++---------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index d8846f3..7c237d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -13,8 +13,8 @@ KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
 
 TOOLS = "pinmux-utility"
 TOOLS_omap-a15 = ""
-TOOLS_am37x-evm_append = " flash-utility"
-TOOLS_am3517-evm_append = " flash-utility"
+TOOLS_append_am37x-evm = " flash-utility"
+TOOLS_append_am3517-evm = " flash-utility"
 
 README = ""
 README_omap-a15 = "tisdk-readme"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index da2003f..49963f6 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "\
     file://Makefile_omapconf \
 "
 
-PR = "r9"
+PR = "r10"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -43,33 +43,35 @@ MAKEFILES_COMMON = "linux \
                     refresh-screen \
                     qt-tstat \
 "
+MAKEFILES = ""
 
 # This example application should not be used when using non-SGX
 QUICK_PLAYGROUND = "${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','quick-playground','', d)}"
 
 # Add device specific make targets
-MAKEFILES_omap3 += "u-boot-spl \
-                    ${QUICK_PLAYGROUND} \
+
+MAKEFILES_append_omap3 = " u-boot-spl \
+                           ${QUICK_PLAYGROUND} \
 "
-MAKEFILES_am37x-evm += "av-examples \
-                        ti-ocf-crypto-module \
-                        wireless \
+MAKEFILES_append_am37x-evm = " av-examples \
+                               ti-ocf-crypto-module \
+                               wireless \
 "
-MAKEFILES_am3517-evm += "av-examples \
-                         ti-ocf-crypto-module \
+MAKEFILES_append_am3517-evm = " av-examples \
+                                ti-ocf-crypto-module \
 "
-MAKEFILES_ti33x += "u-boot-spl \
-                    ${QUICK_PLAYGROUND} \
-                    wireless \
+MAKEFILES_append_ti33x = " u-boot-spl \
+                           ${QUICK_PLAYGROUND} \                    
+                           wireless \
 "
-MAKEFILES_omap-a15 += "u-boot-spl \
-                    ${QUICK_PLAYGROUND} \
-                    omapconf \
-                    linux-dtbs \
+MAKEFILES_append_omap-a15 = " u-boot-spl \
+                              ${QUICK_PLAYGROUND} \
+                              omapconf \
+                              linux-dtbs \
 "
-MAKEFILES_am180x-evm += "pru \
-                         u-boot-legacy \
-                         wireless \
+MAKEFILES_append_am180x-evm = " pru \
+                                u-boot-legacy \
+                                wireless \
 "
 
 PLATFORM_ARCH = "${ARMPKGARCH}"
-- 
1.7.0.4


