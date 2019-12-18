Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B6866529EC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 17:52:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoP7k032153
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576691425;
	bh=Wh21DixFqyMLq/i2d25DOFiEjnhTvZjDCYYPthAXmh4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I+VIO6D47hnq9hk10pu5/E5v0i/yjPOKZbqxYGXoL40CFLZjCllnhYJOHYACC6DSj
	Ob1tKQJAqey6X2p0GQzKYehVoJcVJ6wiG8y9rYA+DpTKHwZw/jM9Tl8msonWc2qF1o
	bwYBSVx+g5HFEjRdzvP3Sk1yX/kB/m7hvxnJtt6A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIHoP9J110765
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 11:50:25 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 11:50:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 11:50:25 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIHoNfp112296;
	Wed, 18 Dec 2019 11:50:25 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 12:31:14 -0500
Message-ID: <1576690275-13499-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
References: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: [meta-processor-sdk][PATCH 4/5] ti-tisdk-makefile: add taret for neo-ai-dlr-demo
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
X-List-Received-Date: Wed, 18 Dec 2019 17:52:04 -0000
Content-Type: text/plain

* Only add for machines with mmip feature.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_neo-ai-dlr-demo        | 19 +++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend  |  9 +++++----
 2 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo
new file mode 100644
index 0000000..60445f2
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo
@@ -0,0 +1,19 @@
+# neo-ai-dlr-demo build targets
+neo-ai-dlr-demo:
+	@echo =============================
+	@echo    Building NEO-AI-DLR Demo
+	@echo =============================
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*neo-ai-dlr-demo*"`; make -f Makefile.build
+
+neo-ai-dlr-demo_clean:
+	@echo =============================
+	@echo    Cleaning NEO-AI-DLR Demo
+	@echo =============================
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*neo-ai-dlr-demo*"`; make -f Makefile.build clean
+
+neo-ai-dlr-demo_install:
+	@echo ================================================
+	@echo   Installing NEO-AI-DLR Demo
+	@echo ================================================
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*neo-ai-dlr-demo*"`; make -f Makefile.build install
+
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 4fb8a16..b7d3365 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk68"
+PR_append = ".tisdk69"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -9,6 +9,7 @@ SRC_URI_append = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_tidl-examples \
     file://Makefile_pru-adc \
+    file://Makefile_neo-ai-dlr-demo \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -25,9 +26,7 @@ MAKEFILES_append_omap-a15 = " dual-camera-demo \
                               image-gallery \
                               big-data-ipc-demo \
 			      evse-hmi \
-"
-
-MAKEFILES_append_omap-a15 = " video-graphics-test \
+                              video-graphics-test \
 "
 
 MAKEFILES_append_ti43x = " evse-hmi \
@@ -49,6 +48,8 @@ MAKEFILES_append_am57xx-hs-evm = " tidl-examples"
 
 MAKEFILES_append_dra7xx = " tiovx-app-host"
 
+MAKEFILES_append = " ${@bb.utils.contains('MACHINE_FEATURES','mmip','neo-ai-dlr-demo','',d)}"
+
 MAKEFILES_remove_ti33x = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)}"
 MAKEFILES_remove_ti43x = "${@bb.utils.contains('MACHINE_FEATURES', 'gpu', '', 'ti-sgx-ddk-km', d)}"
 
-- 
2.7.4


