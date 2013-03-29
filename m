Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E97855297E
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 14:24:01 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TENxAV000666
	for <meta-arago@arago-project.org>; Fri, 29 Mar 2013 09:24:00 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TENwrd029431
	for <meta-arago@arago-project.org>;
	Fri, 29 Mar 2013 19:53:59 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 19:53:58 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TENtIO008209;
	Fri, 29 Mar 2013 19:53:57 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Mar 2013 09:23:53 -0500
Message-ID: <1364567033-31845-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: Add build target for linux DTB files
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
X-List-Received-Date: Fri, 29 Mar 2013 14:24:02 -0000
Content-Type: text/plain

* Add a build target to build the DTB files for the linux kernel

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-tisdk-makefile/Makefile_linux-dtbs          |   20 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 +++-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
new file mode 100644
index 0000000..b195730
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -0,0 +1,20 @@
+# Kernel DTB build targets
+linux-dtbs:
+	@echo =====================================
+	@echo     Building the Linux Kernel DTBs
+	@echo =====================================
+	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) dtbs
+
+linux-dtbs_install:
+	@echo =======================================
+	@echo     Installing the Linux Kernel DTBs
+	@echo =======================================
+	install -d $(DESTDIR)/boot
+	@cp -f $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/dts/*.dtb $(DESTDIR)/boot/
+
+linux-dtbs_clean:
+	@echo =======================================
+	@echo     Cleaning the Linux Kernel DTBs
+	@echo =======================================
+	@echo "Nothing to do"
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 17a5c54..0823979 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "\
     file://Makefile \
     file://Rules.make \
     file://Makefile_linux \
+    file://Makefile_linux-dtbs \
     file://Makefile_u-boot-legacy \
     file://Makefile_matrix-gui \
     file://Makefile_arm-benchmarks \
@@ -31,7 +32,7 @@ SRC_URI = "\
     file://Makefile_omapconf \
 "
 
-PR = "r7"
+PR = "r8"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -60,6 +61,7 @@ MAKEFILES_ti33x += "u-boot-spl \
 MAKEFILES_omap-a15 += "u-boot-spl \
                     quick-playground \
                     omapconf \
+                    linux-dtbs \
 "
 MAKEFILES_am180x-evm += "pru \
                          u-boot-legacy \
-- 
1.7.0.4


