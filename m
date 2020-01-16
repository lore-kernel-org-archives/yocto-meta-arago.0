Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C7843529EA
	for <meta-arago@arago-project.org>;
	Thu, 16 Jan 2020 19:04:12 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GJ2PUx050329
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2020 13:02:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579201345;
	bh=nNrC2OKp34gB3790qjD6bpLCM6J4J7v42IL9quperOc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eLFb70XBWK+LgljlKb5xK3I+DJrU0wY3zTsa6B9P4uHdlGPExrrSSxrvho0JI3NXp
	x3XqoIK8NHTS9juHXGWC5m67DNlEdJt7u0YtARuVwzAnAczFd7MH/KwSnxqlijPJ2a
	43+f0/S+41xkwczyOEJb/0rcb5X3koNlSiO9FdRU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GJ2PHJ031528
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 16 Jan 2020 13:02:25 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 16 Jan 2020 13:02:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 16 Jan 2020 13:02:25 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GJ2Oqf077031;
	Thu, 16 Jan 2020 13:02:25 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Jan 2020 13:43:23 -0500
Message-ID: <1579200203-15059-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579200203-15059-1-git-send-email-j-stiffler@ti.com>
References: <1579200203-15059-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 2/2] tvm: remove from here in favor of meta-aws
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
X-List-Received-Date: Thu, 16 Jan 2020 19:04:13 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../tvm/0001-CMakeLists-install-unit-tests.patch   | 39 -------------
 recipes-support/tvm/tvm_git.bb                     | 64 ----------------------
 2 files changed, 103 deletions(-)
 delete mode 100644 recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch
 delete mode 100644 recipes-support/tvm/tvm_git.bb

diff --git a/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch b/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch
deleted file mode 100644
index a79856f..0000000
--- a/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5904aa69d8f022678aa19dd4c1b5569d5fc243ee Mon Sep 17 00:00:00 2001
-From: Jianzhong Xu <xuj@ti.com>
-Date: Tue, 8 Oct 2019 16:56:30 -0400
-Subject: [PATCH] [PATCH] CMakeLists: install unit tests
-
-* Install the unittests (cpptest) to /usr/share/tvm/cpptest
-* For simplicity, do not exclude cpptest from the default build.
-
-Upstream-Status: Innappropriate [Configuration]
-
-Signed-off-by: Jianzhong Xu <xuj@ti.com>
----
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
- mode change 100644 => 100755 CMakeLists.txt
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-old mode 100644
-new mode 100755
-index 10730ac7..ea369a6e
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -333,10 +333,11 @@ if(GTEST_INCLUDE_DIR AND GTEST_LIB)
-     list(APPEND TEST_EXECS ${__execname})
-     target_include_directories(${__execname} PUBLIC ${GTEST_INCLUDE_DIR})
-     target_link_libraries(${__execname} tvm ${GTEST_LIB} pthread dl)
--    set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_ALL 1)
--    set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD 1)
-+    #set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_ALL 1)
-+    #set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD 1)
-   endforeach()
-   add_custom_target(cpptest DEPENDS ${TEST_EXECS})
-+  install(TARGETS ${TEST_EXECS} DESTINATION share/tvm/cpptest)
- elseif(NOT GTEST_INCLUDE_DIR)
-   add_custom_target(cpptest
-       COMMAND echo "Missing Google Test headers in include path"
--- 
-2.17.1
-
diff --git a/recipes-support/tvm/tvm_git.bb b/recipes-support/tvm/tvm_git.bb
deleted file mode 100644
index 5bbdd36..0000000
--- a/recipes-support/tvm/tvm_git.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY = "Open Deep Learning Compiler Stack"
-HOMEPAGE = "https://tvm.ai/"
-LICENSE = "Apache-2.0 & BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
-                    file://3rdparty/dmlc-core/LICENSE;md5=0ca7d6e8f4af26868cb42025ad83374b \
-                    file://3rdparty/dlpack/LICENSE;md5=f62d4e85ba68a1574b74d97ab8dea9ab \
-                    file://3rdparty/HalideIR/LICENSE;md5=9910386e68f0616e1ecf1037479fa97e \
-"
-
-RDEPENDS_${PN} = " python3-decorator \
-"
-
-PV = "0.5"
-
-BRANCH = "master"
-
-# Main TVM sources plus submodules.
-SRC_URI = "git://github.com/dmlc/tvm;protocol=https;branch=${BRANCH};name=tvm \
-           git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/dmlc-core;name=dmlc-core \
-           git://github.com/dmlc/HalideIR;protocol=https;branch=master;destsuffix=${S}/3rdparty/HalideIR;name=halideir \
-           git://github.com/dmlc/dlpack;protocol=https;branch=master;destsuffix=${S}/3rdparty/dlpack;name=dlpack \
-           git://github.com/agauniyal/rang;protocol=https;branch=master;destsuffix=${S}/3rdparty/rang;name=rang \
-           file://0001-CMakeLists-install-unit-tests.patch \
-"
-
-SRCREV_tvm = "76c239269935288e51fbce14f135d75ad9742b2a"
-SRCREV_dmlc-core = "d07fb7a443b5db8a89d65a15a024af6a425615a5"
-SRCREV_halideir = "b257a9221ee1e5180d994b3488ddcc259b0ac157"
-SRCREV_dlpack = "5c792cef3aee54ad8b7000111c9dc1797f327b59"
-SRCREV_rang = "cabe04d6d6b05356fa8f9741704924788f0dd762"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3 cmake python3native
-
-DEPENDS += "zlib llvm llvm-native gtest"
-
-# Point to llvm-config
-LLVM_RELEASE = "6.0"
-EXTRA_OECMAKE += "-DUSE_LLVM=llvm-config${LLVM_RELEASE}"
-
-# This is how we enable the unittests
-export GTEST_LIB = "${STAGING_LIBDIR}"
-
-do_install() {
-    cmake_do_install
-
-    cd ${S}/python
-    TVM_LIBRARY_PATH=${D}${libdir} distutils3_do_install
-    cd ${B}
-
-    # setup.py install some libs under datadir, but we don't need them, so remove.
-    rm ${D}${datadir}/tvm/*.so
-}
-
-# Versioned libs are not produced
-FILES_SOLIBSDEV = ""
-
-# Help llvm-native find target llvm-config and libs
-export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${LLVM_RELEASE}/llvm-config"
-
-BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


