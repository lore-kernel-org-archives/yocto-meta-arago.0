Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id BEA7952A2E
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINa5N024525
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709416;
	bh=06cOX8KGM2tc15L6NXHhqiBL3UlFwriLUvTFKBFGzTY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qxdfx2ZTAthIyXeVc6SIHpbgL80lqeFq+KKdM/ZRmKjs/RXN0IVKVf7TOLXTclfPf
	AHW2hy2eEJrjgz6430NtQYQlgxKQW7p78G0ABq1ah/wgu/aulK0gSjz2W91YaYSWSC
	JAZOwLWronPVqaF68x+JaoVu5esqr4lqFESXtJyo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINaQg010261
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:36 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8f006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:20 -0400
Message-ID: <1506709407-16448-17-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 16/ ti-tisdk-makefile: add/remove modules for X11(xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:42 -0000
Content-Type: text/plain

For X11 build:
add: ti-xsgx-ddk-km
remove: dual-camera-demo image-gallery qt-opencv-opencl-opengl-multithreaded
        barcode-roi, evse-hmi and protection-relays-hmi

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km      | 25 +++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 | 31 ++++++++++++++--------
 2 files changed, 45 insertions(+), 11 deletions(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km
new file mode 100644
index 0000000..5957153
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-xsgx-ddk-km
@@ -0,0 +1,25 @@
+# ti-xsgx-ddk-km module
+ti-xsgx-ddk-km: linux
+	@echo ================================
+	@echo      Building ti-sgx-ddk-km
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm TARGET_PRODUCT=__TARGET_PRODUCT__ KERNELDIR=$(LINUXKERNEL_INSTALL_DIR)
+
+ti-xsgx-ddk-km_clean:
+	@echo ================================
+	@echo      Cleaning ti-sgx-ddk-km
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=arm KERNELDIR=$(LINUXKERNEL_INSTALL_DIR) clean
+
+ti-xsgx-ddk-km_install:
+	@echo ================================
+	@echo      Installing ti-sgx-ddk-km
+	@echo ================================
+	@cd board-support/extra-drivers; \
+	cd `find . -maxdepth 1 -name "ti-sgx-ddk-km*" -type d`; \
+	cd ./eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild; \
+	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd` INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 1c79dd2..dab4cdb 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk47"
+PR_append = ".tisdk48"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -8,23 +8,33 @@ SRC_URI_append = "\
     file://Makefile_jailhouse \
     file://Makefile_evse-hmi \
     file://Makefile_protection-relays-hmi \
+    file://Makefile_ti-xsgx-ddk-km \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
 
 MAKEFILES_MATRIX_GUI_omapl138 = ""
 
+MAKEFILES_remove = "\
+    ${@bb.utils.contains("MACHINE_FEATURES", 'sgx', '', 'ti-sgx-ddk-km', d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'dual-camera-demo image-gallery', '', d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'qt-opencv-opencl-opengl-multithreaded barcode-roi', '', d)} \
+"
+
 MAKEFILES_append_keystone = " ti-ipc"
 
 MAKEFILES_append_k2g = " opencl-examples \
                          openmpacc-examples \
 "
 
-MAKEFILES_append_omap-a15 = " dual-camera-demo \
-                              image-gallery \
+MAKEFILES_append_omap-a15 = "\
                               ti-ipc \
                               big-data-ipc-demo \
-			      evse-hmi \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'dual-camera-demo', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'image-gallery', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'evse-hmi', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'video-graphics-test', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
 "
 
 MAKEFILES_append_omapl138 = " ti-ipc \
@@ -34,22 +44,21 @@ MAKEFILES_append_omapl138 = " ti-ipc \
 MAKEFILES_remove_omapl138 = "pru"
 MAKEFILES_remove_omapl138 = "u-boot-legacy"
 
-MAKEFILES_append_omap-a15 = " video-graphics-test"
-
 MAKEFILES_append_ti43x = " cmem-mod \
-			   evse-hmi \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'evse-hmi', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
 "
 
-MAKEFILES_append_ti33x = " evse-hmi \
-			   protection-relays-hmi \
+MAKEFILES_append_ti33x = " \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'evse-hmi', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', '', 'protection-relays-hmi', d)} \
+               ${@bb.utils.contains("MACHINE_FEATURES", 'xsgx', 'ti-xsgx-ddk-km', '', d)} \
 "
 
 MAKEFILES_append_am57xx-evm = " jailhouse"
 
 MAKEFILES_append_k2g = " pru-icss"
 
-MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
-MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', 'ti-sgx-ddk-km', d)}"
 
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 
-- 
1.9.1


