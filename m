Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 833BA520E4
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2019 19:24:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NJNIOZ020523
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 14:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569266598;
	bh=RSbXdoohhgLhrzRc21Bz+GFiHuEX8ACMTuwf0TitupM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=saVNiIXCa23Osip+nL820SDCrt+96u1mjnVKVp1tbnLSEM3oBwFG2rOBC4MZ+Q70Y
	SHtldmsxeY0k8XcLabaPN9r9HDwDo3ivQCQ/jFHDAd9s6fc3oXrbp4ZNV0N+xoHXyr
	1lQMqYrprbW2kl5OGrsHabFXloOGDmGs3LRtmHNI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NJNIm2092263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 14:23:18 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 14:23:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 14:23:18 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NJMxqA033647;
	Mon, 23 Sep 2019 14:23:17 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Sep 2019 15:21:21 -0400
Message-ID: <20190923192121.29814-4-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923192121.29814-1-a0271529@ti.com>
References: <20190923192121.29814-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>, d-senicic1@ti.com
Subject: [master/thud/ti2019.03 4/4] ti-tisdk-makefile: include source for tiovx-app-host and add it to the top-level makefile
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
X-List-Received-Date: Mon, 23 Sep 2019 19:24:27 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/arago-source-ipk.inc  |  3 ++
 .../ti-tisdk-makefile/Makefile_tiovx-app-host | 34 +++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  4 ++-
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 6e56c771..aa9638f8 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -79,6 +79,9 @@ SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-pdm-anomaly-detection = "1"
 SRCIPK_INSTALL_DIR_pn-pdm-anomaly-detection = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-tiovx-app-host = "1"
+SRCIPK_INSTALL_DIR_pn-tiovx-app-host = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-image-gallery = "1"
 SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host
new file mode 100644
index 00000000..f25472d3
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host
@@ -0,0 +1,34 @@
+# tiovx-app-host build targets
+tiovx-app-host:
+	@echo =====================================
+	@echo     Building TIOVX Host Application
+	@echo =====================================
+	@cd example-applications; cd `find . -name "*tiovx-app-host*"`; . $(ENV_SETUP); make \
+		TARGET_ROOTDIR=$(SDK_PATH_TARGET) \
+		GCCLINARO=$(LINUX_DEVKIT_PATH)/sysroots/x86_64-arago-linux/usr \
+		TIOVXPATH=$(SDK_PATH_TARGET)/usr/include/VX \
+		IPCPATH=$(SDK_PATH_TARGET)/usr/share/ti/ti-ipc-tree \
+		SDKPLATFORMIFPATH=$(SDK_PATH_TARGET)/usr/share/ti/ti-tiovx-lib-tree/sys-iface \
+		PROC_LIST='host khronos_example'
+
+tiovx-app-host_install:
+	@echo =======================================
+	@echo     Installing TIOVX Host Application
+	@echo =======================================
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@cd example-applications; \
+	cd `find . -name "*tiovx-app-host*"`; \
+	install -m 0755 host/bin/debug/app_host $(DESTDIR)/usr/bin/tiovx-app_host; \
+	install -m 0755 khronos_example/bin/debug/opticalflow $(DESTDIR)/usr/bin/tiovx-opticalflow
+
+tiovx-app-host_clean:
+	@echo =======================================
+	@echo     Cleaning TIOVX Host Application
+	@echo =======================================
+	@cd example-applications; cd `find . -name "*tiovx-app-host*"`; . $(ENV_SETUP); \
+	make PROC_LIST='host khronos_example' clean
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 417b28b6..80ec54ea 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -51,11 +51,12 @@ SRC_URI = "\
     file://Makefile_sysfw-image \
     file://Makefile_mmwavegesture-hmi \
     file://Makefile_pdm-anomaly-detection \
+    file://Makefile_tiovx-app-host \
     file://Makefile_ti-ipc \
     file://Makefile_jailhouse \
 "
 
-PR = "r101"
+PR = "r102"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -124,6 +125,7 @@ MAKEFILES_append_dra7xx = " cryptodev \
                             openmpacc-examples \
                             qt-opencv-opencl-opengl-multithreaded \
                             linalg-examples \
+                            tiovx-app-host \
 "
 
 MAKEFILES_append_omap-a15 = " u-boot-spl \
-- 
2.17.1


