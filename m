Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2B1015298F
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2019 18:08:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RI7PQK117608
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 13:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561658845;
	bh=RDoT7dPOu47l0q7sZAdjK90jzklWF5Zb82Ptwq2FZOw=;
	h=From:To:CC:Subject:Date;
	b=ZRLdMK5h3cwmC725gBg/39ikb7rP/OKm0/aB3svIbgRqTrUWmS3ibhXaTj6L+VWK8
	7ZEES1gaadFT1uR2G055/pcGXjtTIXxt+u8AOde+FpRN8pLsYRRQAvX1Qc5yii+ZC6
	HaK7XdMbLx35HUKqQfDgvEJ3ACTcfdHs1ebJf7Hk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RI7Prm042203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 13:07:25 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 27 Jun 2019 13:07:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 27 Jun 2019 13:07:25 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RI7Oba060940;
	Thu, 27 Jun 2019 13:07:24 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Jun 2019 09:03:37 -0400
Message-ID: <20190627130337.18049-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] demo-glow: Fix environment setup and add install option
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
X-List-Received-Date: Thu, 27 Jun 2019 18:08:09 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-apps/demo-glow/files/Makefile.build | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/recipes-apps/demo-glow/files/Makefile.build b/recipes-apps/demo-glow/files/Makefile.build
index 399cc3c..5011914 100644
--- a/recipes-apps/demo-glow/files/Makefile.build
+++ b/recipes-apps/demo-glow/files/Makefile.build
@@ -6,7 +6,8 @@ DESTDIR ?=
 all: release
 
 lenet_mnist:
-	${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
+	@. ${ENV_SETUP}; \
+	LD_LIBRARY_PATH=${SDK_PATH_NATIVE}/usr/lib  ${SDK_PATH_NATIVE}/usr/share/glow/bin/image-classifier ${SDK_PATH_NATIVE}/usr/share/glow/tests/images/mnist/1_1008.png -m=mnist.onnx -image-mode=0to1 -model-input-name=data_0 -emit-bundle ./ -cpu -target armv7l-unknown-linux-gnueabihf   -network-name="lenet_mnist"
 
 release: lenet_mnist
 	@. ${ENV_SETUP}; \
@@ -16,3 +17,18 @@ clean:
 	@. ${ENV_SETUP}; \
         make clean
 	rm lenet_mnist.*
+
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


