Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0C70B52988
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2019 17:56:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADHt4K7081245
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 11:55:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573667704;
	bh=nFtbq//OG7XiL00bWWoTTsCfpi+Wwv/EOaCwj/0mPCA=;
	h=From:To:CC:Subject:Date;
	b=UJ9o5bukbicyhR+n+R2QfKpICVdu8667Iw3aDko9+DJG2wCOT1pWDQUTdfqhtuAE7
	+jh41nzGcbJa/1nk+BNinDyhr3y1jajYhw3QezHVQqUtW+/e3Gfk6gkekVw6YBdPvB
	43ukS4yOBsUSG3V7pvjcVP0lq55lNdmpLEafOl+E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADHt32x012887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 13 Nov 2019 11:55:04 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 13 Nov 2019 11:54:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 13 Nov 2019 11:54:45 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADHt2TE129327;
	Wed, 13 Nov 2019 11:55:02 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Nov 2019 12:51:35 -0500
Message-ID: <20191113175135.5948-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 2/3 v2] tensorflow-lite: add scripts for benchmarking
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
X-List-Received-Date: Wed, 13 Nov 2019 17:56:29 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes:
Remove proxy option when running wget. Instead, prompt user to set up
proxy before running the scripts if wget fails.

 .../tensorflow-lite/files/tflite-benchmark.sh | 59 +++++++++++++++++++
 .../tensorflow-lite/tensorflow-lite_1.15.bb   |  6 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
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
index c676177b..aade3a1d 100644
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
 
@@ -128,6 +129,9 @@ do_install() {
     install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${PN}-${PV}/examples
     install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${PN}-${PV}/examples
     install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${PN}-${PV}/examples
+    # install scripts for benchmarking
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}/${bindir}
 }
 
 PACKAGES += "${PN}-examples"
-- 
2.17.1


