Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9E61952ABA
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 13:42:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12Dg91M002022
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:09 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg9Z5023757
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:09 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 07:42:09 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8Fh001746;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQbDc-0005GW-Ed; Tue, 02 Feb 2016 08:42:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 08:42:04 -0500
Message-ID: <1454420524-20173-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
References: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] ti-tisdk-makefile: Add ipsecmgr-mod target
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
X-List-Received-Date: Tue, 02 Feb 2016 13:42:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ipsecmgr-mod        | 28 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
new file mode 100644
index 0000000..e39a2c0
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod
@@ -0,0 +1,28 @@
+ipsecmgr-mod: linux
+	@echo ================================
+	@echo      Building ipsecmgr-mod
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
+	make ARCH=arm KDIR=$(LINUXKERNEL_INSTALL_DIR)
+
+ipsecmgr-mod_clean:
+	@echo ================================
+	@echo      Cleaning ipsecmgr-mod
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
+	make ARCH=arm KDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+
+ipsecmgr-mod_install:
+	@echo ================================
+	@echo      Installing ipsecmgr-mod
+	@echo ================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ipsecmgr-mod*"`; \
+	make ARCH=arm  KDIR=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 14f8e8a..3813082 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -43,9 +43,10 @@ SRC_URI = "\
     file://Makefile_uio-module-drv \
     file://Makefile_pru-icss \
     file://Makefile_qt-opencv-opencl-opengl-multithreaded \
+    file://Makefile_ipsecmgr-mod \
 "
 
-PR = "r64"
+PR = "r65"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -123,6 +124,7 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               ti-crypto-examples \
                               hplib-mod \
                               uio-module-drv \
+                              ipsecmgr-mod-src \
 "
 
 MAKEFILES_append_k2hk-evm = " opencl-examples \
-- 
1.9.1


