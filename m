Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9EBE2529B2
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 21:11:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3LBlf7102568
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 15:11:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543871507;
	bh=PZKAiN20oZ/xBex1S7FLVAYSokTV+jp+7rsmfBOkMyI=;
	h=From:To:CC:Subject:Date;
	b=Hm7xbPl45MR3PUNay9EAhEs+J+Pb9xr/fNbVXNTFqjmIdnQydGuxp3VRcCV06iE/9
	rANVGwEfdTzATa7GVsy+oKUhWvwhLvveq8rGC2fOlMd39kYPC6Xj59u85/BiynbCFV
	ExbNpThN8NcKCb440+Nea1PlP5N15z2bLPlBtaMs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3LBlfh041323
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 15:11:47 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 15:11:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 15:11:47 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3LBlxq029010;
	Mon, 3 Dec 2018 15:11:47 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTvVK-0007Kz-Ug; Mon, 03 Dec 2018 15:11:47 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 15:11:44 -0600
Message-ID: <20181203211144.28169-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][rocko][PATCH v1] recipes-tisdk : Add recipe to build mmwavegesture-hmi application
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
X-List-Received-Date: Mon, 03 Dec 2018 21:11:59 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../ti-tisdk-makefile/Makefile_mmwavegesture-hmi   | 24 ++++++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 | 11 ++++++++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
new file mode 100644
index 0000000..f575625
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
@@ -0,0 +1,24 @@
+# mmWave Gesture HMI build targets
+mmwavegesture-hmi:
+	@echo ================================
+	@echo    Building mmWave Gesture HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build
+
+mmwavegesture-hmi_clean:
+	@echo ================================
+	@echo    Building mmWave Gesture HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build clean
+
+mmwavegesture-hmi_install:
+	@echo ===================================================
+	@echo   Installing mmWave Gesture HMI Demo - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build install
+
+mmwavegesture-hmi_install_debug:
+	@echo =================================================
+	@echo   Installing mmWave Gesture HMI Demo - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build install_debug
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 70289a8..8723eba 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -7,6 +7,7 @@ SRC_URI_append = "\
     file://Makefile_video-graphics-test \
     file://Makefile_jailhouse \
     file://Makefile_evse-hmi \
+    file://Makefile_mmwavegesture-hmi \
     file://Makefile_protection-relays-hmi \
     file://Makefile_tiovx-app-host \
     file://Makefile_tidl-examples \
@@ -29,6 +30,7 @@ MAKEFILES_append_omap-a15 = " dual-camera-demo \
                               ti-ipc \
                               big-data-ipc-demo \
 			      evse-hmi \
+			      mmwavegesture-hmi \
 "
 
 MAKEFILES_append_omapl138 = " ti-ipc \
@@ -40,13 +42,18 @@ MAKEFILES_remove_omapl138 = "u-boot-legacy"
 
 MAKEFILES_append_omap-a15 = " video-graphics-test"
 
-MAKEFILES_append_ti43x = " evse-hmi"
+MAKEFILES_append_ti43x = " evse-hmi \
+			   mmwavegesture-hmi \"
 
 MAKEFILES_append_ti33x = " evse-hmi \
+			   mmwavegesture-hmi \
 			   protection-relays-hmi \
 "
 
-MAKEFILES_append_k3 = " evse-hmi"
+MAKEFILES_append_k3 = " evse-hmi \
+			mmwavegesture-hmi \
+"
+
 
 MAKEFILES_append_am335x-evm = " pru-adc"
 
-- 
2.13.0


