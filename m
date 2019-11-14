Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BB53B52988
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 00:05:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE04Wso118000
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 18:04:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573689872;
	bh=I128KQUDzYlNREHCNhMSZwpuR+Ye7AE43v0hKSA06Lk=;
	h=From:To:CC:Subject:Date;
	b=v4baXALIX0W6c+EwzlfyI5hUwVWB/SG3qZGqo0bcDMDxIlN6CTCl+xd+TzniDM8yx
	AMZdShCszWEBnQOOG+v56vglAiOXLElMztJQM4zqenG5xOTCb78Qhx4JsQPLmYhZkG
	Dxqv7X3OmRfYnFpczpy7GV4cBATSBuRN302SbffA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE04We4042511
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 18:04:32 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 13 Nov 2019 18:04:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 13 Nov 2019 18:04:27 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE04WxZ065815;
	Wed, 13 Nov 2019 18:04:32 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Nov 2019 19:01:02 -0500
Message-ID: <20191114000102.9800-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 2/3 v3] tensorflow-lite: add scripts for benchmarking
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
X-List-Received-Date: Thu, 14 Nov 2019 00:05:58 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v3 changes:
Install benchmarking scripts as part of tensorflow-lite-examples

 .../tensorflow-lite/files/tflite-benchmark.sh | 59 +++++++++++++++++++
 .../tensorflow-lite/tensorflow-lite_1.15.bb   |  5 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/tflite-benchmark.sh

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/tflite-benchmark.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/tflite-benchmark.sh
new file mode 100644
index 00000000..868b6c08
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/tflite-benchmark.sh
@@ -0,0 +1,59 @@
+#!/bin/sh
+
+#list of model packages
+declare -a model_list=(
+"http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz"
+"http://storage.googleapis.com/download.tensorflow.org/models/tflite_11_05_08/mobilenet_v2_1.0_224_quant.tgz"
+"http://storage.googleapis.com/download.tensorflow.org/models/inception_v1_224_quant_20181026.tgz"
+"http://storage.googleapis.com/download.tensorflow.org/models/inception_v2_224_quant_20181026.tgz"
+"http://storage.googleapis.com/download.tensorflow.org/models/tflite_11_05_08/inception_v3_quant.tgz"
+"http://storage.googleapis.com/download.tensorflow.org/models/inception_v4_299_quant_20181026.tgz"
+"http://storage.googleapis.com/download.tensorflow.org/models/tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29.zip"
+)
+
+# create a new directory to host and unpack the models
+rm -rf ~/tflite-benchmark
+mkdir ~/tflite-benchmark
+
+# Set maximal number of threads to the number of arm cores
+max_num_threads=`nproc`
+
+# TFLite install dir on filesystem
+tflite_install_dir=$(find /usr/share -maxdepth 1 -type d -name "tensorflow-lite*")
+
+for model_link in "${model_list[@]}"
+do
+  # download the model package to modeldir
+  modelpkg="${model_link##*/}"
+  modeldir="${modelpkg%.*}"
+
+  mkdir ~/tflite-benchmark/$modeldir
+  cd ~/tflite-benchmark/$modeldir
+
+  echo "Downloading $modelpkg..."
+  wget "$model_link"
+  if [[ $? -ne 0 ]]; then
+    echo "wget failed. Set up http proxy as needed before running the scripts!"
+    exit 1
+  fi
+
+  # unpack the model package
+  if [[ $modelpkg =~ \.tgz$ ]]; then
+    tar -xzvf $modelpkg
+  fi
+  if [[ $modelpkg =~ \.zip$ ]]; then
+    unzip $modelpkg
+  fi
+
+  # run benchmark for the model
+  for model in *.tflite; do
+    for num_threads in $( seq 1 $max_num_threads )
+      do
+        echo "Running benchmark_model for $model with $num_threads thread(s)..."
+        $tflite_install_dir/examples/benchmark_model --graph=${model} --num_threads=$num_threads --enable_op_profiling=true > ${modeldir}_thread_${num_threads}.log
+        cat ${modeldir}_thread_${num_threads}.log | grep Timings
+      done
+  done
+done
+
+echo "Benchmarking completed!"
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index c676177b..9d07b11b 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};protocol=htt
     http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz;name=mobilenet_v1_quant;subdir=${WORKDIR}/model;destsuffix=model \
     file://apply-modification-for-tflite-${PV}-to-eigen.patch \
     file://0001-Makefile-add-label_image-example-${PV}.patch \
+    file://tflite-benchmark.sh \
     file://tensorflow-lite.pc.in"
 
 SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
@@ -40,7 +41,7 @@ SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226d
 
 SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -128,6 +129,8 @@ do_install() {
     install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${PN}-${PV}/examples
     install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${PN}-${PV}/examples
     install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${PN}-${PV}/examples
+    # install scripts for benchmarking
+    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${PN}-${PV}/examples
 }
 
 PACKAGES += "${PN}-examples"
-- 
2.17.1


