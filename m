Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 34E0852A6D
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 14:08:45 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r35E8gap030172
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 09:08:43 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35E8gjO004904
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 19:38:42 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 5 Apr 2013 19:38:42 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r35E8e5q029406;
	Fri, 5 Apr 2013 19:38:41 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 Apr 2013 09:08:37 -0500
Message-ID: <1365170917-2328-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: make quick-playground conditional
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
X-List-Received-Date: Fri, 05 Apr 2013 14:08:46 -0000
Content-Type: text/plain

* Make the inclusion of quick-playground conditional on whether
  the Qt package being used is SGX enabled.  The package group
  doesn't install quick-playground for non-GLES Qt so the
  Makefile should not have this target either, else the make
  will fail due to missing sources.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 0823979..da2003f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "\
     file://Makefile_omapconf \
 "
 
-PR = "r8"
+PR = "r9"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -44,9 +44,12 @@ MAKEFILES_COMMON = "linux \
                     qt-tstat \
 "
 
+# This example application should not be used when using non-SGX
+QUICK_PLAYGROUND = "${@base_conditional('ARAGO_QT_PROVIDER','qt4-embedded-gles','quick-playground','', d)}"
+
 # Add device specific make targets
 MAKEFILES_omap3 += "u-boot-spl \
-                    quick-playground \
+                    ${QUICK_PLAYGROUND} \
 "
 MAKEFILES_am37x-evm += "av-examples \
                         ti-ocf-crypto-module \
@@ -56,10 +59,11 @@ MAKEFILES_am3517-evm += "av-examples \
                          ti-ocf-crypto-module \
 "
 MAKEFILES_ti33x += "u-boot-spl \
-                    quick-playground wireless \
+                    ${QUICK_PLAYGROUND} \
+                    wireless \
 "
 MAKEFILES_omap-a15 += "u-boot-spl \
-                    quick-playground \
+                    ${QUICK_PLAYGROUND} \
                     omapconf \
                     linux-dtbs \
 "
-- 
1.7.0.4


