Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 41F3452A0E
	for <meta-arago@arago-project.org>;
	Fri, 31 Aug 2018 18:50:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7VIofDL111574
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535741441;
	bh=+IIY8/ajAOJpeYU22haMUzjr7p4ImS8GJvDFhRyRI+g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Q5AJLsDXu+xVBz8GVPjJ7rcR35al49ECgaCirRT3i5xCGebAHm06M0rCKo2ub3oC9
	lxCM0t7oEfH1cAS0+evyOA9eCOiF+1pmnc1Wv9Juq8NqJLZTELEK7h/M/DpAbzult4
	sTlsnHmjm1OF88himTzoxajVwnmM36971cqT2rjg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIofFb016640
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 31 Aug 2018 13:50:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 31 Aug 2018 13:50:41 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIodnd009985
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:40 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Aug 2018 14:50:33 -0400
Message-ID: <1535741433-30388-4-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535741433-30388-1-git-send-email-qsu@ti.com>
References: <1535741433-30388-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 3/3] armnn: ARM NN machine learning SDK.
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
X-List-Received-Date: Fri, 31 Aug 2018 18:50:51 -0000
Content-Type: text/plain

Arm NN SDK is a set of open-source Linux software and tools that enables
machine learning workloads on power-efficient devices. Arm NN takes Caffe,
TensorFlow network frameworks, translate them to the internal Arm NN
formatand then, through the Compute Library, deploy them efficiently on
Cortex-A CPUs.

Signed-off-by: Qin Su <qsu@ti.com>
---
 meta-arago-extras/recipes-support/armnn/armnn.bb   | 47 ++++++++++++++++++
 .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn.bb b/meta-arago-extras/recipes-support/armnn/armnn.bb
new file mode 100644
index 0000000..51bd919
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "Linux software and tools to enable machine learning (Caffe/Tensorflow) workloads on power-efficient devices"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
+
+SRCREV = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN}-dev += "{libdir}/cmake/*"
+
+inherit cmake
+
+SRC_URI = " \
+    git://github.com/ARM-software/armnn.git \
+    file://0001-stdlib-issue-work-around.patch \
+"
+
+DEPENDS = " \
+           boost \
+           protobuf-tidl \
+           stb \
+           arm-compute-library \
+		   armnn-caffe \
+		   armnn-tensorflow \
+"
+
+EXTRA_OECMAKE=" \
+               -DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF \
+               -DARMCOMPUTE_ROOT=${STAGING_DIR_HOST}${datadir}/arm-compute-library \
+               -DARMCOMPUTE_BUILD_DIR=${STAGING_DIR_HOST}${datadir}/arm-compute-library/build \
+               -DCAFFE_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-caffe \
+               -DTF_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-tensorflow \
+               -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 \
+               -DARMCOMPUTENEON=1 \ 
+               -DBUILD_TESTS=1 -DPROFILING=1 \
+               -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
+"
+
+CXXFLAGS += "-fopenmp"
+LIBS += "-larmpl_lp64_mp"
+
+INSANE_SKIP_${PN}-dev = "dev-elf"
+
+PACKAGES =+ "${PN}-bash-completion"
+FILES_${PN}-bash-completion += "${bindir}/armnn_completions.sh"
+RDEPENDS_${PN}-bash-completion = "bash bash-completion"
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch b/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
new file mode 100644
index 0000000..eab2902
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
@@ -0,0 +1,55 @@
+From 3691057b51010c1bd979998c460ad7b43f97496f Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Fri, 10 Aug 2018 11:02:14 -0400
+Subject: [PATCH] stdlib issue work around
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ cmake/GlobalConfig.cmake | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+ mode change 100644 => 100755 cmake/GlobalConfig.cmake
+
+diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
+old mode 100644
+new mode 100755
+index 2dbeada..2b88c16
+--- a/cmake/GlobalConfig.cmake
++++ b/cmake/GlobalConfig.cmake
+@@ -47,6 +47,34 @@ elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL MSVC)
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc /MP")
+     add_definitions(-DNOMINMAX=1 -DNO_STRICT=1)
+ endif()
++
++# Ensure that the default include system directories are added to the list of CMake implicit includes.
++# This workarounds an issue that happens when using GCC 6 and using system includes (-isystem).
++# For more details check: https://bugs.webkit.org/show_bug.cgi?id=161697
++macro(DETERMINE_GCC_SYSTEM_INCLUDE_DIRS _lang _compiler _flags _result)
++    file(WRITE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy" "\n")
++    separate_arguments(_buildFlags UNIX_COMMAND "${_flags}")
++    execute_process(COMMAND ${_compiler} ${_buildFlags} -v -E -x ${_lang} -dD dummy
++                    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/CMakeFiles OUTPUT_QUIET
++                    ERROR_VARIABLE _gccOutput)
++    file(REMOVE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy")
++    if ("${_gccOutput}" MATCHES "> search starts here[^\n]+\n *(.+) *\n *End of (search) list")
++        set(${_result} ${CMAKE_MATCH_1})
++        string(REPLACE "\n" " " ${_result} "${${_result}}")
++        separate_arguments(${_result})
++    endif ()
++endmacro()
++
++if (CMAKE_COMPILER_IS_GNUCC)
++   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c" "${CMAKE_C_COMPILER}" "${CMAKE_C_FLAGS}" SYSTEM_INCLUDE_DIRS)
++   set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
++endif ()
++
++if (CMAKE_COMPILER_IS_GNUCXX)
++   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c++" "${CMAKE_CXX_COMPILER}" "${CMAKE_CXX_FLAGS}" SYSTEM_INCLUDE_DIRS)
++   set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
++endif ()
++
+ if("${CMAKE_SYSTEM_NAME}" STREQUAL Android)
+     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -llog")
+     set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -llog")
+-- 
+1.9.1
+
-- 
1.9.1


