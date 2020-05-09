Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4E9C452A3A
	for <meta-arago@arago-project.org>;
	Sat,  9 May 2020 01:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A058840C27;
	Sat,  9 May 2020 00:58:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YTppFsRqwgWK; Sat,  9 May 2020 00:58:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E23D409AA;
	Sat,  9 May 2020 00:58:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 10C4117272F;
	Fri,  8 May 2020 20:58:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  8 May 2020 20:58:47 -0400
Message-Id: <1588985927-14996-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] ti-img-encode-decode: not compatible with K5.4 - remove
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
X-List-Received-Date: Sat, 09 May 2020 01:01:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc       |  4 ---
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  1 -
 .../packagegroup-arago-tisdk-multimedia.bb         |  5 ----
 .../recipes-core/packagegroups/ti-test.bb          |  2 --
 .../Makefile_ti-img-encode-decode                  | 34 ----------------------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  2 --
 6 files changed, 48 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index c479a8c..39d3be8 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -206,10 +206,6 @@ CREATE_SRCIPK_pn-ti-img-rogue-driver = "1"
 SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver = "board-support/extra-drivers/${PN}-${PV}"
 SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver = "true"
 
-CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
-SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
-SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
-
 CREATE_SRCIPK_pn-ti-gc320-driver = "1"
 SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 6dcb253..4bc236f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -41,7 +41,6 @@ UTILS_append_k3 = " \
     arm-trusted-firmware-src \
 "
 
-#    ti-img-encode-decode-src
 UTILS_append_j7 = " \
     pru-icss-src \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 44ab026..36ebd35 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -41,11 +41,6 @@ ACCEL_MM_append_omap-a15 = " \
     ipumm-fw \
 "
 
-ACCEL_MM_append_j7 = " \
-    ti-img-encode-decode \
-    vxd-dec-fw \
-"
-
 RDEPENDS_${PN} = "\
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 2e089cb..268c00f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -68,8 +68,6 @@ ARAGO_TI_TEST_append_k3 = " \
 "
 
 ARAGO_TI_TEST_append_j7 = " \
-    viddec-test-app \
-    videnc-test-app \
     ufs-utils \
 "
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode
deleted file mode 100644
index e5e5b31..0000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-encode-decode
+++ /dev/null
@@ -1,34 +0,0 @@
-
-# ti-img-encode-decode
-ti-img-encode-decode: linux
-	@echo =====================================
-	@echo     Building ti-img-encode-decode
-	@echo =====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-img-encode-decode*" -type d`; \
-	cd linux/decoder; \
-	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} all; \
-	cd ../encoder; \
-	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} all
-
-ti-img-encode-decode_clean:
-	@echo ====================================
-	@echo     Cleaning ti-img-encode-decode
-	@echo ====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-img-encode-decode*" -type d`; \
-	cd linux/decoder; \
-	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} clean; \
-	cd ../encoder; \
-	make ARCH=__KERNEL_ARCH__ KPATH=${LINUXKERNEL_INSTALL_DIR} clean
-
-ti-img-encode-decode_install:
-	@echo ====================================
-	@echo     Installing ti-img-encode-decode
-	@echo ====================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-img-encode-decode*" -type d`; \
-	cd linux/decoder; \
-	make -C ${LINUXKERNEL_INSTALL_DIR} INSTALL_MOD_PATH=${DESTDIR} INSTALL_MOD_STRIP=${INSTALL_MOD_STRIP} M=`pwd` modules_install; \
-	cd ../encoder; \
-	make -C ${LINUXKERNEL_INSTALL_DIR} INSTALL_MOD_PATH=${DESTDIR} INSTALL_MOD_STRIP=${INSTALL_MOD_STRIP} M=`pwd` modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 2a44938..a698dd3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -55,7 +55,6 @@ SRC_URI = "\
     file://Makefile_ti-ipc \
     file://Makefile_jailhouse \
     file://Makefile_ti-img-rogue-driver \
-    file://Makefile_ti-img-encode-decode \
 "
 
 PR = "r104"
@@ -201,7 +200,6 @@ MAKEFILES_append_am65xx = " \
 
 MAKEFILES_append_j7 = " pru-icss \
                             ti-img-rogue-driver \
-                            ti-img-encode-decode \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.7.4


