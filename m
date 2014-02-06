Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 00A9052AB8
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 14:06:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16E64Aa023914
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:06:04 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E64o7023530
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:06:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 08:06:04 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5p5W011240;
	Thu, 6 Feb 2014 08:06:02 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 09:34:47 -0600
Message-ID: <1391700887-26166-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391700887-26166-1-git-send-email-fcooper@ti.com>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/5] ti-tisdk-makefile: Update Makefile stubs
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 14:06:05 -0000
Content-Type: text/plain

* Various recipes have been updated to pull in the latest makefile changes.
* Update makefile stubs to reflect these changes.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_dual-camera-demo    |    8 ++++----
 .../ti-tisdk-makefile/Makefile_matrix-gui-browser  |    8 ++++----
 .../ti-tisdk-makefile/Makefile_qt-tstat            |    8 ++++----
 .../ti-tisdk-makefile/Makefile_quick-playground    |    8 ++++----
 .../ti-tisdk-makefile/Makefile_refresh-screen      |    8 ++++----
 .../ti-tisdk-makefile/Makefile_ti-crypto-examples  |    2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
index a682d59..14ee3df 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
@@ -3,22 +3,22 @@ dual-camera:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make
 
 dual-camera_clean:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make clean
 
 dual-camera_install:
 	@echo ===================================================
 	@echo   Installing Dual Camera Demo - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make install
 
 dual-camera_install_debug:
 	@echo =================================================
 	@echo   Installing Dual Camera Demo - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
index 2fc3b21..eb60e4f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
@@ -3,22 +3,22 @@ matrix-gui-browser:
 	@echo =================================
 	@echo    Building Matrix GUI Browser
 	@echo =================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make release
 
 matrix-gui-browser_clean:
 	@echo =================================
 	@echo    Cleaning Matrix GUI Browser
 	@echo =================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make clean
 
 matrix-gui-browser_install:
 	@echo ===================================================
 	@echo   Installing Matrix GUI Browser - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make install
 
 matrix-gui-browser_install_debug:
 	@echo =================================================
 	@echo   Installing Matrix GUI Browser - Debug Version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -name "*matrix-gui-browser*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
index 857e058..36d7ef5 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-tstat
@@ -3,22 +3,22 @@ qt-tstat:
 	@echo ================================
 	@echo    Building QT Thermostat App
 	@echo ================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make release
 
 qt-tstat_clean:
 	@echo ================================
 	@echo    Cleaning QT Thermostat App
 	@echo ================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make clean
 
 qt-tstat_install:
 	@echo ===================================================
 	@echo   Installing QT Thermostat App - Release version
 	@echo ===================================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make install
 
 qt-tstat_install_debug:
 	@echo =================================================
 	@echo   Installing QT Thermostat App - Debug version
 	@echo =================================================
-	@cd example-applications; cd `find . -name "*qt-tstat*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -name "*qt-tstat*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
index 06cbd49..a87471b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
@@ -3,22 +3,22 @@ quick-playground:
 	@echo =================================
 	@echo    Building Quick Playground App
 	@echo =================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make
 
 quick-playground_clean:
 	@echo =================================
 	@echo    Cleaning Quick Playground App
 	@echo =================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make clean
 
 quick-playground_install:
 	@echo ====================================================
 	@echo   Installing Quick Playground App - Release version
 	@echo ====================================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make install
 
 quick-playground_install_debug:
 	@echo ==================================================
 	@echo   Installing Quick Playground App - Debug version
 	@echo ==================================================
-	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
index bcc17fa..6d8f203 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_refresh-screen
@@ -3,22 +3,22 @@ refresh-screen:
 	@echo =============================
 	@echo    Building Refresh Screen
 	@echo =============================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build release
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make release
 
 refresh-screen_clean:
 	@echo =============================
 	@echo    Cleaning Refresh Screen
 	@echo =============================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build clean
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make clean
 
 refresh-screen_install:
 	@echo ================================================
 	@echo   Installing Refresh Screen - Release version
 	@echo ================================================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make install
 
 refresh-screen_install_debug:
 	@echo ==============================================
 	@echo   Installing Refresh Screen - Debug Version
 	@echo ==============================================
-	@cd example-applications; cd `find . -name "*refresh-screen*"`; make -f Makefile.build install_debug
+	@cd example-applications; cd `find . -name "*refresh-screen*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
index 3588381..9ab9616 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
@@ -3,7 +3,7 @@ ti-crypto-examples:
 	@echo =================================
 	@echo    Building TI Crypto Examples
 	@echo =================================
-	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make
+	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make release
 
 ti-crypto-examples_clean:
 	@echo =================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 374fa81..f8e0799 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -34,7 +34,7 @@ SRC_URI = "\
     file://Makefile_dual-camera-demo \
 "
 
-PR = "r26"
+PR = "r27"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


