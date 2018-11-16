Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 36D3E520C0
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2018 20:28:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAGKSUjq074081
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 14:28:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542400111;
	bh=2o4tb0XgtWrAualcJ156CTk9gqy1xuYeVMWgft4DYTY=;
	h=From:To:Subject:Date;
	b=xFYs1km75fpb5n4+yLWGhNKbG2pdVzOiMDysfm0EJ0W92b6o0O27wb+F+x3x/+sqs
	cpbNNBhIgIucM9e3er/q595ZFQ5gLjq08VKXHJkOmZscI2Ugoa3xnfv/bj/+8JK7iK
	yVCzV6xZEL7TFLZSK4z12QlytWopdkopLIMZgWXY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAGKSUfv025301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 14:28:30 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 16 Nov 2018 14:28:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 16 Nov 2018 14:28:30 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAGKSUKx005294
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 14:28:30 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Nov 2018 15:27:32 -0500
Message-ID: <1542400052-28613-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] armnn: bump SRCREV and add a demo example
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
X-List-Received-Date: Fri, 16 Nov 2018 20:28:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

updated to the latest version of 18.08
updated to generate versioned library
created a demo example with mobileNet


Signed-off-by: Qin Su <qsu@ti.com>
---
 .../0003-add-more-test-command-arguments.patch     |  74 ++
 .../armnn/0004-generate-versioned-library.patch    |  62 ++
 .../0005-add-armnn-mobilenet-test-example.patch    |  68 ++
 .../armnn/0006-armnn-mobilenet-test-example.patch  | 862 +++++++++++++++++++++
 .../recipes-support/armnn/armnn_git.bb             |  31 +-
 5 files changed, 1092 insertions(+), 5 deletions(-)
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-arguments.patch
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch

diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-arguments.patch b/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-arguments.patch
new file mode 100755
index 0000000..65a273a
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0003-add-more-test-command-arguments.patch
@@ -0,0 +1,74 @@
+From b44e2aa84c75e14f18f6d3057636a3b63ec43d85 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Thu, 25 Oct 2018 12:25:15 -0400
+Subject: [PATCH] add more test command arguments
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/InferenceTest.inl | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+
+diff --git a/tests/InferenceTest.inl b/tests/InferenceTest.inl
+index 16df7ba..5808edb 100644
+--- a/tests/InferenceTest.inl
++++ b/tests/InferenceTest.inl
+@@ -299,6 +299,56 @@ int ClassifierInferenceTestMain(int argc,
+                                 TConstructDatabaseCallable constructDatabase,
+                                 const armnn::TensorShape* inputTensorShape)
+ {
++    int count;
++    const char *p_input;
++    char inmodelname[500];
++    char outtensorname[500];
++
++    /* parse command line */
++    for (count = 1; count < argc; count++)
++    {
++        if (*(argv[count]) == '+')
++        {
++            p_input = argv[count] + 1;
++            switch (*(p_input))
++            {
++                case 'i':
++                case 'I':
++                    strcpy(inmodelname, p_input + 2);
++                    modelFilename = &inmodelname[0];
++                    std::cout << "Input model = " << modelFilename << std::endl;
++                    break;
++                case 'o':
++                case 'O':
++                    strcpy(outtensorname, p_input + 2);
++                    outputBindingName = &outtensorname[0];
++                    std::cout << "out tensor name = " << outputBindingName << std::endl;
++                    break;
++                default:
++                    break;
++            }
++        }
++        else if (*(argv[count]) == '-')
++        {
++            p_input = argv[count] + 1;
++            switch (*(p_input))
++            {
++                case '-':
++                    p_input = argv[count] + 2;
++                case 'h':
++                case 'H':
++                    std::cout <<"\nAdditional Options: " << std::endl;
++                    std::cout <<"  +i                                    Set user specified inference model name." << std::endl;
++                    std::cout <<"                                        If not set, default name is used." << std::endl;
++                    std::cout <<"  +o                                    Set user specified output tensor name." << std::endl;
++                    std::cout <<"                                        If not set, default name is used.\n" << std::endl;
++                    break;
++                default:
++                    break;
++            }
++        }
++    }
++
+     return InferenceTestMain(argc, argv, defaultTestCaseIds,
+         [=]
+         ()
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
new file mode 100755
index 0000000..380062a
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
@@ -0,0 +1,62 @@
+From 9ab14d29f1a9e3f0040acf43ba792cffa2854ff8 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Thu, 8 Nov 2018 10:12:41 -0500
+Subject: [PATCH] generate versioned library
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+ mode change 100644 => 100755 CMakeLists.txt
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+old mode 100644
+new mode 100755
+index c06a869..cc11476
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -73,7 +73,7 @@ if(BUILD_CAFFE_PARSER)
+ 
+     target_link_libraries(armnnCaffeParser armnn)
+     target_link_libraries(armnnCaffeParser ${PROTOBUF_LIBRARIES})
+-
++    set_target_properties( armnnCaffeParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ endif()
+ 
+ if(BUILD_ONNX_PARSER)
+@@ -97,6 +97,7 @@ if(BUILD_ONNX_PARSER)
+ 
+     # Protobuf
+     target_link_libraries(armnnOnnxParser ${PROTOBUF_LIBRARIES})
++    set_target_properties( armnnOnnxParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ endif()
+ 
+ if(BUILD_TF_PARSER)
+@@ -120,6 +121,7 @@ if(BUILD_TF_PARSER)
+ 
+     # Protobuf (use the specific version tensorflow wants)
+     target_link_libraries(armnnTfParser ${PROTOBUF_LIBRARIES})
++    set_target_properties( armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ endif()
+ 
+ if(BUILD_TF_LITE_PARSER)
+@@ -136,6 +138,7 @@ if(BUILD_TF_LITE_PARSER)
+ 
+      target_link_libraries(armnnTfLiteParser ${Boost_FILESYSTEM_LIBRARY} ${Boost_THREAD_LIBRARY})
+      target_link_libraries(armnnTfLiteParser armnn ${FLATBUFFERS_LIBRARY})
++     set_target_properties( armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
+ endif()
+ 
+ # ArmNN source files required for all build options
+@@ -610,6 +613,8 @@ if(PROFILING_BACKEND_STREAMLINE)
+     target_link_libraries(armnn pthread)
+ endif()
+ 
++set_target_properties( armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
++
+ if(BUILD_UNIT_TESTS)
+     set(unittest_sources)
+     list(APPEND unittest_sources
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
new file mode 100755
index 0000000..c3d646f
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
@@ -0,0 +1,68 @@
+From 5ebb0b89ac1690ec2c0ef9414de92a36a6724257 Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Wed, 14 Nov 2018 22:34:54 -0500
+Subject: [PATCH] add armnn mobilenet test example
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/CMakeLists.txt | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+ mode change 100644 => 100755 tests/CMakeLists.txt
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+old mode 100644
+new mode 100755
+index 0979d55..7c0cf2a
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -1,3 +1,6 @@
++find_package( OpenCV REQUIRED )
++include_directories( ${OpenCV_INCLUDE_DIRS} )
++
+ # UnitTests
+ include(CheckIncludeFiles)
+ 
+@@ -226,3 +229,40 @@ if (BUILD_CAFFE_PARSER OR BUILD_TF_PARSER OR BUILD_TF_LITE_PARSER OR BUILD_ONNX_
+         ${Boost_PROGRAM_OPTIONS_LIBRARY})
+     addDllCopyCommands(ExecuteNetwork)
+ endif()
++
++if (BUILD_ARMNN_EXAMPLES)
++    set(ArmnnExamples_sources
++        ArmnnExamples/ArmnnExamples.cpp)
++
++    add_executable_ex(ArmnnExamples ${ArmnnExamples_sources})
++
++    target_include_directories(ArmnnExamples PRIVATE ../src/armnnUtils)
++    target_include_directories(ArmnnExamples PRIVATE ../src/armnn)
++
++    if (BUILD_CAFFE_PARSER)
++        target_link_libraries(ArmnnExamples armnnCaffeParser)
++    endif()
++    if (BUILD_TF_PARSER)
++        target_link_libraries(ArmnnExamples armnnTfParser)
++    endif()
++
++    if (BUILD_TF_LITE_PARSER)
++        target_link_libraries(ArmnnExamples armnnTfLiteParser)
++    endif()
++    if (BUILD_ONNX_PARSER)
++            target_link_libraries(ArmnnExamples armnnOnnxParser)
++    endif()
++
++    target_link_libraries(ArmnnExamples armnn)
++    target_link_libraries(ArmnnExamples ${CMAKE_THREAD_LIBS_INIT})
++    if(OPENCL_LIBRARIES)
++        target_link_libraries(ArmnnExamples ${OPENCL_LIBRARIES})
++    endif()
++
++    target_link_libraries(ArmnnExamples
++        ${Boost_SYSTEM_LIBRARY}
++        ${Boost_FILESYSTEM_LIBRARY}
++        ${Boost_PROGRAM_OPTIONS_LIBRARY}
++		${OpenCV_LIBS})
++    addDllCopyCommands(ArmnnExamples)
++endif()
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
new file mode 100755
index 0000000..f66e92f
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
@@ -0,0 +1,862 @@
+From 3b2d54dce30f570f8eeedd97fa12728790735b5c Mon Sep 17 00:00:00 2001
+From: Qin Su <qsu@ti.com>
+Date: Thu, 15 Nov 2018 23:04:36 -0500
+Subject: [PATCH] armnn mobilenet test example
+
+Signed-off-by: Qin Su <qsu@ti.com>
+---
+ tests/ArmnnExamples/ArmnnExamples.cpp | 842 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 842 insertions(+)
+ create mode 100755 tests/ArmnnExamples/ArmnnExamples.cpp
+
+diff --git a/tests/ArmnnExamples/ArmnnExamples.cpp b/tests/ArmnnExamples/ArmnnExamples.cpp
+new file mode 100755
+index 0000000..8365639
+--- /dev/null
++++ b/tests/ArmnnExamples/ArmnnExamples.cpp
+@@ -0,0 +1,842 @@
++﻿//
++// Copyright © 2017 Arm Ltd. All rights reserved.
++// See LICENSE file in the project root for full license information.
++//
++#include "armnn/ArmNN.hpp"
++
++#include <utility>
++#include <armnn/TypesUtils.hpp>
++
++#if defined(ARMNN_CAFFE_PARSER)
++#include "armnnCaffeParser/ICaffeParser.hpp"
++#endif
++#if defined(ARMNN_TF_PARSER)
++#include "armnnTfParser/ITfParser.hpp"
++#endif
++#if defined(ARMNN_TF_LITE_PARSER)
++#include "armnnTfLiteParser/ITfLiteParser.hpp"
++#endif
++#if defined(ARMNN_ONNX_PARSER)
++#include "armnnOnnxParser/IOnnxParser.hpp"
++#endif
++#include "CsvReader.hpp"
++#include "../InferenceTest.hpp"
++#include <Logging.hpp>
++#include <Profiling.hpp>
++
++#include <boost/algorithm/string/trim.hpp>
++#include <boost/algorithm/string/split.hpp>
++#include <boost/algorithm/string/classification.hpp>
++#include <boost/program_options.hpp>
++
++#include <iostream>
++#include <fstream>
++#include <functional>
++#include <future>
++#include <algorithm>
++#include <iterator>
++#include<vector>
++
++#include <signal.h>
++#include "opencv2/core.hpp"
++#include "opencv2/imgproc.hpp"
++#include "opencv2/highgui.hpp"
++#include "opencv2/videoio.hpp"
++#include <time.h>
++
++using namespace cv;
++
++#define INPUT_IMAGE  0
++#define INPUT_VIDEO  1 
++#define INPUT_CAMERA 2
++
++Mat test_image;
++Rect rectCrop;
++
++time_point<high_resolution_clock> predictStart;
++time_point<high_resolution_clock> predictEnd;
++
++void imagenetCallBackFunc(int event, int x, int y, int flags, void* userdata)
++{
++    if  ( event == EVENT_RBUTTONDOWN )
++    {
++        std::cout << "Right button of the mouse is clicked - position (" << x << ", " << y << ")" << " ... prepare to exit!" << std::endl;
++        exit(0);
++    }
++}
++
++inline float Lerpfloat(float a, float b, float w)
++{
++    return w * b + (1.f - w) * a;
++}
++
++// Load a single image
++struct ImageData
++{
++    unsigned int m_width;
++    unsigned int m_height;
++    unsigned int m_chnum;
++    unsigned int m_size;
++    std::vector<uint8_t> m_image;
++};
++
++std::unique_ptr<ImageData> loadImageData(std::string image_path, VideoCapture &cap, cv::Mat img, int input_type)
++{
++    //cv::Mat img;
++	if (input_type == INPUT_IMAGE) 
++	{
++        /* use OpenCV to get the image */
++	    img = cv::imread(image_path, CV_LOAD_IMAGE_COLOR);
++	}
++	cv::cvtColor(img, img, CV_BGR2RGB); //convert image format from BGR(openCV format) to RGB (armnn required format).
++
++    // store image and label in Image
++    std::unique_ptr<ImageData> ret(new ImageData);  
++    ret->m_width = static_cast<unsigned int>(img.cols);
++    ret->m_height = static_cast<unsigned int>(img.rows);
++    ret->m_chnum = static_cast<unsigned int>(img.channels());
++    ret->m_size = static_cast<unsigned int>(img.cols*img.rows*img.channels());
++	ret->m_image.resize(ret->m_size);
++
++ 	for (unsigned int i = 0; i < ret->m_size; i++)
++	{
++		ret->m_image[i] = static_cast<uint8_t>(img.data[i]);
++	}
++    return ret;
++}
++
++std::vector<float> ResizeBilinear(std::vector<uint8_t> input,
++                                    const unsigned int inWidth,
++                                    const unsigned int inHeight,
++                                    const unsigned int inChnum,
++                                    const unsigned int outputWidth,
++                                    const unsigned int outputHeight)
++{
++    std::vector<float> out;
++    out.resize(outputWidth * outputHeight * 3);
++
++    // We follow the definition of TensorFlow and AndroidNN: the top-left corner of a texel in the output
++    // image is projected into the input image to figure out the interpolants and weights. Note that this
++    // will yield different results than if projecting the centre of output texels.
++
++    const unsigned int inputWidth = inWidth;
++    const unsigned int inputHeight = inHeight;
++
++    // How much to scale pixel coordinates in the output image to get the corresponding pixel coordinates
++    // in the input image.
++    const float scaleY = boost::numeric_cast<float>(inputHeight) / boost::numeric_cast<float>(outputHeight);
++    const float scaleX = boost::numeric_cast<float>(inputWidth) / boost::numeric_cast<float>(outputWidth);
++
++    uint8_t rgb_x0y0[3];
++    uint8_t rgb_x1y0[3];
++    uint8_t rgb_x0y1[3];
++    uint8_t rgb_x1y1[3];
++    unsigned int pixelOffset00, pixelOffset10, pixelOffset01, pixelOffset11;
++    for (unsigned int y = 0; y < outputHeight; ++y)
++    {
++        // Corresponding real-valued height coordinate in input image.
++        const float iy = boost::numeric_cast<float>(y) * scaleY;
++        // Discrete height coordinate of top-left texel (in the 2x2 texel area used for interpolation).
++        const float fiy = floorf(iy);
++        const unsigned int y0 = boost::numeric_cast<unsigned int>(fiy);
++
++        // Interpolation weight (range [0,1])
++        const float yw = iy - fiy;
++
++        for (unsigned int x = 0; x < outputWidth; ++x)
++        {
++            // Real-valued and discrete width coordinates in input image.
++            const float ix = boost::numeric_cast<float>(x) * scaleX;
++            const float fix = floorf(ix);
++            const unsigned int x0 = boost::numeric_cast<unsigned int>(fix);
++
++            // Interpolation weight (range [0,1]).
++            const float xw = ix - fix;
++
++            // Discrete width/height coordinates of texels below and to the right of (x0, y0).
++            const unsigned int x1 = std::min(x0 + 1, inputWidth - 1u);
++            const unsigned int y1 = std::min(y0 + 1, inputHeight - 1u);
++														   
++			pixelOffset00 = x0 * inChnum + y0 * inputWidth * inChnum;
++			pixelOffset10 = x1 * inChnum + y0 * inputWidth * inChnum;
++			pixelOffset01 = x0 * inChnum + y1 * inputWidth * inChnum;
++			pixelOffset11 = x1 * inChnum + y1 * inputWidth * inChnum;
++			for (unsigned int c = 0; c < 3; ++c)
++			{
++			   rgb_x0y0[c] = input[pixelOffset00+c];
++			   rgb_x1y0[c] = input[pixelOffset10+c];
++			   rgb_x0y1[c] = input[pixelOffset01+c];
++			   rgb_x1y1[c] = input[pixelOffset11+c];
++			}
++
++	
++            for (unsigned c=0; c<3; ++c)
++            {
++                const float ly0 = Lerpfloat(float(rgb_x0y0[c]), float(rgb_x1y0[c]), xw);
++                const float ly1 = Lerpfloat(float(rgb_x0y1[c]), float(rgb_x1y1[c]), xw);
++                const float l = Lerpfloat(ly0, ly1, yw);
++                out[(3*((y*outputWidth)+x)) + c] = static_cast<float>(l)/255.0f;
++            }
++        }
++    }
++    return out;
++}
++
++namespace
++{
++
++// Configure boost::program_options for command-line parsing and validation.
++namespace po = boost::program_options;
++
++template<typename T, typename TParseElementFunc>
++std::vector<T> ParseArrayImpl(std::istream& stream, TParseElementFunc parseElementFunc)
++{
++    std::vector<T> result;
++    // Processes line-by-line.
++    std::string line;
++    while (std::getline(stream, line))
++    {
++        std::vector<std::string> tokens;
++        try
++        {
++            // Coverity fix: boost::split() may throw an exception of type boost::bad_function_call.
++            boost::split(tokens, line, boost::algorithm::is_any_of("\t ,;:"), boost::token_compress_on);
++        }
++        catch (const std::exception& e)
++        {
++            BOOST_LOG_TRIVIAL(error) << "An error occurred when splitting tokens: " << e.what();
++            continue;
++        }
++        for (const std::string& token : tokens)
++        {
++            if (!token.empty()) // See https://stackoverflow.com/questions/10437406/
++            {
++                try
++                {
++                    result.push_back(parseElementFunc(token));
++                }
++                catch (const std::exception&)
++                {
++                    BOOST_LOG_TRIVIAL(error) << "'" << token << "' is not a valid number. It has been ignored.";
++                }
++            }
++        }
++    }
++
++    return result;
++}
++
++bool CheckOption(const po::variables_map& vm,
++                 const char* option)
++{
++    // Check that the given option is valid.
++    if (option == nullptr)
++    {
++        return false;
++    }
++
++    // Check whether 'option' is provided.
++    return vm.find(option) != vm.end();
++}
++
++void CheckOptionDependency(const po::variables_map& vm,
++                           const char* option,
++                           const char* required)
++{
++    // Check that the given options are valid.
++    if (option == nullptr || required == nullptr)
++    {
++        throw po::error("Invalid option to check dependency for");
++    }
++
++    // Check that if 'option' is provided, 'required' is also provided.
++    if (CheckOption(vm, option) && !vm[option].defaulted())
++    {
++        if (CheckOption(vm, required) == 0 || vm[required].defaulted())
++        {
++            throw po::error(std::string("Option '") + option + "' requires option '" + required + "'.");
++        }
++    }
++}
++
++void CheckOptionDependencies(const po::variables_map& vm)
++{
++    CheckOptionDependency(vm, "model-path", "model-format");
++    CheckOptionDependency(vm, "model-path", "input-name");
++    CheckOptionDependency(vm, "model-path", "input-tensor-data");
++    CheckOptionDependency(vm, "model-path", "output-name");
++    CheckOptionDependency(vm, "input-tensor-shape", "model-path");
++}
++
++template<typename T>
++std::vector<T> ParseArray(std::istream& stream);
++
++template<>
++std::vector<unsigned int> ParseArray(std::istream& stream)
++{
++    return ParseArrayImpl<unsigned int>(stream,
++        [](const std::string& s) { return boost::numeric_cast<unsigned int>(std::stoi(s)); });
++}
++
++void RemoveDuplicateDevices(std::vector<armnn::Compute>& computeDevices)
++{
++    // Mark the duplicate devices as 'Undefined'.
++    for (auto i = computeDevices.begin(); i != computeDevices.end(); ++i)
++    {
++        for (auto j = std::next(i); j != computeDevices.end(); ++j)
++        {
++            if (*j == *i)
++            {
++                *j = armnn::Compute::Undefined;
++            }
++        }
++    }
++
++    // Remove 'Undefined' devices.
++    computeDevices.erase(std::remove(computeDevices.begin(), computeDevices.end(), armnn::Compute::Undefined),
++                         computeDevices.end());
++}
++
++bool CheckDevicesAreValid(const std::vector<armnn::Compute>& computeDevices)
++{
++    return (!computeDevices.empty()
++            && std::none_of(computeDevices.begin(), computeDevices.end(),
++                            [](armnn::Compute c){ return c == armnn::Compute::Undefined; }));
++}
++
++} // namespace
++
++template<typename TParser, typename TDataType>
++int MainImpl(const char* modelPath,
++             bool isModelBinary,
++             const std::vector<armnn::Compute>& computeDevice,
++             const char* inputName,
++             const armnn::TensorShape* inputTensorShape,
++             const char* inputTensorDataFilePath,
++             const char* outputName,
++             bool enableProfiling,
++             const size_t number_frame,
++             const std::shared_ptr<armnn::IRuntime>& runtime = nullptr)
++{
++    // Loads input tensor.
++    std::vector<uint8_t> input;
++    std::vector<float> input_resized;
++
++    try
++    {
++        // Creates an InferenceModel, which will parse the model and load it into an IRuntime.
++        typename InferenceModel<TParser, TDataType>::Params params;
++        //const armnn::TensorShape inputTensorShape({ 1, 224, 224 3});
++        params.m_ModelPath = modelPath;
++        params.m_IsModelBinary = isModelBinary;
++        params.m_ComputeDevice = computeDevice;
++        params.m_InputBinding = inputName;
++        params.m_InputTensorShape = inputTensorShape;
++        params.m_OutputBinding = outputName;
++        params.m_EnableProfiling = enableProfiling;
++        params.m_SubgraphId = 0;
++        InferenceModel<TParser, TDataType> model(params, runtime);
++
++		VideoCapture cap;
++		int input_type = INPUT_IMAGE;
++		std::string filename = inputTensorDataFilePath;
++
++	    size_t i = filename.rfind("camera_live_input", filename.length());
++		if (i != string::npos)
++		{
++            cap = VideoCapture(1);
++   		    namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
++			input_type = INPUT_CAMERA; //camera input
++		}
++	    else if((filename.substr(filename.find_last_of(".") + 1) == "mp4") || 
++    	   (filename.substr(filename.find_last_of(".") + 1) == "mov") ||
++	       (filename.substr(filename.find_last_of(".") + 1) == "avi") )
++	    {
++            cap = VideoCapture(inputTensorDataFilePath);
++			if (! cap.isOpened())
++			{
++				std::cout << "Cannot open video input: " << inputTensorDataFilePath << std::endl;
++				return (-1);
++			}
++
++    		namedWindow("ARMNN MobileNet Example", WINDOW_AUTOSIZE | CV_GUI_NORMAL);
++			input_type = INPUT_VIDEO; //video clip input
++		}
++        if (input_type != INPUT_IMAGE)
++		{
++            //set the callback function for any mouse event. Used for right click mouse to exit the program.
++            setMouseCallback("ARMNN MobileNet Example", imagenetCallBackFunc, NULL);			
++		}
++
++        for (unsigned int i=0; i < number_frame; i++)
++		{
++            if (input_type != INPUT_IMAGE)
++			{
++				cap.grab();
++				cap.retrieve(test_image);		
++			}
++			std::unique_ptr<ImageData> inputData = loadImageData(inputTensorDataFilePath, cap, test_image, input_type);
++			input.resize(inputData->m_size);
++			
++			input = std::move(inputData->m_image);
++ 			input_resized = ResizeBilinear(input, inputData->m_width, inputData->m_height, inputData->m_chnum, 224, 224);
++			// Executes the model.
++			std::vector<TDataType> output(model.GetOutputSize());
++
++            predictStart = high_resolution_clock::now();
++
++			model.Run(input_resized, output);
++
++            predictEnd = high_resolution_clock::now();
++
++            // duration<double> will convert the time difference into seconds as a double by default.
++            double timeTakenS = duration<double>(predictEnd - predictStart).count();
++			double preformance_ret = static_cast<double>(1.0/timeTakenS);
++
++			// Convert 1-hot output to an integer label and print
++			int label = static_cast<int>(std::distance(output.begin(), std::max_element(output.begin(), output.end())));
++            std::fstream file("/usr/share/arm/armnn/models/labels.txt");
++			std::string predict_target_name;
++			for (int i=0; i <= label; i++)
++			{
++				std::getline(file, predict_target_name);
++			}
++        	std::cout << "Predicted: " << predict_target_name << std::endl;
++			std::cout << "Performance (FPS): " << preformance_ret << std::endl;
++
++            if (input_type != INPUT_IMAGE)
++			{
++	    		//convert image format back to BGR for OpenCV imshow from RGB format required by armnn.
++    			cv::cvtColor(test_image, test_image, CV_RGB2BGR); 
++   		        // output identified object name on top of input image
++				cv::putText(test_image, predict_target_name,
++					cv::Point(rectCrop.x + 5,rectCrop.y + 20), // Coordinates
++					cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
++					1.0, // Scale. 2.0 = 2x bigger
++					cv::Scalar(0,0,255), // Color
++					1, // Thickness
++					8); // Line type
++					
++   		        // output preformance in FPS on top of input image
++				std::string preformance_ret_string = "Performance (FPS): " + boost::lexical_cast<std::string>(preformance_ret);				
++				cv::putText(test_image, preformance_ret_string,
++					cv::Point(rectCrop.x + 5,rectCrop.y + 40), // Coordinates
++					cv::FONT_HERSHEY_COMPLEX_SMALL, // Font
++					1.0, // Scale. 2.0 = 2x bigger
++					cv::Scalar(0,0,255), // Color
++					1, // Thickness
++					8); // Line type
++
++				cv::imshow("ARMNN MobileNet Example", test_image);
++				waitKey(2);
++            }
++		}
++    }
++    catch (armnn::Exception const& e)
++    {
++        BOOST_LOG_TRIVIAL(fatal) << "Armnn Error: " << e.what();
++        return EXIT_FAILURE;
++    }
++
++    return EXIT_SUCCESS;
++}
++
++// This will run a test
++int RunTest(const std::string& modelFormat,
++            const std::string& inputTensorShapeStr,
++            const vector<armnn::Compute>& computeDevice,
++            const std::string& modelPath,
++            const std::string& inputName,
++            const std::string& inputTensorDataFilePath,
++            const std::string& outputName,
++            bool enableProfiling,
++            const size_t subgraphId,
++            const std::shared_ptr<armnn::IRuntime>& runtime = nullptr)
++{
++    // Parse model binary flag from the model-format string we got from the command-line
++    bool isModelBinary;
++    if (modelFormat.find("bin") != std::string::npos)
++    {
++        isModelBinary = true;
++    }
++    else if (modelFormat.find("txt") != std::string::npos || modelFormat.find("text") != std::string::npos)
++    {
++        isModelBinary = false;
++    }
++    else
++    {
++        BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Please include 'binary' or 'text'";
++        return EXIT_FAILURE;
++    }
++
++    // Parse input tensor shape from the string we got from the command-line.
++    std::unique_ptr<armnn::TensorShape> inputTensorShape;
++    if (!inputTensorShapeStr.empty())
++    {
++        std::stringstream ss(inputTensorShapeStr);
++        std::vector<unsigned int> dims = ParseArray<unsigned int>(ss);
++
++        try
++        {
++            // Coverity fix: An exception of type armnn::InvalidArgumentException is thrown and never caught.
++            inputTensorShape = std::make_unique<armnn::TensorShape>(dims.size(), dims.data());
++        }
++        catch (const armnn::InvalidArgumentException& e)
++        {
++            BOOST_LOG_TRIVIAL(fatal) << "Cannot create tensor shape: " << e.what();
++            return EXIT_FAILURE;
++        }
++    }
++
++    // Forward to implementation based on the parser type
++    if (modelFormat.find("caffe") != std::string::npos)
++    {
++#if defined(ARMNN_CAFFE_PARSER)
++        return MainImpl<armnnCaffeParser::ICaffeParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                               inputName.c_str(), inputTensorShape.get(),
++                                                               inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                               enableProfiling, subgraphId, runtime);
++#else
++        BOOST_LOG_TRIVIAL(fatal) << "Not built with Caffe parser support.";
++        return EXIT_FAILURE;
++#endif
++    }
++    else if (modelFormat.find("onnx") != std::string::npos)
++{
++#if defined(ARMNN_ONNX_PARSER)
++    return MainImpl<armnnOnnxParser::IOnnxParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                         inputName.c_str(), inputTensorShape.get(),
++                                                         inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                         enableProfiling, subgraphId, runtime);
++#else
++    BOOST_LOG_TRIVIAL(fatal) << "Not built with Onnx parser support.";
++    return EXIT_FAILURE;
++#endif
++    }
++    else if (modelFormat.find("tensorflow") != std::string::npos)
++    {
++#if defined(ARMNN_TF_PARSER)
++        return MainImpl<armnnTfParser::ITfParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                         inputName.c_str(), inputTensorShape.get(),
++                                                         inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                         enableProfiling, subgraphId, runtime);
++#else
++        BOOST_LOG_TRIVIAL(fatal) << "Not built with Tensorflow parser support.";
++        return EXIT_FAILURE;
++#endif
++    }
++    else if(modelFormat.find("tflite") != std::string::npos)
++    {
++#if defined(ARMNN_TF_LITE_PARSER)
++        if (! isModelBinary)
++        {
++            BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat << "'. Only 'binary' format supported \
++              for tflite files";
++            return EXIT_FAILURE;
++        }
++        return MainImpl<armnnTfLiteParser::ITfLiteParser, float>(modelPath.c_str(), isModelBinary, computeDevice,
++                                                                 inputName.c_str(), inputTensorShape.get(),
++                                                                 inputTensorDataFilePath.c_str(), outputName.c_str(),
++                                                                 enableProfiling, subgraphId, runtime);
++#else
++        BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
++            "'. Please include 'caffe', 'tensorflow', 'tflite' or 'onnx'";
++        return EXIT_FAILURE;
++#endif
++    }
++    else
++    {
++        BOOST_LOG_TRIVIAL(fatal) << "Unknown model format: '" << modelFormat <<
++                                 "'. Please include 'caffe', 'tensorflow', 'tflite' or 'onnx'";
++        return EXIT_FAILURE;
++    }
++}
++
++int RunCsvTest(const armnnUtils::CsvRow &csvRow,
++               const std::shared_ptr<armnn::IRuntime>& runtime)
++{
++    std::string modelFormat;
++    std::string modelPath;
++    std::string inputName;
++    std::string inputTensorShapeStr;
++    std::string inputTensorDataFilePath;
++    std::string outputName;
++
++    size_t subgraphId = 0;
++
++    po::options_description desc("Options");
++    try
++    {
++        desc.add_options()
++        ("model-format,f", po::value(&modelFormat),
++         "caffe-binary, caffe-text, tflite-binary, onnx-binary, onnx-text, tensorflow-binary or tensorflow-text.")
++        ("model-path,m", po::value(&modelPath), "Path to model file, e.g. .caffemodel, .prototxt, .tflite,"
++         " .onnx")
++        ("compute,c", po::value<std::vector<armnn::Compute>>()->multitoken(),
++         "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
++        ("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network.")
++        ("input-tensor-shape,s", po::value(&inputTensorShapeStr),
++         "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
++         "This parameter is optional, depending on the network.")
++        ("input-tensor-data,d", po::value(&inputTensorDataFilePath),
++         "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
++        ("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
++        ("event-based-profiling,e", po::bool_switch()->default_value(false),
++         "Enables built in profiler. If unset, defaults to off.")
++        ("number-frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process " );
++    }
++    catch (const std::exception& e)
++    {
++        // Coverity points out that default_value(...) can throw a bad_lexical_cast,
++        // and that desc.add_options() can throw boost::io::too_few_args.
++        // They really won't in any of these cases.
++        BOOST_ASSERT_MSG(false, "Caught unexpected exception");
++        BOOST_LOG_TRIVIAL(fatal) << "Fatal internal error: " << e.what();
++        return EXIT_FAILURE;
++    }
++
++    std::vector<const char*> clOptions;
++    clOptions.reserve(csvRow.values.size());
++    for (const std::string& value : csvRow.values)
++    {
++        clOptions.push_back(value.c_str());
++    }
++
++    po::variables_map vm;
++    try
++    {
++        po::store(po::parse_command_line(static_cast<int>(clOptions.size()), clOptions.data(), desc), vm);
++
++        po::notify(vm);
++
++        CheckOptionDependencies(vm);
++    }
++    catch (const po::error& e)
++    {
++        std::cerr << e.what() << std::endl << std::endl;
++        std::cerr << desc << std::endl;
++        return EXIT_FAILURE;
++    }
++
++    // Remove leading and trailing whitespaces from the parsed arguments.
++    boost::trim(modelFormat);
++    boost::trim(modelPath);
++    boost::trim(inputName);
++    boost::trim(inputTensorShapeStr);
++    boost::trim(inputTensorDataFilePath);
++    boost::trim(outputName);
++
++    // Get the value of the switch arguments.
++    bool enableProfiling = vm["event-based-profiling"].as<bool>();
++
++    // Get the preferred order of compute devices.
++    std::vector<armnn::Compute> computeDevices = vm["compute"].as<std::vector<armnn::Compute>>();
++
++    // Remove duplicates from the list of compute devices.
++    RemoveDuplicateDevices(computeDevices);
++
++    // Check that the specified compute devices are valid.
++    if (!CheckDevicesAreValid(computeDevices))
++    {
++        BOOST_LOG_TRIVIAL(fatal) << "The list of preferred devices contains an invalid compute";
++        return EXIT_FAILURE;
++    }
++
++    return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
++                   modelPath, inputName, inputTensorDataFilePath, outputName, enableProfiling, subgraphId, runtime);
++}
++
++int main(int argc, const char* argv[])
++{
++    // Configures logging for both the ARMNN library and this test program.
++#ifdef NDEBUG
++    armnn::LogSeverity level = armnn::LogSeverity::Info;
++#else
++    armnn::LogSeverity level = armnn::LogSeverity::Debug;
++#endif
++    armnn::ConfigureLogging(true, true, level);
++    armnnUtils::ConfigureLogging(boost::log::core::get().get(), true, true, level);
++
++    std::string testCasesFile;
++
++    std::string modelFormat = "tensorflow-binary";
++    std::string modelPath = "/usr/share/arm/armnn/models/mobilenet_v1_1.0_224_frozen.pb";
++    std::string inputName = "input";
++    std::string inputTensorShapeStr = "1 224 224 3";
++    std::string inputTensorDataFilePath = "/usr/share/arm/armnn/testvecs/test2.mp4";
++    std::string outputName = "MobilenetV1/Predictions/Reshape_1";
++    std::vector<armnn::Compute> computeDevices = {armnn::Compute::CpuAcc};
++
++    // Catch ctrl-c to ensure a clean exit
++    signal(SIGABRT, exit);
++    signal(SIGTERM, exit);
++
++    if (argc == 1)
++	{
++		return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
++                       modelPath, inputName, inputTensorDataFilePath, outputName, false, 1000);
++		
++	}
++	else
++	{
++		size_t subgraphId = 0;
++		po::options_description desc("Options");
++		try
++		{
++			desc.add_options()
++				("help", "Display usage information")
++				("test-cases,t", po::value(&testCasesFile), "Path to a CSV file containing test cases to run. "
++				 "If set, further parameters -- with the exception of compute device and concurrency -- will be ignored, "
++				 "as they are expected to be defined in the file for each test in particular.")
++				("concurrent,n", po::bool_switch()->default_value(false),
++				 "Whether or not the test cases should be executed in parallel")
++				("model-format,f", po::value(&modelFormat),
++				 "caffe-binary, caffe-text, onnx-binary, onnx-text, tflite-binary, tensorflow-binary or tensorflow-text.")
++				("model-path,m", po::value(&modelPath), "Path to model file, e.g. .caffemodel, .prototxt,"
++				 " .tflite, .onnx")
++				("compute,c", po::value<std::vector<armnn::Compute>>()->multitoken(),
++				 "The preferred order of devices to run layers on by default. Possible choices: CpuAcc, CpuRef, GpuAcc")
++				("input-name,i", po::value(&inputName), "Identifier of the input tensor in the network.")
++				("input-tensor-shape,s", po::value(&inputTensorShapeStr),
++				 "The shape of the input tensor in the network as a flat array of integers separated by whitespace. "
++				 "This parameter is optional, depending on the network.")
++				("input-tensor-data,d", po::value(&inputTensorDataFilePath),
++				 "Input test file name. It can be image/video clip file name or use 'camera_live_input' to select camera input.")
++				("output-name,o", po::value(&outputName), "Identifier of the output tensor in the network.")
++				("event-based-profiling,e", po::bool_switch()->default_value(false),
++				 "Enables built in profiler. If unset, defaults to off.")
++				("number_frame", po::value<size_t>(&subgraphId)->default_value(1), "Number of frames to process.");
++		}
++		catch (const std::exception& e)
++		{
++			// Coverity points out that default_value(...) can throw a bad_lexical_cast,
++			// and that desc.add_options() can throw boost::io::too_few_args.
++			// They really won't in any of these cases.
++			BOOST_ASSERT_MSG(false, "Caught unexpected exception");
++			BOOST_LOG_TRIVIAL(fatal) << "Fatal internal error: " << e.what();
++			return EXIT_FAILURE;
++		}
++
++		// Parses the command-line.
++		po::variables_map vm;
++		try
++		{
++			po::store(po::parse_command_line(argc, argv, desc), vm);
++
++			if (CheckOption(vm, "help") || argc <= 1)
++			{
++				std::cout << "Executes a neural network model using the provided input tensor. " << std::endl;
++				std::cout << "Prints the resulting output tensor." << std::endl;
++				std::cout << std::endl;
++				std::cout << desc << std::endl;
++				return EXIT_SUCCESS;
++			}
++
++			po::notify(vm);
++		}
++		catch (const po::error& e)
++		{
++			std::cerr << e.what() << std::endl << std::endl;
++			std::cerr << desc << std::endl;
++			return EXIT_FAILURE;
++		}
++
++		// Get the value of the switch arguments.
++		bool concurrent = vm["concurrent"].as<bool>();
++		bool enableProfiling = vm["event-based-profiling"].as<bool>();
++
++		// Check whether we have to load test cases from a file.
++		if (CheckOption(vm, "test-cases"))
++		{
++			// Check that the file exists.
++			if (!boost::filesystem::exists(testCasesFile))
++			{
++				BOOST_LOG_TRIVIAL(fatal) << "Given file \"" << testCasesFile << "\" does not exist";
++				return EXIT_FAILURE;
++			}
++
++			// Parse CSV file and extract test cases
++			armnnUtils::CsvReader reader;
++			std::vector<armnnUtils::CsvRow> testCases = reader.ParseFile(testCasesFile);
++
++			// Check that there is at least one test case to run
++			if (testCases.empty())
++			{
++				BOOST_LOG_TRIVIAL(fatal) << "Given file \"" << testCasesFile << "\" has no test cases";
++				return EXIT_FAILURE;
++			}
++
++			// Create runtime
++			armnn::IRuntime::CreationOptions options;
++			std::shared_ptr<armnn::IRuntime> runtime(armnn::IRuntime::Create(options));
++
++			const std::string executableName("ExecuteNetwork");
++
++			// Check whether we need to run the test cases concurrently
++			if (concurrent)
++			{
++				std::vector<std::future<int>> results;
++				results.reserve(testCases.size());
++
++				// Run each test case in its own thread
++				for (auto&  testCase : testCases)
++				{
++					testCase.values.insert(testCase.values.begin(), executableName);
++					results.push_back(std::async(std::launch::async, RunCsvTest, std::cref(testCase), std::cref(runtime)));
++				}
++
++				// Check results
++				for (auto& result : results)
++				{
++					if (result.get() != EXIT_SUCCESS)
++					{
++						return EXIT_FAILURE;
++					}
++				}
++			}
++			else
++			{
++				// Run tests sequentially
++				for (auto&  testCase : testCases)
++				{
++					testCase.values.insert(testCase.values.begin(), executableName);
++					if (RunCsvTest(testCase, runtime) != EXIT_SUCCESS)
++					{
++						return EXIT_FAILURE;
++					}
++				}
++			}
++
++			return EXIT_SUCCESS;
++		}
++		else // Run single test
++		{
++			// Get the preferred order of compute devices.
++			std::vector<armnn::Compute> computeDevices = vm["compute"].as<std::vector<armnn::Compute>>();
++
++			// Remove duplicates from the list of compute devices.
++			RemoveDuplicateDevices(computeDevices);
++
++			// Check that the specified compute devices are valid.
++			if (!CheckDevicesAreValid(computeDevices))
++			{
++				BOOST_LOG_TRIVIAL(fatal) << "The list of preferred devices contains an invalid compute";
++				return EXIT_FAILURE;
++			}
++
++			try
++			{
++				CheckOptionDependencies(vm);
++			}
++			catch (const po::error& e)
++			{
++				std::cerr << e.what() << std::endl << std::endl;
++				std::cerr << desc << std::endl;
++				return EXIT_FAILURE;
++			}
++
++			return RunTest(modelFormat, inputTensorShapeStr, computeDevices,
++						   modelPath, inputName, inputTensorDataFilePath, outputName, enableProfiling, subgraphId);
++		}
++	}
++}
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 726a9da..c31e4ae 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -1,12 +1,13 @@
 SUMMARY = "ARM Neural Network SDK"
 DESCRIPTION = "Linux software and tools to enable machine learning (Caffe/Tensorflow) workloads on power-efficient devices"
-LICENSE = "MIT"
+LICENSE = "MIT & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
 
-PV = "20180502"
+PV = "18.08"
+PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
 BRANCH = "master"
-SRCREV = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
+SRCREV = "c577f2c6a3b4ddb6ba87a882723c53a248afbeba"
 
 S = "${WORKDIR}/git"
 
@@ -16,8 +17,20 @@ SRC_URI = " \
     git://github.com/ARM-software/armnn.git;branch=${BRANCH} \
     file://0001-stdlib-issue-work-around.patch \
     file://0002-enable-use-of-boost-shared-library.patch \
+    file://0003-add-more-test-command-arguments.patch \
+    file://0004-generate-versioned-library.patch \
+    file://0005-add-armnn-mobilenet-test-example.patch \
+    file://0006-armnn-mobilenet-test-example.patch \
+    http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz; \
+    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
 "
 
+SRC_URI[md5sum] = "d5f69cef81ad8afb335d9727a17c462a"
+SRC_URI[sha256sum] = "1ccb74dbd9c5f7aea879120614e91617db9534bdfaa53dfea54b7c14162e126b"
+
+SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
+SRCREV_FORMAT = "armnn"
+
 DEPENDS = " \
     boost \
     protobuf \
@@ -25,6 +38,7 @@ DEPENDS = " \
     arm-compute-library \
     armnn-caffe \
     armnn-tensorflow \
+    opencv \
 "
 
 RDEPENDS_${PN} = " arm-compute-library protobuf boost "
@@ -39,21 +53,28 @@ EXTRA_OECMAKE=" \
     -DARMCOMPUTENEON=1 \
     -DBUILD_TESTS=1 -DPROFILING=1 \
     -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
+    -DBUILD_ARMNN_EXAMPLES=1 \
+    -DGENERIC_LIB_VERSION=${PV} -DGENERIC_LIB_SOVERSION=${PV_MAJOR} \
 "
 
+TESTVECS_INSTALL_DIR = "${datadir}/arm/armnn"
+
 do_install_append() {
     CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
     install -d ${D}${bindir}
     find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
     cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
+    install -d ${D}${TESTVECS_INSTALL_DIR}/models
+    cp ${WORKDIR}/mobilenet_v1_1.0_224_frozen.pb  ${D}${TESTVECS_INSTALL_DIR}/models
+    cp ${WORKDIR}/git/tests/TfMobileNet-Armnn/labels.txt  ${D}${TESTVECS_INSTALL_DIR}/models
+    install -d ${D}${TESTVECS_INSTALL_DIR}/testvecs
+    cp ${WORKDIR}/tidl-api/examples/classification/clips/test2.mp4  ${D}${TESTVECS_INSTALL_DIR}/testvecs
     chrpath -d ${D}${bindir}/*
 }
 
 CXXFLAGS += "-fopenmp"
 LIBS += "-larmpl_lp64_mp"
 
-SOLIBS = ".so"
-FILES_SOLIBSDEV = ""
 FILES_${PN} += "{bindir}/*"
 FILES_${PN} += "{libdir}/*"
 FILES_${PN}-dev += "{libdir}/cmake/*"
-- 
1.9.1


