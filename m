Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D72B65298E
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 16:57:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OGvSqW026556
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 10:57:28 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OGvSCh008430
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 10:57:28 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 10:57:27 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OGvMEP021471;
	Fri, 24 Jan 2014 10:57:26 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jan 2014 12:21:37 -0600
Message-ID: <1390587699-26905-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1390587699-26905-1-git-send-email-fcooper@ti.com>
References: <1390587699-26905-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] ti-tisdk-makefile: Add dual camera demo to Makefile
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
X-List-Received-Date: Fri, 24 Jan 2014 16:57:29 -0000
Content-Type: text/plain

---
 .../ti-tisdk-makefile/Makefile_dual-camera-demo    |   24 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
new file mode 100644
index 0000000..a682d59
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
@@ -0,0 +1,24 @@
+# QT Dual Camera build targets
+dual-camera:
+	@echo ================================
+	@echo    Building Dual Camera Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build release
+
+dual-camera_clean:
+	@echo ================================
+	@echo    Building Dual Camera Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build clean
+
+dual-camera_install:
+	@echo ===================================================
+	@echo   Installing Dual Camera Demo - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install
+
+dual-camera_install_debug:
+	@echo =================================================
+	@echo   Installing Dual Camera Demo - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index ada51b5..30c2901 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -31,9 +31,10 @@ SRC_URI = "\
     file://Makefile_wireless \
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
+    file://Makefile_dual-camera-demo \
 "
 
-PR = "r24"
+PR = "r25"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -71,6 +72,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            ti-crypto-examples \
                            linux-dtbs \
                            wireless \
+                           dual-camera-demo \
 "
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
-- 
1.7.0.4


