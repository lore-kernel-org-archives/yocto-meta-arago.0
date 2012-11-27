Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8803452A93
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2012 14:55:22 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAREtKVP018091
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2012 08:55:20 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAREtJgB012578
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2012 20:25:19 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 27 Nov 2012 20:25:19 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAREsqoO026073;
	Tue, 27 Nov 2012 20:25:18 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Nov 2012 08:54:48 -0600
Message-ID: <1354028089-4919-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1354028089-4919-1-git-send-email-Chase.Maupin@ti.com>
References: <1354028089-4919-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] ti-tisdk-makefile: add ti-crypto-examples targets
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
X-List-Received-Date: Tue, 27 Nov 2012 14:55:23 -0000
Content-Type: text/plain

* Add the ti-crypto-examples targets to the TI SDK Makefile
* Add the CC variable to the list of variables exported by
  Rules.make to make cross compiling easier.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-tisdk-makefile/Makefile_ti-crypto-examples  |   24 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile/Rules.make |    4 +++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++-
 3 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
new file mode 100644
index 0000000..3588381
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
@@ -0,0 +1,24 @@
+# ti-crypto-examples build targets
+ti-crypto-examples:
+	@echo =================================
+	@echo    Building TI Crypto Examples
+	@echo =================================
+	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make
+
+ti-crypto-examples_clean:
+	@echo =================================
+	@echo    Cleaning TI Crypto Examples
+	@echo =================================
+	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make clean
+
+ti-crypto-examples_install:
+	@echo ===================================================
+	@echo   Installing TI Crypto Examples - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make install
+
+ti-crypto-examples_install_debug:
+	@echo =================================================
+	@echo   Installing TI Crypto Examples - Debug Version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index 1b0a347..296e4b5 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -20,6 +20,10 @@ export LINUX_DEVKIT_PATH=$(TI_SDK_PATH)/linux-devkit
 #Cross compiler prefix
 export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/bin/arm-arago-linux-gnueabi-
 
+#Default CC value to be used when cross compiling.  This is so that the
+#GNU Make default of "cc" is not used to point to the host compiler
+export CC=$(CROSS_COMPILE)gcc
+
 #Location of environment-setup file
 export ENV_SETUP=$(LINUX_DEVKIT_PATH)/environment-setup
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 4691df4..c6cea95 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "\
     file://Makefile_u-boot-legacy \
     file://Makefile_matrix-gui \
     file://Makefile_arm-benchmarks \
+    file://Makefile_ti-crypto-examples \
     file://Makefile_am-sysinfo \
     file://Makefile_av-examples \
     file://Makefile_u-boot-spl \
@@ -29,11 +30,12 @@ SRC_URI = "\
     file://Makefile_wireless \
 "
 
-PR = "r3"
+PR = "r4"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
                     arm-benchmarks \
+                    ti-crypto-examples \
                     am-sysinfo \
                     matrix-gui-browser \
                     refresh-screen \
-- 
1.7.0.4


