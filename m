Return-Path: <p-carrillo@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8CEA752985
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 19:53:09 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JJo5Lv044553
	for <meta-arago@arago-project.org>; Mon, 19 Oct 2020 14:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603137005;
	bh=U1uWsTM2Iv6zTdoqaYLnhgbXxpvKPT81941+QNKG47E=;
	h=From:To:CC:Subject:Date;
	b=EWbsG+SCKA+mhfqULnCDa7gZvMg1YurH0HTS6QWDbMt4gt4F61FV2yeF5qMh85wFL
	z74IDOFxi9BI6JrNryjXdBpiV3teht5KWEPpq9aiekSJoo1C4F1Ll02X++hYq6KBPg
	jEQCpoAwi3CA99KFKGV6pPQU+5Y3zitvNNRbzA34=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JJo5iN030303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Oct 2020 14:50:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 19 Oct 2020 14:50:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 19 Oct 2020 14:50:04 -0500
Received: from ULA0133185.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JJo4GY008572;
	Mon, 19 Oct 2020 14:50:04 -0500
From: Paula Carrillo <a0133185@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>, <dmurphy@ti.com>
Date: Mon, 19 Oct 2020 14:49:57 -0500
Message-ID: <20201019194957.20889-1-a0133185@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Paula Carrillo <a0133185@ti.com>
Subject: [dunfell]PATCH] TFlite 1.15.2 bb recipes
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
X-List-Received-Date: Mon, 19 Oct 2020 19:53:09 -0000
Content-Type: text/plain

---
 ...file-add-label_image-example-1.15.2.patch} |   0
 .../tensorflow-lite/tensorflow-lite_1.15.2.bb | 119 ++++++++++++++
 .../tensorflow-lite/tensorflow-lite_1.15.bb   | 145 ------------------
 3 files changed, 119 insertions(+), 145 deletions(-)
 rename meta-arago-extras/recipes-support/tensorflow-lite/files/{0001-Makefile-add-label_image-example-1.15.patch => 0001-Makefile-add-label_image-example-1.15.2.patch} (100%)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.2.bb
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.patch b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.2.patch
similarity index 100%
rename from meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.patch
rename to meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.2.patch
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.2.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.2.bb
new file mode 100644
index 00000000..0a4c7090
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.2.bb
@@ -0,0 +1,119 @@
+DESCRIPTION = "TensorFlow's lightweight solution for mobile and embedded devices"
+AUTHOR = "Google Inc. and Yuan Tang"
+HOMEPAGE = "https://www.tensorflow.org/lite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64a34301f8e355f57ec992c2af3e5157"
+
+MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
+SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
+
+SRC_URI = " \
+	git://github.com/tensorflow/tensorflow;destsuffix=git/;branch=r1.15;rev=v1.15.2;protocol=https \
+	git://gitlab.com/libeigen/eigen.git;destsuffix=eigen/;branch=master;rev=cdb377d0cba4889fc909d1bbdd430b988db0db97;protocol=https \
+	git://github.com/google/gemmlowp;destsuffix=gemmlowp/;branch=master;rev=2483d846ad865dd4190fe4a1a1ba2d9cfcea78e1;protocol=https \
+	git://github.com/google/googletest;destsuffix=googletest/;branch=master;rev=release-1.10.0;protocol=https \
+	git://github.com/abseil/abseil-cpp;destsuffix=abseil-cpp/;branch=master;rev=20190808;nobranch=1;protocol=https \
+	git://github.com/intel/ARM_NEON_2_x86_SSE;destsuffix=neon_2_sse/;branch=master;rev=8dbe2461c89760ac4b204aa0eafb72413a97957d;protocol=https \
+	git://github.com/google/farmhash;destsuffix=farmhash/;branch=master;rev=0d859a811870d10f53a594927d0d0b97573ad06d;protocol=https \
+	git://github.com/google/flatbuffers;destsuffix=flatbuffers/;branch=master;rev=v1.11.0;protocol=https \
+	https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
+    	http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
+	file://apply-modification-for-tflite-1.15-to-eigen.patch \
+    	file://0001-Makefile-add-label_image-example-${PV}.patch \
+    	file://tflite-benchmark.sh \
+	file://tensorflow-lite.pc.in \
+"
+
+SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
+SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
+
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "zlib"
+TARGET_CFLAGS_remove = "-O2"
+TARGET_CPPFLAGS_remove = "-O2"
+TARGET_CXXFLAGS_remove = "-O2"
+CFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -I${STAGING_INCDIR}"
+CPPFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -I${STAGING_INCDIR}"
+LDFLAGS_remove = "-Wl,-O1"
+CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -I${STAGING_INCDIR}"
+LIBS = "-lstdc++ -lpthread -lm -lz -ldl -lrt"
+BUILD_DEPS_DOWNLOAD_DIR_PREFIX = "${S}/tensorflow/lite/tools/make/downloads/"
+
+do_cp_downloaded_build_deps() {
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers"
+    mkdir -p "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d"
+
+    cp -rf ${WORKDIR}/eigen/*       "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen/"
+    cp -rf ${WORKDIR}/gemmlowp/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp/"
+    cp -rf ${WORKDIR}/googletest/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest/"
+    cp -rf ${WORKDIR}/abseil-cpp/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl/"
+    cp -rf ${WORKDIR}/farmhash/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash/"
+    cp -rf ${WORKDIR}/neon_2_sse/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse/"
+    cp -rf ${WORKDIR}/flatbuffers/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers/"
+    cp -rf ${WORKDIR}/fft/*         "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d/"
+}
+addtask do_cp_downloaded_build_deps after do_unpack before do_patch
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CXX=${CXX}' \
+    'CPP=${CPP}' \
+    'CFLAGS=${CFLAGS}' \
+    'CPPFLAGS=${CPPFLAGS}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'AR=${AR}' \
+    'LD=${LD}' \
+    'LDFLAGS=${LDFLAGS}' \
+    'LIBS=${LIBS}' \
+    'TARGET=${TARGET_OS}' \
+    'TARGET_ARCH=${TUNE_ARCH}'"
+
+do_configure() {
+    oe_runmake -f tensorflow/lite/tools/make/Makefile clean
+}
+
+do_compile() {
+    oe_runmake -f tensorflow/lite/tools/make/Makefile
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 0644 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/
+    install -d ${D}${libdir}/pkgconfig
+    install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
+
+    cd "${S}/tensorflow/lite"
+    for file in $(find . -name '*.h'); do
+        install -d "${D}${includedir}/tensorflow/lite/$(dirname -- "${file}")"
+        install -m 0644 "${file}" "${D}${includedir}/tensorflow/lite/${file}"
+    done
+    install -m 0644 ${S}/tensorflow/lite/schema/schema.fbs ${D}${includedir}/tensorflow/lite/schema/
+
+    sed -i 's:@version@:${PV}:g
+        s:@libdir@:${libdir}:g
+        s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
+    # install examples
+    install -d ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${BPN}/examples
+    # install scripts for benchmarking
+    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}/examples
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
deleted file mode 100644
index 5f65055f..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ /dev/null
@@ -1,145 +0,0 @@
-DESCRIPTION = "TensorFlow's lightweight solution for mobile and embedded devices"
-AUTHOR = "Google Inc. and Yuan Tang"
-HOMEPAGE = "https://www.tensorflow.org/lite"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64a34301f8e355f57ec992c2af3e5157"
-
-MD5SUM_EIGEN = "a28a728acb3298471b11132ab5c0c3cb"
-SHA256SUM_EIGEN = "7e7a57e33c59280a17a66e521396cd8b1a55d0676c9f807078522fda52114b5c"
-MD5SUM_FARMHASH = "f039a65a7f62bdb6c4b4c8a732638d80"
-SHA256SUM_FARMHASH = "6560547c63e4af82b0f202cb710ceabb3f21347a4b996db565a411da5b17aba0"
-MD5SUM_GEMMLOWP = "09cf63d1d388a2753de3323684da70ed"
-SHA256SUM_GEMMLOWP = "6678b484d929f2d0d3229d8ac4e3b815a950c86bb9f17851471d143f6d4f7834"
-MD5SUM_GTEST = "16877098823401d1bf2ed7891d7dce36"
-SHA256SUM_GTEST = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8"
-MD5SUM_ABSLCPP = "7abf3aae8d57874d2eb04c4b92736208"
-SHA256SUM_ABSLCPP = "acd93f6baaedc4414ebd08b33bebca7c7a46888916101d8c0b8083573526d070"
-MD5SUM_NEON2SSE = "276619db5393450c223b7c4e47e848ce"
-SHA256SUM_NEON2SSE = "8cc98e95c86d362dd6f003b35a9517a9928e3fd387b33188b0442df13245a17b"
-MD5SUM_FLATBUFFER = "02c64880acb89dbd57eebacfd67200d8"
-SHA256SUM_FLATBUFFER = "3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b"
-MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
-SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
-
-SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};protocol=https \
-    https://bitbucket.org/eigen/eigen/get/8071cda5714d.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
-    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/gemmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
-    https://github.com/google/googletest/archive/release-1.8.0.tar.gz;md5sum=${MD5SUM_GTEST};sha256sum=${SHA256SUM_GTEST} \
-    https://github.com/abseil/abseil-cpp/archive/43ef2148c0936ebf7cb4be6b19927a9d9d145b8f.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
-    https://github.com/intel/ARM_NEON_2_x86_SSE/archive/3057bb91b99bae9c7fbdf8710c032d462ca10051.zip;md5sum=${MD5SUM_NEON2SSE};sha256sum=${SHA256SUM_NEON2SSE} \
-    https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
-    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/flatbuffers/archive/v1.11.0.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
-    https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
-    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
-    file://apply-modification-for-tflite-${PV}-to-eigen.patch \
-    file://0001-Makefile-add-label_image-example-${PV}.patch \
-    file://tflite-benchmark.sh \
-    file://tensorflow-lite.pc.in"
-
-SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
-SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
-
-SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
-
-PR = "r4"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "zlib"
-TARGET_CFLAGS_remove = "-O2"
-TARGET_CPPFLAGS_remove = "-O2"
-TARGET_CXXFLAGS_remove = "-O2"
-CFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
-    -I${STAGING_INCDIR}"
-CPPFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
-    -I${STAGING_INCDIR}"
-LDFLAGS_remove = "-Wl,-O1"
-CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
-    -I${STAGING_INCDIR}"
-LIBS = "-lstdc++ -lpthread -lm -lz -ldl -lrt"
-BUILD_DEPS_DOWNLOAD_DIR_PREFIX = "${S}/tensorflow/lite/tools/make/downloads/"
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
-    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
-    cp -rf ${WORKDIR}/gemmlowp-12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
-    cp -rf ${WORKDIR}/googletest-release-1.8.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
-    cp -rf ${WORKDIR}/abseil-cpp-43ef2148c0936ebf7cb4be6b19927a9d9d145b8f/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
-    cp -rf ${WORKDIR}/farmhash-816a4ae622e964763ca0862d9dbd19324a1eaf45/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
-    cp -rf ${WORKDIR}/ARM_NEON_2_x86_SSE-3057bb91b99bae9c7fbdf8710c032d462ca10051/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
-    cp -rf ${WORKDIR}/flatbuffers-1.11.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
-    cp -rf ${WORKDIR}/fft/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
-}
-addtask do_cp_downloaded_build_deps after do_unpack before do_patch
-
-EXTRA_OEMAKE = "\
-    'CC=${CC}' \
-    'CXX=${CXX}' \
-    'CPP=${CPP}' \
-    'CFLAGS=${CFLAGS}' \
-    'CPPFLAGS=${CPPFLAGS}' \
-    'CXXFLAGS=${CXXFLAGS}' \
-    'AR=${AR}' \
-    'LD=${LD}' \
-    'LDFLAGS=${LDFLAGS}' \
-    'LIBS=${LIBS}' \
-    'TARGET=${TARGET_OS}' \
-    'TARGET_ARCH=${TUNE_ARCH}'"
-
-do_compile() {
-    oe_runmake -f tensorflow/lite/tools/make/Makefile
-}
-
-do_install() {
-    install -d ${D}${libdir}
-    install -m 0644 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/lib/*.a ${D}${libdir}/
-    install -d ${D}${includedir}/tensorflow/lite
-    install -m 0644 ${S}/tensorflow/lite/*.h ${D}${includedir}/tensorflow/lite/
-    install -d ${D}${includedir}/tensorflow/lite/c
-    install -m 0644 ${S}/tensorflow/lite/c/*.h ${D}${includedir}/tensorflow/lite/c/
-    install -d ${D}${includedir}/tensorflow/lite/core/
-    install -m 0644 ${S}/tensorflow/lite/core/*.h ${D}${includedir}/tensorflow/lite/core/
-    install -d ${D}${includedir}/tensorflow/lite/core/api/
-    install -m 0644 ${S}/tensorflow/lite/core/api/*.h ${D}${includedir}/tensorflow/lite/core/api/
-    install -d ${D}${includedir}/tensorflow/lite/kernels
-    install -m 0644 ${S}/tensorflow/lite/kernels/*.h ${D}${includedir}/tensorflow/lite/kernels/
-    install -d  ${D}${includedir}/tensorflow/lite/profiling/
-    install -m 0644 ${S}/tensorflow/lite/profiling/*.h ${D}${includedir}/tensorflow/lite/profiling/
-    install -d ${D}${includedir}/tensorflow/lite/schema/
-    install -m 0644 ${S}/tensorflow/lite/schema/*.h ${D}${includedir}/tensorflow/lite/schema/
-    install -m 0644 ${S}/tensorflow/lite/schema/schema.fbs ${D}${includedir}/tensorflow/lite/schema/
-    install -d ${D}${includedir}/tensorflow/lite/tools/
-    install -m 0644 ${S}/tensorflow/lite/tools/*.h ${D}${includedir}/tensorflow/lite/tools/
-    install -d ${D}${includedir}/tensorflow/lite/delegates/nnapi/
-    install -m 0644 ${S}/tensorflow/lite/delegates/nnapi/*.h ${D}${includedir}/tensorflow/lite/delegates/nnapi/
-    install -d ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
-    install -m 0644 ${S}/tensorflow/lite/experimental/resource_variable/*.h ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
-    install -d ${D}${includedir}/tensorflow/lite/kernels/internal/
-    install -m 0644 ${S}/tensorflow/lite/kernels/internal/*.h ${D}${includedir}/tensorflow/lite/kernels/internal/
-
-    install -d ${D}${libdir}/pkgconfig
-    install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
-    sed -i 's:@version@:${PV}:g
-        s:@libdir@:${libdir}:g
-        s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
-    # install examples
-    install -d ${D}${datadir}/${BPN}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${BPN}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${BPN}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${BPN}/examples
-    # install scripts for benchmarking
-    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}/examples
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


