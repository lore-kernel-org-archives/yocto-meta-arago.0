Return-Path: <qsu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 06E085297E
	for <meta-arago@arago-project.org>;
	Wed, 12 Dec 2018 17:32:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBCHW9F2025754
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 11:32:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544635929;
	bh=CFmduXvxfvdkJ9b+ibBYDnU+0boyA2uJ0MFptN/ExiU=;
	h=From:To:Subject:Date;
	b=eSgKpUs2lVOhk+spChqoaMosG2sm6VW8F7v6CYpp4pkA9uXdnrA+UyR8GXvpBJ9dU
	3YliuSGLp4hkVPPuQOouRpgosJWJEVpRNNW8aWCxkiGBXuKFNBMwtl6yw9qhez9fwX
	KL2nXNHVHOHt30Zn49b1OwrkdodI4L9RaLpDqBPo=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBCHW9BU071953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 11:32:09 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 12 Dec 2018 11:32:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 12 Dec 2018 11:32:09 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBCHW9aj026890
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 11:32:09 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Dec 2018 12:32:05 -0500
Message-ID: <1544635925-9631-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] armnn: add camera detector in Matrix GUI demo example.
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
X-List-Received-Date: Wed, 12 Dec 2018 17:32:21 -0000
Content-Type: text/plain

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../armnn/0006-armnn-mobilenet-test-example.patch  | 80 +++++++++++++---------
 .../recipes-support/armnn/armnn_git.bb             |  1 +
 2 files changed, 50 insertions(+), 31 deletions(-)

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
index e744587..d18f745 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
@@ -1,21 +1,21 @@
-From 5da1d1c637a782926f99403d092f01edc028d99d Mon Sep 17 00:00:00 2001
+From 8e50d396567f5f19e376238831d5375516d2ea13 Mon Sep 17 00:00:00 2001
 From: Qin Su <qsu@ti.com>
-Date: Wed, 21 Nov 2018 16:18:01 -0500
+Date: Tue, 11 Dec 2018 15:57:57 -0500
 Subject: [PATCH] armnn mobilenet test example
 
 Upstream-Status: Inappropriate [TI only test code]
 Signed-off-by: Qin Su <qsu@ti.com>
 ---
- tests/ArmnnExamples/ArmnnExamples.cpp | 865 ++++++++++++++++++++++++++++++++++
- 1 file changed, 865 insertions(+)
+ tests/ArmnnExamples/ArmnnExamples.cpp | 883 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 883 insertions(+)
  create mode 100644 tests/ArmnnExamples/ArmnnExamples.cpp
 
 diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
 new file mode 100644
-index 0000000..89faf4f
+index 0000000..a26356e
 --- /dev/null
 +++ b/tests/ArmnnExamples/ArmnnExamples.cpp
-@@ -0,0 +1,865 @@
+@@ -0,0 +1,883 @@
 +/******************************************************************************
 + * Copyright (c) 2018, Texas Instruments Incorporated - http://www.ti.com/
 + *   All rights reserved.
@@ -387,8 +387,27 @@ index 0000000..89faf4f
 +        size_t i = filename.rfind("camera_live_input", filename.length());
 +	if (i != string::npos)
 +	{
-+            cap = VideoCapture(1);
-+   		    namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
++            /* Detect the video node assigned to vip */
++            FILE *fp = popen("v4l2-ctl --list-devices", "r");
++            char *ln = NULL;
++            size_t len = 0;
++            char *f_str;
++            int device_number = 0;//0: AM65xx; 1: AM57xx
++            while (getline(&ln, &len, fp) != -1)
++            {
++                if(strstr(ln, "platform:vip") != NULL)
++                {
++                    getline(&ln, &len, fp);
++                    if((f_str = strstr(ln, "/dev/video")) != NULL)
++                    {
++                        device_number = atoi(&f_str[10]);
++                    }
++                }
++            }
++            free(ln);
++            pclose(fp);
++            cap = VideoCapture(device_number);
++   	    namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
 +			input_type = INPUT_CAMERA; //camera input
 +	}
 +        else if((filename.substr(filename.find_last_of(".") + 1) == "mp4") ||
@@ -613,7 +632,7 @@ index 0000000..89faf4f
 +        desc.add_options()
 +        ("model-format,f", po::value(&modelFormat),
 +         "caffe-binary, caffe-text, tflite-binary, onnx-binary, onnx-text, tensorflow-binary or tensorflow-text.")
-+        ("model-path,m", po::value(&modelPath), "Path to model file, e.g. .caffemodel, .prototxt, .tflite,"
++        ("model-path,m", po::value(&modelPath), "Model Name w/ full path, e.g.of supported model types: .caffemodel, .prototxt, .tflite,"
 +         " .onnx")
 +        ("compute,c", po::value<std::vector<armnn::Compute>>()->multitoken(),
 +         "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
@@ -624,8 +643,6 @@ index 0000000..89faf4f
 +        ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
 +         "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
 +        ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
-+        ("event-based-profiling,e", po::bool_switch()->default_value(false),
-+         "Enables built in profiler. If unset, defaults to off.")
 +        ("number-frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process " );
 +    }
 +    catch (const std::exception& e)
@@ -717,37 +734,38 @@ index 0000000..89faf4f
 +    if (argc == 1)
 +    {
 +	return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
-+                       modelPath, inputName, inputTensorDataFilePath, outputName, false, 1000);
++                       modelPath, inputName, inputTensorDataFilePath, outputName, false, 10);
 +    }
 +    else
 +    {
 +	size_t subgraphId = 0;
 +	po::options_description desc("Options");
++	
 +	try
 +	{
 +            desc.add_options()
 +	    ("help", "Display usage information")
-+	    ("test-cases,t", po::value(&testCasesFile), "Path to a CSV file containing test cases to run. "
-+		 "If set, further parameters -- with the exception of compute device and concurrency -- will be ignored, "
-+		 "as they are expected to be defined in the file for each test in particular.")
-+	    ("concurrent,n", po::bool_switch()->default_value(false),
-+		 "Whether or not the test cases should be executed in parallel")
 +	    ("model-format,f", po::value(&modelFormat),
-+		 "caffe-binary, caffe-text, onnx-binary, onnx-text, tflite-binary, tensorflow-binary or tensorflow-text.")
-+	    ("model-path,m", po::value(&modelPath), "Path to model file, e.g. .caffemodel, .prototxt,"
-+		 " .tflite, .onnx")
++		 "caffe-binary, caffe-text, onnx-binary, onnx-text, tflite-binary, tensorflow-binary or tensorflow-text."
++		 " E.g.: -f tensorflow-binary")
++	    ("model-path,m", po::value(&modelPath), "Model Name w/ full path, e.g.of supported model types: .caffemodel, .prototxt,"
++		 " .tflite, .onnx."
++		 " E.g.: -m /usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb")
 +	    ("compute,c", po::value<std::vector<armnn::Compute>>()->multitoken(),
-+		 "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
-+	    ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network.")
++		 "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc."
++		 " E.g.: -c CpuAcc")
++	    ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network."
++		 " E.g.: -i input")
 +	    ("input-tensor-shape,s", po::value(&inputTensorShapeStr),
 +		 "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
-+		 "This parameter is optional, depending on the network.")
++		 "This parameter is optional, depending on the network."
++		 " E.g.: -s '1 224 224 3'")
 +	    ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
-+				 "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
-+	    ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
-+	    ("event-based-profiling,e", po::bool_switch()->default_value(false),
-+		 "Enables built in profiler. If unset, defaults to off.")
-+	    ("number_frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process.");
++		 "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input."
++		 " E.g.: -d /usr/share/arm/armnn/testvecs/camera_live_input")
++	    ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network."
++		 " E.g.: -o MobilenetV1/Predictions/Reshape_1")
++	    ("number_frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process. E.g.: --number_frame 100.");
 +	}
 +	catch (const std::exception& e)
 +	{
@@ -784,8 +802,8 @@ index 0000000..89faf4f
 +	}
 +
 +	// Get the value of the switch arguments.
-+	bool concurrent = vm["concurrent"].as<bool>();
-+	bool enableProfiling = vm["event-based-profiling"].as<bool>();
++	bool concurrent = false;//disabled
++	bool enableProfiling = false;//disabled
 +
 +	// Check whether we have to load test cases from a file.
 +	if (CheckOption(vm, "test-cases"))
@@ -881,6 +899,6 @@ index 0000000..89faf4f
 +    }
 +}
 +
---
+-- 
 1.9.1
 
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index b3ac84d..eecbb51 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
                     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
+PR = "r1"
 PV = "18.08"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
-- 
1.9.1


