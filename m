Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 07DFD52A0A
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 21:57:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27LvK0s024234
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 15:57:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27LvKhC019299
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 15:57:20 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 15:57:19 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27Lv98d006131;
	Fri, 7 Mar 2014 15:57:18 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Mar 2014 15:57:06 -0600
Message-ID: <1394229426-12753-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1394229426-12753-1-git-send-email-fcooper@ti.com>
References: <1394229426-12753-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] ti-tisdk-makefile: Add Makefile stub for cryptodev
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
X-List-Received-Date: Fri, 07 Mar 2014 21:57:21 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_cryptodev           |   28 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    8 +++++-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
new file mode 100644
index 0000000..c05dc66
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
@@ -0,0 +1,28 @@
+cryptodev: linux
+	@echo ================================
+	@echo      Building cryptodev-linux
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "cryptodev*"`; \
+	make ARCH=arm KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)
+
+cryptodev_clean:
+	@echo ================================
+	@echo      Cleaning cryptodev-linux
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "cryptodev*"`; \
+	make clean
+
+cryptodev_install:
+	@echo ================================
+	@echo      Installing cryptodev-linux
+	@echo ================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "cryptodev*"`; \
+	make ARCH=arm  KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET)  install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 67e1b81..0817e4e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -32,9 +32,10 @@ SRC_URI = "\
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
     file://Makefile_dual-camera-demo \
+    file://Makefile_cryptodev \
 "
 
-PR = "r30"
+PR = "r31"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -66,6 +67,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            wireless \
+                           cryptodev \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -73,7 +75,11 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            linux-dtbs \
                            wireless \
                            dual-camera-demo \
+                           cryptodev \
 "
+
+MAKEFILES_append_dra7xx-evm = " cryptodev"
+
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
                               omapconf \
-- 
1.7.0.4


