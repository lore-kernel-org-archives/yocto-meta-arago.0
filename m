Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 29E2A5299C
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 15:59:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IFwjv4129588
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 10:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568822325;
	bh=0UTt+AHZt2C0fqPFmi0n2OR+6G66a5hvBayUYC2F3w4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=v+1kyksN4HHyXZdlMSfAtXOAf5Am3YKxBtUrAkUgMeeMswaKv+G98X2TM2/jcWkWZ
	4gAprmGvDslcQ+67HJIcmKneozpF1tB8SfnIJc3kcN1TNk14wY4JzvymZSVBbxEaJ4
	/z3GUWvgvXKVbyrIAXMYOtmAZCGwLmlVMJIvvrk8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IFwjB4113536
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 10:58:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 10:58:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 10:58:41 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IFwXr7003038;
	Wed, 18 Sep 2019 10:58:43 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Sep 2019 11:57:18 -0400
Message-ID: <20190918155718.29523-3-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918155718.29523-1-a0271529@ti.com>
References: <20190918155718.29523-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 3/3] armnn: build armnn with TensorFlow Lite support
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
X-List-Received-Date: Wed, 18 Sep 2019 15:59:53 -0000
Content-Type: text/plain

* mobilenet_v2_1.0_224.tflite is also installed for using TFLite with ArmnnExamples

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...sioned-library-for-armnnTfLiteParser.patch | 25 +++++++++++++++++
 recipes-support/armnn/armnn_git.bbappend      | 27 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
 create mode 100644 recipes-support/armnn/armnn_git.bbappend

diff --git a/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch b/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
new file mode 100644
index 0000000..a504aa7
--- /dev/null
+++ b/recipes-support/armnn/armnn/0011-Generate-versioned-library-for-armnnTfLiteParser.patch
@@ -0,0 +1,25 @@
+From 1f5670c6ef8669d7d25621d9c97d66178800dcf9 Mon Sep 17 00:00:00 2001
+From: Hongmei Gou <a0271529@ti.com>
+Date: Tue, 17 Sep 2019 17:58:39 -0400
+Subject: [PATCH] Generate versioned library for armnnTfLiteParser
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Hongmei Gou <a0271529@ti.com>
+---
+ src/armnnTfLiteParser/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/armnnTfLiteParser/CMakeLists.txt b/src/armnnTfLiteParser/CMakeLists.txt
+index 17d4cf68..c83f7059 100755
+--- a/src/armnnTfLiteParser/CMakeLists.txt
++++ b/src/armnnTfLiteParser/CMakeLists.txt
+@@ -24,4 +24,5 @@ if(BUILD_TF_LITE_PARSER)
+     install(TARGETS armnnTfLiteParser
+             LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+             RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
++    set_target_properties(armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ endif()
+-- 
+2.17.1
+
diff --git a/recipes-support/armnn/armnn_git.bbappend b/recipes-support/armnn/armnn_git.bbappend
new file mode 100644
index 0000000..26dfdad
--- /dev/null
+++ b/recipes-support/armnn/armnn_git.bbappend
@@ -0,0 +1,27 @@
+PR_append = ".tisdk0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+    file://0011-Generate-versioned-library-for-armnnTfLiteParser.patch \
+    https://storage.googleapis.com/mobilenet_v2/checkpoints/mobilenet_v2_1.0_224.tgz;name=mobilenetv2;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
+"
+
+SRC_URI[mobilenetv2.md5sum] = "519bba7052fd279c66d2a28dc3f51f46"
+SRC_URI[mobilenetv2.sha256sum] = "318084bc1b63d6d7b854553e09cdf77078b1c0168be27c59a0d44253b5ed49dc"
+
+DEPENDS += " \
+    tensorflow-lite \
+    flatbuffers \
+"
+
+EXTRA_OECMAKE += " \
+    -DBUILD_TF_LITE_PARSER=1 \
+    -DTF_LITE_GENERATED_PATH=${STAGING_DIR_HOST}${includedir}/tensorflow/contrib/lite/schema \
+    -DFLATBUFFERS_ROOT=${STAGING_DIR_HOST}${includedir}/flatbuffers \
+    -DFLATBUFFERS_LIBRARY=${STAGING_DIR_HOST}${libdir}/libflatbuffers.a \
+"
+
+do_install_append() {
+    cp ${WORKDIR}/tfmodel/mobilenet_v2_1.0_224.tflite ${D}${TESTVECS_INSTALL_DIR}/models
+}
-- 
2.17.1


