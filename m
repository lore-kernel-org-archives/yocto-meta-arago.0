Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4D6055297E
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 13:50:46 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TDohM8018186
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 08:50:44 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDohW5024278
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 19:20:43 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 19:20:43 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDoZ24006191;
	Fri, 29 Mar 2013 19:20:42 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Mar 2013 08:50:33 -0500
Message-ID: <1364565033-29017-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
References: <1364565033-29017-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ti-tisdk-makefile: Add omapconf targets
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
X-List-Received-Date: Fri, 29 Mar 2013 13:50:47 -0000
Content-Type: text/plain

* Add support for omapconf build targets for omap-a15 devices

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-tisdk-makefile/Makefile_omapconf            |   19 +++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 +++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
new file mode 100644
index 0000000..9a8e69a
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_omapconf
@@ -0,0 +1,19 @@
+# omapconf build targets
+omapconf:
+	@echo =======================
+	@echo    Building OmapConf
+	@echo =======================
+	@cd example-applications; cd `find . -name "*omapconf*"`; make CROSS_COMPILE=${CROSS_COMPILE} omapconf
+
+omapconf_clean:
+	@echo =======================
+	@echo    Cleaning OmapConf
+	@echo =======================
+	@cd example-applications; cd `find . -name "*omapconf*"`; make clean
+
+omapconf_install:
+	@echo ==========================================
+	@echo   Installing OmapConf - Release version
+	@echo ==========================================
+	@cd example-applications; cd `find . -name "*omapconf*"`; make DESTDIR=${DESTDIR}/usr/bin install
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index cd43481..17a5c54 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -28,9 +28,10 @@ SRC_URI = "\
     file://Makefile_qt-tstat \
     file://Makefile_quick-playground \
     file://Makefile_wireless \
+    file://Makefile_omapconf \
 "
 
-PR = "r6"
+PR = "r7"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -58,6 +59,7 @@ MAKEFILES_ti33x += "u-boot-spl \
 "
 MAKEFILES_omap-a15 += "u-boot-spl \
                     quick-playground \
+                    omapconf \
 "
 MAKEFILES_am180x-evm += "pru \
                          u-boot-legacy \
-- 
1.7.0.4


