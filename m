Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7028A52988
	for <meta-arago@arago-project.org>;
	Tue, 25 Feb 2020 23:22:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PNK60a125271
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:20:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582672806;
	bh=5RT3g/vzuo4E35LVFgt34c9zzmuEPvhWlSZRkQ9n5zQ=;
	h=From:To:CC:Subject:Date;
	b=Zg7xkTj15Y6HU9fdObtzBuZQjWIINdT3jC4A2A5ceTX2ZOW04KPntE/xSOX05HQbn
	XjLV1+xKIS9oaEDMZopWgAJnAzCoKIksPbYAQQs4g55WG2vsUeskX/Eg0xpaBDOPoJ
	w+uLkrvzwwG3zTrrBYb2PoJJePXDKWQHkJ3J9zM0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PNK62T119970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Feb 2020 17:20:06 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 25 Feb 2020 17:20:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 25 Feb 2020 17:20:06 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PNK5J1105846;
	Tue, 25 Feb 2020 17:20:06 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 25 Feb 2020 18:12:24 -0500
Message-ID: <20200225231226.24898-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [zeus/master] [PATCH 1/3] tensorflow-lite: add header files and change the install location of the example files
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
X-List-Received-Date: Tue, 25 Feb 2020 23:22:08 -0000
Content-Type: text/plain

* The newly added header files are required to build tensorflow lite demos
  outside of the tensorflow lite release package

* Relocate the example files to ${datadir}/${BPN}

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../tensorflow-lite/tensorflow-lite_1.15.bb   | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index b238c85e..5f65055f 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -41,7 +41,7 @@ SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226d
 
 SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
 
-PR = "r3"
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
@@ -105,6 +105,8 @@ do_install() {
     install -m 0644 ${S}/tensorflow/lite/*.h ${D}${includedir}/tensorflow/lite/
     install -d ${D}${includedir}/tensorflow/lite/c
     install -m 0644 ${S}/tensorflow/lite/c/*.h ${D}${includedir}/tensorflow/lite/c/
+    install -d ${D}${includedir}/tensorflow/lite/core/
+    install -m 0644 ${S}/tensorflow/lite/core/*.h ${D}${includedir}/tensorflow/lite/core/
     install -d ${D}${includedir}/tensorflow/lite/core/api/
     install -m 0644 ${S}/tensorflow/lite/core/api/*.h ${D}${includedir}/tensorflow/lite/core/api/
     install -d ${D}${includedir}/tensorflow/lite/kernels
@@ -116,27 +118,28 @@ do_install() {
     install -m 0644 ${S}/tensorflow/lite/schema/schema.fbs ${D}${includedir}/tensorflow/lite/schema/
     install -d ${D}${includedir}/tensorflow/lite/tools/
     install -m 0644 ${S}/tensorflow/lite/tools/*.h ${D}${includedir}/tensorflow/lite/tools/
+    install -d ${D}${includedir}/tensorflow/lite/delegates/nnapi/
+    install -m 0644 ${S}/tensorflow/lite/delegates/nnapi/*.h ${D}${includedir}/tensorflow/lite/delegates/nnapi/
+    install -d ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
+    install -m 0644 ${S}/tensorflow/lite/experimental/resource_variable/*.h ${D}${includedir}/tensorflow/lite/experimental/resource_variable/
+    install -d ${D}${includedir}/tensorflow/lite/kernels/internal/
+    install -m 0644 ${S}/tensorflow/lite/kernels/internal/*.h ${D}${includedir}/tensorflow/lite/kernels/internal/
+
     install -d ${D}${libdir}/pkgconfig
     install -m 0644 ${WORKDIR}/tensorflow-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow-lite.pc
     sed -i 's:@version@:${PV}:g
         s:@libdir@:${libdir}:g
         s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/tensorflow-lite.pc
     # install examples
-    install -d ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${PN}-${PV}/examples
-    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${PN}-${PV}/examples
+    install -d ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/minimal ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/benchmark_model ${D}${datadir}/${BPN}/examples
+    install -m 0755 ${S}/tensorflow/lite/tools/make/gen/${TARGET_OS}_${TUNE_ARCH}/bin/label_image ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${S}/tensorflow/lite/examples/label_image/testdata/grace_hopper.bmp ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${S}/tensorflow/lite/java/ovic/src/testdata/labels.txt ${D}${datadir}/${BPN}/examples
+    install -m 0644 ${WORKDIR}/model/mobilenet_v1_1.0_224_quant.tflite ${D}${datadir}/${BPN}/examples
     # install scripts for benchmarking
-    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${PN}-${PV}/examples
+    install -m 0755 ${WORKDIR}/tflite-benchmark.sh ${D}${datadir}/${BPN}/examples
 }
 
-PACKAGES += "${PN}-examples"
-
-FILES_${PN}-examples = "${datadir}/${PN}-${PV}/examples"
-
-ALLOW_EMPTY_${PN} = "1"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


