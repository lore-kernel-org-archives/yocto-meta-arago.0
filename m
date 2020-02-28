Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D3F64529D4
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2020 17:23:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SHLMwo123416
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:21:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582910482;
	bh=Eybj7xaNK9YxsagdL0zGq1tR68cN+MBtFiGSbhnZfRo=;
	h=From:To:CC:Subject:Date;
	b=PM8Z4syejJ7Zz3oj8DXQjeiwcqf4YHZh7MnA9P7eaoTZ4Zm3hV7E9bmlmvtEVm/l+
	BOXEod4WtMXnKw5QJqJ/t0+wT+LrcaX+jrv9/cbTWQfIkcEJd/sS0VbfoDMKGtBD/g
	uKelklNjLPle+5BOYfRQL8Dk13YTSHTvx+ZxHyhw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SHLMxH079380
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 11:21:22 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 28 Feb 2020 11:21:22 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 28 Feb 2020 11:21:22 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01SHLL8h093857; 
	Fri, 28 Feb 2020 11:21:21 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Feb 2020 12:13:31 -0500
Message-ID: <20200228171331.17904-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [zeus/master] [PATCH 2/3 v2] tensorflow-lite-demo: add version 01.00.00
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
X-List-Received-Date: Fri, 28 Feb 2020 17:23:24 -0000
Content-Type: text/plain

* This supports classification and segmentation demos with tensorflow lite models
  running on Arm. It demonstrates the whole pipeline from image/video/camera input,
  to tensorflow lite inference, to display the classification/segemenation results.

* OpenCV is used for capturing the input and displaying the results.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 change: replace "DESCRIPTION" with "SUMMARY"

 .../files/run_classification.sh               |  7 +++
 .../tensorflow-lite/files/run_segmentation.sh |  8 +++
 .../tensorflow-lite-demo_git.bb               | 53 +++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
new file mode 100644
index 00000000..b2ad7fc4
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+cd /usr/share/tensorflow-lite/demos
+
+# Run tflite_classification binary with the model, the input image, and the label file specified.
+# Classification label is overlayed with the input image. Right click the image display window to exit.
+./tflite_classification -m ../examples/mobilenet_v1_1.0_224_quant.tflite -i ../examples/grace_hopper.bmp -l ../examples/labels.txt
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
new file mode 100644
index 00000000..5caea127
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+cd /usr/share/tensorflow-lite/demos
+
+# Run tflite_segmentation binary with the model and the input image specified.
+# The display window shows the input(resized) image, segmentation map, overlay
+# of the former two. Right click the image display window to exit.
+./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i ./bird_segmentation.bmp
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
new file mode 100644
index 00000000..aac5e811
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Tensorflow Lite Demo with input and display via OpenCV and TIDL acceleration for AM5"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8927f3331d2b3e321b7dd1925166d25"
+
+DEPENDS = "tensorflow-lite flatbuffers opencv"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
+
+PV = "01.00.00"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-examples.git;protocol=git;branch=${BRANCH} \
+            http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model;destsuffix=model \
+            http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data \
+            file://run_classification.sh \
+            file://run_segmentation.sh"
+
+SRC_URI[deeplabv3.md5sum] = "4a24db5a5fb05c47586a1197765e8548"
+SRC_URI[deeplabv3.sha256sum] = "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
+SRC_URI[bird_segmentation.md5sum] = "fc3202ac4e3033b36df3043de6dc32c9"
+SRC_URI[bird_segmentation.sha256sum] = "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
+
+SRCREV = "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
+
+S = "${WORKDIR}/git"
+
+CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -I${STAGING_INCDIR}"
+LDFLAGS_append = " -L${STAGING_LIBDIR}"
+
+EXTRA_OEMAKE = "\
+    'CXX=${CXX}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'AR=${AR}' \
+    'LD=${LD}' \
+    'LDFLAGS=${LDFLAGS}' \
+    'TARGET=${TARGET_OS}' \
+    'TARGET_ARCH=${TARGET_ARCH}'"
+
+do_compile() {
+    oe_runmake -f Makefile
+}
+
+do_install() {
+    install -d ${D}${datadir}/tensorflow-lite/demos
+    install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow-lite/demos
+    install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-lite/demos
+    install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite ${D}${datadir}/tensorflow-lite/demos
+    install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp ${D}${datadir}/tensorflow-lite/demos
+    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorflow-lite/demos
+}
+
+FILES_${PN} = "${datadir}/tensorflow-lite/demos"
-- 
2.17.1


