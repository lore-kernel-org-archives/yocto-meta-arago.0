Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by arago-project.org (Postfix) with ESMTPS id 9600552AE2
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:19 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so1024238obc.20
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fYG3SVKfOejpQXrFtOknwfjNs12A8queNLrxUgZLXjI=;
	b=BLrreJ4P8TRZHs+bIyPwz1OC6rCDEA9B5dLYjmnKs4xMA87atFtFDnsm1ug/LRhPXp
	9scYzH5X2dzEVW+RuTJU7kgOXL9CeiRahYdszELPlOkeDprKYUOs/1aIapRreL/yUDcz
	AOj5PZhaISkYGbEmsIEZuS3YnXGTDziR5kyf3CrB0KUCzeMhRt6FCJSb2wvY5E9wzPq3
	rjaBIn48+xkv+H+0i5CTmoixmmkDmT/L1rRN5KsCizPCUNNilkBWsmhQvjKoFpjF482n
	YDaHyVFkc+9t3A1o2DmI4kH/84Co3IjxDGlS2g/PgP825S5l0Btip4XnOkh0NI/QJKTi
	Hi7w==
X-Received: by 10.60.31.68 with SMTP id y4mr5764899oeh.121.1359151099046;
	Fri, 25 Jan 2013 13:58:19 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.17
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:18 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:52 -0600
Message-Id: <1359150851-23602-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 12/31] ti-tisdk-makefile: add ti-crypto-examples targets
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:19 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

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


