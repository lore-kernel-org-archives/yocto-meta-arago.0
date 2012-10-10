Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 0D9E652A65
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:26:55 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so888799oag.38
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qhZB71gNO/5W754Zd+FHwXA1ElLSQD+r6ILob68eb8A=;
	b=hNq9jtWD6SR3KgIaalv0+FFmdeRazcW5lvVDthkMGFEBToUq0dv80vXFfd0RFZMHhA
	IayfjNmbsWWK+qvh07TBNW76bvFcO9ZFwf0LPAy3KJj6dTfvVGLBTJ8bJQ4Khi2Dlp/w
	zmsYO+r3rsNMcWXGRl3Ryg14Lwi9j5bDJMnBrxOispih5xbsDz16nzi3t6OvDoQlRxTT
	m8vgzzY7HQckOZ7rZ6N9+HcohRTSZ7gx4KdK+S1mLH7USif5tJS7n9bVtKHJ6AOx9R73
	WE/izCLjDC4QCzWrmRqVPinnW2ho7Ncm3MlNvf82uFsr5t9cknUitMkeWJyNU9k52DlO
	sSVA==
Received: by 10.60.32.81 with SMTP id g17mr15452652oei.102.1349897214608;
	Wed, 10 Oct 2012 12:26:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id th3sm1959707obb.6.2012.10.10.12.26.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 12:26:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Oct 2012 14:57:20 -0500
Message-Id: <1349899040-597-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] ti-tisdk-makefile: Port ti-tisdk-makefile recipe from Arago
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
X-List-Received-Date: Wed, 10 Oct 2012 19:26:55 -0000

* Port recipe that creates the Rules.make and Makefile recipe used in the
  SDK

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile   |    5 +
 .../ti-tisdk-makefile/Makefile_am-benchmarks       |   24 ++++
 .../ti-tisdk-makefile/Makefile_am-sysinfo          |   24 ++++
 .../ti-tisdk-makefile/Makefile_av-examples         |   24 ++++
 .../ti-tisdk-makefile/Makefile_linux               |   24 ++++
 .../ti-tisdk-makefile/Makefile_matrix-gui          |   18 +++
 .../ti-tisdk-makefile/Makefile_matrix-gui-browser  |   24 ++++
 .../ti-tisdk-makefile/Makefile_pru                 |   18 +++
 .../ti-tisdk-makefile/Makefile_qml-playground      |   24 ++++
 .../ti-tisdk-makefile/Makefile_qt-tstat            |   24 ++++
 .../ti-tisdk-makefile/Makefile_refresh-screen      |   24 ++++
 .../Makefile_ti-ocf-crypto-module                  |   18 +++
 .../ti-tisdk-makefile/Makefile_u-boot-legacy       |   16 +++
 .../ti-tisdk-makefile/Makefile_u-boot-spl          |   17 +++
 .../ti-tisdk-makefile/Makefile_wireless            |   76 +++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |   27 +++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  112 ++++++++++++++++++++
 17 files changed, 499 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
 create mode 100755 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
new file mode 100644
index 0000000..cab8942
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile
@@ -0,0 +1,5 @@
+-include Rules.make
+
+all: __ALL_TARGETS__
+clean: __CLEAN_TARGETS__
+install: __INSTALL_TARGETS__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
new file mode 100644
index 0000000..ba0e0c6
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
@@ -0,0 +1,24 @@
+# am-benchmarks build targets
+am-benchmarks:
+	@echo =============================
+	@echo    Building AM Benchmarks
+	@echo =============================
+	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make
+
+am-benchmarks_clean:
+	@echo =============================
+	@echo    Cleaning AM Benchmarks
+	@echo =============================
+	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make clean
+
+am-benchmarks_install:
+	@echo ==============================================
+	@echo   Installing AM Benchmarks - Release version
+	@echo ==============================================
+	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make install
+
+am-benchmarks_install_debug:
+	@echo ============================================
+	@echo   Installing AM Benchmarks - Debug Version
+	@echo ============================================
+	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
new file mode 100644
index 0000000..445dd10
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
@@ -0,0 +1,24 @@
+# am-sysinfo build targets
+am-sysinfo:
+	@echo =============================
+	@echo    Building AM Sysinfo
+	@echo =============================
+	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make
+
+am-sysinfo_clean:
+	@echo =============================
+	@echo    Cleaning AM Sysinfo
+	@echo =============================
+	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make clean
+
+am-sysinfo_install:
+	@echo ===============================================
+	@echo     Installing AM Sysinfo - Release version
+	@echo ===============================================
+	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make install
+
+am-sysinfo_install_debug:
+	@echo =============================================
+	@echo     Installing AM Sysinfo - Debug version
+	@echo =============================================
+	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples
new file mode 100644
index 0000000..870e8c7
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_av-examples
@@ -0,0 +1,24 @@
+# av-examples make targets
+av-examples:
+	@echo =============================
+	@echo    Building AV Examples
+	@echo =============================
+	@cd example-applications; cd `find . -name "*av-examples*"`; make
+
+av-examples_clean:
+	@echo =============================
+	@echo    Cleaning AV Examples
+	@echo =============================
+	@cd example-applications; cd `find . -name "*av-examples*"`; make clean
+
+av-examples_install:
+	@echo ==============================================
+	@echo    Installing AV Examples - Release version
+	@echo ==============================================
+	@cd example-applications; cd `find . -name "*av-examples*"`; make install
+
+av-examples_install_debug:
+	@echo ============================================
+	@echo    Installing AV Examples - Debug version
+	@echo ============================================
+	@cd example-applications; cd `find . -name "*av-examples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
new file mode 100644
index 0000000..457bd24
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
@@ -0,0 +1,24 @@
+# Kernel build targets
+linux:
+	@echo =================================
+	@echo     Building the Linux Kernel
+	@echo =================================
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) uImage
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules
+
+linux_install:
+	@echo ===================================
+	@echo     Installing the Linux Kernel
+	@echo ===================================
+	install -d $(DESTDIR)/boot
+	install $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/uImage $(DESTDIR)/boot
+	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
+	install $(LINUXKERNEL_INSTALL_DIR)/System.map $(DESTDIR)/boot
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) INSTALL_MOD_PATH=$(DESTDIR) modules_install
+
+linux_clean:
+	@echo =================================
+	@echo     Cleaning the Linux Kernel
+	@echo =================================
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) mrproper
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui
new file mode 100644
index 0000000..7b5f30f
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui
@@ -0,0 +1,18 @@
+# Make Rules for matrix-gui project
+matrix-gui:
+	@echo =============================
+	@echo      Building Matrix GUI
+	@echo =============================
+	@echo    NOTHING TO DO.  COMPILATION NOT REQUIRED
+
+matrix-gui_clean:
+	@echo =============================
+	@echo      Cleaning Matrix GUI
+	@echo =============================
+	@echo    NOTHING TO DO.
+
+matrix-gui_install:
+	@echo =============================
+	@echo     Installing Matrix GUI
+	@echo =============================
+	@cd example-applications; cd `find . -name "*matrix-gui-2.0*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
new file mode 100644
index 0000000..2fc3b21
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
@@ -0,0 +1,24 @@
+# matrix-gui-browser build targets
+matrix-gui-browser:
+	@echo =================================
+	@echo    Building Matrix GUI Browser
+	@echo =================================
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build release
+
+matrix-gui-browser_clean:
+	@echo =================================
+	@echo    Cleaning Matrix GUI Browser
+	@echo =================================
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build clean
+
+matrix-gui-browser_install:
+	@echo ===================================================
+	@echo   Installing Matrix GUI Browser - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install
+
+matrix-gui-browser_install_debug:
+	@echo =================================================
+	@echo   Installing Matrix GUI Browser - Debug Version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru
new file mode 100644
index 0000000..cfbc4ae
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru
@@ -0,0 +1,18 @@
+# pru build targets
+pru: linux
+	@echo ===========================
+	@echo    Building PRU Examples
+	@echo ===========================
+	@cd example-applications; cd `find . -name "*pru*"`; make
+
+pru_clean:
+	@echo ===========================
+	@echo    Cleaning PRU Examples
+	@echo ===========================
+	@cd example-applications; cd `find . -name "*pru*"`; make clean
+
+pru_install:
+	@echo ==============================
+	@echo     Installing PRU Examples
+	@echo ==============================
+	@cd example-applications; cd `find . -name "*pru*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground
new file mode 100644
index 0000000..4d8709a
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground
@@ -0,0 +1,24 @@
+# QML Playground build targets
+qml-playground:
+	@echo =================================
+	@echo    Building QML Playground App
+	@echo =================================
+	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build release
+
+qml-playground_clean:
+	@echo =================================
+	@echo    Cleaning QML Playground App
+	@echo =================================
+	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build clean
+
+qml-playground_install:
+	@echo ====================================================
+	@echo   Installing QML Playground App - Release version
+	@echo ====================================================
+	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build install
+
+qml-playground_install_debug:
+	@echo ==================================================
+	@echo   Installing QML Playground App - Debug version
+	@echo ==================================================
+	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
new file mode 100644
index 0000000..857e058
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
@@ -0,0 +1,24 @@
+# QT Thermostat build targets
+qt-tstat:
+	@echo ================================
+	@echo    Building QT Thermostat App
+	@echo ================================
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build release
+
+qt-tstat_clean:
+	@echo ================================
+	@echo    Cleaning QT Thermostat App
+	@echo ================================
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build clean
+
+qt-tstat_install:
+	@echo ===================================================
+	@echo   Installing QT Thermostat App - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install
+
+qt-tstat_install_debug:
+	@echo =================================================
+	@echo   Installing QT Thermostat App - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
new file mode 100644
index 0000000..bcc17fa
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
@@ -0,0 +1,24 @@
+# refresh-screen build targets
+refresh-screen:
+	@echo =============================
+	@echo    Building Refresh Screen
+	@echo =============================
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build release
+
+refresh-screen_clean:
+	@echo =============================
+	@echo    Cleaning Refresh Screen
+	@echo =============================
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build clean
+
+refresh-screen_install:
+	@echo ================================================
+	@echo   Installing Refresh Screen - Release version
+	@echo ================================================
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install
+
+refresh-screen_install_debug:
+	@echo ==============================================
+	@echo   Installing Refresh Screen - Debug Version
+	@echo ==============================================
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
new file mode 100644
index 0000000..19eb61f
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
@@ -0,0 +1,18 @@
+# ti-ocf-crypto-module components
+ti-ocf-crypto-module: linux
+	@echo ===================================
+	@echo    Building TI OCF Crypto Module
+	@echo ===================================
+	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-crypto-module*"`; make
+
+ti-ocf-crypto-module_clean:
+	@echo ===================================
+	@echo    Cleaning TI OCF Crypto Module
+	@echo ===================================
+	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-crypto-module*"`; make clean
+
+ti-ocf-crypto-module_install:
+	@echo =====================================
+	@echo    Installing TI OCF Crypto Module
+	@echo =====================================
+	@cd board-support/extra-drivers; cd `find . -name "*ti-ocf-crypto-module*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
new file mode 100644
index 0000000..70640e2
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
@@ -0,0 +1,16 @@
+# u-boot build targets
+u-boot-legacy: u-boot
+u-boot-legacy_clean: u-boot_clean
+u-boot-legacy_install: u-boot_install
+
+u-boot:
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
+
+u-boot_clean:
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) clean
+
+u-boot_install:
+	install -d $(DESTDIR)/boot
+	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.bin $(DESTDIR)/boot
+	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map $(DESTDIR)/boot
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
new file mode 100644
index 0000000..566647c
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
@@ -0,0 +1,17 @@
+# u-boot build targets
+u-boot-spl: u-boot
+u-boot-spl_clean: u-boot_clean
+u-boot-spl_install: u-boot_install
+
+u-boot:
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
+
+u-boot_clean:
+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) clean
+
+u-boot_install:
+	install -d $(DESTDIR)/boot
+	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.img $(DESTDIR)/boot
+	install $(TI_SDK_PATH)/board-support/u-boot-*/MLO $(DESTDIR)/boot
+	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map $(DESTDIR)/boot
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
new file mode 100755
index 0000000..708c0ad
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
@@ -0,0 +1,76 @@
+# Wireless build targets
+wireless: compat-modules bt-firmware bt-enable
+wireless_install: compat-modules_install bt-firmware_install bt-enable_install
+wireless_clean: compat-modules_clean bt-firmware_clean bt-enable_clean
+
+bt-firmware:
+	@echo ============================
+	@echo      Building bt-firmware
+	@echo ============================
+	@echo    NOTHING TO DO.  COMPILATION NOT REQUIRED
+
+bt-firmware_install:
+	@echo ==============================
+	@echo      Installing bt-firmware
+	@echo ==============================
+	@cd board-support/extra-drivers; cd `find . -name "*bt-firmware*"`; make DEST_DIR=${DESTDIR} BASE_LIB_DIR="/lib" PLATFORM=${PLATFORM} install
+
+bt-firmware_clean:
+	@echo ============================
+	@echo      Cleaning bt-firmware
+	@echo ============================
+	@echo    NOTHING TO DO.
+
+bt-enable: linux
+	@echo ===========================
+	@echo      Building bt-enable
+	@echo ===========================
+	@cd board-support/extra-drivers; cd `find . -name "*bt-enable*"`; \
+	make DEST_DIR=${DESTDIR} PLATFORM=${PLATFORM}
+
+bt-enable_install:
+	@echo ============================
+	@echo      Installing bt-enable
+	@echo ============================
+	@cd board-support/extra-drivers; cd `find . -name "*bt-enable*"`; \
+	make DEST_DIR=${DESTDIR} PLATFORM=${PLATFORM} install
+
+bt-enable_clean:
+	@echo ===========================
+	@echo      Cleaning bt-enable
+	@echo ===========================
+	@cd board-support/extra-drivers; cd `find . -name "*bt-enable*"`; \
+	make DEST_DIR=${DESTDIR} PLATFORM=${PLATFORM} clean
+
+compat-modules: linux
+	@echo ================================
+	@echo      Building compat-modules
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
+	./scripts/driver-select bt; make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm; \
+	cd ..; \
+	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
+	./scripts/driver-select wl12xx; make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm
+
+compat-modules_install:
+	@echo ==================================
+	@echo      Installing compat-modules
+	@echo ==================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
+	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm install-modules; \
+	cd ..; \
+	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
+	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} INSTALL_MOD_PATH=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm install-modules
+
+compat-modules_clean:
+	@echo ================================
+	@echo      Cleaning compat-wireless
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "*compat-bluetooth*"`; \
+	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean; \
+	cd ..; \
+	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
+	make DEPMOD=echo DESTDIR=${DESTDIR} KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
new file mode 100644
index 0000000..1b0a347
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -0,0 +1,27 @@
+#platform
+PLATFORM=__PLATFORM__
+
+#Architecture
+ARCH=__ARCH__
+
+#u-boot machine
+UBOOT_MACHINE=__UBOOT_MACHINE__
+
+#Points to the root of the TI SDK
+export TI_SDK_PATH=__SDK__INSTALL_DIR__
+
+#root of the target file system for installing applications
+DESTDIR=__DESTDIR__
+
+#Points to the root of the Linux libraries and headers matching the
+#demo file system.
+export LINUX_DEVKIT_PATH=$(TI_SDK_PATH)/linux-devkit
+
+#Cross compiler prefix
+export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/bin/arm-arago-linux-gnueabi-
+
+#Location of environment-setup file
+export ENV_SETUP=$(LINUX_DEVKIT_PATH)/environment-setup
+
+#The directory that points to the SDK kernel source tree
+LINUXKERNEL_INSTALL_DIR=$(TI_SDK_PATH)/board-support/__KERNEL_NAME__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
new file mode 100644
index 0000000..2dece10
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -0,0 +1,112 @@
+DESCRIPTION = "Package containing Makefile and Rules.make file for TISDKs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Build the list of component makefiles to put together to build the
+# Makefile that goes into the SDK.  For legacy devices the base Makefile
+# will be picked up and will contain everything.
+#
+# It is assumed that the component makefiles follow the naming
+# Makefile_$component.  All Makefiles will be part of the SRC_URI to be
+# fetched, but only the listed ones will be used to build the final Makefile
+
+SRC_URI = "\
+    file://Makefile \
+    file://Rules.make \
+    file://Makefile_linux \
+    file://Makefile_u-boot-legacy \
+    file://Makefile_matrix-gui \
+    file://Makefile_am-benchmarks \
+    file://Makefile_am-sysinfo \
+    file://Makefile_av-examples \
+    file://Makefile_u-boot-spl \
+    file://Makefile_matrix-gui-browser \
+    file://Makefile_refresh-screen \
+    file://Makefile_pru \
+    file://Makefile_ti-ocf-crypto-module \
+    file://Makefile_qt-tstat \
+    file://Makefile_qml-playground \
+    file://Makefile_wireless \
+"
+
+PR = "r0"
+
+MAKEFILES_COMMON = "linux \
+                    matrix-gui \
+                    am-benchmarks \
+                    am-sysinfo \
+                    matrix-gui-browser \
+                    refresh-screen \
+                    qt-tstat \
+"
+
+# Add device specific make targets
+MAKEFILES_omap3 += "u-boot-spl \
+                    qml-playground \
+"
+MAKEFILES_am37x-evm += "av-examples \
+                        ti-ocf-crypto-module \
+                        wireless \
+"
+MAKEFILES_am3517-evm += "av-examples \
+                         ti-ocf-crypto-module \
+"
+MAKEFILES_ti33x += "u-boot-spl \
+                    qml-playground wireless \
+"
+MAKEFILES_am180x-evm += "pru \
+                         u-boot-legacy \
+                         wireless \
+"
+
+# This step will stitch together the final Makefile based on the supported
+# make targets.
+do_install () {
+    install -d ${D}/
+
+    # Start with the base Makefile
+    install  ${WORKDIR}/Makefile ${D}/Makefile
+
+    # Remember the targets added so we can update the all target
+    targets=""
+    clean_targets=""
+    install_targets=""
+
+    # Now add common build targets
+    for x in ${MAKEFILES_COMMON}
+    do
+        cat ${WORKDIR}/Makefile_${x} >> ${D}/Makefile
+        targets="$targets""$x\ "
+        clean_targets="$clean_targets""$x""_clean\ "
+        install_targets="$install_targets""$x""_install\ "
+    done
+
+    # Now add device specific build targets
+    for x in ${MAKEFILES}
+    do
+        cat ${WORKDIR}/Makefile_${x} >> ${D}/Makefile
+        targets="$targets""$x\ "
+        clean_targets="$clean_targets""$x""_clean\ "
+        install_targets="$install_targets""$x""_install\ "
+    done
+
+    # Update the all, clean, and install targets if we added targets
+    if [ "$targets" != "" ]
+    then
+        sed -i -e "s/__ALL_TARGETS__/$targets/" ${D}/Makefile
+        sed -i -e "s/__CLEAN_TARGETS__/$clean_targets/" ${D}/Makefile
+        sed -i -e "s/__INSTALL_TARGETS__/$install_targets/" ${D}/Makefile
+    fi
+
+    install  ${WORKDIR}/Rules.make ${D}/Rules.make
+
+    # fixup Rules.make values
+    sed -i -e "s/__PLATFORM__/${MACHINE}/" ${D}/Rules.make
+    sed -i -e "s/__ARCH__/${BASE_PACKAGE_ARCH}/" ${D}/Rules.make
+    sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
+
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "/*"
-- 
1.7.0.4


