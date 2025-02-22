Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1B6C021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 17:24:14 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.50768.1740245047221519477
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Feb 2025 09:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M7HfL0Jv;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51MHO4PX548043
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Feb 2025 11:24:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740245044;
	bh=xHiZoEa3hpW0KWFxu602/v1nMLP82aZXd5JhizEuus8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M7HfL0JvYOVrLvRY/DU0xIdyuDoSQ/lOaHFmVmuEcE6c1csqKiqRl+6LFJmJ2YdPc
	 Xie1Jd0T/BfMjWmYPOEXhk8YihIgaqcCjs7k9Wiem/w+oAgCfvxzrY3CbkLgi4u0I9
	 mr1ropkULk2hubuCyE433EHsd+LT6igTpH4p79hE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51MHO4iw066502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Feb 2025 11:24:04 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 22
 Feb 2025 11:24:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 22 Feb 2025 11:24:03 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51MHO3Fd075046;
	Sat, 22 Feb 2025 11:24:03 -0600
Message-ID: <0fbdf01d-c1d5-43d3-8f6f-3f45a3708599@ti.com>
Date: Sat, 22 Feb 2025 11:24:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v2 1/1] meta-arago-extras: Add
 recipe for TFLite Runtime
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Vijay
	<vijayp@ti.com>, Khasim <khasim@ti.com>
References: <20250221222446.4019819-1-c-shilwant@ti.com>
 <20250221222446.4019819-2-c-shilwant@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250221222446.4019819-2-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Feb 2025 17:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15902

On 2/21/25 4:24 PM, Chirag Shilwant wrote:
> - TensorFlow Lite is TensorFlow's lightweight solution for mobile
> and embedded devices. It enables low-latency inference of on-device
> machine learning models with a small binary size.
> 
> - The tensorflow-lite v2.18 recipe in meta-arago currently supports,
> 
>    * CPU delegate (with RUY enabled), XNNPACK delegate & ArmNN
>      via external delegate for ARMv8 based Cortex-A platforms.
> 
>    * CPU delegate (with RUY enabled) & ArmNN via external delegate
>      for ARMv7 based Cortex-A platforms.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   ...eLists-for-building-_pywrap_tensorfl.patch |  37 +++
>   ...eLists-for-building-shared-object-li.patch |  61 +++++
>   ...uild-issues-observed-in-TFlite-v2.18.patch |  36 +++
>   .../tensorflow-lite/tensorflow2-lite.pc.in    |   6 +
>   .../tensorflow-lite/tensorflow-lite_2.18.0.bb | 232 ++++++++++++++++++
>   5 files changed, 372 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/tensorflow2-lite.pc.in
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
> 
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
> new file mode 100644
> index 00000000..e277beb3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
> @@ -0,0 +1,37 @@
> +From 050127548d7f28464cbe5dc9caa83c8023676d80 Mon Sep 17 00:00:00 2001
> +From: Chirag Shilwant <c-shilwant@ti.com>
> +Date: Thu, 13 Feb 2025 14:33:50 +0530
> +Subject: [PATCH 1/3] lite: Update CMakeLists for building
> + _pywrap_tensorflow_interpreter_wrapper
> +
> +- Update the CMakeLists.txt file for TensorFlow Lite to include the paths for
> +PYTHON, Numpy, and PYBIND11 headers.
> +
> +- This ensures that these headers are available during the build process,
> +which is necessary for building the _pywrap_tensorflow_interpreter_wrapper
> +target that relies on these dependencies.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> +---
> + tensorflow/lite/CMakeLists.txt | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
> +index bce9627fbd3..b7bb39869b5 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -810,6 +810,9 @@ set_target_properties(_pywrap_tensorflow_interpreter_wrapper PROPERTIES PREFIX "
> + target_include_directories(_pywrap_tensorflow_interpreter_wrapper
> +   PUBLIC
> +     ${TENSORFLOW_SOURCE_DIR}
> ++    ${PYTHON_TARGET_INCLUDE}
> ++    ${NUMPY_TARGET_INCLUDE}
> ++    ${PYBIND11_TARGET_INCLUDE}
> + )
> +
> + target_link_libraries(_pywrap_tensorflow_interpreter_wrapper
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
> new file mode 100644
> index 00000000..dce229fd
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
> @@ -0,0 +1,61 @@
> +From 339b5a7e5f17a60df1e3d6d2ffe607786ce34978 Mon Sep 17 00:00:00 2001
> +From: Chirag Shilwant <c-shilwant@ti.com>
> +Date: Thu, 13 Feb 2025 14:38:01 +0530
> +Subject: [PATCH 2/3] lite: Update CMakeLists for building shared object
> + library
> +
> +- When building TFLite with CMake, it builds static library
> +(i.e. libtensorflow-lite.a) by default which isn't self-contained
> +since all the transitive dependencies are not included [1]
> +
> +- As documented in [1], there's an update needed in CMake build steps
> +inorder to generate a shared object library (i.e. libtensorflow-lite.so)
> +
> +- This patch adds schema_conversion_utils.cc to TFLite source files
> +& updates CMakeLists.txt to build TFLite as a shared library. Additionally,
> +it ensures that the properties are set correctly to manage the shared
> +object version.
> +
> +[1]: https://ai.google.dev/edge/litert/build/cmake#step_5_build_litert
> +
> +Upstream-Status: Inappropriate [enable feature]
> +
> +Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> +---
> + tensorflow/lite/CMakeLists.txt | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
> +index b7bb39869b5..92b05e42446 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -671,6 +671,7 @@ set(_ALL_TFLITE_SRCS
> +   ${TFLITE_SOURCE_DIR}/kernels/internal/utils/sparsity_format_converter.cc
> +   ${TFLITE_SOURCE_DIR}/schema/conversion_metadata_generated.h
> +   ${TFLITE_SOURCE_DIR}/schema/schema_generated.h
> ++  ${TFLITE_SOURCE_DIR}/schema/schema_conversion_utils.h
> +   ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/schema_utils.cc
> +   ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/schema_generated.h
> +   ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/conversion_metadata_generated.h
> +@@ -697,7 +698,7 @@ else()
> +   list(FILTER _ALL_TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation\\.cc$")
> + endif()
> +
> +-add_library(tensorflow-lite
> ++add_library(tensorflow-lite SHARED EXCLUDE_FROM_ALL
> +   ${_ALL_TFLITE_SRCS}
> + )
> + set(_ALL_TFLITE_HDRS ${_ALL_TFLITE_SRCS})
> +@@ -773,6 +774,9 @@ if(TFLITE_ENABLE_INSTALL)
> +   )
> + endif()
> +
> ++# Manage version for shared object (dynamic) library
> ++set_target_properties(tensorflow-lite PROPERTIES VERSION "${TFLITE_VERSION_MAJOR}")
> ++
> + # The kernel tests.
> + if(TFLITE_KERNEL_TEST)
> +   enable_testing()
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
> new file mode 100644
> index 00000000..0e21b254
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
> @@ -0,0 +1,36 @@
> +From 577192caa67660f857f2869896d01db3611b4128 Mon Sep 17 00:00:00 2001
> +From: Chirag Shilwant <c-shilwant@ti.com>
> +Date: Thu, 13 Feb 2025 14:45:46 +0530
> +Subject: [PATCH 3/3] CMakeLists: Fix build issues observed in TFlite v2.18
> +
> +- Improve regular expression for filtering neon and sse
> +related sources. The improved expression avoids missing files
> +in case the absolute path contains the terms neon or sse.
> +
> +- Fixes [1]
> +
> +[1]: https://github.com/tensorflow/tensorflow/issues/70730
> +
> +Upstream-Status: Backport from master
> +
> +Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> +---
> + tensorflow/lite/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.txt
> +index 92b05e42446..737f754621f 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -605,7 +605,7 @@ populate_tflite_source_vars("kernels/internal/reference/sparse_ops"
> + )
> + populate_tflite_source_vars("kernels/internal/optimized/4bit"
> +   TFLITE_KERNEL_INTERNAL_OPT_4BIT_SRCS
> +-  FILTER "(.*neon.*|.*sse.*)\\.(cc|h)"
> ++  FILTER "(.*neon_.*|.*sse_.*)\\.(cc|h)"
> + )
> + set(TFLITE_PROFILER_SRCS
> +   ${TFLITE_SOURCE_DIR}/profiling/platform_profiler.cc
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/tensorflow2-lite.pc.in b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/tensorflow2-lite.pc.in
> new file mode 100644
> index 00000000..8c5bf2e0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/tensorflow2-lite.pc.in
> @@ -0,0 +1,6 @@
> +Name: tensorflow lite c++ shared library
> +Description: tensorflow lite c++ shared library
> +Version: @version@
> +Requires:
> +Libs: -L@libdir@ -ltensorflowlite -lrt
> +Cflags: -I@includedir@
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
> new file mode 100644
> index 00000000..a20c090a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
> @@ -0,0 +1,232 @@
> +DESCRIPTION = "TensorFlow Lite is an open source deep learning framework for \
> +on-device inference."
> +AUTHOR = "Google Inc. and Yuan Tang"
> +SUMMARY = "TensorFlow Lite C++ Library, Python interpreter & Benchmark Model"
> +HOMEPAGE = "https://www.tensorflow.org/lite"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4158a261ca7f2525513e31ba9c50ae98"
> +
> +# Get major of the PV variable
> +MAJOR = "${@d.getVar('PV').split('.')[0]}"
> +
> +SRC_URI = " \
> +    git://github.com/tensorflow/tensorflow.git;protocol=https;branch=r2.18 \
> +    file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch \
> +    file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch \
> +    file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch \
> +    file://tensorflow2-lite.pc.in \
> +"
> +
> +SRC_URI += " \
> +    git://github.com/abseil/abseil-cpp.git;protocol=https;branch=lts_2023_08_02;name=abseil-cpp;destsuffix=${S}/external/abseil-cpp \
> +    git://gitlab.com/libeigen/eigen.git;protocol=https;branch=master;name=eigen;destsuffix=${S}/external/eigen \
> +    git://github.com/google/farmhash.git;protocol=https;branch=master;name=farmhash;destsuffix=${S}/external/farmhash \
> +    git://github.com/petewarden/OouraFFT.git;protocol=https;branch=master;name=fft2d;destsuffix=${S}/external/fft2d \
> +    git://github.com/google/gemmlowp.git;branch=master;protocol=https;name=gemmlowp;destsuffix=${S}/external/gemmlowp \
> +    git://github.com/pytorch/cpuinfo.git;branch=main;protocol=https;name=cpuinfo;destsuffix=${S}/external/cpuinfo \
> +    git://github.com/jax-ml/ml_dtypes.git;branch=main;protocol=https;name=ml_dtypes;destsuffix=${S}/external/ml_dtypes \
> +    git://github.com/google/ruy.git;branch=master;protocol=https;name=ruy;destsuffix=${S}/external/ruy \
> +    git://github.com/google/flatbuffers;branch=master;protocol=https;name=flatbuffers;destsuffix=${S}/external/flatbuffers \
> +    git://github.com/Maratyszcza/pthreadpool.git;branch=master;protocol=https;name=pthreadpool-source;destsuffix=${S}/external/pthreadpool-source \
> +    git://github.com/google/XNNPACK.git;branch=master;protocol=https;name=xnnpack;destsuffix=${S}/external/xnnpack \
> +    git://github.com/Maratyszcza/FXdiv.git;branch=master;protocol=https;name=FXdiv-source;destsuffix=${S}/external/FXdiv-source \
> +    git://github.com/Maratyszcza/FP16.git;branch=master;protocol=https;name=FP16-source;destsuffix=${S}/external/FP16-source \
> +    git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=main;protocol=https;name=kleidiai;destsuffix=${S}/external/kleidiai \
> +    git://github.com/Maratyszcza/psimd.git;branch=master;protocol=https;name=psimd;destsuffix=${S}/external/psimd \
> +    git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https;name=protobuf;destsuffix=${S}/external/protobuf \
> +"
> +
> +SRCREV_FORMAT = "default"
> +
> +# Matches v${PV} tag
> +SRCREV = "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
> +SRCREV_abseil-cpp = "fb3621f4f897824c0dbe0615fa94543df6192f30"
> +SRCREV_eigen = "33d0937c6bdf5ec999939fb17f2a553183d14a74"
> +SRCREV_farmhash = "0d859a811870d10f53a594927d0d0b97573ad06d"
> +SRCREV_fft2d = "c6fd2dd6d21397baa6653139d31d84540d5449a2"
> +SRCREV_gemmlowp = "16e8662c34917be0065110bfcd9cc27d30f52fdf"
> +SRCREV_cpuinfo = "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
> +SRCREV_ml_dtypes = "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
> +SRCREV_ruy = "3286a34cc8de6149ac6844107dfdffac91531e72"
> +SRCREV_flatbuffers = "e6463926479bd6b330cbcf673f7e917803fd5831"
> +SRCREV_pthreadpool-source = "4fe0e1e183925bf8cfa6aae24237e724a96479b8"
> +SRCREV_xnnpack = "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
> +SRCREV_FXdiv-source = "63058eff77e11aa15bf531df5dd34395ec3017c8"
> +SRCREV_FP16-source = "0a92994d729ff76a58f692d3028ca1b64b145d91"
> +SRCREV_kleidiai = "cddf991af5de49fd34949fa39690e4e906e04074"
> +SRCREV_psimd = "072586a71b55b7f8c584153d223e95687148a900"
> +SRCREV_protobuf = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3 cmake
> +
> +DEPENDS = " \
> +    flatbuffers-native \
> +    python3-numpy-native \
> +    python3-pybind11-native \
> +    python3-numpy \
> +    python3 \
> +    gzip-native \
> +    protobuf-native \
> +    python3-pybind11 \
> +"
> +
> +# Set building environment variables
> +TENSORFLOW_TARGET="linux"
> +TENSORFLOW_TARGET_ARCH:aarch64="aarch64"
> +TENSORFLOW_TARGET_ARCH:arm="armv7"
> +
> +PACKAGECONFIG ??= "xnnpack ruy"
> +PACKAGECONFIG[xnnpack] = "-DTFLITE_ENABLE_XNNPACK=ON, -DTFLITE_ENABLE_XNNPACK=OFF"
> +PACKAGECONFIG[ruy] = "-DTFLITE_ENABLE_RUY=ON, -DTFLITE_ENABLE_RUY=OFF"
> +
> +# XNNPACK is not supported in Linux armv7-a [https://github.com/tensorflow/tensorflow/issues/64358]
> +# Hence, turning it off
> +PACKAGECONFIG:remove:arm = "xnnpack"
> +
> +OECMAKE_SOURCEPATH = "${S}/tensorflow/lite"
> +
> +# The -O3 flag enables high-level optimizations for performance
> +# and the -DNDEBUG flag disables debugging code, such as assertions
> +# to further optimize the build for production use.
> +# Hence, activate -O3 optimization and disable debug symbols.
> +OECMAKE_C_FLAGS_RELEASE = "-O3 -DNDEBUG"
> +OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG -flax-vector-conversions"
> +
> +OECMAKE_C_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
> +OECMAKE_CXX_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
> +
> +do_generate_toolchain_file:append:arm() {
> +    # Even if we set TENSORFLOW_TARGET_ARCH:arm as armv7, the TFLite CMake
> +    # build system still uses CMAKE_SYSTEM_PROCESSOR as arm in toolchain.cmake file
> +    # which leads to build failures. Hence, change it to armv7.
> +    sed -i 's:CMAKE_SYSTEM_PROCESSOR arm:CMAKE_SYSTEM_PROCESSOR armv7:g' ${WORKDIR}/toolchain.cmake
> +}
> +
> +# Build tensorflow-lite.so library, _pywrap_tensorflow_interpreter_wrapper.so library and the benchmark_model application
> +OECMAKE_TARGET_COMPILE =  "tensorflow-lite benchmark_model _pywrap_tensorflow_interpreter_wrapper"
> +
> +EXTRA_OECMAKE:append = " \
> +    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
> +    -DCMAKE_SYSTEM_NAME=${TENSORFLOW_TARGET} \
> +    -DCMAKE_SYSTEM_PROCESSOR=${TENSORFLOW_TARGET_ARCH} \
> +    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
> +    -DPYTHON_TARGET_INCLUDE=${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR} \
> +    -DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/core/include \
> +    -DPYBIND11_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/pybind11/include \
> +    -DTFLITE_VERSION_MAJOR=${MAJOR}  \
> +    -DTFLITE_HOST_TOOLS_DIR=${STAGING_BINDIR_NATIVE} \
> +    -DPTHREADPOOL_SOURCE_DIR=${S}/external/pthreadpool-source \
> +    -DFXDIV_SOURCE_DIR=${S}/external/FXdiv-source \
> +    -DFP16_SOURCE_DIR=${S}/external/FP16-source \
> +    -DCPUINFO_SOURCE_DIR=${S}/external/cpuinfo \
> +    -DKLEIDIAI_SOURCE_DIR=${S}/external/kleidiai \
> +    -DPSIMD_SOURCE_DIR=${S}/external/psimd \
> +    --compile-no-warning-as-error \
> +    --log-level=VERBOSE \
> +"
> +
> +do_configure:prepend() {
> +    for i in abseil-cpp cpuinfo eigen farmhash fft2d flatbuffers FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes psimd protobuf pthreadpool-source ruy xnnpack; do
> +        cp -ra ${S}/external/$i ${B}/$i
> +    done
> +
> +    # There is no Fortran compiler in the toolchain, but bitbake sets this variable anyway with unavailable
> +    # binary & it leads to "CMake Error: Could not find compiler set in environment variable FC:"
> +    unset FC

Is this still needed?

> +}
> +
> +SETUPTOOLS_SETUP_PATH = "${B}"
> +
> +do_compile:append() {
> +    # Build the python wheel (procedure extract form the build_pip_package_with_cmake.sh)
> +    BUILD_DIR=${B}
> +    TENSORFLOW_DIR=${S}
> +    TENSORFLOW_LITE_DIR="${TENSORFLOW_DIR}/tensorflow/lite"
> +    TENSORFLOW_VERSION=$(grep "_VERSION = " "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut -d= -f2 | sed "s/[ '-]//g")
> +    mkdir -p "${B}/tflite_runtime"
> +    cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/debian" \
> +          "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
> +          "${B}"
> +    cp -r "${TENSORFLOW_LITE_DIR}/python/interpreter_wrapper" "${B}"
> +    cp "${TENSORFLOW_LITE_DIR}/tools/pip_package/setup_with_binary.py" "${B}/setup.py"
> +    cp "${TENSORFLOW_LITE_DIR}/python/interpreter.py" \
> +       "${TENSORFLOW_LITE_DIR}/python/metrics/metrics_interface.py" \
> +       "${TENSORFLOW_LITE_DIR}/python/metrics/metrics_portable.py" \
> +       "${B}/tflite_runtime"
> +    echo "__version__ = '${TENSORFLOW_VERSION}'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
> +    echo "__git_version__ = '$(git -C "${TENSORFLOW_DIR}" describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
> +
> +    export PACKAGE_VERSION="${TENSORFLOW_VERSION}"
> +    export PROJECT_NAME="tflite_runtime"
> +    cp "${B}/_pywrap_tensorflow_interpreter_wrapper.so" "tflite_runtime"
> +
> +    setuptools3_do_compile
> +}
> +
> +do_install() {
> +    # Install tensorflow-lite dynamic library
> +    install -d ${D}${libdir}
> +    install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR} ${D}${libdir}/libtensorflow-lite.so.${PV}
> +
> +    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
> +    ln -sf libtensorflow-lite.so.${PV} ${D}${libdir}/libtensorflow-lite.so
> +
> +    # armnn expects the the dynamic library of tensorflow lite to be named as "libtensorflowlite.so"
> +    # Eg - https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delegate/cmake/Modules/FindTfLite.cmake#L19
> +    # Hence, create a symbolic link to handle the same

We should look into fixing this on the armnn side so we can drop this at some point.

> +    ln -snf libtensorflow-lite.so ${D}${libdir}/libtensorflowlite.so
> +
> +    # Install benchmark_model
> +    install -d ${D}/opt/${PN}/tools/
> +    install -m 0755 ${B}/tools/benchmark/benchmark_model ${D}/opt/${PN}/tools/
> +
> +    # Install header files
> +    install -d ${D}${includedir}/tensorflow/
> +    cd ${S}/tensorflow/
> +    cp --parents $(find ./lite -name "*.h*" -not -path "*cmake_build/*") ${D}${includedir}/tensorflow
> +    cp --parents $(find ./compiler/mlir/lite -name "*.h*" -not -path "*cmake_build/*") ${D}${includedir}/tensorflow
> +    cd ${B}
> +    cp --parents $(find . -name "*.h*") ${D}${includedir}/tensorflow/lite
> +
> +    # Install TFlite python3 interpreter
> +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime
> +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info
> +    install -m 0755  ${B}/tflite_runtime/* ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime
> +    install -m 0755  ${B}/tflite_runtime.egg-info/* ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info
> +
> +    # Install pkgconfig file required for NNstreamer build

It is not just NNstreamer, any project that wants to link with this
can make use of some form of .pc or .cmake file. We should see if
we can fix this upstream and have this project generate that during build.

> +    install -d ${D}${libdir}/pkgconfig
> +    install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
> +    sed -i 's:@version@:${PV}:g
> +            s:@libdir@:${libdir}:g
> +            s:@includedir@:${includedir}:g' \
> +            ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
> +}
> +
> +PACKAGES += "${PN}-tools python3-${PN}"
> +
> +RDEPENDS:${PN} += " \
> +    ${PN}-tools \
> +    python3-${PN} \
> +"
> +
> +FILES:${PN} = " \
> +    ${libdir}/lib*.so* \
> +    ${libdir}/pkgconfig/* \
> +"
> +
> +FILES:${PN}-tools = " \
> +    /opt/* \

Why /opt/ ?

How about ${bindir}/${BPN}-tests?

Anyway, only minor comments here, and nothing we cant fix up over time.

Looks good to me,

Acked-by: Andrew Davis <afd@ti.com>

> +"
> +
> +FILES:python3-${PN} = " \
> +    ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
> +    ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
> +"
> +
> +RDEPENDS:python3-${PN} += " python3-ctypes python3-numpy "
> +
> +PROVIDES += "python3-${PN}"

