Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D3AC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 13:56:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.12350.1737726960807313445
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 05:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=k3CS/sog;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50ODtwOP557780
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jan 2025 07:55:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737726958;
	bh=WT3QAXWGHgokAQJyh+p3HRu0zBsGhysjByoz8w0g3dA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k3CS/sogJJMuyJd9lQ0T6Ug7wbkrbPOGdg1ynRQ2zFr1BwbjpDfQpJJlZO+lsXtLH
	 dyox1ilg3h3Fu6wQLhb2SsuO0FQmODEKlX3bg4Lw1/IOLgLhbRm4rTpfG8d4nTM+PF
	 UKftp8PIyQoGbYEZFl4PMUx7hxo5Bik2Qs4Nr8TM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50ODtwT7075648;
	Fri, 24 Jan 2025 07:55:58 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 07:55:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 07:55:57 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50ODtteq117378;
	Fri, 24 Jan 2025 07:55:56 -0600
Message-ID: <c4edd32d-4b09-4842-90ea-8efefc811f54@ti.com>
Date: Fri, 24 Jan 2025 19:25:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH 1/1] meta-arago-extras: Add recipe
 for TFLite Runtime
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan <reatmon@ti.com>, Denys <denis@denix.org>, <v-singh1@ti.com>
References: <20250123172509.445473-1-c-shilwant@ti.com>
 <20250123172509.445473-2-c-shilwant@ti.com>
 <068aa65b-e965-4dec-a779-e9baa0a1f11b@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <068aa65b-e965-4dec-a779-e9baa0a1f11b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 50ODtwOP557780
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 13:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15754

Hi Andrew,

On 24/01/25 03:44, Andrew Davis wrote:
> On 1/23/25 11:25 AM, Chirag wrote:
>> From: Chirag Shilwant <c-shilwant@ti.com>
>>
>> - TensorFlow Lite is TensorFlow's lightweight solution for mobile
>> and embedded devices. It enables low-latency inference of on-device
>> machine learning models with a small binary size.
>>
>> - The tensorflow-lite v2.16 recipe in meta-arago currently supports,
>>
>> =C2=A0=C2=A0 - CPU delegate (with RUY enabled), XNNPACK delegate & Arm=
NN
>> =C2=A0=C2=A0=C2=A0=C2=A0 via external delegate for ARMv8 based Cortex-=
A platforms.
>>
>> =C2=A0=C2=A0 - CPU delegate (with RUY enabled) & ArmNN via external de=
legate
>> =C2=A0=C2=A0=C2=A0=C2=A0 for ARMv7 based Cortex-A platforms.
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 ...eLists-for-building-_pywrap_tensorfl.patch |=C2=A0 37 ++++
>> =C2=A0 ...eLists-for-building-shared-object-li.patch |=C2=A0 55 +++++
>> =C2=A0 ...uild-issues-observed-in-TFlite-v2.16.patch |=C2=A0 36 ++++
>> =C2=A0 .../tensorflow-lite/tensorflow-lite_2.16.bb=C2=A0=C2=A0 | 203 +=
+++++++++++++++++
>> =C2=A0 4 files changed, 331 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
01-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
02-lite-Update-CMakeLists-for-building-shared-object-li.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
03-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
16.bb
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=20
>>
>> new file mode 100644
>> index 00000000..0eed77f9
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>> @@ -0,0 +1,37 @@
>> +From 64b8e731309f1ee9ad41bd65d7661854d5c3106c Mon Sep 17 00:00:00 200=
1
>> +From: Chirag Shilwant <c-shilwant@ti.com>
>> +Date: Sun, 19 Jan 2025 14:54:25 +0530
>> +Subject: [PATCH 1/2] lite: Update CMakeLists for building
>> + _pywrap_tensorflow_interpreter_wrapper
>> +
>> +- Update the CMakeLists.txt file for TensorFlow Lite to include the=20
>> paths for
>> +PYTHON, Numpy, and PYBIND11 headers.
>> +
>> +- This ensures that these headers are available during the build=20
>> process,
>> +which is necessary for building the=20
>> _pywrap_tensorflow_interpreter_wrapper
>> +target that relies on these dependencies.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> +---
>> + tensorflow/lite/CMakeLists.txt | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/tensorflow/lite/CMakeLists.txt=20
>> b/tensorflow/lite/CMakeLists.txt
>> +index a61f537365a..f41e57d9155 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -727,6 +727,9 @@=20
>> set_target_properties(_pywrap_tensorflow_interpreter_wrapper=20
>> PROPERTIES PREFIX "
>> + target_include_directories(_pywrap_tensorflow_interpreter_wrapper
>> +=C2=A0=C2=A0 PUBLIC
>> +=C2=A0=C2=A0=C2=A0=C2=A0 ${TENSORFLOW_SOURCE_DIR}
>> ++=C2=A0=C2=A0=C2=A0 ${PYTHON_TARGET_INCLUDE}
>> ++=C2=A0=C2=A0=C2=A0 ${NUMPY_TARGET_INCLUDE}
>> ++=C2=A0=C2=A0=C2=A0 ${PYBIND11_TARGET_INCLUDE}
>> + )
>> +
>> + target_link_libraries(_pywrap_tensorflow_interpreter_wrapper
>> +--
>> +2.34.1
>> +
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=20
>>
>> new file mode 100644
>> index 00000000..a8c4f2ba
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
>> @@ -0,0 +1,55 @@
>> +From 92adea5bb011ed36c9b63bd442bf147fad96a5bb Mon Sep 17 00:00:00 200=
1
>> +From: Chirag Shilwant <c-shilwant@ti.com>
>> +Date: Sun, 19 Jan 2025 15:08:59 +0530
>> +Subject: [PATCH 2/2] lite: Update CMakeLists for building shared obje=
ct
>> + library
>> +
>> +- When building TFLite with CMake, it builds static library
>> +(i.e. libtensorflow-lite.a) by default which isn't self-contained
>> +since all the transitive dependencies are not included [1]
>> +
>> +- As documented in [1], there's an update needed in CMake build steps
>> +inorder to generate a shared object library (i.e.=20
>> libtensorflow-lite.so)
>> +
>> +- This patch adds schema_conversion_utils.cc to TFLite source files
>> +& updates CMakeLists.txt to build TFLite as a shared library.=20
>> Additionally,
>> +it ensures that the properties are set correctly to manage the shared
>> +object version.
>> +
>> +[1]: https://ai.google.dev/edge/litert/build/cmake#step_5_build_liter=
t
>> +
>> +Upstream-Status: Inappropriate [enable feature]
>> +
>> +Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> +---
>> + tensorflow/lite/CMakeLists.txt | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/tensorflow/lite/CMakeLists.txt=20
>> b/tensorflow/lite/CMakeLists.txt
>> +index f41e57d9155..923c673d623 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -622,8 +622,9 @@ set(_ALL_TFLITE_SRCS
>> +=C2=A0=C2=A0 ${TFLITE_SOURCE_DIR}/schema/conversion_metadata_generate=
d.h
>> +=C2=A0=C2=A0 ${TFLITE_SOURCE_DIR}/schema/schema_utils.cc
>> +=C2=A0=C2=A0 ${TFLITE_SOURCE_DIR}/schema/schema_generated.h
>> ++=C2=A0 ${TFLITE_SOURCE_DIR}/schema/schema_conversion_utils.cc
>> + )
>> +-add_library(tensorflow-lite
>> ++add_library(tensorflow-lite SHARED EXCLUDE_FROM_ALL
>> +=C2=A0=C2=A0 ${_ALL_TFLITE_SRCS}
>> + )
>> + set(_ALL_TFLITE_HDRS ${_ALL_TFLITE_SRCS})
>> +@@ -700,6 +701,9 @@ if(TFLITE_ENABLE_INSTALL)
>> +=C2=A0=C2=A0 )
>> + endif()
>> +
>> ++# Manage version for shared object (dynamic) library
>> ++set_target_properties(tensorflow-lite PROPERTIES VERSION=20
>> "${TFLITE_VERSION_MAJOR}")
>> ++
>> + # The kernel tests.
>> + if(TFLITE_KERNEL_TEST)
>> +=C2=A0=C2=A0 enable_testing()
>> +--
>> +2.34.1
>> +
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch=20
>>
>> new file mode 100644
>> index 00000000..d38a3cdd
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch
>> @@ -0,0 +1,36 @@
>> +From 1b93fb907b3436edf2b64db94f74b1db724943ae Mon Sep 17 00:00:00 200=
1
>> +From: Chirag Shilwant <c-shilwant@ti.com>
>> +Date: Mon, 20 Jan 2025 19:51:20 +0530
>> +Subject: [PATCH] CMakeLists: Fix build issues observed in TFlite v2.1=
6
>> +
>> +- Improve regular expression for filtering neon and sse
>> +related sources. The improved expression avoids missing files
>> +in case the absolute path contains the terms neon or sse.
>> +
>> +- Fixes [1]
>> +
>> +[1]: https://github.com/tensorflow/tensorflow/issues/70730
>> +
>> +Upstream-Status: Backport from master
>> +
>> +Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> +---
>> + tensorflow/lite/CMakeLists.txt | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tensorflow/lite/CMakeLists.txt=20
>> b/tensorflow/lite/CMakeLists.txt
>> +index 923c673d623..3e2fb501bde 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -554,7 +554,7 @@=20
>> populate_tflite_source_vars("kernels/internal/reference/sparse_ops"
>> + )
>> + populate_tflite_source_vars("kernels/internal/optimized/4bit"
>> +=C2=A0=C2=A0 TFLITE_KERNEL_INTERNAL_OPT_4BIT_SRCS
>> +-=C2=A0 FILTER "(.*neon.*|.*sse.*)\\.(cc|h)"
>> ++=C2=A0 FILTER "(.*neon_.*|.*sse_.*)\\.(cc|h)"
>> + )
>> + set(TFLITE_PROFILER_SRCS
>> +=C2=A0=C2=A0 ${TFLITE_SOURCE_DIR}/profiling/platform_profiler.cc
>> +--
>> +2.34.1
>> +
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.16.bb=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.16.bb=20
>>
>> new file mode 100644
>> index 00000000..ca51d6dc
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.16.bb
>> @@ -0,0 +1,203 @@
>> +DESCRIPTION =3D "TensorFlow Lite is an open source deep learning=20
>> framework for \
>> +on-device inference."
>> +AUTHOR =3D "Google Inc. and Yuan Tang"
>> +SUMMARY =3D "TensorFlow Lite C++ Library, Python interpreter &=20
>> Benchmark Model"
>> +HOMEPAGE =3D "https://www.tensorflow.org/lite"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D4158a261ca7f2525513e31ba9c50ae98"
>> +
>> +PV =3D "2.16.2"
>> +
>
> Is this not automatically set now from the file name version?



Ahh, yes! Will rename the recipe name to 2.16.2 in my v2 patch


>
>
>> +# Get major of the PV variable
>> +MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>> +
>> +# Matches v${PV} tag
>> +SRCREV =3D "810f233968cec850915324948bbbc338c97cf57f"
>> +
>> +SRC_URI =3D " \
>> + git://github.com/tensorflow/tensorflow;protocol=3Dhttps;branch=3Dr2.=
16 \
>> +=20
>> file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=
 \
>> +=20
>> file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=
 \
>> +=20
>> file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch=
 \
>> +"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit setuptools3 cmake
>> +
>> +DEPENDS =3D " \
>> +=C2=A0=C2=A0=C2=A0 zlib \
>> +=C2=A0=C2=A0=C2=A0 python3-numpy-native \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11-native \
>> +=C2=A0=C2=A0=C2=A0 python3-wheel-native \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11 \
>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>> +=C2=A0=C2=A0=C2=A0 swig-native \
>> +=C2=A0=C2=A0=C2=A0 python3 \
>> +=C2=A0=C2=A0=C2=A0 gzip-native \
>> +"
>> +
>> +# Set building environment variables
>> +TENSORFLOW_TARGET=3D"linux"
>> +TENSORFLOW_TARGET_ARCH:aarch64=3D"aarch64"
>> +
>> +OECMAKE_SOURCEPATH =3D "${S}/tensorflow/lite"
>> +
>> +# The -O3 flag enables high-level optimizations for performance
>> +# and the -DNDEBUG flag disables debugging code, such as assertions
>> +# to further optimize the build for production use.
>> +# Hence, activate -O3 optimization and disable debug symbols.
>> +OECMAKE_C_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
>> +OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
>> +
>> +OECMAKE_C_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfpu=3Dneo=
n"
>> +OECMAKE_CXX_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfpu=3Dn=
eon"
>> +
>> +# Build tensorflow-lite.so library,=20
>> _pywrap_tensorflow_interpreter_wrapper.so library and the=20
>> benchmark_model application
>> +OECMAKE_TARGET_COMPILE =3D=C2=A0 "tensorflow-lite=20
>> _pywrap_tensorflow_interpreter_wrapper benchmark_model"
>> +
>> +do_generate_toolchain_file:append:arm() {
>> +=C2=A0=C2=A0=C2=A0 # XNNPACK does not recognize this when CMAKE_SYSTE=
M_PROCESSOR is=20
>> arm.
>> +=C2=A0=C2=A0=C2=A0 # Instead, you need to change it to armv7.
>
> If ARMv7 is not supported with XNNPACK, are these lines still needed?


Thanks for catching, will drop the irrelevant XNNPACK comment

But yeah, the logic of setting CMAKE_SYSTEM_PROCESSOR to armv7
is still needed though!


>
>
>> +=C2=A0=C2=A0=C2=A0 sed -i 's:CMAKE_SYSTEM_PROCESSOR arm:CMAKE_SYSTEM_=
PROCESSOR=20
>> armv7:g' ${WORKDIR}/toolchain.cmake
>> +}
>> +
>> +EXTRA_OECMAKE:append =3D " \
>> +=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_FULLY_DISCONNECTED=3DOFF \
>> +=C2=A0=C2=A0=C2=A0 -DTFLITE_ENABLE_RUY=3DON \
>> + -DPYTHON_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${includedir}/${PYTHON_DI=
R} \
>> +=20
>> -DNUMPY_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/n=
umpy/core/include=20
>> \
>> +=20
>> -DPYBIND11_TARGET_INCLUDE=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR=
}/pybind11/include=20
>> \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_NAME=3D${TENSORFLOW_TARGET} \
>> +=C2=A0=C2=A0=C2=A0 -DTFLITE_VERSION_MAJOR=3D${MAJOR}=C2=A0 \
>> +"
>> +
>> +EXTRA_OECMAKE:append:aarch64 =3D " \
>> +=C2=A0=C2=A0=C2=A0 -DTFLITE_ENABLE_XNNPACK=3DON \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_PROCESSOR=3D${TENSORFLOW_TARGET_ARC=
H} \
>> +"
>> +
>> +# XNNPACK is not supported in Linux armv7-a=20
>> [https://github.com/tensorflow/tensorflow/issues/64358]
>> +# Hence, turning it off
>> +EXTRA_OECMAKE:append:arm =3D " \
>> +=C2=A0=C2=A0=C2=A0 -DTFLITE_ENABLE_XNNPACK=3DOFF \
>> +"
>> +
>> +do_configure[network] =3D "1"
>> +
>> +do_configure:prepend() {
>> +=C2=A0=C2=A0=C2=A0 if [ -n "${http_proxy}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export HTTP_PROXY=3D${http=
_proxy}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export http_proxy=3D${http=
_proxy}
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ -n "${https_proxy}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export HTTPS_PROXY=3D${htt=
ps_proxy}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export https_proxy=3D${htt=
ps_proxy}
>> +=C2=A0=C2=A0=C2=A0 fi
>
>
> Are these checks needed?=20




Yeah, I was just being more cautious. Will drop the "if checks" in v2



> If it is unset then exporting doesn't hurt,
> could replace all this with:
>
> export http_proxy
> export https_proxy
> do_configure[network] =3D "1"
>
>> +
>> +=C2=A0=C2=A0=C2=A0 # There is no Fortran compiler in the toolchain, b=
ut bitbake=20
>> sets this variable anyway with unavailable
>> +=C2=A0=C2=A0=C2=A0 # binary & it leads to "CMake Error: Could not fin=
d compiler set=20
>> in environment variable FC:"
>> +=C2=A0=C2=A0=C2=A0 unset FC
>> +}
>> +
>> +do_compile[network] =3D "1"
>> +
>> +do_compile:prepend() {
>> +=C2=A0=C2=A0=C2=A0 # Used to download cmake dependencies when behind =
a proxy
>> +=C2=A0=C2=A0=C2=A0 if [ -n "${http_proxy}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export HTTP_PROXY=3D${http=
_proxy}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export http_proxy=3D${http=
_proxy}
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ -n "${https_proxy}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export HTTPS_PROXY=3D${htt=
ps_proxy}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export https_proxy=3D${htt=
ps_proxy}
>> +=C2=A0=C2=A0=C2=A0 fi
>
> Do you need network during compile? Seems to only be used in configure.



yeah, thanks for catching! apparently it's not needed.

So, it was needed earlier when I was trying to build the python
wheel package directly using build_pip_package_with_cmake.sh provided
by tensorflow

But later I decided to revamp the logic & switched to setuptools3 after
which we don't neednetwork access in do_compile & even the proxy setting=20
stuff!

So, it's only the do_configure stage where we need network access for
tensorflow-lite

Will handle this in v2 patch.


--
Chirag


>
>
> Andrew
>
>> +}
>> +
>> +SETUPTOOLS_SETUP_PATH =3D "${B}"
>> +
>> +do_compile:append() {
>> +=C2=A0=C2=A0=C2=A0 # Build the python wheel (procedure extract form t=
he=20
>> build_pip_package_with_cmake.sh)
>> +=C2=A0=C2=A0=C2=A0 BUILD_DIR=3D${B}
>> +=C2=A0=C2=A0=C2=A0 TENSORFLOW_DIR=3D${S}
>> +=C2=A0=C2=A0=C2=A0 TENSORFLOW_LITE_DIR=3D"${TENSORFLOW_DIR}/tensorflo=
w/lite"
>> +=C2=A0=C2=A0=C2=A0 TENSORFLOW_VERSION=3D$(grep "_VERSION =3D "=20
>> "${TENSORFLOW_DIR}/tensorflow/tools/pip_package/setup.py" | cut -d=3D=20
>> -f2 | sed "s/[ '-]//g")
>> +=C2=A0=C2=A0=C2=A0 mkdir -p "${B}/tflite_runtime"
>> +=C2=A0=C2=A0=C2=A0 cp -r "${TENSORFLOW_LITE_DIR}/tools/pip_package/de=
bian" \
>> + "${TENSORFLOW_LITE_DIR}/tools/pip_package/MANIFEST.in" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${B}"
>> +=C2=A0=C2=A0=C2=A0 cp -r "${TENSORFLOW_LITE_DIR}/python/interpreter_w=
rapper" "${B}"
>> +=C2=A0=C2=A0=C2=A0 cp=20
>> "${TENSORFLOW_LITE_DIR}/tools/pip_package/setup_with_binary.py"=20
>> "${B}/setup.py"
>> +=C2=A0=C2=A0=C2=A0 cp "${TENSORFLOW_LITE_DIR}/python/interpreter.py" =
\
>> + "${TENSORFLOW_LITE_DIR}/python/metrics/metrics_interface.py" \
>> + "${TENSORFLOW_LITE_DIR}/python/metrics/metrics_portable.py" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${B}/tflite_runtime"
>> +=C2=A0=C2=A0=C2=A0 echo "__version__ =3D '${TENSORFLOW_VERSION}'" >>=20
>> "${BUILD_DIR}/tflite_runtime/__init__.py"
>> +=C2=A0=C2=A0=C2=A0 echo "__git_version__ =3D '$(git -C "${TENSORFLOW_=
DIR}"=20
>> describe)'" >> "${BUILD_DIR}/tflite_runtime/__init__.py"
>> +
>> +=C2=A0=C2=A0=C2=A0 export PACKAGE_VERSION=3D"${TENSORFLOW_VERSION}"
>> +=C2=A0=C2=A0=C2=A0 export PROJECT_NAME=3D"tflite_runtime"
>> +=C2=A0=C2=A0=C2=A0 cp "${B}/_pywrap_tensorflow_interpreter_wrapper.so=
"=20
>> "tflite_runtime"
>> +
>> +=C2=A0=C2=A0=C2=A0 setuptools3_do_compile
>> +}
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 # Install tensorflow-lite dynamic library
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/libtensorflow-lite.so.${MAJOR=
}=20
>> ${D}${libdir}/libtensorflow-lite.so.${PV}
>> +
>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>> ${D}${libdir}/libtensorflow-lite.so.${MAJOR}
>> +=C2=A0=C2=A0=C2=A0 ln -sf libtensorflow-lite.so.${PV}=20
>> ${D}${libdir}/libtensorflow-lite.so
>> +
>> +=C2=A0=C2=A0=C2=A0 # armnn expects the the dynamic library of tensorf=
low lite to be=20
>> named as "libtensorflowlite.so"
>> +=C2=A0=C2=A0=C2=A0 # Eg -=20
>> https://github.com/ARM-software/armnn/blob/branches/armnn_24_11/delega=
te/cmake/Modules/FindTfLite.cmake#L19
>> +=C2=A0=C2=A0=C2=A0 # Hence, create a symbolic link to handle the same
>> +=C2=A0=C2=A0=C2=A0 ln -snf libtensorflow-lite.so ${D}${libdir}/libten=
sorflowlite.so
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install benchmark_model
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/opt/${PN}/tools/
>> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${B}/tools/benchmark/benchmark_mod=
el=20
>> ${D}/opt/${PN}/tools/
>> +=C2=A0=C2=A0=C2=A0 # chrpath -r '$ORIGIN' ${D}/opt/${PN}/tools/benchm=
ark_model
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install header files
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/tensorflow/lite
>> +=C2=A0=C2=A0=C2=A0 cd ${S}/tensorflow/lite
>> +=C2=A0=C2=A0=C2=A0 cp --parents $(find . -name "*.h*" -not -path "*cm=
ake_build/*")=20
>> ${D}${includedir}/tensorflow/lite
>> +=C2=A0=C2=A0=C2=A0 cd ${B}
>> +=C2=A0=C2=A0=C2=A0 cp --parents $(find . -name "*.h*")=20
>> ${D}${includedir}/tensorflow/lite
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install Tflite python3 interpreter
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_r=
untime
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_r=
untime.egg-info
>> +=C2=A0=C2=A0=C2=A0 install -m 0755=C2=A0 ${B}/tflite_runtime/*=20
>> ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime
>> +=C2=A0=C2=A0=C2=A0 install -m 0755=C2=A0 ${B}/tflite_runtime.egg-info=
/*=20
>> ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info
>> +=C2=A0=C2=A0=C2=A0 # chrpath -r '$ORIGIN'=20
>> ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime/*.so
>> +}
>> +
>> +PACKAGES +=3D "${PN}-tools python3-${PN}"
>> +
>> +RDEPENDS:${PN} +=3D " \
>> +=C2=A0=C2=A0=C2=A0 ${PN}-tools \
>> +=C2=A0=C2=A0=C2=A0 python3-${PN} \
>> +"
>> +
>> +FILES:${PN} =3D " \
>> +=C2=A0=C2=A0=C2=A0 ${libdir}/lib*.so* \
>> +"
>> +
>> +FILES:${PN}-tools =3D " \
>> +=C2=A0=C2=A0=C2=A0 /opt/* \
>> +"
>> +
>> +FILES:python3-${PN} =3D " \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info=
 \
>> +"
>> +
>> +RDEPENDS:python3-${PN} +=3D " python3-ctypes python3-numpy "
>> +
>> +PROVIDES +=3D "python3-${PN}"

