Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 493DB52995
	for <meta-arago@arago-project.org>;
	Fri, 28 Jun 2019 20:05:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SK4nE7128807
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 15:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561752289;
	bh=UHKxW0ZUJUF872Itd5Xolm+iK4Li7yADY8ILVi1VF0M=;
	h=From:To:CC:Subject:Date;
	b=MCGnE0UuRwkHGmwGaMcD4aLqsT+dsEzp+Q32FdHdaD1DuSys3Qf2uUorqdGDK+/eM
	wmIRZOwb7HXlQYv9mqJWCSEO5PUXxUg8PiQJqsZvjTQS4SziOmZt2BwJZnVShKEQNf
	5jxTWJNSUKEYnxUjbhrWg012GaTYdGd+ofOhKatk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SK4nQk123193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 28 Jun 2019 15:04:49 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 15:04:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 15:04:47 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SK4lQK056391;
	Fri, 28 Jun 2019 15:04:47 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Jun 2019 11:00:57 -0400
Message-ID: <20190628150057.25929-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v2] HACK: demo-glow: Fix environment setup and add install option
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
X-List-Received-Date: Fri, 28 Jun 2019 20:05:33 -0000
Content-Type: text/plain

- Add make install for demo-glow in example-applications
- Workaournd issue with dynamic library path for glow executable

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-apps/demo-glow/demo-glow.bb         |  2 +-
 recipes-apps/demo-glow/files/Makefile.build | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/recipes-apps/demo-glow/demo-glow.bb b/recipes-apps/demo-glow/demo-glow.bb
index c742294..21d6bdf 100644
--- a/recipes-apps/demo-glow/demo-glow.bb
+++ b/recipes-apps/demo-glow/demo-glow.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/src"
 
 do_compile() {
    install -d ${WORKDIR}/build
-   ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+   LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}/usr/lib ${STAGING_DIR_NATIVE}/usr/share/glow/bin/image-classifier ${STAGING_DIR_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ${WORKDIR}/build/ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
    ${CXX} ${S}/main.cpp ${WORKDIR}/build/lenet_mnist.o -lm -lpng -fpack-struct=8 -fpermissive -o ${WORKDIR}/build/infer_mnist
 }
 
diff --git a/recipes-apps/demo-glow/files/Makefile.build b/recipes-apps/demo-glow/files/Makefile.build
index 399cc3c..044bbf9 100644
--- a/recipes-apps/demo-glow/files/Makefile.build
+++ b/recipes-apps/demo-glow/files/Makefile.build
@@ -6,7 +6,7 @@ DESTDIR ?=
 all: release
 
 lenet_mnist:
-	${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+	LD_LIBRARY_PATH=${SDK_PATH_NATIVE}/usr/lib ${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
 
 release: lenet_mnist
 	@. ${ENV_SETUP}; \
@@ -16,3 +16,17 @@ clean:
 	@. ${ENV_SETUP}; \
         make clean
 	rm lenet_mnist.*
+
+install:
+	@if [ ! -d $(DESTDIR) ] ; then \
+		echo "The extracted target filesystem directory doesn't exist."; \
+		echo "Please run setup.sh in the SDK's root directory and then try again."; \
+		exit 1; \
+	fi
+	@install -d ${DESTDIR}/usr/share/glow/infer
+	cp -Prf --preserve=mode,timestamps makefile ${DESTDIR}/usr/share/glow/infer
+	cp -Prf --preserve=mode,timestamps main.cpp ${DESTDIR}/usr/share/glow/infer
+	cp -Prf --preserve=mode,timestamps *.weights ${DESTDIR}/usr/share//glow/infer
+	cp -Prf --preserve=mode,timestamps lenet_mnist.o ${DESTDIR}/usr/share/glow/infer
+	cp -Prf --preserve=mode,timestamps infer_mnist ${DESTDIR}/usr/share/glow/infer
+
-- 
2.17.1


