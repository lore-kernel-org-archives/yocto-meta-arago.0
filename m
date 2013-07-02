Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E90B15298D
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 17:01:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62H12bc003363
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:01:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62H11T3024014
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 12:01:02 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 12:01:01 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62H0ooD021236;
	Tue, 2 Jul 2013 12:00:59 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2013 12:15:52 -0500
Message-ID: <1372785354-1920-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372785354-1920-1-git-send-email-fcooper@ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 4/6] ti-tisdk-makefile: Add oprofile-example to SDK top level Makefile
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
X-List-Received-Date: Tue, 02 Jul 2013 17:01:03 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/Makefile_oprofile-example    |   18 ++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 +++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
new file mode 100644
index 0000000..c7a4385
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
@@ -0,0 +1,18 @@
+# oprofile-example build targets
+oprofile-example:
+	@echo =============================
+	@echo    Building OProfile Example
+	@echo =============================
+	@cd example-applications; cd `find . -name "*oprofile-example*"`; make
+
+oprofile-example_clean:
+	@echo =============================
+	@echo    Cleaning OProfile Example
+	@echo =============================
+	@cd example-applications; cd `find . -name "*oprofile-example*"`; make clean
+
+oprofile-example_install:
+	@echo =============================================
+	@echo     Installing OProfile Example - Debug version
+	@echo =============================================
+	@cd example-applications; cd `find . -name "*oprofile-example*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 0f14341..e0aea9a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -30,9 +30,10 @@ SRC_URI = "\
     file://Makefile_quick-playground \
     file://Makefile_wireless \
     file://Makefile_omapconf \
+    file://Makefile_oprofile-example \
 "
 
-PR = "r12"
+PR = "r13"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -41,6 +42,7 @@ MAKEFILES_COMMON = "linux \
                     matrix-gui-browser \
                     refresh-screen \
                     qt-tstat \
+                    oprofile-example \
 "
 MAKEFILES = ""
 
-- 
1.7.0.4


