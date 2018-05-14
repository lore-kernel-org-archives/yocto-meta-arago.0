Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A914252090
	for <meta-arago@arago-project.org>;
	Mon, 14 May 2018 17:02:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4EH2V1N016068
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 12:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526317351;
	bh=8qk8NcXa8uITX+XSii+dUMdsQf1+Ak4HhATwsm85H8U=;
	h=From:To:CC:Subject:Date;
	b=zFIBwPHKNScY7EdBvXXFesDc0aoVuaifKvV3XmbXLuFlb8pvnNpUU2rlZMAkZeIu2
	fhfn9YWLQvzT7yHeqZ6H6vw91w1CHXl+ZxAQotic0JWDd5YJ/JSxr7h4auMKsk6afC
	SRxog6HhRn55nvlKITeM09MvOyyMezNXO0WSFuEo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EH2VsR008341
	for <meta-arago@arago-project.org>; Mon, 14 May 2018 12:02:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 14 May 2018 12:02:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 14 May 2018 12:02:31 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4EH2Ukk024026;
	Mon, 14 May 2018 12:02:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 May 2018 12:52:13 -0400
Message-ID: <1526316733-26436-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3] ti-tisdk-makefile: linux-dtbs: loop over individual DTBs
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
X-List-Received-Date: Mon, 14 May 2018 17:02:37 -0000
Content-Type: text/plain

* The device tree merge cannot handle multiple DTBs using multiple
  threads in parallel, so following from kernel-devicetree.bbclass,
  loop over individual DTBs.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: loop over DTBs, following OE procedure.
v3 changes: update commit message

 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs           | 4 +++-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
index 012ddc7..d1d7e02 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -4,7 +4,9 @@ linux-dtbs:
 	@echo     Building the Linux Kernel DTBs
 	@echo =====================================
 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $(DEFCONFIG)
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) __KERNEL_DEVICETREE__
+	@for DTB in __KERNEL_DEVICETREE__; do \
+		$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) $$DTB; \
+	done
 
 linux-dtbs_install:
 	@echo =======================================
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f2f16f5..4fdd99f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r85"
+PR = "r86"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-- 
2.7.4


