Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BE1D6529E4
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2019 15:53:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x83FqQ5c052272
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2019 10:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567525946;
	bh=Nko4AtpI0ccsp55hcLF+ngcpNw0t+gAWZgCQct4l/H8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EwpwspW67M0ULeG5e1rtXCjzBZDvN3cyvAKhpy2hmWeFbSHfNTrW3mtVhJONeILm9
	iM1Gg+yIQKMqLxx4CxBhKtslftTyqadR0uQBVUD3wMHxpd9LY/ESIF0Jua/b6mwCDb
	SubwYYI7M42M10P9OpTA2Hnt4VwWejzoPK1IkEs0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x83FqQfx103094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 3 Sep 2019 10:52:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 3 Sep 2019 10:52:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 3 Sep 2019 10:52:25 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x83FqPgf069068;
	Tue, 3 Sep 2019 10:52:25 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Sep 2019 11:52:03 -0400
Message-ID: <20190903155203.23271-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190903155203.23271-1-x0157990@ti.com>
References: <20190903155203.23271-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [PATCH 2/2] armnn: Upgrade to latest release 19.08
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
X-List-Received-Date: Tue, 03 Sep 2019 15:53:44 -0000
Content-Type: text/plain

- Upgrade to latest release and modify example for new API (19.08 change)
- Realign patches (no change only context lines) for the new release

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 ...2-enable-use-of-boost-shared-library.patch | 36 ++++++++-----------
 .../0004-generate-versioned-library.patch     | 23 ++++++------
 ...mples-update-for-19.08-modifications.patch | 28 +++++++++++++++
 .../recipes-support/armnn/armnn_git.bb        | 10 +++---
 4 files changed, 60 insertions(+), 37 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
index 50c2e1da..a436ffda 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
@@ -1,37 +1,31 @@
-From 34a7ec821b11f7bed3dd644bf341cbaf6023516b Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Tue, 11 Sep 2018 17:11:07 -0400
-Subject: [PATCH] enable use of boost shared library
+From b46177bb1a59df0130aba88555ec4f81024669a8 Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Tue, 27 Aug 2019 09:40:54 -0400
+Subject: [PATCH] fix boost lib dependency
 
 Upstream-Status: Inappropriate [configuration]
-This is a hack to modify hard coded configuration. If anything, it
-should be made configurable.
+This is a hack to modify hard coded configuration. If anything, it should be made configurable.     
 
-Signed-off-by: Qin Su <qsu@ti.com>
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
 ---
- cmake/GlobalConfig.cmake | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
- mode change 100644 => 100755 cmake/GlobalConfig.cmake
+ cmake/GlobalConfig.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
-old mode 100644
-new mode 100755
-index 2dbeada..a5a1113
+index f518f809..d94c4e50 100755
 --- a/cmake/GlobalConfig.cmake
 +++ b/cmake/GlobalConfig.cmake
-@@ -96,8 +96,10 @@ endif()
+@@ -135,8 +135,8 @@ endif()
  set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})
-
+ 
  # Boost
 -add_definitions("-DBOOST_ALL_NO_LIB") # Turn off auto-linking as we specify the libs manually
 -set(Boost_USE_STATIC_LIBS ON)
-+#add_definitions("-DBOOST_ALL_NO_LIB") # Turn off auto-linking as we specify the libs manually
-+#set(Boost_USE_STATIC_LIBS ON)
 +add_definitions(-DBOOST_ALL_DYN_LINK) # use shared library
 +set(Boost_USE_STATIC_LIBS OFF)
  find_package(Boost 1.59 REQUIRED COMPONENTS unit_test_framework system filesystem log program_options)
- include_directories(SYSTEM "${Boost_INCLUDE_DIR}")
- link_directories(${Boost_LIBRARY_DIR})
---
-1.9.1
+ include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
+ link_directories(${Boost_LIBRARY_DIRS})
+-- 
+2.17.1
 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
index 06756130..a3c3e21a 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
@@ -1,19 +1,20 @@
-From ad22150032bda1b1a8d0f0cb4b0b020f80724313 Mon Sep 17 00:00:00 2001
+From 94bec1c47b8da6350c598827950ef4852e998bd9 Mon Sep 17 00:00:00 2001
 From: Djordje Senicic <x0157990@ti.com>
-Date: Mon, 24 Jun 2019 15:10:04 -0400
-Subject: [PATCH] generate versioned library
+Date: Mon, 2 Sep 2019 10:16:21 -0400
+Subject: [PATCH] Generate versioned library
 
 Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Djordje Senicic <x0157990@ti.com>
 ---
  CMakeLists.txt | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b6c97761..5c7b13a7 100644
+index 8bdcd8df..38d1390f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -88,6 +88,7 @@ if(BUILD_CAFFE_PARSER)
+@@ -95,6 +95,7 @@ if(BUILD_CAFFE_PARSER)
  
      target_link_libraries(armnnCaffeParser armnn)
      target_link_libraries(armnnCaffeParser ${PROTOBUF_LIBRARIES})
@@ -21,7 +22,7 @@ index b6c97761..5c7b13a7 100644
  
  endif()
  
-@@ -112,6 +113,7 @@ if(BUILD_ONNX_PARSER)
+@@ -119,6 +120,7 @@ if(BUILD_ONNX_PARSER)
  
      # Protobuf
      target_link_libraries(armnnOnnxParser ${PROTOBUF_LIBRARIES})
@@ -29,18 +30,18 @@ index b6c97761..5c7b13a7 100644
  endif()
  
  if(BUILD_TF_PARSER)
-@@ -135,6 +137,7 @@ if(BUILD_TF_PARSER)
+@@ -142,6 +144,7 @@ if(BUILD_TF_PARSER)
  
      # Protobuf (use the specific version tensorflow wants)
      target_link_libraries(armnnTfParser ${PROTOBUF_LIBRARIES})
 +    set_target_properties(armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  endif()
  
- if(BUILD_ARMNN_QUANTIZER)
-@@ -430,6 +433,7 @@ endif()
- install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
+ if(BUILD_ARMNN_QUANTIZER AND ARMNNREF)
+@@ -473,6 +476,7 @@ install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
  
- target_link_libraries(armnn ${Boost_LOG_LIBRARY} ${Boost_THREAD_LIBRARY} ${Boost_SYSTEM_LIBRARY})
+ target_link_libraries(armnn ${Boost_LOG_LIBRARY} ${Boost_THREAD_LIBRARY}
+                             ${Boost_SYSTEM_LIBRARY} ${Boost_FILESYSTEM_LIBRARY})
 +set_target_properties(armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
  
  if(ARMCOMPUTENEON OR ARMCOMPUTECL)
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch b/meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch
new file mode 100644
index 00000000..f75b1dc4
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch
@@ -0,0 +1,28 @@
+From a3e266a2de7c45116428f4e21645a2657534191b Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Mon, 26 Aug 2019 03:51:39 -0400
+Subject: [PATCH] armnnexamples: update for 19.08 modifications
+
+Upstream-Status: Inappropriate [TI only test code]
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ tests/ArmnnExamples/ArmnnExamples.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
+index d1526539..c10a4fc0 100644
+--- a/tests/ArmnnExamples/ArmnnExamples.cpp
++++ b/tests/ArmnnExamples/ArmnnExamples.cpp
+@@ -310,7 +310,7 @@ int MainImpl(const char* modelPath,
+     params.m_OutputBindings = { outputName };
+     //params.m_EnableProfiling = enableProfiling;
+     params.m_SubgraphId = 0;
+-    InferenceModel<TParser, TDataType> model(params, enableProfiling, runtime);
++    InferenceModel<TParser, TDataType> model(params, enableProfiling, "", runtime);
+ 
+     VideoCapture cap;
+     int input_type = INPUT_IMAGE;
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 77921218..e8d16944 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -5,12 +5,12 @@ LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-PR = "r0"
-PV = "19.05"
+PR = "r1"
+PV = "19.08"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
-BRANCH = "branches/armnn_19_05"
-SRCREV = "a723ec5d2ac35948efb5dfd0c121a1a89cb977b7"
+BRANCH = "branches/armnn_19_08"
+SRCREV = "26052fcf2f8c91f3479c9484354e88e8944d004d"
 
 SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
 BRANCH_tidl-api = "master"
@@ -30,8 +30,8 @@ SRC_URI = " \
     file://0005-add-armnn-mobilenet-test-example.patch \
     file://0006-armnn-mobilenet-test-example.patch \
     file://0007-enable-use-of-arm-compute-shared-library.patch \
-    file://0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch \
     file://0009-command-line-options-for-video-port-selection.patch \
+    file://0010-armnnexamples-update-for-19.08-modifications.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
 "
-- 
2.17.1


