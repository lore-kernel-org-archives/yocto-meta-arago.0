Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4F0E052A38
	for <meta-arago@arago-project.org>;
	Fri,  7 Feb 2014 02:46:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s172kG7V025463
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 20:46:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s172kGst011935
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 20:46:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 20:46:16 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s172kAt1000475;
	Thu, 6 Feb 2014 20:46:14 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 20:46:09 -0600
Message-ID: <1391741169-23390-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1391741169-23390-1-git-send-email-fcooper@ti.com>
References: <1391741169-23390-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] ti-tisdk-makefile: Fix dual camera demo stub
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
X-List-Received-Date: Fri, 07 Feb 2014 02:46:17 -0000
Content-Type: text/plain

* Use the correct makefile targets for the dual camera demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_dual-camera-demo    |    8 ++++----
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
index 14ee3df..5a1475e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
@@ -1,23 +1,23 @@
 # QT Dual Camera build targets
-dual-camera:
+dual-camera-demo:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
 	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make
 
-dual-camera_clean:
+dual-camera-demo_clean:
 	@echo ================================
 	@echo    Building Dual Camera Demo
 	@echo ================================
 	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make clean
 
-dual-camera_install:
+dual-camera-demo_install:
 	@echo ===================================================
 	@echo   Installing Dual Camera Demo - Release version
 	@echo ===================================================
 	@cd example-applications; cd `find . -name "*dual-camera-demo*"`; make install
 
-dual-camera_install_debug:
+dual-camera-demo_install_debug:
 	@echo =================================================
 	@echo   Installing Dual Camera Demo - Debug version
 	@echo =================================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index d12b646..5863b23 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -34,7 +34,7 @@ SRC_URI = "\
     file://Makefile_dual-camera-demo \
 "
 
-PR = "r28"
+PR = "r29"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


