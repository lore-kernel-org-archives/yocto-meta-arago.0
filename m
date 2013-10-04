Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3DBF15296F
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 22:54:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94Ms1VX009653
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 17:54:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94Ms18K026362
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 17:54:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 4 Oct 2013 17:54:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94MroGU012407;
	Fri, 4 Oct 2013 17:53:59 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Oct 2013 18:39:56 -0500
Message-ID: <1380929996-30089-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1380929996-30089-1-git-send-email-fcooper@ti.com>
References: <1380929996-30089-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] ti-tisdk-makefile: Pass in LOADADDR for Linux kernel
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
X-List-Received-Date: Fri, 04 Oct 2013 22:54:02 -0000
Content-Type: text/plain

* Newer versions of the kernel now require a LOADADDR to be set when building
  uImage.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_linux               |    2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 4a13f48..43e22f2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -4,7 +4,7 @@ linux:
 	@echo     Building the Linux Kernel
 	@echo =================================
 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) uImage
+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) LOADADDR=__LOAD_ADDRESS__ uImage
 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
 
 linux_install:
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a1faffd..c9ec899 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r15"
+PR = "r16"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -119,6 +119,8 @@ do_install () {
         sed -i -e "s/__INSTALL_TARGETS__/$install_targets/" ${D}/Makefile
     fi
 
+    sed -i -e "s/__LOAD_ADDRESS__/${UBOOT_LOADADDRESS}/" ${D}/Makefile
+
     install  ${WORKDIR}/Rules.make ${D}/Rules.make
 
     # fixup Rules.make values
-- 
1.7.0.4


