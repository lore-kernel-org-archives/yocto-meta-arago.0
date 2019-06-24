Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 550C05299F
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 00:51:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5P0oHUe051346
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 19:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561423817;
	bh=QyIfNxT3cQ0qlNPSD5jvijdBs16M5CnZQzFUFkYyXL4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vF/AD1mijveQDMaokC8zAG98wN2aI8gPmx1p8Q3WII04A9GUJpPaYFQXmIBUHeVb5
	7MEZ8JrbYxa+md1s1khY5CAfRcfTQ9LqpsCGouJX9pwlx0b/fI0FJz5NgaYXDoXD6K
	fV+jD6l7DlmHh4+11pYvmyMqh38fYsgam3KWLnaQ=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5P0oHfW079131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 19:50:17 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 19:50:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 19:50:16 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5P0oFCV112956;
	Mon, 24 Jun 2019 19:50:16 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 15:46:34 -0400
Message-ID: <20190624194634.9959-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624194634.9959-1-x0157990@ti.com>
References: <20190624194634.9959-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH 2/2] armnn: Upgrade to 19.05 version
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
X-List-Received-Date: Tue, 25 Jun 2019 00:51:00 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../0004-generate-versioned-library.patch     | 52 +++++++------------
 ...005-add-armnn-mobilenet-test-example.patch | 17 +++---
 .../0006-armnn-mobilenet-test-example.patch   |  4 +-
 .../recipes-support/armnn/armnn_git.bb        | 10 ++--
 4 files changed, 35 insertions(+), 48 deletions(-)

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
index aaea2a7e..06756130 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
@@ -1,19 +1,19 @@
-From 00dc7ad438b9d751201b8e8d5aa747a19d1cac3b Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Wed, 13 Feb 2019 11:11:52 -0500
+From ad22150032bda1b1a8d0f0cb4b0b020f80724313 Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Mon, 24 Jun 2019 15:10:04 -0400
 Subject: [PATCH] generate versioned library
 
 Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Qin Su <qsu@ti.com>
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
 ---
- CMakeLists.txt | 6 ++++++
- 1 file changed, 6 insertions(+)
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2768f6a..c16383a 100644
+index b6c97761..5c7b13a7 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -82,6 +82,7 @@ if(BUILD_CAFFE_PARSER)
+@@ -88,6 +88,7 @@ if(BUILD_CAFFE_PARSER)
  
      target_link_libraries(armnnCaffeParser armnn)
      target_link_libraries(armnnCaffeParser ${PROTOBUF_LIBRARIES})
@@ -21,7 +21,7 @@ index 2768f6a..c16383a 100644
  
  endif()
  
-@@ -106,6 +107,7 @@ if(BUILD_ONNX_PARSER)
+@@ -112,6 +113,7 @@ if(BUILD_ONNX_PARSER)
  
      # Protobuf
      target_link_libraries(armnnOnnxParser ${PROTOBUF_LIBRARIES})
@@ -29,38 +29,22 @@ index 2768f6a..c16383a 100644
  endif()
  
  if(BUILD_TF_PARSER)
-@@ -129,6 +131,7 @@ if(BUILD_TF_PARSER)
+@@ -135,6 +137,7 @@ if(BUILD_TF_PARSER)
  
      # Protobuf (use the specific version tensorflow wants)
      target_link_libraries(armnnTfParser ${PROTOBUF_LIBRARIES})
 +    set_target_properties(armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  endif()
  
- if(BUILD_TF_LITE_PARSER)
-@@ -147,6 +150,7 @@ if(BUILD_TF_LITE_PARSER)
+ if(BUILD_ARMNN_QUANTIZER)
+@@ -430,6 +433,7 @@ endif()
+ install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
  
-     target_link_libraries(armnnTfLiteParser ${Boost_FILESYSTEM_LIBRARY} ${Boost_THREAD_LIBRARY})
-     target_link_libraries(armnnTfLiteParser armnn ${FLATBUFFERS_LIBRARY})
-+    set_target_properties(armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- endif()
- 
- if(BUILD_ARMNN_SERIALIZER)
-@@ -175,6 +179,7 @@ if(BUILD_ARMNN_SERIALIZER)
-     target_include_directories(armnnSerializer SYSTEM PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/src/armnnSerializer)
- 
-     target_link_libraries(armnnSerializer armnn ${FLATBUFFERS_LIBRARY})
-+    set_target_properties(armnnSerializer PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- endif()
- 
- list(APPEND armnn_sources
-@@ -414,6 +419,7 @@ endif()
- if(PROFILING_BACKEND_STREAMLINE)
-     target_link_libraries(armnn pthread)
- endif()
-+set_target_properties( armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ target_link_libraries(armnn ${Boost_LOG_LIBRARY} ${Boost_THREAD_LIBRARY} ${Boost_SYSTEM_LIBRARY})
++set_target_properties(armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  
- if(BUILD_UNIT_TESTS)
-     set(unittest_sources)
+ if(ARMCOMPUTENEON OR ARMCOMPUTECL)
+     target_link_libraries(armnn ${ARMCOMPUTE_LIBRARIES})
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
index 47760ad5..edb37fbc 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
@@ -1,16 +1,17 @@
-From 50c0001642c831ae1d801cb53080e1ddf501c129 Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Wed, 13 Feb 2019 11:22:04 -0500
+From 99a6c339f1828d3cd1b193cf702bada9011d900b Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Mon, 24 Jun 2019 14:29:19 -0400
 Subject: [PATCH] add armnn mobilenet test example
 
 Upstream-Status: Inappropriate [TI only test code]
 Signed-off-by: Qin Su <qsu@ti.com>
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
 ---
  tests/CMakeLists.txt | 41 +++++++++++++++++++++++++++++++++++++++++
  1 file changed, 41 insertions(+)
 
 diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 9913321..6ed44ae 100644
+index dfcf4b48..5a78d3a6 100644
 --- a/tests/CMakeLists.txt
 +++ b/tests/CMakeLists.txt
 @@ -1,3 +1,6 @@
@@ -20,9 +21,9 @@ index 9913321..6ed44ae 100644
  # UnitTests
  include(CheckIncludeFiles)
  
-@@ -278,3 +281,41 @@ if (BUILD_ARMNN_SERIALIZER OR BUILD_CAFFE_PARSER OR BUILD_TF_PARSER OR BUILD_TF_
-         ${Boost_PROGRAM_OPTIONS_LIBRARY})
-     addDllCopyCommands(ExecuteNetwork)
+@@ -348,3 +351,41 @@ if(BUILD_ARMNN_QUANTIZER)
+     add_executable_ex(ImageCSVFileGenerator ${ImageCSVFileGenerator_sources})
+     ImageTensorExecutor(ImageCSVFileGenerator)
  endif()
 +
 +if (BUILD_ARMNN_EXAMPLES)
@@ -63,5 +64,5 @@ index 9913321..6ed44ae 100644
 +    addDllCopyCommands(ArmnnExamples)
 +endif()
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
index a6ce01af..54984105 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
@@ -326,9 +326,9 @@ index 0000000..53a11cc
 +    params.m_InputBindings = { inputName };
 +    params.m_InputShapes = { *inputTensorShape };
 +    params.m_OutputBindings = { outputName };
-+    params.m_EnableProfiling = enableProfiling;
++    //params.m_EnableProfiling = enableProfiling;
 +    params.m_SubgraphId = 0;
-+    InferenceModel<TParser, TDataType> model(params, runtime);
++    InferenceModel<TParser, TDataType> model(params, enableProfiling, runtime);
 +
 +    VideoCapture cap;
 +    int input_type = INPUT_IMAGE;
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index b5ebd129..076ea3aa 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
 PR = "r0"
-PV = "19.02"
+PV = "19.05"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
-BRANCH = "master"
-SRCREV = "0028d1b0ce5f4c2c6a6eb3c66f38111c21eb47a3"
+BRANCH = "branches/armnn_19_05"
+SRCREV = "a723ec5d2ac35948efb5dfd0c121a1a89cb977b7"
+
 SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
+BRANCH_tidl-api = "master"
 
 SRCREV_FORMAT = "armnn"
 
@@ -30,7 +32,7 @@ SRC_URI = " \
     file://0007-enable-use-of-arm-compute-shared-library.patch \
     file://0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
-    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
+    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
 "
 
 SRC_URI[mobilenet.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
-- 
2.17.1


