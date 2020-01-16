Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C3268529F8
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2020 22:06:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GM4PmN106522
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2020 16:04:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579212265;
	bh=VzJC3qFuPX0vXt0Sjc/92BTfeOIf6ixeE+44ClcZRWU=;
	h=From:To:CC:Subject:Date;
	b=ga+9NXXp6Jw2JzlUkZNSbTcMy1GYO0fhQ3yQE5n1Z9YeohyuDWOAhXV1HOtPvEWFR
	uVyJAHhV+Nj0F3SayiXahhxK2w1dY0zRYAJUVrNIl8RiO1MUB6h2B503O3T81i80T2
	l6hiqr2bBJ3oVlg9f+o9beHGXrpEQe8tJJB9RbvY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GM4PYP039061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2020 16:04:25 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 16 Jan 2020 16:04:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 16 Jan 2020 16:04:25 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GM4P5D042561;
	Thu, 16 Jan 2020 16:04:25 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	00GM4Nu21515; Thu, 16 Jan 2020 16:04:23 -0600 (CST)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 16 Jan 2020 16:04:03 -0600
Message-ID: <20200116220403.26575-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] tisdk: Add makefiles for img encoder/decoder and GPU driver
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
X-List-Received-Date: Thu, 16 Jan 2020 22:06:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add Makefile snippets for Imagination GPU and Video encode/decode
driver for installer Makefile.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../Makefile_ti-img-encode-decode             | 34 +++++++++++++++++++
 .../Makefile_ti-img-rogue-driver              | 26 ++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  6 +++-
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-rogue-driver

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode
new file mode 100644
index 00000000..e5e5b316
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode
@@ -0,0 +1,34 @@
+
+# ti-img-encode-decode
+ti-img-encode-decode: linux
+	@echo =====================================
+	@echo     Building ti-img-encode-decode
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -type d -name "ti-img-encode-decode*" -type d`; \
+	cd linux/decoder; \
+	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} all; \
+	cd ../encoder; \
+	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} all
+
+ti-img-encode-decode_clean:
+	@echo ====================================
+	@echo     Cleaning ti-img-encode-decode
+	@echo ====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -type d -name "ti-img-encode-decode*" -type d`; \
+	cd linux/decoder; \
+	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} clean; \
+	cd ../encoder; \
+	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} clean
+
+ti-img-encode-decode_install:
+	@echo ====================================
+	@echo     Installing ti-img-encode-decode
+	@echo ====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -type d -name "ti-img-encode-decode*" -type d`; \
+	cd linux/decoder; \
+	make -C ${LINUXKERNEL_INSTALL_DIR} INSTALL_MOD_PATH=${DESTDIR} INSTALL_MOD_STRIP=${INSTALL_MOD_STRIP} M=`pwd` modules_install; \
+	cd ../encoder; \
+	make -C ${LINUXKERNEL_INSTALL_DIR} INSTALL_MOD_PATH=${DESTDIR} INSTALL_MOD_STRIP=${INSTALL_MOD_STRIP} M=`pwd` modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-rogue-driver b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-rogue-driver
new file mode 100644
index 00000000..6d8830b0
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-rogue-driver
@@ -0,0 +1,26 @@
+
+# ti-img-rogue-driver
+ti-img-rogue-driver: linux
+	@echo =====================================
+	@echo     Building ti-img-rogue-driver
+	@echo =====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -type d -name "ti-img-rogue-driver*" -type d`; \
+	make ARCH=__KERNEL_ARCH__ KERNELDIR=${LINUXKERNEL_INSTALL_DIR} RGX_BVNC="22.104.208.318" BUILD=release PVR_BUILD_DIR=j721e_linux WINDOW_SYSTEM=wayland
+
+ti-img-rogue-driver_clean:
+	@echo ====================================
+	@echo     Cleaning ti-img-rogue-driver
+	@echo ====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -type d -name "ti-img-rogue-driver*" -type d`; \
+	make ARCH=__KERNEL_ARCH__ KERNELDIR=${LINUXKERNEL_INSTALL_DIR} RGX_BVNC="22.104.208.318" BUILD=release PVR_BUILD_DIR=j721e_linux WINDOW_SYSTEM=wayland clean
+
+ti-img-rogue-driver_install:
+	@echo ====================================
+	@echo     Installing ti-img-rogue-driver
+	@echo ====================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -type d -name "ti-img-rogue-driver*" -type d`; \
+	cd binary_j721e_linux_wayland_release/target_aarch64/kbuild; \
+	make -C ${LINUXKERNEL_INSTALL_DIR} INSTALL_MOD_PATH=${DESTDIR} INSTALL_MOD_STRIP=${INSTALL_MOD_STRIP} M=`pwd` modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 89ac752a..aa3a9c40 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,9 +54,11 @@ SRC_URI = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_ti-ipc \
     file://Makefile_jailhouse \
+    file://Makefile_ti-img-rogue-driver \
+    file://Makefile_ti-img-encode-decode \
 "
 
-PR = "r103"
+PR = "r104"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -198,6 +200,8 @@ MAKEFILES_append_am65xx = " \
 "
 
 MAKEFILES_append_j7-evm = " pru-icss \
+                            ti-img-rogue-driver \
+                            ti-img-encode-decode \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.25.0


