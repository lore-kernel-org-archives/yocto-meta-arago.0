Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 44AF552A76
	for <meta-arago@arago-project.org>;
	Wed,  8 Feb 2017 21:19:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v18LJfg4007750
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 15:19:41 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18LJaBb011177
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 15:19:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 15:19:36 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v18LJaJw001784;	Wed, 8 Feb 2017 15:19:36 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Feb 2017 16:19:34 -0500
Message-ID: <1486588774-19571-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH v2] ti-tisdk-makefile: add am572x-idk-pru-excl-uio.dtb to linux-dtbs
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
X-List-Received-Date: Wed, 08 Feb 2017 21:19:52 -0000
Content-Type: text/plain

* This addition is conditional with ENABLE_TI_UIO_DEVICES

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
V2 changes:
Make the addition of am572x-idk-pru-excl-uio.dtb conditional with ENABLE_TI_UIO_DEVICES

 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 8cc0758..7e01619 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r77"
+PR = "r78"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -188,7 +188,7 @@ KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hd
 KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb"
+KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am572x-idk-pru-excl-uio.dtb', '', d)}"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
-- 
1.9.1


