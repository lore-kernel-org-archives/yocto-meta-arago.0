Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 53B3652987
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 18:20:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EIJjlc050533
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 13:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560536385;
	bh=9PtmO8gNPVYRS6/gXvtARGleRq3ijoHYK0dx4dF/QTI=;
	h=From:To:CC:Subject:Date;
	b=EBtvXEXd+FiIhZgT6zXPW/wsnsa2eN16+XDj4etqUmbGBPAFnasHxQN6f3Q1ZeeNE
	Xy7IcMskiBthFIO3wpqdrHGhubRCQoq0PO0sMxPKZGn6eeMSxg6MLo4/HbkzK5rehP
	vqNUzP+439LTgxhTneKjHuBol+I12KWhAgetp0wk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EIJj8V070424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 13:19:45 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 13:19:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 13:19:44 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EIJik1107716;
	Fri, 14 Jun 2019 13:19:44 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Jun 2019 09:10:08 -0400
Message-ID: <20190614131008.9336-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH] armnn: Fix issue with new version of protobuf 3.6.1, and new toolchain warning settings
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
X-List-Received-Date: Fri, 14 Jun 2019 18:20:25 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-support/armnn/armnn-caffe_git.bb  | 10 +++----
 .../recipes-support/armnn/armnn-onnx_git.bb   | 10 +++----
 ...verflow-warning-resulting-in-compila.patch | 27 +++++++++++++++++++
 .../recipes-support/armnn/armnn_git.bb        |  1 +
 4 files changed, 38 insertions(+), 10 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
index 509324bc..a435ed75 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
@@ -2,20 +2,20 @@ SUMMARY = "Caffe protobuf files - used in ARMNN for Caffe network models"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://caffeImport/LICENSE;md5=91d560803ea3d191c457b12834553991"
 
-SRC_URI = " \
-    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
-"
+SRC_URI  = "git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
+           "
+
+SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
 
 PV = "1.0"
 
 BRANCH = "master"
-SRCREV = "16030b2e43de6143f371072d54760737ddda0645"
 
 S = "${WORKDIR}/git"
 
 do_install() {
         install -d ${D}${datadir}/${BPN}/caffe/proto/
-        for file in ${S}/caffeImport/*
+        for file in ${S}/caffeImport/ver361/*
         do
             install -m 0644 $file ${D}${datadir}/${BPN}/caffe/proto/
         done
diff --git a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
index 80a957b3..d0f0c70d 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn-onnx_git.bb
@@ -2,20 +2,20 @@ SUMMARY = "Onnx protobuf files - used in ARMNN for Onnx network models"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://onnxImport/LICENSE;md5=077ce3eaeaea91462d41c566300d2a02"
 
-SRC_URI = " \
-    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
-"
+SRC_URI  = "git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
+           "
+
+SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
 
 PV = "1.0"
 
 BRANCH = "master"
-SRCREV = "af39cf346f602bd2aa75db1e9b31636b78d4e31b"
 
 S = "${WORKDIR}/git"
 
 do_install() {
         install -d ${D}${datadir}/${BPN}/onnx/
-        for file in ${S}/onnxImport/*
+        for file in ${S}/onnxImport/ver361/*
         do
             install -m 0644 $file ${D}${datadir}/${BPN}/onnx/
         done
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
new file mode 100644
index 00000000..b6f11024
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
@@ -0,0 +1,27 @@
+From 4f5d63b026f225f6499e0a401d9b2769e8ef0a80 Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Wed, 12 Jun 2019 13:12:09 -0400
+Subject: [PATCH] Avoid stringop-overflow warning resulting in compilation
+ error
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ src/armnn/LayerSupport.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/armnn/LayerSupport.cpp b/src/armnn/LayerSupport.cpp
+index 12b3c403..09c973e5 100644
+--- a/src/armnn/LayerSupport.cpp
++++ b/src/armnn/LayerSupport.cpp
+@@ -25,6 +25,8 @@ void CopyErrorMessage(char* truncatedString, const char* fullString, size_t maxL
+     if(truncatedString != nullptr)
+     {
+         size_t copyLength = std::min(maxLength, strlen(fullString));
++        if(copyLength > 255) copyLength = 255; //Put source length independent upper bound
++       
+         std::strncpy(truncatedString, fullString, copyLength);
+         // Ensure null-terminated string.
+         truncatedString[copyLength] = '\0';
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index ff1bfbdd..b5ebd129 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://0005-add-armnn-mobilenet-test-example.patch \
     file://0006-armnn-mobilenet-test-example.patch \
     file://0007-enable-use-of-arm-compute-shared-library.patch \
+    file://0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
 "
-- 
2.17.1


