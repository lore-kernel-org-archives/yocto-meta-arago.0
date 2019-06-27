Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4F6FF52995
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2019 12:19:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RCIwpP130855
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 07:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561637938;
	bh=ooMb20eeoTRoX1QuNHnl/o1qnQzmqhj2IFt407FU0Nk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ZMOcliqSBaH5R9v3mAQZOcj0uZCUYXjh782Efzbu33/5qrpP3N1+uabm9nEQP8qOv
	Nvq2bMrGQRwn/nwfxiGqAUb2wiAhSDEd4FPyyOj2HyTUMeg1kGkgOJ3/0pswo1rLVO
	x+4ch32UyiU5R6YCRrDtgqrXfDLuHFrdnVQA6+dc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RCIwlD067929
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2019 07:18:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 27 Jun 2019 07:18:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 27 Jun 2019 07:18:58 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RCIvds092736;
	Thu, 27 Jun 2019 07:18:58 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190625164806.25417-1-x0157990@ti.com>
	<20190625164806.25417-2-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f40f4392-d20a-58ac-caac-c3629d0857a2@ti.com>
Date: Thu, 27 Jun 2019 08:18:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625164806.25417-2-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH v2 2/2] armnn: Upgrade to 19.05 version
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
X-List-Received-Date: Thu, 27 Jun 2019 12:19:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake

On 6/25/2019 12:48 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../0004-generate-versioned-library.patch     | 52 +++++++------------
>   ...005-add-armnn-mobilenet-test-example.patch | 17 +++---
>   .../0006-armnn-mobilenet-test-example.patch   |  4 +-
>   .../recipes-support/armnn/armnn_git.bb        | 10 ++--
>   4 files changed, 35 insertions(+), 48 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
> index aaea2a7e..06756130 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
> +++ b/meta-arago-extras/recipes-support/armnn/armnn/0004-generate-versioned-library.patch
> @@ -1,19 +1,19 @@
> -From 00dc7ad438b9d751201b8e8d5aa747a19d1cac3b Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Wed, 13 Feb 2019 11:11:52 -0500
> +From ad22150032bda1b1a8d0f0cb4b0b020f80724313 Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <x0157990@ti.com>
> +Date: Mon, 24 Jun 2019 15:10:04 -0400
>   Subject: [PATCH] generate versioned library
>   
>   Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Qin Su <qsu@ti.com>
> +Signed-off-by: Djordje Senicic <x0157990@ti.com>
>   ---
> - CMakeLists.txt | 6 ++++++
> - 1 file changed, 6 insertions(+)
> + CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
>   
>   diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 2768f6a..c16383a 100644
> +index b6c97761..5c7b13a7 100644
>   --- a/CMakeLists.txt
>   +++ b/CMakeLists.txt
> -@@ -82,6 +82,7 @@ if(BUILD_CAFFE_PARSER)
> +@@ -88,6 +88,7 @@ if(BUILD_CAFFE_PARSER)
>    
>        target_link_libraries(armnnCaffeParser armnn)
>        target_link_libraries(armnnCaffeParser ${PROTOBUF_LIBRARIES})
> @@ -21,7 +21,7 @@ index 2768f6a..c16383a 100644
>    
>    endif()
>    
> -@@ -106,6 +107,7 @@ if(BUILD_ONNX_PARSER)
> +@@ -112,6 +113,7 @@ if(BUILD_ONNX_PARSER)
>    
>        # Protobuf
>        target_link_libraries(armnnOnnxParser ${PROTOBUF_LIBRARIES})
> @@ -29,38 +29,22 @@ index 2768f6a..c16383a 100644
>    endif()
>    
>    if(BUILD_TF_PARSER)
> -@@ -129,6 +131,7 @@ if(BUILD_TF_PARSER)
> +@@ -135,6 +137,7 @@ if(BUILD_TF_PARSER)
>    
>        # Protobuf (use the specific version tensorflow wants)
>        target_link_libraries(armnnTfParser ${PROTOBUF_LIBRARIES})
>   +    set_target_properties(armnnTfParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
>    endif()
>    
> - if(BUILD_TF_LITE_PARSER)
> -@@ -147,6 +150,7 @@ if(BUILD_TF_LITE_PARSER)
> + if(BUILD_ARMNN_QUANTIZER)
> +@@ -430,6 +433,7 @@ endif()
> + install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
>    
> -     target_link_libraries(armnnTfLiteParser ${Boost_FILESYSTEM_LIBRARY} ${Boost_THREAD_LIBRARY})
> -     target_link_libraries(armnnTfLiteParser armnn ${FLATBUFFERS_LIBRARY})
> -+    set_target_properties(armnnTfLiteParser PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
> - endif()
> -
> - if(BUILD_ARMNN_SERIALIZER)
> -@@ -175,6 +179,7 @@ if(BUILD_ARMNN_SERIALIZER)
> -     target_include_directories(armnnSerializer SYSTEM PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/src/armnnSerializer)
> -
> -     target_link_libraries(armnnSerializer armnn ${FLATBUFFERS_LIBRARY})
> -+    set_target_properties(armnnSerializer PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
> - endif()
> -
> - list(APPEND armnn_sources
> -@@ -414,6 +419,7 @@ endif()
> - if(PROFILING_BACKEND_STREAMLINE)
> -     target_link_libraries(armnn pthread)
> - endif()
> -+set_target_properties( armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
> + target_link_libraries(armnn ${Boost_LOG_LIBRARY} ${Boost_THREAD_LIBRARY} ${Boost_SYSTEM_LIBRARY})
> ++set_target_properties(armnn PROPERTIES VERSION ${GENERIC_LIB_VERSION} SOVERSION ${GENERIC_LIB_SOVERSION} )
>    
> - if(BUILD_UNIT_TESTS)
> -     set(unittest_sources)
> + if(ARMCOMPUTENEON OR ARMCOMPUTECL)
> +     target_link_libraries(armnn ${ARMCOMPUTE_LIBRARIES})
>   --
> -1.9.1
> +2.17.1
>   
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
> index 47760ad5..edb37fbc 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
> +++ b/meta-arago-extras/recipes-support/armnn/armnn/0005-add-armnn-mobilenet-test-example.patch
> @@ -1,16 +1,17 @@
> -From 50c0001642c831ae1d801cb53080e1ddf501c129 Mon Sep 17 00:00:00 2001
> -From: Qin Su <qsu@ti.com>
> -Date: Wed, 13 Feb 2019 11:22:04 -0500
> +From 99a6c339f1828d3cd1b193cf702bada9011d900b Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <x0157990@ti.com>
> +Date: Mon, 24 Jun 2019 14:29:19 -0400
>   Subject: [PATCH] add armnn mobilenet test example
>   
>   Upstream-Status: Inappropriate [TI only test code]
>   Signed-off-by: Qin Su <qsu@ti.com>
> +Signed-off-by: Djordje Senicic <x0157990@ti.com>
>   ---
>    tests/CMakeLists.txt | 41 +++++++++++++++++++++++++++++++++++++++++
>    1 file changed, 41 insertions(+)
>   
>   diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> -index 9913321..6ed44ae 100644
> +index dfcf4b48..5a78d3a6 100644
>   --- a/tests/CMakeLists.txt
>   +++ b/tests/CMakeLists.txt
>   @@ -1,3 +1,6 @@
> @@ -20,9 +21,9 @@ index 9913321..6ed44ae 100644
>    # UnitTests
>    include(CheckIncludeFiles)
>    
> -@@ -278,3 +281,41 @@ if (BUILD_ARMNN_SERIALIZER OR BUILD_CAFFE_PARSER OR BUILD_TF_PARSER OR BUILD_TF_
> -         ${Boost_PROGRAM_OPTIONS_LIBRARY})
> -     addDllCopyCommands(ExecuteNetwork)
> +@@ -348,3 +351,41 @@ if(BUILD_ARMNN_QUANTIZER)
> +     add_executable_ex(ImageCSVFileGenerator ${ImageCSVFileGenerator_sources})
> +     ImageTensorExecutor(ImageCSVFileGenerator)
>    endif()
>   +
>   +if (BUILD_ARMNN_EXAMPLES)
> @@ -63,5 +64,5 @@ index 9913321..6ed44ae 100644
>   +    addDllCopyCommands(ArmnnExamples)
>   +endif()
>   --
> -1.9.1
> +2.17.1
>   
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
> index a6ce01af..54984105 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
> +++ b/meta-arago-extras/recipes-support/armnn/armnn/0006-armnn-mobilenet-test-example.patch
> @@ -326,9 +326,9 @@ index 0000000..53a11cc
>   +    params.m_InputBindings = { inputName };
>   +    params.m_InputShapes = { *inputTensorShape };
>   +    params.m_OutputBindings = { outputName };
> -+    params.m_EnableProfiling = enableProfiling;
> ++    //params.m_EnableProfiling = enableProfiling;
>   +    params.m_SubgraphId = 0;
> -+    InferenceModel<TParser, TDataType> model(params, runtime);
> ++    InferenceModel<TParser, TDataType> model(params, enableProfiling, runtime);
>   +
>   +    VideoCapture cap;
>   +    int input_type = INPUT_IMAGE;
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> index b5ebd129..076ea3aa 100644
> --- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074 \
>                       file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>   
>   PR = "r0"
> -PV = "19.02"
> +PV = "19.05"
>   PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
>   
> -BRANCH = "master"
> -SRCREV = "0028d1b0ce5f4c2c6a6eb3c66f38111c21eb47a3"
> +BRANCH = "branches/armnn_19_05"
> +SRCREV = "a723ec5d2ac35948efb5dfd0c121a1a89cb977b7"
> +
>   SRCREV_tidl-api = "7e9a3942ec38efd64d45e34c10cba2f2938f5618"
> +BRANCH_tidl-api = "master"
>   
>   SRCREV_FORMAT = "armnn"
>   
> @@ -30,7 +32,7 @@ SRC_URI = " \
>       file://0007-enable-use-of-arm-compute-shared-library.patch \
>       file://0008-Avoid-stringop-overflow-warning-resulting-in-compila.patch \
>       http://download.tensorflow.org/models/mobilenet_v1_2018_02_22/mobilenet_v1_1.0_224.tgz;name=mobilenet;subdir=${WORKDIR}/tfmodel;destsuffix=tfmodel \
> -    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
> +    git://git.ti.com/tidl/tidl-api.git;name=tidl-api;branch=${BRANCH_tidl-api};subdir=${WORKDIR}/tidl-api;destsuffix=tidl-api \
>   "
>   
>   SRC_URI[mobilenet.md5sum] = "d5f69cef81ad8afb335d9727a17c462a"

