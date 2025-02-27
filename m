Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C586C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 07:30:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.5733.1740641412822137595
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 23:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=HJ1eZKxB;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R7U91M1785850
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 01:30:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740641409;
	bh=1oTgbe0hP+dVSE8jz7EO6rwquISh9WAOlUwL/DvW+zw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HJ1eZKxBISwN25XrDZ6cQaFS8E705FEIfpEhP9E1AL1pIIkBEv670hbkg+Nx6I8TQ
	 g+urPI+z0w4srX9jRdA/TRnFYcIDLUn2fQe0lgpmOJSJXKSGuBZjNTt/UZXkebYhVv
	 kQ4+KmcugLfOoksWwZ+qabKeYGlOJ//7clN+7Lrk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51R7U90A094371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 01:30:09 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 01:30:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 01:30:08 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R7U6C7038535;
	Thu, 27 Feb 2025 01:30:06 -0600
Message-ID: <58f7130e-c8e1-49f5-93bb-ee5378772999@ti.com>
Date: Thu, 27 Feb 2025 13:00:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v2 1/1] meta-arago-extras: Add
 recipe for TFLite Runtime
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Vijay
	<vijayp@ti.com>, Khasim <khasim@ti.com>
References: <20250221222446.4019819-1-c-shilwant@ti.com>
 <20250221222446.4019819-2-c-shilwant@ti.com>
 <0fbdf01d-c1d5-43d3-8f6f-3f45a3708599@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <0fbdf01d-c1d5-43d3-8f6f-3f45a3708599@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 51R7U91M1785850
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Feb 2025 07:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15927

Hi Andrew,

On 22/02/25 22:54, Andrew Davis wrote:
> On 2/21/25 4:24 PM, Chirag Shilwant wrote:
>> - TensorFlow Lite is TensorFlow's lightweight solution for mobile
>> and embedded devices. It enables low-latency inference of on-device
>> machine learning models with a small binary size.
>>
>> - The tensorflow-lite v2.18 recipe in meta-arago currently supports,
>>
>> =C2=A0=C2=A0 * CPU delegate (with RUY enabled), XNNPACK delegate & Arm=
NN
>> =C2=A0=C2=A0=C2=A0=C2=A0 via external delegate for ARMv8 based Cortex-=
A platforms.
>>
>> =C2=A0=C2=A0 * CPU delegate (with RUY enabled) & ArmNN via external de=
legate
>> =C2=A0=C2=A0=C2=A0=C2=A0 for ARMv7 based Cortex-A platforms.
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 ...eLists-for-building-_pywrap_tensorfl.patch |=C2=A0 37 +++
>> =C2=A0 ...eLists-for-building-shared-object-li.patch |=C2=A0 61 +++++
>> =C2=A0 ...uild-issues-observed-in-TFlite-v2.18.patch |=C2=A0 36 +++
>> =C2=A0 .../tensorflow-lite/tensorflow2-lite.pc.in=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +
>> =C2=A0 .../tensorflow-lite/tensorflow-lite_2.18.0.bb | 232 +++++++++++=
+++++++
>> =C2=A0 5 files changed, 372 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
01-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
02-lite-Update-CMakeLists-for-building-shared-object-li.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/00=
03-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/te=
nsorflow2-lite.pc.in
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.=
18.0.bb
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=20
>>
>> new file mode 100644
>> index 00000000..e277beb3
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>> @@ -0,0 +1,37 @@
>> +From 050127548d7f28464cbe5dc9caa83c8023676d80 Mon Sep 17 00:00:00 200=
1
>> +From: Chirag Shilwant <c-shilwant@ti.com>
>> +Date: Thu, 13 Feb 2025 14:33:50 +0530
>> +Subject: [PATCH 1/3] lite: Update CMakeLists for building
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
>> +index bce9627fbd3..b7bb39869b5 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -810,6 +810,9 @@=20
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
>> index 00000000..dce229fd
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
>> @@ -0,0 +1,61 @@
>> +From 339b5a7e5f17a60df1e3d6d2ffe607786ce34978 Mon Sep 17 00:00:00 200=
1
>> +From: Chirag Shilwant <c-shilwant@ti.com>
>> +Date: Thu, 13 Feb 2025 14:38:01 +0530
>> +Subject: [PATCH 2/3] lite: Update CMakeLists for building shared obje=
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
>> +index b7bb39869b5..92b05e42446 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -671,6 +671,7 @@ set(_ALL_TFLITE_SRCS
>> +=20
>> ${TFLITE_SOURCE_DIR}/kernels/internal/utils/sparsity_format_converter.=
cc
>> +=C2=A0=C2=A0 ${TFLITE_SOURCE_DIR}/schema/conversion_metadata_generate=
d.h
>> +=C2=A0=C2=A0 ${TFLITE_SOURCE_DIR}/schema/schema_generated.h
>> ++=C2=A0 ${TFLITE_SOURCE_DIR}/schema/schema_conversion_utils.h
>> +=C2=A0=C2=A0 ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/schema_utils.=
cc
>> + ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/schema_generated.h
>> +=20
>> ${TF_SOURCE_DIR}/compiler/mlir/lite/schema/conversion_metadata_generat=
ed.h
>> +@@ -697,7 +698,7 @@ else()
>> +=C2=A0=C2=A0 list(FILTER _ALL_TFLITE_SRCS EXCLUDE REGEX=20
>> ".*mmap_allocation\\.cc$")
>> + endif()
>> +
>> +-add_library(tensorflow-lite
>> ++add_library(tensorflow-lite SHARED EXCLUDE_FROM_ALL
>> +=C2=A0=C2=A0 ${_ALL_TFLITE_SRCS}
>> + )
>> + set(_ALL_TFLITE_HDRS ${_ALL_TFLITE_SRCS})
>> +@@ -773,6 +774,9 @@ if(TFLITE_ENABLE_INSTALL)
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
0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch=20
>>
>> new file mode 100644
>> index 00000000..0e21b254
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
>> @@ -0,0 +1,36 @@
>> +From 577192caa67660f857f2869896d01db3611b4128 Mon Sep 17 00:00:00 200=
1
>> +From: Chirag Shilwant <c-shilwant@ti.com>
>> +Date: Thu, 13 Feb 2025 14:45:46 +0530
>> +Subject: [PATCH 3/3] CMakeLists: Fix build issues observed in TFlite=20
>> v2.18
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
>> +index 92b05e42446..737f754621f 100644
>> +--- a/tensorflow/lite/CMakeLists.txt
>> ++++ b/tensorflow/lite/CMakeLists.txt
>> +@@ -605,7 +605,7 @@=20
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
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
tensorflow2-lite.pc.in=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
tensorflow2-lite.pc.in=20
>>
>> new file mode 100644
>> index 00000000..8c5bf2e0
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/=
tensorflow2-lite.pc.in
>> @@ -0,0 +1,6 @@
>> +Name: tensorflow lite c++ shared library
>> +Description: tensorflow lite c++ shared library
>> +Version: @version@
>> +Requires:
>> +Libs: -L@libdir@ -ltensorflowlite -lrt
>> +Cflags: -I@includedir@
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.18.0.bb=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.18.0.bb=20
>>
>> new file mode 100644
>> index 00000000..a20c090a
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_=
2.18.0.bb
>> @@ -0,0 +1,232 @@
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
>> +# Get major of the PV variable
>> +MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>> +
>> +SRC_URI =3D " \
>> +=20
>> git://github.com/tensorflow/tensorflow.git;protocol=3Dhttps;branch=3Dr=
2.18 \
>> +=20
>> file://0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch=
 \
>> +=20
>> file://0002-lite-Update-CMakeLists-for-building-shared-object-li.patch=
 \
>> +=20
>> file://0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch=
 \
>> +=C2=A0=C2=A0=C2=A0 file://tensorflow2-lite.pc.in \
>> +"
>> +
>> +SRC_URI +=3D " \
>> +=20
>> git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_2=
023_08_02;name=3Dabseil-cpp;destsuffix=3D${S}/external/abseil-cpp=20
>> \
>> +=20
>> git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Deigen;destsuffix=3D${S}/external/eigen=20
>> \
>> +=20
>> git://github.com/google/farmhash.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dfarmhash;destsuffix=3D${S}/external/farmhash=20
>> \
>> +=20
>> git://github.com/petewarden/OouraFFT.git;protocol=3Dhttps;branch=3Dmas=
ter;name=3Dfft2d;destsuffix=3D${S}/external/fft2d=20
>> \
>> +=20
>> git://github.com/google/gemmlowp.git;branch=3Dmaster;protocol=3Dhttps;=
name=3Dgemmlowp;destsuffix=3D${S}/external/gemmlowp=20
>> \
>> +=20
>> git://github.com/pytorch/cpuinfo.git;branch=3Dmain;protocol=3Dhttps;na=
me=3Dcpuinfo;destsuffix=3D${S}/external/cpuinfo=20
>> \
>> +=20
>> git://github.com/jax-ml/ml_dtypes.git;branch=3Dmain;protocol=3Dhttps;n=
ame=3Dml_dtypes;destsuffix=3D${S}/external/ml_dtypes=20
>> \
>> +=20
>> git://github.com/google/ruy.git;branch=3Dmaster;protocol=3Dhttps;name=3D=
ruy;destsuffix=3D${S}/external/ruy=20
>> \
>> +=20
>> git://github.com/google/flatbuffers;branch=3Dmaster;protocol=3Dhttps;n=
ame=3Dflatbuffers;destsuffix=3D${S}/external/flatbuffers=20
>> \
>> +=20
>> git://github.com/Maratyszcza/pthreadpool.git;branch=3Dmaster;protocol=3D=
https;name=3Dpthreadpool-source;destsuffix=3D${S}/external/pthreadpool-so=
urce=20
>> \
>> +=20
>> git://github.com/google/XNNPACK.git;branch=3Dmaster;protocol=3Dhttps;n=
ame=3Dxnnpack;destsuffix=3D${S}/external/xnnpack=20
>> \
>> +=20
>> git://github.com/Maratyszcza/FXdiv.git;branch=3Dmaster;protocol=3Dhttp=
s;name=3DFXdiv-source;destsuffix=3D${S}/external/FXdiv-source=20
>> \
>> +=20
>> git://github.com/Maratyszcza/FP16.git;branch=3Dmaster;protocol=3Dhttps=
;name=3DFP16-source;destsuffix=3D${S}/external/FP16-source=20
>> \
>> +=20
>> git://git.gitlab.arm.com/kleidi/kleidiai.git;branch=3Dmain;protocol=3D=
https;name=3Dkleidiai;destsuffix=3D${S}/external/kleidiai=20
>> \
>> +=20
>> git://github.com/Maratyszcza/psimd.git;branch=3Dmaster;protocol=3Dhttp=
s;name=3Dpsimd;destsuffix=3D${S}/external/psimd=20
>> \
>> +=20
>> git://github.com/protocolbuffers/protobuf.git;branch=3D25.x;protocol=3D=
https;name=3Dprotobuf;destsuffix=3D${S}/external/protobuf=20
>> \
>> +"
>> +
>> +SRCREV_FORMAT =3D "default"
>> +
>> +# Matches v${PV} tag
>> +SRCREV =3D "6550e4bd80223cdb8be6c3afd1f81e86a4d433c3"
>> +SRCREV_abseil-cpp =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
>> +SRCREV_eigen =3D "33d0937c6bdf5ec999939fb17f2a553183d14a74"
>> +SRCREV_farmhash =3D "0d859a811870d10f53a594927d0d0b97573ad06d"
>> +SRCREV_fft2d =3D "c6fd2dd6d21397baa6653139d31d84540d5449a2"
>> +SRCREV_gemmlowp =3D "16e8662c34917be0065110bfcd9cc27d30f52fdf"
>> +SRCREV_cpuinfo =3D "b73ae6ce38d5dd0b7fe46dbe0a4b5f4bab91c7ea"
>> +SRCREV_ml_dtypes =3D "24084d9ed2c3d45bf83b7a9bff833aa185bf9172"
>> +SRCREV_ruy =3D "3286a34cc8de6149ac6844107dfdffac91531e72"
>> +SRCREV_flatbuffers =3D "e6463926479bd6b330cbcf673f7e917803fd5831"
>> +SRCREV_pthreadpool-source =3D "4fe0e1e183925bf8cfa6aae24237e724a96479=
b8"
>> +SRCREV_xnnpack =3D "6b83f69d4938da4dc9ad63c00bd13e9695659a51"
>> +SRCREV_FXdiv-source =3D "63058eff77e11aa15bf531df5dd34395ec3017c8"
>> +SRCREV_FP16-source =3D "0a92994d729ff76a58f692d3028ca1b64b145d91"
>> +SRCREV_kleidiai =3D "cddf991af5de49fd34949fa39690e4e906e04074"
>> +SRCREV_psimd =3D "072586a71b55b7f8c584153d223e95687148a900"
>> +SRCREV_protobuf =3D "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit setuptools3 cmake
>> +
>> +DEPENDS =3D " \
>> +=C2=A0=C2=A0=C2=A0 flatbuffers-native \
>> +=C2=A0=C2=A0=C2=A0 python3-numpy-native \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11-native \
>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>> +=C2=A0=C2=A0=C2=A0 python3 \
>> +=C2=A0=C2=A0=C2=A0 gzip-native \
>> +=C2=A0=C2=A0=C2=A0 protobuf-native \
>> +=C2=A0=C2=A0=C2=A0 python3-pybind11 \
>> +"
>> +
>> +# Set building environment variables
>> +TENSORFLOW_TARGET=3D"linux"
>> +TENSORFLOW_TARGET_ARCH:aarch64=3D"aarch64"
>> +TENSORFLOW_TARGET_ARCH:arm=3D"armv7"
>> +
>> +PACKAGECONFIG ??=3D "xnnpack ruy"
>> +PACKAGECONFIG[xnnpack] =3D "-DTFLITE_ENABLE_XNNPACK=3DON,=20
>> -DTFLITE_ENABLE_XNNPACK=3DOFF"
>> +PACKAGECONFIG[ruy] =3D "-DTFLITE_ENABLE_RUY=3DON, -DTFLITE_ENABLE_RUY=
=3DOFF"
>> +
>> +# XNNPACK is not supported in Linux armv7-a=20
>> [https://github.com/tensorflow/tensorflow/issues/64358]
>> +# Hence, turning it off
>> +PACKAGECONFIG:remove:arm =3D "xnnpack"
>> +
>> +OECMAKE_SOURCEPATH =3D "${S}/tensorflow/lite"
>> +
>> +# The -O3 flag enables high-level optimizations for performance
>> +# and the -DNDEBUG flag disables debugging code, such as assertions
>> +# to further optimize the build for production use.
>> +# Hence, activate -O3 optimization and disable debug symbols.
>> +OECMAKE_C_FLAGS_RELEASE =3D "-O3 -DNDEBUG"
>> +OECMAKE_CXX_FLAGS_RELEASE =3D "-O3 -DNDEBUG -flax-vector-conversions"
>> +
>> +OECMAKE_C_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfpu=3Dneo=
n"
>> +OECMAKE_CXX_FLAGS_RELEASE:append:arm =3D " -march=3Darmv7-a -mfpu=3Dn=
eon"
>> +
>> +do_generate_toolchain_file:append:arm() {
>> +=C2=A0=C2=A0=C2=A0 # Even if we set TENSORFLOW_TARGET_ARCH:arm as arm=
v7, the TFLite=20
>> CMake
>> +=C2=A0=C2=A0=C2=A0 # build system still uses CMAKE_SYSTEM_PROCESSOR a=
s arm in=20
>> toolchain.cmake file
>> +=C2=A0=C2=A0=C2=A0 # which leads to build failures. Hence, change it =
to armv7.
>> +=C2=A0=C2=A0=C2=A0 sed -i 's:CMAKE_SYSTEM_PROCESSOR arm:CMAKE_SYSTEM_=
PROCESSOR=20
>> armv7:g' ${WORKDIR}/toolchain.cmake
>> +}
>> +
>> +# Build tensorflow-lite.so library,=20
>> _pywrap_tensorflow_interpreter_wrapper.so library and the=20
>> benchmark_model application
>> +OECMAKE_TARGET_COMPILE =3D=C2=A0 "tensorflow-lite benchmark_model=20
>> _pywrap_tensorflow_interpreter_wrapper"
>> +
>> +EXTRA_OECMAKE:append =3D " \
>> +=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_NAME=3D${TENSORFLOW_TARGET} \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_SYSTEM_PROCESSOR=3D${TENSORFLOW_TARGET_ARC=
H} \
>> +=C2=A0=C2=A0=C2=A0 -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON \
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
>> +=C2=A0=C2=A0=C2=A0 -DTFLITE_VERSION_MAJOR=3D${MAJOR}=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 -DTFLITE_HOST_TOOLS_DIR=3D${STAGING_BINDIR_NATIVE}=
 \
>> +=C2=A0=C2=A0=C2=A0 -DPTHREADPOOL_SOURCE_DIR=3D${S}/external/pthreadpo=
ol-source \
>> +=C2=A0=C2=A0=C2=A0 -DFXDIV_SOURCE_DIR=3D${S}/external/FXdiv-source \
>> +=C2=A0=C2=A0=C2=A0 -DFP16_SOURCE_DIR=3D${S}/external/FP16-source \
>> +=C2=A0=C2=A0=C2=A0 -DCPUINFO_SOURCE_DIR=3D${S}/external/cpuinfo \
>> +=C2=A0=C2=A0=C2=A0 -DKLEIDIAI_SOURCE_DIR=3D${S}/external/kleidiai \
>> +=C2=A0=C2=A0=C2=A0 -DPSIMD_SOURCE_DIR=3D${S}/external/psimd \
>> +=C2=A0=C2=A0=C2=A0 --compile-no-warning-as-error \
>> +=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>> +"
>> +
>> +do_configure:prepend() {
>> +=C2=A0=C2=A0=C2=A0 for i in abseil-cpp cpuinfo eigen farmhash fft2d f=
latbuffers=20
>> FP16-source FXdiv-source gemmlowp kleidiai ml_dtypes psimd protobuf=20
>> pthreadpool-source ruy xnnpack; do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -ra ${S}/external/$i ${=
B}/$i
>> +=C2=A0=C2=A0=C2=A0 done
>> +
>> +=C2=A0=C2=A0=C2=A0 # There is no Fortran compiler in the toolchain, b=
ut bitbake=20
>> sets this variable anyway with unavailable
>> +=C2=A0=C2=A0=C2=A0 # binary & it leads to "CMake Error: Could not fin=
d compiler set=20
>> in environment variable FC:"
>> +=C2=A0=C2=A0=C2=A0 unset FC
>
> Is this still needed?



Umm, good point. Most likely this can be dropped.
Will confirm & send a follow up patch if that's the case


>
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
>
> We should look into fixing this on the armnn side so we can drop this=20
> at some point.


Yup, sent a patch on armnn [1] & added you in CC if that helps


[1]: https://review.mlplatform.org/c/ml/armnn/+/13743


>
>
>> +=C2=A0=C2=A0=C2=A0 ln -snf libtensorflow-lite.so ${D}${libdir}/libten=
sorflowlite.so
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install benchmark_model
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/opt/${PN}/tools/
>> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${B}/tools/benchmark/benchmark_mod=
el=20
>> ${D}/opt/${PN}/tools/
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install header files
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/tensorflow/
>> +=C2=A0=C2=A0=C2=A0 cd ${S}/tensorflow/
>> +=C2=A0=C2=A0=C2=A0 cp --parents $(find ./lite -name "*.h*" -not -path=
=20
>> "*cmake_build/*") ${D}${includedir}/tensorflow
>> +=C2=A0=C2=A0=C2=A0 cp --parents $(find ./compiler/mlir/lite -name "*.=
h*" -not -path=20
>> "*cmake_build/*") ${D}${includedir}/tensorflow
>> +=C2=A0=C2=A0=C2=A0 cd ${B}
>> +=C2=A0=C2=A0=C2=A0 cp --parents $(find . -name "*.h*")=20
>> ${D}${includedir}/tensorflow/lite
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install TFlite python3 interpreter
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_r=
untime
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_r=
untime.egg-info
>> +=C2=A0=C2=A0=C2=A0 install -m 0755=C2=A0 ${B}/tflite_runtime/*=20
>> ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime
>> +=C2=A0=C2=A0=C2=A0 install -m 0755=C2=A0 ${B}/tflite_runtime.egg-info=
/*=20
>> ${D}${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info
>> +
>> +=C2=A0=C2=A0=C2=A0 # Install pkgconfig file required for NNstreamer b=
uild
>
> It is not just NNstreamer, any project that wants to link with this
> can make use of some form of .pc or .cmake file. We should see if
> we can fix this upstream and have this project generate that during bui=
ld.


I see, let me see how we can fix it upstream


>
>
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/pkgconfig
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/tensorflow2-lite.pc.in=20
>> ${D}${libdir}/pkgconfig/tensorflow2-lite.pc
>> +=C2=A0=C2=A0=C2=A0 sed -i 's:@version@:${PV}:g
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s:=
@libdir@:${libdir}:g
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s:=
@includedir@:${includedir}:g' \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${=
D}${libdir}/pkgconfig/tensorflow2-lite.pc
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
>> +=C2=A0=C2=A0=C2=A0 ${libdir}/pkgconfig/* \
>> +"
>> +
>> +FILES:${PN}-tools =3D " \
>> +=C2=A0=C2=A0=C2=A0 /opt/* \
>
> Why /opt/ ?



So, currently I'm deploying the C++ based benchmark_model tool
in /opt. This tool isn't mandatory for TFLite Runtime to function as
such & is an optional add-on package which users may / may not use.

As /opt is the directory intended for installation of optional or
add-on software packages [2], I felt went ahead to use it


[2]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html


--
Chirag



>
>
> How about ${bindir}/${BPN}-tests?
>
> Anyway, only minor comments here, and nothing we cant fix up over time.
>
> Looks good to me,
>
> Acked-by: Andrew Davis <afd@ti.com>
>
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

