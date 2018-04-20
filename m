Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3B88252A0D
	for <meta-arago@arago-project.org>;
	Fri, 20 Apr 2018 14:39:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3KEdMcW010599
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524235162;
	bh=m2WPulNzGOYsAXs1h9yfyKizmxC6XYoj8Qxo1JV7P6A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EbI/mKuSvjJ9MVOZA/TNt3nK9BP8r0YYyxZ0YOWQV/MdL9r7LzM9pMtfZ94PbrmFE
	4OWVgG4GgLGLX3znK9JycXHQ6iGlSOHeR0lX4vJhloSNBw1SFlf43wVbdjghWcdgv9
	lC5sJs6CSVk5UpNZpTv3sXGSMdkfXoQ05/0u7jVk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdMkn026349
	for <meta-arago@arago-project.org>; Fri, 20 Apr 2018 09:39:22 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 20 Apr 2018 09:39:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 20 Apr 2018 09:39:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3KEdK50002328;
	Fri, 20 Apr 2018 09:39:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Apr 2018 10:28:59 -0400
Message-ID: <1524234540-28454-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
References: <1524234540-28454-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 4/5] opencl-rtos: cleanup recipe
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
X-List-Received-Date: Fri, 20 Apr 2018 14:39:27 -0000
Content-Type: text/plain

* Split build into configure, compile, and install tasks
* Install relative to ${D}
* Add missing dependency
* Add files to a package

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/ocl-rtos/opencl-rtos_git.bb         | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
index 26dd596..0c9aca7 100644
--- a/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl-rtos/opencl-rtos_git.bb
@@ -22,6 +22,7 @@ DEPENDS = "cmake-native \
            ti-ipc-rtos  \
            opencl-monitor-rtos  \
            clocl-rtos-native  \
+           ti-cgt6x-native \
 "
 
 #RDEPENDS_${PN}-dev += " opencl-monitor-rtos"
@@ -30,6 +31,7 @@ ALLOW_EMPTY_${PN}-runtime = "1"
 
 
 S = "${WORKDIR}/git/host"
+B = "${WORKDIR}/build"
 
 export WANT_LLVM_RELEASE = "3.6-ti"
 
@@ -42,25 +44,21 @@ RELEASE_TARGET_omap-a15 = "am57xx"
 
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export ARM_LLVM_DIR="${LLVM_RTOS_INSTALL_DIR}"
-export DESTDIR="${OCL_RTOS_INSTALL_DIR}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
+export DESTDIR="${D}${OCL_RTOS_INSTALL_DIR_RECIPE}/ti-opencl-rtos-${RELEASE_TARGET}-${PV}/packages/ti/opencl"
 
 # Required for eclipse plugin and packages
 export XDC_DIR = "${XDC_INSTALL_DIR}"
 export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
 export IPC_DIR = "${IPC_INSTALL_DIR}"
 
-do_compile() {
-
-    echo "LLVM_RTOS_INSTALL_DIR=${LLVM_RTOS_INSTALL_DIR}"
-
+do_configure() {
     unset LDFLAGS
     unset TARGET_LDFLAGS
 
-    cd ${WORKDIR}
-    rm -rf build
+    rm -rf "${B}"
 
-    mkdir -p build
-    cd build; cmake \
+    mkdir -p "${B}"
+    cd "${B}"; cmake \
         -DCMAKE_TOOLCHAIN_FILE=../git/host/cmake/CMakeBiosARMToolChain.txt \
         -DBUILD_TARGET=${OCL_BUILD_TARGET} \
         -DBUILD_OUTPUT=lib \
@@ -71,14 +69,30 @@ do_compile() {
         -DBIOS_INSTALL_PATH=${SYSBIOS_INSTALL_DIR}/packages \
         -DLOKI_INCLUDE_PATH=${STAGING_DIR_HOST}/usr/include/loki \
         -DARM_LLVM_DIR=${ARM_LLVM_DIR} \
-        -DOCL_VERSION=${PV} ../git/host;
-    make install
-    make -C packages install
-    cd ..
+        -DOCL_VERSION=${PV} "${S}";
+}
+
+do_compile() {
+    unset LDFLAGS
+    unset TARGET_LDFLAGS
+
+    oe_runmake
+    oe_runmake -C packages
 }
 
 # Install x86/Linux clocl built by clocl-rtos-native recipe
 do_install() {
-    install -d ${DESTDIR}/usr/share/ti/opencl/bin/x86
-    install -m 755 ${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tree/bin/x86/clocl ${DESTDIR}/usr/share/ti/opencl/bin/x86
+    unset LDFLAGS
+    unset TARGET_LDFLAGS
+
+    oe_runmake install
+    oe_runmake -C packages install
+
+    install -d ${D}/usr/share/ti/opencl/bin/x86
+    install -m 755 ${STAGING_DIR_NATIVE}/usr/share/ti/ti-opencl-rtos-tree/bin/x86/clocl ${D}/usr/share/ti/opencl/bin/x86
 }
+
+FILES_${PN}-dev += "/usr/share/ti/opencl ${OCL_RTOS_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN} = "already-stripped"
+INSANE_SKIP_${PN}-dev = "staticdev file-rdeps arch"
-- 
2.7.4


