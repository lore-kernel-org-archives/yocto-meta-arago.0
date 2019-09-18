Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A89F1529FB
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 21:54:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrVLU001195
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 16:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568843611;
	bh=Qcb8ha3+FdOVPSVklqEsqLSV94ObWBJIfjN5TUKARpE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MCcTIXfSx+5AOTgrx3XsvS9EPWkdXl+m7fKBzQkiz4bEdsHdaFmRcHYx2KAxAMWk1
	JAqr2HjlLlYfLDdD6ApqyWB8cPftZyCDIwL0ed8k+xs+LmVyO7ZxvZFRYo56RW5kFr
	haM43CVmhu/CmRJ7P9CbZ/DrFgou5yA+MZI/+PQo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ILrUJx124263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 16:53:31 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 16:53:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 16:53:27 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrTd0087816;
	Wed, 18 Sep 2019 16:53:30 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Sep 2019 17:52:12 -0400
Message-ID: <20190918215213.12185-3-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918215213.12185-1-a0271529@ti.com>
References: <20190918215213.12185-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [master/thud/ti2019.03 3/4] armnn: build armnn with TensorFlow Lite support
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
X-List-Received-Date: Wed, 18 Sep 2019 21:54:39 -0000
Content-Type: text/plain

* mobilenet_v2_1.0_224.tflite is also installed for using TFLite with ArmnnExamples

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...sioned-library-for-armnnTfLiteParser.patch | 25 +++++++++++++++++++
 .../recipes-support/armnn/armnn_git.bb        | 14 +++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch b/meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
new file mode 100644
index 00000000..a504aa76
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
@@ -0,0 +1,25 @@
+From 1f5670c6ef8669d7d25621d9c97d66178800dcf9 Mon Sep 17 00:00:00 2001
+From: Hongmei Gou <a0271529@ti.com>
+Date: Tue, 17 Sep 2019 17:58:39 -0400
+Subject: [PATCH] Generate versioned library for armnnTfLiteParser
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Hongmei Gou <a0271529@ti.com>
+---
+ src/armnnTfLiteParser/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/armnnTfLiteParser/CMakeLists.txt b/src/armnnTfLiteParser/CMakeLists.txt
+index 17d4cf68..c83f7059 100755
+--- a/src/armnnTfLiteParser/CMakeLists.txt
++++ b/src/armnnTfLiteParser/CMakeLists.txt
+@@ -24,4 +24,5 @@ if(BUILD_TF_LITE_PARSER)
+     install(TARGETS armnnTfLiteParser
+             LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+             RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
++    set_target_properties(armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ endif()
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index e8d16944..261d4f63 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-PR = "r1"
+PR = "r2"
 PV = "19.08"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
@@ -32,12 +32,16 @@ SRC_URI = " \
     file://0007-enable-use-of-arm-compute-shared-library.patch \
     file://0009-command-line-options-for-video-port-selection.patch \
     file://0010-armnnexamples-update-for-19.08-modifications.patch \
+    file://0011-Generate-versioned-library-for-armnnTfLiteParser.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
+    https://storage.googleapis.com/mobilenet_v2/checkpoints/mobilenet_v2_1.0_224.tgz;name=mobilenetv2;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
 "
 
 SRC_URI[mobilenet.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
 SRC_URI[mobilenet.sha256sum] = "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
+SRC_URI[mobilenetv2.md5sum] = "519bba7052fd279c66d2a28dc3f51f46"
+SRC_URI[mobilenetv2.sha256sum] = "318084bc1b63d6d7b854553e09cdf77078b1c0168be27c59a0d44253b5ed49dc"
 
 DEPENDS = " \
     boost \
@@ -47,6 +51,8 @@ DEPENDS = " \
     armnn-caffe \
     armnn-tensorflow \
     armnn-onnx \
+    tensorflow-lite \
+    flatbuffers \
     opencv \
 "
 
@@ -58,7 +64,10 @@ EXTRA_OECMAKE=" \
     -DCAFFE_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-caffe \
     -DTF_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-tensorflow \
     -DONNX_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-onnx \
-    -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 -DBUILD_ONNX_PARSER=1 \
+    -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 -DBUILD_ONNX_PARSER=1 -DBUILD_TF_LITE_PARSER=1 \
+    -DTF_LITE_GENERATED_PATH=${STAGING_DIR_HOST}${includedir}/tensorflow/contrib/lite/schema \
+    -DFLATBUFFERS_ROOT=${STAGING_DIR_HOST}${includedir}/flatbuffers \
+    -DFLATBUFFERS_LIBRARY=${STAGING_DIR_HOST}${libdir}/libflatbuffers.a \
     -DARMCOMPUTENEON=1 \
     -DBUILD_TESTS=1 -DPROFILING=1 \
     -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
@@ -75,6 +84,7 @@ do_install_append() {
     cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
     install -d ${D}${TESTVECS_INSTALL_DIR}/models
     cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
+    cp ${WORKDIR}/tfmodel/mobilenet_v2_1.0_224.tflite ${D}${TESTVECS_INSTALL_DIR}/models
     cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
     install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
     cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
-- 
2.17.1


