Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2005C02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:00:02 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.96514.1738609196787222093
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 10:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=lx3gdPN7;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513IxtTF2248959
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 12:59:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738609195;
	bh=QhAfwF2+rmjXk6ydbXvg2Lg5p4MlVzsyxjeq636gpZg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lx3gdPN7vvI5To7fiVFKjHV/jO26QjFiZrOuK12ln2iFEIYSBU37k5DGWrjsF/awT
	 /IVRe2DFzjUh8J2L7L1wcMIFx8XsiRXJHBBhYrm7DSSRjxido7REs8JXG4z+vMG+Fk
	 Dc0hmEu0apWEeZ8lSrTqx54pRMEQVJvXxu9I/7HM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513Ixtll014231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 12:59:55 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 12:59:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 12:59:55 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513Ixsp3123822;
	Mon, 3 Feb 2025 12:59:54 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 1/4] meta-arago-extras: Add recipe for arm-compute-library
Date: Mon, 3 Feb 2025 12:59:50 -0600
Message-ID: <20250203185953.269693-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250203185953.269693-1-afd@ti.com>
References: <20250203185953.269693-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 513IxtTF2248959
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 19:00:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15797

The Compute Library is a collection of low-level machine learning
functions optimized for Arm. This will be used for ARMNN and
other machine learning applications and frameworks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
 ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
 ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
 ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
 ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
 .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
 ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
 .../arm-compute-library_24.12.bb              |  89 ++++++++
 9 files changed, 1032 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.pa=
tch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checki=
ng-NEO.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checkin=
g-SVE-.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0004-Add-source-files-at-library-definition-time.pa=
tch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-suppor=
t.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-C=
Make.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-Tenso=
rInfo.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-librar=
y/arm-compute-library_24.12.bb

diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch b/m=
eta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library=
/0001-fix-Fix-indention-in-cmake-generator-script.patch
new file mode 100644
index 00000000..9e36d254
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0001-fix-Fix-indention-in-cmake-generator-script.patch
@@ -0,0 +1,130 @@
+From 1e4c3016547b5f75e515d4b9a7202733c47f5a18 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Wed, 4 Dec 2024 14:46:17 -0600
+Subject: [PATCH] fix: Fix indention in cmake generator script
+
+All other items in these lists use tabs, the first couple
+lines should match. Switch them to tabs then regenerate
+the CMakeLists.txt file.
+
+While here fix the missing ending newline.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: Icab852fc43ae08e7858857881c996d233c835289
+---
+ scripts/generate_build_files.py | 27 ++++++++++++++-------------
+ src/CMakeLists.txt              | 26 +++++++++++++-------------
+ 2 files changed, 27 insertions(+), 26 deletions(-)
+
+diff --git a/scripts/generate_build_files.py b/scripts/generate_build_fi=
les.py
+index f88cf1af44..52a8cc14da 100644
+--- a/scripts/generate_build_files.py
++++ b/scripts/generate_build_files.py
+@@ -168,28 +168,29 @@ def build_from_template_cmake(srcs_graph, srcs_sve=
, srcs_sve2, srcs_core):
+     template =3D f"""{get_template_header()}
+=20
+ target_sources(
+-    arm_compute_graph
+-    PRIVATE
+-    {line_separator.join(srcs_graph)}
++	arm_compute_graph
++	PRIVATE
++	{line_separator.join(srcs_graph)}
+ )
+=20
+ target_sources(
+-    arm_compute_sve
+-    PRIVATE
+-    {line_separator.join(srcs_sve)}
++	arm_compute_sve
++	PRIVATE
++	{line_separator.join(srcs_sve)}
+ )
+=20
+ target_sources(
+-    arm_compute_sve2
+-    PRIVATE
+-    {line_separator.join(srcs_sve2)}
++	arm_compute_sve2
++	PRIVATE
++	{line_separator.join(srcs_sve2)}
+ )
+=20
+ target_sources(
+-    arm_compute
+-    PRIVATE
+-    {line_separator.join(srcs_core)}
+-)"""
++	arm_compute
++	PRIVATE
++	{line_separator.join(srcs_core)}
++)
++"""
+     return template
+=20
+=20
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index ff3bed96df..f1b275532a 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -21,9 +21,9 @@
+ # SOFTWARE.
+=20
+ target_sources(
+-    arm_compute_graph
+-    PRIVATE
+-    graph/DataLayerVisitor.cpp
++	arm_compute_graph
++	PRIVATE
++	graph/DataLayerVisitor.cpp
+ 	graph/Graph.cpp
+ 	graph/GraphBuilder.cpp
+ 	graph/GraphContext.cpp
+@@ -101,9 +101,9 @@ target_sources(
+ )
+=20
+ target_sources(
+-    arm_compute_sve
+-    PRIVATE
+-    core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cp=
p
++	arm_compute_sve
++	PRIVATE
++	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_out=
put2x2_mla_depthfirst/generic_direct.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_out=
put2x2_mla_depthfirst/generic_indirect.cpp
+@@ -332,9 +332,9 @@ target_sources(
+ )
+=20
+ target_sources(
+-    arm_compute_sve2
+-    PRIVATE
+-    cpu/kernels/activation/generic/sve2/lut.cpp
++	arm_compute_sve2
++	PRIVATE
++	cpu/kernels/activation/generic/sve2/lut.cpp
+ 	cpu/kernels/activation/generic/sve2/qasymm8.cpp
+ 	cpu/kernels/activation/generic/sve2/qasymm8_signed.cpp
+ 	cpu/kernels/activation/generic/sve2/qsymm16.cpp
+@@ -357,9 +357,9 @@ target_sources(
+ )
+=20
+ target_sources(
+-    arm_compute
+-    PRIVATE
+-    c/AclContext.cpp
++	arm_compute
++	PRIVATE
++	c/AclContext.cpp
+ 	c/AclOperator.cpp
+ 	c/AclQueue.cpp
+ 	c/AclTensor.cpp
+@@ -1049,4 +1049,4 @@ target_sources(
+ 	runtime/experimental/operators/CpuSub.cpp
+ 	runtime/experimental/operators/CpuTranspose.cpp
+ 	runtime/experimental/operators/CpuWinogradConv2d.cpp
+-)
+\ No newline at end of file
++)
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.=
patch b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
new file mode 100644
index 00000000..174327c5
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
@@ -0,0 +1,114 @@
+From 4350c56d14b7b68acd060d8331f3ade1fb74e167 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 5 Dec 2024 09:21:23 -0600
+Subject: [PATCH] Use ARM_COMPUTE_ENABLE_NEON in code for checking NEON s=
upport
+
+ENABLE_NEON is a flag used by the build systems. The flag is not used
+in code, instead ARM_COMPUTE_ENABLE_NEON is used everywhere.
+
+Drop the ENABLE_NEON compiler definition to prevent any accidental
+use in code.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: I65f5e7411c99280e2dd8c187140909cefd1c6892
+---
+ Android.bp                     | 1 -
+ BUILD.bazel                    | 1 -
+ SConscript                     | 2 +-
+ SConstruct                     | 2 +-
+ cmake/Options.cmake            | 6 +-----
+ scripts/generate_android_bp.py | 1 -
+ 6 files changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/Android.bp b/Android.bp
+index 69379472b0..9288bba2d4 100644
+--- a/Android.bp
++++ b/Android.bp
+@@ -157,7 +157,6 @@ arm_compute_library_defaults {
+             "-DEMBEDDED_KERNELS",
+             "-DARM_COMPUTE_ASSERTS_ENABLED",
+             "-DARM_COMPUTE_CPP_SCHEDULER",
+-            "-DENABLE_NEON",
+             "-DARM_COMPUTE_ENABLE_NEON",
+             "-Wno-unused-parameter",
+             "-DNO_DOT_IN_TOOLCHAIN",
+diff --git a/BUILD.bazel b/BUILD.bazel
+index f553b7bfad..2262a09655 100644
+--- a/BUILD.bazel
++++ b/BUILD.bazel
+@@ -170,7 +170,6 @@ config_setting(
+ cc_library(
+     name =3D "common_defines",
+     defines =3D [
+-                  "ENABLE_NEON",
+                   "ARM_COMPUTE_CPU_ENABLED",
+                   "ARM_COMPUTE_ENABLE_NEON",
+                   "ARM_COMPUTE_ENABLE_I8MM",
+diff --git a/SConscript b/SConscript
+index 12e8fd1025..69a564873f 100644
+--- a/SConscript
++++ b/SConscript
+@@ -97,7 +97,7 @@ def build_multiisa_lib_objects():
+=20
+     # note that ARM_COMPUTE_ENABLE_FP16 is enabled in update_data_type_=
layout_flags() to make
+     # sure the environment is progated to the validation suite
+-    arm_compute_env.Append(CPPDEFINES =3D ['ENABLE_NEON', 'ARM_COMPUTE_=
ENABLE_NEON',
++    arm_compute_env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON',
+                            'ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE','ARM_=
COMPUTE_ENABLE_BF16',
+                            'ARM_COMPUTE_ENABLE_I8MM', 'ARM_COMPUTE_ENAB=
LE_SVEF32MM'])
+=20
+diff --git a/SConstruct b/SConstruct
+index 8d7bd291e8..7381300fc8 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -302,7 +302,7 @@ if 'v7a' in env['estate'] and env['estate'] =3D=3D '=
64':
+     print("ERROR: armv7a architecture has only 32-bit execution state")
+     Exit(1)
+=20
+-env.Append(CPPDEFINES =3D ['ENABLE_NEON', 'ARM_COMPUTE_ENABLE_NEON'])
++env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON'])
+=20
+ if 'sve' in env['arch']:
+     env.Append(CPPDEFINES =3D ['ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE'])
+diff --git a/cmake/Options.cmake b/cmake/Options.cmake
+index 5d685be48d..121d527718 100644
+--- a/cmake/Options.cmake
++++ b/cmake/Options.cmake
+@@ -53,7 +53,6 @@ option(ARM_COMPUTE_ENABLE_SVE_VALIDATION "" OFF)
+=20
+ option(ENABLE_NEON "Enable Arm=C2=AE Neon=E2=84=A2 support" ON)
+ option(ARM_COMPUTE_CPU_ENABLED "" ON)
+-option(ARM_COMPUTE_ENABLE_NEON "" ON)
+ option(ARM_COMPUTE_ENABLE_I8MM "" ON)
+ option(ENABLE_FP32_KERNELS "" ON)
+ option(ENABLE_QASYMM8_KERNELS "" ON)
+@@ -70,14 +69,11 @@ option(ENABLE_FP16_KERNELS "" OFF)
+ option(ARM_COMPUTE_ENABLE_FP16 "" OFF)
+=20
+ if(ENABLE_NEON)
+-  add_definitions(-DENABLE_NEON)
++  add_definitions(-DARM_COMPUTE_ENABLE_NEON)
+ endif()
+ if(ARM_COMPUTE_CPU_ENABLED)
+   add_definitions(-DARM_COMPUTE_CPU_ENABLED)
+ endif()
+-if(ARM_COMPUTE_ENABLE_NEON)
+-  add_definitions(-DARM_COMPUTE_ENABLE_NEON)
+-endif()
+ if(ARM_COMPUTE_ENABLE_FP16)
+   add_definitions(-DARM_COMPUTE_ENABLE_FP16)
+ endif()
+diff --git a/scripts/generate_android_bp.py b/scripts/generate_android_b=
p.py
+index d5b268f522..99a04e7071 100755
+--- a/scripts/generate_android_bp.py
++++ b/scripts/generate_android_bp.py
+@@ -94,7 +94,6 @@ arm_compute_library_defaults {
+             "-DEMBEDDED_KERNELS",
+             "-DARM_COMPUTE_ASSERTS_ENABLED",
+             "-DARM_COMPUTE_CPP_SCHEDULER",
+-            "-DENABLE_NEON",
+             "-DARM_COMPUTE_ENABLE_NEON",
+             "-Wno-unused-parameter",
+             "-DNO_DOT_IN_TOOLCHAIN",
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.=
patch b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
new file mode 100644
index 00000000..b51e4534
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
@@ -0,0 +1,197 @@
+From 92a881cebfee5504b188a046a96d39dd9361ddb1 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 5 Dec 2024 08:57:38 -0600
+Subject: [PATCH] Use ARM_COMPUTE_ENABLE_SVE in code for checking SVE sup=
port
+
+ENABLE_SVE is a flag used by the build systems. The flag used in code
+is ARM_COMPUTE_ENABLE_SVE. There are just a couple spots where the
+build system flag is used instead causing the need to define both.
+
+Switch these last users of ENABLE_SVE over to ARM_COMPUTE_ENABLE_SVE
+then drop the ENABLE_SVE definition to prevent any more instances
+being added in the future.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: I00da7580c4520647b62c6989bc7fbdd5efc7935e
+---
+ BUILD.bazel                                   |  3 ---
+ SConscript                                    |  2 +-
+ SConstruct                                    |  2 +-
+ .../batchnormalization/impl/SVE/fp16.cpp      |  2 +-
+ .../batchnormalization/impl/SVE/fp32.cpp      |  2 +-
+ tests/BUILD.bazel                             |  1 -
+ tests/validation/NEON/ActivationLayer.cpp     | 24 +++++++++----------
+ tests/validation/NEON/ArithmeticAddition.cpp  |  6 ++---
+ 8 files changed, 19 insertions(+), 23 deletions(-)
+
+diff --git a/BUILD.bazel b/BUILD.bazel
+index 2262a09655..c04a52e084 100644
+--- a/BUILD.bazel
++++ b/BUILD.bazel
+@@ -297,7 +297,6 @@ cc_library(
+         "//conditions:default": [],
+     }),
+     local_defines =3D [
+-        "ENABLE_SVE",
+         "ARM_COMPUTE_ENABLE_SVE",
+         "ARM_COMPUTE_ENABLE_SVE2",
+         "ARM_COMPUTE_ENABLE_BF16",
+@@ -348,7 +347,6 @@ cc_library(
+         "//conditions:default": [],
+     }),
+     local_defines =3D [
+-        "ENABLE_SVE",
+         "ARM_COMPUTE_ENABLE_SVE",
+         "ARM_COMPUTE_ENABLE_BF16",
+     ],
+@@ -409,7 +407,6 @@ cc_library(
+         "//conditions:default": [],
+     }),
+     local_defines =3D [
+-        "ENABLE_SVE",
+         "ARM_COMPUTE_ENABLE_SVE",
+         "ARM_COMPUTE_ENABLE_BF16",
+     ],
+diff --git a/SConscript b/SConscript
+index 69a564873f..c2ca549b71 100644
+--- a/SConscript
++++ b/SConscript
+@@ -98,7 +98,7 @@ def build_multiisa_lib_objects():
+     # note that ARM_COMPUTE_ENABLE_FP16 is enabled in update_data_type_=
layout_flags() to make
+     # sure the environment is progated to the validation suite
+     arm_compute_env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON',
+-                           'ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE','ARM_=
COMPUTE_ENABLE_BF16',
++                                         'ARM_COMPUTE_ENABLE_SVE','ARM_=
COMPUTE_ENABLE_BF16',
+                            'ARM_COMPUTE_ENABLE_I8MM', 'ARM_COMPUTE_ENAB=
LE_SVEF32MM'])
+=20
+     # Build all the common files for the base architecture
+diff --git a/SConstruct b/SConstruct
+index 7381300fc8..17f5615acf 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -305,7 +305,7 @@ if 'v7a' in env['estate'] and env['estate'] =3D=3D '=
64':
+ env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_NEON'])
+=20
+ if 'sve' in env['arch']:
+-    env.Append(CPPDEFINES =3D ['ENABLE_SVE', 'ARM_COMPUTE_ENABLE_SVE'])
++    env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_SVE'])
+     if 'sve2' in env['arch']:
+         env.Append(CPPDEFINES =3D ['ARM_COMPUTE_ENABLE_SVE2'])
+=20
+diff --git a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp =
b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
+index 48caaa3e63..e07593312c 100644
+--- a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
++++ b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp16.cpp
+@@ -128,4 +128,4 @@ void fp16_sve_batch_normalization(ITensor           =
  *src,
+ }
+ } // namespace cpu
+ } // namespace arm_compute
+-#endif // ENABLE_SVE
++#endif // ARM_COMPUTE_ENABLE_SVE
+diff --git a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp =
b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp
+index df4fbfe607..0d52d2c3c0 100644
+--- a/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp
++++ b/src/core/NEON/kernels/batchnormalization/impl/SVE/fp32.cpp
+@@ -128,4 +128,4 @@ void fp32_sve_batch_normalization(ITensor           =
  *src,
+ }
+ } // namespace cpu
+ } // namespace arm_compute
+-#endif // ENABLE_SVE
++#endif // ARM_COMPUTE_ENABLE_SVE
+diff --git a/tests/BUILD.bazel b/tests/BUILD.bazel
+index 7085f1facc..4b4be8b257 100644
+--- a/tests/BUILD.bazel
++++ b/tests/BUILD.bazel
+@@ -114,7 +114,6 @@ cc_binary(
+               }) +
+         select({
+                 "//:sve_validation_flag": [
+-                "ENABLE_SVE",
+                 "ARM_COMPUTE_ENABLE_SVE",
+                 ],
+                 "//conditions:default": [],
+diff --git a/tests/validation/NEON/ActivationLayer.cpp b/tests/validatio=
n/NEON/ActivationLayer.cpp
+index 119d51808a..69a8b52354 100644
+--- a/tests/validation/NEON/ActivationLayer.cpp
++++ b/tests/validation/NEON/ActivationLayer.cpp
+@@ -73,11 +73,11 @@ RelativeTolerance<float> relative_tolerance(DataType=
 data_type, ActivationLayerI
+             switch(data_type)
+             {
+                 case DataType::F16:
+-#if defined(ENABLE_SVE)
++#if defined(ARM_COMPUTE_ENABLE_SVE)
+                     return RelativeTolerance<float>(0.25f);
+-#else  // !defined(ENABLE_SVE)
++#else  // !defined(ARM_COMPUTE_ENABLE_SVE)
+                     return RelativeTolerance<float>(0.1f);
+-#endif // defined(ENABLE_SVE)
++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
+                 default:
+                     return RelativeTolerance<float>(0.05f);
+             }
+@@ -85,11 +85,11 @@ RelativeTolerance<float> relative_tolerance(DataType=
 data_type, ActivationLayerI
+             switch(data_type)
+             {
+                 case DataType::F16:
+-#if defined(ENABLE_SVE)
++#if defined(ARM_COMPUTE_ENABLE_SVE)
+                     return RelativeTolerance<float>(0.9f);
+-#else  // !defined(ENABLE_SVE)
++#else  // !defined(ARM_COMPUTE_ENABLE_SVE)
+                     return RelativeTolerance<float>(0.01f);
+-#endif // defined(ENABLE_SVE)
++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
+                 default:
+                     return RelativeTolerance<float>(0.00001f);
+             }
+@@ -117,11 +117,11 @@ AbsoluteTolerance<float> absolute_tolerance(DataTy=
pe data_type, ActivationLayerI
+             switch(data_type)
+             {
+                 case DataType::F16:
+-#if defined(ENABLE_SVE)
++#if defined(ARM_COMPUTE_ENABLE_SVE)
+                     return AbsoluteTolerance<float>(0.25f);
+-#else  // !defined(ENABLE_SVE)
++#else  // !defined(ARM_COMPUTE_ENABLE_SVE)
+                     return AbsoluteTolerance<float>(0.01f);
+-#endif // defined(ENABLE_SVE)
++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
+                 default:
+                     return AbsoluteTolerance<float>(0.00001f);
+             }
+@@ -129,11 +129,11 @@ AbsoluteTolerance<float> absolute_tolerance(DataTy=
pe data_type, ActivationLayerI
+             switch(data_type)
+             {
+                 case DataType::F16:
+-#if defined(ENABLE_SVE)
++#if defined(ARM_COMPUTE_ENABLE_SVE)
+                     return AbsoluteTolerance<float>(0.9f);
+-#else  // !defined(ENABLE_SVE)
++#else  // !defined(ARM_COMPUTE_ENABLE_SVE)
+                     return AbsoluteTolerance<float>(0.01f);
+-#endif // defined(ENABLE_SVE)
++#endif // defined(ARM_COMPUTE_ENABLE_SVE)
+                 default:
+                     return AbsoluteTolerance<float>(0.00001f);
+             }
+diff --git a/tests/validation/NEON/ArithmeticAddition.cpp b/tests/valida=
tion/NEON/ArithmeticAddition.cpp
+index c0033daab0..bae8535ff3 100644
+--- a/tests/validation/NEON/ArithmeticAddition.cpp
++++ b/tests/validation/NEON/ArithmeticAddition.cpp
+@@ -48,11 +48,11 @@ namespace validation
+ using framework::dataset::make;
+ namespace
+ {
+-#if !defined(__aarch64__) || defined(ENABLE_SVE)
++#if !defined(__aarch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
+ constexpr AbsoluteTolerance<float> tolerance_quant(1); /**< Tolerance v=
alue for comparing reference's output against implementation's output for=
 quantized data types */
+-#else                                                  // !defined(__aa=
rch64__) || defined(ENABLE_SVE)
++#else                                                  // !defined(__aa=
rch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
+ constexpr AbsoluteTolerance<float> tolerance_quant(1);
+-#endif                                                 // !defined(__aa=
rch64__) || defined(ENABLE_SVE)
++#endif                                                 // !defined(__aa=
rch64__) || defined(ARM_COMPUTE_ENABLE_SVE)
+ const auto InPlaceDataSet    =3D framework::dataset::make("InPlace", { =
false, true });
+ const auto OutOfPlaceDataSet =3D framework::dataset::make("InPlace", { =
false });
+ } // namespace
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0004-Add-source-files-at-library-definition-time.patch b/m=
eta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library=
/0004-Add-source-files-at-library-definition-time.patch
new file mode 100644
index 00000000..971658b4
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0004-Add-source-files-at-library-definition-time.patch
@@ -0,0 +1,167 @@
+From a3c7d6aefc289dcce6656fc6d9f9c8c9b1af8f0b Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 5 Dec 2024 09:38:26 -0600
+Subject: [PATCH] Add source files at library definition time
+
+This allows for easier conditional disabling of these libraries.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: I442aaa03060f2cb7db4ed0c1d93e64dbc223fdc6
+---
+ CMakeLists.txt                  | 20 ++++++++++----------
+ scripts/generate_build_files.py | 16 ++++------------
+ src/CMakeLists.txt              | 16 ++++------------
+ 3 files changed, 18 insertions(+), 34 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e8bdf2af1a..4073e06b17 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,6 +46,12 @@ set(CMAKE_CXX_EXTENSIONS OFF)
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
+ include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Options.cmake)
+ include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Version.cmake)
++include(${CMAKE_CURRENT_SOURCE_DIR}/src/CMakeLists.txt)
++
++list(TRANSFORM ARM_COMPUTE_GRAPH_SOURCES PREPEND "src/")
++list(TRANSFORM ARM_COMPUTE_SVE_SOURCES PREPEND "src/")
++list(TRANSFORM ARM_COMPUTE_SVE2_SOURCES PREPEND "src/")
++list(TRANSFORM ARM_COMPUTE_SOURCES PREPEND "src/")
+=20
+ # Require at least gcc/g++ 11) CMAKE_CXX_COMPILER_VERSION OR
+ if(CMAKE_C_COMPILER_VERSION VERSION_LESS 10.2 OR CMAKE_CXX_COMPILER_VER=
SION
+@@ -139,8 +145,7 @@ endif()
+=20
+ # ---------------------------------------------------------------------
+ # SVE Object Library
+-
+-add_library(arm_compute_sve OBJECT "")
++add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
+ target_compile_options(arm_compute_sve
+                        PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
+                        PRIVATE "-fPIC")
+@@ -162,8 +167,7 @@ target_include_directories(
+=20
+ # ---------------------------------------------------------------------
+ # SVE2 Object Library
+-
+-add_library(arm_compute_sve2 OBJECT "")
++add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
+ target_compile_options(arm_compute_sve2
+                        PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
+                        PRIVATE "-fPIC")
+@@ -187,7 +191,7 @@ target_include_directories(
+ # ---------------------------------------------------------------------
+ # Core Library
+=20
+-add_library(arm_compute "")
++add_library(arm_compute ${ARM_COMPUTE_SOURCES})
+ target_compile_options(arm_compute PRIVATE "-march=3D${ARM_COMPUTE_ARCH=
}")
+ target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_BF16)
+ target_compile_definitions(arm_compute PRIVATE ENABLE_SVE)
+@@ -216,7 +220,7 @@ target_link_libraries(
+ # ---------------------------------------------------------------------
+ # Graph Library
+=20
+-add_library(arm_compute_graph "")
++add_library(arm_compute_graph ${ARM_COMPUTE_GRAPH_SOURCES})
+ target_compile_options(arm_compute_graph PRIVATE "-march=3D${ARM_COMPUT=
E_ARCH}")
+ target_compile_definitions(arm_compute_graph PRIVATE ENABLE_SVE)
+ target_compile_definitions(arm_compute_graph PRIVATE ARM_COMPUTE_ENABLE=
_SVE)
+@@ -238,10 +242,6 @@ target_compile_options(arm_compute_graph PUBLIC ${C=
OMMON_CXX_FLAGS})
+=20
+ add_library(ArmCompute::Graph ALIAS arm_compute_graph)
+=20
+-# ---------------------------------------------------------------------
+-# Library Target Sources
+-add_subdirectory(src)
+-
+ if(ARM_COMPUTE_BUILD_TESTING)
+   # -------------------------------------------------------------------=
--
+   # Validation Framework Library
+diff --git a/scripts/generate_build_files.py b/scripts/generate_build_fi=
les.py
+index 52a8cc14da..4c4a14623f 100644
+--- a/scripts/generate_build_files.py
++++ b/scripts/generate_build_files.py
+@@ -167,27 +167,19 @@ def build_from_template_cmake(srcs_graph, srcs_sve=
, srcs_sve2, srcs_core):
+=20
+     template =3D f"""{get_template_header()}
+=20
+-target_sources(
+-	arm_compute_graph
+-	PRIVATE
++set(ARM_COMPUTE_GRAPH_SOURCES
+ 	{line_separator.join(srcs_graph)}
+ )
+=20
+-target_sources(
+-	arm_compute_sve
+-	PRIVATE
++set(ARM_COMPUTE_SVE_SOURCES
+ 	{line_separator.join(srcs_sve)}
+ )
+=20
+-target_sources(
+-	arm_compute_sve2
+-	PRIVATE
++set(ARM_COMPUTE_SVE2_SOURCES
+ 	{line_separator.join(srcs_sve2)}
+ )
+=20
+-target_sources(
+-	arm_compute
+-	PRIVATE
++set(ARM_COMPUTE_SOURCES
+ 	{line_separator.join(srcs_core)}
+ )
+ """
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index f1b275532a..73871563e1 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -20,9 +20,7 @@
+ # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN THE
+ # SOFTWARE.
+=20
+-target_sources(
+-	arm_compute_graph
+-	PRIVATE
++set(ARM_COMPUTE_GRAPH_SOURCES
+ 	graph/DataLayerVisitor.cpp
+ 	graph/Graph.cpp
+ 	graph/GraphBuilder.cpp
+@@ -100,9 +98,7 @@ target_sources(
+ 	graph/printers/DotGraphPrinter.cpp
+ )
+=20
+-target_sources(
+-	arm_compute_sve
+-	PRIVATE
++set(ARM_COMPUTE_SVE_SOURCES
+ 	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_s8q_3x3_dot.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/interleaves/sve_u8q_3x3_dot.cpp
+ 	core/NEON/kernels/arm_conv/depthwise/kernels/sme2_fp16_nhwc_3x3_s1_out=
put2x2_mla_depthfirst/generic_direct.cpp
+@@ -331,9 +327,7 @@ target_sources(
+ 	cpu/kernels/softmax/generic/sve/impl_bf16.cpp
+ )
+=20
+-target_sources(
+-	arm_compute_sve2
+-	PRIVATE
++set(ARM_COMPUTE_SVE2_SOURCES
+ 	cpu/kernels/activation/generic/sve2/lut.cpp
+ 	cpu/kernels/activation/generic/sve2/qasymm8.cpp
+ 	cpu/kernels/activation/generic/sve2/qasymm8_signed.cpp
+@@ -356,9 +350,7 @@ target_sources(
+ 	cpu/kernels/softmax/generic/sve2/impl.cpp
+ )
+=20
+-target_sources(
+-	arm_compute
+-	PRIVATE
++set(ARM_COMPUTE_SOURCES
+ 	c/AclContext.cpp
+ 	c/AclOperator.cpp
+ 	c/AclQueue.cpp
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch=
 b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-lib=
rary/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
new file mode 100644
index 00000000..29ca02f5
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
@@ -0,0 +1,112 @@
+From cdb765df59d8ce5f388ac2a820b5da76eb8d610c Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 5 Dec 2024 09:47:25 -0600
+Subject: [PATCH] Add CMake options for SVE, SVE2, and BF16 support
+
+These should be optional, add options for these. Remove the hard-coded
+definitions of these for the libraries. This also makes it so validation
+options are not needed, if SVE is enabled it will be validated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: I03182ac6ece843e813c027ef6a573cbba254dee9
+---
+ CMakeLists.txt      | 19 -------------------
+ cmake/Options.cmake | 16 +++++++++++++---
+ 2 files changed, 13 insertions(+), 22 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4073e06b17..4d95fb1bfd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -149,9 +149,6 @@ add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE=
_SOURCES})
+ target_compile_options(arm_compute_sve
+                        PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
+                        PRIVATE "-fPIC")
+-target_compile_definitions(arm_compute_sve PRIVATE ARM_COMPUTE_ENABLE_B=
F16)
+-target_compile_definitions(arm_compute_sve PRIVATE ENABLE_SVE)
+-target_compile_definitions(arm_compute_sve PRIVATE ARM_COMPUTE_ENABLE_S=
VE)
+ target_include_directories(
+   arm_compute_sve
+   PUBLIC $<INSTALL_INTERFACE:include>
+@@ -171,10 +168,6 @@ add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_S=
VE2_SOURCES})
+ target_compile_options(arm_compute_sve2
+                        PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
+                        PRIVATE "-fPIC")
+-target_compile_definitions(arm_compute_sve2 PRIVATE ARM_COMPUTE_ENABLE_=
SVE2)
+-target_compile_definitions(arm_compute_sve2 PRIVATE ARM_COMPUTE_ENABLE_=
BF16)
+-target_compile_definitions(arm_compute_sve2 PRIVATE ENABLE_SVE)
+-target_compile_definitions(arm_compute_sve2 PRIVATE ARM_COMPUTE_ENABLE_=
SVE)
+ target_include_directories(
+   arm_compute_sve2
+   PUBLIC $<INSTALL_INTERFACE:include>
+@@ -193,9 +186,6 @@ target_include_directories(
+=20
+ add_library(arm_compute ${ARM_COMPUTE_SOURCES})
+ target_compile_options(arm_compute PRIVATE "-march=3D${ARM_COMPUTE_ARCH=
}")
+-target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_BF16)
+-target_compile_definitions(arm_compute PRIVATE ENABLE_SVE)
+-target_compile_definitions(arm_compute PRIVATE ARM_COMPUTE_ENABLE_SVE)
+ target_include_directories(
+   arm_compute
+   PUBLIC $<INSTALL_INTERFACE:include>
+@@ -222,8 +212,6 @@ target_link_libraries(
+=20
+ add_library(arm_compute_graph ${ARM_COMPUTE_GRAPH_SOURCES})
+ target_compile_options(arm_compute_graph PRIVATE "-march=3D${ARM_COMPUT=
E_ARCH}")
+-target_compile_definitions(arm_compute_graph PRIVATE ENABLE_SVE)
+-target_compile_definitions(arm_compute_graph PRIVATE ARM_COMPUTE_ENABLE=
_SVE)
+ # add_subdirectory(src/graph)
+=20
+ target_include_directories(
+@@ -268,13 +256,6 @@ if(ARM_COMPUTE_BUILD_TESTING)
+=20
+   add_executable(arm_compute_validation "")
+   target_compile_options(arm_compute_validation PRIVATE "-march=3D${ARM=
_COMPUTE_ARCH}")
+-  if(ARM_COMPUTE_ENABLE_BF16_VALIDATION)
+-    target_compile_definitions(arm_compute_validation PRIVATE ARM_COMPU=
TE_ENABLE_BF16)
+-  endif()
+-  if(ARM_COMPUTE_ENABLE_SVE_VALIDATION)
+-    target_compile_definitions(arm_compute_validation PRIVATE ENABLE_SV=
E)
+-    target_compile_definitions(arm_compute_validation PRIVATE ARM_COMPU=
TE_ENABLE_SVE)
+-  endif()
+   add_subdirectory(tests/validation)
+   target_compile_options(arm_compute_validation PUBLIC ${COMMON_CXX_FLA=
GS})
+   set_target_properties(
+diff --git a/cmake/Options.cmake b/cmake/Options.cmake
+index 121d527718..5c23fcb490 100644
+--- a/cmake/Options.cmake
++++ b/cmake/Options.cmake
+@@ -48,11 +48,12 @@ set(ARM_COMPUTE_ARCH armv8-a CACHE STRING "Architect=
ure to use")
+ # ---------------------------------------------------------------------
+ # Backends
+=20
+-option(ARM_COMPUTE_ENABLE_BF16_VALIDATION "" ON)
+-option(ARM_COMPUTE_ENABLE_SVE_VALIDATION "" OFF)
+-
+ option(ENABLE_NEON "Enable Arm=C2=AE Neon=E2=84=A2 support" ON)
++option(ENABLE_SVE "Enable Arm=C2=AE SVE support" ON)
++option(ENABLE_SVE2 "Enable Arm=C2=AE SVE2 support" ON)
++
+ option(ARM_COMPUTE_CPU_ENABLED "" ON)
++option(ARM_COMPUTE_ENABLE_BF16 "" ON)
+ option(ARM_COMPUTE_ENABLE_I8MM "" ON)
+ option(ENABLE_FP32_KERNELS "" ON)
+ option(ENABLE_QASYMM8_KERNELS "" ON)
+@@ -74,6 +75,15 @@ endif()
+ if(ARM_COMPUTE_CPU_ENABLED)
+   add_definitions(-DARM_COMPUTE_CPU_ENABLED)
+ endif()
++if(ENABLE_SVE)
++  add_definitions(-DARM_COMPUTE_ENABLE_SVE)
++endif()
++if(ENABLE_SVE2)
++  add_definitions(-DARM_COMPUTE_ENABLE_SVE2)
++endif()
++if(ARM_COMPUTE_ENABLE_BF16)
++  add_definitions(-DARM_COMPUTE_ENABLE_BF16)
++endif()
+ if(ARM_COMPUTE_ENABLE_FP16)
+   add_definitions(-DARM_COMPUTE_ENABLE_FP16)
+ endif()
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.pa=
tch b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
new file mode 100644
index 00000000..06370adb
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
@@ -0,0 +1,91 @@
+From ab5bf5b8f86337a31bfd48277650f583a040e658 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 5 Dec 2024 09:59:48 -0600
+Subject: [PATCH] Allow SVE and SVE2 support to be disabled in CMake
+
+Currently these are hard-coded as enabled. The SVE and SVE2 libraries
+are built unconditionally. These should only be built when SVE or
+SVE2 is available.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: I176259f872a84f736028622694d65d4c5b57e379
+---
+ CMakeLists.txt | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4d95fb1bfd..d233d6bc67 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -145,6 +145,7 @@ endif()
+=20
+ # ---------------------------------------------------------------------
+ # SVE Object Library
++if(ENABLE_SVE)
+ add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
+ target_compile_options(arm_compute_sve
+                        PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
+@@ -161,9 +162,11 @@ target_include_directories(
+          src/core/cpu/kernels/assembly
+          src/cpu/kernels/assembly
+          src/core/NEON/kernels/arm_gemm/merges)
++endif() # ENABLE_SVE
+=20
+ # ---------------------------------------------------------------------
+ # SVE2 Object Library
++if(ENABLE_SVE2)
+ add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
+ target_compile_options(arm_compute_sve2
+                        PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
+@@ -180,6 +183,7 @@ target_include_directories(
+          src/core/cpu/kernels/assembly
+          src/cpu/kernels/assembly
+          src/core/NEON/kernels/arm_gemm/merges)
++endif() # ENABLE_SVE2
+=20
+ # ---------------------------------------------------------------------
+ # Core Library
+@@ -203,9 +207,12 @@ target_compile_options(arm_compute PUBLIC ${COMMON_=
CXX_FLAGS})
+ add_library(ArmCompute::Core ALIAS arm_compute)
+=20
+ # arm_compute_sve and arm_compute_sve2 obj files will not be public in =
the arm_compute.so
+-target_link_libraries(
+-  arm_compute PRIVATE $<TARGET_OBJECTS:arm_compute_sve>
+-              PRIVATE $<TARGET_OBJECTS:arm_compute_sve2>)
++if(ENABLE_SVE)
++  target_link_libraries(arm_compute PRIVATE $<TARGET_OBJECTS:arm_comput=
e_sve>)
++endif()
++if(ENABLE_SVE2)
++  target_link_libraries(arm_compute PRIVATE $<TARGET_OBJECTS:arm_comput=
e_sve2>)
++endif()
+=20
+ # ---------------------------------------------------------------------
+ # Graph Library
+@@ -263,8 +270,10 @@ if(ARM_COMPUTE_BUILD_TESTING)
+                                       "${CMAKE_BINARY_DIR}/validation")
+   target_link_libraries(
+     arm_compute_validation
+-    PUBLIC arm_compute arm_compute_graph arm_compute_validation_framewo=
rk
+-           arm_compute_sve)
++    PUBLIC arm_compute arm_compute_graph arm_compute_validation_framewo=
rk)
++    if(ENABLE_SVE)
++      target_link_libraries(arm_compute_validation PUBLIC arm_compute_s=
ve)
++    endif()
+   target_link_directories(arm_compute_validation PUBLIC tests)
+=20
+   # -------------------------------------------------------------------=
--
+@@ -299,8 +308,10 @@ if(ARM_COMPUTE_BUILD_EXAMPLES)
+     set_target_properties(
+       ${test_name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY
+                               "${CMAKE_BINARY_DIR}/examples")
+-    target_link_libraries(${test_name} PUBLIC arm_compute
+-                                              arm_compute_graph arm_com=
pute_sve)
++    target_link_libraries(${test_name} PUBLIC arm_compute arm_compute_g=
raph)
++    if(ENABLE_SVE)
++      target_link_libraries(${test_name} PUBLIC arm_compute_sve)
++    endif()
+   endforeach()
+=20
+   # NEON Examples
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0007-Allow-ARMv7-builds-using-CMake.patch b/meta-arago-ext=
ras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-A=
RMv7-builds-using-CMake.patch
new file mode 100644
index 00000000..07dd4bee
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0007-Allow-ARMv7-builds-using-CMake.patch
@@ -0,0 +1,86 @@
+From 416cffe2a75a4ec66a75e00bc00297f2f0187e0f Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 5 Dec 2024 10:05:03 -0600
+Subject: [PATCH] Allow ARMv7 builds using CMake
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: Ib6bae5820569a8eadd53afdfe31e611a3089140e
+---
+ CMakeLists.txt                                | 25 +++++++++++++++++--
+ .../fixtures/CpuGemmAssemblyDispatchFixture.h |  3 +++
+ 2 files changed, 26 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d233d6bc67..4fc27553f3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -148,7 +148,7 @@ endif()
+ if(ENABLE_SVE)
+ add_library(arm_compute_sve OBJECT ${ARM_COMPUTE_SVE_SOURCES})
+ target_compile_options(arm_compute_sve
+-                       PRIVATE "-march=3Darmv8.2-a+sve+fp16+dotprod"
++                       PRIVATE "-march=3D${ARM_COMPUTE_ARCH}"
+                        PRIVATE "-fPIC")
+ target_include_directories(
+   arm_compute_sve
+@@ -169,7 +169,7 @@ endif() # ENABLE_SVE
+ if(ENABLE_SVE2)
+ add_library(arm_compute_sve2 OBJECT ${ARM_COMPUTE_SVE2_SOURCES})
+ target_compile_options(arm_compute_sve2
+-                       PRIVATE "-march=3Darmv8.6-a+sve2+fp16+dotprod"
++                       PRIVATE "-march=3D${ARM_COMPUTE_ARCH}"
+                        PRIVATE "-fPIC")
+ target_include_directories(
+   arm_compute_sve2
+@@ -204,6 +204,15 @@ target_include_directories(
+           src/core/NEON/kernels/convolution/winograd)
+ target_compile_options(arm_compute PUBLIC ${COMMON_CXX_FLAGS})
+=20
++if(ARM_COMPUTE_ARCH MATCHES "armv7")
++  target_sources(
++    arm_compute
++    PRIVATE
++      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/a53.cpp
++      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/a55r1.cpp
++      src/core/NEON/kernels/arm_gemm/kernels/a32_sgemm_8x6/generic.cpp)
++endif()
++
+ add_library(ArmCompute::Core ALIAS arm_compute)
+=20
+ # arm_compute_sve and arm_compute_sve2 obj files will not be public in =
the arm_compute.so
+@@ -264,6 +273,18 @@ if(ARM_COMPUTE_BUILD_TESTING)
+   add_executable(arm_compute_validation "")
+   target_compile_options(arm_compute_validation PRIVATE "-march=3D${ARM=
_COMPUTE_ARCH}")
+   add_subdirectory(tests/validation)
++  target_include_directories(
++    arm_compute_validation
++    PUBLIC $<INSTALL_INTERFACE:include>
++          $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
++          ${CMAKE_CURRENT_SOURCE_DIR}
++    PRIVATE src
++          src/cpu/kernels/assembly
++          src/core/NEON/kernels/arm_gemm
++          src/core/NEON/kernels/assembly
++          src/core/NEON/kernels/convolution/common
++          src/core/NEON/kernels/arm_conv/depthwise
++          src/core/NEON/kernels/convolution/winograd)
+   target_compile_options(arm_compute_validation PUBLIC ${COMMON_CXX_FLA=
GS})
+   set_target_properties(
+     arm_compute_validation PROPERTIES RUNTIME_OUTPUT_DIRECTORY
+diff --git a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h =
b/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
+index 5d74e210d5..0b45cdf356 100644
+--- a/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
++++ b/tests/validation/fixtures/CpuGemmAssemblyDispatchFixture.h
+@@ -25,7 +25,10 @@
+ #define ACL_TESTS_VALIDATION_FIXTURES_CPUGEMMASSEMBLYDISPATCHFIXTURE_H
+=20
+ #include "arm_compute/core/Helpers.h"
++
++#ifdef ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
+ #include "arm_compute/runtime/NEON/functions/NEReorderLayer.h"
++#endif //ARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS
+ #include "arm_compute/runtime/NEON/functions/NETranspose.h"
+=20
+ #include "src/core/NEON/kernels/arm_gemm/utils.hpp"
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.p=
atch b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute=
-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
new file mode 100644
index 00000000..9883a44d
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
@@ -0,0 +1,46 @@
+From 58698788adaeb2f74cf9fcddf06f3e9a2e78b984 Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Mon, 16 Dec 2024 09:42:22 -0600
+Subject: [PATCH] Fix undefined symbol error when building TensorInfo
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrew Davis <afd@ti.com>
+Change-Id: I657d1b7faaad94147c685c4826916d3c21da82e1
+---
+ arm_compute/core/TensorInfo.h | 5 +----
+ src/core/TensorInfo.cpp       | 5 +++++
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/arm_compute/core/TensorInfo.h b/arm_compute/core/TensorInfo=
.h
+index e4c9cbe879..2bfe83c4b1 100644
+--- a/arm_compute/core/TensorInfo.h
++++ b/arm_compute/core/TensorInfo.h
+@@ -242,10 +242,7 @@ public:
+     {
+         return _num_channels;
+     }
+-    const TensorShape &tensor_shape() const override
+-    {
+-        return _tensor_shape;
+-    }
++    const TensorShape &tensor_shape() const override;
+     const TensorDimsState &tensor_dims_state() const override
+     {
+         return _dims_state;
+diff --git a/src/core/TensorInfo.cpp b/src/core/TensorInfo.cpp
+index 31bddbde40..884203fd7c 100644
+--- a/src/core/TensorInfo.cpp
++++ b/src/core/TensorInfo.cpp
+@@ -395,6 +395,11 @@ ITensorInfo &TensorInfo::set_tensor_dims_state(cons=
t TensorDimsState &state)
+     return *this;
+ }
+=20
++const TensorShape &TensorInfo::tensor_shape() const
++{
++    return _tensor_shape;
++}
++
+ ITensorInfo &TensorInfo::set_quantization_info(const QuantizationInfo &=
quantization_info)
+ {
+     _quantization_info =3D quantization_info;
diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-c=
ompute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-compute-=
library/arm-compute-library_24.12.bb
new file mode 100644
index 00000000..383b02fb
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library_24.12.bb
@@ -0,0 +1,89 @@
+SUMMARY =3D "The ARM Computer Vision and Machine Learning library"
+DESCRIPTION =3D "The ARM Computer Vision and Machine Learning library is=
 a set of functions optimised for both ARM CPUs and GPUs."
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D35f8944fae972976691f=
3483b0ac9dba"
+
+SRC_URI =3D " \
+    git://github.com/ARM-software/ComputeLibrary.git;branch=3Dmain;proto=
col=3Dhttps \
+    file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
+    file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.pat=
ch \
+    file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.pat=
ch \
+    file://0004-Add-source-files-at-library-definition-time.patch \
+    file://0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch \
+    file://0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch=
 \
+    file://0007-Allow-ARMv7-builds-using-CMake.patch \
+    file://0008-Fix-undefined-symbol-error-when-building-TensorInfo.patc=
h \
+"
+SRCREV =3D "32bcced2af7feea6969dd1d22e58d0718dc488e3"
+
+S =3D "${WORKDIR}/git"
+
+# Only compatible with armv7, armv7ve, and aarch64
+COMPATIBLE_MACHINE =3D "(^$)"
+COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
+COMPATIBLE_MACHINE:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","neo=
n","(.*)","(^$)",d)}"
+COMPATIBLE_MACHINE:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","ne=
on","(.*)","(^$)",d)}"
+
+inherit cmake
+
+PACKAGECONFIG ??=3D "examples tests cppthreads openmp"
+
+PACKAGECONFIG[Werror] =3D "-DARM_COMPUTE_WERROR=3DON,-DARM_COMPUTE_WERRO=
R=3DOFF"
+PACKAGECONFIG[examples] =3D "-DARM_COMPUTE_BUILD_EXAMPLES=3DON,-DARM_COM=
PUTE_BUILD_EXAMPLES=3DOFF"
+PACKAGECONFIG[tests] =3D "-DARM_COMPUTE_BUILD_TESTING=3DON,-DARM_COMPUTE=
_BUILD_TESTING=3DOFF"
+PACKAGECONFIG[cppthreads] =3D "-DARM_COMPUTE_CPPTHREADS=3DON,-DARM_COMPU=
TE_CPPTHREADS=3DOFF"
+PACKAGECONFIG[openmp] =3D "-DARM_COMPUTE_OPENMP=3DON,-DARM_COMPUTE_OPENM=
P=3DOFF"
+
+EXTRA_OECMAKE:append:aarch64 =3D " \
+	-DARM_COMPUTE_ARCH=3Darmv8-a \
+	-DENABLE_NEON=3DON \
+	-DENABLE_SVE=3DOFF \
+	-DENABLE_SVE2=3DOFF \
+"
+EXTRA_OECMAKE:append:arm =3D " \
+	-DARM_COMPUTE_ARCH=3Darmv7-a \
+	-DENABLE_NEON=3DON \
+	-DENABLE_SVE=3DOFF \
+	-DENABLE_SVE2=3DOFF \
+	-DARM_COMPUTE_ENABLE_BF16=3DOFF \
+	-DARM_COMPUTE_ENABLE_FIXED_FORMAT_KERNELS=3DOFF \
+"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+
+# package unversioned .so files in PN (they are not dev symlinks)
+FILES_SOLIBSDEV =3D ""
+FILES:${PN} +=3D "${libdir}/*.so"
+
+# Install headers and examples
+do_install:append() {
+	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
+
+	# Install headers
+	install -d ${D}${includedir}
+	cp $CP_ARGS ${S}/arm_compute ${D}${includedir}
+	cp $CP_ARGS ${S}/support ${D}${includedir}
+	cp $CP_ARGS ${S}/include/half ${D}${includedir}
+
+	# Latest ONNX Runtime uses some headers from the ACL source
+	install -d ${D}${includedir}/src
+	(cd ${S}/src; find -type f -name \*.h\* -exec install -D {} ${D}${inclu=
dedir}/src/{} \;)
+
+	# Install examples
+	if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d=
)}; then
+		install -d ${D}${bindir}/${PN}-${PV}/examples
+		for example in ${B}/examples/*; do
+			if [ -d "$example" ]; then
+				continue
+			fi
+			case "$example" in
+				(*.o|*.a|*.cmake) continue;;
+			esac
+			install -m 0555 $example ${D}${bindir}/${PN}-${PV}/examples
+		done
+	fi
+}
+
+PACKAGES =3D+ "${PN}-tests ${PN}-examples"
+FILES:${PN}-tests +=3D "${libdir}/tests"
+FILES:${PN}-examples +=3D "${bindir}/*/examples"
--=20
2.39.2


