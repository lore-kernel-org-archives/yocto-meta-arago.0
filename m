Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1109952A94
	for <meta-arago@arago-project.org>;
	Thu, 10 Sep 2015 16:02:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8AG2Uka008770
	for <meta-arago@arago-project.org>; Thu, 10 Sep 2015 11:02:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8AG2UVW005956
	for <meta-arago@arago-project.org>; Thu, 10 Sep 2015 11:02:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 10 Sep 2015 11:02:21 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8AG2UAm018139;
	Thu, 10 Sep 2015 11:02:30 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Za4Iw-0001eb-4V; Thu, 10 Sep 2015 12:02:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Sep 2015 12:02:27 -0400
Message-ID: <1441900947-6318-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441900947-6318-1-git-send-email-j-stiffler@ti.com>
References: <1441900947-6318-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-tisdk-makefile: Add omapdrm-pvr makefile fragment
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
X-List-Received-Date: Thu, 10 Sep 2015 16:02:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_omapdrm-pvr         | 26 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  6 ++++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
new file mode 100644
index 0000000..80699ef
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapdrm-pvr
@@ -0,0 +1,26 @@
+# omapdrm-pvr module
+omapdrm-pvr: linux
+	@echo ================================
+	@echo      Building omapdrm-pvr
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap5430_linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
+
+omapdrm-pvr_clean:
+	@echo ================================
+	@echo      Cleaning omapdrm-pvr
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap5430_linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+
+omapdrm-pvr_install:
+	@echo ================================
+	@echo      Installing omapdrm-pvr
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "omapdrm-pvr*" -type d`; \
+	cd ./eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild; \
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) modules_install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 8eafcc1..4ac02b3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -38,9 +38,10 @@ SRC_URI = "\
     file://Makefile_cmem-mod \
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
+    file://Makefile_omapdrm-pvr \
 "
 
-PR = "r49"
+PR = "r50"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -74,6 +75,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            wireless \
                            cryptodev \
                            sgx-modules \
+                           omapdrm-pvr \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -84,6 +86,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            sgx-modules \
                            dual-camera-demo \
                            image-gallery \
+                           omapdrm-pvr \
 "
 
 MAKEFILES_append_dra7xx = " cryptodev \
@@ -96,6 +99,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               omapconf \
                               linux-dtbs \
                               cmem-mod \
+                              omapdrm-pvr \
 "
 MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
-- 
1.9.1


