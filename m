Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC0DC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 00:25:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.604.1737073525085312002
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 16:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bQWe5pSr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50H0PObK092111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Jan 2025 18:25:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737073524;
	bh=ECP9jsy3c4j/NyulS1ouo39yaNinE1PUCe48fCAUGHQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bQWe5pSrHX2mQ9W9K3H4ngZwGB1Knq8rryCd1uc6xMwtwNHHJtCj2E2RcTDlgS8T2
	 umDuENMhtTgQYCnCUnrwJTAH0LK3onqlZIpKEjzQPXXmWvTEYR4F1sRzu4MxKiPSGk
	 I9/qObyNy9MeFfly6z2rZpJKyE+9HwUOncjJsp18=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0POLB094678;
	Thu, 16 Jan 2025 18:25:24 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 18:25:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 18:25:23 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0PLnv007059;
	Thu, 16 Jan 2025 18:25:23 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 6/6] meta-arago-extras: Add recipe for ONNX Runtime
Date: Thu, 16 Jan 2025 18:25:20 -0600
Message-ID: <20250117002520.627504-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250117002520.627504-1-afd@ti.com>
References: <20250117002520.627504-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 00:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15704

ONNX Runtime is a cross-platform inference and training machine-learning
accelerator. ONNX Runtime is compatible with different hardware, drivers,
and operating systems, and provides optimal performance by leveraging
hardware accelerators where applicable alongside graph optimizations and
transforms.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...ble-permission-bit-from-source-files.patch |  72 ++++++++
 ...-in-option-text-s-buildings-bindings.patch |  25 +++
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 ++++
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  31 ++++
 ...ake-Print-out-result-of-find_package.patch |  37 +++++
 .../onnxruntime/onnxruntime_1.20.1.bb         | 155 ++++++++++++++++++
 6 files changed, 352 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permission-bit-from-source-files.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_package.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb

diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permission-bit-from-source-files.patch b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permission-bit-from-source-files.patch
new file mode 100644
index 00000000..c890f0bd
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permission-bit-from-source-files.patch
@@ -0,0 +1,72 @@
+From 626066499c34c524924302342fc071f32442caae Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Sun, 12 Jan 2025 12:48:49 -0600
+Subject: [PATCH] Remove executable permission bit from source files
+
+These are source files, not executables, do not set the executable
+permission bit on these files.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ onnxruntime/contrib_ops/cpu/utils/console_dumper.h           | 1 +
+ onnxruntime/core/optimizer/bias_softmax_fusion.cc            | 0
+ onnxruntime/core/providers/acl/acl_execution_provider.h      | 0
+ onnxruntime/core/providers/acl/acl_fwd.h                     | 0
+ onnxruntime/core/providers/acl/acl_provider_factory.cc       | 0
+ onnxruntime/core/providers/acl/math/gemm.cc                  | 0
+ onnxruntime/core/providers/acl/nn/batch_norm.cc              | 0
+ onnxruntime/core/providers/acl/nn/batch_norm.h               | 0
+ onnxruntime/test/optimizer/graph_transform_test.cc           | 0
+ onnxruntime/test/optimizer/graph_transform_test_layernorm.cc | 0
+ 10 files changed, 1 insertion(+)
+ mode change 100755 => 100644 onnxruntime/core/optimizer/bias_softmax_fusion.cc
+ mode change 100755 => 100644 onnxruntime/core/providers/acl/acl_execution_provider.h
+ mode change 100755 => 100644 onnxruntime/core/providers/acl/acl_fwd.h
+ mode change 100755 => 100644 onnxruntime/core/providers/acl/acl_provider_factory.cc
+ mode change 100755 => 100644 onnxruntime/core/providers/acl/math/gemm.cc
+ mode change 100755 => 100644 onnxruntime/core/providers/acl/nn/batch_norm.cc
+ mode change 100755 => 100644 onnxruntime/core/providers/acl/nn/batch_norm.h
+ mode change 100755 => 100644 onnxruntime/test/optimizer/graph_transform_test.cc
+ mode change 100755 => 100644 onnxruntime/test/optimizer/graph_transform_test_layernorm.cc
+
+diff --git a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h b/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
+index 9ebc44f441..64bd2b7b18 100644
+--- a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
++++ b/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
+@@ -3,6 +3,7 @@
+ 
+ #pragma once
+ #include <string>
++#include <iostream>
+ #include "core/framework/ort_value.h"
+ #include "core/framework/float16.h"
+ #include "contrib_ops/cpu/utils/debug_macros.h"
+diff --git a/onnxruntime/core/optimizer/bias_softmax_fusion.cc b/onnxruntime/core/optimizer/bias_softmax_fusion.cc
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/core/providers/acl/acl_execution_provider.h b/onnxruntime/core/providers/acl/acl_execution_provider.h
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/core/providers/acl/acl_fwd.h b/onnxruntime/core/providers/acl/acl_fwd.h
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/core/providers/acl/acl_provider_factory.cc b/onnxruntime/core/providers/acl/acl_provider_factory.cc
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/core/providers/acl/math/gemm.cc b/onnxruntime/core/providers/acl/math/gemm.cc
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.cc b/onnxruntime/core/providers/acl/nn/batch_norm.cc
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.h b/onnxruntime/core/providers/acl/nn/batch_norm.h
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/test/optimizer/graph_transform_test.cc b/onnxruntime/test/optimizer/graph_transform_test.cc
+old mode 100755
+new mode 100644
+diff --git a/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc b/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc
+old mode 100755
+new mode 100644
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
new file mode 100644
index 00000000..88423190
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
@@ -0,0 +1,25 @@
+From be67663e9a44d146033aeb97804145a60b4032db Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 16 Jan 2025 12:35:03 -0600
+Subject: [PATCH] [cmake] Fix typo in option text s/buildings/bindings
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ cmake/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
+index d90a2a3550..e0cde678db 100644
+--- a/cmake/CMakeLists.txt
++++ b/cmake/CMakeLists.txt
+@@ -77,7 +77,7 @@ option(onnxruntime_GENERATE_TEST_REPORTS "Enable test report generation" OFF)
+ option(onnxruntime_ENABLE_STATIC_ANALYSIS "Enable static analysis" OFF)
+ option(onnxruntime_USE_CUSTOM_STATIC_ANALYSIS_RULES "Use a custom SDL Rule. It is mainly for our CI build" OFF)
+ option(onnxruntime_REDIRECT_STATIC_ANALYSIS_OUTPUTS_TO_FILE "Use a custom SDL Rule. It is mainly for our CI build" OFF)
+-option(onnxruntime_ENABLE_PYTHON "Enable python buildings" OFF)
++option(onnxruntime_ENABLE_PYTHON "Enable python bindings" OFF)
+ # Enable it may cause LNK1169 error
+ option(onnxruntime_ENABLE_MEMLEAK_CHECKER "Experimental: Enable memory leak checker in Windows debug build" OFF)
+ option(onnxruntime_USE_CUDA "Build with CUDA support" OFF)
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
new file mode 100644
index 00000000..cd979b76
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
@@ -0,0 +1,32 @@
+From b1689f3f963f4c07d3329a838569ac4c2fa2bd5f Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 16 Jan 2025 12:38:13 -0600
+Subject: [PATCH] [ACL] Do not add LD_LIBRARY_PATH to search path when not
+ defined
+
+If LD_LIBRARY_PATH is not defined a blank "-L" is added to the
+link command. This causes the next object to be linked to get
+treated as if it was a search path and causes link failure.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ cmake/onnxruntime_providers_acl.cmake | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/onnxruntime_providers_acl.cmake b/cmake/onnxruntime_providers_acl.cmake
+index e23d289271..19d41dc73f 100644
+--- a/cmake/onnxruntime_providers_acl.cmake
++++ b/cmake/onnxruntime_providers_acl.cmake
+@@ -13,7 +13,9 @@
+     onnxruntime_common onnxruntime_framework onnx onnx_proto ${PROTOBUF_LIB} flatbuffers::flatbuffers Boost::mp11 safeint_interface
+   )
+ 
+-  target_link_libraries(onnxruntime_providers_acl -L$ENV{LD_LIBRARY_PATH})
++  if (DEFINED ENV{LD_LIBRARY_PATH})
++    target_link_libraries(onnxruntime_providers_acl -L$ENV{LD_LIBRARY_PATH})
++  endif()
+   add_dependencies(onnxruntime_providers_acl ${onnxruntime_EXTERNAL_DEPENDENCIES})
+   set_target_properties(onnxruntime_providers_acl PROPERTIES FOLDER "ONNXRuntime")
+   target_include_directories(onnxruntime_providers_acl
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
new file mode 100644
index 00000000..46fc2fc5
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
@@ -0,0 +1,31 @@
+From 7ea6e35d3630f8c19080a0cb5a4a4c55c242a36b Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 16 Jan 2025 12:40:57 -0600
+Subject: [PATCH] Do not include CMAKE_CXX_FLAGS in build information string
+
+While this information can be useful, it often includes information
+that may be specific to the build machine (like include paths with
+usernames, e.g. -I /home/myname/externalproject/fakeroot/inlcude).
+
+This causes issues for reproducible builds (resulting binaries will
+be different between different build machines).
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ cmake/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
+index e0cde678db..e0d8fd0a17 100644
+--- a/cmake/CMakeLists.txt
++++ b/cmake/CMakeLists.txt
+@@ -1439,7 +1439,6 @@ if (Git_FOUND)
+   string(APPEND ORT_BUILD_INFO "git-branch=${ORT_GIT_BRANCH}, git-commit-id=${ORT_GIT_COMMIT}, ")
+ endif()
+ string(APPEND ORT_BUILD_INFO "build type=${CMAKE_BUILD_TYPE}")
+-string(APPEND ORT_BUILD_INFO ", cmake cxx flags: ${CMAKE_CXX_FLAGS}")
+ configure_file(onnxruntime_config.h.in ${CMAKE_CURRENT_BINARY_DIR}/onnxruntime_config.h)
+ get_property(onnxruntime_GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
+ 
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_package.patch b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_package.patch
new file mode 100644
index 00000000..9bbe920b
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_package.patch
@@ -0,0 +1,37 @@
+From a73d9b9f4dba6d164e128d6c768d1b0a04e969ab Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 16 Jan 2025 12:47:27 -0600
+Subject: [PATCH] [cmake] Print out result of find_package
+
+A verbose only message is already printed that states the CMake will
+attempt to find a package using find_package():
+
+> Trying find_package(...) before FetchContent
+
+But it never prints if the package was found this way or not.
+Add this result message.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ cmake/external/helper_functions.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/cmake/external/helper_functions.cmake b/cmake/external/helper_functions.cmake
+index e3f2211f96..9ca6a967da 100644
+--- a/cmake/external/helper_functions.cmake
++++ b/cmake/external/helper_functions.cmake
+@@ -138,9 +138,12 @@ macro(onnxruntime_fetchcontent_makeavailable)
+         unset(__cmake_fpArgs)
+ 
+         if(${__cmake_contentName}_FOUND)
++          message(VERBOSE "Found ${__cmake_contentName} with find_package()")
+           FetchContent_SetPopulated(${__cmake_contentName})
+           FetchContent_GetProperties(${__cmake_contentName})
+           continue()
++        else()
++          message(VERBOSE "Could not find ${__cmake_contentName} with find_package()")
+         endif()
+       endif()
+     else()
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
new file mode 100644
index 00000000..84a02d56
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
@@ -0,0 +1,155 @@
+DESCRIPTION = "ONNX Runtime is a cross-platform, high performance machine learning inferencing framework"
+SUMMARY = "ONNX Runtime Python package & C++ library"
+HOMEPAGE = "https://www.onnxruntime.ai/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f7e3b1308cb5c00b372a6e78835732d"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI = "\
+	git://github.com/microsoft/onnxruntime.git;protocol=https;branch=rel-1.20.1 \
+	git://github.com/HowardHinnant/date.git;protocol=https;branch=master;name=date;destsuffix=${S}/cmake/external/date \
+	git://github.com/pytorch/cpuinfo.git;protocol=https;branch=main;name=cpuinfo;destsuffix=${S}/cmake/external/cpuinfo \
+	git://github.com/google/flatbuffers.git;protocol=https;branch=master;name=flatbuffers;destsuffix=${S}/cmake/external/flatbuffers \
+	git://github.com/dcleblanc/SafeInt.git;protocol=https;branch=master;name=safeint;destsuffix=${S}/cmake/external/safeint \
+	git://gitlab.com/libeigen/eigen.git;protocol=https;branch=3.4;name=eigen;destsuffix=${S}/cmake/external/eigen \
+	git://github.com/google/nsync.git;protocol=https;branch=master;name=nsync;destsuffix=${S}/cmake/external/nsync \
+"
+SRC_URI += "\
+	file://0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch \
+	file://0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch \
+	file://0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch \
+	file://0005-cmake-Print-out-result-of-find_package.patch \
+	file://0001-Remove-executable-permission-bit-from-source-files.patch \
+"
+
+SRCREV_FORMAT = "default"
+SRCREV = "5c1b7ccbff7e5141c1da7a9d963d660e5741c319"
+SRCREV_date = "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
+SRCREV_cpuinfo = "ca678952a9a8eaa6de112d154e8e104b22f9ab3f"
+SRCREV_flatbuffers = "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
+SRCREV_safeint = "4cafc9196c4da9c817992b20f5253ef967685bf8"
+SRCREV_eigen = "e7248b26a1ed53fa030c5c459f7ea095dfd276ac"
+SRCREV_nsync = "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "\
+	onnx \
+	abseil-cpp \
+	protobuf \
+	protobuf-native \
+	boost \
+	re2 \
+	nlohmann-json \
+	microsoft-gsl \
+"
+
+PYTHON_DEPENDS = "\
+	python3 \
+	python3-numpy \
+	python3-numpy-native \
+	python3-pybind11 \
+	python3-pybind11-native \
+"
+
+PYTHON_RDEPENDS = "\
+	python3 \
+	python3-onnx \
+	python3-numpy \
+	python3-protobuf \
+	python3-coloredlogs \
+	python3-flatbuffers \
+	python3-sympy \
+"
+
+OECMAKE_SOURCEPATH = "${S}/cmake"
+
+PACKAGECONFIG ??= "python sharedlib unittests acl"
+
+PACKAGECONFIG[python] = "-Donnxruntime_ENABLE_PYTHON=ON, -Donnxruntime_ENABLE_PYTHON=OFF, ${PYTHON_DEPENDS}"
+PACKAGECONFIG[sharedlib] = "-Donnxruntime_BUILD_SHARED_LIB=ON, -Donnxruntime_BUILD_SHARED_LIB=OFF"
+PACKAGECONFIG[unittests] = "-Donnxruntime_BUILD_UNIT_TESTS=ON, -Donnxruntime_BUILD_UNIT_TESTS=OFF, googletest"
+
+PACKAGECONFIG[acl] = "-Donnxruntime_USE_ACL=ON, -Donnxruntime_USE_ACL=OFF, arm-compute-library"
+PACKAGECONFIG[armnn] = "-Donnxruntime_USE_ARMNN=ON, -Donnxruntime_USE_ARMNN=OFF, armnn"
+PACKAGECONFIG[armnn-relu] = "-Donnxruntime_ARMNN_RELU_USE_CPU=ON, -Donnxruntime_ARMNN_RELU_USE_CPU=OFF"
+PACKAGECONFIG[armnn-bn] = "-Donnxruntime_ARMNN_BN_USE_CPU=ON, -Donnxruntime_ARMNN_BN_USE_CPU=OFF"
+
+EXTRA_OECMAKE:append = " \
+	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
+	-DFETCHCONTENT_SOURCE_DIR_DATE=${S}/cmake/external/date \
+	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=${S}/cmake/external/cpuinfo \
+	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=${S}/cmake/external/cpuinfo \
+	-DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=${S}/cmake/external/flatbuffers \
+	-DFETCHCONTENT_SOURCE_DIR_SAFEINT=${S}/cmake/external/safeint \
+	-DFETCHCONTENT_SOURCE_DIR_EIGEN=${S}/cmake/external/eigen \
+	-DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=${S}/cmake/external/nsync \
+"
+
+EXTRA_OECMAKE:append = " \
+	-DONNX_CUSTOM_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
+	-Donnx_SOURCE_DIR=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR} \
+	-DPython_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+	--compile-no-warning-as-error \
+	--log-level=VERBOSE \
+"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
+inherit python3-dir cmake
+
+do_install:append() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+	# Install test binaries and data in test package
+	install -d ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_library.so ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_get_const_input_test_library.so ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_local_function.so ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_invalid_library.so ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libtest_execution_provider.so ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_customopregistration_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_global_thread_pools_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_logging_apis_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_mlas_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_perf_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_shared_lib_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_test_all ${D}${bindir}/${BPN}-tests
+	cp $CP_ARGS ${B}/testdata ${D}${bindir}/${BPN}-tests
+
+	# Install python tests and data
+	cp $CP_ARGS ${S}/onnxruntime/test/python/* ${D}${bindir}/${BPN}-tests
+
+	# Install the Python package.
+	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
+		install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+		cp $CP_ARGS ${B}/onnxruntime ${D}${PYTHON_SITEPACKAGES_DIR}
+		find ${D}${PYTHON_SITEPACKAGES_DIR} -name "libonnx*.so*" -exec rm {} \;
+	fi
+}
+
+# Add Python package
+PACKAGE_BEFORE_PN += "${PYTHON_PN}-${PN}"
+FILES:${PYTHON_PN}-${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PYTHON_PN}-${PN} += "${PYTHON_RDEPENDS} onnxruntime"
+
+# Add Python tests package
+PACKAGE_BEFORE_PN += "${PYTHON_PN}-${PN}-tests"
+FILES:${PYTHON_PN}-${PN}-tests += "\
+	${bindir}/${BPN}-tests/*.py \
+	${bindir}/${BPN}-tests/contrib_ops \
+	${bindir}/${BPN}-tests/quantization \
+	${bindir}/${BPN}-tests/transformers \
+"
+RDEPENDS:${PYTHON_PN}-${PN}-tests += "${PYTHON_PN}-${PN}"
+
+# Add tests package
+PACKAGE_BEFORE_PN += "${PN}-tests"
+FILES:${PN}-tests = "${bindir}/${BPN}-tests"
+INSANE_SKIP:${PN}-tests += "libdir"
+
+# package unversioned .so files in PN (they are not dev symlinks)
+FILES_SOLIBSDEV = "${libdir}/libonnxruntime.so"
+FILES:${PN} += "${libdir}/libonnxruntime_providers_shared.so"
+
+INSANE_SKIP:${PN}-dbg += "libdir"
-- 
2.39.2


