Return-Path: <xuj@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5E66F529BC
	for <meta-arago@arago-project.org>;
	Tue, 26 Nov 2019 17:53:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAQHq7T0085415
	for <meta-arago@arago-project.org>; Tue, 26 Nov 2019 11:52:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574790727;
	bh=TYRq8yBrQMH41Sm48DFQqT/BMjZ8cVdsrDIvyxbi5WY=;
	h=From:To:CC:Subject:Date;
	b=xPtpar+4eOoxMXynEUZS+TtNO9w6IqrmooIRWXV+4OJQY4mpHvII5pXX8p0KW6lsq
	ouBEis5HFucYHAgl995AisvO8iK59LTtVBIG8ddLyevSAPlEMLDZ9qTkPYQxrkhL9G
	aIRfS5W9s3HHt3Oi/SAFB+D66wLCk5YEimRFNTFo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAQHq70x064231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Nov 2019 11:52:07 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 26 Nov 2019 11:52:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 26 Nov 2019 11:52:06 -0600
Received: from UDA0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAQHq6Ca097459;
	Tue, 26 Nov 2019 11:52:06 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Nov 2019 12:50:27 -0500
Message-ID: <20191126175027.32321-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3] neo-ai-dlr: fix dlr runtime problem
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
X-List-Received-Date: Tue, 26 Nov 2019 17:53:37 -0000
Content-Type: text/plain

* bump up neo-ai-dlr SRCREV
* add a patch to skip git cloning during cmake configuration
* move libdlr.so to python site-packages dlr folder
* add neo-ai-dlr-tests to target file system
* change testing scripts' path to be the same as in source code

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bbappend  |  2 +-
 ...akeLists-skip-cloning-of-googletests.patch | 50 +++++++++++++++++++
 recipes-support/neo-ai/neo-ai-dlr_git.bb      | 24 +++++----
 3 files changed, 66 insertions(+), 10 deletions(-)
 create mode 100644 recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 2a298e0..aa0a182 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -17,7 +17,7 @@ EXTRA_PACKAGES_append_k3 = " watchdog"
 
 EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
 
-NEO_AI_PACKAGES = "neo-ai-dlr"
+NEO_AI_PACKAGES = "neo-ai-dlr neo-ai-dlr-tests"
 NEO_AI_PACKAGES_armv5 = ""
 
 EXTRA_PACKAGES_append = " hidapi \
diff --git a/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch b/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch
new file mode 100644
index 0000000..32a7bbd
--- /dev/null
+++ b/recipes-support/neo-ai/files/0001-CMakeLists-skip-cloning-of-googletests.patch
@@ -0,0 +1,50 @@
+From 3d9fa328598b38022c638b402d111000ce0d88c7 Mon Sep 17 00:00:00 2001
+From: Jianzhong Xu <xuj@ti.com>
+Date: Tue, 26 Nov 2019 08:53:33 -0500
+Subject: [PATCH] CMakeLists: skip cloning of googletests
+
+Signed-off-by: Jianzhong Xu <xuj@ti.com>
+---
+ CMakeLists.txt | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 281fdb7..70a88d7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -293,19 +293,19 @@ add_custom_target(demo DEPENDS ${DEMO_EXECS})
+ 
+ # Tests
+ if(NOT(ANDROID_BUILD OR AAR_BUILD))
+-  include(cmake/googletest.cmake)
+-  fetch_googletest(
+-    ${PROJECT_SOURCE_DIR}/cmake
+-    ${PROJECT_BINARY_DIR}/googletest
+-    )
+-
+-  enable_testing()
+-
+-  file(GLOB TEST_SRCS tests/cpp/*.cc)
+-  if(WITH_TENSORFLOW_LITE_LIB)
+-    file(GLOB TFLITE_TEST_SRCS tests/cpp/dlr_tflite/*.cc)
+-    list(APPEND TEST_SRCS ${TFLITE_TEST_SRCS})
+-  endif()
++  #include(cmake/googletest.cmake)
++  #fetch_googletest(
++  #  ${PROJECT_SOURCE_DIR}/cmake
++  #  ${PROJECT_BINARY_DIR}/googletest
++  #  )
++  #
++  #enable_testing()
++  #
++  #file(GLOB TEST_SRCS tests/cpp/*.cc)
++  #if(WITH_TENSORFLOW_LITE_LIB)
++  #  file(GLOB TFLITE_TEST_SRCS tests/cpp/dlr_tflite/*.cc)
++  #  list(APPEND TEST_SRCS ${TFLITE_TEST_SRCS})
++  #endif()
+   foreach(__srcpath ${TEST_SRCS})
+     get_filename_component(__srcname ${__srcpath} NAME)
+     string(REPLACE ".cc" "" __execname ${__srcname})
+-- 
+2.17.1
+
diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo-ai/neo-ai-dlr_git.bb
index cbf4447..636714a 100644
--- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
+++ b/recipes-support/neo-ai/neo-ai-dlr_git.bb
@@ -26,9 +26,10 @@ SRC_URI = "git://github.com/neo-ai/neo-ai-dlr;protocol=https;branch=${BRANCH};na
            git://github.com/neo-ai/treelite;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite;name=neo-ai-treelite \
            git://github.com/dmlc/dmlc-core;protocol=https;branch=master;destsuffix=${S}/3rdparty/treelite/dmlc-core;name=neo-ai-treelite-dmlc-core \
            git://github.com/fmtlib/fmt;protocol=https;nobranch=1;destsuffix=${S}/3rdparty/treelite/3rdparty/fmt;name=neo-ai-treelite-fmt \
+           file://0001-CMakeLists-skip-cloning-of-googletests.patch \
 "
 
-SRCREV_neo-ai-dlr = "dd9c8e806065b2c0fca97209c8bfd1cce0749ea9"
+SRCREV_neo-ai-dlr = "35ed4fa2607056608451d85508fea70f458a14a6"
 SRCREV_neo-ai-tvm = "44779571412930681eef9e8b9d32aa845b8cc5ad"
 SRCREV_neo-ai-tvm-dmlc-core = "4d49691f1a9d944c3b0aa5e63f1db3cad1f941f8"
 SRCREV_neo-ai-tvm-dlpack = "bee4d1dd8dc1ee4a1fd8fa6a96476c2f8b7492a3"
@@ -41,26 +42,31 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3 cmake python3native
 
+# Set B so that DLR Python installation can find the library
+B = "${S}/build"
+
 do_install() {
     # This does not do anything
     #cmake_do_install
 
-    install -d ${D}${libdir}
-    install -m 0644 ${S}/lib/* ${D}${libdir}
-
-    install -d ${D}${includedir}
-    install -m 0644 ${S}/include/* ${D}${includedir}
+    install -d ${D}${includedir}/dlr_tflite
+    install -m 0644 ${S}/include/*.h ${D}${includedir}
+    install -m 0644 ${S}/include/dlr_tflite/*.h ${D}${includedir}/dlr_tflite
 
+    # Install DLR Python binding
     cd ${S}/python
     distutils3_do_install
-    cd ${B}
 
     # setup.py install some libs under datadir, but we don't need them, so remove.
     rm ${D}${datadir}/dlr/*.so
 
+    # Install DLR library to Python import search path
+    install -m 0644 ${S}/build/lib/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
+
     # Now install python test scripts
-    install -d ${D}${datadir}/dlr/tests
-    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/tests/
+    install -d ${D}${datadir}/dlr/tests/python/integration
+    install -m 0644 ${S}/tests/python/integration/*.py ${D}${datadir}/dlr/tests/python/integration
+    install -m 0644 ${S}/tests/python/integration/*.npy ${D}${datadir}/dlr/tests/python/integration
 }
 
 PACKAGES =+ "${PN}-tests"
-- 
2.17.1


