Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E07CE520DD
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2019 14:09:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79E8PqJ009113
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2019 09:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565359705;
	bh=ryZasjSC+TjNB/QUpLB5guROCYHqdots/TC4GFFCmy0=;
	h=From:To:CC:Subject:Date;
	b=EhtAYWySW20YMlk+JKsFmTDq+edTSxv0jKgLHEhNkNSE8zI82jEXldPU6Jsddo385
	dbwQJ6KanZB4f7ar+mL+754nlgzY+0WVFUH4cIGHT1SKQgqgf2baHtI+wK/gW4mfif
	jH1xpTa3g3Eh/SO298vYW6LUFx5nJlXLZeEJWo6c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79E8PZj002583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2019 09:08:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 9 Aug 2019 09:08:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 9 Aug 2019 09:08:25 -0500
Received: from UDA0869574A.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79E8Ole034769;
	Fri, 9 Aug 2019 09:08:25 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Aug 2019 10:07:58 -0400
Message-ID: <20190809140758.15280-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH] armnn: add installation of header files
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
X-List-Received-Date: Fri, 09 Aug 2019 14:09:22 -0000
Content-Type: text/plain

* Install header files that are needed to build tidl-api examples
* Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 076ea3aa..7ad41d2d 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -65,25 +65,34 @@ EXTRA_OECMAKE=" \
     -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
 "
 
-TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
+ARMNN_INSTALL_DIR = "${datadir}/arm/armnn"
 
 do_install_append() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${bindir}
     find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
     cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
-    install -d ${D}${TESTVECS_INSTALL_DIR}/models
-    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
-    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
-    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
-    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
-    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${TESTVECS_INSTALL_DIR}/testvecs
+    install -d ${D}${ARMNN_INSTALL_DIR}/models
+    cp ${WORKDIR}/tfmodel/mobilenet_v1_1.0_224_frozen.pb  ${D}${ARMNN_INSTALL_DIR}/models
+    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${ARMNN_INSTALL_DIR}/models
+    install -d ${D}${ARMNN_INSTALL_DIR}/testvecs
+    cp ${WORKDIR}/tidl-api/examples/classification/clips/*.mp4  ${D}${ARMNN_INSTALL_DIR}/testvecs
+    cp ${WORKDIR}/tidl-api/examples/classification/images/*.jpg  ${D}${ARMNN_INSTALL_DIR}/testvecs
+    cp -r ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
+    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnn
+    cp ${WORKDIR}/git/src/armnn/*.hpp ${D}${ARMNN_INSTALL_DIR}/src/armnn
+    install -d ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
+    cp ${WORKDIR}/git/src/armnnUtils/{CsvReader.hpp,HeapProfiling.hpp,Logging.hpp,TensorIOUtils.hpp} ${D}${ARMNN_INSTALL_DIR}/src/armnnUtils
+    install -d ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
+    cp ${WORKDIR}/git/src/backends/backendsCommon/BackendRegistry.hpp ${D}${ARMNN_INSTALL_DIR}/src/backends/backendsCommon
+    install -d ${D}${ARMNN_INSTALL_DIR}/tests
+    cp ${WORKDIR}/git/tests/{InferenceModel.hpp,InferenceTest.hpp,InferenceTest.inl} ${D}${ARMNN_INSTALL_DIR}/tests
     chrpath -d ${D}${bindir}/*
 }
 
 CXXFLAGS += "-fopenmp"
 LIBS += "-larmpl_lp64_mp"
 
-FILES_${PN} += "${TESTVECS_INSTALL_DIR}"
+FILES_${PN} += "${ARMNN_INSTALL_DIR}"
 FILES_${PN}-dev += "{libdir}/cmake/*"
 INSANE_SKIP_${PN}-dev = "dev-elf"
-- 
2.17.1


