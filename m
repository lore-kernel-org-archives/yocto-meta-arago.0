Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0518C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 16:49:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.31191.1657558176478528676
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 09:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H46L9Uak;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26BGnZNQ116546;
	Mon, 11 Jul 2022 11:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657558175;
	bh=apP4iVDc3VR6OI/fXIlvkB8z4rMYuVWV8cLDLedcMH4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H46L9Uak258H5e+kIUTKM3nC2oN38vDKUzDUvbcJH12uQfr9uwKyFVolv+FpcgXj8
	 AEJ3vR3FiYpZH3MXZ6AZtbf3fhenbtyohgWJIUqP1F5rhwJJK4G1pSrTL64mfu9JG7
	 dx/fsVOxY/DC6D5gpPIs16mDlG44vLDL1o8jLtV8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26BGnZpo103002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Jul 2022 11:49:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Jul 2022 11:49:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Jul 2022 11:49:35 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26BGnXpr030722;
	Mon, 11 Jul 2022 11:49:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 3/3] cmem: Remove
 Makefile_cmem-mod and cmem refrences
Date: Mon, 11 Jul 2022 11:49:33 -0500
Message-ID: <20220711164933.21445-3-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711164933.21445-1-afd@ti.com>
References: <20220711164933.21445-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Jul 2022 16:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13944

The cmem allocator has been deprecated for removal for some time now.
Lets remove the kernel module first, then start removing projects
that have not migrated to DMA-BUF Heaps yet.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc  |  3 --
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  2 --
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  5 ---
 .../packagegroup-arago-tisdk-addons.bb        |  2 --
 .../recipes-core/packagegroups/ti-test.bb     |  2 --
 .../ti-tisdk-makefile/Makefile_cmem-mod       | 33 -------------------
 .../ti-tisdk-makefile_1.0.bb                  |  3 --
 7 files changed, 50 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index ffa76ed3..afce2fc8 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -169,9 +169,6 @@ CREATE_SRCIPK:pn-cryptodev-module ?= "1"
 SRCIPK_INSTALL_DIR:pn-cryptodev-module ?= "board-support/extra-drivers/cryptodev-module-${PV}"
 SRCIPK_PRESERVE_GIT:pn-cryptodev-module ?= "true"
 
-CREATE_SRCIPK:pn-cmem-mod ?= "1"
-SRCIPK_INSTALL_DIR:pn-cmem-mod ?= "board-support/extra-drivers/${PN}-${PV}"
-
 CREATE_SRCIPK:pn-debugss-module-drv ?= "1"
 SRCIPK_INSTALL_DIR:pn-debugss-module-drv ?= "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index eabec6c4..5083ebcb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -56,7 +56,6 @@ UTILS:append:am64xx = " \
 EXTRA_LIBS = ""
 
 EXTRA_LIBS:append:omap-a15 = " \
-    cmem-mod-source \
     uio-module-drv-source \
     big-data-ipc-demo-source \
 "
@@ -71,7 +70,6 @@ EXTRA_LIBS:append:ti33x = " \
 "
 
 EXTRA_LIBS:append:ti43x = " \
-    cmem-mod-source \
     uio-module-drv-source \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 43a043e1..e110fad8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -26,11 +26,6 @@ UTILS:append:k3 = "\
 "
 
 EXTRA_LIBS = ""
-EXTRA_LIBS:append:ti43x = "\
-    cmem-dev \
-    cmem-staticdev \
-"
-EXTRA_LIBS:append:omap-a15 = " cmem-dev"
 EXTRA_LIBS:append:dra7xx = " libulm-dev \
                              libulm-staticdev \
                              gdbserver-c6x-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 992549e6..e19180af 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -81,12 +81,10 @@ UTILS:append:dra7xx = " \
 
 EXTRA_LIBS = ""
 EXTRA_LIBS:append:omap-a15 = " \
-    cmem \
     uio-module-drv \
 "
 
 EXTRA_LIBS:append:ti43x = " \
-    cmem \
     uio-module-drv \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 07dbdf38..34048e2c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -63,7 +63,6 @@ ARAGO_TI_TEST:append:ti33x = " \
 
 ARAGO_TI_TEST:append:ti43x = " \
     omapconf \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', d)} \
 "
 
 NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
@@ -72,7 +71,6 @@ ARAGO_TI_TEST:append:omap-a15 = " \
     omapconf \
     ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
         ti-ipc-test \
-        cmem-test \
 	${NOT_MAINLINE_MMIP_DEPS} \
     ", d)} \
 "
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
deleted file mode 100644
index cbb86aa5..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
+++ /dev/null
@@ -1,33 +0,0 @@
-# CMEM module
-cmem-mod: linux
-	@echo ================================
-	@echo     Building CMEM Module
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
-	. $(ENV_SETUP); \
-	make -f lu.mak ARCH=__KERNEL_ARCH__ KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) module
-
-cmem-mod_clean:
-	@echo ================================
-	@echo     Cleaning CMEM Module
-	@echo ================================
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
-	. $(ENV_SETUP); \
-	make -f lu.mak ARCH=__KERNEL_ARCH__ KERNEL_INSTALL_DIR=$(LINUXKERNEL_INSTALL_DIR) modules_clean
-
-cmem-mod_install:
-	@echo ================================
-	@echo     Installing CMEM Module
-	@echo ================================
-	@if [ ! -d $(DESTDIR) ] ; then \
-	echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try again."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
-	. $(ENV_SETUP); \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=`pwd`/src/cmem/module INSTALL_MOD_PATH=$(DESTDIR) PREFIX=$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=$(INSTALL_MOD_STRIP) modules_install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 6737d7fd..610d255c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -31,7 +31,6 @@ SRC_URI = "\
     file://Makefile_dual-camera-demo \
     file://Makefile_image-gallery \
     file://Makefile_cryptodev \
-    file://Makefile_cmem-mod \
     file://Makefile_debugss-module-drv \
     file://Makefile_gdbserverproxy-module-drv \
     file://Makefile_ti-sgx-ddk-km \
@@ -89,7 +88,6 @@ MAKEFILES:append:ti43x = " u-boot-spl \
                            dual-camera-demo \
                            image-gallery \
                            ti-sgx-ddk-km \
-                           cmem-mod \
                            pru-icss \
                            uio-module-drv \
 			   mmwavegesture-hmi \
@@ -110,7 +108,6 @@ MAKEFILES:append:omap-a15 = " u-boot-spl \
                               omapconf \
                               linux-dtbs \
                               ti-sgx-ddk-km \
-                              cmem-mod \
                               pru-icss \
                               ti-gc320-driver \
                               barcode-roi \
-- 
2.36.1


