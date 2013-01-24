Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by arago-project.org (Postfix) with ESMTPS id B56FB52A69
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:48 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h16so9806583oag.19
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gP+BxoOHZYuN+pjiptuwQjN/bNYFP8RpwKNJ04EFUt0=;
	b=YleC7ZqPY/0uehtdBNFc+BMo3wbCMpxHFJNDdc7Bw6VB5+pKXAaaL2kKATLxtVRmga
	2XrG03TlwUN6FoWtn3yM/hIXjYHhM4774mCQZ5QapSgHj2HbO/ciBrj1uQcWxTJ2Tud5
	CfcKHPTbrTkTnT1Ft/AYRb1ELGtzgUM3GiNssR4xsjrHinU5+DBfYkB9C0BNTMEk5FpU
	2V1ICDE1aVIiSBtlcDcqTfs2I0T/G0+L2K/0NKuvCjAOKQEjUoWbSmUp1e05lUmZJuTR
	NGMsNbRtzrxauGvfxx4t0vXMEE1+9RPMo4SCSG1N4QpgQemLpjGS2S+Mqw0sOdy5nEf4
	C4yA==
X-Received: by 10.60.22.68 with SMTP id b4mr1585764oef.111.1359037308175;
	Thu, 24 Jan 2013 06:21:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:47 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:16 -0600
Message-Id: <1359037281-12610-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: dgerlach <d-gerlach@ti.com>
Subject: [PATCH 42/47] Makefile_am-benchmarks: Renamed to Makefile_arm-benchmarks
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:49 -0000

From: dgerlach <d-gerlach@ti.com>

* All references to am-benchmarks changed to arm-benchmarks for Makefile_arm-benchmarks

ti-tisdk-makefile: Modified to use Makefile_arm-benchmarks rather than Makefile_am-benchmarks
---
 .../ti-tisdk-makefile/Makefile_am-benchmarks       |   24 --------------------
 .../ti-tisdk-makefile/Makefile_arm-benchmarks      |   24 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 ++--
 3 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
deleted file mode 100644
index ba0e0c6..0000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-benchmarks
+++ /dev/null
@@ -1,24 +0,0 @@
-# am-benchmarks build targets
-am-benchmarks:
-	@echo =============================
-	@echo    Building AM Benchmarks
-	@echo =============================
-	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make
-
-am-benchmarks_clean:
-	@echo =============================
-	@echo    Cleaning AM Benchmarks
-	@echo =============================
-	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make clean
-
-am-benchmarks_install:
-	@echo ==============================================
-	@echo   Installing AM Benchmarks - Release version
-	@echo ==============================================
-	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make install
-
-am-benchmarks_install_debug:
-	@echo ============================================
-	@echo   Installing AM Benchmarks - Debug Version
-	@echo ============================================
-	@cd example-applications; cd `find . -name "*am-benchmarks*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
new file mode 100644
index 0000000..0447ea5
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
@@ -0,0 +1,24 @@
+# arm-benchmarks build targets
+arm-benchmarks:
+	@echo =============================
+	@echo    Building ARM Benchmarks
+	@echo =============================
+	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make
+
+arm-benchmarks_clean:
+	@echo =============================
+	@echo    Cleaning ARM Benchmarks
+	@echo =============================
+	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make clean
+
+arm-benchmarks_install:
+	@echo ==============================================
+	@echo   Installing ARM Benchmarks - Release version
+	@echo ==============================================
+	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make install
+
+arm-benchmarks_install_debug:
+	@echo ============================================
+	@echo   Installing ARM Benchmarks - Debug Version
+	@echo ============================================
+	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 6208f21..a276140 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "\
     file://Makefile_linux \
     file://Makefile_u-boot-legacy \
     file://Makefile_matrix-gui \
-    file://Makefile_am-benchmarks \
+    file://Makefile_arm-benchmarks \
     file://Makefile_am-sysinfo \
     file://Makefile_av-examples \
     file://Makefile_u-boot-spl \
@@ -29,11 +29,11 @@ SRC_URI = "\
     file://Makefile_wireless \
 "
 
-PR = "r1"
+PR = "r2"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-                    am-benchmarks \
+                    arm-benchmarks \
                     am-sysinfo \
                     matrix-gui-browser \
                     refresh-screen \
-- 
1.7.0.4


