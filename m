Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F3B1952A02
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 17:15:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GHF3oK020861
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF2QF011687
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 12:15:02 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF2pW004457;
	Wed, 16 Sep 2015 12:15:02 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZcGIP-0006Sf-T9; Wed, 16 Sep 2015 13:15:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Sep 2015 13:14:56 -0400
Message-ID: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/4] ti-tisdk-makefile: Source ENV_SETUP for certain apps
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
X-List-Received-Date: Wed, 16 Sep 2015 17:15:04 -0000
Content-Type: text/plain

* In moving to the latest toolchain (2015.05) the linker cannot find
  standard toolchain libraries without help.
* Use the environment-setup script from the devkit to set the
  appropriate CFLAGS and LDFLAGS

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo             | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks         | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example       | 2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples     | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
index 445dd10..9d56246 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_am-sysinfo
@@ -3,7 +3,7 @@ am-sysinfo:
 	@echo =============================
 	@echo    Building AM Sysinfo
 	@echo =============================
-	@cd example-applications; cd `find . -name "*am-sysinfo*"`; make
+	@cd example-applications; cd `find . -name "*am-sysinfo*"`; . $(ENV_SETUP); make
 
 am-sysinfo_clean:
 	@echo =============================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
index 0447ea5..2337550 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
@@ -3,7 +3,7 @@ arm-benchmarks:
 	@echo =============================
 	@echo    Building ARM Benchmarks
 	@echo =============================
-	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; make
+	@cd example-applications; cd `find . -name "*arm-benchmarks*"`; . $(ENV_SETUP); make
 
 arm-benchmarks_clean:
 	@echo =============================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
index c7a4385..bc117c0 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
@@ -3,7 +3,7 @@ oprofile-example:
 	@echo =============================
 	@echo    Building OProfile Example
 	@echo =============================
-	@cd example-applications; cd `find . -name "*oprofile-example*"`; make
+	@cd example-applications; cd `find . -name "*oprofile-example*"`; . $(ENV_SETUP); make
 
 oprofile-example_clean:
 	@echo =============================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
index 9ab9616..d166245 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
@@ -3,7 +3,7 @@ ti-crypto-examples:
 	@echo =================================
 	@echo    Building TI Crypto Examples
 	@echo =================================
-	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; make release
+	@cd example-applications; cd `find . -name "*ti-crypto-examples*"`; . $(ENV_SETUP); make release
 
 ti-crypto-examples_clean:
 	@echo =================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a770117..4947c94 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -41,7 +41,7 @@ SRC_URI = "\
     file://Makefile_omapdrm-pvr \
 "
 
-PR = "r51"
+PR = "r52"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.9.1


