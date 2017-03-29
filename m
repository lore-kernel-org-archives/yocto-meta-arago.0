Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EBB405297D
	for <meta-arago@arago-project.org>;
	Wed, 29 Mar 2017 18:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5B9D20B7A;
	Wed, 29 Mar 2017 18:05:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nI2HrUY-Tl_J; Wed, 29 Mar 2017 18:05:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 696F6208B3;
	Wed, 29 Mar 2017 18:05:33 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 83D4416244B;
	Wed, 29 Mar 2017 14:05:32 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 29 Mar 2017 14:05:32 -0400
Message-Id: <1490810732-16654-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] linalg: pass PARALLEL_MAKE to overwrite the default -j8
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
X-List-Received-Date: Wed, 29 Mar 2017 18:05:35 -0000

Other changes are mostly formatting and cleanup.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ss-PARALLEL_MAKE-variable-to-overwrite-j8.patch | 64 ++++++++++++++++++++++
 meta-arago-extras/recipes-ti/linalg/linalg.inc     | 45 ++++++++-------
 meta-arago-extras/recipes-ti/linalg/linalg_git.bb  |  6 +-
 3 files changed, 91 insertions(+), 24 deletions(-)
 create mode 100644 meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch

diff --git a/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch
new file mode 100644
index 0000000..dacea7a
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/linalg/files/0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch
@@ -0,0 +1,64 @@
+From 54378094d58c79a9d5ff6c1cc17d7bfd9c497dab Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 29 Mar 2017 13:09:05 -0400
+Subject: [PATCH] Makefile: pass PARALLEL_MAKE variable to overwrite -j8
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ src/ti/linalg/Makefile | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/src/ti/linalg/Makefile b/src/ti/linalg/Makefile
+index 90b8ef4..8d8e338 100644
+--- a/src/ti/linalg/Makefile
++++ b/src/ti/linalg/Makefile
+@@ -13,6 +13,8 @@ CLAPACK_HEADERS =$(LINALG_CLAPACK_DIR)/INCLUDE/blaswrap.h
+ CLAPACK_HEADERS+=$(LINALG_CLAPACK_DIR)/INCLUDE/clapack.h  
+ CLAPACK_HEADERS+=$(LINALG_CLAPACK_DIR)/INCLUDE/f2c.h  
+ 
++PARALLEL_MAKE ?= "-j8"
++
+ ifneq (,$(findstring DSP,$(MAKECMDGOALS)))
+ 
+ ifeq ($(LIBOS),LIB_RTOS)
+@@ -52,7 +54,7 @@ endif
+ DSPlibs:
+ 	cd $(LINALG_CBLAS_DIR); make arch=C66 alllib  || exit 1; \
+ 	cd ../$(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; \
+-	make -j8 MEM_MODEL=$(MEM_MODEL) TARGET=$(TARGET) LIBOS=$(LIBOS) NUM_DSP_CORES=$(NUM_DSP_CORES) || exit 1; make install; \
++	make $(PARALLEL_MAKE) MEM_MODEL=$(MEM_MODEL) TARGET=$(TARGET) LIBOS=$(LIBOS) NUM_DSP_CORES=$(NUM_DSP_CORES) || exit 1; make install; \
+ 	cd ../$(LINALG_TICBLAS_DIR)/src; make MEM_MODEL=$(MEM_MODEL) TARGET=$(TARGET) LIBOS=$(LIBOS) NUM_DSP_CORES=$(NUM_DSP_CORES) || exit 1; cd ../lib; \
+ 	echo "combining BLIS, CBLAS, and TICBLAS libraries into one: libcblas.ae66"; \
+ 	rm -rf blas_objs blis_objs; mkdir blas_objs blis_objs; cd blis_objs; ar x ../../../blis/install/$(BLIS_CFG)/lib/libblis.ae66; chmod +rw *; \
+@@ -63,8 +65,8 @@ DSPlibs:
+ # Build ARM code for ARM+DSP platforms
+ ARMlibs:
+ 	cd $(LINALG_CBLAS_DIR); make arch=ARM alllib || exit 1; \
+-	cd ../$(LINALG_BLIS_DIR); ./configure -p install/arm cortex-a15; make -j8 NUM_ARM_CORES=$(NUM_ARM_CORES) || exit 1; make install; \
+-	cd ../$(LINALG_CLAPACK_DIR); make f2clib || exit 1; make cblaswrap || exit 1; cd SRC; make -j8 || exit 1; cd ..
++	cd ../$(LINALG_BLIS_DIR); ./configure -p install/arm cortex-a15; make $(PARALLEL_MAKE) NUM_ARM_CORES=$(NUM_ARM_CORES) || exit 1; make install; \
++	cd ../$(LINALG_CLAPACK_DIR); make f2clib || exit 1; make cblaswrap || exit 1; cd SRC; make $(PARALLEL_MAKE) || exit 1; cd ..
+ 
+ # Build host-callable libraries for ARM+DSP platforms. 
+ # BLAS has a single archive: libcblas_armplusdsp.a, which includes:
+@@ -91,7 +93,7 @@ ARMplusDSP: DSPlibs ARMlibs
+ cleanDSPlibs:
+ 	rm -f lib/*
+ 	cd $(LINALG_CBLAS_DIR); make arch=C66 clean; \
+-	cd ../$(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; make -j8 clean; rm -r install/$(BLIS_CFG); \
++	cd ../$(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; make $(PARALLEL_MAKE) clean; rm -r install/$(BLIS_CFG); \
+ 	cd ../$(LINALG_TICBLAS_DIR)/src; make clean; 
+ 
+ cleanARMlibs:
+@@ -103,7 +105,7 @@ cleanARMlibs:
+ 
+ BLIStest:
+ 	cd $(LINALG_BLIS_DIR); ./configure -p install/arm cortex-a15; \
+-	cd testsuite; make lib=OpenCLCBLAS -j8 
++	cd testsuite; make lib=OpenCLCBLAS $(PARALLEL_MAKE)
+ 
+ BLIStestDSP:
+ 	cd $(LINALG_BLIS_DIR); ./configure -p install/$(BLIS_CFG) c66x; \
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg.inc b/meta-arago-extras/recipes-ti/linalg/linalg.inc
index 8879592..2a0eae3 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg.inc
+++ b/meta-arago-extras/recipes-ti/linalg/linalg.inc
@@ -1,38 +1,43 @@
 HOMEPAGE = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git"
 LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
 
 PV = "1_2_0_0"
 INC_PR = "r7"
 
-S = "${WORKDIR}/git"
+COMPATIBLE_MACHINE = "k2hk-evm|dra7xx"
 
 require recipes-ti/includes/arago-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
-file://0001-Makefile-fix-toolchain-variables.patch \
+SRC_URI = " \
+	git://git.ti.com/dense-linear-algebra-libraries/linalg.git;protocol=git;branch=${BRANCH} \
+	file://0001-Makefile-fix-toolchain-variables.patch \
+	file://0001-Makefile-pass-PARALLEL_MAKE-variable-to-overwrite-j8.patch \
 "
-LIC_FILES_CHKSUM = "file://src/ti/linalg/docs/LINALG_1.2.0_manifest.html;md5=f30895e41e5947c3439b1ad4cf4c8555"
+
+BRANCH = "master"
 SRCREV = "01960b319783b29aacf12b2a72606b28d657b78e"
 
 DEPENDS = " \
-common-csl-ip \
-libarch \
-ti-xdctools \
-ti-ipc-rtos \
-ti-sysbios \
-ti-cgt6x-native \
-ti-xdais \
-ti-framework-components \
-libulm \
-openmp-rtos \
-opencl \
-clocl-native \
-doxygen-native \
-zip-native \
+	common-csl-ip \
+	libarch \
+	ti-xdctools \
+	ti-ipc-rtos \
+	ti-sysbios \
+	ti-cgt6x-native \
+	ti-xdais \
+	ti-framework-components \
+	libulm \
+	openmp-rtos \
+	opencl \
+	clocl-native \
+	doxygen-native \
+	zip-native \
 "
 
+S = "${WORKDIR}/git"
+
 export TI_OCL_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/opencl"
 export CGTROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 export TI_OCL_CGT_INSTALL = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
@@ -44,5 +49,3 @@ export PDK_DIR = "${PDK_INSTALL_DIR}"
 export OMP_DIR ="${OMP_INSTALL_DIR}"
 export LIBARCH_DIR = "${LIBARCH_INSTALL_DIR}"
 export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
-
-COMPATIBLE_MACHINE = "k2hk-evm|dra7xx"
diff --git a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
index 935c47e..d250fce 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg_git.bb
@@ -10,12 +10,12 @@ MEM_MODEL_dra7xx     = "Small"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_compile() {
-   make -f build/Makefile MEM_MODEL=${MEM_MODEL} TARGET=${TARGET} LIBOS=LIB_OPENCL
+	make -f build/Makefile MEM_MODEL=${MEM_MODEL} TARGET=${TARGET} LIBOS=LIB_OPENCL PARALLEL_MAKE="${PARALLEL_MAKE}"
 }
 
 do_install() {
-    install -d ${D}${LINALG_INSTALL_DIR_RECIPE}
-    cp -r exports/linalg_${PV}/* ${D}${LINALG_INSTALL_DIR_RECIPE}
+	install -d ${D}${LINALG_INSTALL_DIR_RECIPE}
+	cp -r exports/linalg_${PV}/* ${D}${LINALG_INSTALL_DIR_RECIPE}
 }
 
 # to create a package for LINALG
-- 
2.7.4


