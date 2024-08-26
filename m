Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071CCC5473B
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:16:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.61242.1724699780762179962
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25C0440CC2;
	Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJqzxsEdDCwL; Mon, 26 Aug 2024 19:16:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 17D5240CC4;
	Mon, 26 Aug 2024 19:16:18 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B3B43164066;
	Mon, 26 Aug 2024 15:16:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 06/16] tensorflow-lite: remove
Date: Mon, 26 Aug 2024 15:15:55 -0400
Message-Id: <20240826191605.8190-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826191605.8190-1-denis@denix.org>
References: <20240826191605.8190-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15520

From: Denys Dmytriyenko <denys@konsulko.com>

Remove local copy of an old and outdated tensorflow-lite component.

There are much newer versions of this component available from other laye=
rs.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |   8 --
 ...akefile-add-label_image-example-1.15.patch |  82 -----------
 ...odification-for-tflite-1.15-to-eigen.patch |  16 ---
 .../files/tensorflow-lite.pc.in               |   6 -
 .../tensorflow-lite/files/tflite-benchmark.sh |  59 --------
 .../tensorflow-lite-demo_git.bb               |  64 ---------
 .../tensorflow-lite/tensorflow-lite_1.15.bb   | 133 ------------------
 7 files changed, 368 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/fil=
es/0001-Makefile-add-label_image-example-1.15.patch
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/fil=
es/apply-modification-for-tflite-1.15-to-eigen.patch
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/fil=
es/tensorflow-lite.pc.in
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/fil=
es/tflite-benchmark.sh
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/ten=
sorflow-lite-demo_git.bb
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/ten=
sorflow-lite_1.15.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-tisdk-addons-sdk-target.bb
index e91f33c9..3e0a2720 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons-sdk-target.bb
@@ -38,23 +38,15 @@ PDM_ANOMALY_PKG_DEV =3D "\
=20
 EXTRA_PACKAGES =3D ""
 #EXTRA_PACKAGES:append:ti33x =3D " \
-#                                tensorflow-lite-dev \
-#                                tensorflow-lite-staticdev \
 #                                ${PDM_ANOMALY_PKG_DEV} \
 #"
 #EXTRA_PACKAGES:append:ti43x =3D " \
-#                                tensorflow-lite-dev \
-#                                tensorflow-lite-staticdev \
 #                                ${PDM_ANOMALY_PKG_DEV} \
 #"
 #EXTRA_PACKAGES:append:omap-a15 =3D " \
-#                                tensorflow-lite-dev \
-#                                tensorflow-lite-staticdev \
 #                                ${PDM_ANOMALY_PKG_DEV} \
 #"
 #EXTRA_PACKAGES:append:am65xx =3D " \
-#                             tensorflow-lite-dev \
-#                             tensorflow-lite-staticdev \
 #                             ${PDM_ANOMALY_PKG_DEV} \
 #"
=20
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001=
-Makefile-add-label_image-example-1.15.patch b/meta-arago-extras/recipes-=
support/tensorflow-lite/files/0001-Makefile-add-label_image-example-1.15.=
patch
deleted file mode 100644
index ef5e1cbf..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefi=
le-add-label_image-example-1.15.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 481c021e98c443195b73484fd0d9d50a2e0ae69a Mon Sep 17 00:00:00 2001
-From: Hongmei Gou <a0271529@ti.com>
-Date: Wed, 25 Sep 2019 18:07:04 -0400
-Subject: [PATCH] Makefile: add label_image example
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongmei Gou <a0271529@ti.com>
----
- tensorflow/lite/tools/make/Makefile | 21 ++++++++++++++++++++-
- 1 file changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/tensorflow/lite/tools/make/Makefile b/tensorflow/lite/tools=
/make/Makefile
-index 73c50d3272..e2f664e1eb 100644
---- a/tensorflow/lite/tools/make/Makefile
-+++ b/tensorflow/lite/tools/make/Makefile
-@@ -201,6 +201,12 @@ BENCHMARK_SRCS :=3D $(filter-out \
- 	$(BENCHMARK_SRCS_DIR)/benchmark_plus_flex_main.cc, \
- 	$(BENCHMARK_ALL_SRCS))
-=20
-+# label image example
-+LABELIMAGE_SRCS :=3D \
-+	tensorflow/lite/examples/label_image/bitmap_helpers.cc \
-+	tensorflow/lite/examples/label_image/label_image.cc \
-+	$(EVALUATION_UTILS_SRCS)
-+
- # These target-specific makefiles should modify or replace options like
- # CXXFLAGS or LIBS to work for a specific targetted architecture. All l=
ogic
- # based on platforms or architectures should happen within these files,=
 to
-@@ -209,6 +215,7 @@ include $(wildcard $(MAKEFILE_DIR)/targets/*_makefil=
e.inc)
-=20
- ALL_SRCS :=3D \
- 	$(MINIMAL_SRCS) \
-+	$(LABELIMAGE_SRCS) \
- 	$(PROFILER_SRCS) \
- 	$(PROFILER_SUMMARIZER_SRCS) \
- 	$(TF_LITE_CC_SRCS) \
-@@ -225,6 +232,7 @@ LIB_PATH :=3D $(LIBDIR)$(LIB_NAME)
- BENCHMARK_LIB :=3D $(LIBDIR)$(BENCHMARK_LIB_NAME)
- BENCHMARK_BINARY :=3D $(BINDIR)$(BENCHMARK_BINARY_NAME)
- MINIMAL_BINARY :=3D $(BINDIR)minimal
-+LABELIMAGE_BINARY :=3D $(BINDIR)label_image
-=20
- CXX :=3D $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}g++
- CC :=3D $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}gcc
-@@ -233,6 +241,9 @@ AR :=3D $(CC_PREFIX)${TARGET_TOOLCHAIN_PREFIX}ar
- MINIMAL_OBJS :=3D $(addprefix $(OBJDIR), \
- $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(MINIMAL_SRCS))))
-=20
-+LABELIMAGE_OBJS :=3D $(addprefix $(OBJDIR), \
-+$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(LABELIMAGE_SRCS))))
-+
- LIB_OBJS :=3D $(addprefix $(OBJDIR), \
- $(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(TF_LITE_C=
C_SRCS)))))
-=20
-@@ -252,7 +263,7 @@ $(OBJDIR)%.o: %.cpp
- 	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@
-=20
- # The target that's compiled if there's no command-line arguments.
--all: $(LIB_PATH)  $(MINIMAL_BINARY) $(BENCHMARK_BINARY)
-+all: $(LIB_PATH)  $(MINIMAL_BINARY) $(LABELIMAGE_BINARY) $(BENCHMARK_BI=
NARY)
-=20
- # The target that's compiled for micro-controllers
- micro: $(LIB_PATH)
-@@ -276,6 +287,14 @@ $(MINIMAL_BINARY): $(MINIMAL_OBJS) $(LIB_PATH)
-=20
- minimal: $(MINIMAL_BINARY)
-=20
-+$(LABELIMAGE_BINARY): $(LABELIMAGE_OBJS) $(LIB_PATH)
-+	@mkdir -p $(dir $@)
-+	$(CXX) $(CXXFLAGS) $(INCLUDES) \
-+	-o $(LABELIMAGE_BINARY) $(LABELIMAGE_OBJS) \
-+	$(LIBFLAGS) $(LIB_PATH) $(LDFLAGS) $(LIBS)
-+
-+label_image: $(LABELIMAGE_BINARY)
-+
- $(BENCHMARK_LIB) : $(LIB_PATH) $(BENCHMARK_OBJS)
- 	@mkdir -p $(dir $@)
- 	$(AR) $(ARFLAGS) $(BENCHMARK_LIB) $(LIB_OBJS) $(BENCHMARK_OBJS)
---=20
-2.17.1
-
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/appl=
y-modification-for-tflite-1.15-to-eigen.patch b/meta-arago-extras/recipes=
-support/tensorflow-lite/files/apply-modification-for-tflite-1.15-to-eige=
n.patch
deleted file mode 100644
index 491dcbfa..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modif=
ication-for-tflite-1.15-to-eigen.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-Upstream-Status: Inappropriate [arago specific]
-
-diff --git a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/a=
rch/NEON/Complex.h b/tensorflow/lite/tools/make/downloads/eigen/Eigen/src=
/Core/arch/NEON/Complex.h
-index 306a309beb..4527a64c91 100644
---- a/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEO=
N/Complex.h
-+++ b/tensorflow/lite/tools/make/downloads/eigen/Eigen/src/Core/arch/NEO=
N/Complex.h
-@@ -307,7 +307,7 @@
-   static uint64x2_t p2ul_CONJ_XOR =3D {0x0, 0x8000000000000000};
- #else
-   const uint64_t  p2ul_conj_XOR_DATA[] =3D { 0x0, 0x8000000000000000 };
--  static uint64x2_t p2ul_CONJ_XOR =3D vld1q_u64( p2ul_conj_XOR_DATA );
-+  static uint64x2_t p2ul_CONJ_XOR;// =3D vld1q_u64( p2ul_conj_XOR_DATA =
); - Removed by script
- #endif
-
- struct Packet1cd
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/tens=
orflow-lite.pc.in b/meta-arago-extras/recipes-support/tensorflow-lite/fil=
es/tensorflow-lite.pc.in
deleted file mode 100644
index 44afd0ee..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/tensorflow-=
lite.pc.in
+++ /dev/null
@@ -1,6 +0,0 @@
- Name: tensorflow lite
- Description: tensorflow lite static library
- Version: @version@
- Requires:
- Libs: -L@libdir@ -ltensorflow-lite
- Cflags: -I@includedir@
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/tfli=
te-benchmark.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files=
/tflite-benchmark.sh
deleted file mode 100644
index 868b6c08..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/tflite-benc=
hmark.sh
+++ /dev/null
@@ -1,59 +0,0 @@
-#!/bin/sh
-
-#list of model packages
-declare -a model_list=3D(
-"http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_=
v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz"
-"http://storage.googleapis.com/download.tensorflow.org/models/tflite_11_=
05_08/mobilenet_v2_1.0_224_quant.tgz"
-"http://storage.googleapis.com/download.tensorflow.org/models/inception_=
v1_224_quant_20181026.tgz"
-"http://storage.googleapis.com/download.tensorflow.org/models/inception_=
v2_224_quant_20181026.tgz"
-"http://storage.googleapis.com/download.tensorflow.org/models/tflite_11_=
05_08/inception_v3_quant.tgz"
-"http://storage.googleapis.com/download.tensorflow.org/models/inception_=
v4_299_quant_20181026.tgz"
-"http://storage.googleapis.com/download.tensorflow.org/models/tflite/coc=
o_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip"
-)
-
-# create a new directory to host and unpack the models
-rm -rf ~/tflite-benchmark
-mkdir ~/tflite-benchmark
-
-# Set maximal number of threads to the number of arm cores
-max_num_threads=3D`nproc`
-
-# TFLite install dir on filesystem
-tflite_install_dir=3D$(find /usr/share -maxdepth 1 -type d -name "tensor=
flow-lite*")
-
-for model_link in "${model_list[@]}"
-do
-  # download the model package to modeldir
-  modelpkg=3D"${model_link##*/}"
-  modeldir=3D"${modelpkg%.*}"
-
-  mkdir ~/tflite-benchmark/$modeldir
-  cd ~/tflite-benchmark/$modeldir
-
-  echo "Downloading $modelpkg..."
-  wget "$model_link"
-  if [[ $? -ne 0 ]]; then
-    echo "wget failed. Set up http proxy as needed before running the sc=
ripts!"
-    exit 1
-  fi
-
-  # unpack the model package
-  if [[ $modelpkg =3D~ \.tgz$ ]]; then
-    tar -xzvf $modelpkg
-  fi
-  if [[ $modelpkg =3D~ \.zip$ ]]; then
-    unzip $modelpkg
-  fi
-
-  # run benchmark for the model
-  for model in *.tflite; do
-    for num_threads in $( seq 1 $max_num_threads )
-      do
-        echo "Running benchmark_model for $model with $num_threads threa=
d(s)..."
-        $tflite_install_dir/examples/benchmark_model --graph=3D${model} =
--num_threads=3D$num_threads --enable_op_profiling=3Dtrue > ${modeldir}_t=
hread_${num_threads}.log
-        cat ${modeldir}_thread_${num_threads}.log | grep Timings
-      done
-  done
-done
-
-echo "Benchmarking completed!"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow=
-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/ten=
sorflow-lite-demo_git.bb
deleted file mode 100644
index fcbc84ab..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-d=
emo_git.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY =3D "Tensorflow Lite Demo with input and display via OpenCV and =
TIDL acceleration for AM5"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8927f3331d2b3e321b7dd1925166=
d25"
-
-inherit features_check
-
-REQUIRED_DISTRO_FEATURES =3D "opencv"
-REQUIRED_DISTRO_FEATURES:append:dra7xx =3D " opencl"
-
-DEPENDS =3D "tensorflow-lite flatbuffers opencv"
-DEPENDS:append:dra7xx =3D " tidl-api"
-
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-PV =3D "01.00.00"
-PR =3D "r1"
-
-BRANCH =3D "master"
-SRC_URI  =3D "git://git.ti.com/git/apps/tensorflow-lite-examples.git;pro=
tocol=3Dhttps;branch=3D${BRANCH} \
-            http://storage.googleapis.com/download.tensorflow.org/models=
/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=3Ddeeplabv3;subdir=3D${WORKD=
IR}/model;destsuffix=3Dmodel \
-            http://storage.googleapis.com/download.tensorflow.org/models=
/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=3Dmobilenetv1;subd=
ir=3D${WORKDIR}/model;destsuffix=3Dmodel \
-            http://raw.githubusercontent.com/google-coral/edgetpu/master=
/test_data/bird_segmentation.bmp;name=3Dbird_segmentation;subdir=3D${WORK=
DIR}/test_data;destsuffix=3Dtest_data"
-
-SRC_URI[deeplabv3.md5sum] =3D "4a24db5a5fb05c47586a1197765e8548"
-SRC_URI[deeplabv3.sha256sum] =3D "68a539782c2c6a72f8aac3724600124a85ed97=
7162b44e84cbae5db717c933c6"
-SRC_URI[mobilenetv1.md5sum] =3D "d5f69cef81ad8afb335d9727a17c462a"
-SRC_URI[mobilenetv1.sha256sum] =3D "1ccb74dbd9c5f7aea879120614e91617db95=
34bdfaa53dfea54b7c14162e126b"
-SRC_URI[bird_segmentation.md5sum] =3D "fc3202ac4e3033b36df3043de6dc32c9"
-SRC_URI[bird_segmentation.sha256sum] =3D "e43cedd29ab385db787531c8a6cdcb=
31c5e4292af34f242877ed40611e502670"
-
-SRCREV =3D "bd6a429c21f96d5112e0b6dea44a13b748eefd74"
-
-S =3D "${WORKDIR}/git"
-
-EXTRA_OEMAKE =3D "\
-    'CXX=3D${CXX}' \
-    'CXXFLAGS=3D${CXXFLAGS}' \
-    'AR=3D${AR}' \
-    'LD=3D${LD}' \
-    'LDFLAGS=3D${LDFLAGS}' \
-    'TARGET=3D${TARGET_OS}' \
-    'TARGET_ARCH=3D${TARGET_ARCH}'"
-
-EXTRA_OEMAKE +=3D "SYSROOT_INCDIR=3D"${STAGING_INCDIR}" SYSROOT_LIBDIR=3D=
"${STAGING_LIBDIR}" \
-                 TIDL_API_DIR=3D"${STAGING_DATADIR}/ti/tidl""
-
-TIDL =3D "no"
-TIDL:dra7xx =3D "yes"
-do_compile() {
-    oe_runmake -f Makefile TIDL_ACC=3D${TIDL}
-}
-
-do_install() {
-    install -d ${D}${datadir}/tensorflow-lite/demos
-    install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow=
-lite/demos
-    install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-l=
ite/demos
-    install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite ${D}${d=
atadir}/tensorflow-lite/demos
-    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224.tflite ${D}${d=
atadir}/tensorflow-lite/demos
-    install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp ${D}${dat=
adir}/tensorflow-lite/demos
-    install -m 0755 ${S}/scripts/run*.sh ${D}${datadir}/tensorflow-lite/=
demos
-}
-
-FILES:${PN} =3D "${datadir}/tensorflow-lite/demos"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow=
-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorf=
low-lite_1.15.bb
deleted file mode 100644
index e4a1ec85..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1=
.15.bb
+++ /dev/null
@@ -1,133 +0,0 @@
-DESCRIPTION =3D "TensorFlow's lightweight solution for mobile and embedd=
ed devices"
-AUTHOR =3D "Google Inc. and Yuan Tang"
-HOMEPAGE =3D "https://www.tensorflow.org/lite"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64a34301f8e355f57ec992c2af3e5=
157"
-
-MD5SUM_EIGEN =3D "a28a728acb3298471b11132ab5c0c3cb"
-SHA256SUM_EIGEN =3D "7e7a57e33c59280a17a66e521396cd8b1a55d0676c9f8070785=
22fda52114b5c"
-MD5SUM_FFT =3D "4255dd8a74949d123216b1ab91520469"
-SHA256SUM_FFT =3D "52bb637c70b971958ec79c9c8752b1df5ff0218a4db4510e60826=
e0cb79b5296"
-
-SRC_URI =3D "git://github.com/tensorflow/tensorflow.git;branch=3Dr${PV};=
rev=3D590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b;protocol=3Dhttps \
-    https://bitbucket.org/eigen/eigen/get/8071cda5714d.tar.gz;md5sum=3D$=
{MD5SUM_EIGEN};sha256sum=3D${SHA256SUM_EIGEN} \
-    git://github.com/google/gemmlowp;destsuffix=3Dgemmlowp/;branch=3Dmas=
ter;rev=3D12fed0cd7cfcd9e169bf1925bc3a7a58725fdcc3;protocol=3Dhttps \
-    git://github.com/google/googletest;destsuffix=3Dgoogletest/;branch=3D=
master;rev=3Drelease-1.8.0;protocol=3Dhttps \
-    git://github.com/abseil/abseil-cpp;destsuffix=3Dabseil-cpp/;branch=3D=
master;rev=3D43ef2148c0936ebf7cb4be6b19927a9d9d145b8f;nobranch=3D1;protoc=
ol=3Dhttps \
-    git://github.com/intel/ARM_NEON_2_x86_SSE;destsuffix=3Dneon_2_sse/;b=
ranch=3Dmaster;rev=3D3057bb91b99bae9c7fbdf8710c032d462ca10051;protocol=3D=
https \
-    git://github.com/google/farmhash;destsuffix=3Dfarmhash/;branch=3Dmas=
ter;rev=3D816a4ae622e964763ca0862d9dbd19324a1eaf45;protocol=3Dhttps \
-    git://github.com/google/flatbuffers;destsuffix=3Dflatbuffers/;branch=
=3Dmaster;rev=3Dv1.11.0;protocol=3Dhttps \
-    https://mirror.bazel.build/www.kurims.kyoto-u.ac.jp/~ooura/fft.tgz;m=
d5sum=3D${MD5SUM_FFT};sha256sum=3D${SHA256SUM_FFT} \
-    http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobile=
net_v1_1.0_224_quant.tgz;name=3Dmobilenet_v1_quant;subdir=3D${WORKDIR}/mo=
del;destsuffix=3Dmodel \
-    file://apply-modification-for-tflite-${PV}-to-eigen.patch \
-    file://0001-Makefile-add-label_image-example-${PV}.patch \
-    file://tflite-benchmark.sh \
-    file://tensorflow-lite.pc.in"
-
-SRCREV_FORMAT=3D"tensorflow_gemmlowp_googletest_abseil-cpp_ARM_NEON_2_x8=
6_SSE_farmhash_flatbuffers"
-
-SRC_URI[mobilenet_v1_quant.md5sum] =3D "36af340c00e60291931cb30ce32d4e86=
"
-SRC_URI[mobilenet_v1_quant.sha256sum] =3D "d32432d28673a936b2d6281ab0600=
c71cf7226dfe4cdcef3012555f691744166"
-
-PR =3D "r5"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "zlib"
-TARGET_CFLAGS:remove =3D "-O2"
-TARGET_CPPFLAGS:remove =3D "-O2"
-TARGET_CXXFLAGS:remove =3D "-O2"
-CFLAGS:append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALL=
BACK \
-    -I${STAGING_INCDIR}"
-CPPFLAGS:append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FA=
LLBACK \
-    -I${STAGING_INCDIR}"
-LDFLAGS:remove =3D "-Wl,-O1"
-CXXFLAGS:append =3D " -O3 -DNDEBUG -fPIC -DGEMMLOWP_ALLOW_SLOW_SCALAR_FA=
LLBACK \
-    -I${STAGING_INCDIR}"
-LIBS =3D "-lstdc++ -lpthread -lm -lz -ldl -lrt"
-BUILD_DEPS_DOWNLOAD_DIR_PREFIX =3D "${S}/tensorflow/lite/tools/make/down=
loads/"
-
-do_cp_downloaded_build_deps() {
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}eigen
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}gemmlowp
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}googletest
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}absl
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}farmhash
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}neon_2_sse
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}flatbuffers
-    mkdir -p ${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fft2d
-
-    cp -rf ${WORKDIR}/eigen-eigen-8071cda5714d/* "${BUILD_DEPS_DOWNLOAD_=
DIR_PREFIX}eigen"
-    cp -rf ${WORKDIR}/gemmlowp/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}ge=
mmlowp/"
-    cp -rf ${WORKDIR}/googletest/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}go=
ogletest/"
-    cp -rf ${WORKDIR}/abseil-cpp/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}ab=
sl/"
-    cp -rf ${WORKDIR}/farmhash/*    "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fa=
rmhash/"
-    cp -rf ${WORKDIR}/neon_2_sse/*  "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}ne=
on_2_sse/"
-    cp -rf ${WORKDIR}/flatbuffers/* "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}fl=
atbuffers/"
-    cp -rf ${WORKDIR}/fft/*         "${BUILD_DEPS_DOWNLOAD_DIR_PREFIX}ff=
t2d"
-}
-addtask do_cp_downloaded_build_deps after do_unpack before do_patch
-
-EXTRA_OEMAKE =3D "\
-    'CC=3D${CC}' \
-    'CXX=3D${CXX}' \
-    'CPP=3D${CPP}' \
-    'CFLAGS=3D${CFLAGS}' \
-    'CPPFLAGS=3D${CPPFLAGS}' \
-    'CXXFLAGS=3D${CXXFLAGS}' \
-    'AR=3D${AR}' \
-    'LD=3D${LD}' \
-    'LDFLAGS=3D${LDFLAGS}' \
-    'LIBS=3D${LIBS}' \
-    'TARGET=3D${TARGET_OS}' \
-    'TARGET_ARCH=3D${TUNE_ARCH}'"
-
-do_compile() {
-    oe_runmake -f tensorflow/lite/tools/make/Makefile
-}
-
-do_install() {
-    install -d ${D}${libdir}
-    install -m 0644 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${T=
UNE_ARCH}/lib/*.a ${D}${libdir}/
-    install -d ${D}${includedir}/tensorflow/lite
-    install -m 0644 ${S}/tensorflow/lite/*.h ${D}${includedir}/tensorflo=
w/lite/
-    install -d ${D}${includedir}/tensorflow/lite/c
-    install -m 0644 ${S}/tensorflow/lite/c/*.h ${D}${includedir}/tensorf=
low/lite/c/
-    install -d ${D}${includedir}/tensorflow/lite/core/
-    install -m 0644 ${S}/tensorflow/lite/core/*.h ${D}${includedir}/tens=
orflow/lite/core/
-    install -d ${D}${includedir}/tensorflow/lite/core/api/
-    install -m 0644 ${S}/tensorflow/lite/core/api/*.h ${D}${includedir}/=
tensorflow/lite/core/api/
-    install -d ${D}${includedir}/tensorflow/lite/kernels
-    install -m 0644 ${S}/tensorflow/lite/kernels/*.h ${D}${includedir}/t=
ensorflow/lite/kernels/
-    install -d  ${D}${includedir}/tensorflow/lite/profiling/
-    install -m 0644 ${S}/tensorflow/lite/profiling/*.h ${D}${includedir}=
/tensorflow/lite/profiling/
-    install -d ${D}${includedir}/tensorflow/lite/schema/
-    install -m 0644 ${S}/tensorflow/lite/schema/*.h ${D}${includedir}/te=
nsorflow/lite/schema/
-    install -m 0644 ${S}/tensorflow/lite/schema/schema.fbs ${D}${include=
dir}/tensorflow/lite/schema/
-    install -d ${D}${includedir}/tensorflow/lite/tools/
-    install -m 0644 ${S}/tensorflow/lite/tools/*.h ${D}${includedir}/ten=
sorflow/lite/tools/
-    install -d ${D}${includedir}/tensorflow/lite/delegates/nnapi/
-    install -m 0644 ${S}/tensorflow/lite/delegates/nnapi/*.h ${D}${inclu=
dedir}/tensorflow/lite/delegates/nnapi/
-    install -d ${D}${includedir}/tensorflow/lite/experimental/resource_v=
ariable/
-    install -m 0644 ${S}/tensorflow/lite/experimental/resource_variable/=
*.h ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
-    install -d ${D}${includedir}/tensorflow/lite/kernels/internal/
-    install -m 0644 ${S}/tensorflow/lite/kernels/internal/*.h ${D}${incl=
udedir}/tensorflow/lite/kernels/internal/
-
-    install -d ${D}${libdir}/pkgconfig
-    install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgco=
nfig/tensorflow-lite.pc
-    sed -i 's:@version@:${PV}:g
-        s:@libdir@:${libdir}:g
-        s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorfl=
ow-lite.pc
-    # install examples
-    install -d ${D}${datadir}/${BPN}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${T=
UNE_ARCH}/bin/minimal ${D}${datadir}/${BPN}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${T=
UNE_ARCH}/bin/benchmark_model ${D}${datadir}/${BPN}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${T=
UNE_ARCH}/bin/label_image ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/g=
race_hopper.bmp ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.t=
xt ${D}${datadir}/${BPN}/examples
-    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite $=
{D}${datadir}/${BPN}/examples
-    # install scripts for benchmarking
-    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}=
/examples
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


