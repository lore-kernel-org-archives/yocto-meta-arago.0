Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7010E52AA8
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 15:10:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TFANJU010183
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFANLg019097
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 09:10:23 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFANKb011106;
	Fri, 29 Jan 2016 09:10:23 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPAgp-0001ou-3W; Fri, 29 Jan 2016 10:10:23 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 10:10:19 -0500
Message-ID: <1454080219-6927-8-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
References: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] ti-tisdk-makefile: Add video analytics target
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
X-List-Received-Date: Fri, 29 Jan 2016 15:10:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../Makefile_qt-opencv-opencl-opengl-multithreaded | 24 ++++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
new file mode 100644
index 0000000..12246db
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
@@ -0,0 +1,24 @@
+# qt-opencv-opencl-opengl-multithreaded  build targets
+qt-opencv-opencl-opengl-multithreaded:
+	@echo =============================
+	@echo    Building QT OpenCV Multithreaded
+	@echo =============================
+	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build release
+
+qt-opencv-opencl-opengl-multithreaded_clean:
+	@echo =============================
+	@echo    Cleaning QT OpenCV Multithreaded
+	@echo =============================
+	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build clean
+
+qt-opencv-opencl-opengl-multithreaded_install:
+	@echo ================================================
+	@echo   Installing QT OpenCV Multithreaded - Release version
+	@echo ================================================
+	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build install
+
+qt-opencv-opencl-opengl-multithreaded_install_debug:
+	@echo ==============================================
+	@echo   Installing QT OpenCV Multithreaded - Debug Version
+	@echo ==============================================
+	@cd example-applications; cd `find . -name "*qt-opencv-opencl-opengl-multithreaded*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index bccb22d..14f8e8a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -42,9 +42,10 @@ SRC_URI = "\
     file://Makefile_hplib-mod \
     file://Makefile_uio-module-drv \
     file://Makefile_pru-icss \
+    file://Makefile_qt-opencv-opencl-opengl-multithreaded \
 "
 
-PR = "r63"
+PR = "r64"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -99,6 +100,7 @@ MAKEFILES_append_dra7xx = " cryptodev \
                             debugss-module-drv \
                             gdbserverproxy-module-drv \
                             opencl-examples \
+                            qt-opencv-opencl-opengl-multithreaded \
 "
 
 MAKEFILES_append_omap-a15 = " u-boot-spl \
-- 
1.9.1


