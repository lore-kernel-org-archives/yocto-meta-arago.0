Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CB046520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 20:12:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62KBv3I117303
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 15:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562098317;
	bh=KaVfOBGCDxXtqmcPbJbL5sgcsICvIOKydAMj/Bhu8+M=;
	h=From:To:CC:Subject:Date;
	b=HaKRUTeoE/8PjgcVbNWWWjtSCW1HU22gu1H75ohCGI6WMCMd45QjQ2K8i6QfKThuY
	f9mFykxLnsbxBpQxeuAlc/PknPrWMeZOP81paNWXWcUDk0WuYmaLe6LScdiRsr+ILi
	wFcGS9QEAJVSYMZ1CGKAxOctCav2FQLOMsOpP0lE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62KBvs4007684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 15:11:57 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 15:11:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 15:11:57 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62KBuZR032493;
	Tue, 2 Jul 2019 15:11:56 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2019 15:55:15 -0400
Message-ID: <1562097315-23016-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-makefile: sysfw-image: update target to match filename and recipe
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
X-List-Received-Date: Tue, 02 Jul 2019 20:12:43 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image        | 6 +++---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
index 93c0a01..46c9129 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -1,19 +1,19 @@
 
 # Depend on linux-dtbs for the dtc utility
-system-firmware-image: linux-dtbs
+sysfw-image: linux-dtbs
 	@echo =============================
 	@echo    Building SYSFW Image
 	@echo =============================
 	@cd board-support; cd `find . -name "*system-firmware-image*"`; \
 		make SYSFW_DL_URL="" SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/ti-sci-firmware-am65x-gp.bin CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
 
-system-firmware-image_clean:
+sysfw-image_clean:
 	@echo =============================
 	@echo    Cleaning SYSFW Image
 	@echo =============================
 	@cd board-support; cd `find . -name "*system-firmware-image*"`; make clean
 
-system-firmware-image_install:
+sysfw-image_install:
 	@echo =============================
 	@echo   Installing SYSFW Image
 	@echo =============================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 25befc0..87f7150 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,7 +54,7 @@ SRC_URI = "\
     file://Makefile_pdm-anomaly-detection \
 "
 
-PR = "r95"
+PR = "r96"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4


