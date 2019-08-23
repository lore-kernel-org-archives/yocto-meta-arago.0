Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4E37B529FE
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 14:00:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NDx02T077117
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566568740;
	bh=3YNvGsJkoAFctblvrPZebX0L5Dlqzta3vJUc6pcLZN4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rCyDrXL8IO4vaU38fPkFQ8VxbGvnsA0p2g0BFirKyuFU5MXeFYD0OYH6hJVAwofmK
	f4vG0ulAHpfdcoFUEfpsBI/uYTItYC9nf/HlBLAUh0aQ/uaIV5p1adIc2D34YfVs9k
	wR8//1CXmgnP7Qmtt3YnLzajC8bZs9KTv6JPCL30=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NDx0LL097971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:59:00 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 08:58:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 23 Aug 2019 08:58:59 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NDwwUa118791;
	Fri, 23 Aug 2019 08:58:59 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Aug 2019 09:58:55 -0400
Message-ID: <20190823135856.8053-5-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823135856.8053-1-x0157990@ti.com>
References: <20190823135856.8053-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCHv2 4/5] demo-glow: Restore in top-level makefile examples after recipe cleanup
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
X-List-Received-Date: Fri, 23 Aug 2019 14:00:01 -0000
Content-Type: text/plain

- demo-glow is added back to top level example-applications

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-apps/demo-glow/demo-glow.bb              | 16 +++++++++-------
 recipes-apps/demo-glow/files/Makefile.build      |  3 ++-
 .../ti-tisdk-makefile_1.0.bbappend               |  4 ++++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/recipes-apps/demo-glow/demo-glow.bb b/recipes-apps/demo-glow/demo-glow.bb
index 21d6bdf..76bd224 100644
--- a/recipes-apps/demo-glow/demo-glow.bb
+++ b/recipes-apps/demo-glow/demo-glow.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PV = "1.0"
 PR = "r1" 
 
-DEPENDS    = "glow-native libpng"
+DEPENDS    = "glow-native libpng protobuf-native "
 
 SRC_URI = "https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/examples/bundles/lenet_mnist/main.cpp;name=lenet_mnist_main;subdir=src \
            file://0001-fix-missing-string.patch \
@@ -23,6 +23,8 @@ SRC_URI[lenet_mnist_license.md5sum] = "86d3f3a95c324c9479bd8986968f4327"
 
 S = "${WORKDIR}/src"
 
+CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
 do_compile() {
    install -d ${WORKDIR}/build
    LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}/usr/lib ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
@@ -32,12 +34,12 @@ do_compile() {
 do_install () {
    install -d ${D}${datadir}/glow/infer
    install -d ${D}${datadir}/glow/tests
-   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/*.weights ${D}${datadir}/glow/infer
-   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/infer_mnist ${D}${datadir}/glow/infer
-   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/lenet_mnist.o ${D}${datadir}/glow/infer
-   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/makefile ${D}${datadir}/glow/infer
-   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/main.cpp ${D}${datadir}/glow/infer
-   cp -Prf --preserve=mode,timestamps ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/*.png ${D}${datadir}/glow/tests/.
+   cp ${CP_ARGS} ${WORKDIR}/build/*.weights ${D}${datadir}/glow/infer
+   cp $(CP_ARGS) ${WORKDIR}/build/infer_mnist ${D}${datadir}/glow/infer
+   cp ${CP_ARGS} ${WORKDIR}/build/lenet_mnist.o ${D}${datadir}/glow/infer
+   cp ${CP_ARGS} ${WORKDIR}/src/makefile ${D}${datadir}/glow/infer
+   cp ${CP_ARGS} ${WORKDIR}/src/main.cpp ${D}${datadir}/glow/infer
+   cp ${CP_ARGS} ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/*.png ${D}${datadir}/glow/tests/.
 }
 
 FILES_${PN} += "${datadir}/glow"
diff --git a/recipes-apps/demo-glow/files/Makefile.build b/recipes-apps/demo-glow/files/Makefile.build
index 044bbf9..baf1fc0 100644
--- a/recipes-apps/demo-glow/files/Makefile.build
+++ b/recipes-apps/demo-glow/files/Makefile.build
@@ -6,7 +6,8 @@ DESTDIR ?=
 all: release
 
 lenet_mnist:
-	LD_LIBRARY_PATH=${SDK_PATH_NATIVE}/usr/lib ${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+	@. ${ENV_SETUP}; \
+	${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
 
 release: lenet_mnist
 	@. ${ENV_SETUP}; \
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index acd396b..ead9d53 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -10,6 +10,7 @@ SRC_URI_append = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_tidl-examples \
     file://Makefile_pru-adc \
+    file://Makefile_demo-glow \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -29,13 +30,16 @@ MAKEFILES_append_omap-a15 = " dual-camera-demo \
 "
 
 MAKEFILES_append_omap-a15 = " video-graphics-test \
+                              demo-glow \
 "
 
 MAKEFILES_append_ti43x = " evse-hmi \
+                           demo-glow \
 "
 
 MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
+                           demo-glow \
 "
 
 MAKEFILES_append_k3 = " evse-hmi"
-- 
2.17.1


