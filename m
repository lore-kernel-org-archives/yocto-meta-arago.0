Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E880E52007
	for <meta-arago@arago-project.org>;
	Mon,  8 Feb 2016 15:50:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u18FoYcZ004544
	for <meta-arago@arago-project.org>; Mon, 8 Feb 2016 09:50:34 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u18FoY7r004088
	for <meta-arago@arago-project.org>; Mon, 8 Feb 2016 09:50:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Feb 2016 09:50:33 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u18FoXj5001434;
	Mon, 8 Feb 2016 09:50:34 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aSo54-0001sR-5z; Mon, 08 Feb 2016 10:50:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Feb 2016 10:50:22 -0500
Message-ID: <1454946622-7168-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: Strip modules while installing
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
X-List-Received-Date: Mon, 08 Feb 2016 15:50:35 -0000
Content-Type: text/plain

* This is to conserve space and to match how modules are installed in
  the SDK build

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod              | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev             | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv    | 2 +-
 .../ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv               | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod             | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod          | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux   | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr           | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv        | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make       | 3 +++
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb           | 2 +-
 11 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
index 1f89239..d1ae4e1 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
@@ -29,5 +29,5 @@ cmem-mod_install:
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cmem-mod*"`; \
 	. $(ENV_SETUP); \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd`/src/cmem/module INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd`/src/cmem/module INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
index 980b236..ee54327 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
@@ -25,4 +25,4 @@ cryptodev_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cryptodev*"`; \
-	make ARCH=arm  KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET)  install
+	make ARCH=arm  KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
index fde7aca..913653c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
@@ -25,5 +25,5 @@ debugss-module-drv_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "debugss*"`; \
-	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) PLATFORM=__PLATFORM_DEBUGSS__ modules_install
+	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_DEBUGSS__ modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
index eabca44..b81833b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-drv
@@ -25,5 +25,5 @@ gdbserverproxy-module-drv_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "gdbserverproxy*"`; \
-	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) PLATFORM=__PLATFORM_GDBSERVERPROXY__ modules_install
+	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) PLATFORM=__PLATFORM_GDBSERVERPROXY__ modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
index 1588245..dcee4e2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_hplib-mod
@@ -25,4 +25,4 @@ hplib-mod_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "hplib-mod*"`; \
-	make -C module ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) install
+	make -C module ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
index e39a2c0..35456b2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
@@ -25,4 +25,4 @@ ipsecmgr-mod_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
-	make ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) install
+	make ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
index 145e27c..2e878d5 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -20,7 +20,7 @@ linux_install: __DTB_DEPEND_INSTALL__
 	install $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/__KERNEL_BUILD_CMDS__ $(DESTDIR)/boot
 	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
 	install $(LINUXKERNEL_INSTALL_DIR)/System.map $(DESTDIR)/boot
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(DESTDIR) modules_install
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(DESTDIR) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
 linux_clean:
 	@echo =================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
index 3d49884..4ad790a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
@@ -22,5 +22,5 @@ omapdrm-pvr_install:
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
 	cd ./eurasia_km/eurasiacon/binary2___PLATFORM_OMAPDRM___linux_release/target/kbuild; \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
index 76ca190..ceecb28 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
@@ -25,4 +25,4 @@ uio-module-drv_install:
 	fi
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
-	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
+	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index f3c36e4..fad8045 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -35,4 +35,7 @@ LINUXKERNEL_INSTALL_DIR=$(TI_SDK_PATH)/board-support/__KERNEL_NAME__
 
 CFLAGS=__CFLAGS__
 
+#Strip modules when installing to conserve disk space
+INSTALL_MOD_STRIP=1
+
 SDK_PATH_TARGET=$(TI_SDK_PATH)/__SDK_PATH_TARGET__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 5b7fc32..b762b0e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -46,7 +46,7 @@ SRC_URI = "\
     file://Makefile_ipsecmgr-mod \
 "
 
-PR = "r66"
+PR = "r67"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
1.9.1


