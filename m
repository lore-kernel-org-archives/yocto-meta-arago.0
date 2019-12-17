Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AD7A0529D1
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 18:18:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHIGcrk112930
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 12:16:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576606599;
	bh=TaId/ueffMUEY0V+jaUpH13UC7KH7eNwuKJKklawi5w=;
	h=From:To:CC:Subject:Date;
	b=lFUL6Z+FBVm/FPDrNokcYZ8xxsPtfrAdZwTzVSK+Cz+08+R67ZoXu99uoc9ciepcT
	am0NsYu4wwCw3NdVdBiFmb+GmGJ5CHXRZR7a8u9EieR3rrZamD98CMzrde0x4upvBz
	UywmYK8qLJC5o4EtSCR1SWrpv8ovKkaFKn0cK5mA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHIGciL021710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 12:16:38 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 12:16:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 17 Dec 2019 12:16:38 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHIGcGu054299;
	Tue, 17 Dec 2019 12:16:38 -0600
From: Djordje Senicic <d-senicic1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Dec 2019 13:14:12 -0500
Message-ID: <20191217181412.10138-1-d-senicic1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [master/thud/ti2019.05][PATCH] neo-ai-dlr-demo: Add neo-ai-dlr-demo to example-applications
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
X-List-Received-Date: Tue, 17 Dec 2019 18:18:16 -0000
Content-Type: text/plain

- Add reduced size source package of neo-ai-dlr-demo, that is now included in example-applications
- neo-ai-dlr-demo is based on demos/cv/run_mobilenet_cv_mt.cc
- Include neo-ai-dlr-dev package, to enable top level makefile demo compilation, and compilation on target

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
---
Please apply this patch after http://patchwork.dal.design.ti.com/patch/51804/ is accepted.
Also please backport to ti2019.05.

 .../conf/distro/include/arago-source-ipk.inc  |  3 +++
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  1 +
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  1 +
 .../packagegroup-arago-tisdk-addons.bb        |  1 +
 .../Makefile_neo-ai-dlr-demo                  | 19 +++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  2 ++
 6 files changed, 27 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index c479a8c8..64fc5880 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -79,6 +79,9 @@ SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-pdm-anomaly-detection = "1"
 SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-neo-ai-dlr-demo = "1"
+SRCIPK_INSTALL_DIR_pn-neo-ai-dlr-demo = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-tiovx-app-host = "1"
 SRCIPK_INSTALL_DIR_pn-tiovx-app-host = "example-applications/${PN}-${PV}"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index fc11a175..87bcd279 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -102,6 +102,7 @@ EXTRA_PACKAGES = ""
 
 EXTRA_PACKAGES_append_omap-a15 = " \
     pdm-anomaly-detection-src \
+    neo-ai-dlr-demo-src \
 "
 
 EXTRA_PACKAGES_append_ti33x = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 7ba5143a..15503541 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -176,6 +176,7 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
+                                neo-ai-dlr-demo-dev \
 "
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library-dev \
                              ${ARMNN_PACKAGES} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 14b2370c..75e163bf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -171,6 +171,7 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    ${ARMNN_PACKAGES} \
                                    tensorflow-lite-examples \
                                    pdm-anomaly-detection \
+                                   neo-ai-dlr-demo \
 "
 
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo
new file mode 100644
index 00000000..60445f2a
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_neo-ai-dlr-demo
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
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 2468bb45..354cb163 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_ti-ipc \
     file://Makefile_jailhouse \
+    file://Makefile_neo-ai-dlr-demo \
 "
 
 PR = "r102"
@@ -140,6 +141,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               uio-module-drv \
 			      mmwavegesture-hmi \
                               pdm-anomaly-detection \
+                              neo-ai-dlr-demo \
                               ti-ipc \
 "
 MAKEFILES_append_omapl138 = " linux-dtbs \
-- 
2.17.1


