Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7A7A252986
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 14:39:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3KEdLV7008507
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524235161;
	bh=mHxh8sdEMVe9nxk6CL13UHVRdECJuuRP4mKZcpCYtO8=;
	h=From:To:CC:Subject:Date;
	b=UtKtrDT6Z1kepdIXB+oAoFcwPVUiFruR+cNgjpNWOZyzJS6V8Q0hOnpgXDdmirtOK
	4XJcYK50CQQkn7jL+WwZB3UPjIZcz/WWWJLfi+flfpE5q8uG/k9qrI1aly3IGMtzxc
	yFYYnBrpsGmI74QNzd3Bsx/dTBBECX22RInBbhOA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdLLp027753
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Apr 2018 09:39:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Apr 2018 09:39:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdK4v002328;
	Fri, 20 Apr 2018 09:39:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Apr 2018 10:28:56 -0400
Message-ID: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 1/5] llvm-rtos: fix installation to sysroot
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
X-List-Received-Date: Fri, 20 Apr 2018 14:39:26 -0000
Content-Type: text/plain

* Move all installation to do_install and install relative to ${D}.
* Add proper packaging.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/includes/arago-paths.inc            |  2 +-
 .../recipes-ti/llvm-rtos/llvm-rtos_git.bb          | 23 +++++++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/includes/arago-paths.inc b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
index d617af3..a652df0 100644
--- a/meta-arago-extras/recipes-ti/includes/arago-paths.inc
+++ b/meta-arago-extras/recipes-ti/includes/arago-paths.inc
@@ -7,5 +7,5 @@ export OCL_RTOS_INSTALL_DIR_RECIPE   = "${installdir}/ti-opencl-rtos-tree"
 
 export LIBARCH_INSTALL_DIR    = "${STAGING_DIR_TARGET}${LIBARCH_INSTALL_DIR_RECIPE}"
 export LINALG_INSTALL_DIR     = "${STAGING_DIR_TARGET}${LINALG_INSTALL_DIR_RECIPE}"
-export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_NATIVE}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
+export LLVM_RTOS_INSTALL_DIR  = "${STAGING_DIR_TARGET}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
 export OCL_RTOS_INSTALL_DIR   = "${STAGING_DIR_TARGET}${OCL_RTOS_INSTALL_DIR_RECIPE}"
diff --git a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
index fac9d6b..ee4d7f2 100644
--- a/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/llvm-rtos/llvm-rtos_git.bb
@@ -24,7 +24,7 @@ RELEASE_TARGET_omap-a15 = "am57xx"
 CLEANBROKEN = "1"
 
 export LLVM_SRC_DIR="${S}"
-export LLVM_INSTALL_DIR="${LLVM_RTOS_INSTALL_DIR}"
+export LLVM_INSTALL_DIR="${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}"
 
 do_compile() {
     unset LDFLAGS
@@ -41,16 +41,25 @@ do_compile() {
 
     make -C build.sysbios LLVMSupport LLVMCore LLVMBitReader ${PARALLEL_MAKE}
 
-    cd build.sysbios; make -f include/llvm/Makefile install/local; cd ..
-
 }
 
 do_install() {
-    install -d ${LLVM_RTOS_INSTALL_DIR}/bin
-    install -m 755 ${S}/build.sysbios/build.native/bin/llvm-config ${LLVM_RTOS_INSTALL_DIR}/bin/llvm-config-host
+    cd build.sysbios; make -f include/llvm/Makefile install/local; cd ..
+
+    install -d ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/bin
+    install -m 755 ${S}/build.sysbios/build.native/bin/llvm-config ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/bin/llvm-config-host
 
-    install -d ${LLVM_RTOS_INSTALL_DIR}/lib
+    install -d ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/lib
     for libfile in ${S}/build.sysbios/lib/*.a; do
-        install -m 644 ${libfile} ${LLVM_RTOS_INSTALL_DIR}/lib
+        install -m 644 ${libfile} ${D}${LLVM_RTOS_INSTALL_DIR_RECIPE}/lib
     done
 }
+
+FILES_${PN} += "${LLVM_RTOS_INSTALL_DIR_RECIPE}"
+
+# This package contains one x86-64 executable and a few static libraries
+INSANE_SKIP_${PN} = "arch file-rdeps staticdev"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4


