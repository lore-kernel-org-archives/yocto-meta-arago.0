Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 75199529AF
	for <meta-arago@arago-project.org>;
	Tue, 21 Apr 2015 11:24:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3LBOtSl016701
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 06:24:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3LBOsAw013239
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 06:24:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 06:24:53 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3LBOrWM021677;
	Tue, 21 Apr 2015 06:24:53 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YkWIP-0000r4-FW;
	Tue, 21 Apr 2015 07:24:53 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Apr 2015 07:24:48 -0400
Message-ID: <1429615488-3256-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: cmem-mod: Fix makefile target to match fragment suffix.
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
X-List-Received-Date: Tue, 21 Apr 2015 11:24:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_cmem-mod            |   12 ++++++------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
index 321c6ec..1f89239 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
@@ -1,23 +1,23 @@
 # CMEM module
-cmem: linux
+cmem-mod: linux
 	@echo ================================
 	@echo     Building CMEM Module
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cmem*"`; \
+	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
 	make -f lu.mak ARCH=arm KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) module
 
-cmem_clean:
+cmem-mod_clean:
 	@echo ================================
 	@echo     Cleaning CMEM Module
 	@echo ================================
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cmem*"`; \
+	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
 	make -f lu.mak ARCH=arm KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) modules_clean
 
-cmem_install:
+cmem-mod_install:
 	@echo ================================
 	@echo     Installing CMEM Module
 	@echo ================================
@@ -27,7 +27,7 @@ cmem_install:
 		exit 1; \
 	fi
 	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -name "cmem*"`; \
+	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
 	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd`/src/cmem/module INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 8c7e54e..ab5dd0d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -38,7 +38,7 @@ SRC_URI = "\
     file://Makefile_cmem-mod \
 "
 
-PR = "r44"
+PR = "r45"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.9.5


