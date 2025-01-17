Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47514C0218C
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 00:25:25 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.603.1737073524703486258
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 16:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EiqIltZJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50H0PNkN235683
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Jan 2025 18:25:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737073523;
	bh=8TmuR1wgMOZex8h+96bH0/STiyCjoy1JuWRdy/bs1II=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EiqIltZJCTDA5Tjk8AZq0WMRuKlsIKMhj1OSkcgTci5w1DasCIaHky2WKcmW4JSg4
	 7Q3953FWMk5monITt0rsTL4dcXcdyPdZUu6mu4puzvBcgEYkInSXMnfjMv4oRemFDH
	 fxDxFTQizxRHztvGWeS+dudPXG5Sjqys0PeFjGTE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0PN2q094674;
	Thu, 16 Jan 2025 18:25:23 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 18:25:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 18:25:23 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50H0PLnu007059;
	Thu, 16 Jan 2025 18:25:23 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 5/6] meta-arago-extras: Add recipe for ONNX
Date: Thu, 16 Jan 2025 18:25:19 -0600
Message-ID: <20250117002520.627504-6-afd@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 00:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15703

ONNX provides an open source format for AI models, both deep learning
and traditional ML. It defines an extensible computation graph model,
as well as definitions of built-in operators and standard data types.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...age-Protobuf-before-checking-if-it-w.patch |  25 ++++
 .../recipes-framework/onnx/onnx_1.16.1.bb     | 107 ++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
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
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
new file mode 100644
index 00000000..9624d061
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
+SRC_URI += "file://0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch"
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
+PACKAGE_BEFORE_PN += "${PYTHON_PN}-${PN}"
+FILES:${PYTHON_PN}-${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PYTHON_PN}-${PN} += "${PYTHON_RDEPENDS} onnx"
+
+# Output library is unversioned
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+# TODO: ONNXConfig.cmake in package onnx-dev contains reference to TMPDIR
+INSANE_SKIP:${PN}-dev = "buildpaths"
-- 
2.39.2


