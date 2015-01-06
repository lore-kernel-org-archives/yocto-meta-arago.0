Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CDBF2529D3
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 14:29:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06ETgHl027028
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:29:42 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06ETgJL008791
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:29:42 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 08:29:41 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06ETeNn006357;
	Tue, 6 Jan 2015 08:29:41 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y8V8d-00057U-J3;
	Tue, 06 Jan 2015 09:29:39 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jan 2015 09:29:36 -0500
Message-ID: <1420554576-19650-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: Makefile_cryptodev: Need ARCH and KERNEL_DIR for clean target.
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
X-List-Received-Date: Tue, 06 Jan 2015 14:29:43 -0000
Content-Type: text/plain

* Otherwise will fail if host kernel headers are not present.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_cryptodev           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
index c05dc66..980b236 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
@@ -12,7 +12,7 @@ cryptodev_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "cryptodev*"`; \
-	make clean
+	make ARCH=arm KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR) clean
 
 cryptodev_install:
 	@echo ================================
-- 
1.7.9.5


