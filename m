Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id BDF295297F
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 17:42:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86HgIOo014376
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 12:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504719738;
	bh=3/4H0QjJpJrVy6o1gvo0pH5yxwROZJ7Pfs8Y6Y4FYA4=;
	h=From:To:CC:Subject:Date;
	b=rFED84iUHnAf5f7RxXEwzf03Lsp4iiFXzmXkiHIb4zFneAlTu74H9i09oWyx7aA8W
	0tI+yunLDagTphU/VIvfM93pfufGeWYzmrMV3OYVRTrWN1RDJOPUx6bJFJLMhzIUlD
	8as2AU8pQW51qGUlGzIjdbbRWtSqLacQsUlyJr94=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86HgIKI025117
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 12:42:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 12:42:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 12:42:18 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86HgI7Q008535;
	Wed, 6 Sep 2017 12:42:18 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpeLC-0008Q3-1u; Wed, 06 Sep 2017 12:42:18 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Sep 2017 12:42:16 -0500
Message-ID: <20170906174216.32327-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2] ti-tisdk-makefile : Add evse-hmi and protection-relays-hmi Makefile
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
X-List-Received-Date: Wed, 06 Sep 2017 17:42:19 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../ti-tisdk-makefile/Makefile_evse-hmi            | 24 ++++++++++++++++++++++
 .../Makefile_protection-relays-hmi                 | 24 ++++++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bbappend                 | 11 +++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi
new file mode 100644
index 0000000..b19e630
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_evse-hmi
@@ -0,0 +1,24 @@
+# Evse HMI build targets
+evse-hmi:
+	@echo ================================
+	@echo    Building Evse HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*evse-hmi*"`; make -f Makefile.build
+
+evse-hmi_clean:
+	@echo ================================
+	@echo    Building Evse HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*evse-hmi*"`; make -f Makefile.build clean
+
+evse-hmi_install:
+	@echo ===================================================
+	@echo   Installing Evse HMI Demo - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*evse-hmi*"`; make -f Makefile.build install
+
+evse-hmi_install_debug:
+	@echo =================================================
+	@echo   Installing Evse HMI Demo - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*evse-hmi*"`; make -f Makefile.build install_debug
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi
new file mode 100644
index 0000000..04f434f
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_protection-relays-hmi
@@ -0,0 +1,24 @@
+#Protection Relays HMI build targets
+protection-relays-hmi:
+	@echo ================================
+	@echo    Building Protection Relays HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*protection-relays-hmi*"`; make -f Makefile.build
+
+protection-relays-hmi_clean:
+	@echo ================================
+	@echo    Building Protection Relays HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*protection-relays-hmi*"`; make -f Makefile.build clean
+
+protection-relays-hmi_install:
+	@echo ===================================================
+	@echo   Installing Protection Relays HMI Demo - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*protection-relays-hmi*"`; make -f Makefile.build install
+
+protection-relays-hmi_install_debug:
+	@echo =================================================
+	@echo   Installing Protection Relays HMI Demo - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*protection-relays-hmi*"`; make -f Makefile.build install_debug
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 68d11c6..b56c12e 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -6,6 +6,8 @@ SRC_URI_append = "\
     file://Makefile_ti-ipc \
     file://Makefile_video-graphics-test \
     file://Makefile_jailhouse \
+    file://Makefile_evse-hmi \
+    file://Makefile_protection-relays-hmi \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -22,6 +24,7 @@ MAKEFILES_append_omap-a15 = " dual-camera-demo \
                               image-gallery \
                               ti-ipc \
                               big-data-ipc-demo \
+			      evse-hmi \
 "
 
 MAKEFILES_append_omapl138 = " ti-ipc \
@@ -33,7 +36,13 @@ MAKEFILES_remove_omapl138 = "u-boot-legacy"
 
 MAKEFILES_append_omap-a15 = " video-graphics-test"
 
-MAKEFILES_append_ti43x = " cmem-mod"
+MAKEFILES_append_ti43x = " cmem-mod \
+			   evse-hmi \
+"
+
+MAKEFILES_append_ti33x = " evse-hmi \
+			   protection-relays-hmi \
+"
 
 MAKEFILES_append_am57xx-evm = " jailhouse"
 
-- 
2.13.0


