Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 10E0752976
	for <meta-arago@arago-project.org>;
	Sat, 24 Aug 2019 22:39:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7OMcqtA075365
	for <meta-arago@arago-project.org>; Sat, 24 Aug 2019 17:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566686332;
	bh=JCKQbm+kLz4l5Z41DeRyx2ejX2uS5jvRo0R+mvcgggc=;
	h=From:To:CC:Subject:Date;
	b=UUJpynqxIBD0RP3ONJfXNuNYqoq7JqKhKySo3bw1Rs1URufrtmRt923jTK40RZqVq
	iKky3lB+Oiial8tR/q/97+aVSGmx7jBTYu024hWGsJqkIA5liilrB0mBUSo4VkWVe2
	OPv1PccDyZwOCi7pX0Sw5yr4laaOTa7DYTmLe3nw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7OMcqJm079548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 24 Aug 2019 17:38:52 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 24 Aug 2019 17:38:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 24 Aug 2019 17:38:52 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7OMcpDx091728;
	Sat, 24 Aug 2019 17:38:51 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 24 Aug 2019 18:38:50 -0400
Message-ID: <20190824223850.16328-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [PATCH] armnn: Allow command line selection of camera port, primarily needed for handling USB cameras
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
X-List-Received-Date: Sat, 24 Aug 2019 22:39:53 -0000
Content-Type: text/plain

- Default camera port is still 1 (/dev/video1), but we now also allow selection of specific port: 0,1,2 or 3

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 ...verflow-warning-resulting-in-compila.patch |  2 +
 ...ine-options-for-video-port-selection.patch | 60 +++++++++++++++++++
 .../recipes-support/armnn/armnn_git.bb        |  1 +
 3 files changed, 63 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
index b6f11024..023766a4 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch
@@ -4,6 +4,8 @@ Date: Wed, 12 Jun 2019 13:12:09 -0400
 Subject: [PATCH] Avoid stringop-overflow warning resulting in compilation
  error
 
+Upstream-Status: Inappropriate [TI only test code]
+
 Signed-off-by: Djordje Senicic <x0157990@ti.com>
 ---
  src/armnn/LayerSupport.cpp | 2 ++
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch b/meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch
new file mode 100644
index 00000000..d0485a86
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0009-command-line-options-for-video-port-selection.patch
@@ -0,0 +1,60 @@
+From ee152f3b68f91c5fff336306d011becdcf3a6b17 Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Sat, 24 Aug 2019 17:58:38 -0400
+Subject: [PATCH] command line options for video port selection
+
+- Add command line selection <0|1|2|3> of video port used for live camera input 
+
+Upstream-Status: Inappropriate [TI only test code]
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ tests/ArmnnExamples/ArmnnExamples.cpp | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
+index 638fc145..d1526539 100644
+--- a/tests/ArmnnExamples/ArmnnExamples.cpp
++++ b/tests/ArmnnExamples/ArmnnExamples.cpp
+@@ -316,10 +316,27 @@ int MainImpl(const char* modelPath,
+     int input_type = INPUT_IMAGE;
+     std::string filename = inputTensorDataFilePath;
+ 
+-    size_t i = filename.rfind("camera_live_input", filename.length());
++    size_t i  = filename.rfind("camera_live_input", filename.length());
+     if (i != string::npos)
+     {
+-      cap = VideoCapture(1);
++      int vport = 1;
++      size_t loc_i = filename.rfind("camera_live_input0", filename.length());
++      if(loc_i != string::npos) vport = 0;
++      else {
++         loc_i = filename.rfind("camera_live_input1", filename.length());
++         if(loc_i != string::npos) vport = 1;
++         else {
++           loc_i = filename.rfind("camera_live_input2", filename.length());
++           if(loc_i != string::npos) vport = 2;
++           else {
++             loc_i = filename.rfind("camera_live_input3", filename.length());
++             if(loc_i != string::npos) vport = 3;
++             else std::cout << "Setting ports beyond 3 not supported - using default!" << std::endl;
++           }
++         }
++      }
++      std::cout << "Using video" << vport << std::endl;
++      cap = VideoCapture(vport);
+       namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
+       input_type = INPUT_CAMERA; //camera input
+     }
+@@ -609,7 +626,7 @@ int main(int argc, const char* argv[])
+        "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
+        "This parameter is optional, depending on the network.")
+       ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
+-       "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
++       "Input test file name. It can be image/video clip file name or 'camera_live_input or camera_live_input<0|1|2|3>' to select camera input.")
+       ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
+       ("event-based-profiling,e", po::bool_switch()->default_value(false),
+        "Enables built in profiler. If unset, defaults to off.")
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 076ea3aa..77921218 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://0006-armnn-mobilenet-test-example.patch \
     file://0007-enable-use-of-arm-compute-shared-library.patch \
     file://0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch \
+    file://0009-command-line-options-for-video-port-selection.patch \
     http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
     git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
 "
-- 
2.17.1


