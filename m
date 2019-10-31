Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5F0BB52A10
	for <meta-arago@arago-project.org>;
	Thu, 31 Oct 2019 14:59:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VEwCAs040009
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2019 09:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572533892;
	bh=43z54QSnwzN1pqFsNNJxe1K4EfHfxiFUa03H9BlAsqs=;
	h=From:To:CC:Subject:Date;
	b=kcDbvPcZ6GP/Kq3tDBaT+X1CcfHJQ3Tm28KbWWyRYLVb+n7dorVoqf2XHGxukuJQs
	gHyon8a1mnHZqtUSYAPy5vbhdhK/kU+zZIAa7KAzBtPyvblh8KaXlbAIn7NBR2euMK
	ybB/AejuwChJebgMQOPU9qzd4+WOb3dmRRSArpxA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VEwCXb033073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2019 09:58:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 31 Oct 2019 09:57:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 31 Oct 2019 09:57:58 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VEwBpa047829;
	Thu, 31 Oct 2019 09:58:11 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 31 Oct 2019 10:55:18 -0400
Message-ID: <20191031145518.29621-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 2/3 v3] tensorflow-lite: update to version 1.15
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
X-List-Received-Date: Thu, 31 Oct 2019 14:59:33 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v3 change: update the source link for gemmlowp

 ...kefile-add-label_image-example-1.15.patch} | 71 +++++++-------
 ...dification-for-tflite-1.15-to-eigen.patch} | 10 +-
 ...w-lite_1.12.bb => tensorflow-lite_1.15.bb} | 92 +++++++++----------
 3 files changed, 83 insertions(+), 90 deletions(-)
 rename meta-arago-extras/recipes-support/tensorflow-lite/files/{0001-Makefile-add-label_image-example.patch => 0001-Makefile-add-label_image-example-1.15.patch} (46%)
 rename meta-arago-extras/recipes-support/tensorflow-lite/files/{apply-modification-for-tflite-1.12-to-eigen.patch => apply-modification-for-tflite-1.15-to-eigen.patch} (45%)
 rename meta-arago-extras/recipes-support/tensorflow-lite/{tensorflow-lite_1.12.bb => tensorflow-lite_1.15.bb} (50%)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.patch
similarity index 46%
rename from meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch
rename to meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.patch
index 61f821e3..ef5e1cbf 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.patch
@@ -1,50 +1,41 @@
-From 87cf7e879640436f19f26e338dce6c343c19bfd8 Mon Sep 17 00:00:00 2001
+From 481c021e98c443195b73484fd0d9d50a2e0ae69a Mon Sep 17 00:00:00 2001
 From: Hongmei Gou <a0271529@ti.com>
-Date: Wed, 21 Aug 2019 18:03:17 -0400
+Date: Wed, 25 Sep 2019 18:07:04 -0400
 Subject: [PATCH] Makefile: add label_image example
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongmei Gou <a0271529@ti.com>
 ---
- tensorflow/contrib/lite/tools/make/Makefile | 21 +++++++++++++++++++--
- 1 file changed, 19 insertions(+), 2 deletions(-)
+ tensorflow/lite/tools/make/Makefile | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
 
-diff --git a/tensorflow/contrib/lite/tools/make/Makefile b/tensorflow/contrib/lite/tools/make/Makefile
-index 16012a3fb1..a5e5cb3fc7 100644
---- a/tensorflow/contrib/lite/tools/make/Makefile
-+++ b/tensorflow/contrib/lite/tools/make/Makefile
-@@ -72,6 +72,11 @@ BENCHMARK_BINARY_NAME := benchmark_model
- MINIMAL_SRCS := \
- tensorflow/contrib/lite/examples/minimal/minimal.cc
+diff --git a/tensorflow/lite/tools/make/Makefile b/tensorflow/lite/tools/make/Makefile
+index 73c50d3272..e2f664e1eb 100644
+--- a/tensorflow/lite/tools/make/Makefile
++++ b/tensorflow/lite/tools/make/Makefile
+@@ -201,6 +201,12 @@ BENCHMARK_SRCS := $(filter-out \
+ 	$(BENCHMARK_SRCS_DIR)/benchmark_plus_flex_main.cc, \
+ 	$(BENCHMARK_ALL_SRCS))
  
 +# label image example
 +LABELIMAGE_SRCS := \
-+tensorflow/contrib/lite/examples/label_image/bitmap_helpers.cc \
-+tensorflow/contrib/lite/examples/label_image/label_image.cc
++	tensorflow/lite/examples/label_image/bitmap_helpers.cc \
++	tensorflow/lite/examples/label_image/label_image.cc \
++	$(EVALUATION_UTILS_SRCS)
 +
- # What sources we want to compile, must be kept in sync with the main Bazel
- # build files.
- 
-@@ -108,7 +113,8 @@ $(wildcard tensorflow/contrib/lite/*/*test.cc) \
- $(wildcard tensorflow/contrib/lite/*/*/*test.cc) \
- $(wildcard tensorflow/contrib/lite/*/*/*/*test.cc) \
- $(wildcard tensorflow/contrib/lite/kernels/test_util.cc) \
--$(MINIMAL_SRCS)
-+$(MINIMAL_SRCS) \
-+$(LABELIMAGE_SRCS)
- ifeq ($(BUILD_TYPE),micro)
- CORE_CC_EXCLUDE_SRCS += \
- tensorflow/contrib/lite/mmap_allocation.cc \
-@@ -135,6 +141,7 @@ include $(wildcard $(MAKEFILE_DIR)/targets/*_makefile.inc)
+ # These target-specific makefiles should modify or replace options like
+ # CXXFLAGS or LIBS to work for a specific targetted architecture. All logic
+ # based on platforms or architectures should happen within these files, to
+@@ -209,6 +215,7 @@ include $(wildcard $(MAKEFILE_DIR)/targets/*_makefile.inc)
  
  ALL_SRCS := \
  	$(MINIMAL_SRCS) \
 +	$(LABELIMAGE_SRCS) \
  	$(PROFILER_SRCS) \
- 	$(PROFILER_SUMMARY_SRCS) \
+ 	$(PROFILER_SUMMARIZER_SRCS) \
  	$(TF_LITE_CC_SRCS) \
-@@ -150,6 +157,7 @@ LIB_PATH := $(LIBDIR)$(LIB_NAME)
+@@ -225,6 +232,7 @@ LIB_PATH := $(LIBDIR)$(LIB_NAME)
  BENCHMARK_LIB := $(LIBDIR)$(BENCHMARK_LIB_NAME)
  BENCHMARK_BINARY := $(BINDIR)$(BENCHMARK_BINARY_NAME)
  MINIMAL_BINARY := $(BINDIR)minimal
@@ -52,7 +43,7 @@ index 16012a3fb1..a5e5cb3fc7 100644
  
  CXX := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}g++
  CC := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}gcc
-@@ -158,6 +166,9 @@ AR := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}ar
+@@ -233,6 +241,9 @@ AR := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}ar
  MINIMAL_OBJS := $(addprefix $(OBJDIR), \
  $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(MINIMAL_SRCS))))
  
@@ -60,10 +51,10 @@ index 16012a3fb1..a5e5cb3fc7 100644
 +$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(LABELIMAGE_SRCS))))
 +
  LIB_OBJS := $(addprefix $(OBJDIR), \
- $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(TF_LITE_CC_SRCS))))
+ $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(TF_LITE_CC_SRCS)))))
  
-@@ -174,7 +185,7 @@ $(OBJDIR)%.o: %.c
- 	$(CC) $(CCFLAGS) $(INCLUDES) -c $< -o $@
+@@ -252,7 +263,7 @@ $(OBJDIR)%.o: %.cpp
+ 	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@
  
  # The target that's compiled if there's no command-line arguments.
 -all: $(LIB_PATH)  $(MINIMAL_BINARY) $(BENCHMARK_BINARY)
@@ -71,9 +62,9 @@ index 16012a3fb1..a5e5cb3fc7 100644
  
  # The target that's compiled for micro-controllers
  micro: $(LIB_PATH)
-@@ -198,6 +209,12 @@ $(BENCHMARK_LIB) : $(LIB_PATH) $(BENCHMARK_OBJS)
- 	@mkdir -p $(dir $@)
- 	$(AR) $(ARFLAGS) $(BENCHMARK_LIB) $(LIB_OBJS) $(BENCHMARK_OBJS)
+@@ -276,6 +287,14 @@ $(MINIMAL_BINARY): $(MINIMAL_OBJS) $(LIB_PATH)
+ 
+ minimal: $(MINIMAL_BINARY)
  
 +$(LABELIMAGE_BINARY): $(LABELIMAGE_OBJS) $(LIB_PATH)
 +	@mkdir -p $(dir $@)
@@ -81,9 +72,11 @@ index 16012a3fb1..a5e5cb3fc7 100644
 +	-o $(LABELIMAGE_BINARY) $(LABELIMAGE_OBJS) \
 +	$(LIBFLAGS) $(LIB_PATH) $(LDFLAGS) $(LIBS)
 +
- benchmark_lib: $(BENCHMARK_LIB)
- 
- $(BENCHMARK_BINARY) : $(BENCHMARK_LIB)
++label_image: $(LABELIMAGE_BINARY)
++
+ $(BENCHMARK_LIB) : $(LIB_PATH) $(BENCHMARK_OBJS)
+ 	@mkdir -p $(dir $@)
+ 	$(AR) $(ARFLAGS) $(BENCHMARK_LIB) $(LIB_OBJS) $(BENCHMARK_OBJS)
 -- 
 2.17.1
 
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch b/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.15-to-eigen.patch
similarity index 45%
rename from meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
rename to meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.15-to-eigen.patch
index 1a8de78b..06c9c63a 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.15-to-eigen.patch
@@ -1,13 +1,13 @@
-diff --git a/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h b/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
+diff --git a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h b/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
 index 306a309beb..4527a64c91 100644
---- a/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
-+++ b/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
-@@ -295,7 +295,7 @@ ptranspose(PacketBlock<Packet2cf,2>& kernel) {
+--- a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
++++ b/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
+@@ -307,7 +307,7 @@
    static uint64x2_t p2ul_CONJ_XOR = {0x0, 0x8000000000000000};
  #else
    const uint64_t  p2ul_conj_XOR_DATA[] = { 0x0, 0x8000000000000000 };
 -  static uint64x2_t p2ul_CONJ_XOR = vld1q_u64( p2ul_conj_XOR_DATA );
 +  static uint64x2_t p2ul_CONJ_XOR;// = vld1q_u64( p2ul_conj_XOR_DATA ); - Removed by script
  #endif
- 
+
  struct Packet1cd
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
similarity index 50%
rename from meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
rename to meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index ba9f0d4c..612440c3 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -2,45 +2,45 @@ DESCRIPTION = "TensorFlow's lightweight solution for mobile and embedded devices
 AUTHOR = "Google Inc. and Yuan Tang"
 HOMEPAGE = "https://www.tensorflow.org/lite"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64a34301f8e355f57ec992c2af3e5157"
 
-MD5SUM_EIGEN = "4c884968ede816a84c70e2cd2c81de8d"
-SHA256SUM_EIGEN = "d956415d784fa4e42b6a2a45c32556d6aec9d0a3d8ef48baee2522ab762556a9"
+MD5SUM_EIGEN = "a28a728acb3298471b11132ab5c0c3cb"
+SHA256SUM_EIGEN = "7e7a57e33c59280a17a66e521396cd8b1a55d0676c9f807078522fda52114b5c"
 MD5SUM_FARMHASH = "f039a65a7f62bdb6c4b4c8a732638d80"
 SHA256SUM_FARMHASH = "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
-MD5SUM_GEMMLOWP = "a90a2161ad8ee4ccf724f56e07637601"
-SHA256SUM_GEMMLOWP = "b87faa7294dfcc5d678f22a59d2c01ca94ea1e2a3b488c38a95a67889ed0a658"
+MD5SUM_GEMMLOWP = "09cf63d1d388a2753de3323684da70ed"
+SHA256SUM_GEMMLOWP = "6678b484d929f2d0d3229d8ac4e3b815a950c86bb9f17851471d143f6d4f7834"
 MD5SUM_GTEST = "16877098823401d1bf2ed7891d7dce36"
 SHA256SUM_GTEST = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
-MD5SUM_ABSLCPP = "7c9945f256d3733a8eade255afcbd072"
-SHA256SUM_ABSLCPP = "7dd09690ae7ca4551de3111d4a86b75b23ec17445f273d3c42bdcdc1c7b02e4e"
+MD5SUM_ABSLCPP = "7abf3aae8d57874d2eb04c4b92736208"
+SHA256SUM_ABSLCPP = "acd93f6baaedc4414ebd08b33bebca7c7a46888916101d8c0b8083573526d070"
 MD5SUM_NEON2SSE = "276619db5393450c223b7c4e47e848ce"
 SHA256SUM_NEON2SSE = "8cc98e95c86d362dd6f003b35a9517a9928e3fd387b33188b0442df13245a17b"
-MD5SUM_FLATBUFFER = "3811552512049fac3af419130904bc55"
-SHA256SUM_FLATBUFFER = "b2bb0311ca40b12ebe36671bdda350b10c7728caf0cfe2d432ea3b6e409016f3"
+MD5SUM_FLATBUFFER = "02c64880acb89dbd57eebacfd67200d8"
+SHA256SUM_FLATBUFFER = "3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b"
 MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
 SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
 
-SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=https \
-    https://bitbucket.org/eigen/eigen/get/fd6845384b86.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
-    https://mirror.bazel.build/github.com/google/gemmlowp/archive/38ebac7b059e84692f53e5938f97a9943c120d98.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
+SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};protocol=https \
+    https://bitbucket.org/eigen/eigen/get/8071cda5714d.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
+    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/gemmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
     https://github.com/google/googletest/archive/release-1.8.0.tar.gz;md5sum=${MD5SUM_GTEST};sha256sum=${SHA256SUM_GTEST} \
-    https://github.com/abseil/abseil-cpp/archive/48cd2c3f351ff188bc85684b84a91b6e6d17d896.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
+    https://github.com/abseil/abseil-cpp/archive/43ef2148c0936ebf7cb4be6b19927a9d9d145b8f.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
     https://github.com/intel/ARM_NEON_2_x86_SSE/archive/3057bb91b99bae9c7fbdf8710c032d462ca10051.zip;md5sum=${MD5SUM_NEON2SSE};sha256sum=${SHA256SUM_NEON2SSE} \
     https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
-    https://github.com/google/flatbuffers/archive/1f5eae5d6a135ff6811724f6c57f911d1f46bb15.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
+    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/flatbuffers/archive/v1.11.0.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
     https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
     http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
-    file://apply-modification-for-tflite-1.12-to-eigen.patch \
-    file://0001-Makefile-add-label_image-example.patch \
+    file://apply-modification-for-tflite-${PV}-to-eigen.patch \
+    file://0001-Makefile-add-label_image-example-${PV}.patch \
     file://tensorflow-lite.pc.in"
 
 SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
 SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
 
-SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
+SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
 
-PR = "r4"
+PR = "r0"
 
 S = "${WORKDIR}/git"
 
@@ -55,8 +55,8 @@ CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
 LDFLAGS_remove = "-Wl,-O1"
 CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
     -I${STAGING_INCDIR}"
-LIBS = "-lstdc++ -lpthread -lm -lz -ldl"
-BUILD_DEPS_DOWNLOAD_DIR_PREFIX = "${S}/tensorflow/contrib/lite/tools/make/downloads/"
+LIBS = "-lstdc++ -lpthread -lm -lz -ldl -lrt"
+BUILD_DEPS_DOWNLOAD_DIR_PREFIX = "${S}/tensorflow/lite/tools/make/downloads/"
 
 do_cp_downloaded_build_deps() {
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
@@ -68,13 +68,13 @@ do_cp_downloaded_build_deps() {
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
 
-    cp -rf ${WORKDIR}/eigen-eigen-fd6845384b86/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
-    cp -rf ${WORKDIR}/gemmlowp-38ebac7b059e84692f53e5938f97a9943c120d98/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
+    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
+    cp -rf ${WORKDIR}/gemmlowp-12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
     cp -rf ${WORKDIR}/googletest-release-1.8.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
-    cp -rf ${WORKDIR}/abseil-cpp-48cd2c3f351ff188bc85684b84a91b6e6d17d896/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
+    cp -rf ${WORKDIR}/abseil-cpp-43ef2148c0936ebf7cb4be6b19927a9d9d145b8f/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
     cp -rf ${WORKDIR}/farmhash-816a4ae622e964763ca0862d9dbd19324a1eaf45/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
     cp -rf ${WORKDIR}/ARM_NEON_2_x86_SSE-3057bb91b99bae9c7fbdf8710c032d462ca10051/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
-    cp -rf ${WORKDIR}/flatbuffers-1f5eae5d6a135ff6811724f6c57f911d1f46bb15/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
+    cp -rf ${WORKDIR}/flatbuffers-1.11.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
     cp -rf ${WORKDIR}/fft/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
 }
 addtask do_cp_downloaded_build_deps after do_unpack before do_patch
@@ -94,27 +94,27 @@ EXTRA_OEMAKE = "\
     'TARGET_ARCH=${TUNE_ARCH}'"
 
 do_compile() {
-    oe_runmake -f tensorflow/contrib/lite/tools/make/Makefile
+    oe_runmake -f tensorflow/lite/tools/make/Makefile
 }
 
 do_install() {
     install -d ${D}${libdir}
-    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/
-    install -d ${D}${includedir}/tensorflow/contrib/lite
-    install -m 0644 ${S}/tensorflow/contrib/lite/*.h ${D}${includedir}/tensorflow/contrib/lite/
-    install -d ${D}${includedir}/tensorflow/contrib/lite/c
-    install -m 0644 ${S}/tensorflow/contrib/lite/c/*.h ${D}${includedir}/tensorflow/contrib/lite/c/
-    install -d ${D}${includedir}/tensorflow/contrib/lite/core/api/
-    install -m 0644 ${S}/tensorflow/contrib/lite/core/api/*.h ${D}${includedir}/tensorflow/contrib/lite/core/api/
-    install -d ${D}${includedir}/tensorflow/contrib/lite/kernels
-    install -m 0644 ${S}/tensorflow/contrib/lite/kernels/*.h ${D}${includedir}/tensorflow/contrib/lite/kernels/
-    install -d  ${D}${includedir}/tensorflow/contrib/lite/profiling/
-    install -m 0644 ${S}/tensorflow/contrib/lite/profiling/*.h ${D}${includedir}/tensorflow/contrib/lite/profiling/
-    install -d ${D}${includedir}/tensorflow/contrib/lite/schema/
-    install -m 0644 ${S}/tensorflow/contrib/lite/schema/*.h ${D}${includedir}/tensorflow/contrib/lite/schema/
-    install -m 0644 ${S}/tensorflow/contrib/lite/schema/schema.fbs ${D}${includedir}/tensorflow/contrib/lite/schema/
-    install -d ${D}${includedir}/tensorflow/contrib/lite/tools/
-    install -m 0644 ${S}/tensorflow/contrib/lite/tools/*.h ${D}${includedir}/tensorflow/contrib/lite/tools/
+    install -m 0644 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/
+    install -d ${D}${includedir}/tensorflow/lite
+    install -m 0644 ${S}/tensorflow/lite/*.h ${D}${includedir}/tensorflow/lite/
+    install -d ${D}${includedir}/tensorflow/lite/c
+    install -m 0644 ${S}/tensorflow/lite/c/*.h ${D}${includedir}/tensorflow/lite/c/
+    install -d ${D}${includedir}/tensorflow/lite/core/api/
+    install -m 0644 ${S}/tensorflow/lite/core/api/*.h ${D}${includedir}/tensorflow/lite/core/api/
+    install -d ${D}${includedir}/tensorflow/lite/kernels
+    install -m 0644 ${S}/tensorflow/lite/kernels/*.h ${D}${includedir}/tensorflow/lite/kernels/
+    install -d  ${D}${includedir}/tensorflow/lite/profiling/
+    install -m 0644 ${S}/tensorflow/lite/profiling/*.h ${D}${includedir}/tensorflow/lite/profiling/
+    install -d ${D}${includedir}/tensorflow/lite/schema/
+    install -m 0644 ${S}/tensorflow/lite/schema/*.h ${D}${includedir}/tensorflow/lite/schema/
+    install -m 0644 ${S}/tensorflow/lite/schema/schema.fbs ${D}${includedir}/tensorflow/lite/schema/
+    install -d ${D}${includedir}/tensorflow/lite/tools/
+    install -m 0644 ${S}/tensorflow/lite/tools/*.h ${D}${includedir}/tensorflow/lite/tools/
     install -d ${D}${libdir}/pkgconfig
     install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
     sed -i 's:@version@:${PV}:g
@@ -122,11 +122,11 @@ do_install() {
         s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
     # install examples
     install -d ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0644 ${S}/tensorflow/contrib/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0644 ${S}/tensorflow/contrib/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${PN}-${PV}/examples
     install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${PN}-${PV}/examples
 }
 
-- 
2.17.1


