Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49800C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:53:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10598.1665510807472349716
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iVvPNo7d;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrNDt064646;
	Tue, 11 Oct 2022 12:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665510803;
	bh=8jHNTZQiNeMwBl3L5OQmfxYWcnYVoB7k2z0ya7jl12g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iVvPNo7dvjDV+B08Cl8+/WGi79wegAx9N6uG9/sCb0MwC622PfR1ZNlbvS4zXpLGT
	 cWop5dAeY/X80U89iusjm+RPBW7Hh8NWTvFc8tlGaOZ9xn9n2dQrZfsX7yXEqKa4D9
	 coqsI52YAdGjZ4K5ZP4BVMJoYJuaY6KDi4tIbOY0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHrNJS031798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:53:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:53:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:53:22 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrKFJ089061;
	Tue, 11 Oct 2022 12:53:22 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 6/6] ti-tisdk: Remove
 uio-module-drv kernel module
Date: Tue, 11 Oct 2022 12:53:20 -0500
Message-ID: <20221011175320.26843-7-afd@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011175320.26843-1-afd@ti.com>
References: <20221011175320.26843-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 17:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14075

UIO drivers are generally frowned upon and were only used here for some
K2 devices and PRUs before RPMSG. With these uses finally gone, lets
remove this out-of-tree module.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc  |  3 --
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  9 ------
 .../packagegroup-arago-tisdk-addons.bb        | 20 -------------
 .../ti-tisdk-makefile/Makefile_uio-module-drv | 28 -------------------
 .../ti-tisdk-makefile_1.0.bb                  |  4 ---
 5 files changed, 64 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index a709fd00..5e5aad48 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -334,9 +334,6 @@ SRCIPK_INSTALL_DIR:pn-boot-monitor ?= "board-support/${PN}-${PV}"
 CREATE_SRCIPK:pn-hplib-mod ?= "1"
 SRCIPK_INSTALL_DIR:pn-hplib-mod ?= "board-support/extra-drivers/${PN}-${PV}"
 
-CREATE_SRCIPK:pn-uio-module-drv ?= "1"
-SRCIPK_INSTALL_DIR:pn-uio-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"
-
 CREATE_SRCIPK:pn-pru-icss ?= "1"
 SRCIPK_INSTALL_DIR:pn-pru-icss ?= "example-applications/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 1814137b..9efc2cae 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -50,7 +50,6 @@ UTILS:append:am64xx = " \
 EXTRA_LIBS = ""
 
 EXTRA_LIBS:append:omap-a15 = " \
-    uio-module-drv-source \
     big-data-ipc-demo-source \
 "
 
@@ -59,14 +58,6 @@ EXTRA_LIBS:append:omap-a15 = " \
 #    gdbserverproxy-module-drv-source \
 #"
 
-EXTRA_LIBS:append:ti33x = " \
-    uio-module-drv-source \
-"
-
-EXTRA_LIBS:append:ti43x = " \
-    uio-module-drv-source \
-"
-
 PDM_ANOMALY_PKG_SRC = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'pdm-anomaly-detection-source', '', d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f8c07164..f4e72a89 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -34,16 +34,12 @@ UTILS_DSP = " \
 UTILS:append:ti33x = " mmc-utils \
                        switch-config \
                        pru-icss \
-                       uio-module-drv-test \
-                       uio-test-pruss \
 "
 
 UTILS:append:ti43x = " mmc-utils \
                        switch-config \
                        libdrm-omap \
                        pru-icss \
-                       uio-module-drv-test \
-                       uio-test-pruss \
 "
 
 UTILS:append:omap-a15 = " mmc-utils \
@@ -51,8 +47,6 @@ UTILS:append:omap-a15 = " mmc-utils \
                           libdrm-omap \
                           pru-icss \
                           ti-ipc-rtos-fw \
-                          uio-test-pruss \
-                          uio-module-drv-test \
 "
 
 UTILS:append:k3 = " mmc-utils \
@@ -78,19 +72,6 @@ UTILS:append:dra7xx = " \
                         ${@bb.utils.contains('MACHINE_FEATURES','gpu','glsdk-example-apps','',d)} \
 "
 
-EXTRA_LIBS = ""
-EXTRA_LIBS:append:omap-a15 = " \
-    uio-module-drv \
-"
-
-EXTRA_LIBS:append:ti43x = " \
-    uio-module-drv \
-"
-
-EXTRA_LIBS:append:ti33x = " \
-    uio-module-drv \
-"
-
 EXTRA_PACKAGES = " \
     nodejs \
     nodejs-npm \
@@ -118,7 +99,6 @@ EXTRA_PACKAGES:append:omap-a15 = " \
 RDEPENDS:${PN} = "\
     ${UTILS} \
     ${UTILS_UBOOT_FW} \
-    ${EXTRA_LIBS} \
 "
 
 RDEPENDS:${PN}-extra = "\
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
deleted file mode 100644
index 544e0eb8..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
+++ /dev/null
@@ -1,28 +0,0 @@
-uio-module-drv: linux
-	@echo ================================
-	@echo      Building uio-module-drv
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
-	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)
-
-uio-module-drv_clean:
-	@echo ================================
-	@echo      Cleaning uio-module-drv
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
-	make ARCH=__KERNEL_ARCH__ KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR) clean
-
-uio-module-drv_install:
-	@echo ================================
-	@echo      Installing uio-module-drv
-	@echo ================================
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try again."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
-	make ARCH=__KERNEL_ARCH__  KERNEL_SRC=$(LINUXKERNEL_INSTALL_DIR)  INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index c4d8c408..68d0f458 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,6 @@ SRC_URI = "\
     file://Makefile_opencl-examples \
     file://Makefile_boot-monitor \
     file://Makefile_hplib-mod \
-    file://Makefile_uio-module-drv \
     file://Makefile_pru-icss \
     file://Makefile_qt-opencv-opencl-opengl-multithreaded \
     file://Makefile_openmpacc-examples \
@@ -77,7 +76,6 @@ MAKEFILES:append:ti33x = " u-boot-spl \
                            cryptodev \
                            ti-sgx-ddk-km \
                            pru-icss \
-                           uio-module-drv \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
 "
@@ -88,7 +86,6 @@ MAKEFILES:append:ti43x = " u-boot-spl \
                            image-gallery \
                            ti-sgx-ddk-km \
                            pru-icss \
-                           uio-module-drv \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
 "
@@ -110,7 +107,6 @@ MAKEFILES:append:omap-a15 = " u-boot-spl \
                               pru-icss \
                               ti-gc320-driver \
                               barcode-roi \
-                              uio-module-drv \
 			      mmwavegesture-hmi \
                               pdm-anomaly-detection \
                               ti-ipc \
-- 
2.37.3


