Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8EDFF52A89
	for <meta-arago@arago-project.org>;
	Thu, 29 May 2014 18:38:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4TIcOvr030667
	for <meta-arago@arago-project.org>; Thu, 29 May 2014 13:38:25 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TIcO7u025476
	for <meta-arago@arago-project.org>; Thu, 29 May 2014 13:38:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 29 May 2014 13:38:24 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TIcGgL022027;
	Thu, 29 May 2014 13:38:23 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 May 2014 13:38:07 -0500
Message-ID: <1401388695-30526-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1401388695-30526-1-git-send-email-fcooper@ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/11] ti-tisdk-makefile: Update Qt Makefile stubs to reflect Makefile name change
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
X-List-Received-Date: Thu, 29 May 2014 18:38:26 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_dual-camera-demo    |    8 ++++----
 .../ti-tisdk-makefile/Makefile_matrix-gui-browser  |    8 ++++----
 .../ti-tisdk-makefile/Makefile_qt-tstat            |    8 ++++----
 .../ti-tisdk-makefile/Makefile_quick-playground    |    8 ++++----
 .../ti-tisdk-makefile/Makefile_refresh-screen      |    8 ++++----
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 6 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
index 5a1475e..bd99075 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
@@ -3,22 +3,22 @@ dual-camera-demo:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build
 
 dual-camera-demo_clean:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make clean
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build clean
 
 dual-camera-demo_install:
 	@echo ===================================================
 	@echo   Installing Dual Camera Demo - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make install
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install
 
 dual-camera-demo_install_debug:
 	@echo =================================================
 	@echo   Installing Dual Camera Demo - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make install_debug
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
index eb60e4f..2fc3b21 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
@@ -3,22 +3,22 @@ matrix-gui-browser:
 	@echo =================================
 	@echo    Building Matrix GUI Browser
 	@echo =================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make release
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build release
 
 matrix-gui-browser_clean:
 	@echo =================================
 	@echo    Cleaning Matrix GUI Browser
 	@echo =================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make clean
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build clean
 
 matrix-gui-browser_install:
 	@echo ===================================================
 	@echo   Installing Matrix GUI Browser - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make install
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install
 
 matrix-gui-browser_install_debug:
 	@echo =================================================
 	@echo   Installing Matrix GUI Browser - Debug Version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make install_debug
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
index 36d7ef5..857e058 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
@@ -3,22 +3,22 @@ qt-tstat:
 	@echo ================================
 	@echo    Building QT Thermostat App
 	@echo ================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make release
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build release
 
 qt-tstat_clean:
 	@echo ================================
 	@echo    Cleaning QT Thermostat App
 	@echo ================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make clean
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build clean
 
 qt-tstat_install:
 	@echo ===================================================
 	@echo   Installing QT Thermostat App - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make install
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install
 
 qt-tstat_install_debug:
 	@echo =================================================
 	@echo   Installing QT Thermostat App - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make install_debug
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
index a87471b..b8b7c51 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
@@ -3,22 +3,22 @@ quick-playground:
 	@echo =================================
 	@echo    Building Quick Playground App
 	@echo =================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build
 
 quick-playground_clean:
 	@echo =================================
 	@echo    Cleaning Quick Playground App
 	@echo =================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make clean
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build clean
 
 quick-playground_install:
 	@echo ====================================================
 	@echo   Installing Quick Playground App - Release version
 	@echo ====================================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make install
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install
 
 quick-playground_install_debug:
 	@echo ==================================================
 	@echo   Installing Quick Playground App - Debug version
 	@echo ==================================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make install_debug
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
index 6d8f203..bcc17fa 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
@@ -3,22 +3,22 @@ refresh-screen:
 	@echo =============================
 	@echo    Building Refresh Screen
 	@echo =============================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make release
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build release
 
 refresh-screen_clean:
 	@echo =============================
 	@echo    Cleaning Refresh Screen
 	@echo =============================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make clean
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build clean
 
 refresh-screen_install:
 	@echo ================================================
 	@echo   Installing Refresh Screen - Release version
 	@echo ================================================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make install
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install
 
 refresh-screen_install_debug:
 	@echo ==============================================
 	@echo   Installing Refresh Screen - Debug Version
 	@echo ==============================================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make install_debug
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 0817e4e..4d8c486 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -35,7 +35,7 @@ SRC_URI = "\
     file://Makefile_cryptodev \
 "
 
-PR = "r31"
+PR = "r32"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


