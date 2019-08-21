Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1B640529F6
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwL9p112929
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428301;
	bh=xloA+dg2nH9H6iz0TNLMeQgaJGb5yXRxm5XGHOP67pM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jXAa27VtLtUp3r2tDligT4ImE74b9DrOhgqoCTc3G4qYzLkoNyA6JyC5h8l9CjW5X
	GRKWTKymy2jgkp3frusoV2UUijE0MpFmvB2ATYLw02UNHkt4FPM224dW+sFR67gvhu
	n/QXt9CtX3SJzv74cT4fBHLMjHZSuRPuFtPJmizc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwLrx080640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:21 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCg074536;
	Wed, 21 Aug 2019 17:58:21 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:05 -0400
Message-ID: <20190821225807.22947-6-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821225807.22947-1-a0271529@ti.com>
References: <20190821225807.22947-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 5/7] tensorflow-lite: define dependencies via DEPENDS
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
X-List-Received-Date: Wed, 21 Aug 2019 22:59:22 -0000
Content-Type: text/plain

* Remove the step of downloading and copying the dependencies
* A few other changes: 1) replace AUTOREV with commit ID;
  2) remove do_configure{} which is not needed; 3) remove
  installation for flatbuffers

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...the-path-for-the-depedencies-built-v.patch | 50 +++++++++++++++
 .../tensorflow-lite/tensorflow-lite_1.12.bb   | 64 +++----------------
 2 files changed, 58 insertions(+), 56 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-update-the-path-for-the-depedencies-built-v.patch

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-update-the-path-for-the-depedencies-built-v.patch b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-update-the-path-for-the-depedencies-built-v.patch
new file mode 100644
index 00000000..58ff81ba
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-update-the-path-for-the-depedencies-built-v.patch
@@ -0,0 +1,50 @@
+From dfe8afa41f7f4bf2cb24853a1385e90da7fd6cc3 Mon Sep 17 00:00:00 2001
+From: Hongmei Gou <a0271529@ti.com>
+Date: Wed, 21 Aug 2019 17:31:53 -0400
+Subject: [PATCH] Makefile: update the path for the depedencies built via Yocto
+
+Upstream-Status: Inappropriate [applicable to Yocto build only]
+
+Signed-off-by: Hongmei Gou <a0271529@ti.com>
+---
+ tensorflow/contrib/lite/tools/make/Makefile | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/tensorflow/contrib/lite/tools/make/Makefile b/tensorflow/contrib/lite/tools/make/Makefile
+index 16012a3fb1..8b1b05b280 100644
+--- a/tensorflow/contrib/lite/tools/make/Makefile
++++ b/tensorflow/contrib/lite/tools/make/Makefile
+@@ -28,13 +28,12 @@ INCLUDES := \
+ -I. \
+ -I$(MAKEFILE_DIR)/../../../../../ \
+ -I$(MAKEFILE_DIR)/../../../../../../ \
+--I$(MAKEFILE_DIR)/downloads/ \
+--I$(MAKEFILE_DIR)/downloads/eigen \
+--I$(MAKEFILE_DIR)/downloads/absl \
+--I$(MAKEFILE_DIR)/downloads/gemmlowp \
+--I$(MAKEFILE_DIR)/downloads/neon_2_sse \
+--I$(MAKEFILE_DIR)/downloads/farmhash/src \
+--I$(MAKEFILE_DIR)/downloads/flatbuffers/include \
++-I$(DEPINC_DIR)/eigen3 \
++-I$(DEPINC_DIR)/flatbuffers/include \
++-I$(DEPDATA_DIR)/absl \
++-I$(DEPDATA_DIR)/gemmlowp \
++-I$(DEPDATA_DIR)/neon_2_sse \
++-I$(DEPDATA_DIR)/farmhash/src \
+ -I$(OBJDIR)
+ # This is at the end so any globally-installed frameworks like protobuf don't
+ # override local versions in the source tree.
+@@ -97,8 +96,8 @@ $(wildcard tensorflow/contrib/lite/kernels/*.c) \
+ $(wildcard tensorflow/contrib/lite/kernels/internal/*.c) \
+ $(wildcard tensorflow/contrib/lite/kernels/internal/optimized/*.c) \
+ $(wildcard tensorflow/contrib/lite/kernels/internal/reference/*.c) \
+-$(wildcard tensorflow/contrib/lite/tools/make/downloads/farmhash/src/farmhash.cc) \
+-$(wildcard tensorflow/contrib/lite/tools/make/downloads/fft2d/fftsg.c)
++$(wildcard $(DEPDATA_DIR)/farmhash/src/farmhash.cc) \
++$(wildcard $(DEPDATA_DIR)/fft2d/fftsg.c)
+ endif
+ # Remove any duplicates.
+ CORE_CC_ALL_SRCS := $(sort $(CORE_CC_ALL_SRCS))
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
index 5f35fa26..b5112939 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -4,40 +4,18 @@ HOMEPAGE = "https://www.tensorflow.org/lite"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
 
-MD5SUM_EIGEN = "4c884968ede816a84c70e2cd2c81de8d"
-SHA256SUM_EIGEN = "d956415d784fa4e42b6a2a45c32556d6aec9d0a3d8ef48baee2522ab762556a9"
-MD5SUM_FARMHASH = "f039a65a7f62bdb6c4b4c8a732638d80"
-SHA256SUM_FARMHASH = "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
-MD5SUM_GEMMLOWP = "a90a2161ad8ee4ccf724f56e07637601"
-SHA256SUM_GEMMLOWP = "b87faa7294dfcc5d678f22a59d2c01ca94ea1e2a3b488c38a95a67889ed0a658"
-MD5SUM_GTEST = "16877098823401d1bf2ed7891d7dce36"
-SHA256SUM_GTEST = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
-MD5SUM_ABSLCPP = "7c9945f256d3733a8eade255afcbd072"
-SHA256SUM_ABSLCPP = "7dd09690ae7ca4551de3111d4a86b75b23ec17445f273d3c42bdcdc1c7b02e4e"
-MD5SUM_NEON2SSE = "11fb94c08a43f88a68a9edff317d82d0"
-SHA256SUM_NEON2SSE = "70526166a054f64b254213e9dc227b5877a21b621161e9907931093cc30341dd"
-MD5SUM_FLATBUFFER = "3811552512049fac3af419130904bc55"
-SHA256SUM_FLATBUFFER = "b2bb0311ca40b12ebe36671bdda350b10c7728caf0cfe2d432ea3b6e409016f3"
-MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
-SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
-
 SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=https \
-    https://bitbucket.org/eigen/eigen/get/fd6845384b86.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
-    https://mirror.bazel.build/github.com/google/gemmlowp/archive/38ebac7b059e84692f53e5938f97a9943c120d98.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
-    https://github.com/google/googletest/archive/release-1.8.0.tar.gz;md5sum=${MD5SUM_GTEST};sha256sum=${SHA256SUM_GTEST} \
-    https://github.com/abseil/abseil-cpp/archive/48cd2c3f351ff188bc85684b84a91b6e6d17d896.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
-    https://github.com/intel/ARM_NEON_2_x86_SSE/archive/master.zip;md5sum=${MD5SUM_NEON2SSE};sha256sum=${SHA256SUM_NEON2SSE} \
-    https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
-    https://github.com/google/flatbuffers/archive/1f5eae5d6a135ff6811724f6c57f911d1f46bb15.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
-    https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
-    file://apply-modification-for-tflite-1.12-to-eigen.patch \
+    file://0001-Makefile-update-the-path-for-the-depedencies-built-v.patch \
     file://tensorflow-lite.pc.in"
 
-SRCREV = "${AUTOREV}"
+SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
+
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib flatbuffers tensorflow-lite-libeigen tensorflow-lite-absl tensorflow-lite-gemmlowp tensorflow-lite-farmhash tensorflow-lite-neon-2-sse tensorflow-lite-fft2d"
+
 TARGET_CFLAGS_remove = "-O2"
 TARGET_CPPLAGS_remove = "-O2"
 TARGET_CXXLAGS_remove = "-O2"
@@ -49,28 +27,6 @@ LDFLAGS_remove = "-Wl,-O1"
 CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
     -I${STAGING_INCDIR}"
 LIBS = "-lstdc++ -lpthread -lm -lz -ldl"
-BUILD_DEPS_DOWNLOAD_DIR_PREFIX = "${S}/tensorflow/contrib/lite/tools/make/downloads/"
-
-do_cp_downloaded_build_deps() {
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
-
-    cp -rf ${WORKDIR}/eigen-eigen-fd6845384b86/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
-    cp -rf ${WORKDIR}/gemmlowp-38ebac7b059e84692f53e5938f97a9943c120d98/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
-    cp -rf ${WORKDIR}/googletest-release-1.8.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
-    cp -rf ${WORKDIR}/abseil-cpp-48cd2c3f351ff188bc85684b84a91b6e6d17d896/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
-    cp -rf ${WORKDIR}/farmhash-816a4ae622e964763ca0862d9dbd19324a1eaf45/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
-    cp -rf ${WORKDIR}/ARM_NEON_2_x86_SSE-master/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
-    cp -rf ${WORKDIR}/flatbuffers-1f5eae5d6a135ff6811724f6c57f911d1f46bb15/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
-    cp -rf ${WORKDIR}/fft/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
-}
-addtask do_cp_downloaded_build_deps after do_unpack before do_patch
 
 EXTRA_OEMAKE = "\
     'CC=${CC}' \
@@ -83,12 +39,11 @@ EXTRA_OEMAKE = "\
     'LD=${LD}' \
     'LDFLAGS=${LDFLAGS}' \
     'LIBS=${LIBS}' \
+    'DEPINC_DIR=${STAGING_DIR_HOST}${includedir}' \
+    'DEPDATA_DIR=${STAGING_DIR_HOST}${datadir}' \
     'TARGET=${TARGET_OS}' \
     'TARGET_ARCH=${TUNE_ARCH}'"
 
-do_configure() {
-    oe_runmake -f tensorflow/contrib/lite/tools/make/Makefile clean
-}
 
 do_compile() {
     oe_runmake -f tensorflow/contrib/lite/tools/make/Makefile
@@ -116,9 +71,6 @@ do_install() {
     sed -i 's:@version@:${PV}:g
         s:@libdir@:${libdir}:g
         s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
-    # flatbuffers
-    install -d  ${D}${includedir}/flatbuffers
-    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/downloads/flatbuffers/include/flatbuffers/*.h ${D}${includedir}/flatbuffers/
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.17.1


