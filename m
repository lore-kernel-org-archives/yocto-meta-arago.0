Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5F1A852090
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 22:31:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UMVjx1009282
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:45 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UMViuJ006941
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 16:31:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 16:31:43 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UMVh9e017926;	Fri, 30 Jan 2015 16:31:44 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0UMVf1m007326;	Sat, 31 Jan 2015 04:01:42 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 16:31:34 -0600
Message-ID: <1422657099-15544-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/6] ti-tisdk-makefile: Allow the defconfig name to be customized
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
X-List-Received-Date: Fri, 30 Jan 2015 22:31:46 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Sitara-linux-ti-staging_3.14 used with the AMSDK branding doesn't use the
  tisdk defconfig.
* Therefore,  change the tisdk-makefiles to use the "right" defconfig.
* For other brandings the same tisdk_${MACHINE}_defconfig will be used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_linux               |    2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |    3 +++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    9 ++++++++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 07d56b1..145e27c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -3,7 +3,7 @@ linux: __DTB_DEPEND__
 	@echo =================================
 	@echo     Building the Linux Kernel
 	@echo =================================
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index b2dbf64..9070781 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -1,6 +1,9 @@
 #platform
 PLATFORM=__PLATFORM__
 
+#defconfig
+DEFCONFIG=__DEFCONFIG__
+
 #Architecture
 ARCH=__ARCH__
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e371307..ce6e557 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,7 @@ SRC_URI = "\
     file://Makefile_cryptodev \
 "
 
-PR = "r36"
+PR = "r37"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -101,6 +101,12 @@ KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
 KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
 KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb dra72-evm.dtb am57xx-beagle-x15.dtb"
 
+DEFCONFIG = "tisdk_${MACHINE}_defconfig"
+
+AMSDK_DEFCONFIG = "singlecore-omap2plus_defconfig"
+
+DEFCONFIG := "${@base_conditional('ARAGO_BRAND','core','${DEFCONFIG}','${AMSDK_DEFCONFIG}',d)}"
+
 # This step will stitch together the final Makefile based on the supported
 # make targets.
 do_install () {
@@ -159,6 +165,7 @@ do_install () {
 
     # fixup Rules.make values
     sed -i -e "s/__PLATFORM__/${MACHINE}/" ${D}/Rules.make
+    sed -i -e "s/__DEFCONFIG__/${DEFCONFIG}/" ${D}/Rules.make
     sed -i -e "s/__ARCH__/${PLATFORM_ARCH}/" ${D}/Rules.make
     sed -i -e "s/__TOOLCHAIN_PREFIX__/${TOOLCHAIN_SYS}-/" ${D}/Rules.make
     sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
-- 
1.7.9.5


