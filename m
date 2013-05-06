Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 55FA852981
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:28:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LSYID024399
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LSY7P003515
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:28:34 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:28:34 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r46LSV9Y016143;
	Mon, 6 May 2013 16:28:32 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 May 2013 16:28:22 -0500
Message-ID: <1367875707-8579-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/6] ti-tisdk-makefile: Prepare for Linaro transition
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
X-List-Received-Date: Mon, 06 May 2013 21:28:35 -0000
Content-Type: text/plain

* Currently some of our example applications hard code certain values such as
  target architecture and softfp should be used.
* This is problematic since incorrect architecture results in optimizations
  being missed and changes in toolchains can break applications.
* Pull in some of these variables into Rules.make which insures the correct
  settings are used for each machine.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |    2 ++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index 2741769..a20c684 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -29,3 +29,5 @@ export ENV_SETUP=$(LINUX_DEVKIT_PATH)/environment-setup
 
 #The directory that points to the SDK kernel source tree
 LINUXKERNEL_INSTALL_DIR=$(TI_SDK_PATH)/board-support/__KERNEL_NAME__
+
+CFLAGS=__CFLAGS__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 74a4f14..0f14341 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "\
     file://Makefile_omapconf \
 "
 
-PR = "r11"
+PR = "r12"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -124,6 +124,7 @@ do_install () {
     sed -i -e "s/__ARCH__/${PLATFORM_ARCH}/" ${D}/Rules.make
     sed -i -e "s/__TOOLCHAIN_PREFIX__/${TOOLCHAIN_SYS}-/" ${D}/Rules.make
     sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
+    sed -i -e "s/__CFLAGS__/${TARGET_CC_ARCH}/" ${D}/Rules.make
 
 }
 
-- 
1.7.0.4


