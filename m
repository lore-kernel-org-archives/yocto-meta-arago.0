Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B0801529C0
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JuaH1028011
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JuanA006514
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JuaqP019352;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh5-0004V2-HY; Tue, 03 Nov 2015 14:56:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:23 -0500
Message-ID: <1446580592-17255-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
References: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] ti-tisdk-makefile: Fixes and enhancements for keystone
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:38 -0000
Content-Type: text/plain

* Include u-boot and linux-dtb targets
* Do not included "common" targets related to the matrix-gui-browser
  - This includes matrix-gui-browser and refresh-screen

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 3791bf2..ce9e792 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -40,16 +40,22 @@ SRC_URI = "\
     file://Makefile_opencl-examples \
 "
 
-PR = "r54"
+PR = "r55"
+
+MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
+                        refresh-screen \
+                        ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
+"
+
+MAKEFILES_MATRIX_GUI_keystone = ""
+
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
                     arm-benchmarks \
                     am-sysinfo \
-                    matrix-gui-browser \
-                    refresh-screen \
-                    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
                     oprofile-example \
+                    ${MAKEFILES_MATRIX_GUI} \
 "
 MAKEFILES = ""
 
@@ -101,6 +107,10 @@ MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
 "
 
+MAKEFILES_append_keystone = " u-boot-spl \
+                              linux-dtbs \
+"
+
 # Use ARCH format expected by the makefile
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
@@ -131,6 +141,9 @@ KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dt
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra72-evm.dtb am57xx-beagle-x15.dtb am57xx-evm.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
+KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 DEFCONFIG = "tisdk_${MACHINE}_defconfig"
 
-- 
1.9.1


