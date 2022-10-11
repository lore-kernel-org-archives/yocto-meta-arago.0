Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAA1C43217
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:53:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.10862.1665510803312336931
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GS/4vJ24;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrM2u014487;
	Tue, 11 Oct 2022 12:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665510802;
	bh=xHnfmPrKkYH7l83nrmCBZU7Osi+K/kyYybyiK7zGmWo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GS/4vJ24YR5exAUlAcnxLRqYYib6w/0XzMFmi2Y983+lD02FU4zGIYMsqijb4jP7v
	 ACgePh2+UuCReQNlevv4l3xdNVehhRjGivAm7csxletzVgUk6CmJ22EotKczCjvOfz
	 R4EyxSBCC1RY/T2IHv90+XTyWJtqsK3jgp+BeyzY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHrM1S046342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:53:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:53:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:53:21 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrKFG089061;
	Tue, 11 Oct 2022 12:53:21 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 3/6] cmem: Remove
 Makefile_cmem-mod and cmem refrences
Date: Tue, 11 Oct 2022 12:53:17 -0500
Message-ID: <20221011175320.26843-4-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14069

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
index e3042974..52322a86 100644
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
index 6d1d8661..f8c07164 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -80,12 +80,10 @@ UTILS:append:dra7xx = " \
 
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
index 3e76a527..99a6cc82 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -62,7 +62,6 @@ ARAGO_TI_TEST:append:ti33x = " \
 
 ARAGO_TI_TEST:append:ti43x = " \
     omapconf \
-    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', 'cmem-test', d)} \
 "
 
 NOT_MAINLINE_MMIP_DEPS = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)}"
@@ -71,7 +70,6 @@ ARAGO_TI_TEST:append:omap-a15 = " \
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
index c47ae172..e47e0756 100644
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
2.37.3


