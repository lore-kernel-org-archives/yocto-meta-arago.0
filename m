Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FFCE77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 18:45:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.233.1736448322658456948
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 10:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=GHf+LCZT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 509IjLtk106851;
	Thu, 9 Jan 2025 12:45:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736448321;
	bh=wZsZfqFRwLOJUKXDSxgkhG50KGbG3KqjF3znBF7ASoU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GHf+LCZT2qMYAgXTBpxgnpI5Mk/fhuNX7CpW13sJbnp4WCTGoEkMvMpl6Q9n5MANr
	 AaCNyelxuAZSu/bUQUOVloMUpUs6gajN3W2OPpAVH/FiGdTHLGzEY6gUiXrT9e8TWv
	 9w51wOBU+HD2+J82asnBWvqI+bwEYLYYG4W/UOkY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509IjLJV012479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 12:45:21 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 12:45:20 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 12:45:21 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509IjKv2082733;
	Thu, 9 Jan 2025 12:45:20 -0600
Message-ID: <07d9ebb5-9463-4174-ac11-d3d3b11907ab@ti.com>
Date: Thu, 9 Jan 2025 12:45:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2] meta-arago-extras: Add
 recipe for arm-compute-library
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20241220164910.318809-1-afd@ti.com>
 <20241220164910.318809-3-afd@ti.com>
 <62f990d4-723a-4f91-ac72-eacf596eea32@ti.com>
 <296979f6-be58-4d7e-a0aa-84dca8f44462@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <296979f6-be58-4d7e-a0aa-84dca8f44462@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 509IjLtk106851
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Jan 2025 18:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15691



On 1/9/2025 12:44 PM, Andrew Davis wrote:
> On 1/9/25 12:27 PM, Ryan Eatmon wrote:
>>
>> This fails to build for omapl138-lcdk.=C2=A0 Do we need a v2 that addr=
ess=20
>> this?
>>
>=20
> Ah, forgot about that old thing..
>=20
> ACL is ARMv7+ only, so I'll update COMPATIBLE_HOST to drop armv5 in v2.


I think you also need to filter the package out for that platform in=20
ti-test as well.


> Thanks,
> Andrew
>=20
>>
>> On 12/20/2024 10:49 AM, Andrew Davis wrote:
>>> The Compute Library is a collection of low-level machine learning
>>> functions optimized for Arm. This will be used for ARMNN and
>>> other machine learning applications and frameworks.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 ...-indention-in-cmake-generator-script.patch | 130 ++++++++++=
++
>>> =C2=A0 ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
>>> =C2=A0 ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++=
++++++++
>>> =C2=A0 ...rce-files-at-library-definition-time.patch | 167 ++++++++++=
+++++
>>> =C2=A0 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
>>> =C2=A0 ...SVE2-support-to-be-disabled-in-CMake.patch |=C2=A0 91 +++++=
+++
>>> =C2=A0 .../0007-Allow-ARMv7-builds-using-CMake.patch |=C2=A0 86 +++++=
+++
>>> =C2=A0 ...ymbol-error-when-building-TensorInfo.patch |=C2=A0 46 ++++
>>> =C2=A0 .../arm-compute-library_24.12.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 79 +++++++
>>> =C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 10 files changed, 1023 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0001-fix-Fix-indention-in-cmake-generator-script.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0004-Add-source-files-at-library-definition-time.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0007-Allow-ARMv7-builds-using-CMake.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-li=
brary_24.12.bb
>>>
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0001-fix-Fix-indention-in-cmake-generator-script.patch b/meta-ara=
go-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-f=
ix-Fix-indention-in-cmake-generator-script.patch
>>> new file mode 100644
>>> index 00000000..9e36d254
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0001-fix-Fix-indention-in-cmake-generator-script.patch
>>> @@ -0,0 +1,130 @@
>>> +From 1e4c3016547b5f75e515d4b9a7202733c47f5a18 Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Wed, 4 Dec 2024 14:46:17 -0600
>>> +Subject: [PATCH] fix: Fix indention in cmake generator script
>>> +
>>> +All other items in these lists use tabs, the first couple
>>> +lines should match. Switch them to tabs then regenerate
>>> +the CMakeLists.txt file.
>>> +
>>> +While here fix the missing ending newline.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: Icab852fc43ae08e7858857881c996d233c835289
>>> +---
>>> + scripts/generate_build_files.py | 27 ++++++++++++++-------------
>>> + src/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 26 +++++++++++++-------------
>>> + 2 files changed, 27 insertions(+), 26 deletions(-)
>>> +
>>> +diff --git a/scripts/generate_build_files.py=20
>>> b/scripts/generate_build_files.py
>>> +index f88cf1af44..52a8cc14da 100644
>>> +--- a/scripts/generate_build_files.py
>>> ++++ b/scripts/generate_build_files.py
>>> +@@ -168,28 +168,29 @@ def build_from_template_cmake(srcs_graph,=20
>>> srcs_sve, srcs_sve2, srcs_core):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 template =3D f"""{get_template_header()}
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_graph
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_graph)}
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_graph
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_graph)}
>>> + )
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_sve)}
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_sve
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_sve)}
>>> + )
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve2
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_sve2)}
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_sve2
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_sve2)}
>>> + )
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_core)}
>>> +-)"""
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_core)}
>>> ++)
>>> ++"""
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return template
>>> +
>>> +
>>> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>>> +index ff3bed96df..f1b275532a 100644
>>> +--- a/src/CMakeLists.txt
>>> ++++ b/src/CMakeLists.txt
>>> +@@ -21,9 +21,9 @@
>>> + # SOFTWARE.
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_graph
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 graph/DataLayerVisitor.cpp
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_graph
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 graph/DataLayerVisitor.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/Graph.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/GraphBuilder.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/GraphContext.cpp
>>> +@@ -101,9 +101,9 @@ target_sources(
>>> + )
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-   =20
>>> core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_sve
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++   =20
>>> core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
>>> +    =20
>>> core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
>>> +    =20
>>> core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_ou=
tput2x2_mla_depthfirst/generic_direct.cpp
>>> +    =20
>>> core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_ou=
tput2x2_mla_depthfirst/generic_indirect.cpp
>>> +@@ -332,9 +332,9 @@ target_sources(
>>> + )
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve2
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/lut.cpp
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_sve2
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/lut.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/qasymm8=
.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/qasymm8=
_signed.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/qsymm16=
.cpp
>>> +@@ -357,9 +357,9 @@ target_sources(
>>> + )
>>> +
>>> + target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> +-=C2=A0=C2=A0=C2=A0 c/AclContext.cpp
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0 c/AclContext.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 c/AclOperator.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 c/AclQueue.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 c/AclTensor.cpp
>>> +@@ -1049,4 +1049,4 @@ target_sources(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 runtime/experimental/operators/CpuSub.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 runtime/experimental/operators/CpuTranspose=
.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 runtime/experimental/operators/CpuWinogradC=
onv2d.cpp
>>> +-)
>>> +\ No newline at end of file
>>> ++)
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch b=
/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>> new file mode 100644
>>> index 00000000..174327c5
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>>> @@ -0,0 +1,114 @@
>>> +From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 5 Dec 2024 09:21:23 -0600
>>> +Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for checking=20
>>> NEON support
>>> +
>>> +ENABLE_NEON is a flag used by the build systems. The flag is not use=
d
>>> +in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
>>> +
>>> +Drop the ENABLE_NEON compiler definition to prevent any accidental
>>> +use in code.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
>>> +---
>>> + Android.bp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>> + BUILD.bazel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>> + SConscript=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> + SConstruct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> + cmake/Options.cmake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 6 +-----
>>> + scripts/generate_android_bp.py | 1 -
>>> + 6 files changed, 3 insertions(+), 10 deletions(-)
>>> +
>>> +diff --git a/Android.bp b/Android.bp
>>> +index 69379472b0..9288bba2d4 100644
>>> +--- a/Android.bp
>>> ++++ b/Android.bp
>>> +@@ -157,7 +157,6 @@ arm_compute_library_defaults {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DEMBEDDED_KERNELS",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DARM_COMPUTE_ASSERTS_ENABLED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DARM_COMPUTE_CPP_SCHEDULER",
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"-DENABLE_NEON",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DARM_COMPUTE_ENABLE_NEON",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-Wno-unused-parameter",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DNO_DOT_IN_TOOLCHAIN",
>>> +diff --git a/BUILD.bazel b/BUILD.bazel
>>> +index f553b7bfad..2262a09655 100644
>>> +--- a/BUILD.bazel
>>> ++++ b/BUILD.bazel
>>> +@@ -170,7 +170,6 @@ config_setting(
>>> + cc_library(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 name =3D "common_defines",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 defines =3D [
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ENABLE_NEON",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_CPU_ENABLED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE_NEON",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE_I8MM",
>>> +diff --git a/SConscript b/SConscript
>>> +index 12e8fd1025..69a564873f 100644
>>> +--- a/SConscript
>>> ++++ b/SConscript
>>> +@@ -97,7 +97,7 @@ def build_multiisa_lib_objects():
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 # note that ARM_COMPUTE_ENABLE_FP16 is enab=
led in=20
>>> update_data_type_layout_flags() to make
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 # sure the environment is progated to the v=
alidation suite
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_env.Append(CPPDEFINES =3D ['ENABLE_N=
EON',=20
>>> 'ARM_COMPUTE_ENABLE_NEON',
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_env.Append(CPPDEFINES =3D ['ARM_COMP=
UTE_ENABLE_NEON',
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'ENABLE_SVE',=20
>>> 'ARM_COMPUTE_ENABLE_SVE','ARM_COMPUTE_ENABLE_BF16',
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'ARM_COMPUTE_ENABLE_I8MM',=20
>>> 'ARM_COMPUTE_ENABLE_SVEF32MM'])
>>> +
>>> +diff --git a/SConstruct b/SConstruct
>>> +index 8d7bd291e8..7381300fc8 100644
>>> +--- a/SConstruct
>>> ++++ b/SConstruct
>>> +@@ -302,7 +302,7 @@ if 'v7a' in env['estate'] and env['estate'] =3D=3D=
=20
>>> '64':
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 print("ERROR: armv7a architecture has only =
32-bit execution=20
>>> state")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 Exit(1)
>>> +
>>> +-env.Append(CPPDEFINES =3D ['ENABLE_NEON', 'ARM_COMPUTE_ENABLE_NEON'=
])
>>> ++env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON'])
>>> +
>>> + if 'sve' in env['arch']:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 env.Append(CPPDEFINES =3D ['ENABLE_SVE', 'A=
RM_COMPUTE_ENABLE_SVE'])
>>> +diff --git a/cmake/Options.cmake b/cmake/Options.cmake
>>> +index 5d685be48d..121d527718 100644
>>> +--- a/cmake/Options.cmake
>>> ++++ b/cmake/Options.cmake
>>> +@@ -53,7 +53,6 @@ option(ARM_COMPUTE_ENABLE_SVE_VALIDATION "" OFF)
>>> +
>>> + option(ENABLE_NEON "Enable Arm=C2=AE Neon=E2=84=A2 support" ON)
>>> + option(ARM_COMPUTE_CPU_ENABLED "" ON)
>>> +-option(ARM_COMPUTE_ENABLE_NEON "" ON)
>>> + option(ARM_COMPUTE_ENABLE_I8MM "" ON)
>>> + option(ENABLE_FP32_KERNELS "" ON)
>>> + option(ENABLE_QASYMM8_KERNELS "" ON)
>>> +@@ -70,14 +69,11 @@ option(ENABLE_FP16_KERNELS "" OFF)
>>> + option(ARM_COMPUTE_ENABLE_FP16 "" OFF)
>>> +
>>> + if(ENABLE_NEON)
>>> +-=C2=A0 add_definitions(-DENABLE_NEON)
>>> ++=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_NEON)
>>> + endif()
>>> + if(ARM_COMPUTE_CPU_ENABLED)
>>> +=C2=A0=C2=A0 add_definitions(-DARM_COMPUTE_CPU_ENABLED)
>>> + endif()
>>> +-if(ARM_COMPUTE_ENABLE_NEON)
>>> +-=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_NEON)
>>> +-endif()
>>> + if(ARM_COMPUTE_ENABLE_FP16)
>>> +=C2=A0=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_FP16)
>>> + endif()
>>> +diff --git a/scripts/generate_android_bp.py=20
>>> b/scripts/generate_android_bp.py
>>> +index d5b268f522..99a04e7071 100755
>>> +--- a/scripts/generate_android_bp.py
>>> ++++ b/scripts/generate_android_bp.py
>>> +@@ -94,7 +94,6 @@ arm_compute_library_defaults {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DEMBEDDED_KERNELS",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DARM_COMPUTE_ASSERTS_ENABLED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DARM_COMPUTE_CPP_SCHEDULER",
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"-DENABLE_NEON",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DARM_COMPUTE_ENABLE_NEON",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-Wno-unused-parameter",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "-DNO_DOT_IN_TOOLCHAIN",
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch b=
/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-libra=
ry/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>>> new file mode 100644
>>> index 00000000..b51e4534
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>>> @@ -0,0 +1,197 @@
>>> +From 92a881cebfee5504b188a046a96d39dd9361ddb1 Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 5 Dec 2024 08:57:38 -0600
>>> +Subject: [PATCH] Use ARM_COMPUTE_ENABLE_SVE in code for checking SVE=
=20
>>> support
>>> +
>>> +ENABLE_SVE is a flag used by the build systems. The flag used in cod=
e
>>> +is ARM_COMPUTE_ENABLE_SVE. There are just a couple spots where the
>>> +build system flag is used instead causing the need to define both.
>>> +
>>> +Switch these last users of ENABLE_SVE over to ARM_COMPUTE_ENABLE_SVE
>>> +then drop the ENABLE_SVE definition to prevent any more instances
>>> +being added in the future.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: I00da7580c4520647b62c6989bc7fbdd5efc7935e
>>> +---
>>> + BUILD.bazel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 3 ---
>>> + SConscript=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>> + SConstruct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>> + .../batchnormalization/impl/SVE/fp16.cpp=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>> + .../batchnormalization/impl/SVE/fp32.cpp=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>> + tests/BUILD.bazel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>>> + tests/validation/NEON/ActivationLayer.cpp=C2=A0=C2=A0=C2=A0=C2=A0 |=
 24 +++++++++----------
>>> + tests/validation/NEON/ArithmeticAddition.cpp=C2=A0 |=C2=A0 6 ++---
>>> + 8 files changed, 19 insertions(+), 23 deletions(-)
>>> +
>>> +diff --git a/BUILD.bazel b/BUILD.bazel
>>> +index 2262a09655..c04a52e084 100644
>>> +--- a/BUILD.bazel
>>> ++++ b/BUILD.bazel
>>> +@@ -297,7 +297,6 @@ cc_library(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "//conditions:defau=
lt": [],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 local_defines =3D [
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ENABLE_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_SVE2",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_BF16",
>>> +@@ -348,7 +347,6 @@ cc_library(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "//conditions:defau=
lt": [],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 local_defines =3D [
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ENABLE_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_BF16",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>> +@@ -409,7 +407,6 @@ cc_library(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "//conditions:defau=
lt": [],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 local_defines =3D [
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ENABLE_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE=
_BF16",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>> +diff --git a/SConscript b/SConscript
>>> +index 69a564873f..c2ca549b71 100644
>>> +--- a/SConscript
>>> ++++ b/SConscript
>>> +@@ -98,7 +98,7 @@ def build_multiisa_lib_objects():
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 # note that ARM_COMPUTE_ENABLE_FP16 is enab=
led in=20
>>> update_data_type_layout_flags() to make
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 # sure the environment is progated to the v=
alidation suite
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 arm_compute_env.Append(CPPDEFINES =3D ['ARM=
_COMPUTE_ENABLE_NEON',
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 'ENABLE_SVE',=20
>>> 'ARM_COMPUTE_ENABLE_SVE','ARM_COMPUTE_ENABLE_BF16',
>>> ++                                        =20
>>> 'ARM_COMPUTE_ENABLE_SVE','ARM_COMPUTE_ENABLE_BF16',
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'ARM_COMPUTE_ENABLE_I8MM',=20
>>> 'ARM_COMPUTE_ENABLE_SVEF32MM'])
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 # Build all the common files for the base a=
rchitecture
>>> +diff --git a/SConstruct b/SConstruct
>>> +index 7381300fc8..17f5615acf 100644
>>> +--- a/SConstruct
>>> ++++ b/SConstruct
>>> +@@ -305,7 +305,7 @@ if 'v7a' in env['estate'] and env['estate'] =3D=3D=
=20
>>> '64':
>>> + env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON'])
>>> +
>>> + if 'sve' in env['arch']:
>>> +-=C2=A0=C2=A0=C2=A0 env.Append(CPPDEFINES =3D ['ENABLE_SVE', 'ARM_CO=
MPUTE_ENABLE_SVE'])
>>> ++=C2=A0=C2=A0=C2=A0 env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_S=
VE'])
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if 'sve2' in env['arch']:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env.Append(CPPDEFIN=
ES =3D ['ARM_COMPUTE_ENABLE_SVE2'])
>>> +
>>> +diff --git=20
>>> a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp=20
>>> b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
>>> +index 48caaa3e63..e07593312c 100644
>>> +--- a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
>>> ++++ b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
>>> +@@ -128,4 +128,4 @@ void=20
>>> fp16_sve_batch_normalization(ITensor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *src,
>>> + }
>>> + } // namespace cpu
>>> + } // namespace arm_compute
>>> +-#endif // ENABLE_SVE
>>> ++#endif // ARM_COMPUTE_ENABLE_SVE
>>> +diff --git=20
>>> a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp=20
>>> b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp
>>> +index df4fbfe607..0d52d2c3c0 100644
>>> +--- a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp
>>> ++++ b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp
>>> +@@ -128,4 +128,4 @@ void=20
>>> fp32_sve_batch_normalization(ITensor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *src,
>>> + }
>>> + } // namespace cpu
>>> + } // namespace arm_compute
>>> +-#endif // ENABLE_SVE
>>> ++#endif // ARM_COMPUTE_ENABLE_SVE
>>> +diff --git a/tests/BUILD.bazel b/tests/BUILD.bazel
>>> +index 7085f1facc..4b4be8b257 100644
>>> +--- a/tests/BUILD.bazel
>>> ++++ b/tests/BUILD.bazel
>>> +@@ -114,7 +114,6 @@ cc_binary(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }) +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select({
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "//:sve_validation_flag": [
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "ENABLE_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ARM_COMPUTE_ENABLE_SVE",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "//conditions:default": [],
>>> +diff --git a/tests/validation/NEON/ActivationLayer.cpp=20
>>> b/tests/validation/NEON/ActivationLayer.cpp
>>> +index 119d51808a..69a8b52354 100644
>>> +--- a/tests/validation/NEON/ActivationLayer.cpp
>>> ++++ b/tests/validation/NEON/ActivationLayer.cpp
>>> +@@ -73,11 +73,11 @@ RelativeTolerance<float>=20
>>> relative_tolerance(DataType data_type, ActivationLayerI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 switch(data_type)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DataType::F16:
>>> +-#if defined(ENABLE_SVE)
>>> ++#if defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RelativeTolera=
nce<float>(0.25f);
>>> +-#else=C2=A0 // !defined(ENABLE_SVE)
>>> ++#else=C2=A0 // !defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RelativeTolera=
nce<float>(0.1f);
>>> +-#endif // defined(ENABLE_SVE)
>>> ++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RelativeTolera=
nce<float>(0.05f);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> +@@ -85,11 +85,11 @@ RelativeTolerance<float>=20
>>> relative_tolerance(DataType data_type, ActivationLayerI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 switch(data_type)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DataType::F16:
>>> +-#if defined(ENABLE_SVE)
>>> ++#if defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RelativeTolera=
nce<float>(0.9f);
>>> +-#else=C2=A0 // !defined(ENABLE_SVE)
>>> ++#else=C2=A0 // !defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RelativeTolera=
nce<float>(0.01f);
>>> +-#endif // defined(ENABLE_SVE)
>>> ++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RelativeTolera=
nce<float>(0.00001f);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> +@@ -117,11 +117,11 @@ AbsoluteTolerance<float>=20
>>> absolute_tolerance(DataType data_type, ActivationLayerI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 switch(data_type)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DataType::F16:
>>> +-#if defined(ENABLE_SVE)
>>> ++#if defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AbsoluteTolera=
nce<float>(0.25f);
>>> +-#else=C2=A0 // !defined(ENABLE_SVE)
>>> ++#else=C2=A0 // !defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AbsoluteTolera=
nce<float>(0.01f);
>>> +-#endif // defined(ENABLE_SVE)
>>> ++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AbsoluteTolera=
nce<float>(0.00001f);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> +@@ -129,11 +129,11 @@ AbsoluteTolerance<float>=20
>>> absolute_tolerance(DataType data_type, ActivationLayerI
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 switch(data_type)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 case DataType::F16:
>>> +-#if defined(ENABLE_SVE)
>>> ++#if defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AbsoluteTolera=
nce<float>(0.9f);
>>> +-#else=C2=A0 // !defined(ENABLE_SVE)
>>> ++#else=C2=A0 // !defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AbsoluteTolera=
nce<float>(0.01f);
>>> +-#endif // defined(ENABLE_SVE)
>>> ++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AbsoluteTolera=
nce<float>(0.00001f);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> +diff --git a/tests/validation/NEON/ArithmeticAddition.cpp=20
>>> b/tests/validation/NEON/ArithmeticAddition.cpp
>>> +index c0033daab0..bae8535ff3 100644
>>> +--- a/tests/validation/NEON/ArithmeticAddition.cpp
>>> ++++ b/tests/validation/NEON/ArithmeticAddition.cpp
>>> +@@ -48,11 +48,11 @@ namespace validation
>>> + using framework::dataset::make;
>>> + namespace
>>> + {
>>> +-#if !defined(__aarch64__) || defined(ENABLE_SVE)
>>> ++#if !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
>>> + constexpr AbsoluteTolerance<float> tolerance_quant(1); /**<=20
>>> Tolerance value for comparing reference's output against=20
>>> implementation's output for quantized data types */
>>> +-#else=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 //=20
>>> !defined(__aarch64__) || defined(ENABLE_SVE)
>>> ++#else=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 //=20
>>> !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
>>> + constexpr AbsoluteTolerance<float> tolerance_quant(1);
>>> +-#endif=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 //=20
>>> !defined(__aarch64__) || defined(ENABLE_SVE)
>>> ++#endif=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 //=20
>>> !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
>>> + const auto InPlaceDataSet=C2=A0=C2=A0=C2=A0 =3D framework::dataset:=
:make("InPlace",=20
>>> { false, true });
>>> + const auto OutOfPlaceDataSet =3D framework::dataset::make("InPlace"=
,=20
>>> { false });
>>> + } // namespace
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0004-Add-source-files-at-library-definition-time.patch b/meta-ara=
go-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-A=
dd-source-files-at-library-definition-time.patch
>>> new file mode 100644
>>> index 00000000..971658b4
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0004-Add-source-files-at-library-definition-time.patch
>>> @@ -0,0 +1,167 @@
>>> +From a3c7d6aefc289dcce6656fc6d9f9c8c9b1af8f0b Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 5 Dec 2024 09:38:26 -0600
>>> +Subject: [PATCH] Add source files at library definition time
>>> +
>>> +This allows for easier conditional disabling of these libraries.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: I442aaa03060f2cb7db4ed0c1d93e64dbc223fdc6
>>> +---
>>> + CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++---------=
-
>>> + scripts/generate_build_files.py | 16 ++++------------
>>> + src/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++------------
>>> + 3 files changed, 18 insertions(+), 34 deletions(-)
>>> +
>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>> +index e8bdf2af1a..4073e06b17 100644
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -46,6 +46,12 @@ set(CMAKE_CXX_EXTENSIONS OFF)
>>> + list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
>>> + include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Options.cmake)
>>> + include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Version.cmake)
>>> ++include(${CMAKE_CURRENT_SOURCE_DIR}/src/CMakeLists.txt)
>>> ++
>>> ++list(TRANSFORM ARM_COMPUTE_GRAPH_SOURCES PREPEND "src/")
>>> ++list(TRANSFORM ARM_COMPUTE_SVE_SOURCES PREPEND "src/")
>>> ++list(TRANSFORM ARM_COMPUTE_SVE2_SOURCES PREPEND "src/")
>>> ++list(TRANSFORM ARM_COMPUTE_SOURCES PREPEND "src/")
>>> +
>>> + # Require at least gcc/g++ 11) CMAKE_CXX_COMPILER_VERSION OR
>>> + if(CMAKE_C_COMPILER_VERSION VERSION_LESS 10.2 OR=20
>>> CMAKE_CXX_COMPILER_VERSION
>>> +@@ -139,8 +145,7 @@ endif()
>>> +
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # SVE Object Library
>>> +-
>>> +-add_library(arm_compute_sve OBJECT "")
>>> ++add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
>>> + target_compile_options(arm_compute_sve
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-fPIC")
>>> +@@ -162,8 +167,7 @@ target_include_directories(
>>> +
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # SVE2 Object Library
>>> +-
>>> +-add_library(arm_compute_sve2 OBJECT "")
>>> ++add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
>>> + target_compile_options(arm_compute_sve2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-fPIC")
>>> +@@ -187,7 +191,7 @@ target_include_directories(
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # Core Library
>>> +
>>> +-add_library(arm_compute "")
>>> ++add_library(arm_compute ${ARM_COMPUTE_SOURCES})
>>> + target_compile_options(arm_compute PRIVATE=20
>>> "-march=3D${ARM_COMPUTE_ARCH}")
>>> + target_compile_definitions(arm_compute PRIVATE=20
>>> ARM_COMPUTE_ENABLE_BF16)
>>> + target_compile_definitions(arm_compute PRIVATE ENABLE_SVE)
>>> +@@ -216,7 +220,7 @@ target_link_libraries(
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # Graph Library
>>> +
>>> +-add_library(arm_compute_graph "")
>>> ++add_library(arm_compute_graph ${ARM_COMPUTE_GRAPH_SOURCES})
>>> + target_compile_options(arm_compute_graph PRIVATE=20
>>> "-march=3D${ARM_COMPUTE_ARCH}")
>>> + target_compile_definitions(arm_compute_graph PRIVATE ENABLE_SVE)
>>> + target_compile_definitions(arm_compute_graph PRIVATE=20
>>> ARM_COMPUTE_ENABLE_SVE)
>>> +@@ -238,10 +242,6 @@ target_compile_options(arm_compute_graph PUBLIC=
=20
>>> ${COMMON_CXX_FLAGS})
>>> +
>>> + add_library(ArmCompute::Graph ALIAS arm_compute_graph)
>>> +
>>> +-#=20
>>> ---------------------------------------------------------------------
>>> +-# Library Target Sources
>>> +-add_subdirectory(src)
>>> +-
>>> + if(ARM_COMPUTE_BUILD_TESTING)
>>> +=C2=A0=C2=A0 #=20
>>> ---------------------------------------------------------------------
>>> +=C2=A0=C2=A0 # Validation Framework Library
>>> +diff --git a/scripts/generate_build_files.py=20
>>> b/scripts/generate_build_files.py
>>> +index 52a8cc14da..4c4a14623f 100644
>>> +--- a/scripts/generate_build_files.py
>>> ++++ b/scripts/generate_build_files.py
>>> +@@ -167,27 +167,19 @@ def build_from_template_cmake(srcs_graph,=20
>>> srcs_sve, srcs_sve2, srcs_core):
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 template =3D f"""{get_template_header()}
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_graph
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_GRAPH_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_graph)}
>>> + )
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_SVE_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_sve)}
>>> + )
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve2
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_SVE2_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_sve2)}
>>> + )
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {line_separator.join(srcs_core)}
>>> + )
>>> + """
>>> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>>> +index f1b275532a..73871563e1 100644
>>> +--- a/src/CMakeLists.txt
>>> ++++ b/src/CMakeLists.txt
>>> +@@ -20,9 +20,7 @@
>>> + # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=20
>>> DEALINGS IN THE
>>> + # SOFTWARE.
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_graph
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_GRAPH_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/DataLayerVisitor.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/Graph.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/GraphBuilder.cpp
>>> +@@ -100,9 +98,7 @@ target_sources(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 graph/printers/DotGraphPrinter.cpp
>>> + )
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_SVE_SOURCES
>>> +    =20
>>> core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
>>> +    =20
>>> core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
>>> +    =20
>>> core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_ou=
tput2x2_mla_depthfirst/generic_direct.cpp
>>> +@@ -331,9 +327,7 @@ target_sources(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/softmax/generic/sve/impl_bf16.c=
pp
>>> + )
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute_sve2
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_SVE2_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/lut.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/qasymm8=
.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/activation/generic/sve2/qasymm8=
_signed.cpp
>>> +@@ -356,9 +350,7 @@ target_sources(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 cpu/kernels/softmax/generic/sve2/impl.cpp
>>> + )
>>> +
>>> +-target_sources(
>>> +-=C2=A0=C2=A0=C2=A0 arm_compute
>>> +-=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++set(ARM_COMPUTE_SOURCES
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 c/AclContext.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 c/AclOperator.cpp
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 c/AclQueue.cpp
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch b/meta=
-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/00=
05-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>> new file mode 100644
>>> index 00000000..29ca02f5
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>>> @@ -0,0 +1,112 @@
>>> +From cdb765df59d8ce5f388ac2a820b5da76eb8d610c Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 5 Dec 2024 09:47:25 -0600
>>> +Subject: [PATCH] Add CMake options for SVE, SVE2, and BF16 support
>>> +
>>> +These should be optional, add options for these. Remove the hard-cod=
ed
>>> +definitions of these for the libraries. This also makes it so=20
>>> validation
>>> +options are not needed, if SVE is enabled it will be validated.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: I03182ac6ece843e813c027ef6a573cbba254dee9
>>> +---
>>> + CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 -----------------=
--
>>> + cmake/Options.cmake | 16 +++++++++++++---
>>> + 2 files changed, 13 insertions(+), 22 deletions(-)
>>> +
>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>> +index 4073e06b17..4d95fb1bfd 100644
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -149,9 +149,6 @@ add_library(arm_compute_sve OBJECT=20
>>> ${ARM_COMPUTE_SVE_SOURCES})
>>> + target_compile_options(arm_compute_sve
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-fPIC")
>>> +-target_compile_definitions(arm_compute_sve PRIVATE=20
>>> ARM_COMPUTE_ENABLE_BF16)
>>> +-target_compile_definitions(arm_compute_sve PRIVATE ENABLE_SVE)
>>> +-target_compile_definitions(arm_compute_sve PRIVATE=20
>>> ARM_COMPUTE_ENABLE_SVE)
>>> + target_include_directories(
>>> +=C2=A0=C2=A0 arm_compute_sve
>>> +=C2=A0=C2=A0 PUBLIC $<INSTALL_INTERFACE:include>
>>> +@@ -171,10 +168,6 @@ add_library(arm_compute_sve2 OBJECT=20
>>> ${ARM_COMPUTE_SVE2_SOURCES})
>>> + target_compile_options(arm_compute_sve2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-fPIC")
>>> +-target_compile_definitions(arm_compute_sve2 PRIVATE=20
>>> ARM_COMPUTE_ENABLE_SVE2)
>>> +-target_compile_definitions(arm_compute_sve2 PRIVATE=20
>>> ARM_COMPUTE_ENABLE_BF16)
>>> +-target_compile_definitions(arm_compute_sve2 PRIVATE ENABLE_SVE)
>>> +-target_compile_definitions(arm_compute_sve2 PRIVATE=20
>>> ARM_COMPUTE_ENABLE_SVE)
>>> + target_include_directories(
>>> +=C2=A0=C2=A0 arm_compute_sve2
>>> +=C2=A0=C2=A0 PUBLIC $<INSTALL_INTERFACE:include>
>>> +@@ -193,9 +186,6 @@ target_include_directories(
>>> +
>>> + add_library(arm_compute ${ARM_COMPUTE_SOURCES})
>>> + target_compile_options(arm_compute PRIVATE=20
>>> "-march=3D${ARM_COMPUTE_ARCH}")
>>> +-target_compile_definitions(arm_compute PRIVATE=20
>>> ARM_COMPUTE_ENABLE_BF16)
>>> +-target_compile_definitions(arm_compute PRIVATE ENABLE_SVE)
>>> +-target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_S=
VE)
>>> + target_include_directories(
>>> +=C2=A0=C2=A0 arm_compute
>>> +=C2=A0=C2=A0 PUBLIC $<INSTALL_INTERFACE:include>
>>> +@@ -222,8 +212,6 @@ target_link_libraries(
>>> +
>>> + add_library(arm_compute_graph ${ARM_COMPUTE_GRAPH_SOURCES})
>>> + target_compile_options(arm_compute_graph PRIVATE=20
>>> "-march=3D${ARM_COMPUTE_ARCH}")
>>> +-target_compile_definitions(arm_compute_graph PRIVATE ENABLE_SVE)
>>> +-target_compile_definitions(arm_compute_graph PRIVATE=20
>>> ARM_COMPUTE_ENABLE_SVE)
>>> + # add_subdirectory(src/graph)
>>> +
>>> + target_include_directories(
>>> +@@ -268,13 +256,6 @@ if(ARM_COMPUTE_BUILD_TESTING)
>>> +
>>> +=C2=A0=C2=A0 add_executable(arm_compute_validation "")
>>> +=C2=A0=C2=A0 target_compile_options(arm_compute_validation PRIVATE=20
>>> "-march=3D${ARM_COMPUTE_ARCH}")
>>> +-=C2=A0 if(ARM_COMPUTE_ENABLE_BF16_VALIDATION)
>>> +-=C2=A0=C2=A0=C2=A0 target_compile_definitions(arm_compute_validatio=
n PRIVATE=20
>>> ARM_COMPUTE_ENABLE_BF16)
>>> +-=C2=A0 endif()
>>> +-=C2=A0 if(ARM_COMPUTE_ENABLE_SVE_VALIDATION)
>>> +-=C2=A0=C2=A0=C2=A0 target_compile_definitions(arm_compute_validatio=
n PRIVATE=20
>>> ENABLE_SVE)
>>> +-=C2=A0=C2=A0=C2=A0 target_compile_definitions(arm_compute_validatio=
n PRIVATE=20
>>> ARM_COMPUTE_ENABLE_SVE)
>>> +-=C2=A0 endif()
>>> +=C2=A0=C2=A0 add_subdirectory(tests/validation)
>>> +=C2=A0=C2=A0 target_compile_options(arm_compute_validation PUBLIC=20
>>> ${COMMON_CXX_FLAGS})
>>> +=C2=A0=C2=A0 set_target_properties(
>>> +diff --git a/cmake/Options.cmake b/cmake/Options.cmake
>>> +index 121d527718..5c23fcb490 100644
>>> +--- a/cmake/Options.cmake
>>> ++++ b/cmake/Options.cmake
>>> +@@ -48,11 +48,12 @@ set(ARM_COMPUTE_ARCH armv8-a CACHE STRING=20
>>> "Architecture to use")
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # Backends
>>> +
>>> +-option(ARM_COMPUTE_ENABLE_BF16_VALIDATION "" ON)
>>> +-option(ARM_COMPUTE_ENABLE_SVE_VALIDATION "" OFF)
>>> +-
>>> + option(ENABLE_NEON "Enable Arm=C2=AE Neon=E2=84=A2 support" ON)
>>> ++option(ENABLE_SVE "Enable Arm=C2=AE SVE support" ON)
>>> ++option(ENABLE_SVE2 "Enable Arm=C2=AE SVE2 support" ON)
>>> ++
>>> + option(ARM_COMPUTE_CPU_ENABLED "" ON)
>>> ++option(ARM_COMPUTE_ENABLE_BF16 "" ON)
>>> + option(ARM_COMPUTE_ENABLE_I8MM "" ON)
>>> + option(ENABLE_FP32_KERNELS "" ON)
>>> + option(ENABLE_QASYMM8_KERNELS "" ON)
>>> +@@ -74,6 +75,15 @@ endif()
>>> + if(ARM_COMPUTE_CPU_ENABLED)
>>> +=C2=A0=C2=A0 add_definitions(-DARM_COMPUTE_CPU_ENABLED)
>>> + endif()
>>> ++if(ENABLE_SVE)
>>> ++=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_SVE)
>>> ++endif()
>>> ++if(ENABLE_SVE2)
>>> ++=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_SVE2)
>>> ++endif()
>>> ++if(ARM_COMPUTE_ENABLE_BF16)
>>> ++=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_BF16)
>>> ++endif()
>>> + if(ARM_COMPUTE_ENABLE_FP16)
>>> +=C2=A0=C2=A0 add_definitions(-DARM_COMPUTE_ENABLE_FP16)
>>> + endif()
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch b/m=
eta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library=
/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>> new file mode 100644
>>> index 00000000..06370adb
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>>> @@ -0,0 +1,91 @@
>>> +From ab5bf5b8f86337a31bfd48277650f583a040e658 Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 5 Dec 2024 09:59:48 -0600
>>> +Subject: [PATCH] Allow SVE and SVE2 support to be disabled in CMake
>>> +
>>> +Currently these are hard-coded as enabled. The SVE and SVE2 librarie=
s
>>> +are built unconditionally. These should only be built when SVE or
>>> +SVE2 is available.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: I176259f872a84f736028622694d65d4c5b57e379
>>> +---
>>> + CMakeLists.txt | 25 ++++++++++++++++++-------
>>> + 1 file changed, 18 insertions(+), 7 deletions(-)
>>> +
>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>> +index 4d95fb1bfd..d233d6bc67 100644
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -145,6 +145,7 @@ endif()
>>> +
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # SVE Object Library
>>> ++if(ENABLE_SVE)
>>> + add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
>>> + target_compile_options(arm_compute_sve
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
>>> +@@ -161,9 +162,11 @@ target_include_directories(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/cpu/=
kernels/assembly
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/cpu/kerne=
ls/assembly
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEON=
/kernels/arm_gemm/merges)
>>> ++endif() # ENABLE_SVE
>>> +
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # SVE2 Object Library
>>> ++if(ENABLE_SVE2)
>>> + add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
>>> + target_compile_options(arm_compute_sve2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
>>> +@@ -180,6 +183,7 @@ target_include_directories(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/cpu/=
kernels/assembly
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/cpu/kerne=
ls/assembly
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEON=
/kernels/arm_gemm/merges)
>>> ++endif() # ENABLE_SVE2
>>> +
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # Core Library
>>> +@@ -203,9 +207,12 @@ target_compile_options(arm_compute PUBLIC=20
>>> ${COMMON_CXX_FLAGS})
>>> + add_library(ArmCompute::Core ALIAS arm_compute)
>>> +
>>> + # arm_compute_sve and arm_compute_sve2 obj files will not be public=
=20
>>> in the arm_compute.so
>>> +-target_link_libraries(
>>> +-=C2=A0 arm_compute PRIVATE $<TARGET_OBJECTS:arm_compute_sve>
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PRIVATE $<TARGET_OBJECTS:arm_compute_sve2>)
>>> ++if(ENABLE_SVE)
>>> ++=C2=A0 target_link_libraries(arm_compute PRIVATE=20
>>> $<TARGET_OBJECTS:arm_compute_sve>)
>>> ++endif()
>>> ++if(ENABLE_SVE2)
>>> ++=C2=A0 target_link_libraries(arm_compute PRIVATE=20
>>> $<TARGET_OBJECTS:arm_compute_sve2>)
>>> ++endif()
>>> +
>>> + #=20
>>> ---------------------------------------------------------------------
>>> + # Graph Library
>>> +@@ -263,8 +270,10 @@ if(ARM_COMPUTE_BUILD_TESTING)
>>> +                                      =20
>>> "${CMAKE_BINARY_DIR}/validation")
>>> +=C2=A0=C2=A0 target_link_libraries(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 arm_compute_validation
>>> +-=C2=A0=C2=A0=C2=A0 PUBLIC arm_compute arm_compute_graph=20
>>> arm_compute_validation_framework
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_co=
mpute_sve)
>>> ++=C2=A0=C2=A0=C2=A0 PUBLIC arm_compute arm_compute_graph=20
>>> arm_compute_validation_framework)
>>> ++=C2=A0=C2=A0=C2=A0 if(ENABLE_SVE)
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_link_libraries(arm_compute_va=
lidation PUBLIC=20
>>> arm_compute_sve)
>>> ++=C2=A0=C2=A0=C2=A0 endif()
>>> +=C2=A0=C2=A0 target_link_directories(arm_compute_validation PUBLIC t=
ests)
>>> +
>>> +=C2=A0=C2=A0 #=20
>>> ---------------------------------------------------------------------
>>> +@@ -299,8 +308,10 @@ if(ARM_COMPUTE_BUILD_EXAMPLES)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 set_target_properties(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${test_name} PROPERTIES RUNTIME=
_OUTPUT_DIRECTORY
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${CMAKE_BINARY_DIR}/examples")
>>> +-=C2=A0=C2=A0=C2=A0 target_link_libraries(${test_name} PUBLIC arm_co=
mpute
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_compute_graph=20
>>> arm_compute_sve)
>>> ++=C2=A0=C2=A0=C2=A0 target_link_libraries(${test_name} PUBLIC arm_co=
mpute=20
>>> arm_compute_graph)
>>> ++=C2=A0=C2=A0=C2=A0 if(ENABLE_SVE)
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_link_libraries(${test_name} P=
UBLIC arm_compute_sve)
>>> ++=C2=A0=C2=A0=C2=A0 endif()
>>> +=C2=A0=C2=A0 endforeach()
>>> +
>>> +=C2=A0=C2=A0 # NEON Examples
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0007-Allow-ARMv7-builds-using-CMake.patch b/meta-arago-extras/rec=
ipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-bu=
ilds-using-CMake.patch
>>> new file mode 100644
>>> index 00000000..07dd4bee
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0007-Allow-ARMv7-builds-using-CMake.patch
>>> @@ -0,0 +1,86 @@
>>> +From 416cffe2a75a4ec66a75e00bc00297f2f0187e0f Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Thu, 5 Dec 2024 10:05:03 -0600
>>> +Subject: [PATCH] Allow ARMv7 builds using CMake
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: Ib6bae5820569a8eadd53afdfe31e611a3089140e
>>> +---
>>> + CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 ++++++++++=
+++++++--
>>> + .../fixtures/CpuGemmAssemblyDispatchFixture.h |=C2=A0 3 +++
>>> + 2 files changed, 26 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>> +index d233d6bc67..4fc27553f3 100644
>>> +--- a/CMakeLists.txt
>>> ++++ b/CMakeLists.txt
>>> +@@ -148,7 +148,7 @@ endif()
>>> + if(ENABLE_SVE)
>>> + add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
>>> + target_compile_options(arm_compute_sve
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRIVATE "=
-march=3Darmv8.2-a+sve+fp16+dotprod"
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRIVATE "=
-march=3D${ARM_COMPUTE_ARCH}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-fPIC")
>>> + target_include_directories(
>>> +=C2=A0=C2=A0 arm_compute_sve
>>> +@@ -169,7 +169,7 @@ endif() # ENABLE_SVE
>>> + if(ENABLE_SVE2)
>>> + add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
>>> + target_compile_options(arm_compute_sve2
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRIVATE "=
-march=3Darmv8.6-a+sve2+fp16+dotprod"
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRIVATE "=
-march=3D${ARM_COMPUTE_ARCH}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PRI=
VATE "-fPIC")
>>> + target_include_directories(
>>> +=C2=A0=C2=A0 arm_compute_sve2
>>> +@@ -204,6 +204,15 @@ target_include_directories(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/cor=
e/NEON/kernels/convolution/winograd)
>>> + target_compile_options(arm_compute PUBLIC ${COMMON_CXX_FLAGS})
>>> +
>>> ++if(ARM_COMPUTE_ARCH MATCHES "armv7")
>>> ++=C2=A0 target_sources(
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEON/kernels/arm_gemm/kerne=
ls/a32_sgemm_8x6/a53.cpp
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEON/kernels/arm_gemm/kerne=
ls/a32_sgemm_8x6/a55r1.cpp
>>> ++     =20
>>> src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/generic.cpp)
>>> ++endif()
>>> ++
>>> + add_library(ArmCompute::Core ALIAS arm_compute)
>>> +
>>> + # arm_compute_sve and arm_compute_sve2 obj files will not be public=
=20
>>> in the arm_compute.so
>>> +@@ -264,6 +273,18 @@ if(ARM_COMPUTE_BUILD_TESTING)
>>> +=C2=A0=C2=A0 add_executable(arm_compute_validation "")
>>> +=C2=A0=C2=A0 target_compile_options(arm_compute_validation PRIVATE=20
>>> "-march=3D${ARM_COMPUTE_ARCH}")
>>> +=C2=A0=C2=A0 add_subdirectory(tests/validation)
>>> ++=C2=A0 target_include_directories(
>>> ++=C2=A0=C2=A0=C2=A0 arm_compute_validation
>>> ++=C2=A0=C2=A0=C2=A0 PUBLIC $<INSTALL_INTERFACE:include>
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $<BUILD_INTE=
RFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${CMAKE_CURR=
ENT_SOURCE_DIR}
>>> ++=C2=A0=C2=A0=C2=A0 PRIVATE src
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/cpu/kern=
els/assembly
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEO=
N/kernels/arm_gemm
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEO=
N/kernels/assembly
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEO=
N/kernels/convolution/common
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEO=
N/kernels/arm_conv/depthwise
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src/core/NEO=
N/kernels/convolution/winograd)
>>> +=C2=A0=C2=A0 target_compile_options(arm_compute_validation PUBLIC=20
>>> ${COMMON_CXX_FLAGS})
>>> +=C2=A0=C2=A0 set_target_properties(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 arm_compute_validation PROPERTIES RUNTIME_O=
UTPUT_DIRECTORY
>>> +diff --git=20
>>> a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h=20
>>> b/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
>>> +index 5d74e210d5..0b45cdf356 100644
>>> +--- a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
>>> ++++ b/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
>>> +@@ -25,7 +25,10 @@
>>> + #define ACL_TESTS_VALIDATION_FIXTURES_CPUGEMMASSEMBLYDISPATCHFIXTUR=
E_H
>>> +
>>> + #include "arm_compute/core/Helpers.h"
>>> ++
>>> ++#ifdef ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
>>> + #include "arm_compute/runtime/NEON/functions/NEReorderLayer.h"
>>> ++#endif //ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
>>> + #include "arm_compute/runtime/NEON/functions/NETranspose.h"
>>> +
>>> + #include "src/core/NEON/kernels/arm_gemm/utils.hpp"
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch b/=
meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-librar=
y/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>>> new file mode 100644
>>> index 00000000..9883a44d
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>>> @@ -0,0 +1,46 @@
>>> +From 58698788adaeb2f74cf9fcddf06f3e9a2e78b984 Mon Sep 17 00:00:00 20=
01
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Mon, 16 Dec 2024 09:42:22 -0600
>>> +Subject: [PATCH] Fix undefined symbol error when building TensorInfo
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Change-Id: I657d1b7faaad94147c685c4826916d3c21da82e1
>>> +---
>>> + arm_compute/core/TensorInfo.h | 5 +----
>>> + src/core/TensorInfo.cpp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++=
++
>>> + 2 files changed, 6 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/arm_compute/core/TensorInfo.h=20
>>> b/arm_compute/core/TensorInfo.h
>>> +index e4c9cbe879..2bfe83c4b1 100644
>>> +--- a/arm_compute/core/TensorInfo.h
>>> ++++ b/arm_compute/core/TensorInfo.h
>>> +@@ -242,10 +242,7 @@ public:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return _num_channel=
s;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +-=C2=A0=C2=A0=C2=A0 const TensorShape &tensor_shape() const override
>>> +-=C2=A0=C2=A0=C2=A0 {
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return _tensor_shape;
>>> +-=C2=A0=C2=A0=C2=A0 }
>>> ++=C2=A0=C2=A0=C2=A0 const TensorShape &tensor_shape() const override=
;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const TensorDimsState &tensor_dims_state() =
const override
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return _dims_state;
>>> +diff --git a/src/core/TensorInfo.cpp b/src/core/TensorInfo.cpp
>>> +index 31bddbde40..884203fd7c 100644
>>> +--- a/src/core/TensorInfo.cpp
>>> ++++ b/src/core/TensorInfo.cpp
>>> +@@ -395,6 +395,11 @@ ITensorInfo=20
>>> &TensorInfo::set_tensor_dims_state(const TensorDimsState &state)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return *this;
>>> + }
>>> +
>>> ++const TensorShape &TensorInfo::tensor_shape() const
>>> ++{
>>> ++=C2=A0=C2=A0=C2=A0 return _tensor_shape;
>>> ++}
>>> ++
>>> + ITensorInfo &TensorInfo::set_quantization_info(const=20
>>> QuantizationInfo &quantization_info)
>>> + {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 _quantization_info =3D quantization_info;
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-library=
/arm-compute-library_24.12.bb
>>> new file mode 100644
>>> index 00000000..d069da4c
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library_24.12.bb
>>> @@ -0,0 +1,79 @@
>>> +SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
>>> +DESCRIPTION =3D "The ARM Computer Vision and Machine Learning librar=
y=20
>>> is a set of functions optimised for both ARM CPUs and GPUs."
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSES/MIT.txt;md5=3D35f8944fae972976691f3483b0ac9dba"
>>> +
>>> +SRC_URI =3D " \
>>> +   =20
>>> git://github.com/ARM-software/ComputeLibrary.git;branch=3Dmain;protoc=
ol=3Dhttps \
>>> +=C2=A0=C2=A0=C2=A0 file://0001-fix-Fix-indention-in-cmake-generator-=
script.patch \
>>> +   =20
>>> file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patc=
h \
>>> +   =20
>>> file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patc=
h \
>>> +=C2=A0=C2=A0=C2=A0 file://0004-Add-source-files-at-library-definitio=
n-time.patch \
>>> +=C2=A0=C2=A0=C2=A0 file://0005-Add-CMake-options-for-SVE-SVE2-and-BF=
16-support.patch \
>>> +   =20
>>> file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch =
\
>>> +=C2=A0=C2=A0=C2=A0 file://0007-Allow-ARMv7-builds-using-CMake.patch =
\
>>> +   =20
>>> file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch=
 \
>>> +"
>>> +SRCREV =3D "32bcced2af7feea6969dd1d22e58d0718dc488e3"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
>>> +
>>> +inherit cmake
>>> +
>>> +PACKAGECONFIG ??=3D "examples tests cppthreads openmp"
>>> +
>>> +PACKAGECONFIG[Werror] =3D=20
>>> "-DARM_COMPUTE_WERROR=3DON,-DARM_COMPUTE_WERROR=3DOFF"
>>> +PACKAGECONFIG[examples] =3D=20
>>> "-DARM_COMPUTE_BUILD_EXAMPLES=3DON,-DARM_COMPUTE_BUILD_EXAMPLES=3DOFF=
"
>>> +PACKAGECONFIG[tests] =3D=20
>>> "-DARM_COMPUTE_BUILD_TESTING=3DON,-DARM_COMPUTE_BUILD_TESTING=3DOFF"
>>> +PACKAGECONFIG[cppthreads] =3D=20
>>> "-DARM_COMPUTE_CPPTHREADS=3DON,-DARM_COMPUTE_CPPTHREADS=3DOFF"
>>> +PACKAGECONFIG[openmp] =3D=20
>>> "-DARM_COMPUTE_OPENMP=3DON,-DARM_COMPUTE_OPENMP=3DOFF"
>>> +
>>> +EXTRA_OECMAKE:append:aarch64 =3D " \
>>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ARCH=3Darmv8-a \
>>> +=C2=A0=C2=A0=C2=A0 -DENABLE_NEON=3DON \
>>> +=C2=A0=C2=A0=C2=A0 -DENABLE_SVE=3DOFF \
>>> +=C2=A0=C2=A0=C2=A0 -DENABLE_SVE2=3DOFF \
>>> +"
>>> +EXTRA_OECMAKE:append:arm =3D " \
>>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ARCH=3Darmv7-a \
>>> +=C2=A0=C2=A0=C2=A0 -DENABLE_NEON=3DON \
>>> +=C2=A0=C2=A0=C2=A0 -DENABLE_SVE=3DOFF \
>>> +=C2=A0=C2=A0=C2=A0 -DENABLE_SVE2=3DOFF \
>>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_BF16=3DOFF \
>>> +=C2=A0=C2=A0=C2=A0 -DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
>>> +"
>>> +
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>>> +
>>> +# package unversioned .so files in PN (they are not dev symlinks)
>>> +FILES_SOLIBSDEV =3D ""
>>> +FILES:${PN} +=3D "${libdir}/*.so"
>>> +
>>> +# Install headers and examples
>>> +do_install:append() {
>>> +=C2=A0=C2=A0=C2=A0 # Install headers
>>> +=C2=A0=C2=A0=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no=
-preserve=3Downership"
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}
>>> +=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${S}/arm_compute ${D}${includedir}
>>> +=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${S}/support ${D}${includedir}/suppor=
t
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Install examples
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'example=
s', 'true',=20
>>> 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}/=
${PN}-${PV}/examples
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for example in ${B}/examp=
les/*; do
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f [ -d "$example" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
i
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
ase "$example" in
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (*.o|*.a|*.cmake) continue;;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
sac
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nstall -m 0555 $example ${D}${bindir}/${PN}-${PV}/examples
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +}
>>> +
>>> +PACKAGES =3D+ "${PN}-tests ${PN}-examples"
>>> +FILES:${PN}-tests +=3D "${libdir}/tests"
>>> +FILES:${PN}-examples +=3D "${bindir}/*/examples"
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=20
>>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index e8458cef..37f75a39 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -61,6 +61,7 @@ TI_TEST_EXTRAS =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 piglit \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-numpy \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wayland-utils \
>>> +=C2=A0=C2=A0=C2=A0 arm-compute-library-tests \
>>> =C2=A0 "
>>> =C2=A0 TI_TEST_BASE:append:armv7a =3D " \
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

