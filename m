Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E678152A6C
	for <meta-arago@arago-project.org>;
	Tue, 14 Apr 2015 13:47:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3EDlLjV015342
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 08:47:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EDlKKn012595
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 08:47:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 08:47:20 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EDlKO4009351;
	Tue, 14 Apr 2015 08:47:20 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Yi1BQ-0003yI-BS;
	Tue, 14 Apr 2015 09:47:20 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Apr 2015 09:47:12 -0400
Message-ID: <1429019232-15216-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429019232-15216-1-git-send-email-j-stiffler@ti.com>
References: <1429019232-15216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] ti-tisdk-makefile: Add cmem-mod makfile fragment.
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
X-List-Received-Date: Tue, 14 Apr 2015 13:47:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_cmem-mod            |   33 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
new file mode 100644
index 0000000..321c6ec
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
@@ -0,0 +1,33 @@
+# CMEM module
+cmem: linux
+	@echo ================================
+	@echo     Building CMEM Module
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "cmem*"`; \
+	. $(ENV_SETUP); \
+	make -f lu.mak ARCH=arm KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) module
+
+cmem_clean:
+	@echo ================================
+	@echo     Cleaning CMEM Module
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "cmem*"`; \
+	. $(ENV_SETUP); \
+	make -f lu.mak ARCH=arm KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) modules_clean
+
+cmem_install:
+	@echo ================================
+	@echo     Installing CMEM Module
+	@echo ================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+	echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "cmem*"`; \
+	. $(ENV_SETUP); \
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd`/src/cmem/module INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index bbfbfb6..8c7e54e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -35,9 +35,10 @@ SRC_URI = "\
     file://Makefile_image-gallery \
     file://Makefile_cryptodev \
     file://Makefile_sgx-modules \
+    file://Makefile_cmem-mod \
 "
 
-PR = "r43"
+PR = "r44"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -89,6 +90,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
                               omapconf \
                               linux-dtbs \
+                              cmem-mod \
 "
 MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
-- 
1.7.9.5


