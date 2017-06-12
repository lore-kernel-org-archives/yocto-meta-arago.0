Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 62C9E529EE
	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 18:45:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5CIjjSL022670
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 13:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497293145;
	bh=6bXFQeQWnlOjv8ZX4mmi7ygT0epcsM9OV9Y6UsqUt3c=;
	h=From:To:CC:Subject:Date;
	b=oaG27DPTU4TuVtA4dpjTn5LWja/AvNa9FhTpHM9F5hs2a+wybYsVLcnwMFjEWlOMX
	YKZXqQh/PHuarrK+bg0+L/CBd6JVgZ5+7VROoVPOWlBhWuMfuYOg5XkYyKvkyhxYXy
	CySWsRPYchmsWqexbq09jfTtgxV47lojRD5Crjnk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CIjj6h011375
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 13:45:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 13:45:44 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5CIjidu002119;	Mon, 12 Jun 2017 13:45:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Jun 2017 14:40:14 -0400
Message-ID: <1497292814-16678-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: use KERNEL_DEVICETREE from machine configuration
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
X-List-Received-Date: Mon, 12 Jun 2017 18:45:46 -0000
Content-Type: text/plain

* Remove the KERNEL_DEVICETREE lists now that they have been moved to
  the machine configuration.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb              | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 57f37ac..15c14aa 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r80"
+PR = "r81"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -184,17 +184,6 @@ UBOOT_LOADADDRESS ?= "0"
 
 KERNEL_BUILD_CMDS = "${@base_conditional('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am572x-idk-pru-excl-uio.dtb', '', d)}"
-KERNEL_DEVICETREE_k2hk = "keystone-k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
-KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
-KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
-
 DEFCONFIG = "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
 
 AMSDK_DEFCONFIG = "singlecore-omap2plus_defconfig"
-- 
2.7.4


