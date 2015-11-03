Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5D6EA529C0
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JubXF028019
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JubYn006552
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:37 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JubOZ006884;
	Tue, 3 Nov 2015 13:56:37 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh6-0004Vk-TW; Tue, 03 Nov 2015 14:56:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:32 -0500
Message-ID: <1446580592-17255-11-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
References: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] ti-tisdk-makefile: Add uio-module-drv target
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:41 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_uio-module-drv      | 28 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
new file mode 100644
index 0000000..76ca190
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
@@ -0,0 +1,28 @@
+uio-module-drv: linux
+	@echo ================================
+	@echo      Building uio-module-drv
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
+	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)
+
+uio-module-drv_clean:
+	@echo ================================
+	@echo      Cleaning uio-module-drv
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
+	make ARCH=arm KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) clean
+
+uio-module-drv_install:
+	@echo ================================
+	@echo      Installing uio-module-drv
+	@echo ================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "uio-module-drv*"`; \
+	make ARCH=arm  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 1cab997..bf6b2ba 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -40,9 +40,10 @@ SRC_URI = "\
     file://Makefile_opencl-examples \
     file://Makefile_boot-monitor \
     file://Makefile_hplib-mod \
+    file://Makefile_uio-module-drv \
 "
 
-PR = "r58"
+PR = "r59"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -116,6 +117,7 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               cryptodev \
                               ti-crypto-examples \
                               hplib-mod \
+                              uio-module-drv \
 "
 
 # Use ARCH format expected by the makefile
-- 
1.9.1


