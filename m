Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by arago-project.org (Postfix) with ESMTPS id 5A8ED52AA7
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:50 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id 16so3724120obc.33
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KxKIrknNU0peYY5Z9G/ToRxBpcH72f0MikWC8bEYU70=;
	b=zFBvVyX0NgEQpKxxlUAkR4aHwBa3AjZLmUSq5WERHIkYCO/RH0V58lO6HpFHjn5xGF
	FNOSCQ6Zn/TWZvKadHRGxIrzbA9BpwJkdMoFd2l72TDe3nY+Vl321j8DPXAjKPeHcjX6
	GTyMHsOiGmoEeaqZUHhYOh/vAzKuWN91lTfZBLCJuJ2e6cBcYcui+uHw7nZA+E1NI+NX
	C8ZFKX7fUo/fjzrC9yt/l5vJQzEadlCBZkSBbM49nZVaYjXwC/SYoBiOdhSJBq10ZK4/
	cu6Pc7ezGOx2jp79Ku7H9RA9EORV/jzr0bYwJT8VdkUu7lEHk2b+fQLytxfqBeKkEUvS
	weGA==
X-Received: by 10.60.19.133 with SMTP id f5mr1593161oee.105.1359037309781;
	Thu, 24 Jan 2013 06:21:49 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:48 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:17 -0600
Message-Id: <1359037281-12610-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: dgerlach <d-gerlach@ti.com>
Subject: [PATCH 43/47] Makefile_qml-playground: Renamed to Makefile_quick-playground
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:50 -0000

From: dgerlach <d-gerlach@ti.com>

ti-tisdk-makefile: Changed all references to qml-playground to quick-playground

* Changed references to qml-playground to quick-playground in Makefile_quick-playground
---
 .../ti-tisdk-makefile/Makefile_qml-playground      |   24 --------------------
 .../ti-tisdk-makefile/Makefile_quick-playground    |   24 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    8 +++---
 3 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground
deleted file mode 100644
index 4d8709a..0000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qml-playground
+++ /dev/null
@@ -1,24 +0,0 @@
-# QML Playground build targets
-qml-playground:
-	@echo =================================
-	@echo    Building QML Playground App
-	@echo =================================
-	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build release
-
-qml-playground_clean:
-	@echo =================================
-	@echo    Cleaning QML Playground App
-	@echo =================================
-	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build clean
-
-qml-playground_install:
-	@echo ====================================================
-	@echo   Installing QML Playground App - Release version
-	@echo ====================================================
-	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build install
-
-qml-playground_install_debug:
-	@echo ==================================================
-	@echo   Installing QML Playground App - Debug version
-	@echo ==================================================
-	@cd example-applications; cd `find . -name "*qml-playground*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
new file mode 100644
index 0000000..06cbd49
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
@@ -0,0 +1,24 @@
+# Quick Playground build targets
+quick-playground:
+	@echo =================================
+	@echo    Building Quick Playground App
+	@echo =================================
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build release
+
+quick-playground_clean:
+	@echo =================================
+	@echo    Cleaning Quick Playground App
+	@echo =================================
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build clean
+
+quick-playground_install:
+	@echo ====================================================
+	@echo   Installing Quick Playground App - Release version
+	@echo ====================================================
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install
+
+quick-playground_install_debug:
+	@echo ==================================================
+	@echo   Installing Quick Playground App - Debug version
+	@echo ==================================================
+	@cd example-applications; cd `find . -name "*quick-playground*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a276140..4691df4 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -25,11 +25,11 @@ SRC_URI = "\
     file://Makefile_pru \
     file://Makefile_ti-ocf-crypto-module \
     file://Makefile_qt-tstat \
-    file://Makefile_qml-playground \
+    file://Makefile_quick-playground \
     file://Makefile_wireless \
 "
 
-PR = "r2"
+PR = "r3"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -42,7 +42,7 @@ MAKEFILES_COMMON = "linux \
 
 # Add device specific make targets
 MAKEFILES_omap3 += "u-boot-spl \
-                    qml-playground \
+                    quick-playground \
 "
 MAKEFILES_am37x-evm += "av-examples \
                         ti-ocf-crypto-module \
@@ -52,7 +52,7 @@ MAKEFILES_am3517-evm += "av-examples \
                          ti-ocf-crypto-module \
 "
 MAKEFILES_ti33x += "u-boot-spl \
-                    qml-playground wireless \
+                    quick-playground wireless \
 "
 MAKEFILES_am180x-evm += "pru \
                          u-boot-legacy \
-- 
1.7.0.4


