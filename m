Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0A67152A1F
	for <meta-arago@arago-project.org>;
	Fri,  9 Nov 2018 17:09:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA9H8slc128411
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:54 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA9H8ssq044872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:54 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 9 Nov 2018 11:08:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 9 Nov 2018 11:08:53 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA9H8qoF029532;
	Fri, 9 Nov 2018 11:08:53 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Nov 2018 11:56:27 -0500
Message-ID: <1541782587-24044-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
References: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 6/6] ti-tisdk-makefile: add sysfw-image target
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
X-List-Received-Date: Fri, 09 Nov 2018 17:09:09 -0000
Content-Type: text/plain

* The sysfw-image target will create the sysfw.itb from the
  ti-sci-firmware.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_sysfw-image          | 21 +++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      |  4 +++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
new file mode 100644
index 0000000..93c0a01
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_sysfw-image
@@ -0,0 +1,21 @@
+
+# Depend on linux-dtbs for the dtc utility
+system-firmware-image: linux-dtbs
+	@echo =============================
+	@echo    Building SYSFW Image
+	@echo =============================
+	@cd board-support; cd `find . -name "*system-firmware-image*"`; \
+		make SYSFW_DL_URL="" SYSFW_PATH=$(TI_SDK_PATH)/board-support/prebuilt-images/ti-sci-firmware-am65x-gp.bin CROSS_COMPILE=$(CROSS_COMPILE_ARMV7) PATH=$(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
+
+system-firmware-image_clean:
+	@echo =============================
+	@echo    Cleaning SYSFW Image
+	@echo =============================
+	@cd board-support; cd `find . -name "*system-firmware-image*"`; make clean
+
+system-firmware-image_install:
+	@echo =============================
+	@echo   Installing SYSFW Image
+	@echo =============================
+	@echo "Nothing to do"
+
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index a84eb27..f8eca68 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -49,9 +49,10 @@ SRC_URI = "\
     file://Makefile_linalg-examples \
     file://Makefile_ti-gc320-driver \
     file://Makefile_barcode-roi \
+    file://Makefile_sysfw-image \
 "
 
-PR = "r91"
+PR = "r92"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -171,6 +172,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         cryptodev \
                         ti-sgx-ddk-km-k3 \
                         pru-icss \
+                        sysfw-image \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.7.4


