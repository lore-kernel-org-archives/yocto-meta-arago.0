Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 14C3E52AB7
	for <meta-arago@arago-project.org>;
	Thu, 29 May 2014 18:38:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4TIcgcc028899
	for <meta-arago@arago-project.org>; Thu, 29 May 2014 13:38:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TIcgEO019083
	for <meta-arago@arago-project.org>; Thu, 29 May 2014 13:38:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 29 May 2014 13:38:42 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4TIcGgS022027;
	Thu, 29 May 2014 13:38:40 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 May 2014 13:38:14 -0500
Message-ID: <1401388695-30526-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1401388695-30526-1-git-send-email-fcooper@ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/11] ti-tisdk-makefile: Add image gallery to SDK makefile for AM4x
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
X-List-Received-Date: Thu, 29 May 2014 18:38:43 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_image-gallery       |   24 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery
new file mode 100644
index 0000000..df843fb
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_image-gallery
@@ -0,0 +1,24 @@
+# QT Image Gallery build targets
+image-gallery:
+	@echo ================================
+	@echo    Building Image Gallery
+	@echo ================================
+	@cd example-applications; cd `find . -name "*image-gallery*"`; make -f Makefile.build
+
+image-gallery_clean:
+	@echo ================================
+	@echo    Building Image Gallery
+	@echo ================================
+	@cd example-applications; cd `find . -name "*image-gallery*"`; make -f Makefile.build clean
+
+image-gallery_install:
+	@echo ===================================================
+	@echo   Installing Image Gallery - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*image-gallery*"`; make -f Makefile.build install
+
+image-gallery_install_debug:
+	@echo =================================================
+	@echo   Installing Dual Camera Demo - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*image-galleryo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 770c2ae..ab4244c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -32,10 +32,11 @@ SRC_URI = "\
     file://Makefile_omapconf \
     file://Makefile_oprofile-example \
     file://Makefile_dual-camera-demo \
+    file://Makefile_image-gallery \
     file://Makefile_cryptodev \
 "
 
-PR = "r33"
+PR = "r34"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -75,6 +76,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            linux-dtbs \
                            wireless \
                            dual-camera-demo \
+                           image-gallery \
                            cryptodev \
 "
 
-- 
1.7.0.4


