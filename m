Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7C3CB529FD
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 19:26:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ3bB092595
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559589963;
	bh=AV/HfoEG52rvh80Ll3xA4QxfY7z1gjush/8uzATZuhk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uUMLkm/wWpjongBnEyUfhPp/UodaV9/htoyMidnU+gJ5/xCSP+c4aJFfejFZNUWda
	kQvc/a04ahJWHcblLPqujuMrfKQAxZm9UumFWwOFa1eZg3y3CXA2U9zYB9lIlUD80K
	JLTNgZCefGnVSyz/QLkqBlzWQRTSlcrsmpUkkKjE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53JQ21O107770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:02 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 14:26:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 14:26:02 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ0cB100439;
	Mon, 3 Jun 2019 14:26:02 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 15:24:24 -0400
Message-ID: <20190603192424.23922-7-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603192424.23922-1-h-gou@ti.com>
References: <20190603192424.23922-1-h-gou@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 6/6] ti-tisdk-makefile: add pdm-anomaly-detection
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
X-List-Received-Date: Mon, 03 Jun 2019 19:26:44 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../Makefile_pdm-anomaly-detection            | 24 +++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  7 +++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
new file mode 100644
index 00000000..a972c9d4
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
@@ -0,0 +1,24 @@
+# PdM Anomaly Detection build targets
+pdm-anomaly-detection:
+	@echo ======================================
+	@echo    Building PdM Anomaly Detection Demo
+	@echo ======================================
+	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build
+
+pdm-anomaly-detection_clean:
+	@echo ======================================
+	@echo    Building PdM Anomaly Detection Demo
+	@echo ======================================
+	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build clean
+
+pdm-anomaly-detection_install:
+	@echo =========================================================
+	@echo   Installing PdM Anomaly Detection Demo - Release version
+	@echo =========================================================
+	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build install
+
+pdm-anomaly-detection_install_debug:
+	@echo =======================================================
+	@echo   Installing PdM Anomaly Detection Demo - Debug version
+	@echo =======================================================
+	@cd example-applications; cd `find . -maxdepth 1 -name "*pdm-anomaly-detection*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 1d6d2759..e0d409a2 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -51,9 +51,10 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
     file://Makefile_sysfw-image \
     file://Makefile_mmwavegesture-hmi \
+    file://Makefile_pdm-anomaly-detection \
 "
 
-PR = "r94"
+PR = "r95"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -96,6 +97,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            barcode-roi \
                            uio-module-drv \
 			   mmwavegesture-hmi \
+                           pdm-anomaly-detection \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -110,6 +112,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            barcode-roi \
                            uio-module-drv \
 			   mmwavegesture-hmi \
+                           pdm-anomaly-detection \
 "
 
 #                            debugss-module-drv 
@@ -132,6 +135,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               barcode-roi \
                               uio-module-drv \
 			      mmwavegesture-hmi \
+                              pdm-anomaly-detection \
 "
 MAKEFILES_append_omapl138 = " linux-dtbs \
                               u-boot-spl \
@@ -178,6 +182,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         pru-icss \
                         sysfw-image \
 			mmwavegesture-hmi \
+                        pdm-anomaly-detection \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.17.1


