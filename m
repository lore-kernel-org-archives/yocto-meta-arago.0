Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5108952999
	for <meta-arago@arago-project.org>;
	Thu,  8 Aug 2019 19:33:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x78JWA1w009528
	for <meta-arago@arago-project.org>; Thu, 8 Aug 2019 14:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565292730;
	bh=DzUGA+LMQD9L2/dEY0fjqsGMC/587kzhV3kkRKAYO9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EBgUfAklsBNaY+Miv+taQmNyEm4AmNASj1ajm3EIhXVPftQ8PeAmFSucznD6vpYme
	NqHvg/4DCPb3T9G0icz6l/UaVWt4iRB+mxEeg0gYkfBL65bKpR0EK+UDFxjgKUwgZ3
	YU80j3UEyU8a6k8/+VhdMbdyC+mY4l3XB2t8pngA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x78JWA1q063056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 8 Aug 2019 14:32:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 8 Aug 2019 14:32:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 8 Aug 2019 14:32:09 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x78JW8IK032505;
	Thu, 8 Aug 2019 14:32:09 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Aug 2019 15:32:06 -0400
Message-ID: <20190808193206.16337-2-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808193206.16337-1-x0157990@ti.com>
References: <20190808193206.16337-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 2/2] demo-glow: Cleanup of demo-glow after fixing RPATH issue in nativesdk, and restore glow and demo-glow in packagegroups
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
X-List-Received-Date: Thu, 08 Aug 2019 19:33:06 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-apps/demo-glow/demo-glow.bb                   |  4 ++--
 recipes-apps/demo-glow/files/Makefile.build           |  3 ++-
 .../nativesdk-packagegroup-arago-tisdk-host.bbappend  |  4 ++++
 .../packagegroup-arago-tisdk-addons-sdk-host.bbappend | 11 +++++++++++
 ...ackagegroup-arago-tisdk-addons-sdk-target.bbappend |  6 ++++++
 .../packagegroup-arago-tisdk-addons.bbappend          |  7 +++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend  |  4 ++++
 7 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend

diff --git a/recipes-apps/demo-glow/demo-glow.bb b/recipes-apps/demo-glow/demo-glow.bb
index 21d6bdf..9436349 100644
--- a/recipes-apps/demo-glow/demo-glow.bb
+++ b/recipes-apps/demo-glow/demo-glow.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 PV = "1.0"
 PR = "r1" 
 
-DEPENDS    = "glow-native libpng"
+DEPENDS    = "glow-native libpng protobuf-native "
 
 SRC_URI = "https://raw.githubusercontent.com/pytorch/glow/1af031c9c040dd4ff843d9b50f83e71f6e605631/examples/bundles/lenet_mnist/main.cpp;name=lenet_mnist_main;subdir=src \
            file://0001-fix-missing-string.patch \
@@ -25,7 +25,7 @@ S = "${WORKDIR}/src"
 
 do_compile() {
    install -d ${WORKDIR}/build
-   LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}/usr/lib ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+   ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
    ${CXX} ${S}/main.cpp ${WORKDIR}/build/lenet_mnist.o -lm -lpng -fpack-struct=8 -fpermissive -o ${WORKDIR}/build/infer_mnist
 }
 
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
diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
new file mode 100644
index 0000000..b35282e
--- /dev/null
+++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bbappend
@@ -0,0 +1,4 @@
+PR_append = ".tisdk0"
+
+EXTRA_TI_TOOLS_append = " nativesdk-glow "
+
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
index a8a0b2e..6349bcd 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bbappend
@@ -18,3 +18,14 @@ EXTRA_LIBS_append_dra7xx = " \
 
 UTILS_append_am335x-evm = " pru-adc-src"
 
+EXTRA_PACKAGES_append_omap-a15 = " \
+    demo-glow-src \
+"
+
+EXTRA_PACKAGES_append_ti43x = " \
+    demo-glow-src \
+"
+    
+EXTRA_PACKAGES_append_ti33x = " \
+    demo-glow-src \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
index 08f20e4..6d8a49e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
@@ -77,3 +77,9 @@ EXTRA_LIBS_append_dra7xx = " \
     tiovx-sys-iface \
 "
 
+EXTRA_PACKAGES_append_ti33x = " demo-glow-dev "
+
+EXTRA_PACKAGES_append_ti43x = " demo-glow-dev "
+
+EXTRA_PACKAGES_append_omap-a15 = " demo-glow-dev "
+
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 0cf0322..f365dc6 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -26,3 +26,10 @@ EXTRA_PACKAGES_append_armv7a = " zbar"
 UTILS_append = " net-snmp net-snmp-server-snmpd"
 
 EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples"
+
+EXTRA_PACKAGES_append_ti33x = " demo-glow "
+
+EXTRA_PACKAGES_append_ti43x = " demo-glow "
+
+EXTRA_PACKAGES_append_omap-a15 = " demo-glow "
+
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


