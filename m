Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 340B4529AA
	for <meta-arago@arago-project.org>;
	Wed, 10 Aug 2016 15:25:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7AFPTcZ014034
	for <meta-arago@arago-project.org>; Wed, 10 Aug 2016 10:25:29 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7AFPSUa018716
	for <meta-arago@arago-project.org>; Wed, 10 Aug 2016 10:25:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 10 Aug 2016 10:25:27 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7AFPQam014673;	Wed, 10 Aug 2016 10:25:26 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Aug 2016 11:24:48 -0400
Message-ID: <1470842688-26360-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: pru-icss: fix syntax error
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
X-List-Received-Date: Wed, 10 Aug 2016 15:25:30 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss           | 6 +++---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
index 7dbbca7..02f81bf 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
@@ -40,9 +40,9 @@ pru-icss_install_none:
 
 pru-icss_install_am335x: pru-icss_install_common
 	@cd example-applications; cd `find . -name "*pru-icss*"`; \
-	for i in 0 1; \
 	install -m 0644 ./examples/am335x/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
+	for i in 0 1; \
 	do \
 		install -m 0644 ./examples/am335x/PRU_RPMsg_Echo_Interrupt$${i}/gen/PRU_RPMsg_Echo_Interrupt$${i}.out \
 			$(DESTDIR)/lib/firmware/pru; \
@@ -50,9 +50,9 @@ pru-icss_install_am335x: pru-icss_install_common
 
 pru-icss_install_am437x: pru-icss_install_common
 	@cd example-applications; cd `find . -name "*pru-icss*"`; \
-	for i in 0 1; \
 	install -m 0644 ./examples/am437x/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
+	for i in 0 1; \
 	do \
 		install -m 0644 ./examples/am437x/PRU_RPMsg_Echo_Interrupt$${i}/gen/PRU_RPMsg_Echo_Interrupt$${i}.out \
 			$(DESTDIR)/lib/firmware/pru; \
@@ -60,9 +60,9 @@ pru-icss_install_am437x: pru-icss_install_common
 
 pru-icss_install_am572x: pru-icss_install_common
 	@cd example-applications; cd `find . -name "*pru-icss*"`; \
-	for i in 1 2; \
 	install -m 0644 ./examples/am572x/PRU_Halt/gen/PRU_Halt.out \
 		$(DESTDIR)/lib/firmware/pru; \
+	for i in 1 2; \
 	do \
 		for j in 0 1; \
 		do \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 75f40d2..6118a99 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -48,7 +48,7 @@ SRC_URI = "\
     file://Makefile_linalg-examples \
 "
 
-PR = "r73"
+PR = "r74"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4


