Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EF9FE52960
	for <meta-arago@arago-project.org>;
	Fri, 22 Feb 2019 20:48:26 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1MKmOwZ023367
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550868504;
	bh=NCaJxisEmMvXwmap4EAInpd5QON9/fRUGqsuhJOhPqo=;
	h=From:To:Subject:Date;
	b=ZmJ3Af1muYzU+owkadp8NsRMV39il6XZ342SkwXWCa/anxBD9loJpPMfwwDh2xNOf
	JGugpv8Wckp/k08Kb/+ohC6TKJIA4YZA5fT88kQFTcBBIt6XXfu39cLF9Gw7y5UKXf
	3cSb4hceusQ7V1JDmj8ddCsOiMQd8Td4h+1erFqo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1MKmOIr008079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:48:24 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 22 Feb 2019 14:48:23 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 22 Feb 2019 14:48:23 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1MKmNn9016484
	for <meta-arago@arago-project.org>; Fri, 22 Feb 2019 14:48:23 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Feb 2019 15:48:21 -0500
Message-ID: <1550868501-27007-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] armnn: bump SRCREV
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
X-List-Received-Date: Fri, 22 Feb 2019 20:48:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Changes are:
1. Upgraded Arm NN to Linaro version 19.02.
2. Enabled ONNX support in Arm NN.
3. Updated patch 0003 to 0006 based on this new version of armnn.


Signed-off-by: Qin Su <qsu@ti.com>
---
 .../recipes-support/armnn/armnn-onnx_git.bb        |   22 +
 ...0003-add-more-test-command-line-arguments.patch |   21 +-
 .../armnn/0004-generate-versioned-library.patch    |   53 +-
 .../0005-add-armnn-mobilenet-test-example.patch    |   14 +-
 .../armnn/0006-armnn-mobilenet-test-example.patch  | 1115 ++++++++------------
 .../recipes-support/armnn/armnn_git.bb             |   12 +-
 6 files changed, 518 insertions(+), 719 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb

diff --git a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
new file mode 100644
index 0000000..80a957b
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Onnx protobuf files - used in ARMNN for Onnx network models"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://onnxImport/LICENSE;md5=077ce3eaeaea91462d41c566300d2a02"
+
+SRC_URI = " \
+    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
+"
+
+PV = "1.0"
+
+BRANCH = "master"
+SRCREV = "af39cf346f602bd2aa75db1e9b31636b78d4e31b"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${datadir}/${BPN}/onnx/
+        for file in ${S}/onnxImport/*
+        do
+            install -m 0644 $file ${D}${datadir}/${BPN}/onnx/
+        done
+}
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch b/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
index bcc4a65..04eb049 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
@@ -1,22 +1,22 @@
-From ba19ce3c785fb92077f6309db1125f1ef32cb08a Mon Sep 17 00:00:00 2001
+From 964cb82f3b811aec6663255ab0aa589f0a3be0ee Mon Sep 17 00:00:00 2001
 From: Qin Su <qsu@ti.com>
-Date: Wed, 21 Nov 2018 15:14:24 -0500
+Date: Fri, 22 Feb 2019 14:10:07 -0500
 Subject: [PATCH] add more test command line arguments
 
 Upstream-Status: Inappropriate [TI only test code]
 Signed-off-by: Qin Su <qsu@ti.com>
 ---
- tests/InferenceTest.inl | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 50 insertions(+)
+ tests/InferenceTest.inl | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 49 insertions(+)
 
 diff --git a/tests/InferenceTest.inl b/tests/InferenceTest.inl
-index 16df7ba..5808edb 100644
+index 538720b..6fd21b8 100644
 --- a/tests/InferenceTest.inl
 +++ b/tests/InferenceTest.inl
-@@ -299,6 +299,56 @@ int ClassifierInferenceTestMain(int argc,
-                                 TConstructDatabaseCallable constructDatabase,
-                                 const armnn::TensorShape* inputTensorShape)
- {
+@@ -326,6 +326,55 @@ int ClassifierInferenceTestMain(int argc,
+     BOOST_ASSERT(modelFilename);
+     BOOST_ASSERT(inputBindingName);
+     BOOST_ASSERT(outputBindingName);
 +    int count;
 +    const char *p_input;
 +    char inmodelname[500];
@@ -66,10 +66,9 @@ index 16df7ba..5808edb 100644
 +            }
 +        }
 +    }
-+
+ 
      return InferenceTestMain(argc, argv, defaultTestCaseIds,
          [=]
-         ()
 -- 
 1.9.1
 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
index 57e8a4b..aaea2a7 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
@@ -1,61 +1,66 @@
-From 548f8e308b15e396241149e1c89ce7ffecf6242c Mon Sep 17 00:00:00 2001
+From 00dc7ad438b9d751201b8e8d5aa747a19d1cac3b Mon Sep 17 00:00:00 2001
 From: Qin Su <qsu@ti.com>
-Date: Tue, 27 Nov 2018 18:08:06 -0500
+Date: Wed, 13 Feb 2019 11:11:52 -0500
 Subject: [PATCH] generate versioned library
 
-Upstream-Status: Inappropriate [TI only test code]
-
+Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Qin Su <qsu@ti.com>
 ---
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ CMakeLists.txt | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c06a869..cc11476 100644
+index 2768f6a..c16383a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -73,7 +73,7 @@ if(BUILD_CAFFE_PARSER)
+@@ -82,6 +82,7 @@ if(BUILD_CAFFE_PARSER)
  
      target_link_libraries(armnnCaffeParser armnn)
      target_link_libraries(armnnCaffeParser ${PROTOBUF_LIBRARIES})
--
-+    set_target_properties( armnnCaffeParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
++    set_target_properties(armnnCaffeParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ 
  endif()
  
- if(BUILD_ONNX_PARSER)
-@@ -97,6 +97,7 @@ if(BUILD_ONNX_PARSER)
+@@ -106,6 +107,7 @@ if(BUILD_ONNX_PARSER)
  
      # Protobuf
      target_link_libraries(armnnOnnxParser ${PROTOBUF_LIBRARIES})
-+    set_target_properties( armnnOnnxParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
++    set_target_properties(armnnOnnxParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  endif()
  
  if(BUILD_TF_PARSER)
-@@ -120,6 +121,7 @@ if(BUILD_TF_PARSER)
+@@ -129,6 +131,7 @@ if(BUILD_TF_PARSER)
  
      # Protobuf (use the specific version tensorflow wants)
      target_link_libraries(armnnTfParser ${PROTOBUF_LIBRARIES})
-+    set_target_properties( armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
++    set_target_properties(armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  endif()
  
  if(BUILD_TF_LITE_PARSER)
-@@ -136,6 +138,7 @@ if(BUILD_TF_LITE_PARSER)
+@@ -147,6 +150,7 @@ if(BUILD_TF_LITE_PARSER)
  
-      target_link_libraries(armnnTfLiteParser ${Boost_FILESYSTEM_LIBRARY} ${Boost_THREAD_LIBRARY})
-      target_link_libraries(armnnTfLiteParser armnn ${FLATBUFFERS_LIBRARY})
-+     set_target_properties( armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+     target_link_libraries(armnnTfLiteParser ${Boost_FILESYSTEM_LIBRARY} ${Boost_THREAD_LIBRARY})
+     target_link_libraries(armnnTfLiteParser armnn ${FLATBUFFERS_LIBRARY})
++    set_target_properties(armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  endif()
  
- # ArmNN source files required for all build options
-@@ -610,6 +613,8 @@ if(PROFILING_BACKEND_STREAMLINE)
-     target_link_libraries(armnn pthread)
+ if(BUILD_ARMNN_SERIALIZER)
+@@ -175,6 +179,7 @@ if(BUILD_ARMNN_SERIALIZER)
+     target_include_directories(armnnSerializer SYSTEM PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/src/armnnSerializer)
+ 
+     target_link_libraries(armnnSerializer armnn ${FLATBUFFERS_LIBRARY})
++    set_target_properties(armnnSerializer PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  endif()
  
+ list(APPEND armnn_sources
+@@ -414,6 +419,7 @@ endif()
+ if(PROFILING_BACKEND_STREAMLINE)
+     target_link_libraries(armnn pthread)
+ endif()
 +set_target_properties( armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
-+
+ 
  if(BUILD_UNIT_TESTS)
      set(unittest_sources)
-     list(APPEND unittest_sources
 -- 
 1.9.1
 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
index c996ede..47760ad 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
@@ -1,17 +1,16 @@
-From 47ce3bcdb8e43ef517dcd8db7477a0514212ba4f Mon Sep 17 00:00:00 2001
+From 50c0001642c831ae1d801cb53080e1ddf501c129 Mon Sep 17 00:00:00 2001
 From: Qin Su <qsu@ti.com>
-Date: Tue, 27 Nov 2018 18:11:46 -0500
+Date: Wed, 13 Feb 2019 11:22:04 -0500
 Subject: [PATCH] add armnn mobilenet test example
 
 Upstream-Status: Inappropriate [TI only test code]
-
 Signed-off-by: Qin Su <qsu@ti.com>
 ---
- tests/CMakeLists.txt | 40 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 40 insertions(+)
+ tests/CMakeLists.txt | 41 +++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 41 insertions(+)
 
 diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 0979d55..7c0cf2a 100644
+index 9913321..6ed44ae 100644
 --- a/tests/CMakeLists.txt
 +++ b/tests/CMakeLists.txt
 @@ -1,3 +1,6 @@
@@ -21,7 +20,7 @@ index 0979d55..7c0cf2a 100644
  # UnitTests
  include(CheckIncludeFiles)
  
-@@ -226,3 +229,40 @@ if (BUILD_CAFFE_PARSER OR BUILD_TF_PARSER OR BUILD_TF_LITE_PARSER OR BUILD_ONNX_
+@@ -278,3 +281,41 @@ if (BUILD_ARMNN_SERIALIZER OR BUILD_CAFFE_PARSER OR BUILD_TF_PARSER OR BUILD_TF_
          ${Boost_PROGRAM_OPTIONS_LIBRARY})
      addDllCopyCommands(ExecuteNetwork)
  endif()
@@ -34,6 +33,7 @@ index 0979d55..7c0cf2a 100644
 +
 +    target_include_directories(ArmnnExamples PRIVATE ../src/armnnUtils)
 +    target_include_directories(ArmnnExamples PRIVATE ../src/armnn)
++    target_include_directories(ArmnnExamples PRIVATE ../src/backends)
 +
 +    if (BUILD_CAFFE_PARSER)
 +        target_link_libraries(ArmnnExamples armnnCaffeParser)
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
index d18f745..a6ce01a 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
@@ -1,21 +1,21 @@
-From 8e50d396567f5f19e376238831d5375516d2ea13 Mon Sep 17 00:00:00 2001
+From 4d5e7db268a4f816e24449e8ad011e35890f0c7e Mon Sep 17 00:00:00 2001
 From: Qin Su <qsu@ti.com>
-Date: Tue, 11 Dec 2018 15:57:57 -0500
+Date: Fri, 22 Feb 2019 13:39:09 -0500
 Subject: [PATCH] armnn mobilenet test example
 
 Upstream-Status: Inappropriate [TI only test code]
 Signed-off-by: Qin Su <qsu@ti.com>
 ---
- tests/ArmnnExamples/ArmnnExamples.cpp | 883 ++++++++++++++++++++++++++++++++++
- 1 file changed, 883 insertions(+)
+ tests/ArmnnExamples/ArmnnExamples.cpp | 654 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 654 insertions(+)
  create mode 100644 tests/ArmnnExamples/ArmnnExamples.cpp
 
 diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
 new file mode 100644
-index 0000000..a26356e
+index 0000000..53a11cc
 --- /dev/null
 +++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -0,0 +1,883 @@
+@@ -0,0 +1,654 @@
 +/******************************************************************************
 + * Copyright (c) 2018, Texas Instruments Incorporated - http://www.ti.com/
 + *   All rights reserved.
@@ -46,7 +46,7 @@ index 0000000..a26356e
 +// Copyright © 2017 Arm Ltd. All rights reserved.
 +// See LICENSE file in the project root for full license information.
 +//
-+#include "armnn/ArmNN.hpp"
++#include <armnn/ArmNN.hpp>
 +
 +#include <utility>
 +#include <armnn/TypesUtils.hpp>
@@ -102,53 +102,53 @@ index 0000000..a26356e
 +
 +void imagenetCallBackFunc(int event, int x, int y, int flags, void* userdata)
 +{
-+    if  ( event == EVENT_RBUTTONDOWN )
-+    {
-+        std::cout << "Right button of the mouse is clicked - position (" << x << ", " << y << ")" << " ... prepare to exit!" << std::endl;
-+        exit(0);
-+    }
++  if  ( event == EVENT_RBUTTONDOWN )
++  {
++    std::cout << "Right button of the mouse is clicked - position (" << x << ", " << y << ")" << " ... prepare to exit!" << std::endl;
++    exit(0);
++  }
 +}
 +
 +inline float Lerpfloat(float a, float b, float w)
 +{
-+    return w * b + (1.f - w) * a;
++  return w * b + (1.f - w) * a;
 +}
 +
 +// Load a single image
 +struct ImageData
 +{
-+    unsigned int m_width;
-+    unsigned int m_height;
-+    unsigned int m_chnum;
-+    unsigned int m_size;
-+    std::vector<uint8_t> m_image;
++  unsigned int m_width;
++  unsigned int m_height;
++  unsigned int m_chnum;
++  unsigned int m_size;
++  std::vector<uint8_t> m_image;
 +};
-+
++// Load a single image
 +std::unique_ptr<ImageData> loadImageData(std::string image_path, VideoCapture &cap, cv::Mat img, int input_type)
 +{
-+    //cv::Mat img;
-+    if (input_type == INPUT_IMAGE)
-+    {
-+        /* use OpenCV to get the image */
-+        img = cv::imread(image_path, CV_LOAD_IMAGE_COLOR);
-+    }
-+    cv::cvtColor(img, img, CV_BGR2RGB); //convert image format from BGR(openCV format) to RGB (armnn required format).
-+
-+    // store image and label in Image
-+    std::unique_ptr<ImageData> ret(new ImageData);
-+    ret->m_width = static_cast<unsigned int>(img.cols);
-+    ret->m_height = static_cast<unsigned int>(img.rows);
-+    ret->m_chnum = static_cast<unsigned int>(img.channels());
-+    ret->m_size = static_cast<unsigned int>(img.cols*img.rows*img.channels());
-+    ret->m_image.resize(ret->m_size);
-+
-+    for (unsigned int i = 0; i < ret->m_size; i++)
-+    {
-+        ret->m_image[i] = static_cast<uint8_t>(img.data[i]);
-+    }
-+    return ret;
++  //cv::Mat img;
++  if (input_type == INPUT_IMAGE)
++  {
++    /* use OpenCV to get the image */
++    img = cv::imread(image_path, CV_LOAD_IMAGE_COLOR);
++  }
++  cv::cvtColor(img, img, CV_BGR2RGB); //convert image format from BGR(openCV format) to RGB (armnn required format).
++
++  // store image and label in output Image
++  std::unique_ptr<ImageData> ret(new ImageData);
++  ret->m_width = static_cast<unsigned int>(img.cols);
++  ret->m_height = static_cast<unsigned int>(img.rows);
++  ret->m_chnum = static_cast<unsigned int>(img.channels());
++  ret->m_size = static_cast<unsigned int>(img.cols*img.rows*img.channels());
++  ret->m_image.resize(ret->m_size);
++
++  for (unsigned int i = 0; i < ret->m_size; i++)
++  {
++    ret->m_image[i] = static_cast<uint8_t>(img.data[i]);
++  }
++  return ret;
 +}
-+
++// to resize input tensor size
 +std::vector<float> ResizeBilinear(std::vector<uint8_t> input,
 +                                    const unsigned int inWidth,
 +                                    const unsigned int inHeight,
@@ -156,203 +156,151 @@ index 0000000..a26356e
 +                                    const unsigned int outputWidth,
 +                                    const unsigned int outputHeight)
 +{
-+    std::vector<float> out;
-+    out.resize(outputWidth * outputHeight * 3);
-+
-+    // We follow the definition of TensorFlow and AndroidNN: the top-left corner of a texel in the output
-+    // image is projected into the input image to figure out the interpolants and weights. Note that this
-+    // will yield different results than if projecting the centre of output texels.
-+
-+    const unsigned int inputWidth = inWidth;
-+    const unsigned int inputHeight = inHeight;
-+
-+    // How much to scale pixel coordinates in the output image to get the corresponding pixel coordinates
-+    // in the input image.
-+    const float scaleY = boost::numeric_cast<float>(inputHeight) / boost::numeric_cast<float>(outputHeight);
-+    const float scaleX = boost::numeric_cast<float>(inputWidth) / boost::numeric_cast<float>(outputWidth);
-+
-+    uint8_t rgb_x0y0[3];
-+    uint8_t rgb_x1y0[3];
-+    uint8_t rgb_x0y1[3];
-+    uint8_t rgb_x1y1[3];
-+    unsigned int pixelOffset00, pixelOffset10, pixelOffset01, pixelOffset11;
-+    for (unsigned int y = 0; y < outputHeight; ++y)
++  std::vector<float> out;
++  out.resize(outputWidth * outputHeight * 3);
++
++  // We follow the definition of TensorFlow and AndroidNN: the top-left corner of a texel in the output
++  // image is projected into the input image to figure out the interpolants and weights. Note that this
++  // will yield different results than if projecting the centre of output texels.
++
++  const unsigned int inputWidth = inWidth;
++  const unsigned int inputHeight = inHeight;
++
++  // How much to scale pixel coordinates in the output image to get the corresponding pixel coordinates
++  // in the input image.
++  const float scaleY = boost::numeric_cast<float>(inputHeight) / boost::numeric_cast<float>(outputHeight);
++  const float scaleX = boost::numeric_cast<float>(inputWidth) / boost::numeric_cast<float>(outputWidth);
++
++  uint8_t rgb_x0y0[3];
++  uint8_t rgb_x1y0[3];
++  uint8_t rgb_x0y1[3];
++  uint8_t rgb_x1y1[3];
++  unsigned int pixelOffset00, pixelOffset10, pixelOffset01, pixelOffset11;
++  for (unsigned int y = 0; y < outputHeight; ++y)
++  {
++    // Corresponding real-valued height coordinate in input image.
++    const float iy = boost::numeric_cast<float>(y) * scaleY;
++    // Discrete height coordinate of top-left texel (in the 2x2 texel area used for interpolation).
++    const float fiy = floorf(iy);
++    const unsigned int y0 = boost::numeric_cast<unsigned int>(fiy);
++
++    // Interpolation weight (range [0,1])
++    const float yw = iy - fiy;
++
++    for (unsigned int x = 0; x < outputWidth; ++x)
 +    {
-+        // Corresponding real-valued height coordinate in input image.
-+        const float iy = boost::numeric_cast<float>(y) * scaleY;
-+        // Discrete height coordinate of top-left texel (in the 2x2 texel area used for interpolation).
-+        const float fiy = floorf(iy);
-+        const unsigned int y0 = boost::numeric_cast<unsigned int>(fiy);
-+
-+        // Interpolation weight (range [0,1])
-+        const float yw = iy - fiy;
-+
-+        for (unsigned int x = 0; x < outputWidth; ++x)
-+        {
-+            // Real-valued and discrete width coordinates in input image.
-+            const float ix = boost::numeric_cast<float>(x) * scaleX;
-+            const float fix = floorf(ix);
-+            const unsigned int x0 = boost::numeric_cast<unsigned int>(fix);
-+
-+            // Interpolation weight (range [0,1]).
-+            const float xw = ix - fix;
-+
-+            // Discrete width/height coordinates of texels below and to the right of (x0, y0).
-+            const unsigned int x1 = std::min(x0 + 1, inputWidth - 1u);
-+            const unsigned int y1 = std::min(y0 + 1, inputHeight - 1u);
-+
-+            pixelOffset00 = x0 * inChnum + y0 * inputWidth * inChnum;
-+	    pixelOffset10 = x1 * inChnum + y0 * inputWidth * inChnum;
-+	    pixelOffset01 = x0 * inChnum + y1 * inputWidth * inChnum;
-+	    pixelOffset11 = x1 * inChnum + y1 * inputWidth * inChnum;
-+	    for (unsigned int c = 0; c < 3; ++c)
-+	    {
-+	       rgb_x0y0[c] = input[pixelOffset00+c];
-+	       rgb_x1y0[c] = input[pixelOffset10+c];
-+	       rgb_x0y1[c] = input[pixelOffset01+c];
-+	       rgb_x1y1[c] = input[pixelOffset11+c];
-+	    }
-+
-+            for (unsigned c=0; c<3; ++c)
-+            {
-+                const float ly0 = Lerpfloat(float(rgb_x0y0[c]), float(rgb_x1y0[c]), xw);
-+                const float ly1 = Lerpfloat(float(rgb_x0y1[c]), float(rgb_x1y1[c]), xw);
-+                const float l = Lerpfloat(ly0, ly1, yw);
-+                out[(3*((y*outputWidth)+x)) + c] = static_cast<float>(l)/255.0f;
-+            }
-+        }
++      // Real-valued and discrete width coordinates in input image.
++      const float ix = boost::numeric_cast<float>(x) * scaleX;
++      const float fix = floorf(ix);
++      const unsigned int x0 = boost::numeric_cast<unsigned int>(fix);
++
++      // Interpolation weight (range [0,1]).
++      const float xw = ix - fix;
++
++      // Discrete width/height coordinates of texels below and to the right of (x0, y0).
++      const unsigned int x1 = std::min(x0 + 1, inputWidth - 1u);
++      const unsigned int y1 = std::min(y0 + 1, inputHeight - 1u);
++
++      pixelOffset00 = x0 * inChnum + y0 * inputWidth * inChnum;
++      pixelOffset10 = x1 * inChnum + y0 * inputWidth * inChnum;
++      pixelOffset01 = x0 * inChnum + y1 * inputWidth * inChnum;
++      pixelOffset11 = x1 * inChnum + y1 * inputWidth * inChnum;
++      for (unsigned int c = 0; c < 3; ++c)
++      {
++        rgb_x0y0[c] = input[pixelOffset00+c];
++        rgb_x1y0[c] = input[pixelOffset10+c];
++        rgb_x0y1[c] = input[pixelOffset01+c];
++        rgb_x1y1[c] = input[pixelOffset11+c];
++      }
++
++      for (unsigned c=0; c<3; ++c)
++      {
++        const float ly0 = Lerpfloat(float(rgb_x0y0[c]), float(rgb_x1y0[c]), xw);
++        const float ly1 = Lerpfloat(float(rgb_x0y1[c]), float(rgb_x1y1[c]), xw);
++        const float l = Lerpfloat(ly0, ly1, yw);
++        out[(3*((y*outputWidth)+x)) + c] = static_cast<float>(l)/255.0f;
++      }
 +    }
-+    return out;
++  }
++  return out;
 +}
 +
 +namespace
 +{
 +
-+// Configure boost::program_options for command-line parsing and validation.
-+namespace po = boost::program_options;
++  // Configure boost::program_options for command-line parsing and validation.
++  namespace po = boost::program_options;
 +
-+template<typename T, typename TParseElementFunc>
-+std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
-+{
++  template<typename T, typename TParseElementFunc>
++  std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
++  {
 +    std::vector<T> result;
 +    // Processes line-by-line.
 +    std::string line;
 +    while (std::getline(stream, line))
 +    {
-+        std::vector<std::string> tokens;
-+        try
++      std::vector<std::string> tokens;
++      try
++      {
++        // Coverity fix: boost::split() may throw an exception of type boost::bad_function_call.
++        boost::split(tokens, line, boost::algorithm::is_any_of("\t ,;:"), boost::token_compress_on);
++      }
++      catch (const std::exception& e)
++      {
++        BOOST_LOG_TRIVIAL(error) << "An error occurred when splitting tokens: " << e.what();
++        continue;
++      }
++      for (const std::string& token : tokens)
++      {
++        if (!token.empty())
 +        {
-+            // Coverity fix: boost::split() may throw an exception of type boost::bad_function_call.
-+            boost::split(tokens, line, boost::algorithm::is_any_of("\t ,;:"), boost::token_compress_on);
-+        }
-+        catch (const std::exception& e)
-+        {
-+            BOOST_LOG_TRIVIAL(error) << "An error occurred when splitting tokens: " << e.what();
-+            continue;
-+        }
-+        for (const std::string& token : tokens)
-+        {
-+            if (!token.empty()) // See https://stackoverflow.com/questions/10437406/
-+            {
-+                try
-+                {
-+                    result.push_back(parseElementFunc(token));
-+                }
-+                catch (const std::exception&)
-+                {
-+                    BOOST_LOG_TRIVIAL(error) << "'" << token << "' is not a valid number. It has been ignored.";
-+                }
-+            }
++          try
++          {
++            result.push_back(parseElementFunc(token));
++          }
++          catch (const std::exception&)
++          {
++            BOOST_LOG_TRIVIAL(error) << "'" << token << "' is not a valid number. It has been ignored.";
++          }
 +        }
++      }
 +    }
 +
 +    return result;
-+}
-+
-+bool CheckOption(const po::variables_map& vm,
-+                 const char* option)
-+{
-+    // Check that the given option is valid.
-+    if (option == nullptr)
-+    {
-+        return false;
-+    }
-+
-+    // Check whether 'option' is provided.
-+    return vm.find(option) != vm.end();
-+}
-+
-+void CheckOptionDependency(const po::variables_map& vm,
-+                           const char* option,
-+                           const char* required)
-+{
-+    // Check that the given options are valid.
-+    if (option == nullptr || required == nullptr)
-+    {
-+        throw po::error("Invalid option to check dependency for");
-+    }
-+
-+    // Check that if 'option' is provided, 'required' is also provided.
-+    if (CheckOption(vm, option) && !vm[option].defaulted())
-+    {
-+        if (CheckOption(vm, required) == 0 || vm[required].defaulted())
-+        {
-+            throw po::error(std::string("Option '") + option + "' requires option '" + required + "'.");
-+        }
-+    }
-+}
++  }
 +
-+void CheckOptionDependencies(const po::variables_map& vm)
-+{
-+    CheckOptionDependency(vm, "model-path", "model-format");
-+    CheckOptionDependency(vm, "model-path", "input-name");
-+    CheckOptionDependency(vm, "model-path", "input-tensor-data");
-+    CheckOptionDependency(vm, "model-path", "output-name");
-+    CheckOptionDependency(vm, "input-tensor-shape", "model-path");
-+}
-+
-+template<typename T>
-+std::vector<T> ParseArray(std::istream& stream);
-+
-+template<>
-+std::vector<unsigned int> ParseArray(std::istream& stream)
-+{
++  template<typename T>
++  std::vector<T> ParseArray(std::istream& stream);
++  template<>
++  std::vector<unsigned int> ParseArray(std::istream& stream)
++  {
 +    return ParseArrayImpl<unsigned int>(stream,
-+        [](const std::string& s) { return boost::numeric_cast<unsigned int>(std::stoi(s)); });
-+}
-+
-+void RemoveDuplicateDevices(std::vector<armnn::Compute>& computeDevices)
-+{
++      [](const std::string& s) { return boost::numeric_cast<unsigned int>(std::stoi(s)); });
++  }
++  void RemoveDuplicateDevices(std::vector<armnn::BackendId>& computeDevices)
++  {
 +    // Mark the duplicate devices as 'Undefined'.
 +    for (auto i = computeDevices.begin(); i != computeDevices.end(); ++i)
 +    {
-+        for (auto j = std::next(i); j != computeDevices.end(); ++j)
++      for (auto j = std::next(i); j != computeDevices.end(); ++j)
++      {
++        if (*j == *i)
 +        {
-+            if (*j == *i)
-+            {
-+                *j = armnn::Compute::Undefined;
-+            }
++          *j = armnn::Compute::Undefined;
 +        }
++      }
 +    }
 +
 +    // Remove 'Undefined' devices.
 +    computeDevices.erase(std::remove(computeDevices.begin(), computeDevices.end(), armnn::Compute::Undefined),
-+                         computeDevices.end());
-+}
-+
-+bool CheckDevicesAreValid(const std::vector<armnn::Compute>& computeDevices)
-+{
-+    return (!computeDevices.empty()
-+            && std::none_of(computeDevices.begin(), computeDevices.end(),
-+                            [](armnn::Compute c){ return c == armnn::Compute::Undefined; }));
-+}
-+
++    computeDevices.end());
++  }
 +} // namespace
 +
 +template<typename TParser, typename TDataType>
 +int MainImpl(const char* modelPath,
 +             bool isModelBinary,
-+             const std::vector<armnn::Compute>& computeDevice,
++             const std::vector<armnn::BackendId>& computeDevices,
 +             const char* inputName,
 +             const armnn::TensorShape* inputTensorShape,
 +             const char* inputTensorDataFilePath,
@@ -361,152 +309,166 @@ index 0000000..a26356e
 +             const size_t number_frame,
 +             const std::shared_ptr<armnn::IRuntime>& runtime = nullptr)
 +{
-+    // Loads input tensor.
-+    std::vector<uint8_t> input;
-+    std::vector<float> input_resized;
-+
-+    try
++  // Loads input tensor.
++  std::vector<uint8_t> input;
++  std::vector<float> input_resized;
++  using TContainer = boost::variant<std::vector<float>, std::vector<int>, std::vector<unsigned char>>;
++
++  try
++  {
++    // Creates an InferenceModel, which will parse the model and load it into an IRuntime.
++    typename InferenceModel<TParser, TDataType>::Params params;
++    //const armnn::TensorShape inputTensorShape({ 1, 224, 224 3});
++
++    params.m_ModelPath = modelPath;
++    params.m_IsModelBinary = isModelBinary;
++    params.m_ComputeDevices = computeDevices;
++    params.m_InputBindings = { inputName };
++    params.m_InputShapes = { *inputTensorShape };
++    params.m_OutputBindings = { outputName };
++    params.m_EnableProfiling = enableProfiling;
++    params.m_SubgraphId = 0;
++    InferenceModel<TParser, TDataType> model(params, runtime);
++
++    VideoCapture cap;
++    int input_type = INPUT_IMAGE;
++    std::string filename = inputTensorDataFilePath;
++
++    size_t i = filename.rfind("camera_live_input", filename.length());
++    if (i != string::npos)
 +    {
-+        // Creates an InferenceModel, which will parse the model and load it into an IRuntime.
-+        typename InferenceModel<TParser, TDataType>::Params params;
-+        //const armnn::TensorShape inputTensorShape({ 1, 224, 224 3});
-+        params.m_ModelPath = modelPath;
-+        params.m_IsModelBinary = isModelBinary;
-+        params.m_ComputeDevice = computeDevice;
-+        params.m_InputBinding = inputName;
-+        params.m_InputTensorShape = inputTensorShape;
-+        params.m_OutputBinding = outputName;
-+        params.m_EnableProfiling = enableProfiling;
-+        params.m_SubgraphId = 0;
-+        InferenceModel<TParser, TDataType> model(params, runtime);
-+
-+	VideoCapture cap;
-+	int input_type = INPUT_IMAGE;
-+	std::string filename = inputTensorDataFilePath;
-+
-+        size_t i = filename.rfind("camera_live_input", filename.length());
-+	if (i != string::npos)
-+	{
-+            /* Detect the video node assigned to vip */
-+            FILE *fp = popen("v4l2-ctl --list-devices", "r");
-+            char *ln = NULL;
-+            size_t len = 0;
-+            char *f_str;
-+            int device_number = 0;//0: AM65xx; 1: AM57xx
-+            while (getline(&ln, &len, fp) != -1)
-+            {
-+                if(strstr(ln, "platform:vip") != NULL)
-+                {
-+                    getline(&ln, &len, fp);
-+                    if((f_str = strstr(ln, "/dev/video")) != NULL)
-+                    {
-+                        device_number = atoi(&f_str[10]);
-+                    }
-+                }
-+            }
-+            free(ln);
-+            pclose(fp);
-+            cap = VideoCapture(device_number);
-+   	    namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
-+			input_type = INPUT_CAMERA; //camera input
-+	}
-+        else if((filename.substr(filename.find_last_of(".") + 1) == "mp4") ||
-+               (filename.substr(filename.find_last_of(".") + 1) == "mov") ||
-+	       (filename.substr(filename.find_last_of(".") + 1) == "avi") )
-+        {
-+            cap = VideoCapture(inputTensorDataFilePath);
-+            if (! cap.isOpened())
-+	    {
-+	        std::cout << "Cannot open video input: " << inputTensorDataFilePath << std::endl;
-+		return (-1);
-+	    }
-+
-+    	    namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
-+	    input_type = INPUT_VIDEO; //video clip input
-+	}
-+        if (input_type != INPUT_IMAGE)
-+	{
-+            //set the callback function for any mouse event. Used for right click mouse to exit the program.
-+            setMouseCallback("ARMNN MobileNet Example", imagenetCallBackFunc, NULL);
-+	}
-+
-+        for (unsigned int i=0; i < number_frame; i++)
-+	{
-+            if (input_type != INPUT_IMAGE)
-+            {
-+		cap.grab();
-+		cap.retrieve(test_image);
-+            }
-+	    std::unique_ptr<ImageData> inputData = loadImageData(inputTensorDataFilePath, cap, test_image, input_type);
-+	    input.resize(inputData->m_size);
-+
-+	    input = std::move(inputData->m_image);
-+ 	    input_resized = ResizeBilinear(input, inputData->m_width, inputData->m_height, inputData->m_chnum, 224, 224);
-+            // Executes the model.
-+	    std::vector<TDataType> output(model.GetOutputSize());
-+
-+            predictStart = high_resolution_clock::now();
-+
-+	    model.Run(input_resized, output);
-+
-+            predictEnd = high_resolution_clock::now();
-+
-+            // duration<double> will convert the time difference into seconds as a double by default.
-+            double timeTakenS = duration<double>(predictEnd - predictStart).count();
-+	    double preformance_ret = static_cast<double>(1.0/timeTakenS);
-+
-+	    // Convert 1-hot output to an integer label and print
-+	    int label = static_cast<int>(std::distance(output.begin(), std::max_element(output.begin(), output.end())));
-+            std::fstream file("/usr/share/arm/armnn/models/labels.txt");
-+	    std::string predict_target_name;
-+	    for (int i=0; i <= label; i++)
-+	    {
-+		std::getline(file, predict_target_name);
-+	    }
-+            std::cout << "Predicted: " << predict_target_name << std::endl;
-+	    std::cout << "Performance (FPS): " << preformance_ret << std::endl;
-+
-+            if (input_type != INPUT_IMAGE)
-+	    {
-+	    	//convert image format back to BGR for OpenCV imshow from RGB format required by armnn.
-+    		cv::cvtColor(test_image, test_image, CV_RGB2BGR);
-+	        // output identified object name on top of input image
-+		cv::putText(test_image, predict_target_name,
-+                cv::Point(rectCrop.x + 5,rectCrop.y + 20), // Coordinates
-+			cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
-+			1.0, // Scale. 2.0 = 2x bigger
-+			cv::Scalar(0,0,255), // Color
-+			1, // Thickness
-+			8); // Line type
-+
-+                // output preformance in FPS on top of input image
-+		std::string preformance_ret_string = "Performance (FPS): " + boost::lexical_cast<std::string>(preformance_ret);				
-+		cv::putText(test_image, preformance_ret_string,
-+		cv::Point(rectCrop.x + 5,rectCrop.y + 40), // Coordinates
-+			cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
-+			1.0, // Scale. 2.0 = 2x bigger
-+			cv::Scalar(0,0,255), // Color
-+			1, // Thickness
-+			8); // Line type
-+
-+                cv::imshow("ARMNN MobileNet Example", test_image);
-+		waitKey(2);
-+            }
-+	}
++      cap = VideoCapture(1);
++      namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
++      input_type = INPUT_CAMERA; //camera input
++    }
++    else if((filename.substr(filename.find_last_of(".") + 1) == "mp4") ||
++            (filename.substr(filename.find_last_of(".") + 1) == "mov") ||
++            (filename.substr(filename.find_last_of(".") + 1) == "avi") )
++    {
++      cap = VideoCapture(inputTensorDataFilePath);
++      if (! cap.isOpened())
++      {
++        std::cout << "Cannot open video input: " << inputTensorDataFilePath << std::endl;
++        return (-1);
++      }
++
++      namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
++      input_type = INPUT_VIDEO; //video clip input
 +    }
-+    catch (armnn::Exception const& e)
++    if (input_type != INPUT_IMAGE)
 +    {
-+        BOOST_LOG_TRIVIAL(fatal) << "Armnn Error: " << e.what();
-+        return EXIT_FAILURE;
++      //set the callback function for any mouse event. Used for right click mouse to exit the program.
++      setMouseCallback("ARMNN MobileNet Example", imagenetCallBackFunc, NULL);
 +    }
 +
-+    return EXIT_SUCCESS;
++    for (unsigned int i=0; i < number_frame; i++)
++    {
++      if (input_type != INPUT_IMAGE)
++      {
++        cap.grab();
++        cap.retrieve(test_image);
++      }
++      std::unique_ptr<ImageData> inputData = loadImageData(inputTensorDataFilePath, cap, test_image, input_type);
++      input.resize(inputData->m_size);
++
++      input = std::move(inputData->m_image);
++      input_resized = ResizeBilinear(input, inputData->m_width, inputData->m_height, inputData->m_chnum, 224, 224);
++	
++      // Set up input data container
++      std::vector<TContainer> inputDataContainer(1, std::move(input_resized));
++      	
++      // Set up output data container
++	  std::vector<TContainer> outputDataContainers;
++      outputDataContainers.push_back(std::vector<float>(model.GetOutputSize()));
++ 
++      //profile start
++      predictStart = high_resolution_clock::now();
++      // Execute model
++      model.Run(inputDataContainer, outputDataContainers);
++      //profile end
++      predictEnd = high_resolution_clock::now();
++
++      double timeTakenS = duration<double>(predictEnd - predictStart).count();
++      double preformance_ret = static_cast<double>(1.0/timeTakenS);
++
++      //retrieve output
++      std::vector<float>& outputData = (boost::get<std::vector<float>>(outputDataContainers[0]));
++	  //output TOP predictions
++      std::string predict_target_name;
++      // find the out with the highest confidence
++      int label = static_cast<int>(std::distance(outputData.begin(), std::max_element(outputData.begin(), outputData.end())));
++      std::fstream file("/usr/share/arm/armnn/models/labels.txt");
++      //std::string predict_target_name;
++      for (int i=0; i <= label; i++)
++      {
++        std::getline(file, predict_target_name);
++      }
++      //get the probability of the top prediction
++	  float prob = 100*outputData.data()[label];
++	  //clean the top one so as to find the second top prediction
++      outputData.data()[label] = 0;
++      std::cout << "Top(1) prediction is " << predict_target_name << " with confidence: " << prob << "%" << std::endl;
++	  //output next TOP 4 predictions
++      for (int ii=1; ii<5; ii++)
++      {
++        std::string predict_target_name_n;
++        // find the out with the highest confidence
++        int label = static_cast<int>(std::distance(outputData.begin(), std::max_element(outputData.begin(), outputData.end())));
++        std::fstream file("/usr/share/arm/armnn/models/labels.txt");
++        //std::string predict_target_name;
++        for (int i=0; i <= label; i++)
++        {
++          std::getline(file, predict_target_name_n);
++        }
++        //get the probability of the prediction
++	    float prob = 100*outputData.data()[label];
++		//clean the top one so as to find the second top prediction
++        outputData.data()[label] = 0;
++
++        std::cout << "Top(" << (ii+1) << ") prediction is " << predict_target_name_n << " with confidence:  " << prob << "%" << std::endl;
++      }
++      std::cout << "Performance (FPS): " << preformance_ret << std::endl;
++
++      if (input_type != INPUT_IMAGE)
++      {
++        //convert image format back to BGR for OpenCV imshow from RGB format required by armnn.
++        cv::cvtColor(test_image, test_image, CV_RGB2BGR);
++        // output identified object name on top of input image
++        cv::putText(test_image, predict_target_name,
++                    cv::Point(rectCrop.x + 5,rectCrop.y + 20), // Coordinates
++                    cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
++                    1.0, // Scale. 2.0 = 2x bigger
++                    cv::Scalar(0,0,255), // Color
++                    1, // Thickness
++                    8); // Line type
++
++        // output preformance in FPS on top of input image
++        std::string preformance_ret_string = "Performance (FPS): " + boost::lexical_cast<std::string>(preformance_ret);				
++        cv::putText(test_image, preformance_ret_string,
++                    cv::Point(rectCrop.x + 5,rectCrop.y + 40), // Coordinates
++                    cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
++                    1.0, // Scale. 2.0 = 2x bigger
++                    cv::Scalar(0,0,255), // Color
++                    1, // Thickness
++                    8); // Line type
++
++        cv::imshow("ARMNN MobileNet Example", test_image);
++        waitKey(2);
++      }
++    }
++  }
++  catch (armnn::Exception const& e)
++  {
++    BOOST_LOG_TRIVIAL(fatal) << "Armnn Error: " << e.what();
++    return EXIT_FAILURE;
++  }
++  return EXIT_SUCCESS;
 +}
 +
 +// This will run a test
 +int RunTest(const std::string& modelFormat,
 +            const std::string& inputTensorShapeStr,
-+            const vector<armnn::Compute>& computeDevice,
++            const vector<armnn::BackendId>& computeDevice,
 +            const std::string& modelPath,
 +            const std::string& inputName,
 +            const std::string& inputTensorDataFilePath,
@@ -515,56 +477,54 @@ index 0000000..a26356e
 +            const size_t subgraphId,
 +            const std::shared_ptr<armnn::IRuntime>& runtime = nullptr)
 +{
-+    // Parse model binary flag from the model-format string we got from the command-line
-+    bool isModelBinary;
-+    if (modelFormat.find("bin") != std::string::npos)
-+    {
-+        isModelBinary = true;
-+    }
-+    else if (modelFormat.find("txt") != std::string::npos || modelFormat.find("text") != std::string::npos)
-+    {
-+        isModelBinary = false;
-+    }
-+    else
++  // Parse model binary flag from the model-format string we got from the command-line
++  bool isModelBinary;
++  if (modelFormat.find("bin") != std::string::npos)
++  {
++    isModelBinary = true;
++  }
++  else if (modelFormat.find("txt") != std::string::npos || modelFormat.find("text") != std::string::npos)
++  {
++    isModelBinary = false;
++  }
++  else
++  {
++    BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Please include 'binary' or 'text'";
++    return EXIT_FAILURE;
++  }
++
++  // Parse input tensor shape from the string we got from the command-line.
++  std::unique_ptr<armnn::TensorShape> inputTensorShape;
++  if (!inputTensorShapeStr.empty())
++  {
++    std::stringstream ss(inputTensorShapeStr);
++    std::vector<unsigned int> dims = ParseArray<unsigned int>(ss);
++    try
 +    {
-+        BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Please include 'binary' or 'text'";
-+        return EXIT_FAILURE;
++      // Coverity fix: An exception of type armnn::InvalidArgumentException is thrown and never caught.
++      inputTensorShape = std::make_unique<armnn::TensorShape>(dims.size(), dims.data());
 +    }
-+
-+    // Parse input tensor shape from the string we got from the command-line.
-+    std::unique_ptr<armnn::TensorShape> inputTensorShape;
-+    if (!inputTensorShapeStr.empty())
++    catch (const armnn::InvalidArgumentException& e)
 +    {
-+        std::stringstream ss(inputTensorShapeStr);
-+        std::vector<unsigned int> dims = ParseArray<unsigned int>(ss);
-+
-+        try
-+        {
-+            // Coverity fix: An exception of type armnn::InvalidArgumentException is thrown and never caught.
-+            inputTensorShape = std::make_unique<armnn::TensorShape>(dims.size(), dims.data());
-+        }
-+        catch (const armnn::InvalidArgumentException& e)
-+        {
-+            BOOST_LOG_TRIVIAL(fatal) << "Cannot create tensor shape: " << e.what();
-+            return EXIT_FAILURE;
-+        }
++      BOOST_LOG_TRIVIAL(fatal) << "Cannot create tensor shape: " << e.what();
++      return EXIT_FAILURE;
 +    }
-+
-+    // Forward to implementation based on the parser type
-+    if (modelFormat.find("caffe") != std::string::npos)
-+    {
++  }
++  // Forward to implementation based on the parser type
++  if (modelFormat.find("caffe") != std::string::npos)
++  {
 +#if defined(ARMNN_CAFFE_PARSER)
-+        return MainImpl<armnnCaffeParser::ICaffeParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                               inputName.c_str(), inputTensorShape.get(),
-+                                                               inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                               enableProfiling, subgraphId, runtime);
++    return MainImpl<armnnCaffeParser::ICaffeParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                           inputName.c_str(), inputTensorShape.get(),
++                                                           inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                           enableProfiling, subgraphId, runtime);
 +#else
-+        BOOST_LOG_TRIVIAL(fatal) << "Not built with Caffe parser support.";
-+        return EXIT_FAILURE;
++    BOOST_LOG_TRIVIAL(fatal) << "Not built with Caffe parser support.";
++    return EXIT_FAILURE;
 +#endif
-+    }
-+    else if (modelFormat.find("onnx") != std::string::npos)
-+{
++  }
++  else if (modelFormat.find("onnx") != std::string::npos)
++  {
 +#if defined(ARMNN_ONNX_PARSER)
 +    return MainImpl<armnnOnnxParser::IOnnxParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
 +                                                         inputName.c_str(), inputTensorShape.get(),
@@ -574,329 +534,140 @@ index 0000000..a26356e
 +    BOOST_LOG_TRIVIAL(fatal) << "Not built with Onnx parser support.";
 +    return EXIT_FAILURE;
 +#endif
-+    }
-+    else if (modelFormat.find("tensorflow") != std::string::npos)
-+    {
++  }
++  else if (modelFormat.find("tensorflow") != std::string::npos)
++  {
 +#if defined(ARMNN_TF_PARSER)
-+        return MainImpl<armnnTfParser::ITfParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                         inputName.c_str(), inputTensorShape.get(),
-+                                                         inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                         enableProfiling, subgraphId, runtime);
++    return MainImpl<armnnTfParser::ITfParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                     inputName.c_str(), inputTensorShape.get(),
++                                                     inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                     enableProfiling, subgraphId, runtime);
 +#else
-+        BOOST_LOG_TRIVIAL(fatal) << "Not built with Tensorflow parser support.";
-+        return EXIT_FAILURE;
++    BOOST_LOG_TRIVIAL(fatal) << "Not built with Tensorflow parser support.";
++    return EXIT_FAILURE;
 +#endif
-+    }
-+    else if(modelFormat.find("tflite") != std::string::npos)
-+    {
++  }
++  else if(modelFormat.find("tflite") != std::string::npos)
++  {
 +#if defined(ARMNN_TF_LITE_PARSER)
-+        if (! isModelBinary)
-+        {
-+            BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Only 'binary' format supported \
-+              for tflite files";
-+            return EXIT_FAILURE;
-+        }
-+        return MainImpl<armnnTfLiteParser::ITfLiteParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                                 inputName.c_str(), inputTensorShape.get(),
-+                                                                 inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                                 enableProfiling, subgraphId, runtime);
++    if (! isModelBinary)
++    {
++      BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Only 'binary' format supported \
++             for tflite files";
++      return EXIT_FAILURE;
++    }
++    return MainImpl<armnnTfLiteParser::ITfLiteParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                             inputName.c_str(), inputTensorShape.get(),
++                                                             inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                             enableProfiling, subgraphId, runtime);
 +#else
-+        BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
++    BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
 +            "'. Please include 'caffe', 'tensorflow', 'tflite' or 'onnx'";
-+        return EXIT_FAILURE;
++    return EXIT_FAILURE;
 +#endif
-+    }
-+    else
-+    {
-+        BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
++  }
++  else
++  {
++    BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
 +                                 "'. Please include 'caffe', 'tensorflow', 'tflite' or 'onnx'";
-+        return EXIT_FAILURE;
-+    }
++    return EXIT_FAILURE;
++  }
 +}
 +
-+int RunCsvTest(const armnnUtils::CsvRow &csvRow,
-+               const std::shared_ptr<armnn::IRuntime>& runtime)
++int main(int argc, const char* argv[])
 +{
-+    std::string modelFormat;
-+    std::string modelPath;
-+    std::string inputName;
-+    std::string inputTensorShapeStr;
-+    std::string inputTensorDataFilePath;
-+    std::string outputName;
-+
++    // Configures logging for both the ARMNN library and this test program.
++#ifdef NDEBUG
++  armnn::LogSeverity level = armnn::LogSeverity::Info;
++#else
++  armnn::LogSeverity level = armnn::LogSeverity::Debug;
++#endif
++  armnn::ConfigureLogging(true, true, level);
++  armnnUtils::ConfigureLogging(boost::log::core::get().get(), true, true, level);
++
++  std::string testCasesFile;
++
++  std::string modelFormat = "tensorflow-binary";
++  std::string modelPath = "/usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb";
++  std::string inputName = "input";
++  std::string inputTensorShapeStr = "1 224 224 3";
++  std::string inputTensorDataFilePath = "/usr/share/arm/armnn/testvecs/test2.mp4";
++  std::string outputName = "MobilenetV1/Predictions/Reshape_1";
++  std::vector<armnn::BackendId> computeDevices = {armnn::Compute::CpuAcc};
++  // Catch ctrl-c to ensure a clean exit
++  signal(SIGABRT, exit);
++  signal(SIGTERM, exit);
++
++  if (argc == 1)
++  {
++	return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
++                       modelPath, inputName, inputTensorDataFilePath, outputName, false, 1000);
++  }
++  else
++  {
 +    size_t subgraphId = 0;
-+
 +    po::options_description desc("Options");
 +    try
 +    {
-+        desc.add_options()
-+        ("model-format,f", po::value(&modelFormat),
-+         "caffe-binary, caffe-text, tflite-binary, onnx-binary, onnx-text, tensorflow-binary or tensorflow-text.")
-+        ("model-path,m", po::value(&modelPath), "Model Name w/ full path, e.g.of supported model types: .caffemodel, .prototxt, .tflite,"
-+         " .onnx")
-+        ("compute,c", po::value<std::vector<armnn::Compute>>()->multitoken(),
-+         "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
-+        ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network.")
-+        ("input-tensor-shape,s", po::value(&inputTensorShapeStr),
-+         "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
-+         "This parameter is optional, depending on the network.")
-+        ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
-+         "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
-+        ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
-+        ("number-frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process " );
++      desc.add_options()
++      ("help", "Display usage information")
++      ("test-cases,t", po::value(&testCasesFile), "Path to a CSV file containing test cases to run. "
++       "If set, further parameters -- with the exception of compute device and concurrency -- will be ignored, "
++       "as they are expected to be defined in the file for each test in particular.")
++      ("concurrent,n", po::bool_switch()->default_value(false),
++       "Whether or not the test cases should be executed in parallel")
++      ("model-format,f", po::value(&modelFormat),
++       "caffe-binary, caffe-text, onnx-binary, onnx-text, tflite-binary, tensorflow-binary or tensorflow-text.")
++      ("model-path,m", po::value(&modelPath), "Path to model file, e.g. .caffemodel, .prototxt,"
++       " .tflite, .onnx")
++      ("compute,c", po::value<std::vector<armnn::BackendId>>()->multitoken(),
++       "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
++      ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network.")
++      ("input-tensor-shape,s", po::value(&inputTensorShapeStr),
++       "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
++       "This parameter is optional, depending on the network.")
++      ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
++       "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
++      ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
++      ("event-based-profiling,e", po::bool_switch()->default_value(false),
++       "Enables built in profiler. If unset, defaults to off.")
++      ("number_frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process.");
 +    }
 +    catch (const std::exception& e)
 +    {
-+        // Coverity points out that default_value(...) can throw a bad_lexical_cast,
-+        // and that desc.add_options() can throw boost::io::too_few_args.
-+        // They really won't in any of these cases.
-+        BOOST_ASSERT_MSG(false, "Caught unexpected exception");
-+        BOOST_LOG_TRIVIAL(fatal) << "Fatal internal error: " << e.what();
-+        return EXIT_FAILURE;
-+    }
-+
-+    std::vector<const char*> clOptions;
-+    clOptions.reserve(csvRow.values.size());
-+    for (const std::string& value : csvRow.values)
-+    {
-+        clOptions.push_back(value.c_str());
++      // Coverity points out that default_value(...) can throw a bad_lexical_cast,
++      // and that desc.add_options() can throw boost::io::too_few_args.
++      // They really won't in any of these cases.
++      BOOST_ASSERT_MSG(false, "Caught unexpected exception");
++      BOOST_LOG_TRIVIAL(fatal) << "Fatal internal error: " << e.what();
++      return EXIT_FAILURE;
 +    }
 +
++    // Parses the command-line.
 +    po::variables_map vm;
 +    try
 +    {
-+        po::store(po::parse_command_line(static_cast<int>(clOptions.size()), clOptions.data(), desc), vm);
-+
-+        po::notify(vm);
-+
-+        CheckOptionDependencies(vm);
++      po::store(po::parse_command_line(argc, argv, desc), vm);
++      po::notify(vm);
 +    }
 +    catch (const po::error& e)
 +    {
-+        std::cerr << e.what() << std::endl << std::endl;
-+        std::cerr << desc << std::endl;
-+        return EXIT_FAILURE;
++      std::cerr << e.what() << std::endl << std::endl;
++      std::cerr << desc << std::endl;
++      return EXIT_FAILURE;
 +    }
 +
-+    // Remove leading and trailing whitespaces from the parsed arguments.
-+    boost::trim(modelFormat);
-+    boost::trim(modelPath);
-+    boost::trim(inputName);
-+    boost::trim(inputTensorShapeStr);
-+    boost::trim(inputTensorDataFilePath);
-+    boost::trim(outputName);
-+
-+    // Get the value of the switch arguments.
-+    bool enableProfiling = vm["event-based-profiling"].as<bool>();
-+
++    // Run single test
 +    // Get the preferred order of compute devices.
-+    std::vector<armnn::Compute> computeDevices = vm["compute"].as<std::vector<armnn::Compute>>();
++    std::vector<armnn::BackendId> computeDevices = vm["compute"].as<std::vector<armnn::BackendId>>();
++	bool enableProfiling = vm["event-based-profiling"].as<bool>();
 +
 +    // Remove duplicates from the list of compute devices.
 +    RemoveDuplicateDevices(computeDevices);
 +
-+    // Check that the specified compute devices are valid.
-+    if (!CheckDevicesAreValid(computeDevices))
-+    {
-+        BOOST_LOG_TRIVIAL(fatal) << "The list of preferred devices contains an invalid compute";
-+        return EXIT_FAILURE;
-+    }
-+
 +    return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
-+                   modelPath, inputName, inputTensorDataFilePath, outputName, enableProfiling, subgraphId, runtime);
-+}
-+
-+int main(int argc, const char* argv[])
-+{
-+    // Configures logging for both the ARMNN library and this test program.
-+#ifdef NDEBUG
-+    armnn::LogSeverity level = armnn::LogSeverity::Info;
-+#else
-+    armnn::LogSeverity level = armnn::LogSeverity::Debug;
-+#endif
-+    armnn::ConfigureLogging(true, true, level);
-+    armnnUtils::ConfigureLogging(boost::log::core::get().get(), true, true, level);
-+
-+    std::string testCasesFile;
-+
-+    std::string modelFormat = "tensorflow-binary";
-+    std::string modelPath = "/usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb";
-+    std::string inputName = "input";
-+    std::string inputTensorShapeStr = "1 224 224 3";
-+    std::string inputTensorDataFilePath = "/usr/share/arm/armnn/testvecs/test2.mp4";
-+    std::string outputName = "MobilenetV1/Predictions/Reshape_1";
-+    std::vector<armnn::Compute> computeDevices = {armnn::Compute::CpuAcc};
-+
-+    // Catch ctrl-c to ensure a clean exit
-+    signal(SIGABRT, exit);
-+    signal(SIGTERM, exit);
-+
-+    if (argc == 1)
-+    {
-+	return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
-+                       modelPath, inputName, inputTensorDataFilePath, outputName, false, 10);
-+    }
-+    else
-+    {
-+	size_t subgraphId = 0;
-+	po::options_description desc("Options");
-+	
-+	try
-+	{
-+            desc.add_options()
-+	    ("help", "Display usage information")
-+	    ("model-format,f", po::value(&modelFormat),
-+		 "caffe-binary, caffe-text, onnx-binary, onnx-text, tflite-binary, tensorflow-binary or tensorflow-text."
-+		 " E.g.: -f tensorflow-binary")
-+	    ("model-path,m", po::value(&modelPath), "Model Name w/ full path, e.g.of supported model types: .caffemodel, .prototxt,"
-+		 " .tflite, .onnx."
-+		 " E.g.: -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb")
-+	    ("compute,c", po::value<std::vector<armnn::Compute>>()->multitoken(),
-+		 "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc."
-+		 " E.g.: -c CpuAcc")
-+	    ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network."
-+		 " E.g.: -i input")
-+	    ("input-tensor-shape,s", po::value(&inputTensorShapeStr),
-+		 "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
-+		 "This parameter is optional, depending on the network."
-+		 " E.g.: -s '1 224 224 3'")
-+	    ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
-+		 "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input."
-+		 " E.g.: -d /usr/share/arm/armnn/testvecs/camera_live_input")
-+	    ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network."
-+		 " E.g.: -o MobilenetV1/Predictions/Reshape_1")
-+	    ("number_frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process. E.g.: --number_frame 100.");
-+	}
-+	catch (const std::exception& e)
-+	{
-+		// Coverity points out that default_value(...) can throw a bad_lexical_cast,
-+		// and that desc.add_options() can throw boost::io::too_few_args.
-+		// They really won't in any of these cases.
-+		BOOST_ASSERT_MSG(false, "Caught unexpected exception");
-+		BOOST_LOG_TRIVIAL(fatal) << "Fatal internal error: " << e.what();
-+		return EXIT_FAILURE;
-+	}
-+
-+	// Parses the command-line.
-+	po::variables_map vm;
-+	try
-+	{
-+		po::store(po::parse_command_line(argc, argv, desc), vm);
-+
-+		if (CheckOption(vm, "help") || argc <= 1)
-+		{
-+	        	std::cout << "Executes a neural network model using the provided input tensor. " << std::endl;
-+			std::cout << "Prints the resulting output tensor." << std::endl;
-+			std::cout << std::endl;
-+			std::cout << desc << std::endl;
-+			return EXIT_SUCCESS;
-+		}
-+
-+		po::notify(vm);
-+	}
-+	catch (const po::error& e)
-+	{
-+		std::cerr << e.what() << std::endl << std::endl;
-+		std::cerr << desc << std::endl;
-+		return EXIT_FAILURE;
-+	}
-+
-+	// Get the value of the switch arguments.
-+	bool concurrent = false;//disabled
-+	bool enableProfiling = false;//disabled
-+
-+	// Check whether we have to load test cases from a file.
-+	if (CheckOption(vm, "test-cases"))
-+	{
-+		// Check that the file exists.
-+		if (!boost::filesystem::exists(testCasesFile))
-+		{
-+			BOOST_LOG_TRIVIAL(fatal) << "Given file \"" << testCasesFile << "\" does not exist";
-+			return EXIT_FAILURE;
-+		}
-+
-+	        // Parse CSV file and extract test cases
-+		armnnUtils::CsvReader reader;
-+		std::vector<armnnUtils::CsvRow> testCases = reader.ParseFile(testCasesFile);
-+
-+		// Check that there is at least one test case to run
-+		if (testCases.empty())
-+		{
-+			BOOST_LOG_TRIVIAL(fatal) << "Given file \"" << testCasesFile << "\" has no test cases";
-+			return EXIT_FAILURE;
-+		}
-+
-+		// Create runtime
-+		armnn::IRuntime::CreationOptions options;
-+		std::shared_ptr<armnn::IRuntime> runtime(armnn::IRuntime::Create(options));
-+
-+		const std::string executableName("ExecuteNetwork");
-+
-+		// Check whether we need to run the test cases concurrently
-+		if (concurrent)
-+		{
-+			std::vector<std::future<int>> results;
-+			results.reserve(testCases.size());
-+
-+			// Run each test case in its own thread
-+			for (auto&  testCase : testCases)
-+			{
-+				testCase.values.insert(testCase.values.begin(), executableName);
-+				results.push_back(std::async(std::launch::async, RunCsvTest, std::cref(testCase), std::cref(runtime)));
-+			}
-+
-+			// Check results
-+			for (auto& result : results)
-+			{
-+				if (result.get() != EXIT_SUCCESS)
-+				{
-+					return EXIT_FAILURE;
-+				}
-+			}
-+		}
-+		else
-+		{
-+			// Run tests sequentially
-+			for (auto&  testCase : testCases)
-+			{
-+				testCase.values.insert(testCase.values.begin(), executableName);
-+				if (RunCsvTest(testCase, runtime) != EXIT_SUCCESS)
-+				{
-+					return EXIT_FAILURE;
-+				}
-+			}
-+		}
-+
-+		return EXIT_SUCCESS;
-+	}
-+	else // Run single test
-+	{
-+		// Get the preferred order of compute devices.
-+		std::vector<armnn::Compute> computeDevices = vm["compute"].as<std::vector<armnn::Compute>>();
-+
-+		// Remove duplicates from the list of compute devices.
-+		RemoveDuplicateDevices(computeDevices);
-+		// Check that the specified compute devices are valid.
-+		if (!CheckDevicesAreValid(computeDevices))
-+		{
-+			BOOST_LOG_TRIVIAL(fatal) << "The list of preferred devices contains an invalid compute";
-+			return EXIT_FAILURE;
-+		}
-+
-+		try
-+		{
-+			CheckOptionDependencies(vm);
-+		}
-+		catch (const po::error& e)
-+		{
-+			std::cerr << e.what() << std::endl << std::endl;
-+			std::cerr << desc << std::endl;
-+			return EXIT_FAILURE;
-+		}
-+		return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
-+				   modelPath, inputName, inputTensorDataFilePath, outputName, enableProfiling, subgraphId);
-+	}
-+    }
++                   modelPath, inputName, inputTensorDataFilePath, outputName, enableProfiling, subgraphId);
++  }
 +}
 +
 -- 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index eecbb51..ff1bfbd 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -5,12 +5,12 @@ LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-PR = "r1"
-PV = "18.08"
+PR = "r0"
+PV = "19.02"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
 BRANCH = "master"
-SRCREV = "c577f2c6a3b4ddb6ba87a882723c53a248afbeba"
+SRCREV = "0028d1b0ce5f4c2c6a6eb3c66f38111c21eb47a3"
 SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
 
 SRCREV_FORMAT = "armnn"
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 SRC_URI = " \
-    git://github.com/ARM-software/armnn.git;name=armnn;branch=${BRANCH} \
+    git://review.mlplatform.org/ml/armnn;protocol=https;name=armnn;branch=${BRANCH} \
     file://0001-stdlib-issue-work-around.patch \
     file://0002-enable-use-of-boost-shared-library.patch \
     file://0003-add-more-test-command-line-arguments.patch \
@@ -42,6 +42,7 @@ DEPENDS = " \
     arm-compute-library \
     armnn-caffe \
     armnn-tensorflow \
+    armnn-onnx \
     opencv \
 "
 
@@ -52,7 +53,8 @@ EXTRA_OECMAKE=" \
     -DARMCOMPUTE_ROOT=${STAGING_DIR_HOST}${datadir}/arm-compute-library \
     -DCAFFE_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-caffe \
     -DTF_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-tensorflow \
-    -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 \
+    -DONNX_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-onnx \
+    -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 -DBUILD_ONNX_PARSER=1 \
     -DARMCOMPUTENEON=1 \
     -DBUILD_TESTS=1 -DPROFILING=1 \
     -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
-- 
1.9.1


