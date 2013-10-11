Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B81A3529CC
	for <meta-arago@arago-project.org>;
	Fri, 11 Oct 2013 15:28:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9BFSGO3020473
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:28:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFSGFI006937
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:28:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 11 Oct 2013 10:28:16 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFS8ru014685;
	Fri, 11 Oct 2013 10:28:14 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Oct 2013 11:16:26 -0500
Message-ID: <1381508186-30546-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1381508186-30546-1-git-send-email-fcooper@ti.com>
References: <1381508186-30546-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCHv2 4/4] ti-tisdk-makefile: Pass in LOADADDR for Linux kernel
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
X-List-Received-Date: Fri, 11 Oct 2013 15:28:18 -0000
Content-Type: text/plain

* Newer versions of the kernel now require a LOADADDR to be set when building
  uImage.
* Depending on the KERNEL_IMAGETYPE used allow support for zImages.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Support both uImage and zImage

 .../ti-tisdk-makefile/Makefile_linux               |    2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 4a13f48..c53ee29 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -4,7 +4,7 @@ linux:
 	@echo     Building the Linux Kernel
 	@echo =================================
 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) uImage
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
 
 linux_install:
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a1faffd..58b8dfa 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r15"
+PR = "r16"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -80,6 +80,8 @@ MAKEFILES_append_am180x-evm = " pru \
 PLATFORM_ARCH = "armv7-a"
 PLATFORM_ARCH_omapl138 = "armv5te"
 
+KERNEL_BUILD_CMDS = "${@base_contains('KERNEL_IMAGETYPE','uImage','LOADADDR=${UBOOT_LOADADDRESS} uImage','zImage',d)}"
+
 # This step will stitch together the final Makefile based on the supported
 # make targets.
 do_install () {
@@ -119,6 +121,8 @@ do_install () {
         sed -i -e "s/__INSTALL_TARGETS__/$install_targets/" ${D}/Makefile
     fi
 
+    sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
+
     install  ${WORKDIR}/Rules.make ${D}/Rules.make
 
     # fixup Rules.make values
-- 
1.7.0.4


