Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C127C02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:00:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.96257.1738609196737022779
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 10:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r3Uad8w0;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513IxtcW2190322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 12:59:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738609195;
	bh=gpmTBqjS4+GY7g/vFjunGboLgOptOMAaK/9CS9dcO2s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r3Uad8w0gTRRRSjSBXD10Kv8LzKgs6dNNsJXka3KZr5kjo5DVSGZ/pcntvaKoUgyZ
	 SIXGi+btyjORc1i7UOwtZrlUApw27UbXFBE7UaQkgZPsl34Ei77V8GOIXsbsC7sS9+
	 jCwybKYEyvpxd/Cr076fwVH5FMQ+VRDuxHPmKNRM=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513IxtRm014241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 12:59:55 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 12:59:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 12:59:55 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Ixsp5123822;
	Mon, 3 Feb 2025 12:59:55 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 3/4] meta-arago-extras: Add recipe for ONNX
Date: Mon, 3 Feb 2025 12:59:52 -0600
Message-ID: <20250203185953.269693-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250203185953.269693-1-afd@ti.com>
References: <20250203185953.269693-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 19:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15796

ONNX provides an open source format for AI models, both deep learning
and traditional ML. It defines an extensible computation graph model,
as well as definitions of built-in operators and standard data types.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...age-Protobuf-before-checking-if-it-w.patch |  25 ++++
 ...-export-internal-targets-directories.patch |  28 +++++
 .../recipes-framework/onnx/onnx_1.16.1.bb     | 107 ++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-internal-targets-directories.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb

diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
new file mode 100644
index 00000000..dceac1f4
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
@@ -0,0 +1,25 @@
+From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 16 Jan 2025 11:44:56 -0600
+Subject: [PATCH] Try to find package Protobuf before checking if it was found
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b666eec4..f6fbf159 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
+   set(googletest_STATIC_LIBRARIES GTest::gtest)
+ endif()
+ 
++find_package(Protobuf)
++
+ if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR ((NOT ONNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
+   # Sometimes we need to use protoc compiled for host architecture while linking
+   # libprotobuf against target architecture. See https://github.com/caffe2/caffe
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-internal-targets-directories.patch b/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-internal-targets-directories.patch
new file mode 100644
index 00000000..d9233912
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-internal-targets-directories.patch
@@ -0,0 +1,28 @@
+From 0bdd879060cb5022b62d06bff0f21a21c3be18ca Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Mon, 3 Feb 2025 11:28:52 -0600
+Subject: [PATCH] Do not re-export internal targets directories
+
+These can be specific to a given project build and should not
+be automatically inherited to dependent projects.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ cmake/ONNXConfig.cmake.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/cmake/ONNXConfig.cmake.in b/cmake/ONNXConfig.cmake.in
+index d588f8ae..a61af089 100644
+--- a/cmake/ONNXConfig.cmake.in
++++ b/cmake/ONNXConfig.cmake.in
+@@ -6,8 +6,6 @@
+ # library version information
+ set(ONNX_VERSION "@ONNX_VERSION@")
+ 
+-list(APPEND CMAKE_PREFIX_PATH "@PROTOBUF_DIR@")
+-set(Protobuf_INCLUDE_DIR "@PROTOBUF_INCLUDE_DIR@")
+ find_package(Protobuf REQUIRED)
+ 
+ # import targets
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
new file mode 100644
index 00000000..fead0e61
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
@@ -0,0 +1,107 @@
+DESCRIPTION = "Open standard for machine learning interoperability"
+SUMMARY = "ONNX Python package & C++ library"
+HOMEPAGE = "https://www.onnx.ai/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI = "git://github.com/onnx/onnx.git;protocol=https;branch=rel-1.16.1"
+SRC_URI += "\
+	file://0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch \
+	file://0002-Do-not-re-export-internal-targets-directories.patch \
+"
+SRCREV = "595228d99e3977ac27cb79d5963adda262af99ad"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "\
+	abseil-cpp \
+	protobuf \
+	protobuf-native \
+	python3-protobuf \
+	python3-protobuf-native \
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
+	python3-numpy \
+	python3-protobuf \
+	python3-coloredlogs \
+	python3-flatbuffers \
+	python3-sympy \
+"
+
+PACKAGECONFIG ??= "python sharedlib unittests"
+
+PACKAGECONFIG[python] = "\
+	-DBUILD_ONNX_PYTHON=ON \
+	-DPYTHON_LIBRARY=${PYTHON_LIBRARY} \
+	-DPYTHON_INCLUDE_DIRS=${PYTHON_INCLUDE_DIR}, \
+	-DBUILD_ONNX_PYTHON=OFF, \
+	${PYTHON_DEPENDS} \
+"
+
+PACKAGECONFIG[sharedlib] = "-DBUILD_SHARED_LIBS=ON, -D-DBUILD_SHARED_LIBS=OFF"
+PACKAGECONFIG[unittests] = "-DONNX_BUILD_TESTS=ON, -DONNX_BUILD_TESTS=OFF, googletest"
+
+EXTRA_OECMAKE:append = " \
+	-DONNX_CUSTOM_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
+	-DONNX_USE_PROTOBUF_SHARED_LIBS=ON \
+	-DONNX_DISABLE_STATIC_REGISTRATION=ON \
+	-DONNX_ML=1 \
+	-DCMAKE_VERBOSE_MAKEFILE=ON \
+	--log-level=VERBOSE \
+"
+
+inherit python3native cmake
+
+python do_build_version_file() {
+    import os
+    import textwrap
+
+    version_file_path = os.path.join(d.getVar('B'), "onnx", "version.py")
+    os.makedirs(os.path.dirname(version_file_path), exist_ok=True)
+    with open(version_file_path, "w", encoding="utf-8") as f:
+        f.write(
+            textwrap.dedent(
+                f"""\
+                # This file is generated. DO NOT EDIT!
+
+
+                version = "{d.getVar('PV')}"
+                git_version = "{d.getVar('SRCREV')}"
+                """
+            )
+        )
+}
+addtask build_version_file before do_install after do_compile
+
+do_install:append() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+	# Install the Python package.
+	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
+		install -d ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
+		(cd ${S}/onnx; cp --parents $(find . -name "*.py*") ${D}${PYTHON_SITEPACKAGES_DIR}/onnx)
+		cp $CP_ARGS ${B}/onnx ${D}${PYTHON_SITEPACKAGES_DIR}
+		cp $CP_ARGS ${B}/onnx_cpp2py_export.so ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
+	fi
+}
+
+# Add Python package
+PACKAGE_BEFORE_PN += "python3-${PN}"
+FILES:python3-${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:python3-${PN} += "${PYTHON_RDEPENDS} onnx"
+
+# Output library is unversioned
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
-- 
2.39.2


