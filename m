Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 297FE5297F
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 11:48:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KBm5As023359
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 06:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561031285;
	bh=PNcjOQDNP2aABcrnbZ260+LOq9hAiS/0XRIymtrimPU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H9NB84eFkxMI6fsrtj2UUrYktRsbuOFgA4m1tyW8ZsskeTJ6JmQPR7lS9ec883/kO
	zH1ZFuArsixa9bwt9lo2PjeH2j8ZmGmNQKc+ji7YiSfmsLdTJlWbSo2SiWtcPTqgQr
	+/RBuxipxP1VRrj1Q8yo9i71Yo18gX8q5oFIlIjk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KBm5ER007527
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 06:48:05 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 06:48:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 06:48:05 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KBm3u1048192;
	Thu, 20 Jun 2019 06:48:05 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 02:38:14 -0400
Message-ID: <20190620063815.18898-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190620063815.18898-1-x0157990@ti.com>
References: <20190620063815.18898-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH v2 2/3] demo-glow: Add mnist inference demo based on GLOW compiler
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
X-List-Received-Date: Thu, 20 Jun 2019 11:48:47 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-apps/demo-glow/demo-glow.bb       | 46 +++++++++++++++++++
 .../files/0001-fix-missing-string.patch       | 10 ++++
 .../demo-glow/files/Makefile.build            | 18 ++++++++
 .../recipes-apps/demo-glow/files/makefile     | 13 ++++++
 4 files changed, 87 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/demo-glow/demo-glow.bb
 create mode 100644 meta-arago-extras/recipes-apps/demo-glow/files/0001-fix-missing-string.patch
 create mode 100644 meta-arago-extras/recipes-apps/demo-glow/files/Makefile.build
 create mode 100644 meta-arago-extras/recipes-apps/demo-glow/files/makefile

diff --git a/meta-arago-extras/recipes-apps/demo-glow/demo-glow.bb b/meta-arago-extras/recipes-apps/demo-glow/demo-glow.bb
new file mode 100644
index 00000000..c7422948
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/demo-glow/demo-glow.bb
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
diff --git a/meta-arago-extras/recipes-apps/demo-glow/files/0001-fix-missing-string.patch b/meta-arago-extras/recipes-apps/demo-glow/files/0001-fix-missing-string.patch
new file mode 100644
index 00000000..ba0533ab
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/demo-glow/files/0001-fix-missing-string.patch
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
diff --git a/meta-arago-extras/recipes-apps/demo-glow/files/Makefile.build b/meta-arago-extras/recipes-apps/demo-glow/files/Makefile.build
new file mode 100644
index 00000000..399cc3c0
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/demo-glow/files/Makefile.build
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
diff --git a/meta-arago-extras/recipes-apps/demo-glow/files/makefile b/meta-arago-extras/recipes-apps/demo-glow/files/makefile
new file mode 100644
index 00000000..01b19c8c
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/demo-glow/files/makefile
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
-- 
2.17.1


