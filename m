Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B0BC43219
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:53:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.10717.1665510807024523475
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NSl86gRo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrMvt064642;
	Tue, 11 Oct 2022 12:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665510802;
	bh=8Vwf0xK23+4fgH9Q1nhJDuf53AFM/GtRPHzm5//ud1c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NSl86gRo+fMXw1Lf4O098xqlP9HeUhKKqxbmWXnIf/rvAAaI2Mun1EiMJlRorjZej
	 bVMzzrGuR/E0pyuzyXxvFiZEbe+fO6DfKuS6vVFgm+dLE39YspdnoQU4b/uhiBkTnb
	 lfR5YGiEAKMwc/8Yi/slVGMBbpsi9Y8VbNjI7wug=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHrMdl046353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:53:22 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:53:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:53:22 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHrKFH089061;
	Tue, 11 Oct 2022 12:53:21 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2 4/6] meta-arago: Remove
 remaining bits of ti-ocf-crypto-module
Date: Tue, 11 Oct 2022 12:53:18 -0500
Message-ID: <20221011175320.26843-5-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14074

This is not included in the SDK anymore, remove left over references.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc   |  3 ---
 .../Makefile_ti-ocf-crypto-module              | 18 ------------------
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb |  1 -
 3 files changed, 22 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index afce2fc8..00a86bb9 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -103,9 +103,6 @@ SRCIPK_INSTALL_DIR:pn-omapconf ?= "example-applications/${PN}-${PV}"
 CREATE_SRCIPK:pn-ti-pru-sw-examples ?= "1"
 SRCIPK_INSTALL_DIR:pn-ti-pru-sw-examples ?= "example-applications/pru-${PV}"
 
-CREATE_SRCIPK:pn-ti-ocf-crypto-module ?= "1"
-SRCIPK_INSTALL_DIR:pn-ti-ocf-crypto-module ?= "board-support/extra-drivers/${PN}-${PV}"
-
 CREATE_SRCIPK:pn-ti-compat-wireless-wl18xx ?= "1"
 SRCIPK_INSTALL_DIR:pn-ti-compat-wireless-wl18xx ?= "board-support/extra-drivers/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
deleted file mode 100644
index 04e37874..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
+++ /dev/null
@@ -1,18 +0,0 @@
-# ti-ocf-crypto-module components
-ti-ocf-crypto-module: linux
-	@echo ===================================
-	@echo    Building TI OCF Crypto Module
-	@echo ===================================
-	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "*ti-ocf-crypto-module*"`; make
-
-ti-ocf-crypto-module_clean:
-	@echo ===================================
-	@echo    Cleaning TI OCF Crypto Module
-	@echo ===================================
-	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "*ti-ocf-crypto-module*"`; make clean
-
-ti-ocf-crypto-module_install:
-	@echo =====================================
-	@echo    Installing TI OCF Crypto Module
-	@echo =====================================
-	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "*ti-ocf-crypto-module*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e47e0756..c4d8c408 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -24,7 +24,6 @@ SRC_URI = "\
     file://Makefile_matrix-gui-browser \
     file://Makefile_refresh-screen \
     file://Makefile_pru \
-    file://Makefile_ti-ocf-crypto-module \
     file://Makefile_qt-tstat \
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
-- 
2.37.3


