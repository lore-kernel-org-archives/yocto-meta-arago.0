Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E979D52AB7
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2015 19:30:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6JUdLC017703
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:39 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUdhv010902
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:39 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Nov 2015 13:30:39 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUcGs009635;
	Fri, 6 Nov 2015 13:30:38 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zumic-0006Mj-HW; Fri, 06 Nov 2015 14:30:38 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Nov 2015 14:30:33 -0500
Message-ID: <1446838233-24415-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
References: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ti-tisdk-makefile: Add pru-icss makefile fragment
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
X-List-Received-Date: Fri, 06 Nov 2015 19:30:41 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_pru-icss            | 73 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 15 ++++-
 2 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
new file mode 100644
index 0000000..7dbbca7
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
@@ -0,0 +1,73 @@
+
+# PRU-ICSS build targets
+pru-icss:
+	@echo =================================
+	@echo    Building PRU-ICSS
+	@echo =================================
+	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	for dir in examples pru_cape/pru_fw lib/src labs; \
+	do \
+		make -C $$dir PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
+	done
+
+pru-icss_clean:
+	@echo =================================
+	@echo    Cleaning PRU-ICSS
+	@echo =================================
+	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	for dir in examples pru_cape/pru_fw lib/src labs; \
+	do \
+		make -C $$dir clean PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
+	done
+
+pru-icss_install: __PRU_ICSS_INSTALL_TARGET__
+
+pru-icss_install_common:
+	@echo ===================================================
+	@echo   Installing PRU-ICSS
+	@echo ===================================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@install -d $(DESTDIR)/lib/firmware/pru
+
+pru-icss_install_none:
+	@echo ===================================================
+	@echo   Nothing to install
+	@echo ===================================================
+
+pru-icss_install_am335x: pru-icss_install_common
+	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	for i in 0 1; \
+	install -m 0644 ./examples/am335x/PRU_Halt/gen/PRU_Halt.out \
+		$(DESTDIR)/lib/firmware/pru; \
+	do \
+		install -m 0644 ./examples/am335x/PRU_RPMsg_Echo_Interrupt$${i}/gen/PRU_RPMsg_Echo_Interrupt$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+	done
+
+pru-icss_install_am437x: pru-icss_install_common
+	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	for i in 0 1; \
+	install -m 0644 ./examples/am437x/PRU_Halt/gen/PRU_Halt.out \
+		$(DESTDIR)/lib/firmware/pru; \
+	do \
+		install -m 0644 ./examples/am437x/PRU_RPMsg_Echo_Interrupt$${i}/gen/PRU_RPMsg_Echo_Interrupt$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+	done
+
+pru-icss_install_am572x: pru-icss_install_common
+	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	for i in 1 2; \
+	install -m 0644 ./examples/am572x/PRU_Halt/gen/PRU_Halt.out \
+		$(DESTDIR)/lib/firmware/pru; \
+	do \
+		for j in 0 1; \
+		do \
+			install -m 0644 ./examples/am572x/PRU_RPMsg_Echo_Interrupt$${i}_$${j}/gen/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+		done; \
+	done
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index bf6b2ba..914d184 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -41,9 +41,10 @@ SRC_URI = "\
     file://Makefile_boot-monitor \
     file://Makefile_hplib-mod \
     file://Makefile_uio-module-drv \
+    file://Makefile_pru-icss \
 "
 
-PR = "r59"
+PR = "r60"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -52,7 +53,6 @@ MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
 
 MAKEFILES_MATRIX_GUI_keystone = ""
 
-
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
                     arm-benchmarks \
@@ -82,6 +82,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            linux-dtbs \
                            cryptodev \
                            omapdrm-pvr \
+                           pru-icss \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -91,6 +92,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            dual-camera-demo \
                            image-gallery \
                            omapdrm-pvr \
+                           pru-icss \
 "
 
 MAKEFILES_append_dra7xx = " cryptodev \
@@ -105,6 +107,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               linux-dtbs \
                               cmem-mod \
                               omapdrm-pvr \
+                              pru-icss \
 "
 MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
@@ -140,6 +143,12 @@ PLATFORM_DEBUGSS_dra7xx = "DRA7xx_PLATFORM"
 PLATFORM_GDBSERVERPROXY = ""
 PLATFORM_GDBSERVERPROXY_dra7xx = "DRA7xx_PLATFORM"
 
+PRU_ICSS_INSTALL_TARGET = "pru-icss_install_none"
+PRU_ICSS_INSTALL_TARGET_ti33x = "pru-icss_install_am335x"
+PRU_ICSS_INSTALL_TARGET_ti43x = "pru-icss_install_am437x"
+PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
+
+
 # If it's not defined at all, like for zImage case
 UBOOT_LOADADDRESS ?= "0"
 
@@ -200,12 +209,14 @@ do_install () {
     fi
 
     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makefile
+    sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
 
     sed -i -e "s/__PLATFORM_OMAPDRM__/${PLATFORM_OMAPDRM}/" ${D}/Makefile
     sed -i -e "s/__PVR_NULLDRM__/${PVR_NULLDRM}/" ${D}/Makefile
     sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefile
     sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/g" ${D}/Makefile
     sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET}/g" ${D}/Makefile
+    sed -i -e "s/__PRU_ICSS_INSTALL_TARGET__/${PRU_ICSS_INSTALL_TARGET}/g" ${D}/Makefile
 
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
 
-- 
1.9.1


