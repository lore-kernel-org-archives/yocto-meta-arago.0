Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3D8CE520E2
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 21:00:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MKxptU061652
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566507591;
	bh=zkModh/mJBzvKiqEjc5Qf/trbfbDgnmKZ8gWbC8DOKY=;
	h=From:To:CC:Subject:Date;
	b=sYyhE3WzKFc6ypYrTxRdTLu0ePBi5bsd6lXNTtLv9FfXtYTlXe0ZHjuy2cknEPKR2
	/ul9zlYF5kx09T8RHBc/0JMNdlZTF4o77ELeivMKRd69Mj+VWqIbrocwGliCQZ1xh1
	891awfPM8jxqnrnbdGBNmurJnKEsunDfk7SNZgAI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MKxpRe011510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:59:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 15:59:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 15:59:50 -0500
Received: from UDA0869574A.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MKxocE007688;
	Thu, 22 Aug 2019 15:59:50 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2019 16:59:29 -0400
Message-ID: <20190822205929.13175-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH v2] armnn: add installation of header files and .so links
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
X-List-Received-Date: Thu, 22 Aug 2019 21:00:51 -0000
Content-Type: text/plain

* Install header files that are needed to build tidl-api examples
* Add armnn-dev to packagegroups to include armnn*.so links in file system for building armnn applications on the target
* Rename TESTVECS_INSTALL_DIR to ARMNN_INSTALL_DIR

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../packagegroup-arago-tisdk-addons.bb        |  5 +++-
 .../recipes-support/armnn/armnn_git.bb        | 25 +++++++++++++------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index eb39cadf..ac3835bd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -147,7 +147,10 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = "armnn"
+ARMNN_PACKAGES = " \
+    armnn \
+    armnn-dev \
+"
 
 EXTRA_PACKAGES_append_ti33x = " voxelsdk \
                                 arm-compute-library \
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 076ea3aa..76875ee3 100644
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
+    cp $CP_ARGS ${WORKDIR}/git/include ${D}${ARMNN_INSTALL_DIR}
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


