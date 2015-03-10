Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7E451529F8
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2015 18:50:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2AIolwl027283
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 13:50:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AIoknE019246
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 13:50:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 13:50:45 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AIojOI013880;
	Tue, 10 Mar 2015 13:50:45 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YVPEr-0003CN-EF;
	Tue, 10 Mar 2015 14:50:45 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Mar 2015 14:50:41 -0400
Message-ID: <1426013441-12265-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile, wireless: Clean via 'mrproper' target.
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
X-List-Received-Date: Tue, 10 Mar 2015 18:50:49 -0000
Content-Type: text/plain

* A simple 'make clean' requires that the linux kernel is built,
  and thus breaks the top-level SDK 'make clean', since the kernel
  is the first package cleaned.
* 'make mrproper' does not depend on the built kernel headers.
* One side effect is that 'make mrproper' will also remove any
  configuration, returning the sources to their original state.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_wireless            |    2 +-
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
index 00a1931..5d7267e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_wireless
@@ -45,5 +45,5 @@ compat-modules_clean:
 	@echo ================================
 	@cd board-support/extra-drivers; \
 	cd `find . -maxdepth 1 -name "*compat-wireless*"`; \
-	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm clean
+	make KLIB_BUILD=${LINUXKERNEL_INSTALL_DIR} KLIB=${DESTDIR} CROSS_COMPILE=${CROSS_COMPILE} ARCH=arm mrproper
 
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a39f7db..ffedd4c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -36,7 +36,7 @@ SRC_URI = "\
     file://Makefile_cryptodev \
 "
 
-PR = "r40"
+PR = "r41"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
-- 
1.7.9.5


