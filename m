Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7C8F352988
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 20:49:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBAKljo2092014
	for <meta-arago@arago-project.org>; Tue, 10 Dec 2019 14:47:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576010865;
	bh=8IkNnQRIgN7xRC9B7zx7c5CML1FDUXrlCVrgOY4JldU=;
	h=From:To:CC:Subject:Date;
	b=EgMO65QNS+PBq7xmmNDhXxnr3aJMamqI10bKKSo4IFYoV/P1L+/SE1R9WmKts48oQ
	0+l0gLDTeVMxhLaPxFQkJQ2IKGrIx1uHqaCgcIvIj2q3iYVucUTqU+fxT6L0rwE3zA
	30o1UcpOTccjNOwS2izTcwxa2rO/sNYJ4WqihC4g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBAKljh9072701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Dec 2019 14:47:45 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 10 Dec 2019 14:47:44 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 10 Dec 2019 14:47:44 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBAKlhYf030818;
	Tue, 10 Dec 2019 14:47:44 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Dec 2019 15:43:09 -0500
Message-ID: <20191210204309.15705-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH v2] armnn: ArmnnExamples: set capture resolution when using camera input
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
X-List-Received-Date: Tue, 10 Dec 2019 20:49:19 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes: exclude the test clip (test2.avi)

 ...ting-capture-resolution-for-the-came.patch | 48 +++++++++++++++++++
 .../recipes-support/armnn/armnn_git.bb        |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch b/meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch
new file mode 100644
index 00000000..bce697d1
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0013-ArmnnExample-setting-capture-resolution-for-the-came.patch
@@ -0,0 +1,48 @@
+From dc175c00a317cdd693772f7dbf9de6ddeef46f19 Mon Sep 17 00:00:00 2001
+From: Hongmei Gou <a0271529@ti.com>
+Date: Tue, 10 Dec 2019 13:07:26 -0500
+Subject: [PATCH] ArmnnExample: setting capture resolution for the camera input
+
+Upstream-Status: Inappropriate [TI only example code]
+
+Signed-off-by: Hongmei Gou <a0271529@ti.com>
+---
+ tests/ArmnnExamples/ArmnnExamples.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
+index 1bd76a47..7fdaa167 100644
+--- a/tests/ArmnnExamples/ArmnnExamples.cpp
++++ b/tests/ArmnnExamples/ArmnnExamples.cpp
+@@ -349,6 +349,10 @@ int MainImpl(const char* modelPath,
+       }
+       std::cout << "Using video" << vport << std::endl;
+       cap = VideoCapture(vport);
++      // Setting the capture resolution
++      cap.set(CV_CAP_PROP_FRAME_WIDTH, 352);
++      cap.set(CV_CAP_PROP_FRAME_HEIGHT, 288);
++
+       namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
+       input_type = INPUT_CAMERA; //camera input
+     }
+@@ -452,7 +452,7 @@ int MainImpl(const char* modelPath,
+         cv::putText(test_image, predict_target_name,
+                     cv::Point(rectCrop.x + 5,rectCrop.y + 20), // Coordinates
+                     cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
+-                    1.0, // Scale. 2.0 = 2x bigger
++                    0.75, // Scale. 2.0 = 2x bigger
+                     cv::Scalar(0,0,255), // Color
+                     1, // Thickness
+                     8); // Line type
+@@ -462,7 +462,7 @@ int MainImpl(const char* modelPath,
+         cv::putText(test_image, preformance_ret_string,
+                     cv::Point(rectCrop.x + 5,rectCrop.y + 40), // Coordinates
+                     cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
+-                    1.0, // Scale. 2.0 = 2x bigger
++                    0.75, // Scale. 2.0 = 2x bigger
+                     cv::Scalar(0,0,255), // Color
+                     1, // Thickness
+                     8); // Line type
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 38571091..29142a04 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-PR = "r3"
+PR = "r4"
 PV = "19.08"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://0010-armnnexamples-update-for-19.08-modifications.patch \
     file://0011-Generate-versioned-library-for-armnnTfLiteParser.patch \
     file://0012-ArmnnExample-Fix-exception-for-help-command-line-opt.patch \
+    file://0013-ArmnnExample-setting-capture-resolution-for-the-came.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     https://storage.googleapis.com/mobilenet_v2/checkpoints/mobilenet_v2_1.0_224.tgz;name=mobilenetv2;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
-- 
2.17.1


