Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 249D6529F2
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2020 23:08:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SN6ilJ028580
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 17:06:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582931204;
	bh=I19yAZ5jONEvDILwp4N3bWqLesZkPXsQMxzowdnw234=;
	h=From:To:CC:Subject:Date;
	b=RKFZ4I9IFHGuE8kLJjuutWAJPbnZBYfg25tt0tkYUqP1uKD9nmGySWjyI9IASm/D4
	l/Sh0Au3NJRgcbCVEUHKXN6564BOtZcxWd1zD4Y7ALHVF0GZ+dFVUQw3qUrmi664O6
	vmn1MU2r05/XuTx/j7OIo+T/XExijimyDjyTS4vU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SN6iGu018575
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Feb 2020 17:06:44 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 28 Feb 2020 17:06:44 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 28 Feb 2020 17:06:44 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01SN6hQ4050428; 
	Fri, 28 Feb 2020 17:06:44 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Feb 2020 17:58:58 -0500
Message-ID: <20200228225858.24538-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [zeus/master] [PATCH] tensorflow-lite-demo: Bump SRCREV and add tidl offload support for AM5
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
X-List-Received-Date: Fri, 28 Feb 2020 23:08:46 -0000
Content-Type: text/plain

* Build the demos with tidl offload option for AM5
* Include mobilenet v1 model for demonstrating tidl offload
* Remove the demo scripts under the files directory. The scripts are now
  maintained in the source repo.
* Make adjustments with the updated Makefile

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../files/run_classification.sh               |  7 -----
 .../tensorflow-lite/files/run_segmentation.sh |  8 ------
 .../tensorflow-lite-demo_git.bb               | 27 +++++++++++--------
 3 files changed, 16 insertions(+), 26 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
 delete mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
deleted file mode 100644
index b2ad7fc4..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_classification.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-cd /usr/share/tensorflow-lite/demos
-
-# Run tflite_classification binary with the model, the input image, and the label file specified.
-# Classification label is overlayed with the input image. Right click the image display window to exit.
-./tflite_classification -m ../examples/mobilenet_v1_1.0_224_quant.tflite -i ../examples/grace_hopper.bmp -l ../examples/labels.txt
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh b/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
deleted file mode 100644
index 5caea127..00000000
--- a/meta-arago-extras/recipes-support/tensorflow-lite/files/run_segmentation.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-cd /usr/share/tensorflow-lite/demos
-
-# Run tflite_segmentation binary with the model and the input image specified.
-# The display window shows the input(resized) image, segmentation map, overlay
-# of the former two. Right click the image display window to exit.
-./tflite_segmentation -m ./deeplabv3_257_mv_gpu.tflite -i ./bird_segmentation.bmp
diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
index 9b99b63c..57d6ef20 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-demo_git.bb
@@ -1,33 +1,33 @@
-DESCRIPTION = "Tensorflow Lite Demo with input and display via OpenCV and TIDL acceleration for AM5"
+SUMMARY = "Tensorflow Lite Demo with input and display via OpenCV and TIDL acceleration for AM5"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8927f3331d2b3e321b7dd1925166d25"
 
 DEPENDS = "tensorflow-lite flatbuffers opencv"
+DEPENDS_append_dra7xx = " tidl-api"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PV = "01.00.00"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRC_URI  = "git://git.ti.com/apps/tensorflow-lite-examples.git;protocol=git;branch=${BRANCH} \
             http://storage.googleapis.com/download.tensorflow.org/models/tflite/gpu/deeplabv3_257_mv_gpu.tflite;name=deeplabv3;subdir=${WORKDIR}/model;destsuffix=model \
-            http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data \
-            file://run_classification.sh \
-            file://run_segmentation.sh"
+            http://storage.googleapis.com/download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenetv1;subdir=${WORKDIR}/model;destsuffix=model \
+            http://raw.githubusercontent.com/google-coral/edgetpu/master/test_data/bird_segmentation.bmp;name=bird_segmentation;subdir=${WORKDIR}/test_data;destsuffix=test_data"
 
 SRC_URI[deeplabv3.md5sum] = "4a24db5a5fb05c47586a1197765e8548"
 SRC_URI[deeplabv3.sha256sum] = "68a539782c2c6a72f8aac3724600124a85ed977162b44e84cbae5db717c933c6"
+SRC_URI[mobilenetv1.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
+SRC_URI[mobilenetv1.sha256sum] = "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
 SRC_URI[bird_segmentation.md5sum] = "fc3202ac4e3033b36df3043de6dc32c9"
 SRC_URI[bird_segmentation.sha256sum] = "e43cedd29ab385db787531c8a6cdcb31c5e4292af34f242877ed40611e502670"
 
-SRCREV = "d84f1d43585c0db2fa6a1c15db9145ab53f859ce"
+SRCREV = "bd6a429c21f96d5112e0b6dea44a13b748eefd74"
 
 S = "${WORKDIR}/git"
 
-CXXFLAGS_append = " -O3 -DNDEBUG -fPIC -I${STAGING_INCDIR}"
-LDFLAGS_append = " -L${STAGING_LIBDIR}"
-
 EXTRA_OEMAKE = "\
     'CXX=${CXX}' \
     'CXXFLAGS=${CXXFLAGS}' \
@@ -37,8 +37,12 @@ EXTRA_OEMAKE = "\
     'TARGET=${TARGET_OS}' \
     'TARGET_ARCH=${TARGET_ARCH}'"
 
+EXTRA_OEMAKE += "SYSROOT_INCDIR="${STAGING_INCDIR}" SYSROOT_LIBDIR="${STAGING_LIBDIR}" \
+                 TIDL_API_DIR="${STAGING_DATADIR}/ti/tidl""
+
+TIDL_dra7xx = "yes"
 do_compile() {
-    oe_runmake -f Makefile
+    oe_runmake -f Makefile TIDL_ACC=${TIDL}
 }
 
 do_install() {
@@ -46,8 +50,9 @@ do_install() {
     install -m 0755 ${S}/tflite_classification ${D}${datadir}/tensorflow-lite/demos
     install -m 0755 ${S}/tflite_segmentation ${D}${datadir}/tensorflow-lite/demos
     install -m 0644 ${WORKDIR}/model/deeplabv3_257_mv_gpu.tflite ${D}${datadir}/tensorflow-lite/demos
+    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224.tflite ${D}${datadir}/tensorflow-lite/demos
     install -m 0644 ${WORKDIR}/test_data/bird_segmentation.bmp ${D}${datadir}/tensorflow-lite/demos
-    install -m 0755 ${WORKDIR}/run*.sh ${D}${datadir}/tensorflow-lite/demos
+    install -m 0755 ${S}/scripts/run*.sh ${D}${datadir}/tensorflow-lite/demos
 }
 
 FILES_${PN} = "${datadir}/tensorflow-lite/demos"
-- 
2.17.1


