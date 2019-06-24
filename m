Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D09195299F
	for <meta-arago@arago-project.org>;
	Mon, 24 Jun 2019 10:01:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OA0YE8053899
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 05:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561370434;
	bh=QuVF430wnOEkRUfZ3kO+KZ6dGBGH6EFDsHEb/rfwyv8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Uyz3D+2zyXfzZp4HNj84zGFtbK9X6bJ9iJiJZszXi233dqCDI7/amNlRJX9F/SS7J
	eJiGF4fhEkV1UrFBzrHO8+xtkgm0RztLK0+pAdMO3ef4CHVeA8ZE0a++VBNuafV7N6
	K070Z/Jjm3XzU0DSviZupXDSwAjOmvL0oS+3YuOs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OA0Yh8112771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 05:00:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 05:00:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 05:00:33 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OA0Wqx029540;
	Mon, 24 Jun 2019 05:00:33 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 00:56:50 -0400
Message-ID: <20190624045651.17223-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624045651.17223-1-x0157990@ti.com>
References: <20190624045651.17223-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v3 2/3] demo-glow: Add mnist inference demo based on GLOW compiler
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
X-List-Received-Date: Mon, 24 Jun 2019 10:01:17 -0000
Content-Type: text/plain

- Add mnist based example to target filesystem
- Add mnist based example to example-applications

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-apps/demo-glow/demo-glow.bb           | 46 +++++++++++++++++++
 .../files/0001-fix-missing-string.patch       | 10 ++++
 recipes-apps/demo-glow/files/Makefile.build   | 18 ++++++++
 recipes-apps/demo-glow/files/makefile         | 13 ++++++
 .../ti-tisdk-makefile/Makefile_demo-glow      | 19 ++++++++
 .../ti-tisdk-makefile_1.0.bbappend            | 10 +++-
 6 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 recipes-apps/demo-glow/demo-glow.bb
 create mode 100644 recipes-apps/demo-glow/files/0001-fix-missing-string.patch
 create mode 100644 recipes-apps/demo-glow/files/Makefile.build
 create mode 100644 recipes-apps/demo-glow/files/makefile
 create mode 100644 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow

diff --git a/recipes-apps/demo-glow/demo-glow.bb b/recipes-apps/demo-glow/demo-glow.bb
new file mode 100644
index 0000000..c742294
--- /dev/null
+++ b/recipes-apps/demo-glow/demo-glow.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "Demo application based on pytorch neural network compiler glow, using mnist model" 
+HOMEPAGE = "https://github.com/pytorch/glow/tree/master/examples/bundles/lenet_mnist"
+SECTION = "examples" 
+LICENSE = "Apache-2.0" 
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+PV = "1.0"
+PR = "r1" 
+
+DEPENDS    = "glow-native libpng"
+
+SRC_URI = "https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/examples/bundles/lenet_mnist/main.cpp;name=lenet_mnist_main;subdir=src \
+           file://0001-fix-missing-string.patch \
+           file://makefile;subdir=src \
+           file://Makefile.build;subdir=src \
+           http://fb-glow-assets.s3.amazonaws.com/models/lenet_mnist.tar.gz;name=lenet_mnist;subdir=src \
+           https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/LICENSE;name=lenet_mnist_license;subdir=src \
+          "
+
+SRC_URI[lenet_mnist.md5sum] = "7aded5f273b3198795683c238492d1a9"
+SRC_URI[lenet_mnist_main.md5sum] = "e80ec7a97dec86828ff1a51026c237bc"
+SRC_URI[lenet_mnist_license.md5sum] = "86d3f3a95c324c9479bd8986968f4327"
+
+S = "${WORKDIR}/src"
+
+do_compile() {
+   install -d ${WORKDIR}/build
+   ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+   ${CXX} ${S}/main.cpp ${WORKDIR}/build/lenet_mnist.o -lm -lpng -fpack-struct=8 -fpermissive -o ${WORKDIR}/build/infer_mnist
+}
+
+do_install () {
+   install -d ${D}${datadir}/glow/infer
+   install -d ${D}${datadir}/glow/tests
+   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/*.weights ${D}${datadir}/glow/infer
+   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/infer_mnist ${D}${datadir}/glow/infer
+   cp -Prf --preserve=mode,timestamps ${WORKDIR}/build/lenet_mnist.o ${D}${datadir}/glow/infer
+   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/makefile ${D}${datadir}/glow/infer
+   cp -Prf --preserve=mode,timestamps ${WORKDIR}/src/main.cpp ${D}${datadir}/glow/infer
+   cp -Prf --preserve=mode,timestamps ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/*.png ${D}${datadir}/glow/tests/.
+}
+
+FILES_${PN} += "${datadir}/glow"
+
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
diff --git a/recipes-apps/demo-glow/files/0001-fix-missing-string.patch b/recipes-apps/demo-glow/files/0001-fix-missing-string.patch
new file mode 100644
index 0000000..ba0533a
--- /dev/null
+++ b/recipes-apps/demo-glow/files/0001-fix-missing-string.patch
@@ -0,0 +1,10 @@
+--- ./main.cpp	2019-06-06 13:31:07.485528729 -0400
++++ ./main_mod.cpp	2019-06-06 13:30:50.333529003 -0400
+@@ -18,6 +18,7 @@
+ #include <png.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ 
+ #include <string>
+ #include <vector>
diff --git a/recipes-apps/demo-glow/files/Makefile.build b/recipes-apps/demo-glow/files/Makefile.build
new file mode 100644
index 0000000..399cc3c
--- /dev/null
+++ b/recipes-apps/demo-glow/files/Makefile.build
@@ -0,0 +1,18 @@
+-include ../../Rules.make
+
+ENV_SETUP ?= ../../linux-devkit/environment-setup
+DESTDIR ?=
+
+all: release
+
+lenet_mnist:
+	${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+
+release: lenet_mnist
+	@. ${ENV_SETUP}; \
+	make
+
+clean:
+	@. ${ENV_SETUP}; \
+        make clean
+	rm lenet_mnist.*
diff --git a/recipes-apps/demo-glow/files/makefile b/recipes-apps/demo-glow/files/makefile
new file mode 100644
index 0000000..01b19c8
--- /dev/null
+++ b/recipes-apps/demo-glow/files/makefile
@@ -0,0 +1,13 @@
+PHONY: all
+
+all: infer_mnist
+LIBS = -lm -lpng
+
+infer_mnist: main.cpp lenet_mnist.o
+	$(CXX) main.cpp lenet_mnist.o -o infer_mnist $(LIBS) $(CXXFLAGS) -fpack-struct=8 -fpermissive
+
+clean:
+	rm -rf infer_mnist
+
+test:
+	./infer_mnist ../tests/0_1009.png
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
new file mode 100644
index 0000000..96ede6a
--- /dev/null
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
@@ -0,0 +1,19 @@
+# barcode-roi build targets
+
+demo-glow:
+	@echo =============================
+	@echo    Building Demo GLOW
+	@echo =============================
+	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build release
+
+demo-glow_clean:
+	@echo =============================
+	@echo    Cleaning Demo GLOW
+	@echo =============================
+	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build clean
+
+demo-glow_install:
+	@echo ================================================
+	@echo   Installing Demo Glow - Release version
+	@echo ================================================
+	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build install
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 7898454..249cc03 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -11,6 +11,7 @@ SRC_URI_append = "\
     file://Makefile_tiovx-app-host \
     file://Makefile_tidl-examples \
     file://Makefile_pru-adc \
+    file://Makefile_demo-glow \
 "
 
 SRC_URI_append_omap-a15 = " file://Makefile_big-data-ipc-demo"
@@ -38,12 +39,17 @@ MAKEFILES_append_omapl138 = " ti-ipc \
 MAKEFILES_remove_omapl138 = "pru"
 MAKEFILES_remove_omapl138 = "u-boot-legacy"
 
-MAKEFILES_append_omap-a15 = " video-graphics-test"
+MAKEFILES_append_omap-a15 = " video-graphics-test \
+                              demo-glow \
+"
 
-MAKEFILES_append_ti43x = " evse-hmi"
+MAKEFILES_append_ti43x = " evse-hmi \
+                           demo-glow \
+"
 
 MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
+                           demo-glow \
 "
 
 MAKEFILES_append_k3 = " evse-hmi"
-- 
2.17.1


