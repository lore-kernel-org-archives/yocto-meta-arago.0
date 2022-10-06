Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140F9C4321E
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 15:06:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.149.1665068794473749370
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 08:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iktNPRsG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 296F6TB5099031;
	Thu, 6 Oct 2022 10:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665068789;
	bh=6fpTj9UjCWBaP4YxksNAUdM+ITWRjg45B773PdFnzAA=;
	h=From:To:CC:Subject:Date;
	b=iktNPRsGgr0CLAvVfzKTk/LXn/FwEDMj77CiMrib6DFTcMEo/Wvoicbpoo33ja+p+
	 ZiZSZ7ptE2TXkLDGTUV4AjGAqVWxdG16XyxxdHd/IxroMvH1WehNmzld71rPBKmG0k
	 2eKzD7uajW2tskPqd7GArflolOm9ezimJMaZTAto=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 296F6ToH038863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Oct 2022 10:06:29 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 6 Oct
 2022 10:06:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 6 Oct 2022 10:06:28 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 296F6STV021833;
	Thu, 6 Oct 2022 10:06:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/7] ti-crypto-examples: Remove
 ti-crypto-examples
Date: Thu, 6 Oct 2022 10:06:22 -0500
Message-ID: <20221006150628.17044-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Oct 2022 15:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14056

These examples have not been updated in a long time and are not
correct anymore. Remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc  |  3 --
 .../packagegroup-arago-tisdk-crypto.bb        |  1 -
 .../Makefile_ti-crypto-examples               | 24 ---------------
 .../ti-tisdk-makefile_1.0.bb                  |  3 --
 .../ti-crypto-examples_git.bb                 | 30 -------------------
 5 files changed, 61 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
 delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index c03d5383..75355710 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -46,9 +46,6 @@ SRCIPK_INSTALL_DIR:pn-ti-tisdk-licenses ?= "docs/licenses"
 CREATE_SRCIPK:pn-matrix-gui ?= "1"
 SRCIPK_INSTALL_DIR:pn-matrix-gui ?= "example-applications/${PN}-${PV}"
 
-CREATE_SRCIPK:pn-ti-crypto-examples ?= "1"
-SRCIPK_INSTALL_DIR:pn-ti-crypto-examples ?= "example-applications/${PN}-${PV}"
-
 CREATE_SRCIPK:pn-qml-carinfo ?= "1"
 SRCIPK_INSTALL_DIR:pn-qml-carinfo ?= "example-applications/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index f217f7d8..d2189a50 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -13,7 +13,6 @@ CRYPTO_SUPPORT = "\
     openssl-engines \
 "
 
-#ti-crypto-examples
 CRYPTO_SUPPORT:append:ti33x = " cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT:append:ti43x = " cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT:append:dra7xx = " cryptodev-module cryptodev-tests"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
deleted file mode 100644
index 6ad07e9a..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
+++ /dev/null
@@ -1,24 +0,0 @@
-# ti-crypto-examples build targets
-ti-crypto-examples:
-	@echo =================================
-	@echo    Building TI Crypto Examples
-	@echo =================================
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make release
-
-ti-crypto-examples_clean:
-	@echo =================================
-	@echo    Cleaning TI Crypto Examples
-	@echo =================================
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make clean
-
-ti-crypto-examples_install:
-	@echo ===================================================
-	@echo   Installing TI Crypto Examples - Release version
-	@echo ===================================================
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install
-
-ti-crypto-examples_install_debug:
-	@echo =================================================
-	@echo   Installing TI Crypto Examples - Debug Version
-	@echo =================================================
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-crypto-examples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index b991351f..c47ae172 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -18,7 +18,6 @@ SRC_URI = "\
     file://Makefile_u-boot-legacy \
     file://Makefile_matrix-gui \
     file://Makefile_arm-benchmarks \
-    file://Makefile_ti-crypto-examples \
     file://Makefile_am-sysinfo \
     file://Makefile_av-examples \
     file://Makefile_u-boot-spl \
@@ -76,7 +75,6 @@ MAKEFILES = ""
 # Add device specific make targets
 
 MAKEFILES:append:ti33x = " u-boot-spl \
-                           ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
                            ti-sgx-ddk-km \
@@ -86,7 +84,6 @@ MAKEFILES:append:ti33x = " u-boot-spl \
                            pdm-anomaly-detection \
 "
 MAKEFILES:append:ti43x = " u-boot-spl \
-                           ti-crypto-examples \
                            linux-dtbs \
                            cryptodev \
                            dual-camera-demo \
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
deleted file mode 100644
index 10f14478..00000000
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "TI Cryptography Example Applications"
-HOMEPAGE = "https://git.ti.com/cgit/arago-project-org/crypto-example-apps/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
-SECTION = "console"
-DEPENDS += "openssl"
-
-PR = "r7"
-
-BRANCH ?= "master"
-SRCREV = "6f4b09fffe970bb6b448369875874e798ef282f6"
-
-SRC_URI = "git://git.ti.com/git/git/arago-project-org/crypto-example-apps.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    export CROSS_COMPILE=${TARGET_PREFIX}
-    export CFLAGS='${TARGET_CC_ARCH}'
-    # build the release version
-    oe_runmake release
-}
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-}
-
-python () {
-    raise bb.parse.SkipRecipe("skipping ti-crypto-examples")
-}
-- 
2.37.3


