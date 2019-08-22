Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9D24A529C6
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 20:32:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MKVXBO054015
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566505893;
	bh=T5nMnpn7oyc+56EU6TOjloFDY2cZd48XSqaKYLi6l8A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=otLy3iwdAAcFNTVkfHbF/mgpfBszJf4EFjkVEAECT4wMuGRC8JKjUy5SiLvb0LAqW
	nyTeZNnLUSu7Ct6j/4+VSgMH/y6HPsatoQOmpXT8G9bWbumgl4PVBIqX1ES5ZO8pq1
	TKzawLl2zb8xPzsMbOWGkA+Fm/6tijqwFiI5AzQU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MKVW4K101550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:31:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 15:31:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 15:31:32 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MKVVqH015899;
	Thu, 22 Aug 2019 15:31:32 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2019 16:31:26 -0400
Message-ID: <20190822203126.4155-4-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822203126.4155-1-a0271529@ti.com>
References: <20190822203126.4155-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH v2 3/3] tensorflow-lite: add label_image example and install the files to run the example
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
X-List-Received-Date: Thu, 22 Aug 2019 20:32:35 -0000
Content-Type: text/plain

* Patch Makefile to add the label_image example
* Install sample model/image/labels.txt to run the example

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...001-Makefile-add-label_image-example.patch | 89 +++++++++++++++++++
 .../tensorflow-lite/tensorflow-lite_1.12.bb   | 15 +++-
 2 files changed, 100 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch
new file mode 100644
index 00000000..61f821e3
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch
@@ -0,0 +1,89 @@
+From 87cf7e879640436f19f26e338dce6c343c19bfd8 Mon Sep 17 00:00:00 2001
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
+index 16012a3fb1..a5e5cb3fc7 100644
+--- a/tensorflow/contrib/lite/tools/make/Makefile
++++ b/tensorflow/contrib/lite/tools/make/Makefile
+@@ -72,6 +72,11 @@ BENCHMARK_BINARY_NAME := benchmark_model
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
+@@ -108,7 +113,8 @@ $(wildcard tensorflow/contrib/lite/*/*test.cc) \
+ $(wildcard tensorflow/contrib/lite/*/*/*test.cc) \
+ $(wildcard tensorflow/contrib/lite/*/*/*/*test.cc) \
+ $(wildcard tensorflow/contrib/lite/kernels/test_util.cc) \
+-$(MINIMAL_SRCS)
++$(MINIMAL_SRCS) \
++$(LABELIMAGE_SRCS)
+ ifeq ($(BUILD_TYPE),micro)
+ CORE_CC_EXCLUDE_SRCS += \
+ tensorflow/contrib/lite/mmap_allocation.cc \
+@@ -135,6 +141,7 @@ include $(wildcard $(MAKEFILE_DIR)/targets/*_makefile.inc)
+ 
+ ALL_SRCS := \
+ 	$(MINIMAL_SRCS) \
++	$(LABELIMAGE_SRCS) \
+ 	$(PROFILER_SRCS) \
+ 	$(PROFILER_SUMMARY_SRCS) \
+ 	$(TF_LITE_CC_SRCS) \
+@@ -150,6 +157,7 @@ LIB_PATH := $(LIBDIR)$(LIB_NAME)
+ BENCHMARK_LIB := $(LIBDIR)$(BENCHMARK_LIB_NAME)
+ BENCHMARK_BINARY := $(BINDIR)$(BENCHMARK_BINARY_NAME)
+ MINIMAL_BINARY := $(BINDIR)minimal
++LABELIMAGE_BINARY := $(BINDIR)label_image
+ 
+ CXX := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}g++
+ CC := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}gcc
+@@ -158,6 +166,9 @@ AR := $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}ar
+ MINIMAL_OBJS := $(addprefix $(OBJDIR), \
+ $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(MINIMAL_SRCS))))
+ 
++LABELIMAGE_OBJS := $(addprefix $(OBJDIR), \
++$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(LABELIMAGE_SRCS))))
++
+ LIB_OBJS := $(addprefix $(OBJDIR), \
+ $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(TF_LITE_CC_SRCS))))
+ 
+@@ -174,7 +185,7 @@ $(OBJDIR)%.o: %.c
+ 	$(CC) $(CCFLAGS) $(INCLUDES) -c $< -o $@
+ 
+ # The target that's compiled if there's no command-line arguments.
+-all: $(LIB_PATH)  $(MINIMAL_BINARY) $(BENCHMARK_BINARY)
++all: $(LIB_PATH)  $(MINIMAL_BINARY) $(LABELIMAGE_BINARY) $(BENCHMARK_BINARY)
+ 
+ # The target that's compiled for micro-controllers
+ micro: $(LIB_PATH)
+@@ -198,6 +209,12 @@ $(BENCHMARK_LIB) : $(LIB_PATH) $(BENCHMARK_OBJS)
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
index 38df078f..b393f7eb 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -30,12 +30,17 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r1.12;protocol=http
     https://mirror.bazel.build/github.com/google/farmhash/archive/816a4ae622e964763ca0862d9dbd19324a1eaf45.tar.gz;md5sum=${MD5SUM_FARMHASH};sha256sum=${SHA256SUM_FARMHASH} \
     https://github.com/google/flatbuffers/archive/1f5eae5d6a135ff6811724f6c57f911d1f46bb15.tar.gz;md5sum=${MD5SUM_FLATBUFFER};sha256sum=${SHA256SUM_FLATBUFFER} \
     https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;md5sum=${MD5SUM_FFT};sha256sum=${SHA256SUM_FFT} \
+    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
     file://apply-modification-for-tflite-1.12-to-eigen.patch \
+    file://0001-Makefile-add-label_image-example.patch \
     file://tensorflow-lite.pc.in"
 
+SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
+SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
+
 SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/git"
 
@@ -118,12 +123,14 @@ do_install() {
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


