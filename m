Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EB1BC529CF
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 14:05:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16E5stJ019198
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:05:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5sr8023348
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:05:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 08:05:53 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16E5p5S011240;
	Thu, 6 Feb 2014 08:05:52 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Feb 2014 09:34:43 -0600
Message-ID: <1391700887-26166-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/5] ti-tisdk-makefile: Update U-boot makefile
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
X-List-Received-Date: Thu, 06 Feb 2014 14:05:55 -0000
Content-Type: text/plain

* Add echo statements to make U-boot make,clean,install steps stand out.
* Remove installing of U-boot files since installing them into the file system
  servers no purpose.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_u-boot-spl          |   14 ++++++++++----
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
index 9ce6429..d2de7a9 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
@@ -4,14 +4,20 @@ u-boot-spl_clean: u-boot_clean
 u-boot-spl_install: u-boot_install
 
 u-boot:
+	@echo ===================================
+	@echo    Building U-boot
+	@echo ===================================
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) $(UBOOT_MACHINE)
 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE)
 
 u-boot_clean:
+	@echo ===================================
+	@echo    Cleaining U-boot
+	@echo ===================================
 	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=$(CROSS_COMPILE) clean
 
 u-boot_install:
-	install -d $(DESTDIR)/boot
-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.img $(DESTDIR)/boot
-	install $(TI_SDK_PATH)/board-support/u-boot-*/MLO $(DESTDIR)/boot
-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map $(DESTDIR)/boot
+	@echo ===================================
+	@echo    Installing U-boot
+	@echo ===================================
+	@echo "Nothing to do"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 30c2901..374fa81 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -34,7 +34,7 @@ SRC_URI = "\
     file://Makefile_dual-camera-demo \
 "
 
-PR = "r25"
+PR = "r26"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.0.4


