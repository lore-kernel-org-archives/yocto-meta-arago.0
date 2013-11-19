Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 754475299E
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 18:01:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJI19Yd026468
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 12:01:09 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJI19dv023212
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 12:01:09 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 19 Nov 2013 12:01:09 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJI0wlF010497;
	Tue, 19 Nov 2013 12:01:08 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Nov 2013 13:02:05 -0600
Message-ID: <1384887728-8628-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1384887728-8628-1-git-send-email-fcooper@ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/7] ti-tisdk-makefile: Add DTB support for AM43x and AM335x
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
X-List-Received-Date: Tue, 19 Nov 2013 18:01:10 -0000
Content-Type: text/plain

* Add support to build DTB files for AM43x and AM335x
* Add a target dependency to force dtb files to be built and installed when make
  linux/linux_install are ran.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_linux               |    4 +-
 .../ti-tisdk-makefile/Makefile_linux-dtbs          |    2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   23 +++++++++++++++++++-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index c53ee29..f4dc75f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -1,5 +1,5 @@
 # Kernel build targets
-linux:
+linux: __DTB_DEPEND__
 	@echo =================================
 	@echo     Building the Linux Kernel
 	@echo =================================
@@ -7,7 +7,7 @@ linux:
 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
 
-linux_install:
+linux_install: __DTB_DEPEND_INSTALL__
 	@echo ===================================
 	@echo     Installing the Linux Kernel
 	@echo ===================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
index 5093649..168d1ad 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -3,7 +3,7 @@ linux-dtbs:
 	@echo =====================================
 	@echo     Building the Linux Kernel DTBs
 	@echo =====================================
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) dtbs
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_DEVICETREE__
 
 linux-dtbs_install:
 	@echo =======================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 13d3f38..16f7662 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r17"
+PR = "r18"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -65,10 +65,12 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
                            wireless \
                            ti-crypto-examples \
+                           linux-dtbs \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
                            ti-crypto-examples \
+                           linux-dtbs \
 "
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
@@ -86,6 +88,12 @@ PLATFORM_ARCH_omapl138 = "armv5te"
 
 KERNEL_BUILD_CMDS = "${@base_contains('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
 
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+
 # This step will stitch together the final Makefile based on the supported
 # make targets.
 do_install () {
@@ -127,6 +135,19 @@ do_install () {
 
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
 
+    cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
+
+    if [ "$?" == "0" ]
+    then
+        sed -i -e "s/__KERNEL_DEVICETREE__/${KERNEL_DEVICETREE}/" ${D}/Makefile
+        sed -i -e "s/__DTB_DEPEND__/linux-dtbs/" ${D}/Makefile
+        sed -i -e "s/__DTB_DEPEND_INSTALL__/linux-dtbs_install/" ${D}/Makefile
+    else
+        sed -i -e "s/__DTB_DEPEND__//" ${D}/Makefile
+        sed -i -e "s/__DTB_DEPEND_INSTALL__//" ${D}/Makefile
+    fi
+
+
     install  ${WORKDIR}/Rules.make ${D}/Rules.make
 
     # fixup Rules.make values
-- 
1.7.0.4


