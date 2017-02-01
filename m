Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 0312752A90
	for <meta-arago@arago-project.org>;
	Wed,  1 Feb 2017 19:48:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v11Jm7U2019104
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2017 13:48:07 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v11Jm7DH003716
	for <meta-arago@arago-project.org>; Wed, 1 Feb 2017 13:48:07 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Feb 2017 13:48:06 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v11Jm5WZ023416;	Wed, 1 Feb 2017 13:48:06 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Feb 2017 14:45:50 -0500
Message-ID: <1485978350-1239-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485978350-1239-1-git-send-email-j-stiffler@ti.com>
References: <1485978350-1239-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 2/2] ti-tisdk-makefile: add gc320 driver makefile fragment
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
X-List-Received-Date: Wed, 01 Feb 2017 19:48:09 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ti-gc320-driver     | 25 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver
new file mode 100644
index 0000000..d72d1c0
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver
@@ -0,0 +1,25 @@
+# ti-gc320-driver module
+ti-gc320-driver: linux
+	@echo ================================
+	@echo      Building ti-gc320-driver
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-gc320-driver*" -type d`; \
+	make -f Kbuild AQROOT=`pwd` KERNEL_DIR=${LINUXKERNEL_INSTALL_DIR} ARCH_TYPE=arm
+
+ti-gc320-driver_clean:
+	@echo ================================
+	@echo      Cleaning ti-gc320-driver
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-gc320-driver*" -type d`; \
+	make -f Kbuild AQROOT=`pwd` KERNEL_DIR=${LINUXKERNEL_INSTALL_DIR} ARCH_TYPE=arm clean
+
+ti-gc320-driver_install:
+	@echo ================================
+	@echo      Installing ti-gc320-driver
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-gc320-driver*" -type d`; \
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 202078c..25cde69 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -46,9 +46,10 @@ SRC_URI = "\
     file://Makefile_ipsecmgr-mod \
     file://Makefile_openmpacc-examples \
     file://Makefile_linalg-examples \
+    file://Makefile_ti-gc320-driver \
 "
 
-PR = "r75"
+PR = "r76"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -114,6 +115,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ti-sgx-ddk-km \
                               cmem-mod \
                               pru-icss \
+                              ti-gc320-driver \
 "
 MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
-- 
2.7.4


