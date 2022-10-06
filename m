Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A153C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 15:06:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.147.1665068791556979966
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 08:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nYIOTDc1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 296F6UU0058623;
	Thu, 6 Oct 2022 10:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665068790;
	bh=8Vwf0xK23+4fgH9Q1nhJDuf53AFM/GtRPHzm5//ud1c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nYIOTDc16a2T/omrIYnIT/RDeVPr0TtnnIKgpScfBzOoabvYZoOP1Cx8ouVI1adTc
	 YI3bart7jMiNpwmuIGlZFIXarXm3SU92yie0hotgGI0IhypAgUzl0vsEc9q36hm5TN
	 achJBt8ZgFwwuQj6skpL/drQTKyUJfiePXd+4iZk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 296F6U5M038876
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Oct 2022 10:06:30 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 6 Oct
 2022 10:06:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 6 Oct 2022 10:06:29 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 296F6STY021833;
	Thu, 6 Oct 2022 10:06:29 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 4/7] meta-arago: Remove
 remaining bits of ti-ocf-crypto-module
Date: Thu, 6 Oct 2022 10:06:25 -0500
Message-ID: <20221006150628.17044-4-afd@ti.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006150628.17044-1-afd@ti.com>
References: <20221006150628.17044-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Oct 2022 15:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14052

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


