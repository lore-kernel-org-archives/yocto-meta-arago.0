Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 46C6C52B00
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 22:22:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v13MMULQ028017
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v13MMUtq018493
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 16:22:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v13MMTL0025786;	Fri, 3 Feb 2017 16:22:30 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Feb 2017 17:22:16 -0500
Message-ID: <1486160539-23523-4-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1486160539-23523-1-git-send-email-h-gou@ti.com>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 3/6] ti-tisdk-makefile: add barcode-roi demo
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
X-List-Received-Date: Fri, 03 Feb 2017 22:22:33 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../ti-tisdk-makefile/Makefile_barcode-roi            | 19 +++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi
new file mode 100644
index 0000000..7d7ae56
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_barcode-roi
@@ -0,0 +1,19 @@
+# barcode-roi build targets
+
+barcode-roi:
+	@echo =============================
+	@echo    Building Barcode ROI
+	@echo =============================
+	@cd example-applications; cd `find . -name "*barcode-roi*"`; make -f Makefile.build release
+
+barcode-roi_clean:
+	@echo =============================
+	@echo    Cleaning Barcode ROI
+	@echo =============================
+	@cd example-applications; cd `find . -name "*barcode-roi*"`; make -f Makefile.build clean
+
+barcode-roi_install:
+	@echo ================================================
+	@echo   Installing Barcode ROI - Release version
+	@echo ================================================
+	@cd example-applications; cd `find . -name "*barcode-roi*"`; make -f Makefile.build install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 25cde69..8cc0758 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -47,9 +47,10 @@ SRC_URI = "\
     file://Makefile_openmpacc-examples \
     file://Makefile_linalg-examples \
     file://Makefile_ti-gc320-driver \
+    file://Makefile_barcode-roi \
 "
 
-PR = "r76"
+PR = "r77"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -88,6 +89,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            cryptodev \
                            ti-sgx-ddk-km \
                            pru-icss \
+                           barcode-roi \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -98,6 +100,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            image-gallery \
                            ti-sgx-ddk-km \
                            pru-icss \
+                           barcode-roi \
 "
 
 MAKEFILES_append_dra7xx = " cryptodev \
@@ -116,6 +119,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               cmem-mod \
                               pru-icss \
                               ti-gc320-driver \
+                              barcode-roi \
 "
 MAKEFILES_append_am180x-evm = " pru \
                                 u-boot-legacy \
@@ -130,6 +134,7 @@ MAKEFILES_append_keystone = " u-boot-spl \
                               hplib-mod \
                               uio-module-drv \
                               ipsecmgr-mod \
+                              barcode-roi \
 "
 
 MAKEFILES_append_k2hk-evm = " opencl-examples \
-- 
1.9.1


