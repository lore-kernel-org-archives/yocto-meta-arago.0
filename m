Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1883F520E2
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 20:46:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MKjg5g057854
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566506742;
	bh=f9DpdmBGBY9+8xsgfVCH9xGG5+OAvsE7UBfmz5lH06o=;
	h=From:To:CC:Subject:Date;
	b=lw32L9STjdvXadWk/O5yfHlVvkLmG79TwW7cRQ2VDdoErDdW49UECtkqra0mEMdqJ
	g73kg3Yg4vgDWycdq60KIaiVOQzDsBqg4MFqVCHgwHOQeYBPXgT+NSctagmlUrQJ6p
	GLHE6rtdkKMOFWPPSDQ4TpFhdI7JP5HEih+nD5S0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MKjgh1123987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:45:42 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 15:45:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 15:45:41 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MKjfTB117764;
	Thu, 22 Aug 2019 15:45:41 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2019 16:45:37 -0400
Message-ID: <20190822204539.6115-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 1/3] tensorflow-lite: add version 1.12
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
X-List-Received-Date: Thu, 22 Aug 2019 20:46:42 -0000
Content-Type: text/plain

* Source of the recipe:
  https://github.com/nnsuite/meta-neural-network/tree/master/recipes-tensorflow/tensorflow-lite
* Further changes from the baseline include:
  1. Replaced moving master with commit ID for NEON2SSE, and updated the checksum;
  2. Replaced AUTOREV with the commit ID for tensorflow version 1.12;
  3. Removed do_configure{} which is not needed;
  4. Removed installation for flatbuffers.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...odification-for-tflite-1.12-to-eigen.patch |  13 ++
 .../files/tensorflow-lite.pc.in               |   6 +
 .../tensorflow-lite/tensorflow-lite_1.12.bb   | 119 ++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
 create mode 100644 recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in
 create mode 100644 recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb

diff --git a/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch b/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
new file mode 100644
index 0000000..1a8de78
--- /dev/null
+++ b/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
@@ -0,0 +1,13 @@
+diff --git a/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h b/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
+index 306a309beb..4527a64c91 100644
+--- a/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
++++ b/tensorflow/contrib/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEON/Complex.h
+@@ -295,7 +295,7 @@ ptranspose(PacketBlock<Packet2cf,2>& kernel) {
+   static uint64x2_t p2ul_CONJ_XOR = {0x0, 0x8000000000000000};
+ #else
+   const uint64_t  p2ul_conj_XOR_DATA[] = { 0x0, 0x8000000000000000 };
+-  static uint64x2_t p2ul_CONJ_XOR = vld1q_u64( p2ul_conj_XOR_DATA );
++  static uint64x2_t p2ul_CONJ_XOR;// = vld1q_u64( p2ul_conj_XOR_DATA ); - Removed by script
+ #endif
+ 
+ struct Packet1cd
diff --git a/recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in b/recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in
new file mode 100644
index 0000000..44afd0e
--- /dev/null
+++ b/recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in
@@ -0,0 +1,6 @@
+ Name: tensorflow lite
+ Description: tensorflow lite static library
+ Version: @version@
+ Requires:
+ Libs: -L@libdir@ -ltensorflow-lite
+ Cflags: -I@includedir@
diff --git a/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
new file mode 100644
index 0000000..ebd175e
--- /dev/null
+++ b/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -0,0 +1,119 @@
+DESCRIPTION = "TensorFlow's lightweight solution for mobile and embedded devices"
+AUTHOR = "Google Inc. and Yuan Tang"
+HOMEPAGE = "https://www.tensorflow.org/lite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
+
+MD5SUM_EIGEN = "4c884968ede816a84c70e2cd2c81de8d"
+SHA256SUM_EIGEN = "d956415d784fa4e42b6a2a45c32556d6aec9d0a3d8ef48baee2522ab762556a9"
+MD5SUM_FARMHASH = "f039a65a7f62bdb6c4b4c8a732638d80"
+SHA256SUM_FARMHASH = "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
+MD5SUM_GEMMLOWP = "a90a2161ad8ee4ccf724f56e07637601"
+SHA256SUM_GEMMLOWP = "b87faa7294dfcc5d678f22a59d2c01ca94ea1e2a3b488c38a95a67889ed0a658"
+MD5SUM_GTEST = "16877098823401d1bf2ed7891d7dce36"
+SHA256SUM_GTEST = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
+MD5SUM_ABSLCPP = "7c9945f256d3733a8eade255afcbd072"
+SHA256SUM_ABSLCPP = "7dd09690ae7ca4551de3111d4a86b75b23ec17445f273d3c42bdcdc1c7b02e4e"
+MD5SUM_NEON2SSE = "276619db5393450c223b7c4e47e848ce"
+SHA256SUM_NEON2SSE = "8cc98e95c86d362dd6f003b35a9517a9928e3fd387b33188b0442df13245a17b"
+MD5SUM_FLATBUFFER = "3811552512049fac3af419130904bc55"
+SHA256SUM_FLATBUFFER = "b2bb0311ca40b12ebe36671bdda350b10c7728caf0cfe2d432ea3b6e409016f3"
+MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
+SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
+
+SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=https \
+    https://bitbucket.org/eigen/eigen/get/fd6845384b86.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
+    https://mirror.bazel.build/github.com/google/gemmlowp/archive/38ebac7b059e84692f53e5938f97a9943c120d98.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
+    https://github.com/google/googletest/archive/release-1.8.0.tar.gz;md5sum=${MD5SUM_GTEST};sha256sum=${SHA256SUM_GTEST} \
+    https://github.com/abseil/abseil-cpp/archive/48cd2c3f351ff188bc85684b84a91b6e6d17d896.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
+    https://github.com/intel/ARM_NEON_2_x86_SSE/archive/3057bb91b99bae9c7fbdf8710c032d462ca10051.zip;md5sum=${MD5SUM_NEON2SSE};sha256sum=${SHA256SUM_NEON2SSE} \
+    https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
+    https://github.com/google/flatbuffers/archive/1f5eae5d6a135ff6811724f6c57f911d1f46bb15.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
+    https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
+    file://apply-modification-for-tflite-1.12-to-eigen.patch \
+    file://tensorflow-lite.pc.in"
+
+SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
+
+PR = "r1"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "zlib"
+TARGET_CFLAGS_remove = "-O2"
+TARGET_CPPLAGS_remove = "-O2"
+TARGET_CXXLAGS_remove = "-O2"
+CCFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -I${STAGING_INCDIR}"
+CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -I${STAGING_INCDIR}"
+LDFLAGS_remove = "-Wl,-O1"
+CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -I${STAGING_INCDIR}"
+LIBS = "-lstdc++ -lpthread -lm -lz -ldl"
+BUILD_DEPS_DOWNLOAD_DIR_PREFIX = "${S}/tensorflow/contrib/lite/tools/make/downloads/"
+
+do_cp_downloaded_build_deps() {
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
+    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
+
+    cp -rf ${WORKDIR}/eigen-eigen-fd6845384b86/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
+    cp -rf ${WORKDIR}/gemmlowp-38ebac7b059e84692f53e5938f97a9943c120d98/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
+    cp -rf ${WORKDIR}/googletest-release-1.8.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
+    cp -rf ${WORKDIR}/abseil-cpp-48cd2c3f351ff188bc85684b84a91b6e6d17d896/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
+    cp -rf ${WORKDIR}/farmhash-816a4ae622e964763ca0862d9dbd19324a1eaf45/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
+    cp -rf ${WORKDIR}/ARM_NEON_2_x86_SSE-3057bb91b99bae9c7fbdf8710c032d462ca10051/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
+    cp -rf ${WORKDIR}/flatbuffers-1f5eae5d6a135ff6811724f6c57f911d1f46bb15/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
+    cp -rf ${WORKDIR}/fft/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
+}
+addtask do_cp_downloaded_build_deps after do_unpack before do_patch
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CXX=${CXX}' \
+    'CPP=${CPP}' \
+    'CFLAGS=${CFLAGS}' \
+    'CPPFLAGS=${CFLAGS}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'AR=${AR}' \
+    'LD=${LD}' \
+    'LDFLAGS=${LDFLAGS}' \
+    'LIBS=${LIBS}' \
+    'TARGET=${TARGET_OS}' \
+    'TARGET_ARCH=${TUNE_ARCH}'"
+
+do_compile() {
+    oe_runmake -f tensorflow/contrib/lite/tools/make/Makefile
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0644 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/libtensorflow-lite.a ${D}${libdir}/
+    install -d ${D}${includedir}/tensorflow/contrib/lite
+    install -m 0644 ${S}/tensorflow/contrib/lite/*.h ${D}${includedir}/tensorflow/contrib/lite/
+    install -d ${D}${includedir}/tensorflow/contrib/lite/c
+    install -m 0644 ${S}/tensorflow/contrib/lite/c/*.h ${D}${includedir}/tensorflow/contrib/lite/c/
+    install -d ${D}${includedir}/tensorflow/contrib/lite/core/api/
+    install -m 0644 ${S}/tensorflow/contrib/lite/core/api/*.h ${D}${includedir}/tensorflow/contrib/lite/core/api/
+    install -d ${D}${includedir}/tensorflow/contrib/lite/kernels
+    install -m 0644 ${S}/tensorflow/contrib/lite/kernels/*.h ${D}${includedir}/tensorflow/contrib/lite/kernels/
+    install -d  ${D}${includedir}/tensorflow/contrib/lite/profiling/
+    install -m 0644 ${S}/tensorflow/contrib/lite/profiling/*.h ${D}${includedir}/tensorflow/contrib/lite/profiling/
+    install -d ${D}${includedir}/tensorflow/contrib/lite/schema/
+    install -m 0644 ${S}/tensorflow/contrib/lite/schema/*.h ${D}${includedir}/tensorflow/contrib/lite/schema/
+    install -d ${D}${includedir}/tensorflow/contrib/lite/tools/
+    install -m 0644 ${S}/tensorflow/contrib/lite/tools/*.h ${D}${includedir}/tensorflow/contrib/lite/tools/
+    install -d ${D}${libdir}/pkgconfig
+    install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
+    sed -i 's:@version@:${PV}:g
+        s:@libdir@:${libdir}:g
+        s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
+}
+
+ALLOW_EMPTY_${PN} = "1"
-- 
2.17.1


