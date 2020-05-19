Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4A1E15298B
	for <meta-arago@arago-project.org>;
	Tue, 19 May 2020 05:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B66040C06;
	Tue, 19 May 2020 05:57:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XYFoiyLPQoFg; Tue, 19 May 2020 05:57:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2917940A9E;
	Tue, 19 May 2020 05:57:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6C0F816F347;
	Tue, 19 May 2020 01:57:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 May 2020 01:57:11 -0400
Message-Id: <1589867831-53674-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [dunfell/master][PATCH v2] armnn: deprecated, remove
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
X-List-Received-Date: Tue, 19 May 2020 05:59:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |   6 -
 .../packagegroup-arago-tisdk-matrix.bb             |   9 -
 .../recipes-core/packagegroups/ti-analytics.bb     |   4 -
 .../recipes-support/armnn/armnn_%.bbappend         |   3 -
 .../matrix/matrix-gui-tidl-demos_2.0.bb            |  16 -
 .../recipes-support/armnn/armnn-caffe_git.bb       |  22 -
 .../recipes-support/armnn/armnn-onnx_git.bb        |  22 -
 .../recipes-support/armnn/armnn-tensorflow_git.bb  |  26 -
 .../armnn/0001-stdlib-issue-work-around.patch      |  61 --
 .../0002-enable-use-of-boost-shared-library.patch  |  31 -
 ...0003-add-more-test-command-line-arguments.patch |  74 ---
 .../armnn/0004-generate-versioned-library.patch    |  51 --
 .../0005-add-armnn-mobilenet-test-example.patch    |  68 ---
 .../armnn/0006-armnn-mobilenet-test-example.patch  | 675 ---------------------
 ...-enable-use-of-arm-compute-shared-library.patch |  31 -
 ...gop-overflow-warning-resulting-in-compila.patch |  29 -
 ...and-line-options-for-video-port-selection.patch |  60 --
 ...nnexamples-update-for-19.08-modifications.patch |  28 -
 ...e-versioned-library-for-armnnTfLiteParser.patch |  25 -
 ...e-Fix-exception-for-help-command-line-opt.patch |  51 --
 ...e-setting-capture-resolution-for-the-came.patch |  48 --
 .../recipes-support/armnn/armnn_git.bb             | 102 ----
 22 files changed, 1442 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn-tensorflow_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0007-enable-use-of-arm-compute-shared-library.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch
 delete mode 100644 meta-arago-extras/recipes-support/armnn/armnn_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 083c85f..851f481 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -163,35 +163,29 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
-ARMNN_PACKAGES = ""
 VOXEL_PACKAGES = ""
-#ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn-dev', '', d)}"
 #VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk-dev', '', d)}"
 
 EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library-dev \
-                                ${ARMNN_PACKAGES} \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library-dev \
-                                ${ARMNN_PACKAGES} \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
                                 arm-compute-library-dev \
-                                ${ARMNN_PACKAGES} \
                                 tensorflow-lite-dev \
                                 tensorflow-lite-staticdev \
                                 pdm-anomaly-detection-dev \
 "
 EXTRA_PACKAGES_append_am65xx = " arm-compute-library-dev \
-                             ${ARMNN_PACKAGES} \
                              tensorflow-lite-dev \
                              tensorflow-lite-staticdev \
                              pdm-anomaly-detection-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index d1acfc5..dff30fb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -88,11 +88,6 @@ MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
      matrix-machinevision-demo-simplepeopletracking \
 "
 
-MATRIX_ARMNN_APPS = " \
-    matrix-armnn-demo-staticimg     \
-    matrix-armnn-demo-livecam       \
-"
-
 MATRIX_APPS = ""
 
 MATRIX_APPS_append_ti33x = "        \
@@ -115,7 +110,6 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
-    ${MATRIX_ARMNN_APPS}            \
     matrix-analytics-pdm-anomaly-detection \
 "
 
@@ -139,7 +133,6 @@ MATRIX_APPS_append_ti43x = "        \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
-    ${MATRIX_ARMNN_APPS}            \
     matrix-analytics-pdm-anomaly-detection \
 "
 
@@ -160,7 +153,6 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    ${MATRIX_ARMNN_APPS}            \
     matrix-analytics-pdm-anomaly-detection \
 "
 
@@ -180,7 +172,6 @@ MATRIX_APPS_append_am65xx = "           \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
                                     \
-    ${MATRIX_ARMNN_APPS}            \
     matrix-analytics-pdm-anomaly-detection \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
index b2d7d3c..09264c2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
@@ -5,9 +5,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-ARMNN_PACKAGES = ""
-#ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
-
 TENSORFLOW_DEMO = ""
 #TENSORFLOW_DEMO = " \
 #    ${@oe.utils.all_distro_features(d, 'opencv', 'tensorflow-lite-demo', '')} \
@@ -18,7 +15,6 @@ TENSORFLOW_DEMO = ""
 
 ANALYTICS = ""
 #ANALYTICS = " \
-#    ${ARMNN_PACKAGES} \
 #    ${TENSORFLOW_DEMO} \
 #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
 #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
diff --git a/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend b/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
deleted file mode 100644
index 249ddb7..0000000
--- a/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit features_check
-
-REQUIRED_MACHINE_FEATURES = "dsp"
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
index e8ad27e..f05dd4c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-tidl-demos_2.0.bb
@@ -23,8 +23,6 @@ PACKAGES = "matrix-tidl-demo-staticimg \
             matrix-tidl-demo-objdet \
             matrix-tidl-demo-objdet-livecam \
             matrix-tidl-demo-segment \
-            matrix-armnn-demo-staticimg \
-            matrix-armnn-demo-livecam \
 "
 
 RDEPENDS_matrix-tidl-demo-staticimg = " \
@@ -67,14 +65,6 @@ RDEPENDS_matrix-tidl-demo-segment = " \
     ${TIDLDEMO_RDEPENDS} \
 "
 
-RDEPENDS_matrix-armnn-demo-staticimg = " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
-RDEPENDS_matrix-armnn-demo-livecam = " \
-    ${TIDLDEMO_RDEPENDS} \
-"
-
 FILES_matrix-tidl-demo-staticimg = "${MATRIX_APP_DIR}/tidl_demo_staticimg/*"
 FILES_matrix-tidl-demo-staticimg += "${bindir}/runTidlStaticImg.sh"
 
@@ -104,9 +94,3 @@ FILES_matrix-tidl-demo-objdet-livecam   += "${bindir}/runTidlObjdet_livecam.sh"
 
 FILES_matrix-tidl-demo-segment   = "${MATRIX_APP_DIR}/tidl_demo_segment/*"
 FILES_matrix-tidl-demo-segment   += "${bindir}/runTidlSegment.sh"
-
-FILES_matrix-armnn-demo-staticimg = "${MATRIX_APP_DIR}/armnn_demo_staticimg/*"
-FILES_matrix-armnn-demo-staticimg += "${bindir}/runArmnnStaticImg.sh"
-
-FILES_matrix-armnn-demo-livecam = "${MATRIX_APP_DIR}/armnn_demo_livecam/*"
-FILES_matrix-armnn-demo-livecam += "${bindir}/runArmnnLiveCam.sh"
diff --git a/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
deleted file mode 100644
index a435ed7..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Caffe protobuf files - used in ARMNN for Caffe network models"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://caffeImport/LICENSE;md5=91d560803ea3d191c457b12834553991"
-
-SRC_URI  = "git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
-           "
-
-SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
-
-PV = "1.0"
-
-BRANCH = "master"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-        install -d ${D}${datadir}/${BPN}/caffe/proto/
-        for file in ${S}/caffeImport/ver361/*
-        do
-            install -m 0644 $file ${D}${datadir}/${BPN}/caffe/proto/
-        done
-}
diff --git a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
deleted file mode 100644
index d0f0c70..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Onnx protobuf files - used in ARMNN for Onnx network models"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://onnxImport/LICENSE;md5=077ce3eaeaea91462d41c566300d2a02"
-
-SRC_URI  = "git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
-           "
-
-SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
-
-PV = "1.0"
-
-BRANCH = "master"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-        install -d ${D}${datadir}/${BPN}/onnx/
-        for file in ${S}/onnxImport/ver361/*
-        do
-            install -m 0644 $file ${D}${datadir}/${BPN}/onnx/
-        done
-}
diff --git a/meta-arago-extras/recipes-support/armnn/armnn-tensorflow_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-tensorflow_git.bb
deleted file mode 100644
index 0b0f148..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn-tensorflow_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Tensorflow protobuf files - used in ARMNN for Tensorflow network models"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
-
-SRC_URI = " \
-    git://github.com/tensorflow/tensorflow.git;name=tensorflow; \
-    git://github.com/ARM-software/armnn.git;name=armnn;subdir=${WORKDIR}/armnn;destsuffix=armnn \
-"
-
-PV = "1.10.0"
-
-SRCREV_tensorflow = "aed8f42bafabf11c5d92ce4109a5e0408b31f9c5"
-SRCREV_armnn = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
-SRCREV_FORMAT = "tensorflow"
-
-DEPENDS = "protobuf-native"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    # Install sources + build artifacts as reuired by ARMNN
-    install -d ${D}${datadir}/${BPN}
-
-    # Convert protobuf sources to C sources and install
-    ${WORKDIR}/armnn/scripts/generate_tensorflow_protobuf.sh ${D}${datadir}/${BPN} ${STAGING_DIR_NATIVE}${prefix}
-}
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch b/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
deleted file mode 100644
index cf83532..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3691057b51010c1bd979998c460ad7b43f97496f Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Fri, 10 Aug 2018 11:02:14 -0400
-Subject: [PATCH] stdlib issue work around
-
-Upstream-Status: Pending
-Need to invesitate whether this is appropriate, or if cmake should be
-fixed. This is currently an open issue on the cmake project [1].
-
-[1] https://gitlab.kitware.com/cmake/cmake/issues/16291
-
-Signed-off-by: Qin Su <qsu@ti.com>
----
- cmake/GlobalConfig.cmake | 28 ++++++++++++++++++++++++++++
- 1 file changed, 28 insertions(+)
- mode change 100644 => 100755 cmake/GlobalConfig.cmake
-
-diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
-old mode 100644
-new mode 100755
-index 2dbeada..2b88c16
---- a/cmake/GlobalConfig.cmake
-+++ b/cmake/GlobalConfig.cmake
-@@ -47,6 +47,34 @@ elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL MSVC)
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc /MP")
-     add_definitions(-DNOMINMAX=1 -DNO_STRICT=1)
- endif()
-+
-+# Ensure that the default include system directories are added to the list of CMake implicit includes.
-+# This workarounds an issue that happens when using GCC 6 and using system includes (-isystem).
-+# For more details check: https://bugs.webkit.org/show_bug.cgi?id=161697
-+macro(DETERMINE_GCC_SYSTEM_INCLUDE_DIRS _lang _compiler _flags _result)
-+    file(WRITE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy" "\n")
-+    separate_arguments(_buildFlags UNIX_COMMAND "${_flags}")
-+    execute_process(COMMAND ${_compiler} ${_buildFlags} -v -E -x ${_lang} -dD dummy
-+                    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/CMakeFiles OUTPUT_QUIET
-+                    ERROR_VARIABLE _gccOutput)
-+    file(REMOVE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy")
-+    if ("${_gccOutput}" MATCHES "> search starts here[^\n]+\n *(.+) *\n *End of (search) list")
-+        set(${_result} ${CMAKE_MATCH_1})
-+        string(REPLACE "\n" " " ${_result} "${${_result}}")
-+        separate_arguments(${_result})
-+    endif ()
-+endmacro()
-+
-+if (CMAKE_COMPILER_IS_GNUCC)
-+   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c" "${CMAKE_C_COMPILER}" "${CMAKE_C_FLAGS}" SYSTEM_INCLUDE_DIRS)
-+   set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
-+endif ()
-+
-+if (CMAKE_COMPILER_IS_GNUCXX)
-+   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c++" "${CMAKE_CXX_COMPILER}" "${CMAKE_CXX_FLAGS}" SYSTEM_INCLUDE_DIRS)
-+   set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
-+endif ()
-+
- if("${CMAKE_SYSTEM_NAME}" STREQUAL Android)
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -llog")
-     set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -llog")
---
-1.9.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
deleted file mode 100644
index a436ffd..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b46177bb1a59df0130aba88555ec4f81024669a8 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Tue, 27 Aug 2019 09:40:54 -0400
-Subject: [PATCH] fix boost lib dependency
-
-Upstream-Status: Inappropriate [configuration]
-This is a hack to modify hard coded configuration. If anything, it should be made configurable.     
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- cmake/GlobalConfig.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
-index f518f809..d94c4e50 100755
---- a/cmake/GlobalConfig.cmake
-+++ b/cmake/GlobalConfig.cmake
-@@ -135,8 +135,8 @@ endif()
- set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})
- 
- # Boost
--add_definitions("-DBOOST_ALL_NO_LIB") # Turn off auto-linking as we specify the libs manually
--set(Boost_USE_STATIC_LIBS ON)
-+add_definitions(-DBOOST_ALL_DYN_LINK) # use shared library
-+set(Boost_USE_STATIC_LIBS OFF)
- find_package(Boost 1.59 REQUIRED COMPONENTS unit_test_framework system filesystem log program_options)
- include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
- link_directories(${Boost_LIBRARY_DIRS})
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch b/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
deleted file mode 100644
index 04eb049..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-line-arguments.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 964cb82f3b811aec6663255ab0aa589f0a3be0ee Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Fri, 22 Feb 2019 14:10:07 -0500
-Subject: [PATCH] add more test command line arguments
-
-Upstream-Status: Inappropriate [TI only test code]
-Signed-off-by: Qin Su <qsu@ti.com>
----
- tests/InferenceTest.inl | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 49 insertions(+)
-
-diff --git a/tests/InferenceTest.inl b/tests/InferenceTest.inl
-index 538720b..6fd21b8 100644
---- a/tests/InferenceTest.inl
-+++ b/tests/InferenceTest.inl
-@@ -326,6 +326,55 @@ int ClassifierInferenceTestMain(int argc,
-     BOOST_ASSERT(modelFilename);
-     BOOST_ASSERT(inputBindingName);
-     BOOST_ASSERT(outputBindingName);
-+    int count;
-+    const char *p_input;
-+    char inmodelname[500];
-+    char outtensorname[500];
-+
-+    /* parse command line */
-+    for (count = 1; count < argc; count++)
-+    {
-+        if (*(argv[count]) == '+')
-+        {
-+            p_input = argv[count] + 1;
-+            switch (*(p_input))
-+            {
-+                case 'i':
-+                case 'I':
-+                    strcpy(inmodelname, p_input + 2);
-+                    modelFilename = &inmodelname[0];
-+                    std::cout << "Input model = " << modelFilename << std::endl;
-+                    break;
-+                case 'o':
-+                case 'O':
-+                    strcpy(outtensorname, p_input + 2);
-+                    outputBindingName = &outtensorname[0];
-+                    std::cout << "out tensor name = " << outputBindingName << std::endl;
-+                    break;
-+                default:
-+                    break;
-+            }
-+        }
-+        else if (*(argv[count]) == '-')
-+        {
-+            p_input = argv[count] + 1;
-+            switch (*(p_input))
-+            {
-+                case '-':
-+                    p_input = argv[count] + 2;
-+                case 'h':
-+                case 'H':
-+                    std::cout <<"\nAdditional Options: " << std::endl;
-+                    std::cout <<"  +i                                    Set user specified inference model name." << std::endl;
-+                    std::cout <<"                                        If not set, default name is used." << std::endl;
-+                    std::cout <<"  +o                                    Set user specified output tensor name." << std::endl;
-+                    std::cout <<"                                        If not set, default name is used.\n" << std::endl;
-+                    break;
-+                default:
-+                    break;
-+            }
-+        }
-+    }
- 
-     return InferenceTestMain(argc, argv, defaultTestCaseIds,
-         [=]
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
deleted file mode 100644
index a3c3e21..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 94bec1c47b8da6350c598827950ef4852e998bd9 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Mon, 2 Sep 2019 10:16:21 -0400
-Subject: [PATCH] Generate versioned library
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8bdcd8df..38d1390f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -95,6 +95,7 @@ if(BUILD_CAFFE_PARSER)
- 
-     target_link_libraries(armnnCaffeParser armnn)
-     target_link_libraries(armnnCaffeParser ${PROTOBUF_LIBRARIES})
-+    set_target_properties(armnnCaffeParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- 
- endif()
- 
-@@ -119,6 +120,7 @@ if(BUILD_ONNX_PARSER)
- 
-     # Protobuf
-     target_link_libraries(armnnOnnxParser ${PROTOBUF_LIBRARIES})
-+    set_target_properties(armnnOnnxParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- endif()
- 
- if(BUILD_TF_PARSER)
-@@ -142,6 +144,7 @@ if(BUILD_TF_PARSER)
- 
-     # Protobuf (use the specific version tensorflow wants)
-     target_link_libraries(armnnTfParser ${PROTOBUF_LIBRARIES})
-+    set_target_properties(armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- endif()
- 
- if(BUILD_ARMNN_QUANTIZER AND ARMNNREF)
-@@ -473,6 +476,7 @@ install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- 
- target_link_libraries(armnn ${Boost_LOG_LIBRARY} ${Boost_THREAD_LIBRARY}
-                             ${Boost_SYSTEM_LIBRARY} ${Boost_FILESYSTEM_LIBRARY})
-+set_target_properties(armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- 
- if(ARMCOMPUTENEON OR ARMCOMPUTECL)
-     target_link_libraries(armnn ${ARMCOMPUTE_LIBRARIES})
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
deleted file mode 100644
index edb37fb..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 99a6c339f1828d3cd1b193cf702bada9011d900b Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Mon, 24 Jun 2019 14:29:19 -0400
-Subject: [PATCH] add armnn mobilenet test example
-
-Upstream-Status: Inappropriate [TI only test code]
-Signed-off-by: Qin Su <qsu@ti.com>
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- tests/CMakeLists.txt | 41 +++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 41 insertions(+)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index dfcf4b48..5a78d3a6 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -1,3 +1,6 @@
-+find_package( OpenCV REQUIRED )
-+include_directories( ${OpenCV_INCLUDE_DIRS} )
-+
- # UnitTests
- include(CheckIncludeFiles)
- 
-@@ -348,3 +351,41 @@ if(BUILD_ARMNN_QUANTIZER)
-     add_executable_ex(ImageCSVFileGenerator ${ImageCSVFileGenerator_sources})
-     ImageTensorExecutor(ImageCSVFileGenerator)
- endif()
-+
-+if (BUILD_ARMNN_EXAMPLES)
-+    set(ArmnnExamples_sources
-+        ArmnnExamples/ArmnnExamples.cpp)
-+
-+    add_executable_ex(ArmnnExamples ${ArmnnExamples_sources})
-+
-+    target_include_directories(ArmnnExamples PRIVATE ../src/armnnUtils)
-+    target_include_directories(ArmnnExamples PRIVATE ../src/armnn)
-+    target_include_directories(ArmnnExamples PRIVATE ../src/backends)
-+
-+    if (BUILD_CAFFE_PARSER)
-+        target_link_libraries(ArmnnExamples armnnCaffeParser)
-+    endif()
-+    if (BUILD_TF_PARSER)
-+        target_link_libraries(ArmnnExamples armnnTfParser)
-+    endif()
-+
-+    if (BUILD_TF_LITE_PARSER)
-+        target_link_libraries(ArmnnExamples armnnTfLiteParser)
-+    endif()
-+    if (BUILD_ONNX_PARSER)
-+            target_link_libraries(ArmnnExamples armnnOnnxParser)
-+    endif()
-+
-+    target_link_libraries(ArmnnExamples armnn)
-+    target_link_libraries(ArmnnExamples ${CMAKE_THREAD_LIBS_INIT})
-+    if(OPENCL_LIBRARIES)
-+        target_link_libraries(ArmnnExamples ${OPENCL_LIBRARIES})
-+    endif()
-+
-+    target_link_libraries(ArmnnExamples
-+        ${Boost_SYSTEM_LIBRARY}
-+        ${Boost_FILESYSTEM_LIBRARY}
-+        ${Boost_PROGRAM_OPTIONS_LIBRARY}
-+		${OpenCV_LIBS})
-+    addDllCopyCommands(ArmnnExamples)
-+endif()
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
deleted file mode 100644
index 5498410..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
+++ /dev/null
@@ -1,675 +0,0 @@
-From 4d5e7db268a4f816e24449e8ad011e35890f0c7e Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Fri, 22 Feb 2019 13:39:09 -0500
-Subject: [PATCH] armnn mobilenet test example
-
-Upstream-Status: Inappropriate [TI only test code]
-Signed-off-by: Qin Su <qsu@ti.com>
----
- tests/ArmnnExamples/ArmnnExamples.cpp | 654 ++++++++++++++++++++++++++++++++++
- 1 file changed, 654 insertions(+)
- create mode 100644 tests/ArmnnExamples/ArmnnExamples.cpp
-
-diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
-new file mode 100644
-index 0000000..53a11cc
---- /dev/null
-+++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -0,0 +1,654 @@
-+/******************************************************************************
-+ * Copyright (c) 2018, Texas Instruments Incorporated - http://www.ti.com/
-+ *   All rights reserved.
-+ *
-+ *   Redistribution and use in source and binary forms, with or without
-+ *   modification, are permitted provided that the following conditions are met:
-+ *       * Redistributions of source code must retain the above copyright
-+ *         notice, this list of conditions and the following disclaimer.
-+ *       * Redistributions in binary form must reproduce the above copyright
-+ *         notice, this list of conditions and the following disclaimer in the
-+ *         documentation and/or other materials provided with the distribution.
-+ *       * Neither the name of Texas Instruments Incorporated nor the
-+ *         names of its contributors may be used to endorse or promote products
-+ *         derived from this software without specific prior written permission.
-+ *
-+ *   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-+ *   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-+ *   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-+ *   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
-+ *   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-+ *   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-+ *   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-+ *   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-+ *   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-+ *   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
-+ *   THE POSSIBILITY OF SUCH DAMAGE.
-+ *****************************************************************************///
-+// Copyright © 2017 Arm Ltd. All rights reserved.
-+// See LICENSE file in the project root for full license information.
-+//
-+#include <armnn/ArmNN.hpp>
-+
-+#include <utility>
-+#include <armnn/TypesUtils.hpp>
-+
-+#if defined(ARMNN_CAFFE_PARSER)
-+#include "armnnCaffeParser/ICaffeParser.hpp"
-+#endif
-+#if defined(ARMNN_TF_PARSER)
-+#include "armnnTfParser/ITfParser.hpp"
-+#endif
-+#if defined(ARMNN_TF_LITE_PARSER)
-+#include "armnnTfLiteParser/ITfLiteParser.hpp"
-+#endif
-+#if defined(ARMNN_ONNX_PARSER)
-+#include "armnnOnnxParser/IOnnxParser.hpp"
-+#endif
-+#include "CsvReader.hpp"
-+#include "../InferenceTest.hpp"
-+#include <Logging.hpp>
-+#include <Profiling.hpp>
-+
-+#include <boost/algorithm/string/trim.hpp>
-+#include <boost/algorithm/string/split.hpp>
-+#include <boost/algorithm/string/classification.hpp>
-+#include <boost/program_options.hpp>
-+
-+#include <iostream>
-+#include <fstream>
-+#include <functional>
-+#include <future>
-+#include <algorithm>
-+#include <iterator>
-+#include<vector>
-+
-+#include <signal.h>
-+#include "opencv2/core.hpp"
-+#include "opencv2/imgproc.hpp"
-+#include "opencv2/highgui.hpp"
-+#include "opencv2/videoio.hpp"
-+#include <time.h>
-+
-+using namespace cv;
-+
-+#define INPUT_IMAGE  0
-+#define INPUT_VIDEO  1
-+#define INPUT_CAMERA 2
-+
-+Mat test_image;
-+Rect rectCrop;
-+
-+time_point<high_resolution_clock> predictStart;
-+time_point<high_resolution_clock> predictEnd;
-+
-+void imagenetCallBackFunc(int event, int x, int y, int flags, void* userdata)
-+{
-+  if  ( event == EVENT_RBUTTONDOWN )
-+  {
-+    std::cout << "Right button of the mouse is clicked - position (" << x << ", " << y << ")" << " ... prepare to exit!" << std::endl;
-+    exit(0);
-+  }
-+}
-+
-+inline float Lerpfloat(float a, float b, float w)
-+{
-+  return w * b + (1.f - w) * a;
-+}
-+
-+// Load a single image
-+struct ImageData
-+{
-+  unsigned int m_width;
-+  unsigned int m_height;
-+  unsigned int m_chnum;
-+  unsigned int m_size;
-+  std::vector<uint8_t> m_image;
-+};
-+// Load a single image
-+std::unique_ptr<ImageData> loadImageData(std::string image_path, VideoCapture &cap, cv::Mat img, int input_type)
-+{
-+  //cv::Mat img;
-+  if (input_type == INPUT_IMAGE)
-+  {
-+    /* use OpenCV to get the image */
-+    img = cv::imread(image_path, CV_LOAD_IMAGE_COLOR);
-+  }
-+  cv::cvtColor(img, img, CV_BGR2RGB); //convert image format from BGR(openCV format) to RGB (armnn required format).
-+
-+  // store image and label in output Image
-+  std::unique_ptr<ImageData> ret(new ImageData);
-+  ret->m_width = static_cast<unsigned int>(img.cols);
-+  ret->m_height = static_cast<unsigned int>(img.rows);
-+  ret->m_chnum = static_cast<unsigned int>(img.channels());
-+  ret->m_size = static_cast<unsigned int>(img.cols*img.rows*img.channels());
-+  ret->m_image.resize(ret->m_size);
-+
-+  for (unsigned int i = 0; i < ret->m_size; i++)
-+  {
-+    ret->m_image[i] = static_cast<uint8_t>(img.data[i]);
-+  }
-+  return ret;
-+}
-+// to resize input tensor size
-+std::vector<float> ResizeBilinear(std::vector<uint8_t> input,
-+                                    const unsigned int inWidth,
-+                                    const unsigned int inHeight,
-+                                    const unsigned int inChnum,
-+                                    const unsigned int outputWidth,
-+                                    const unsigned int outputHeight)
-+{
-+  std::vector<float> out;
-+  out.resize(outputWidth * outputHeight * 3);
-+
-+  // We follow the definition of TensorFlow and AndroidNN: the top-left corner of a texel in the output
-+  // image is projected into the input image to figure out the interpolants and weights. Note that this
-+  // will yield different results than if projecting the centre of output texels.
-+
-+  const unsigned int inputWidth = inWidth;
-+  const unsigned int inputHeight = inHeight;
-+
-+  // How much to scale pixel coordinates in the output image to get the corresponding pixel coordinates
-+  // in the input image.
-+  const float scaleY = boost::numeric_cast<float>(inputHeight) / boost::numeric_cast<float>(outputHeight);
-+  const float scaleX = boost::numeric_cast<float>(inputWidth) / boost::numeric_cast<float>(outputWidth);
-+
-+  uint8_t rgb_x0y0[3];
-+  uint8_t rgb_x1y0[3];
-+  uint8_t rgb_x0y1[3];
-+  uint8_t rgb_x1y1[3];
-+  unsigned int pixelOffset00, pixelOffset10, pixelOffset01, pixelOffset11;
-+  for (unsigned int y = 0; y < outputHeight; ++y)
-+  {
-+    // Corresponding real-valued height coordinate in input image.
-+    const float iy = boost::numeric_cast<float>(y) * scaleY;
-+    // Discrete height coordinate of top-left texel (in the 2x2 texel area used for interpolation).
-+    const float fiy = floorf(iy);
-+    const unsigned int y0 = boost::numeric_cast<unsigned int>(fiy);
-+
-+    // Interpolation weight (range [0,1])
-+    const float yw = iy - fiy;
-+
-+    for (unsigned int x = 0; x < outputWidth; ++x)
-+    {
-+      // Real-valued and discrete width coordinates in input image.
-+      const float ix = boost::numeric_cast<float>(x) * scaleX;
-+      const float fix = floorf(ix);
-+      const unsigned int x0 = boost::numeric_cast<unsigned int>(fix);
-+
-+      // Interpolation weight (range [0,1]).
-+      const float xw = ix - fix;
-+
-+      // Discrete width/height coordinates of texels below and to the right of (x0, y0).
-+      const unsigned int x1 = std::min(x0 + 1, inputWidth - 1u);
-+      const unsigned int y1 = std::min(y0 + 1, inputHeight - 1u);
-+
-+      pixelOffset00 = x0 * inChnum + y0 * inputWidth * inChnum;
-+      pixelOffset10 = x1 * inChnum + y0 * inputWidth * inChnum;
-+      pixelOffset01 = x0 * inChnum + y1 * inputWidth * inChnum;
-+      pixelOffset11 = x1 * inChnum + y1 * inputWidth * inChnum;
-+      for (unsigned int c = 0; c < 3; ++c)
-+      {
-+        rgb_x0y0[c] = input[pixelOffset00+c];
-+        rgb_x1y0[c] = input[pixelOffset10+c];
-+        rgb_x0y1[c] = input[pixelOffset01+c];
-+        rgb_x1y1[c] = input[pixelOffset11+c];
-+      }
-+
-+      for (unsigned c=0; c<3; ++c)
-+      {
-+        const float ly0 = Lerpfloat(float(rgb_x0y0[c]), float(rgb_x1y0[c]), xw);
-+        const float ly1 = Lerpfloat(float(rgb_x0y1[c]), float(rgb_x1y1[c]), xw);
-+        const float l = Lerpfloat(ly0, ly1, yw);
-+        out[(3*((y*outputWidth)+x)) + c] = static_cast<float>(l)/255.0f;
-+      }
-+    }
-+  }
-+  return out;
-+}
-+
-+namespace
-+{
-+
-+  // Configure boost::program_options for command-line parsing and validation.
-+  namespace po = boost::program_options;
-+
-+  template<typename T, typename TParseElementFunc>
-+  std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
-+  {
-+    std::vector<T> result;
-+    // Processes line-by-line.
-+    std::string line;
-+    while (std::getline(stream, line))
-+    {
-+      std::vector<std::string> tokens;
-+      try
-+      {
-+        // Coverity fix: boost::split() may throw an exception of type boost::bad_function_call.
-+        boost::split(tokens, line, boost::algorithm::is_any_of("\t ,;:"), boost::token_compress_on);
-+      }
-+      catch (const std::exception& e)
-+      {
-+        BOOST_LOG_TRIVIAL(error) << "An error occurred when splitting tokens: " << e.what();
-+        continue;
-+      }
-+      for (const std::string& token : tokens)
-+      {
-+        if (!token.empty())
-+        {
-+          try
-+          {
-+            result.push_back(parseElementFunc(token));
-+          }
-+          catch (const std::exception&)
-+          {
-+            BOOST_LOG_TRIVIAL(error) << "'" << token << "' is not a valid number. It has been ignored.";
-+          }
-+        }
-+      }
-+    }
-+
-+    return result;
-+  }
-+
-+  template<typename T>
-+  std::vector<T> ParseArray(std::istream& stream);
-+  template<>
-+  std::vector<unsigned int> ParseArray(std::istream& stream)
-+  {
-+    return ParseArrayImpl<unsigned int>(stream,
-+      [](const std::string& s) { return boost::numeric_cast<unsigned int>(std::stoi(s)); });
-+  }
-+  void RemoveDuplicateDevices(std::vector<armnn::BackendId>& computeDevices)
-+  {
-+    // Mark the duplicate devices as 'Undefined'.
-+    for (auto i = computeDevices.begin(); i != computeDevices.end(); ++i)
-+    {
-+      for (auto j = std::next(i); j != computeDevices.end(); ++j)
-+      {
-+        if (*j == *i)
-+        {
-+          *j = armnn::Compute::Undefined;
-+        }
-+      }
-+    }
-+
-+    // Remove 'Undefined' devices.
-+    computeDevices.erase(std::remove(computeDevices.begin(), computeDevices.end(), armnn::Compute::Undefined),
-+    computeDevices.end());
-+  }
-+} // namespace
-+
-+template<typename TParser, typename TDataType>
-+int MainImpl(const char* modelPath,
-+             bool isModelBinary,
-+             const std::vector<armnn::BackendId>& computeDevices,
-+             const char* inputName,
-+             const armnn::TensorShape* inputTensorShape,
-+             const char* inputTensorDataFilePath,
-+             const char* outputName,
-+             bool enableProfiling,
-+             const size_t number_frame,
-+             const std::shared_ptr<armnn::IRuntime>& runtime = nullptr)
-+{
-+  // Loads input tensor.
-+  std::vector<uint8_t> input;
-+  std::vector<float> input_resized;
-+  using TContainer = boost::variant<std::vector<float>, std::vector<int>, std::vector<unsigned char>>;
-+
-+  try
-+  {
-+    // Creates an InferenceModel, which will parse the model and load it into an IRuntime.
-+    typename InferenceModel<TParser, TDataType>::Params params;
-+    //const armnn::TensorShape inputTensorShape({ 1, 224, 224 3});
-+
-+    params.m_ModelPath = modelPath;
-+    params.m_IsModelBinary = isModelBinary;
-+    params.m_ComputeDevices = computeDevices;
-+    params.m_InputBindings = { inputName };
-+    params.m_InputShapes = { *inputTensorShape };
-+    params.m_OutputBindings = { outputName };
-+    //params.m_EnableProfiling = enableProfiling;
-+    params.m_SubgraphId = 0;
-+    InferenceModel<TParser, TDataType> model(params, enableProfiling, runtime);
-+
-+    VideoCapture cap;
-+    int input_type = INPUT_IMAGE;
-+    std::string filename = inputTensorDataFilePath;
-+
-+    size_t i = filename.rfind("camera_live_input", filename.length());
-+    if (i != string::npos)
-+    {
-+      cap = VideoCapture(1);
-+      namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
-+      input_type = INPUT_CAMERA; //camera input
-+    }
-+    else if((filename.substr(filename.find_last_of(".") + 1) == "mp4") ||
-+            (filename.substr(filename.find_last_of(".") + 1) == "mov") ||
-+            (filename.substr(filename.find_last_of(".") + 1) == "avi") )
-+    {
-+      cap = VideoCapture(inputTensorDataFilePath);
-+      if (! cap.isOpened())
-+      {
-+        std::cout << "Cannot open video input: " << inputTensorDataFilePath << std::endl;
-+        return (-1);
-+      }
-+
-+      namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
-+      input_type = INPUT_VIDEO; //video clip input
-+    }
-+    if (input_type != INPUT_IMAGE)
-+    {
-+      //set the callback function for any mouse event. Used for right click mouse to exit the program.
-+      setMouseCallback("ARMNN MobileNet Example", imagenetCallBackFunc, NULL);
-+    }
-+
-+    for (unsigned int i=0; i < number_frame; i++)
-+    {
-+      if (input_type != INPUT_IMAGE)
-+      {
-+        cap.grab();
-+        cap.retrieve(test_image);
-+      }
-+      std::unique_ptr<ImageData> inputData = loadImageData(inputTensorDataFilePath, cap, test_image, input_type);
-+      input.resize(inputData->m_size);
-+
-+      input = std::move(inputData->m_image);
-+      input_resized = ResizeBilinear(input, inputData->m_width, inputData->m_height, inputData->m_chnum, 224, 224);
-+	
-+      // Set up input data container
-+      std::vector<TContainer> inputDataContainer(1, std::move(input_resized));
-+      	
-+      // Set up output data container
-+	  std::vector<TContainer> outputDataContainers;
-+      outputDataContainers.push_back(std::vector<float>(model.GetOutputSize()));
-+ 
-+      //profile start
-+      predictStart = high_resolution_clock::now();
-+      // Execute model
-+      model.Run(inputDataContainer, outputDataContainers);
-+      //profile end
-+      predictEnd = high_resolution_clock::now();
-+
-+      double timeTakenS = duration<double>(predictEnd - predictStart).count();
-+      double preformance_ret = static_cast<double>(1.0/timeTakenS);
-+
-+      //retrieve output
-+      std::vector<float>& outputData = (boost::get<std::vector<float>>(outputDataContainers[0]));
-+	  //output TOP predictions
-+      std::string predict_target_name;
-+      // find the out with the highest confidence
-+      int label = static_cast<int>(std::distance(outputData.begin(), std::max_element(outputData.begin(), outputData.end())));
-+      std::fstream file("/usr/share/arm/armnn/models/labels.txt");
-+      //std::string predict_target_name;
-+      for (int i=0; i <= label; i++)
-+      {
-+        std::getline(file, predict_target_name);
-+      }
-+      //get the probability of the top prediction
-+	  float prob = 100*outputData.data()[label];
-+	  //clean the top one so as to find the second top prediction
-+      outputData.data()[label] = 0;
-+      std::cout << "Top(1) prediction is " << predict_target_name << " with confidence: " << prob << "%" << std::endl;
-+	  //output next TOP 4 predictions
-+      for (int ii=1; ii<5; ii++)
-+      {
-+        std::string predict_target_name_n;
-+        // find the out with the highest confidence
-+        int label = static_cast<int>(std::distance(outputData.begin(), std::max_element(outputData.begin(), outputData.end())));
-+        std::fstream file("/usr/share/arm/armnn/models/labels.txt");
-+        //std::string predict_target_name;
-+        for (int i=0; i <= label; i++)
-+        {
-+          std::getline(file, predict_target_name_n);
-+        }
-+        //get the probability of the prediction
-+	    float prob = 100*outputData.data()[label];
-+		//clean the top one so as to find the second top prediction
-+        outputData.data()[label] = 0;
-+
-+        std::cout << "Top(" << (ii+1) << ") prediction is " << predict_target_name_n << " with confidence:  " << prob << "%" << std::endl;
-+      }
-+      std::cout << "Performance (FPS): " << preformance_ret << std::endl;
-+
-+      if (input_type != INPUT_IMAGE)
-+      {
-+        //convert image format back to BGR for OpenCV imshow from RGB format required by armnn.
-+        cv::cvtColor(test_image, test_image, CV_RGB2BGR);
-+        // output identified object name on top of input image
-+        cv::putText(test_image, predict_target_name,
-+                    cv::Point(rectCrop.x + 5,rectCrop.y + 20), // Coordinates
-+                    cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
-+                    1.0, // Scale. 2.0 = 2x bigger
-+                    cv::Scalar(0,0,255), // Color
-+                    1, // Thickness
-+                    8); // Line type
-+
-+        // output preformance in FPS on top of input image
-+        std::string preformance_ret_string = "Performance (FPS): " + boost::lexical_cast<std::string>(preformance_ret);				
-+        cv::putText(test_image, preformance_ret_string,
-+                    cv::Point(rectCrop.x + 5,rectCrop.y + 40), // Coordinates
-+                    cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
-+                    1.0, // Scale. 2.0 = 2x bigger
-+                    cv::Scalar(0,0,255), // Color
-+                    1, // Thickness
-+                    8); // Line type
-+
-+        cv::imshow("ARMNN MobileNet Example", test_image);
-+        waitKey(2);
-+      }
-+    }
-+  }
-+  catch (armnn::Exception const& e)
-+  {
-+    BOOST_LOG_TRIVIAL(fatal) << "Armnn Error: " << e.what();
-+    return EXIT_FAILURE;
-+  }
-+  return EXIT_SUCCESS;
-+}
-+
-+// This will run a test
-+int RunTest(const std::string& modelFormat,
-+            const std::string& inputTensorShapeStr,
-+            const vector<armnn::BackendId>& computeDevice,
-+            const std::string& modelPath,
-+            const std::string& inputName,
-+            const std::string& inputTensorDataFilePath,
-+            const std::string& outputName,
-+            bool enableProfiling,
-+            const size_t subgraphId,
-+            const std::shared_ptr<armnn::IRuntime>& runtime = nullptr)
-+{
-+  // Parse model binary flag from the model-format string we got from the command-line
-+  bool isModelBinary;
-+  if (modelFormat.find("bin") != std::string::npos)
-+  {
-+    isModelBinary = true;
-+  }
-+  else if (modelFormat.find("txt") != std::string::npos || modelFormat.find("text") != std::string::npos)
-+  {
-+    isModelBinary = false;
-+  }
-+  else
-+  {
-+    BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Please include 'binary' or 'text'";
-+    return EXIT_FAILURE;
-+  }
-+
-+  // Parse input tensor shape from the string we got from the command-line.
-+  std::unique_ptr<armnn::TensorShape> inputTensorShape;
-+  if (!inputTensorShapeStr.empty())
-+  {
-+    std::stringstream ss(inputTensorShapeStr);
-+    std::vector<unsigned int> dims = ParseArray<unsigned int>(ss);
-+    try
-+    {
-+      // Coverity fix: An exception of type armnn::InvalidArgumentException is thrown and never caught.
-+      inputTensorShape = std::make_unique<armnn::TensorShape>(dims.size(), dims.data());
-+    }
-+    catch (const armnn::InvalidArgumentException& e)
-+    {
-+      BOOST_LOG_TRIVIAL(fatal) << "Cannot create tensor shape: " << e.what();
-+      return EXIT_FAILURE;
-+    }
-+  }
-+  // Forward to implementation based on the parser type
-+  if (modelFormat.find("caffe") != std::string::npos)
-+  {
-+#if defined(ARMNN_CAFFE_PARSER)
-+    return MainImpl<armnnCaffeParser::ICaffeParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                           inputName.c_str(), inputTensorShape.get(),
-+                                                           inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                           enableProfiling, subgraphId, runtime);
-+#else
-+    BOOST_LOG_TRIVIAL(fatal) << "Not built with Caffe parser support.";
-+    return EXIT_FAILURE;
-+#endif
-+  }
-+  else if (modelFormat.find("onnx") != std::string::npos)
-+  {
-+#if defined(ARMNN_ONNX_PARSER)
-+    return MainImpl<armnnOnnxParser::IOnnxParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                         inputName.c_str(), inputTensorShape.get(),
-+                                                         inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                         enableProfiling, subgraphId, runtime);
-+#else
-+    BOOST_LOG_TRIVIAL(fatal) << "Not built with Onnx parser support.";
-+    return EXIT_FAILURE;
-+#endif
-+  }
-+  else if (modelFormat.find("tensorflow") != std::string::npos)
-+  {
-+#if defined(ARMNN_TF_PARSER)
-+    return MainImpl<armnnTfParser::ITfParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                     inputName.c_str(), inputTensorShape.get(),
-+                                                     inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                     enableProfiling, subgraphId, runtime);
-+#else
-+    BOOST_LOG_TRIVIAL(fatal) << "Not built with Tensorflow parser support.";
-+    return EXIT_FAILURE;
-+#endif
-+  }
-+  else if(modelFormat.find("tflite") != std::string::npos)
-+  {
-+#if defined(ARMNN_TF_LITE_PARSER)
-+    if (! isModelBinary)
-+    {
-+      BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Only 'binary' format supported \
-+             for tflite files";
-+      return EXIT_FAILURE;
-+    }
-+    return MainImpl<armnnTfLiteParser::ITfLiteParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
-+                                                             inputName.c_str(), inputTensorShape.get(),
-+                                                             inputTensorDataFilePath.c_str(), outputName.c_str(),
-+                                                             enableProfiling, subgraphId, runtime);
-+#else
-+    BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
-+            "'. Please include 'caffe', 'tensorflow', 'tflite' or 'onnx'";
-+    return EXIT_FAILURE;
-+#endif
-+  }
-+  else
-+  {
-+    BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
-+                                 "'. Please include 'caffe', 'tensorflow', 'tflite' or 'onnx'";
-+    return EXIT_FAILURE;
-+  }
-+}
-+
-+int main(int argc, const char* argv[])
-+{
-+    // Configures logging for both the ARMNN library and this test program.
-+#ifdef NDEBUG
-+  armnn::LogSeverity level = armnn::LogSeverity::Info;
-+#else
-+  armnn::LogSeverity level = armnn::LogSeverity::Debug;
-+#endif
-+  armnn::ConfigureLogging(true, true, level);
-+  armnnUtils::ConfigureLogging(boost::log::core::get().get(), true, true, level);
-+
-+  std::string testCasesFile;
-+
-+  std::string modelFormat = "tensorflow-binary";
-+  std::string modelPath = "/usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb";
-+  std::string inputName = "input";
-+  std::string inputTensorShapeStr = "1 224 224 3";
-+  std::string inputTensorDataFilePath = "/usr/share/arm/armnn/testvecs/test2.mp4";
-+  std::string outputName = "MobilenetV1/Predictions/Reshape_1";
-+  std::vector<armnn::BackendId> computeDevices = {armnn::Compute::CpuAcc};
-+  // Catch ctrl-c to ensure a clean exit
-+  signal(SIGABRT, exit);
-+  signal(SIGTERM, exit);
-+
-+  if (argc == 1)
-+  {
-+	return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
-+                       modelPath, inputName, inputTensorDataFilePath, outputName, false, 1000);
-+  }
-+  else
-+  {
-+    size_t subgraphId = 0;
-+    po::options_description desc("Options");
-+    try
-+    {
-+      desc.add_options()
-+      ("help", "Display usage information")
-+      ("test-cases,t", po::value(&testCasesFile), "Path to a CSV file containing test cases to run. "
-+       "If set, further parameters -- with the exception of compute device and concurrency -- will be ignored, "
-+       "as they are expected to be defined in the file for each test in particular.")
-+      ("concurrent,n", po::bool_switch()->default_value(false),
-+       "Whether or not the test cases should be executed in parallel")
-+      ("model-format,f", po::value(&modelFormat),
-+       "caffe-binary, caffe-text, onnx-binary, onnx-text, tflite-binary, tensorflow-binary or tensorflow-text.")
-+      ("model-path,m", po::value(&modelPath), "Path to model file, e.g. .caffemodel, .prototxt,"
-+       " .tflite, .onnx")
-+      ("compute,c", po::value<std::vector<armnn::BackendId>>()->multitoken(),
-+       "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
-+      ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network.")
-+      ("input-tensor-shape,s", po::value(&inputTensorShapeStr),
-+       "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
-+       "This parameter is optional, depending on the network.")
-+      ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
-+       "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
-+      ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
-+      ("event-based-profiling,e", po::bool_switch()->default_value(false),
-+       "Enables built in profiler. If unset, defaults to off.")
-+      ("number_frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process.");
-+    }
-+    catch (const std::exception& e)
-+    {
-+      // Coverity points out that default_value(...) can throw a bad_lexical_cast,
-+      // and that desc.add_options() can throw boost::io::too_few_args.
-+      // They really won't in any of these cases.
-+      BOOST_ASSERT_MSG(false, "Caught unexpected exception");
-+      BOOST_LOG_TRIVIAL(fatal) << "Fatal internal error: " << e.what();
-+      return EXIT_FAILURE;
-+    }
-+
-+    // Parses the command-line.
-+    po::variables_map vm;
-+    try
-+    {
-+      po::store(po::parse_command_line(argc, argv, desc), vm);
-+      po::notify(vm);
-+    }
-+    catch (const po::error& e)
-+    {
-+      std::cerr << e.what() << std::endl << std::endl;
-+      std::cerr << desc << std::endl;
-+      return EXIT_FAILURE;
-+    }
-+
-+    // Run single test
-+    // Get the preferred order of compute devices.
-+    std::vector<armnn::BackendId> computeDevices = vm["compute"].as<std::vector<armnn::BackendId>>();
-+	bool enableProfiling = vm["event-based-profiling"].as<bool>();
-+
-+    // Remove duplicates from the list of compute devices.
-+    RemoveDuplicateDevices(computeDevices);
-+
-+    return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
-+                   modelPath, inputName, inputTensorDataFilePath, outputName, enableProfiling, subgraphId);
-+  }
-+}
-+
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0007-enable-use-of-arm-compute-shared-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0007-enable-use-of-arm-compute-shared-library.patch
deleted file mode 100644
index 7d0d7e5..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0007-enable-use-of-arm-compute-shared-library.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 38e8e4bc03a4c1ee801f6af50be94ccd971bf3eb Mon Sep 17 00:00:00 2001
-From: Qin Su <qsu@ti.com>
-Date: Tue, 27 Nov 2018 18:15:49 -0500
-Subject: [PATCH] enable use of arm compute shared library
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Qin Su <qsu@ti.com>
----
- cmake/GlobalConfig.cmake | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
-index 491d87a..4cf40a2 100644
---- a/cmake/GlobalConfig.cmake
-+++ b/cmake/GlobalConfig.cmake
-@@ -285,6 +285,11 @@ if(ARMCOMPUTENEON OR ARMCOMPUTECL)
-         find_library(ARMCOMPUTE_CORE_LIBRARY_DEBUG NAMES arm_compute_core-static)
-         find_library(ARMCOMPUTE_CORE_LIBRARY_RELEASE NAMES arm_compute_core-static)
- 
-+        find_library(ARMCOMPUTE_LIBRARY_DEBUG NAMES arm_compute)
-+        find_library(ARMCOMPUTE_LIBRARY_RELEASE NAMES arm_compute)
-+        find_library(ARMCOMPUTE_CORE_LIBRARY_DEBUG NAMES arm_compute_core)
-+        find_library(ARMCOMPUTE_CORE_LIBRARY_RELEASE NAMES arm_compute_core)
-+
-         set(ARMCOMPUTE_LIBRARIES
-             debug ${ARMCOMPUTE_LIBRARY_DEBUG} ${ARMCOMPUTE_CORE_LIBRARY_DEBUG}
-             optimized ${ARMCOMPUTE_LIBRARY_RELEASE} ${ARMCOMPUTE_CORE_LIBRARY_RELEASE} )
--- 
-1.9.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
deleted file mode 100644
index 023766a..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4f5d63b026f225f6499e0a401d9b2769e8ef0a80 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Wed, 12 Jun 2019 13:12:09 -0400
-Subject: [PATCH] Avoid stringop-overflow warning resulting in compilation
- error
-
-Upstream-Status: Inappropriate [TI only test code]
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- src/armnn/LayerSupport.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/armnn/LayerSupport.cpp b/src/armnn/LayerSupport.cpp
-index 12b3c403..09c973e5 100644
---- a/src/armnn/LayerSupport.cpp
-+++ b/src/armnn/LayerSupport.cpp
-@@ -25,6 +25,8 @@ void CopyErrorMessage(char* truncatedString, const char* fullString, size_t maxL
-     if(truncatedString != nullptr)
-     {
-         size_t copyLength = std::min(maxLength, strlen(fullString));
-+        if(copyLength > 255) copyLength = 255; //Put source length independent upper bound
-+       
-         std::strncpy(truncatedString, fullString, copyLength);
-         // Ensure null-terminated string.
-         truncatedString[copyLength] = '\0';
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch b/meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch
deleted file mode 100644
index d0485a8..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From ee152f3b68f91c5fff336306d011becdcf3a6b17 Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Sat, 24 Aug 2019 17:58:38 -0400
-Subject: [PATCH] command line options for video port selection
-
-- Add command line selection <0|1|2|3> of video port used for live camera input 
-
-Upstream-Status: Inappropriate [TI only test code]
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- tests/ArmnnExamples/ArmnnExamples.cpp | 23 ++++++++++++++++++++---
- 1 file changed, 20 insertions(+), 3 deletions(-)
-
-diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
-index 638fc145..d1526539 100644
---- a/tests/ArmnnExamples/ArmnnExamples.cpp
-+++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -316,10 +316,27 @@ int MainImpl(const char* modelPath,
-     int input_type = INPUT_IMAGE;
-     std::string filename = inputTensorDataFilePath;
- 
--    size_t i = filename.rfind("camera_live_input", filename.length());
-+    size_t i  = filename.rfind("camera_live_input", filename.length());
-     if (i != string::npos)
-     {
--      cap = VideoCapture(1);
-+      int vport = 1;
-+      size_t loc_i = filename.rfind("camera_live_input0", filename.length());
-+      if(loc_i != string::npos) vport = 0;
-+      else {
-+         loc_i = filename.rfind("camera_live_input1", filename.length());
-+         if(loc_i != string::npos) vport = 1;
-+         else {
-+           loc_i = filename.rfind("camera_live_input2", filename.length());
-+           if(loc_i != string::npos) vport = 2;
-+           else {
-+             loc_i = filename.rfind("camera_live_input3", filename.length());
-+             if(loc_i != string::npos) vport = 3;
-+             else std::cout << "Setting ports beyond 3 not supported - using default!" << std::endl;
-+           }
-+         }
-+      }
-+      std::cout << "Using video" << vport << std::endl;
-+      cap = VideoCapture(vport);
-       namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
-       input_type = INPUT_CAMERA; //camera input
-     }
-@@ -609,7 +626,7 @@ int main(int argc, const char* argv[])
-        "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
-        "This parameter is optional, depending on the network.")
-       ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
--       "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
-+       "Input test file name. It can be image/video clip file name or 'camera_live_input or camera_live_input<0|1|2|3>' to select camera input.")
-       ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
-       ("event-based-profiling,e", po::bool_switch()->default_value(false),
-        "Enables built in profiler. If unset, defaults to off.")
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch b/meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch
deleted file mode 100644
index f75b1dc..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0010-armnnexamples-update-for-19.08-modifications.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a3e266a2de7c45116428f4e21645a2657534191b Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Mon, 26 Aug 2019 03:51:39 -0400
-Subject: [PATCH] armnnexamples: update for 19.08 modifications
-
-Upstream-Status: Inappropriate [TI only test code]
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- tests/ArmnnExamples/ArmnnExamples.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
-index d1526539..c10a4fc0 100644
---- a/tests/ArmnnExamples/ArmnnExamples.cpp
-+++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -310,7 +310,7 @@ int MainImpl(const char* modelPath,
-     params.m_OutputBindings = { outputName };
-     //params.m_EnableProfiling = enableProfiling;
-     params.m_SubgraphId = 0;
--    InferenceModel<TParser, TDataType> model(params, enableProfiling, runtime);
-+    InferenceModel<TParser, TDataType> model(params, enableProfiling, "", runtime);
- 
-     VideoCapture cap;
-     int input_type = INPUT_IMAGE;
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch b/meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
deleted file mode 100644
index a504aa7..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 1f5670c6ef8669d7d25621d9c97d66178800dcf9 Mon Sep 17 00:00:00 2001
-From: Hongmei Gou <a0271529@ti.com>
-Date: Tue, 17 Sep 2019 17:58:39 -0400
-Subject: [PATCH] Generate versioned library for armnnTfLiteParser
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Hongmei Gou <a0271529@ti.com>
----
- src/armnnTfLiteParser/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/armnnTfLiteParser/CMakeLists.txt b/src/armnnTfLiteParser/CMakeLists.txt
-index 17d4cf68..c83f7059 100755
---- a/src/armnnTfLiteParser/CMakeLists.txt
-+++ b/src/armnnTfLiteParser/CMakeLists.txt
-@@ -24,4 +24,5 @@ if(BUILD_TF_LITE_PARSER)
-     install(TARGETS armnnTfLiteParser
-             LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-             RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
-+    set_target_properties(armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
- endif()
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch b/meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch
deleted file mode 100644
index bdd1312..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 707ba3cba21c86d09cbb5f67ede565054b8c904d Mon Sep 17 00:00:00 2001
-From: Djordje Senicic <x0157990@ti.com>
-Date: Mon, 2 Dec 2019 16:56:27 -0500
-Subject: [PATCH] ArmnnExample: Fix exception for --help command line option
-
-Signed-off-by: Djordje Senicic <x0157990@ti.com>
----
- tests/ArmnnExamples/ArmnnExamples.cpp | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
-index c10a4fc0..660106c0 100644
---- a/tests/ArmnnExamples/ArmnnExamples.cpp
-+++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -213,6 +213,18 @@ namespace
-   // Configure boost::program_options for command-line parsing and validation.
-   namespace po = boost::program_options;
- 
-+  bool CheckOption(const po::variables_map& vm, const char* option)
-+  {
-+    // Check that the given option is valid.
-+    if (option == nullptr)
-+    {
-+        return false;
-+    }
-+
-+    // Check whether 'option' is provided.
-+    return vm.find(option) != vm.end();
-+  }
-+
-   template<typename T, typename TParseElementFunc>
-   std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
-   {
-@@ -647,6 +659,14 @@ int main(int argc, const char* argv[])
-     try
-     {
-       po::store(po::parse_command_line(argc, argv, desc), vm);
-+      if (CheckOption(vm, "help") || argc <= 1)
-+      {
-+            std::cout << "Executes a neural network model using the provided video clip, or input camera stream. " << std::endl;
-+            std::cout << "Runs many consecutive inferences and shows classification labels on display, in real-time." << std::endl;
-+            std::cout << std::endl;
-+            std::cout << desc << std::endl;
-+            return EXIT_SUCCESS;
-+      }
-       po::notify(vm);
-     }
-     catch (const po::error& e)
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch b/meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch
deleted file mode 100644
index bce697d..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From dc175c00a317cdd693772f7dbf9de6ddeef46f19 Mon Sep 17 00:00:00 2001
-From: Hongmei Gou <a0271529@ti.com>
-Date: Tue, 10 Dec 2019 13:07:26 -0500
-Subject: [PATCH] ArmnnExample: setting capture resolution for the camera input
-
-Upstream-Status: Inappropriate [TI only example code]
-
-Signed-off-by: Hongmei Gou <a0271529@ti.com>
----
- tests/ArmnnExamples/ArmnnExamples.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
-index 1bd76a47..7fdaa167 100644
---- a/tests/ArmnnExamples/ArmnnExamples.cpp
-+++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -349,6 +349,10 @@ int MainImpl(const char* modelPath,
-       }
-       std::cout << "Using video" << vport << std::endl;
-       cap = VideoCapture(vport);
-+      // Setting the capture resolution
-+      cap.set(CV_CAP_PROP_FRAME_WIDTH, 352);
-+      cap.set(CV_CAP_PROP_FRAME_HEIGHT, 288);
-+
-       namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
-       input_type = INPUT_CAMERA; //camera input
-     }
-@@ -452,7 +452,7 @@ int MainImpl(const char* modelPath,
-         cv::putText(test_image, predict_target_name,
-                     cv::Point(rectCrop.x + 5,rectCrop.y + 20), // Coordinates
-                     cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
--                    1.0, // Scale. 2.0 = 2x bigger
-+                    0.75, // Scale. 2.0 = 2x bigger
-                     cv::Scalar(0,0,255), // Color
-                     1, // Thickness
-                     8); // Line type
-@@ -462,7 +462,7 @@ int MainImpl(const char* modelPath,
-         cv::putText(test_image, preformance_ret_string,
-                     cv::Point(rectCrop.x + 5,rectCrop.y + 40), // Coordinates
-                     cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
--                    1.0, // Scale. 2.0 = 2x bigger
-+                    0.75, // Scale. 2.0 = 2x bigger
-                     cv::Scalar(0,0,255), // Color
-                     1, // Thickness
-                     8); // Line type
--- 
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
deleted file mode 100644
index 29142a0..0000000
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ /dev/null
@@ -1,102 +0,0 @@
-SUMMARY = "ARM Neural Network SDK"
-DESCRIPTION = "Linux software and tools to enable machine learning (Caffe/Tensorflow) workloads on power-efficient devices"
-LICENSE = "MIT & Apache-2.0"
-# Apache-2.0 license applies to mobilenet tarball
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
-                    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
-
-PR = "r4"
-PV = "19.08"
-PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
-
-BRANCH = "branches/armnn_19_08"
-SRCREV = "26052fcf2f8c91f3479c9484354e88e8944d004d"
-
-SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
-BRANCH_tidl-api = "master"
-
-SRCREV_FORMAT = "armnn"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-SRC_URI = " \
-    git://review.mlplatform.org/ml/armnn;protocol=https;name=armnn;branch=${BRANCH} \
-    file://0001-stdlib-issue-work-around.patch \
-    file://0002-enable-use-of-boost-shared-library.patch \
-    file://0003-add-more-test-command-line-arguments.patch \
-    file://0004-generate-versioned-library.patch \
-    file://0005-add-armnn-mobilenet-test-example.patch \
-    file://0006-armnn-mobilenet-test-example.patch \
-    file://0007-enable-use-of-arm-compute-shared-library.patch \
-    file://0009-command-line-options-for-video-port-selection.patch \
-    file://0010-armnnexamples-update-for-19.08-modifications.patch \
-    file://0011-Generate-versioned-library-for-armnnTfLiteParser.patch \
-    file://0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch \
-    file://0013-ArmnnExample-setting-capture-resolution-for-the-came.patch \
-    http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
-    https://storage.googleapis.com/mobilenet_v2/checkpoints/mobilenet_v2_1.0_224.tgz;name=mobilenetv2;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
-    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
-"
-
-SRC_URI[mobilenet.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
-SRC_URI[mobilenet.sha256sum] = "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
-SRC_URI[mobilenetv2.md5sum] = "519bba7052fd279c66d2a28dc3f51f46"
-SRC_URI[mobilenetv2.sha256sum] = "318084bc1b63d6d7b854553e09cdf77078b1c0168be27c59a0d44253b5ed49dc"
-
-DEPENDS = " \
-    boost \
-    protobuf \
-    stb \
-    arm-compute-library \
-    armnn-caffe \
-    armnn-tensorflow \
-    armnn-onnx \
-    tensorflow-lite \
-    flatbuffers \
-    opencv \
-"
-
-RDEPENDS_${PN} = " arm-compute-library protobuf boost "
-
-EXTRA_OECMAKE=" \
-    -DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF \
-    -DARMCOMPUTE_ROOT=${STAGING_DIR_HOST}${datadir}/arm-compute-library \
-    -DCAFFE_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-caffe \
-    -DTF_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-tensorflow \
-    -DONNX_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-onnx \
-    -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 -DBUILD_ONNX_PARSER=1 -DBUILD_TF_LITE_PARSER=1 \
-    -DTF_LITE_GENERATED_PATH=${STAGING_DIR_HOST}${includedir}/tensorflow/lite/schema \
-    -DFLATBUFFERS_ROOT=${STAGING_DIR_HOST}${includedir}/flatbuffers \
-    -DFLATBUFFERS_LIBRARY=${STAGING_DIR_HOST}${libdir}/libflatbuffers.so \
-    -DARMCOMPUTENEON=1 \
-    -DBUILD_TESTS=1 -DPROFILING=1 \
-    -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
-    -DBUILD_ARMNN_EXAMPLES=1 \
-    -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
-"
-
-TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
-
-do_install_append() {
-    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-    install -d ${D}${bindir}
-    find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
-    cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
-    install -d ${D}${TESTVECS_INSTALL_DIR}/models
-    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
-    cp ${WORKDIR}/tfmodel/mobilenet_v2_1.0_224.tflite ${D}${TESTVECS_INSTALL_DIR}/models
-    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
-    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
-    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
-    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${TESTVECS_INSTALL_DIR}/testvecs
-    chrpath -d ${D}${bindir}/*
-}
-
-CXXFLAGS += "-fopenmp"
-LIBS += "-larmpl_lp64_mp"
-
-FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
-FILES_${PN}-dev += "{libdir}/cmake/*"
-INSANE_SKIP_${PN}-dev = "dev-elf"
-- 
2.7.4


