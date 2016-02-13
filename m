Return-Path: <anandb@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7F3D4529C2
	for <meta-arago@arago-project.org>;
	Sat, 13 Feb 2016 14:33:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1DEXrDu005653
	for <meta-arago@arago-project.org>; Sat, 13 Feb 2016 08:33:53 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1DEXrbD026825
	for <meta-arago@arago-project.org>; Sat, 13 Feb 2016 08:33:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 13 Feb 2016 08:33:53 -0600
Received: from uda0876520.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1DEXpi3027591;	Sat, 13 Feb 2016 08:33:52 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 13 Feb 2016 20:05:36 +0530
Message-ID: <1455374137-15885-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] ti-tisdk-makefile: update omapdrm fragment for DDK v1.14
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
X-List-Received-Date: Sat, 13 Feb 2016 14:33:54 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
index 4ad790a..9f50900 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
@@ -5,7 +5,7 @@ omapdrm-pvr: linux
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/__PLATFORM_OMAPDRM___linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) PVR_NULLDRM=__PVR_NULLDRM__
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
 
 omapdrm-pvr_clean:
 	@echo ================================
@@ -13,7 +13,7 @@ omapdrm-pvr_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/__PLATFORM_OMAPDRM___linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 omapdrm-pvr_install:
 	@echo ================================
@@ -21,6 +21,6 @@ omapdrm-pvr_install:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
-	cd ./eurasia_km/eurasiacon/binary2___PLATFORM_OMAPDRM___linux_release/target/kbuild; \
+	cd ./eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild; \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
-- 
1.9.1


