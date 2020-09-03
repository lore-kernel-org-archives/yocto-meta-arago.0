Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1F28752982
	for <meta-arago@arago-project.org>;
	Thu,  3 Sep 2020 15:36:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 083FXYxB088762
	for <meta-arago@arago-project.org>; Thu, 3 Sep 2020 10:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599147214;
	bh=zrTAJkD5BF7LMe23KW9uEgfjq9+sWINjEveyHJl/6lM=;
	h=From:To:CC:Subject:Date;
	b=AXaowSgutNU/+MemM43Pjg8lCP89cCwAYfiCBxnPNpF8eqTXOTH/jbkSXAB0I5/7u
	rTsBtOLz/Ccpa7z1DCZQDUZ0OWhgyPM5q+h1TPhg4HgjM1eCHTSHnVGWtYrsRH2J05
	BmxJ11iWpIBQTH1gTNgzSY+egqka10n4Voz0yNuY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 083FXYCi003531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 3 Sep 2020 10:33:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 3 Sep 2020 10:33:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 3 Sep 2020 10:33:34 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 083FXXpu033601;
	Thu, 3 Sep 2020 10:33:34 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 3 Sep 2020 11:33:24 -0400
Message-ID: <20200903153324.25468-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master] [PATCH] tensorflow-lite: fix QA warning of using unstable GitHub archives
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
X-List-Received-Date: Thu, 03 Sep 2020 15:36:27 -0000
Content-Type: text/plain

* The archive links are replaced with git repos with the corresponding commit IDs

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../tensorflow-lite/tensorflow-lite_1.15.bb   | 46 +++++++------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index 5f65055f..e9739d83 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -6,29 +6,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64a34301f8e355f57ec992c2af3e5157"
 
 MD5SUM_EIGEN = "a28a728acb3298471b11132ab5c0c3cb"
 SHA256SUM_EIGEN = "7e7a57e33c59280a17a66e521396cd8b1a55d0676c9f807078522fda52114b5c"
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
 MD5SUM_FFT = "4255dd8a74949d123216b1ab91520469"
 SHA256SUM_FFT = "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826e0cb79b5296"
 
-SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};protocol=https \
+SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};rev=590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b;protocol=https \
     https://bitbucket.org/eigen/eigen/get/8071cda5714d.tar.gz;md5sum=${MD5SUM_EIGEN};sha256sum=${SHA256SUM_EIGEN} \
-    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/gemmlowp/archive/12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3.zip;md5sum=${MD5SUM_GEMMLOWP};sha256sum=${SHA256SUM_GEMMLOWP} \
-    https://github.com/google/googletest/archive/release-1.8.0.tar.gz;md5sum=${MD5SUM_GTEST};sha256sum=${SHA256SUM_GTEST} \
-    https://github.com/abseil/abseil-cpp/archive/43ef2148c0936ebf7cb4be6b19927a9d9d145b8f.tar.gz;md5sum=${MD5SUM_ABSLCPP};sha256sum=${SHA256SUM_ABSLCPP} \
-    https://github.com/intel/ARM_NEON_2_x86_SSE/archive/3057bb91b99bae9c7fbdf8710c032d462ca10051.zip;md5sum=${MD5SUM_NEON2SSE};sha256sum=${SHA256SUM_NEON2SSE} \
-    https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
-    https://storage.googleapis.com/mirror.tensorflow.org/github.com/google/flatbuffers/archive/v1.11.0.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
+    git://github.com/google/gemmlowp;destsuffix=gemmlowp/;branch=master;rev=12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3;protocol=https \
+    git://github.com/google/googletest;destsuffix=googletest/;branch=master;rev=release-1.8.0;protocol=https \
+    git://github.com/abseil/abseil-cpp;destsuffix=abseil-cpp/;branch=master;rev=43ef2148c0936ebf7cb4be6b19927a9d9d145b8f;nobranch=1;protocol=https \
+    git://github.com/intel/ARM_NEON_2_x86_SSE;destsuffix=neon_2_sse/;branch=master;rev=3057bb91b99bae9c7fbdf8710c032d462ca10051;protocol=https \
+    git://github.com/google/farmhash;destsuffix=farmhash/;branch=master;rev=816a4ae622e964763ca0862d9dbd19324a1eaf45;protocol=https \
+    git://github.com/google/flatbuffers;destsuffix=flatbuffers/;branch=master;rev=v1.11.0;protocol=https \
     https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
     http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
     file://apply-modification-for-tflite-${PV}-to-eigen.patch \
@@ -39,9 +27,7 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};protocol=htt
 SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
 SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
 
-SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
-
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}/git"
 
@@ -69,14 +55,14 @@ do_cp_downloaded_build_deps() {
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
     mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
 
-    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
-    cp -rf ${WORKDIR}/gemmlowp-12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
-    cp -rf ${WORKDIR}/googletest-release-1.8.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
-    cp -rf ${WORKDIR}/abseil-cpp-43ef2148c0936ebf7cb4be6b19927a9d9d145b8f/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
-    cp -rf ${WORKDIR}/farmhash-816a4ae622e964763ca0862d9dbd19324a1eaf45/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
-    cp -rf ${WORKDIR}/ARM_NEON_2_x86_SSE-3057bb91b99bae9c7fbdf8710c032d462ca10051/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
-    cp -rf ${WORKDIR}/flatbuffers-1.11.0/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
-    cp -rf ${WORKDIR}/fft/* ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
+    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen"
+    cp -rf ${WORKDIR}/gemmlowp/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp/"
+    cp -rf ${WORKDIR}/googletest/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest/"
+    cp -rf ${WORKDIR}/abseil-cpp/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl/"
+    cp -rf ${WORKDIR}/farmhash/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash/"
+    cp -rf ${WORKDIR}/neon_2_sse/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse/"
+    cp -rf ${WORKDIR}/flatbuffers/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers/"
+    cp -rf ${WORKDIR}/fft/*         "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d"
 }
 addtask do_cp_downloaded_build_deps after do_unpack before do_patch
 
-- 
2.17.1


