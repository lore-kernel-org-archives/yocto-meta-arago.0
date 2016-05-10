Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 37A315299C
	for <meta-arago@arago-project.org>;
	Tue, 10 May 2016 13:50:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4ADoI4h031660
	for <meta-arago@arago-project.org>; Tue, 10 May 2016 08:50:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4ADoIJq024715
	for <meta-arago@arago-project.org>; Tue, 10 May 2016 08:50:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 May 2016 08:50:17 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4ADoH9G021322;	Tue, 10 May 2016 08:50:17 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 May 2016 09:50:10 -0400
Message-ID: <1462888210-16137-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: update DTB lists for 4.4 kernel
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
X-List-Received-Date: Tue, 10 May 2016 13:50:19 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 3ec6989..9184568 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -48,7 +48,7 @@ SRC_URI = "\
     file://Makefile_linalg-examples \
 "
 
-PR = "r71"
+PR = "r72"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -176,15 +176,16 @@ UBOOT_LOADADDRESS ?= "0"
 
 KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm-hdmi.dtb am437x-idk-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra72-evm.dtb am57xx-beagle-x15.dtb am57xx-evm.dtb am572x-idk.dtb am571x-idk.dtb am572x-idk-lcd-osd.dtb am571x-idk-lcd-osd.dtb am57xx-beagle-x15-es2plus.dtb am57xx-evm-es2plus.dtb"
-KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
-KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
-KERNEL_DEVICETREE_k2g-evm = "k2g-evm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
+KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
+KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
+KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
 DEFCONFIG = "tisdk_${MACHINE}_defconfig"
 
-- 
2.7.4


