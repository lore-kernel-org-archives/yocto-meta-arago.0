Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B7EC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:19:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.3707.1737753575068202294
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 13:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HxOjolhZ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OLJWu7627989
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 15:19:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737753572;
	bh=JLMUVNnhCAz7r56B+M1FZ2voe3lqWA6T3+6UDJZtfcY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HxOjolhZ9JiumgogrQpwqvUhlid+8dfHsiMGJtZenUr+jN/+rJ2dQSBqo+i6De9IM
	 BXGGwE9lussOO9MLaHeLma8LKO+O6Vd1OPhjrIFh/mYfuIfFxbkv3EQMw80jzsiNzq
	 iIBGtV5b3ROZgXwACv7Qm/xkU6bAsAxUZ2fUPWm8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50OLJW7x060212
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 15:19:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 15:19:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 15:19:32 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OLJViu058023;
	Fri, 24 Jan 2025 15:19:31 -0600
Message-ID: <1ccbbc66-273a-4339-bc28-15ddcc0129a5@ti.com>
Date: Fri, 24 Jan 2025 15:19:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH 1/1] meta-arago-extras: Add recipe
 for TFLite Runtime
To: Chirag <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan <reatmon@ti.com>, Denys <denis@denix.org>
References: <20250123172509.445473-1-c-shilwant@ti.com>
 <20250123172509.445473-2-c-shilwant@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250123172509.445473-2-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 21:19:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15759

On 1/23/25 11:25 AM, Chirag wrote:
> From: Chirag Shilwant <c-shilwant@ti.com>
> 
> - TensorFlow Lite is TensorFlow's lightweight solution for mobile
> and embedded devices. It enables low-latency inference of on-device
> machine learning models with a small binary size.
> 
> - The tensorflow-lite v2.16 recipe in meta-arago currently supports,
> 
>    - CPU delegate (with RUY enabled), XNNPACK delegate & ArmNN
>      via external delegate for ARMv8 based Cortex-A platforms.
> 
>    - CPU delegate (with RUY enabled) & ArmNN via external delegate
>      for ARMv7 based Cortex-A platforms.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   ...eLists-for-building-_pywrap_tensorfl.patch |  37 ++++
>   ...eLists-for-building-shared-object-li.patch |  55 +++++
>   ...uild-issues-observed-in-TFlite-v2.16.patch |  36 ++++
>   .../tensorflow-lite/tensorflow-lite_2.16.bb   | 203 ++++++++++++++++++
>   4 files changed, 331 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch
>   create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.16.bb
> 
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
> new file mode 100644
> index 00000000..0eed77f9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
> @@ -0,0 +1,37 @@
> +From 64b8e731309f1ee9ad41bd65d7661854d5c3106c Mon Sep 17 00:00:00 2001
> +From: Chirag Shilwant <c-shilwant@ti.com>
> +Date: Sun, 19 Jan 2025 14:54:25 +0530
> +Subject: [PATCH 1/2] lite: Update CMakeLists for building
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
> +index a61f537365a..f41e57d9155 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -727,6 +727,9 @@ set_target_properties(_pywrap_tensorflow_interpreter_wrapper PROPERTIES PREFIX "
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
> index 00000000..a8c4f2ba
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
> @@ -0,0 +1,55 @@
> +From 92adea5bb011ed36c9b63bd442bf147fad96a5bb Mon Sep 17 00:00:00 2001
> +From: Chirag Shilwant <c-shilwant@ti.com>
> +Date: Sun, 19 Jan 2025 15:08:59 +0530
> +Subject: [PATCH 2/2] lite: Update CMakeLists for building shared object
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
> +index f41e57d9155..923c673d623 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -622,8 +622,9 @@ set(_ALL_TFLITE_SRCS
> +   ${TFLITE_SOURCE_DIR}/schema/conversion_metadata_generated.h
> +   ${TFLITE_SOURCE_DIR}/schema/schema_utils.cc
> +   ${TFLITE_SOURCE_DIR}/schema/schema_generated.h
> ++  ${TFLITE_SOURCE_DIR}/schema/schema_conversion_utils.cc
> + )
> +-add_library(tensorflow-lite
> ++add_library(tensorflow-lite SHARED EXCLUDE_FROM_ALL
> +   ${_ALL_TFLITE_SRCS}
> + )
> + set(_ALL_TFLITE_HDRS ${_ALL_TFLITE_SRCS})
> +@@ -700,6 +701,9 @@ if(TFLITE_ENABLE_INSTALL)
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
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch
> new file mode 100644
> index 00000000..d38a3cdd
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch
> @@ -0,0 +1,36 @@
> +From 1b93fb907b3436edf2b64db94f74b1db724943ae Mon Sep 17 00:00:00 2001
> +From: Chirag Shilwant <c-shilwant@ti.com>
> +Date: Mon, 20 Jan 2025 19:51:20 +0530
> +Subject: [PATCH] CMakeLists: Fix build issues observed in TFlite v2.16
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
> +index 923c673d623..3e2fb501bde 100644
> +--- a/tensorflow/lite/CMakeLists.txt
> ++++ b/tensorflow/lite/CMakeLists.txt
> +@@ -554,7 +554,7 @@ populate_tflite_source_vars("kernels/internal/reference/sparse_ops"
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
> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.16.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.16.bb
> new file mode 100644
> index 00000000..ca51d6dc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.16.bb
> @@ -0,0 +1,203 @@
> +DESCRIPTION = "TensorFlow Lite is an open source deep learning framework for \
> +on-device inference."
> +AUTHOR = "Google Inc. and Yuan Tang"
> +SUMMARY = "TensorFlow Lite C++ Library, Python interpreter & Benchmark Model"
> +HOMEPAGE = "https://www.tensorflow.org/lite"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4158a261ca7f2525513e31ba9c50ae98"
> +
> +PV = "2.16.2"
> +
> +# Get major of the PV variable
> +MAJOR = "${@d.getVar('PV').split('.')[0]}"
> +
> +# Matches v${PV} tag
> +SRCREV = "810f233968cec850915324948bbbc338c97cf57f"
> +
> +SRC_URI = " \
> +    git://github.com/tensorflow/tensorflow;protocol=https;branch=r2.16 \
> +    file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch \
> +    file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch \
> +    file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3 cmake
> +
> +DEPENDS = " \
> +    zlib \
> +    python3-numpy-native \
> +    python3-pybind11-native \
> +    python3-wheel-native \
> +    python3-pybind11 \
> +    python3-numpy \
> +    swig-native \
> +    python3 \
> +    gzip-native \
> +"
> +
> +# Set building environment variables
> +TENSORFLOW_TARGET="linux"
> +TENSORFLOW_TARGET_ARCH:aarch64="aarch64"
> +
> +OECMAKE_SOURCEPATH = "${S}/tensorflow/lite"
> +
> +# The -O3 flag enables high-level optimizations for performance
> +# and the -DNDEBUG flag disables debugging code, such as assertions
> +# to further optimize the build for production use.
> +# Hence, activate -O3 optimization and disable debug symbols.
> +OECMAKE_C_FLAGS_RELEASE = "-O3 -DNDEBUG"
> +OECMAKE_CXX_FLAGS_RELEASE = "-O3 -DNDEBUG"
> +
> +OECMAKE_C_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
> +OECMAKE_CXX_FLAGS_RELEASE:append:arm = " -march=armv7-a -mfpu=neon"
> +
> +# Build tensorflow-lite.so library, _pywrap_tensorflow_interpreter_wrapper.so library and the benchmark_model application
> +OECMAKE_TARGET_COMPILE =  "tensorflow-lite _pywrap_tensorflow_interpreter_wrapper benchmark_model"
> +
> +do_generate_toolchain_file:append:arm() {
> +    # XNNPACK does not recognize this when CMAKE_SYSTEM_PROCESSOR is arm.
> +    # Instead, you need to change it to armv7.
> +    sed -i 's:CMAKE_SYSTEM_PROCESSOR arm:CMAKE_SYSTEM_PROCESSOR armv7:g' ${WORKDIR}/toolchain.cmake
> +}
> +
> +EXTRA_OECMAKE:append = " \
> +    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF \
> +    -DTFLITE_ENABLE_RUY=ON \
> +    -DPYTHON_TARGET_INCLUDE=${RECIPE_SYSROOT}${includedir}/${PYTHON_DIR} \
> +    -DNUMPY_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/core/include \
> +    -DPYBIND11_TARGET_INCLUDE=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/pybind11/include \
> +    -DCMAKE_SYSTEM_NAME=${TENSORFLOW_TARGET} \
> +    -DTFLITE_VERSION_MAJOR=${MAJOR}  \
> +"
> +
> +EXTRA_OECMAKE:append:aarch64 = " \
> +    -DTFLITE_ENABLE_XNNPACK=ON \
> +    -DCMAKE_SYSTEM_PROCESSOR=${TENSORFLOW_TARGET_ARCH} \
> +"
> +
> +# XNNPACK is not supported in Linux armv7-a [https://github.com/tensorflow/tensorflow/issues/64358]
> +# Hence, turning it off
> +EXTRA_OECMAKE:append:arm = " \
> +    -DTFLITE_ENABLE_XNNPACK=OFF \
> +"

Should this be a config option?

PACKAGECONFIG[xnnpack] = "-DTFLITE_ENABLE_XNNPACK=ON, -DTFLITE_ENABLE_XNNPACK=OFF"

Then we could simply disable it for arm with

PACKAGECONFIG:remove:arm = "xnnpack"

> +
> +do_configure[network] = "1"
> +
> +do_configure:prepend() {
> +    if [ -n "${http_proxy}" ]; then
> +        export HTTP_PROXY=${http_proxy}
> +        export http_proxy=${http_proxy}
> +    fi
> +
> +    if [ -n "${https_proxy}" ]; then
> +        export HTTPS_PROXY=${https_proxy}
> +        export https_proxy=${https_proxy}
> +    fi
> +
> +    # There is no Fortran compiler in the toolchain, but bitbake sets this variable anyway with unavailable
> +    # binary & it leads to "CMake Error: Could not find compiler set in environment variable FC:"
> +    unset FC
> +}
> +
> +do_compile[network] = "1"
> +
> +do_compile:prepend() {
> +    # Used to download cmake dependencies when behind a proxy
> +    if [ -n "${http_proxy}" ]; then
> +        export HTTP_PROXY=${http_proxy}
> +        export http_proxy=${http_proxy}
> +    fi
> +
> +    if [ -n "${https_proxy}" ]; then
> +        export HTTPS_PROXY=${https_proxy}
> +        export https_proxy=${https_proxy}
> +    fi
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
> +    ln -snf libtensorflow-lite.so ${D}${libdir}/libtensorflowlite.so
> +
> +    # Install benchmark_model
> +    install -d ${D}/opt/${PN}/tools/
> +    install -m 0755 ${B}/tools/benchmark/benchmark_model ${D}/opt/${PN}/tools/
> +    # chrpath -r '$ORIGIN' ${D}/opt/${PN}/tools/benchmark_model
> +
> +    # Install header files
> +    install -d ${D}${includedir}/tensorflow/lite
> +    cd ${S}/tensorflow/lite
> +    cp --parents $(find . -name "*.h*" -not -path "*cmake_build/*") ${D}${includedir}/tensorflow/lite
> +    cd ${B}
> +    cp --parents $(find . -name "*.h*") ${D}${includedir}/tensorflow/lite
> +
> +    # Install Tflite python3 interpreter
> +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime
> +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info
> +    install -m 0755  ${B}/tflite_runtime/* ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime
> +    install -m 0755  ${B}/tflite_runtime.egg-info/* ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info
> +    # chrpath -r '$ORIGIN' ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime/*.so
> +}

I'm not seeing any pkg-config nor cmake file deployed to allow other
projects to find this package. I see some folks manually added a .pc
file, might be an option here.

Andrew

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
> +"
> +
> +FILES:${PN}-tools = " \
> +    /opt/* \
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

