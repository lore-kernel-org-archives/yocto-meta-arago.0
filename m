Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A9484520DF
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwMiU085982
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428302;
	bh=irRN+5mUWh/9S2wTNCx8qdO0AaLGnWisqsAtm1wZ+ok=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SZw/DRjtCXL0rX9gmmA+rDxNp7yD3v7JaQpY8wC/TBPFeItqzEEJWevtMqFL7EZHH
	WgL5GJnSAVruX7Jv3dfyJo2CKP7i/sWe0/QZPRlyE+ogmzopRxMXecAbcekebgEf8a
	WoajATzhcigylxSrU1gu78V3eiWIgSwCxbbf0iQ4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwMtC049312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:21 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCi074536;
	Wed, 21 Aug 2019 17:58:21 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:07 -0400
Message-ID: <20190821225807.22947-8-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821225807.22947-1-a0271529@ti.com>
References: <20190821225807.22947-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 7/7] tensorflow-lite: add label_image example and install the files to run the example
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
X-List-Received-Date: Wed, 21 Aug 2019 22:59:24 -0000
Content-Type: text/plain

* Patch Makefile to add the label_image example
* Install sample model/image/labels.txt to run the example

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...002-Makefile-add-label_image-example.patch | 89 +++++++++++++++++++
 .../tensorflow-lite/tensorflow-lite_1.12.bb   | 15 +++-
 2 files changed, 100 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0002-Makefile-add-label_image-example.patch

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/0002-Makefile-add-label_image-example.patch b/meta-arago-extras/recipes-support/tensorflow-lite/files/0002-Makefile-add-label_image-example.patch
new file mode 100644
index 00000000..d3bd2a05
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/0002-Makefile-add-label_image-example.patch
@@ -0,0 +1,89 @@
+From eb4148a4b230cee9b4e3c00d8661653c7b29559a Mon Sep 17 00:00:00 2001
+From: Hongmei Gou <a0271529@ti.com>
+Date: Wed, 21 Aug 2019 18:03:17 -0400
+Subject: [PATCH] Makefile: add label_image example
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongmei Gou <a0271529@ti.com>
+---
+ tensorflow/contrib/lite/tools/make/Makefile | 21 +++++++++++++++++++--
+ 1 file changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/tensorflow/contrib/lite/tools/make/Makefile b/tensorflow/contrib/lite/tools/make/Makefile
+index 8b1b05b280..1af726e2a3 100644
+--- a/tensorflow/contrib/lite/tools/make/Makefile
++++ b/tensorflow/contrib/lite/tools/make/Makefile
+@@ -71,6 +71,11 @@ BENCHMARK_BINARY_NAME := benchmark_model
+ MINIMAL_SRCS := \
+ tensorflow/contrib/lite/examples/minimal/minimal.cc
+ 
++# label image example
++LABELIMAGE_SRCS := \
++tensorflow/contrib/lite/examples/label_image/bitmap_helpers.cc \
++tensorflow/contrib/lite/examples/label_image/label_image.cc
++
+ # What sources we want to compile, must be kept in sync with the main Bazel
+ # build files.
+ 
+@@ -107,7 +112,8 @@ $(wildcard tensorflow/contrib/lite/*/*test.cc) \
+ $(wildcard tensorflow/contrib/lite/*/*/*test.cc) \
+ $(wildcard tensorflow/contrib/lite/*/*/*/*test.cc) \
+ $(wildcard tensorflow/contrib/lite/kernels/test_util.cc) \
+-$(MINIMAL_SRCS)
++$(MINIMAL_SRCS) \
++$(LABELIMAGE_SRCS)
+ ifeq ($(BUILD_TYPE),micro)
+ CORE_CC_EXCLUDE_SRCS += \
+ tensorflow/contrib/lite/mmap_allocation.cc \
+@@ -134,6 +140,7 @@ include $(wildcard $(MAKEFILE_DIR)/targets/*_makefile.inc)
+ 
+ ALL_SRCS := \
+ 	$(MINIMAL_SRCS) \
++	$(LABELIMAGE_SRCS) \
+ 	$(PROFILER_SRCS) \
+ 	$(PROFILER_SUMMARY_SRCS) \
+ 	$(TF_LITE_CC_SRCS) \
+@@ -149,6 +156,7 @@ LIB_PATH := $(LIBDIR)$(LIB_NAME)
+ BENCHMARK_LIB := $(LIBDIR)$(BENCHMARK_LIB_NAME)
+ BENCHMARK_BINARY := $(BINDIR)$(BENCHMARK_BINARY_NAME)
+ MINIMAL_BINARY := $(BINDIR)minimal
++LABELIMAGE_BINARY := $(BINDIR)label_image
+ 
+ CXX := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}g++
+ CC := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}gcc
+@@ -157,6 +165,9 @@ AR := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}ar
+ MINIMAL_OBJS := $(addprefix $(OBJDIR), \
+ $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(MINIMAL_SRCS))))
+ 
++LABELIMAGE_OBJS := $(addprefix $(OBJDIR), \
++$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(LABELIMAGE_SRCS))))
++
+ LIB_OBJS := $(addprefix $(OBJDIR), \
+ $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(TF_LITE_CC_SRCS))))
+ 
+@@ -173,7 +184,7 @@ $(OBJDIR)%.o: %.c
+ 	$(CC) $(CCFLAGS) $(INCLUDES) -c $< -o $@
+ 
+ # The target that's compiled if there's no command-line arguments.
+-all: $(LIB_PATH)  $(MINIMAL_BINARY) $(BENCHMARK_BINARY)
++all: $(LIB_PATH)  $(MINIMAL_BINARY) $(LABELIMAGE_BINARY) $(BENCHMARK_BINARY)
+ 
+ # The target that's compiled for micro-controllers
+ micro: $(LIB_PATH)
+@@ -197,6 +208,12 @@ $(BENCHMARK_LIB) : $(LIB_PATH) $(BENCHMARK_OBJS)
+ 	@mkdir -p $(dir $@)
+ 	$(AR) $(ARFLAGS) $(BENCHMARK_LIB) $(LIB_OBJS) $(BENCHMARK_OBJS)
+ 
++$(LABELIMAGE_BINARY): $(LABELIMAGE_OBJS) $(LIB_PATH)
++	@mkdir -p $(dir $@)
++	$(CXX) $(CXXFLAGS) $(INCLUDES) \
++	-o $(LABELIMAGE_BINARY) $(LABELIMAGE_OBJS) \
++	$(LIBFLAGS) $(LIB_PATH) $(LDFLAGS) $(LIBS)
++
+ benchmark_lib: $(BENCHMARK_LIB)
+ 
+ $(BENCHMARK_BINARY) : $(BENCHMARK_LIB)
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
index 20f0ffed..6f0254ef 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -5,12 +5,17 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
 
 SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=https \
+    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
     file://0001-Makefile-update-the-path-for-the-depedencies-built-v.patch \
+    file://0002-Makefile-add-label_image-example.patch \
     file://tensorflow-lite.pc.in"
 
+SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
+SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
+
 SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/git"
 
@@ -75,12 +80,14 @@ do_install() {
     install -d ${D}${datadir}/${PN}-${PV}/examples
     install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${PN}-${PV}/examples
     install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${S}/tensorflow/contrib/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0644 ${S}/tensorflow/contrib/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0644 ${S}/tensorflow/contrib/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${PN}-${PV}/examples
 }
 
 PACKAGES += "${PN}-examples"
 
-FILES_${PN}-examples = " \
-    ${datadir}/${PN}-${PV}/examples/minimal \
-    ${datadir}/${PN}-${PV}/examples/benchmark_model \ "
+FILES_${PN}-examples = "${datadir}/${PN}-${PV}/examples"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.17.1


