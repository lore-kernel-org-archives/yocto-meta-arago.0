Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 51F17529CC
	for <meta-arago@arago-project.org>;
	Fri, 11 Oct 2013 15:28:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9BFSBLQ011395
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:28:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFSBDK006867
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:28:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 11 Oct 2013 10:28:11 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFS8rs014685;
	Fri, 11 Oct 2013 10:28:09 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Oct 2013 11:16:24 -0500
Message-ID: <1381508186-30546-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCHv2 2/4] ti-tisdk-makefile: Speed up building of kernel and u-boot
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
X-List-Received-Date: Fri, 11 Oct 2013 15:28:12 -0000
Content-Type: text/plain

* Introduce a new variable MAKE_JOBS that will be used with make's -j option to
  speed up the build of the kernel and u-boot.
* Provide a default value of 1 that can be overridden.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Provide a default value for MAKE_JOBS

 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile   |    2 ++
 .../ti-tisdk-makefile/Makefile_linux               |    4 ++--
 .../ti-tisdk-makefile/Makefile_linux-dtbs          |    2 +-
 .../ti-tisdk-makefile/Makefile_u-boot-legacy       |    4 ++--
 .../ti-tisdk-makefile/Makefile_u-boot-spl          |    4 ++--
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
index cab8942..66449d4 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
@@ -1,5 +1,7 @@
 -include Rules.make
 
+MAKE_JOBS ?= 1
+
 all: __ALL_TARGETS__
 clean: __CLEAN_TARGETS__
 install: __INSTALL_TARGETS__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 457bd24..4a13f48 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -4,8 +4,8 @@ linux:
 	@echo     Building the Linux Kernel
 	@echo =================================
 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) uImage
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) uImage
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
 
 linux_install:
 	@echo ===================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
index b195730..5093649 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -3,7 +3,7 @@ linux-dtbs:
 	@echo =====================================
 	@echo     Building the Linux Kernel DTBs
 	@echo =====================================
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) dtbs
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) dtbs
 
 linux-dtbs_install:
 	@echo =======================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
index 70640e2..028644d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
@@ -4,8 +4,8 @@ u-boot-legacy_clean: u-boot_clean
 u-boot-legacy_install: u-boot_install
 
 u-boot:
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
 
 u-boot_clean:
 	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) clean
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
index 566647c..9ce6429 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
@@ -4,8 +4,8 @@ u-boot-spl_clean: u-boot_clean
 u-boot-spl_install: u-boot_install
 
 u-boot:
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
+	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
 
 u-boot_clean:
 	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) clean
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 74a93c6..a1faffd 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r14"
+PR = "r15"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


