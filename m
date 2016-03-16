Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1E08152A65
	for <meta-arago@arago-project.org>;
	Wed, 16 Mar 2016 19:34:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GJY7uR019141
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 14:34:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GJY7dn024339
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 14:34:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 14:34:07 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GJY74t021143;
	Wed, 16 Mar 2016 14:34:07 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1agHCo-0001rU-KY; Wed, 16 Mar 2016 15:34:06 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Mar 2016 15:34:04 -0400
Message-ID: <1458156844-7122-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: Fix boot-monitor target
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
X-List-Received-Date: Wed, 16 Mar 2016 19:34:09 -0000
Content-Type: text/plain

* The actual make target is prefixed with "image_"

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor           | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
index 74c7935..03f3f92 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_boot-monitor
@@ -4,7 +4,7 @@ boot-monitor:
 	@echo ================================
 	@cd board-support; \
 	cd `find . -maxdepth 1 -name "boot-monitor*"`; \
-	make __BOOT_MONITOR_MAKE_TARGET__
+	make image___BOOT_MONITOR_MAKE_TARGET__
 
 boot-monitor_clean:
 	@echo ================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a65918e..f7871b3 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -48,7 +48,7 @@ SRC_URI = "\
     file://Makefile_linalg-examples \
 "
 
-PR = "r70"
+PR = "r71"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
1.9.1


