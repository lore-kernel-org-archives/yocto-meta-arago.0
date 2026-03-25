Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FD8109C02D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:51:18 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24570.1774450269359222959
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 07:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AMJ2Iqt4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.48, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHGJWMYmcvyvvlMOU+xZwmmBVl8/KJ6TEdEttA43lRaqiMBQTojRRhXqpUN60sZpyc1y7PI3c3K/Wr9ruKHhjP2N9Xd9Cf9TrOuOpPYqP6d4Qs9RSlU/5XoZzVDXKQmyKMgLkupcvkNbqzLfyw9YIMvF8AkbpJlIXGU6O9vT+qU07Twrpa8IIHpTaJeaqP3hvZzYRxJ1u9ouK7MYW5sCEBjqT9SDZkDHGuHotZsC0s52Bm1Co+1p8tClOYeDO2atewNnu0UoKujmLBVxGsoaLfMf+uKKvQuRSHi4WwXycGYALJdPMgyOgmsMkYQHcMrrF8BYu/d8uK7ax3fs/L/ssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdUVcuvcDry6Pzm+Al3LepVGmtU/i8mhjL5I68ZyOlg=;
 b=kLHHQipyQfQPElnysr0HkaLgIOE4chHwshD6zEd+RXQld9MwEuOiCgY3XCgVYUo/ZDQeYtsrlJ0B9zVxDCwp/lKVCBNBI3vHfeC5KIcmUXUQM10GsF/1AmTR/K/+wuHvU8zV6aNekIgJBpZjvb+mKLWdGW7v9s0PnQSSPc0mdaqZtm75xK1Gdgx3luYna+cwuYc2RxwgIZ3MmsAsqf2INwP72l+b7rvTF6Dow0NQyyPonLRqAbrmyJ2yWYoTgsx3ACWNRBnPby3OJB72Dcx4men8hJX6Z8ZiBqse/dpiNjI3htaNDewyagVenlAHgrHrTWhyz8IjbW7cH1g7wQzM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdUVcuvcDry6Pzm+Al3LepVGmtU/i8mhjL5I68ZyOlg=;
 b=AMJ2Iqt4pKIhmVlgZu0WIBb2XcTvdpKTjgJFMdj/jgOhJ2xlxv4RuqIUfoOZYOdejTJPIjHSllp02eCaQ1pvxiDVM1TvNZJlD+jUau4gFMlAGzhzd2kG+ps+5FN1kwgzSiHtDRTQSghGUuUAJCfDkBD3OeRCTr7Hj3OyhKkbw7Y=
Received: from SA0PR12CA0016.namprd12.prod.outlook.com (2603:10b6:806:6f::21)
 by DM3PPF1BD38130F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 14:51:03 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::6c) by SA0PR12CA0016.outlook.office365.com
 (2603:10b6:806:6f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 14:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:51:01 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:50:58 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:50:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 09:50:57 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PEopPS470987;
	Wed, 25 Mar 2026 09:50:55 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH  1/3] tensorflow-lite: Add armv7 support
Date: Wed, 25 Mar 2026 20:20:48 +0530
Message-ID: <20260325145050.1053445-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325145050.1053445-1-p-deshmukh@ti.com>
References: <20260325145050.1053445-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DM3PPF1BD38130F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed608f1-d429-4aa9-3964-08de8a7deec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	HKmupzA9wqI+moRsOVaNhgvCOZwgjoX7lQZTIsqg8rtWGKQ5tgTj52yGG7aAjSeGLamlLLwuGJKwpgZWbX2CcIZ5Hz05zqWmMcR3WpgDBajD14r2WmnhO+47THVr7MfKYwjEeVHOxS7VDBSRAwKveAOjDIeo37iWUQEoYBPLS09pIiKeHDDdqvhbl0iawjXsoEiBg9retKNoMC7k6BDEeCVy16M94VeikvHUhwL+Ln5SCmQGTP9IfrnpedQKIdI3XqhHkyc5s9ABhbXCwT+ynpF4tgJRSQ0kzIzpkvQ3eNiMD6+HoUxOkDgu5aLetj6DjiPYZjt3txgJGanp/x942PmvpEoMaHnxemIkgDiZPoBTAYqo8qpzGx7FRu6PSnaGBLmAmP31Qb2sAOvRj8JlzWfY2VUblDUgcK7K9w+AFk7ZfPTkKEX6to5ffaloqDiZ6ff/98UWNxz1OenNJlPIxKZ1FtvP8vGSkK/9nns7RAWMrB9zwIfPy9IX0VjIOUQJSmTzKob2jypO1GNfeHIzo4AuC6ti5Pl6ntnrY52FLBMJFyJTpeixR/EQrso24hiWSR6DL5EklKqR1TgPsuzO+xO3U+3KSu1PN8KWkHDzIrjOEW//5mJ6eqQLJyg6Lmpo9JjiVY7gmToUECyFI7i016vdaO5os97REiMdebXkC4j5EyIBMsln3CiwJnUYTcX1qUp0hie7pX00kmkzY0szzTBTjKLyAOPLmbY/jHVDRgQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UEgrwVRzQH1S29ZCU+F6fpuWe/1FGoIrPrT4eHDGwQcedx6OOtJrv3DsG+Z/c6yTO8ewxF58sNFwPd0MuhejAY9XUekBn9Lgxh0+g9gDLvVZT2aFbkKsXm9HdC9WCks4NCufspAM9H5TrcP+jc89Rkm5/1+sjKzYTYGv9mzHyOhS/im3ErDz0ynovii6B6gzfkpa3/BrdxFevAPfJnuP08vPLLDiBaUy8TzZB+UIPBL3KvHtyPirffAE7vjYpTQNHKBisEP9IydMfLbpfBR7BeIG2hW6rOfcmmmzgz6ufTqeQiTY4p7BkaWV5JEczXIdwJrBX+G0AGXCG4f13eMbtRd5/4279p9Cagr4b2YLqOsgJkS+gudgJml4tRZAc4BguXV1zWUfzWEaiQ9ZsGi709PsdDWgwA9QUN0m3So3S8se8LWxcDRanvUegIA6zLNN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:51:01.4056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed608f1-d429-4aa9-3964-08de8a7deec8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1BD38130F
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 14:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17436


Added three backport patches to enable TensorFlow Lite on armv7 platforms:

- 0004-Disable-xnnpack-delegate-target-operations-for-armv7.patch
  - Fix xnnpack-delegate CMake configuration failures when XNNPACK is
    disabled for armv7 by guarding target operations with existence checks

- 0005-Add-fp16-data-type-infrastructure-to-TensorFlow-Lite.patch
  - Introduce comprehensive fp16 data type infrastructure, replacing
    Eigen::half dependency with native TFLite implementation for improved
    performance on armv7

- 0006-Add-float16-support-to-EMBEDDING_LOOKUP-kernel.patch
  - Add float16 support to EMBEDDING_LOOKUP kernel with full test coverage
    across various quantization modes

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 ...delegate-target-operations-for-armv7.patch |  38 ++
 ...pe-infrastructure-to-TensorFlow-Lite.patch | 552 ++++++++++++++++++
 ...6-support-to-EMBEDDING_LOOKUP-kernel.patch | 447 ++++++++++++++
 .../tensorflow-lite/tensorflow-lite_2.20.0.bb |   3 +
 4 files changed, 1040 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0004-Disable-xnnpack-delegate-target-operations-for-armv7.patc=
h
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0005-Add-fp16-data-type-infrastructure-to-TensorFlow-Lite.patc=
h
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/ten=
sorflow-lite/0006-Add-float16-support-to-EMBEDDING_LOOKUP-kernel.patch

diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0004-Disable-xnnpack-delegate-target-operations-for-armv7.patch b/met=
a-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0004-Disab=
le-xnnpack-delegate-target-operations-for-armv7.patch
new file mode 100644
index 00000000..428c7849
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
004-Disable-xnnpack-delegate-target-operations-for-armv7.patch
@@ -0,0 +1,38 @@
+From ba13240ebc53a572edd984b8c223e39480bf45ee Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Fri, 20 Mar 2026 11:45:44 +0530
+Subject: [PATCH 4/6] Disable xnnpack-delegate target operations for armv7
+
+The xnnpack-delegate target is not built when XNNPACK is disabled
+for armv7, but CMake still tries to set compile options on it,
+causing configuration failures.
+
+Guard the target operations with target existence checks.
+
+Upstream-Status: Backport from 4f5e199a87e11ef4bb44992a3ccb22ea7e9fe983
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ tensorflow/lite/CMakeLists.txt | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeLists.t=
xt
+index 8c43fdac..4dbd519a 100644
+--- a/tensorflow/lite/CMakeLists.txt
++++ b/tensorflow/lite/CMakeLists.txt
+@@ -854,7 +854,9 @@ target_compile_options(_pywrap_tensorflow_interpreter_=
wrapper
+   PRIVATE ${TFLITE_TARGET_PRIVATE_OPTIONS}
+ )
+=20
+-target_compile_options(xnnpack-delegate
+-  PUBLIC ${TFLITE_TARGET_PUBLIC_OPTIONS}
+-  PRIVATE ${TFLITE_TARGET_PRIVATE_OPTIONS}
++if(TARGET xnnpack-delegate)
++  target_compile_options(xnnpack-delegate
++    PUBLIC ${TFLITE_TARGET_PUBLIC_OPTIONS}
++    PRIVATE ${TFLITE_TARGET_PRIVATE_OPTIONS}
+ )
++endif()
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0005-Add-fp16-data-type-infrastructure-to-TensorFlow-Lite.patch b/met=
a-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0005-Add-f=
p16-data-type-infrastructure-to-TensorFlow-Lite.patch
new file mode 100644
index 00000000..9a8a91d6
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
005-Add-fp16-data-type-infrastructure-to-TensorFlow-Lite.patch
@@ -0,0 +1,552 @@
+From 5f745084227b1caf38a0d12954925fe63c074e9c Mon Sep 17 00:00:00 2001
+From: Arian Arfaian <aarfaian@google.com>
+Date: Tue, 24 Mar 2026 17:52:07 +0530
+Subject: [PATCH 5/6] Add fp16 data type infrastructure to TensorFlow Lite
+
+This commit introduces comprehensive half-precision floating point (fp16)
+data type support to TensorFlow Lite runtime, replacing the previous
+Eigen::half dependency with a native TFLite implementation.This
+infrastructure enables fp16 support throughout the TFLite runtime
+and serves as the foundation for fp16-optimized kernel implementations
+
+Upstream-Status: Backport from 304986569a459c9f8ab3b9d922249e796553e5ea
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ tensorflow/lite/BUILD               |   2 +-
+ tensorflow/lite/interpreter_test.cc |   4 +-
+ tensorflow/lite/types/BUILD         |  31 ++++
+ tensorflow/lite/types/bit_cast.h    |  36 +++++
+ tensorflow/lite/types/fp16.h        | 219 ++++++++++++++++++++++++++++
+ tensorflow/lite/types/half.h        | 169 +++++++++++++++++++++
+ 6 files changed, 458 insertions(+), 3 deletions(-)
+ create mode 100644 tensorflow/lite/types/BUILD
+ create mode 100644 tensorflow/lite/types/bit_cast.h
+ create mode 100644 tensorflow/lite/types/fp16.h
+ create mode 100644 tensorflow/lite/types/half.h
+
+diff --git a/tensorflow/lite/BUILD b/tensorflow/lite/BUILD
+index 2bb98382..dc0f03da 100644
+--- a/tensorflow/lite/BUILD
++++ b/tensorflow/lite/BUILD
+@@ -1041,8 +1041,8 @@ cc_test(
+         "//tensorflow/lite/kernels:kernel_util",
+         "//tensorflow/lite/kernels/internal:compatibility",
+         "//tensorflow/lite/testing:util",
++        "//tensorflow/lite/types:half",
+         "@com_google_googletest//:gtest_main",
+-        "@eigen_archive//:eigen3",
+     ],
+ )
+=20
+diff --git a/tensorflow/lite/interpreter_test.cc b/tensorflow/lite/interpr=
eter_test.cc
+index 19a36f4b..e8074f01 100644
+--- a/tensorflow/lite/interpreter_test.cc
++++ b/tensorflow/lite/interpreter_test.cc
+@@ -29,7 +29,6 @@ limitations under the License.
+=20
+ #include <gmock/gmock.h>
+ #include <gtest/gtest.h>
+-#include "Eigen/Core"  // from @eigen_archive
+ #include "tensorflow/lite/core/c/builtin_op_data.h"
+ #include "tensorflow/lite/core/c/c_api_types.h"
+ #include "tensorflow/lite/core/c/common.h"
+@@ -42,6 +41,7 @@ limitations under the License.
+ #include "tensorflow/lite/kernels/kernel_util.h"
+ #include "tensorflow/lite/string_util.h"
+ #include "tensorflow/lite/testing/util.h"
++#include "tensorflow/lite/types/half.h"
+ #include "tensorflow/lite/util.h"
+=20
+ #ifdef __APPLE__
+@@ -272,7 +272,7 @@ TEST(BasicInterpreter, CheckResize) {
+   const uint8_t uint8s[] =3D {3, 4};
+   const int64_t int64s[] =3D {6, -7};
+   const int16_t int16s[] =3D {8, -9};
+-  const Eigen::half float16s[] =3D {Eigen::half(-3.f), Eigen::half(-4.f)}=
;
++  const half float16s[] =3D {half(-3.f), half(-4.f)};
+=20
+   struct {
+     TfLiteType type;
+diff --git a/tensorflow/lite/types/BUILD b/tensorflow/lite/types/BUILD
+new file mode 100644
+index 00000000..c00aadb6
+--- /dev/null
++++ b/tensorflow/lite/types/BUILD
+@@ -0,0 +1,31 @@
++# Copyright 2025 The TensorFlow Authors. All Rights Reserved.
++#
++# Licensed under the Apache License, Version 2.0 (the "License");
++# you may not use this file except in compliance with the License.
++# You may obtain a copy of the License at
++#
++#     http://www.apache.org/licenses/LICENSE-2.0
++#
++# Unless required by applicable law or agreed to in writing, software
++# distributed under the License is distributed on an "AS IS" BASIS,
++# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied=
.
++# See the License for the specific language governing permissions and
++# limitations under the License.
++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
++
++load("@rules_cc//cc:cc_library.bzl", "cc_library")
++
++package(
++    # copybara:uncomment default_applicable_licenses =3D ["//tensorflow:l=
icense"],
++    default_visibility =3D ["//visibility:public"],
++    licenses =3D ["notice"],
++)
++
++cc_library(
++    name =3D "half",
++    hdrs =3D [
++        "bit_cast.h",
++        "fp16.h",
++        "half.h",
++    ],
++)
+diff --git a/tensorflow/lite/types/bit_cast.h b/tensorflow/lite/types/bit_=
cast.h
+new file mode 100644
+index 00000000..77d97726
+--- /dev/null
++++ b/tensorflow/lite/types/bit_cast.h
+@@ -0,0 +1,36 @@
++/* Copyright 2025 The TensorFlow Authors. All Rights Reserved.
++
++Licensed under the Apache License, Version 2.0 (the "License");
++you may not use this file except in compliance with the License.
++You may obtain a copy of the License at
++
++    http://www.apache.org/licenses/LICENSE-2.0
++
++Unless required by applicable law or agreed to in writing, software
++distributed under the License is distributed on an "AS IS" BASIS,
++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++See the License for the specific language governing permissions and
++limitations under the License.
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D*/
++
++#ifndef TENSORFLOW_LITE_TYPES_BIT_CAST_H_
++#define TENSORFLOW_LITE_TYPES_BIT_CAST_H_
++
++#include <cstring>
++
++namespace tflite {
++
++// Unfortunately, std::bit_cast is C++20, which we can't use. More unfort=
unately
++// it seems impossible to hack together a constexpr bit_cast without comp=
iler
++// support.
++template <typename To, typename From>
++To bit_cast(From x) {
++  static_assert(sizeof(To) =3D=3D sizeof(From), "");
++  To result;
++  memcpy(&result, &x, sizeof(result));
++  return result;
++}
++
++}  // namespace tflite
++
++#endif  // TENSORFLOW_LITE_TYPES_BIT_CAST_H_
+diff --git a/tensorflow/lite/types/fp16.h b/tensorflow/lite/types/fp16.h
+new file mode 100644
+index 00000000..cc63fe7d
+--- /dev/null
++++ b/tensorflow/lite/types/fp16.h
+@@ -0,0 +1,219 @@
++/* Copyright 2025 The TensorFlow Authors. All Rights Reserved.
++
++Licensed under the Apache License, Version 2.0 (the "License");
++you may not use this file except in compliance with the License.
++You may obtain a copy of the License at
++
++    http://www.apache.org/licenses/LICENSE-2.0
++
++Unless required by applicable law or agreed to in writing, software
++distributed under the License is distributed on an "AS IS" BASIS,
++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++See the License for the specific language governing permissions and
++limitations under the License.
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D*/
++
++#ifndef TENSORFLOW_LITE_TYPES_FP16_H_
++#define TENSORFLOW_LITE_TYPES_FP16_H_
++
++#include <stdint.h>
++
++// This file is an excerpt from
++// https://github.com/Maratyszcza/FP16/blob/master/include/fp16/fp16.h,
++// including only the minimal functionality we need in XNNPACK. This work=
s
++// around some issues that we haven't been able to fix upstream
++// (https://github.com/Maratyszcza/FP16/pull/32). See also:
++// - https://github.com/microsoft/onnxruntime/pull/22294/files
++// - https://github.com/google/XNNPACK/issues/6989
++// We also don't need a lot of the functionality in the upstream library.
++
++static inline float fp32_from_bits(uint32_t w) {
++  union {
++    uint32_t as_bits;
++    float as_value;
++  } fp32 =3D {w};
++  return fp32.as_value;
++}
++
++static inline uint32_t fp32_to_bits(float f) {
++  union {
++    float as_value;
++    uint32_t as_bits;
++  } fp32 =3D {f};
++  return fp32.as_bits;
++}
++
++/*
++ * Convert a 16-bit floating-point number in IEEE half-precision format, =
in bit
++ * representation, to a 32-bit floating-point number in IEEE single-preci=
sion
++ * format.
++ *
++ * @note The implementation relies on IEEE-like (no assumption about roun=
ding
++ * mode and no operations on denormals) floating-point operations and bit=
casts
++ * between integer and floating-point variables.
++ */
++static inline float fp16_ieee_to_fp32_value(uint16_t h) {
++  /*
++   * Extend the half-precision floating-point number to 32 bits and shift=
 to the
++   * upper part of the 32-bit word:
++   *      +---+-----+------------+-------------------+
++   *      | S |EEEEE|MM MMMM MMMM|0000 0000 0000 0000|
++   *      +---+-----+------------+-------------------+
++   * Bits  31  26-30    16-25            0-15
++   *
++   * S - sign bit, E - bits of the biased exponent, M - bits of the manti=
ssa, 0
++   * - zero bits.
++   */
++  const uint32_t w =3D (uint32_t)h << 16;
++  /*
++   * Extract the sign of the input number into the high bit of the 32-bit=
 word:
++   *
++   *      +---+----------------------------------+
++   *      | S |0000000 00000000 00000000 00000000|
++   *      +---+----------------------------------+
++   * Bits  31                 0-31
++   */
++  const uint32_t sign =3D w & UINT32_C(0x80000000);
++  /*
++   * Extract mantissa and biased exponent of the input number into the hi=
gh bits
++   * of the 32-bit word:
++   *
++   *      +-----+------------+---------------------+
++   *      |EEEEE|MM MMMM MMMM|0 0000 0000 0000 0000|
++   *      +-----+------------+---------------------+
++   * Bits  27-31    17-26            0-16
++   */
++  const uint32_t two_w =3D w + w;
++
++  /*
++   * Shift mantissa and exponent into bits 23-28 and bits 13-22 so they b=
ecome
++   * mantissa and exponent of a single-precision floating-point number:
++   *
++   *       S|Exponent |          Mantissa
++   *      +-+---+-----+------------+----------------+
++   *      |0|000|EEEEE|MM MMMM MMMM|0 0000 0000 0000|
++   *      +-+---+-----+------------+----------------+
++   * Bits   | 23-31   |           0-22
++   *
++   * Next, there are some adjustments to the exponent:
++   * - The exponent needs to be corrected by the difference in exponent b=
ias
++   * between single-precision and half-precision formats (0x7F - 0xF =3D =
0x70)
++   * - Inf and NaN values in the inputs should become Inf and NaN values =
after
++   * conversion to the single-precision number. Therefore, if the biased
++   * exponent of the half-precision input was 0x1F (max possible value), =
the
++   * biased exponent of the single-precision output must be 0xFF (max pos=
sible
++   * value). We do this correction in two steps:
++   *   - First, we adjust the exponent by (0xFF - 0x1F) =3D 0xE0 (see exp=
_offset
++   * below) rather than by 0x70 suggested by the difference in the expone=
nt bias
++   * (see above).
++   *   - Then we multiply the single-precision result of exponent adjustm=
ent by
++   * 2**(-112) to reverse the effect of exponent adjustment by 0xE0 less =
the
++   * necessary exponent adjustment by 0x70 due to difference in exponent =
bias.
++   *     The floating-point multiplication hardware would ensure than Inf=
 and
++   * NaN would retain their value on at least partially IEEE754-compliant
++   * implementations.
++   *
++   * Note that the above operations do not handle denormal inputs (where =
biased
++   * exponent =3D=3D 0). However, they also do not operate on denormal in=
puts, and
++   * do not produce denormal results.
++   */
++  const uint32_t exp_offset =3D UINT32_C(0xE0) << 23;
++#if defined(__STDC_VERSION__) && (__STDC_VERSION__ >=3D 199901L) || \
++    defined(__GNUC__) && !defined(__STRICT_ANSI__)
++  const float exp_scale =3D 0x1.0p-112f;
++#else
++  const float exp_scale =3D fp32_from_bits(UINT32_C(0x7800000));
++#endif
++  const float normalized_value =3D
++      fp32_from_bits((two_w >> 4) + exp_offset) * exp_scale;
++
++  /*
++   * Convert denormalized half-precision inputs into single-precision res=
ults
++   * (always normalized). Zero inputs are also handled here.
++   *
++   * In a denormalized number the biased exponent is zero, and mantissa h=
as
++   * on-zero bits. First, we shift mantissa into bits 0-9 of the 32-bit w=
ord.
++   *
++   *                  zeros           |  mantissa
++   *      +---------------------------+------------+
++   *      |0000 0000 0000 0000 0000 00|MM MMMM MMMM|
++   *      +---------------------------+------------+
++   * Bits             10-31                0-9
++   *
++   * Now, remember that denormalized half-precision numbers are represent=
ed as:
++   *    FP16 =3D mantissa * 2**(-24).
++   * The trick is to construct a normalized single-precision number with =
the
++   * same mantissa and thehalf-precision input and with an exponent which=
 would
++   * scale the corresponding mantissa bits to 2**(-24). A normalized
++   * single-precision floating-point number is represented as: FP32 =3D (=
1 +
++   * mantissa * 2**(-23)) * 2**(exponent - 127) Therefore, when the biase=
d
++   * exponent is 126, a unit change in the mantissa of the input denormal=
ized
++   * half-precision number causes a change of the constructud single-prec=
ision
++   * number by 2**(-24), i.e. the same ammount.
++   *
++   * The last step is to adjust the bias of the constructed single-precis=
ion
++   * number. When the input half-precision number is zero, the constructe=
d
++   * single-precision number has the value of FP32 =3D 1 * 2**(126 - 127)=
 =3D
++   * 2**(-1) =3D 0.5 Therefore, we need to subtract 0.5 from the construc=
ted
++   * single-precision number to get the numerical equivalent of the input
++   * half-precision number.
++   */
++  const uint32_t magic_mask =3D UINT32_C(126) << 23;
++  const float magic_bias =3D 0.5f;
++  const float denormalized_value =3D
++      fp32_from_bits((two_w >> 17) | magic_mask) - magic_bias;
++
++  /*
++   * - Choose either results of conversion of input as a normalized numbe=
r, or
++   * as a denormalized number, depending on the input exponent. The varia=
ble
++   * two_w contains input exponent in bits 27-31, therefore if its smalle=
r than
++   * 2**27, the input is either a denormal number, or zero.
++   * - Combine the result of conversion of exponent and mantissa with the=
 sign
++   * of the input number.
++   */
++  const uint32_t denormalized_cutoff =3D UINT32_C(1) << 27;
++  const uint32_t result =3D
++      sign | (two_w < denormalized_cutoff ? fp32_to_bits(denormalized_val=
ue)
++                                          : fp32_to_bits(normalized_value=
));
++  return fp32_from_bits(result);
++}
++
++/*
++ * Convert a 32-bit floating-point number in IEEE single-precision format=
 to a
++ * 16-bit floating-point number in IEEE half-precision format, in bit
++ * representation.
++ *
++ * @note The implementation relies on IEEE-like (no assumption about roun=
ding
++ * mode and no operations on denormals) floating-point operations and bit=
casts
++ * between integer and floating-point variables.
++ */
++static inline uint16_t fp16_ieee_from_fp32_value(float f) {
++#if defined(__STDC_VERSION__) && (__STDC_VERSION__ >=3D 199901L) || \
++    defined(__GNUC__) && !defined(__STRICT_ANSI__)
++  const float scale_to_inf =3D 0x1.0p+112f;
++  const float scale_to_zero =3D 0x1.0p-110f;
++#else
++  const float scale_to_inf =3D fp32_from_bits(UINT32_C(0x77800000));
++  const float scale_to_zero =3D fp32_from_bits(UINT32_C(0x08800000));
++#endif
++  const uint32_t w =3D fp32_to_bits(f);
++  const float abs_f =3D fp32_from_bits(w & UINT32_C(0x7FFFFFFF));
++  float base =3D (abs_f * scale_to_inf) * scale_to_zero;
++
++  const uint32_t shl1_w =3D w + w;
++  const uint32_t sign =3D w & UINT32_C(0x80000000);
++  uint32_t bias =3D shl1_w & UINT32_C(0xFF000000);
++  if (bias < UINT32_C(0x71000000)) {
++    bias =3D UINT32_C(0x71000000);
++  }
++
++  base =3D fp32_from_bits((bias >> 1) + UINT32_C(0x07800000)) + base;
++  const uint32_t bits =3D fp32_to_bits(base);
++  const uint32_t exp_bits =3D (bits >> 13) & UINT32_C(0x00007C00);
++  const uint32_t mantissa_bits =3D bits & UINT32_C(0x00000FFF);
++  const uint32_t nonsign =3D exp_bits + mantissa_bits;
++  return (sign >> 16) |
++         (shl1_w > UINT32_C(0xFF000000) ? UINT16_C(0x7E00) : nonsign);
++}
++
++#endif  // TENSORFLOW_LITE_TYPES_FP16_H_
+diff --git a/tensorflow/lite/types/half.h b/tensorflow/lite/types/half.h
+new file mode 100644
+index 00000000..13e8662d
+--- /dev/null
++++ b/tensorflow/lite/types/half.h
+@@ -0,0 +1,169 @@
++/* Copyright 2025 The TensorFlow Authors. All Rights Reserved.
++
++Licensed under the Apache License, Version 2.0 (the "License");
++you may not use this file except in compliance with the License.
++You may obtain a copy of the License at
++
++    http://www.apache.org/licenses/LICENSE-2.0
++
++Unless required by applicable law or agreed to in writing, software
++distributed under the License is distributed on an "AS IS" BASIS,
++WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++See the License for the specific language governing permissions and
++limitations under the License.
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D*/
++
++#ifndef TENSORFLOW_LITE_TYPES_HALF_H_
++#define TENSORFLOW_LITE_TYPES_HALF_H_
++
++#include <cstdint>
++
++// We want to use _Float16 if the compiler supports it fully, but it's
++// tricky to do this detection; there are compiler versions that define t=
he
++// type in broken ways. We're only going to bother using it if the suppor=
t is
++// known to be at least a robust f16<->f32 conversion, which generally me=
ans a
++// recent version of Clang or GCC, x86 or ARM or RISC-V architectures, an=
d
++// (in some cases) the right architecture flags specified on the command =
line.
++
++#ifndef TFLITE_ARCH_FLOAT16
++
++// Some non-GCC compilers define __GNUC__, but we only want to detect the=
 Real
++// Thing
++#if defined(__GNUC__) && !defined(__clang__) && !defined(__INTEL_COMPILER=
) && \
++    !defined(__INTEL_LLVM_COMPILER)
++#define TFLITE_GNUC_ACTUAL __GNUC__
++#else
++#define TFLITE_GNUC_ACTUAL 0
++#endif
++
++#if (defined(__i386__) || defined(__x86_64__)) && defined(__SSE2__) && \
++    defined(__FLT16_MAX__) && defined(__F16C__) &&                     \
++    ((__clang_major__ >=3D 15 && !defined(_MSC_VER)) ||                  =
\
++     (TFLITE_GNUC_ACTUAL >=3D 12))
++#define TFLITE_ARCH_FLOAT16 1
++#endif
++
++#if ((defined(__arm__) || defined(_M_ARM) || defined(__aarch64__) || \
++      defined(_M_ARM64) || defined(_M_ARM64EC)) &&                   \
++     !defined(_MSC_VER)) &&                                          \
++    defined(__ARM_FEATURE_FP16_SCALAR_ARITHMETIC)
++#define TFLITE_ARCH_FLOAT16 1
++#endif
++
++#if defined(__riscv) && defined(__riscv_zvfh) && __clang__ >=3D 1600
++#define TFLITE_ARCH_FLOAT16 1
++#endif
++
++#ifndef TFLITE_ARCH_FLOAT16
++#define TFLITE_ARCH_FLOAT16 0
++#endif
++
++#endif  // TFLITE_ARCH_FLOAT16
++
++#if TFLITE_ARCH_FLOAT16
++
++#include <cmath>
++
++#include "tensorflow/lite/types/bit_cast.h"
++
++namespace tflite {
++
++class half {
++ public:
++  half() =3D default;
++  constexpr half(float x) : value_(static_cast<_Float16>(x)) {}  // NOLIN=
T
++  constexpr half(int x)
++      : value_(static_cast<_Float16>(static_cast<float>(x))) {}  // NOLIN=
T
++
++  constexpr operator float() const { return value_; }  // NOLINT
++
++  static half from_bits(uint16_t bits) {
++    half result;
++    result.value_ =3D bit_cast<_Float16>(bits);
++    return result;
++  }
++
++  uint16_t to_bits() const { return bit_cast<uint16_t>(value_); }
++
++  bool is_zero() const { return value_ =3D=3D 0.0f; }
++
++  // These definitions are imprecise because we want them to be constexpr=
, and
++  // the various tools for doing that are not constepxr (bit_cast,
++  // std::numeric_limits, etc.).
++  static constexpr half epsilon() { return 0.0009765625f; }
++  static constexpr half infinity() { return INFINITY; }
++  static constexpr half min() { return -65504.0f; }
++  static constexpr half max() { return 65504.0f; }
++  static constexpr half smallest_normal() { return 0.00006103515625f; }
++  static constexpr half min_identity() { return INFINITY; }
++  static constexpr half max_identity() { return -INFINITY; }
++  static constexpr half sum_identity() { return 0.0f; }
++
++  // Not private due to -Werror=3Dclass-memaccess, which can't be disable=
d:
++  // - via a --copt, because it seems to have no effect.
++  // - via .bazelrc, because it then applies to C code, and the compiler =
says
++  //   this flag is not valid in C.
++  _Float16 value_;
++};
++
++}  // namespace tflite
++
++#else  // TFLITE_ARCH_FLOAT16
++
++#include "tensorflow/lite/types/fp16.h"
++
++namespace tflite {
++
++class half {
++ private:
++  // We need this hoop jumping to enable implementing a constexpr `from_b=
its`.
++  struct zero_initializer {};
++  explicit constexpr half(zero_initializer) : bits_(0) {}
++
++ public:
++  half() =3D default;
++  half(float x) : bits_(fp16_ieee_from_fp32_value(x)) {}  // NOLINT
++  explicit half(int x)
++      : bits_(fp16_ieee_from_fp32_value(static_cast<float>(x))) {}
++
++  operator float() const { return fp16_ieee_to_fp32_value(bits_); }  // N=
OLINT
++
++  static constexpr half from_bits(uint16_t bits) {
++    half result{zero_initializer{}};
++    result.bits_ =3D bits;
++    return result;
++  }
++
++  constexpr uint16_t to_bits() const { return bits_; }
++
++  bool is_zero() const {
++    // Check for +/- zero (0x0000/0x8000). uint16 overflow is well define=
d to
++    // wrap around.
++    return static_cast<uint16_t>(bits_ * 2) =3D=3D 0;
++  }
++
++  static constexpr half epsilon() {
++    return half::from_bits(0x1400);  // 2^-10 =3D 0.0009765625
++  }
++  static constexpr half infinity() { return from_bits(0x7c00); }
++  static constexpr half min() { return from_bits(0xfbff); }
++  static constexpr half max() { return from_bits(0x7bff); }
++  static constexpr half smallest_normal() {
++    return from_bits(0x0400);  // 2^-14
++  }
++  static constexpr half min_identity() { return from_bits(0x7c00); }
++  static constexpr half max_identity() { return from_bits(0xfc00); }
++  static constexpr half sum_identity() { return from_bits(0); }
++
++  // Not private due to -Werror=3Dclass-memaccess, which can't be disable=
d:
++  // - via a --copt, because it seems to have no effect.
++  // - via .bazelrc, because it then applies to C code, and the compiler =
says
++  //   this flag is not valid in C.
++  uint16_t bits_;
++};
++
++}  // namespace tflite
++
++#endif  // TFLITE_ARCH_FLOAT16
++
++#endif  // TENSORFLOW_LITE_TYPES_HALF_H_
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite/0006-Add-float16-support-to-EMBEDDING_LOOKUP-kernel.patch b/meta-arag=
o-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0006-Add-float16=
-support-to-EMBEDDING_LOOKUP-kernel.patch
new file mode 100644
index 00000000..ac333931
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0=
006-Add-float16-support-to-EMBEDDING_LOOKUP-kernel.patch
@@ -0,0 +1,447 @@
+From 62b578947645562bd902b6a36e1841fb8c136aeb Mon Sep 17 00:00:00 2001
+From: Dillon Sharlet <dsharlet@google.com>
+Date: Tue, 24 Mar 2026 20:41:27 +0530
+Subject: [PATCH 6/6] Add float16 support to EMBEDDING_LOOKUP kernel
+
+This commit adds comprehensive float16 (half precision) support to the
+TensorFlow Lite EMBEDDING_LOOKUP operation, enabling more efficient
+inference on hardware that supports 16-bit floating point operations.
+
+Upstream-Status: Backport from dfc2c904c7ca3ea6749b1604bdda5877855e0582
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ tensorflow/lite/kernels/embedding_lookup.cc   |  92 ++++++----
+ .../lite/kernels/embedding_lookup_test.cc     | 172 ++++++++++++++++--
+ 2 files changed, 210 insertions(+), 54 deletions(-)
+
+diff --git a/tensorflow/lite/kernels/embedding_lookup.cc b/tensorflow/lite=
/kernels/embedding_lookup.cc
+index e5ee8610..a54a3d93 100644
+--- a/tensorflow/lite/kernels/embedding_lookup.cc
++++ b/tensorflow/lite/kernels/embedding_lookup.cc
+@@ -33,11 +33,11 @@ limitations under the License.
+ #include <cstdint>
+ #include <cstring>
+=20
+-#include "fp16/fp16.h"  // from @FP16
+ #include "tensorflow/lite/c/c_api_types.h"
+ #include "tensorflow/lite/core/c/common.h"
+ #include "tensorflow/lite/kernels/internal/tensor_ctypes.h"
+ #include "tensorflow/lite/kernels/kernel_util.h"
++#include "tensorflow/lite/types/half.h"
+=20
+ namespace tflite {
+ namespace ops {
+@@ -75,7 +75,8 @@ TfLiteStatus Prepare(TfLiteContext* context, TfLiteNode*=
 node) {
+       TF_LITE_ENSURE(context, value->type =3D=3D kTfLiteUInt8 ||
+                                   value->type =3D=3D kTfLiteInt8 ||
+                                   value->type =3D=3D kTfLiteInt4);
+-      TF_LITE_ENSURE(context, output->type =3D=3D kTfLiteFloat32);
++      TF_LITE_ENSURE(context, output->type =3D=3D kTfLiteFloat32 ||
++                                  output->type =3D=3D kTfLiteFloat16);
+       // Per-axis quantization must have quantized_dimension =3D=3D 0 and=
 correct
+       // sizes for scale and zero_point.
+       TF_LITE_ENSURE(context, qparams->quantized_dimension =3D=3D 0);
+@@ -128,8 +129,12 @@ TfLiteStatus EvalSimple(TfLiteContext* context, TfLit=
eNode* node,
+   return kTfLiteOk;
+ }
+=20
+-void Unpack4Bit(double scaling_factor, int col_size, const int8_t* value_=
ptr,
+-                float* output_ptr) {
++template <typename T>
++void Unpack4Bit(float scaling_factor, int col_size, const int8_t* value_p=
tr,
++                T* output_ptr) {
++  float scaling_factor0 =3D scaling_factor / 16;
++  int j =3D 0;
++  int i4_idx =3D 0;
+   for (int j =3D 0; j < col_size; j++) {
+     int i8_idx =3D j;
+     int i4_idx =3D i8_idx / 2;
+@@ -163,7 +168,10 @@ TfLiteStatus EvalBlockwise(TfLiteContext* context, Tf=
LiteNode* node,
+     col_size *=3D SizeOfDimension(value, i);
+   }
+=20
+-  float* output_ptr =3D GetTensorData<float>(output);
++  float* output_fp32_ptr =3D
++      output->type =3D=3D kTfLiteFloat32 ? GetTensorData<float>(output) :=
 nullptr;
++  half* output_fp16_ptr =3D
++      output->type =3D=3D kTfLiteFloat16 ? GetTensorData<half>(output) : =
nullptr;
+   const int8_t* value_ptr =3D GetTensorData<int8_t>(value);
+   const int32_t* lookup_data =3D GetTensorData<int32_t>(lookup);
+=20
+@@ -191,14 +199,17 @@ TfLiteStatus EvalBlockwise(TfLiteContext* context, T=
fLiteNode* node,
+       return kTfLiteError;
+     }
+     for (int j =3D 0; j < num_blocks; ++j) {
+-      uint16_t raw_scaling_factor =3D
+-          GetTensorData<uint16_t>(&scale)[j + idx * num_blocks];
+-      uint32_t fp32_scaling_factor =3D fp16_ieee_to_fp32_bits(raw_scaling=
_factor);
+-      double scaling_factor =3D *reinterpret_cast<float*>(&fp32_scaling_f=
actor);
+-
+-      Unpack4Bit(scaling_factor, blocksize,
+-                 &value_ptr[(j * blocksize + idx * col_size) / 2],
+-                 &output_ptr[j * blocksize + i * col_size]);
++      float scaling_factor =3D GetTensorData<half>(&scale)[j + idx * num_=
blocks];
++
++      if (output_fp32_ptr) {
++        Unpack4Bit(scaling_factor, blocksize,
++                   &value_ptr[(j * blocksize + idx * col_size) / 2],
++                   &output_fp32_ptr[j * blocksize + i * col_size]);
++      } else {
++        Unpack4Bit(scaling_factor, blocksize,
++                   &value_ptr[(j * blocksize + idx * col_size) / 2],
++                   &output_fp16_ptr[j * blocksize + i * col_size]);
++      }
+     }
+   }
+   return kTfLiteOk;
+@@ -207,9 +218,6 @@ TfLiteStatus EvalBlockwise(TfLiteContext* context, TfL=
iteNode* node,
+ TfLiteStatus EvalHybrid(TfLiteContext* context, TfLiteNode* node,
+                         const TfLiteTensor* lookup, const TfLiteTensor* v=
alue,
+                         TfLiteTensor* output) {
+-  if (value->quantization.type =3D=3D kTfLiteBlockwiseQuantization) {
+-    return EvalBlockwise(context, node, lookup, value, output);
+-  }
+   const int row_size =3D SizeOfDimension(value, 0);
+=20
+   // col_size after we flatten tensor into 2D.
+@@ -218,7 +226,23 @@ TfLiteStatus EvalHybrid(TfLiteContext* context, TfLit=
eNode* node,
+     col_size *=3D SizeOfDimension(value, i);
+   }
+=20
+-  float* output_ptr =3D GetTensorData<float>(output);
++  auto copy_row =3D [&](float scaling_factor, auto output_ptr, auto value=
_ptr,
++                      int idx, int i) {
++    if (value->type =3D=3D kTfLiteInt4) {
++      Unpack4Bit(scaling_factor, col_size, &value_ptr[idx * col_size / 2]=
,
++                 &output_ptr[i * col_size]);
++    } else {
++      for (int j =3D 0; j < col_size; j++) {
++        output_ptr[j + i * col_size] =3D
++            value_ptr[j + idx * col_size] * scaling_factor;
++      }
++    }
++  };
++
++  float* output_fp32_ptr =3D
++      output->type =3D=3D kTfLiteFloat32 ? GetTensorData<float>(output) :=
 nullptr;
++  half* output_fp16_ptr =3D
++      output->type =3D=3D kTfLiteFloat16 ? GetTensorData<half>(output) : =
nullptr;
+   const int8_t* value_ptr =3D GetTensorData<int8_t>(value);
+   const int32_t* lookup_data =3D GetTensorData<int32_t>(lookup);
+=20
+@@ -234,7 +258,7 @@ TfLiteStatus EvalHybrid(TfLiteContext* context, TfLite=
Node* node,
+       // Dequantize embedding values.
+       // TODO(alanchiao): refactor scalar multiply into separate function
+       // for ease of adding a neon equivalent if ever necessary.
+-      double scaling_factor =3D value->params.scale;
++      float scaling_factor =3D value->params.scale;
+       if (value->quantization.type =3D=3D kTfLiteAffineQuantization) {
+         const auto qparams =3D static_cast<const TfLiteAffineQuantization=
*>(
+             value->quantization.params);
+@@ -244,14 +268,10 @@ TfLiteStatus EvalHybrid(TfLiteContext* context, TfLi=
teNode* node,
+         }
+       }
+=20
+-      if (value->type =3D=3D kTfLiteInt4) {
+-        Unpack4Bit(scaling_factor, col_size, &value_ptr[idx * col_size / =
2],
+-                   &output_ptr[i * col_size]);
++      if (output_fp32_ptr) {
++        copy_row(scaling_factor, output_fp32_ptr, value_ptr, idx, i);
+       } else {
+-        for (int j =3D 0; j < col_size; j++) {
+-          output_ptr[j + i * col_size] =3D
+-              value_ptr[j + idx * col_size] * scaling_factor;
+-        }
++        copy_row(scaling_factor, output_fp16_ptr, value_ptr, idx, i);
+       }
+     }
+   }
+@@ -266,21 +286,13 @@ TfLiteStatus Eval(TfLiteContext* context, TfLiteNode=
* node) {
+   TF_LITE_ENSURE_OK(context, GetInputSafe(context, node, 1, &value));
+   TfLiteTensor* output;
+   TF_LITE_ENSURE_OK(context, GetOutputSafe(context, node, 0, &output));
+-  switch (value->type) {
+-    case kTfLiteFloat32:
+-      return EvalSimple(context, node, lookup, value, output);
+-    case kTfLiteInt4:
+-      return EvalHybrid(context, node, lookup, value, output);
+-    case kTfLiteUInt8:
+-    case kTfLiteInt8:
+-      if (output->type =3D=3D kTfLiteFloat32) {
+-        return EvalHybrid(context, node, lookup, value, output);
+-      } else {
+-        return EvalSimple(context, node, lookup, value, output);
+-      }
+-    default:
+-      TF_LITE_KERNEL_LOG(context, "Type not currently supported.");
+-      return kTfLiteError;
++  if (value->quantization.type =3D=3D kTfLiteBlockwiseQuantization) {
++    return EvalBlockwise(context, node, lookup, value, output);
++  } else if (value->type !=3D output->type && (output->type =3D=3D kTfLit=
eFloat32 ||
++                                             output->type =3D=3D kTfLiteF=
loat16)) {
++    return EvalHybrid(context, node, lookup, value, output);
++  } else {
++    return EvalSimple(context, node, lookup, value, output);
+   }
+ }
+=20
+diff --git a/tensorflow/lite/kernels/embedding_lookup_test.cc b/tensorflow=
/lite/kernels/embedding_lookup_test.cc
+index 14091ab1..8530e629 100644
+--- a/tensorflow/lite/kernels/embedding_lookup_test.cc
++++ b/tensorflow/lite/kernels/embedding_lookup_test.cc
+@@ -27,11 +27,13 @@ License.
+ #include "tensorflow/lite/kernels/internal/tensor_ctypes.h"
+ #include "tensorflow/lite/kernels/test_util.h"
+ #include "tensorflow/lite/schema/schema_generated.h"
++#include "tensorflow/lite/types/half.h"
+=20
+ namespace tflite {
+ namespace {
+=20
+-float kTestTolerance =3D 7.41e-03;
++constexpr float kTestTolerance =3D 7.41e-03;
++constexpr float kFp16TestTolerance =3D 1e-02;
+=20
+ using ::testing::ElementsAreArray;
+=20
+@@ -125,8 +127,10 @@ class HybridEmbeddingLookupOpModel : public BaseEmbed=
dingLookupOpModel {
+  public:
+   HybridEmbeddingLookupOpModel(std::initializer_list<int> index_shape,
+                                std::initializer_list<int> weight_shape,
+-                               TensorType type)
+-      : BaseEmbeddingLookupOpModel(index_shape, weight_shape, type) {}
++                               TensorType weight_type,
++                               TensorType output_type =3D TensorType_FLOA=
T32)
++      : BaseEmbeddingLookupOpModel(index_shape, weight_shape, weight_type=
,
++                                   output_type) {}
+=20
+   void SetWeight(std::initializer_list<float> data) {
+     SymmetricQuantizeAndPopulate(weight_, data);
+@@ -143,9 +147,9 @@ class PerAxisHybridEmbeddingLookupOpModel : public Bas=
eEmbeddingLookupOpModel {
+       std::initializer_list<int> index_shape,
+       std::initializer_list<int> weight_shape,
+       const std::vector<float>& per_channel_quantization_scales,
+-      TensorType type)
+-      : BaseEmbeddingLookupOpModel(index_shape, weight_shape, type,
+-                                   TensorType_FLOAT32,
++      TensorType weights_type, TensorType output_type =3D TensorType_FLOA=
T32)
++      : BaseEmbeddingLookupOpModel(index_shape, weight_shape, weights_typ=
e,
++                                   output_type,
+                                    per_channel_quantization_scales) {}
+=20
+   void SetSignedWeight(std::initializer_list<float> data) {
+@@ -155,12 +159,13 @@ class PerAxisHybridEmbeddingLookupOpModel : public B=
aseEmbeddingLookupOpModel {
+=20
+ class PerBlockHybridEmbeddingLookupOpModel : public BaseEmbeddingLookupOp=
Model {
+  public:
+-  PerBlockHybridEmbeddingLookupOpModel(std::initializer_list<int> index_s=
hape,
+-                                       std::initializer_list<int> weight_=
shape,
+-                                       TensorType type, int blocksize,
+-                                       std::vector<float> scales)
+-      : BaseEmbeddingLookupOpModel(index_shape, weight_shape, type,
+-                                   TensorType_FLOAT32, scales, blocksize)=
 {}
++  PerBlockHybridEmbeddingLookupOpModel(
++      std::initializer_list<int> index_shape,
++      std::initializer_list<int> weight_shape, TensorType weights_type,
++      int blocksize, std::vector<float> scales,
++      TensorType output_type =3D TensorType_FLOAT32)
++      : BaseEmbeddingLookupOpModel(index_shape, weight_shape, weights_typ=
e,
++                                   output_type, scales, blocksize) {}
+   void SetSignedWeight(std::initializer_list<float> data) {
+     PerBlockSymmetricQuantizeAndPopulate(weight_, data);
+   }
+@@ -168,8 +173,9 @@ class PerBlockHybridEmbeddingLookupOpModel : public Ba=
seEmbeddingLookupOpModel {
+=20
+ // TODO(ahentz): write more tests that exercise the details of the op, su=
ch as
+ // lookup errors and variable input shapes.
+-TEST(EmbeddingLookupOpTest, SimpleTest) {
+-  EmbeddingLookupOpModel m({3}, {3, 2, 4});
++TEST(EmbeddingLookupOpTest, Float32) {
++  EmbeddingLookupOpModel m({3}, {3, 2, 4}, TensorType_FLOAT32,
++                           TensorType_FLOAT32);
+   m.SetInput({1, 0, 2});
+   m.Set3DWeightMatrix<float>(
+       [](int i, int j, int k) -> float { return i + j / 10.0f + k / 100.0=
f; });
+@@ -184,6 +190,25 @@ TEST(EmbeddingLookupOpTest, SimpleTest) {
+               })));
+ }
+=20
++TEST(EmbeddingLookupOpTest, Float16) {
++  EmbeddingLookupOpModel m({3}, {3, 2, 4}, TensorType_FLOAT16,
++                           TensorType_FLOAT16);
++  m.SetInput({1, 0, 2});
++  m.Set3DWeightMatrix<half>(
++      [](int i, int j, int k) -> half { return i + j / 10.0f + k / 100.0f=
; });
++
++  ASSERT_EQ(m.Invoke(), kTfLiteOk);
++
++  EXPECT_THAT(m.GetOutput<half>(),
++              ElementsAreArray(ArrayFloatNear(
++                  {
++                      1.00, 1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  //=
 Row 1
++                      0.00, 0.01, 0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  //=
 Row 0
++                      2.00, 2.01, 2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  //=
 Row 2
++                  },
++                  kTestTolerance)));
++}
++
+ #if !defined(MEMORY_SANITIZER) && !defined(GOOGLE_UNSUPPORTED_OS_LOONIX) =
&& \
+     defined(__LP64__)
+ TEST(EmbeddingLookupOpTest, LargeTableTest) {
+@@ -269,6 +294,28 @@ TEST(HybridEmbeddingLookupHybridOpTest, Simple4DTestU=
int8) {
+                   kTestTolerance)));
+ }
+=20
++TEST(HybridEmbeddingLookupHybridOpTest, Simple4DTestUint8Float16) {
++  HybridEmbeddingLookupOpModel m({3}, {3, 2, 2, 2}, TensorType_UINT8,
++                                 TensorType_FLOAT16);
++  m.SetInput({1, 0, 2});
++  m.SetWeight({
++      0.00, 0.01, 0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  // Row 0
++      1.00, 1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  // Row 1
++      2.00, 2.01, 2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  // Row 2
++  });
++
++  ASSERT_EQ(m.Invoke(), kTfLiteOk);
++
++  EXPECT_THAT(m.GetOutput<half>(),
++              ElementsAreArray(ArrayFloatNear(
++                  {
++                      1.00, 1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  //=
 Row 1
++                      0.00, 0.01, 0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  //=
 Row 0
++                      2.00, 2.01, 2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  //=
 Row 2
++                  },
++                  kFp16TestTolerance)));
++}
++
+ TEST(HybridEmbeddingLookupHybridOpTest, Simple2DTestInt8) {
+   HybridEmbeddingLookupOpModel m({3}, {3, 8}, TensorType_INT8);
+   m.SetInput({1, 0, 2});
+@@ -332,6 +379,28 @@ TEST(HybridEmbeddingLookupHybridOpTest, Simple4DTestI=
nt8) {
+                   kTestTolerance)));
+ }
+=20
++TEST(HybridEmbeddingLookupHybridOpTest, Simple4DTestInt8Float16) {
++  HybridEmbeddingLookupOpModel m({3}, {3, 2, 2, 2}, TensorType_INT8,
++                                 TensorType_FLOAT16);
++  m.SetInput({1, 0, 2});
++  m.SetSignedWeight({
++      0.00, 0.01,  0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  // Row 0
++      1.00, -1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  // Row 1
++      2.00, 2.01,  2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  // Row 2
++  });
++
++  ASSERT_EQ(m.Invoke(), kTfLiteOk);
++
++  EXPECT_THAT(m.GetOutput<half>(),
++              ElementsAreArray(ArrayFloatNear(
++                  {
++                      1.00, -1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  /=
/ Row 1
++                      0.00, 0.01,  0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  /=
/ Row 0
++                      2.00, 2.01,  2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  /=
/ Row 2
++                  },
++                  kFp16TestTolerance)));
++}
++
+ TEST(EmbeddingLookupHybridOpTest, Simple3DTestQuantized) {
+   EmbeddingLookupOpModel m({3}, {3, 2, 4}, TensorType_UINT8, TensorType_I=
NT8);
+   m.SetInput({1, 0, 2});
+@@ -414,6 +483,29 @@ TEST(PerAxisHybridEmbeddingLookupHybridOpTest, PerAxi=
sSimple4DTestInt8) {
+                   kTestTolerance)));
+ }
+=20
++TEST(PerAxisHybridEmbeddingLookupHybridOpTest, PerAxisSimple4DTestInt8Flo=
at16) {
++  PerAxisHybridEmbeddingLookupOpModel m({3}, {3, 2, 2, 2},
++                                        {0.00102, 0.0089, 0.016772},
++                                        TensorType_INT8, TensorType_FLOAT=
16);
++  m.SetInput({1, 0, 2});
++  m.SetSignedWeight({
++      0.00, 0.01,  0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  // Row 0
++      1.00, -1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  // Row 1
++      2.00, 2.01,  2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  // Row 2
++  });
++
++  ASSERT_EQ(m.Invoke(), kTfLiteOk);
++
++  EXPECT_THAT(m.GetOutput<half>(),
++              ElementsAreArray(ArrayFloatNear(
++                  {
++                      1.00, -1.01, 1.02, 1.03, 1.10, 1.11, 1.12, 1.13,  /=
/ Row 1
++                      0.00, 0.01,  0.02, 0.03, 0.10, 0.11, 0.12, 0.13,  /=
/ Row 0
++                      2.00, 2.01,  2.02, 2.03, 2.10, 2.11, 2.12, 2.13,  /=
/ Row 2
++                  },
++                  kFp16TestTolerance)));
++}
++
+ TEST(PerBlockHybridEmbeddingLookupHybridOpTest, PerBlockSimple2DTestInt4)=
 {
+   PerBlockHybridEmbeddingLookupOpModel m(
+       /*index_shape=3D*/{3},
+@@ -441,6 +533,35 @@ TEST(PerBlockHybridEmbeddingLookupHybridOpTest, PerBl=
ockSimple2DTestInt4) {
+           kTestTolerance)));
+ }
+=20
++TEST(PerBlockHybridEmbeddingLookupHybridOpTest,
++     PerBlockSimple2DTestInt4Float16) {
++  PerBlockHybridEmbeddingLookupOpModel m(
++      /*index_shape=3D*/{3},
++      /*weight_shape=3D*/{3, 8},
++      /*weights_type=3D*/TensorType_INT4,
++      /*blocksize=3D*/4,
++      /*scales=3D*/{0.001, 0.001, 0.02, 0.02, 0.3, 0.3},
++      /*output_type=3D*/TensorType_FLOAT16);
++  m.SetInput({1, 0, 2});
++  m.SetSignedWeight({
++      0.00, 0.007, 0.006, 0.005, 0.004, 0.003, 0.002, 0.001,  // Row 0
++      0.02, -0.02, 0.04,  0.06,  0.08,  -0.04, -0.08, -0.06,  // Row 1
++      0.3,  0.6,   0.9,   1.2,   1.5,   -0.3,  -0.6,  -0.9,   // Row 2
++  });
++
++  ASSERT_EQ(m.Invoke(), kTfLiteOk);
++
++  EXPECT_THAT(
++      m.GetOutput<half>(),
++      ElementsAreArray(ArrayFloatNear(
++          {
++              0.02, -0.02, 0.04,  0.06,  0.08,  -0.04, -0.08, -0.06,  // =
Row 1
++              0.00, 0.007, 0.006, 0.005, 0.004, 0.003, 0.002, 0.001,  // =
Row 0
++              0.3,  0.6,   0.9,   1.2,   1.5,   -0.3,  -0.6,  -0.9,   // =
Row 2
++          },
++          kFp16TestTolerance)));
++}
++
+ TEST(PerAxisHybridEmbeddingLookupHybridOpTest, PerAxisSimple2DTestInt4) {
+   PerAxisHybridEmbeddingLookupOpModel m(
+       /*index_shape=3D*/{3}, /*weight_shape=3D*/{3, 8},
+@@ -512,5 +633,28 @@ TEST(PerAxisHybridEmbeddingLookupHybridOpTest, PerAxi=
sSimple4DTestInt4) {
+           kTestTolerance)));
+ }
+=20
++TEST(PerAxisHybridEmbeddingLookupHybridOpTest, PerAxisSimple4DTestInt4Flo=
at16) {
++  PerAxisHybridEmbeddingLookupOpModel m({3}, {3, 2, 2, 2}, {0.001, 0.02, =
0.3},
++                                        TensorType_INT4, TensorType_FLOAT=
16);
++  m.SetInput({1, 0, 2});
++  m.SetSignedWeight({
++      0.00, 0.007, 0.006, 0.005, 0.004, 0.003, 0.002, 0.001,  // Row 0
++      0.02, -0.02, 0.04,  0.06,  0.08,  -0.04, -0.08, -0.06,  // Row 1
++      0.3,  0.6,   0.9,   1.2,   1.5,   -0.3,  -0.6,  -0.9,   // Row 2
++  });
++
++  ASSERT_EQ(m.Invoke(), kTfLiteOk);
++
++  EXPECT_THAT(
++      m.GetOutput<half>(),
++      ElementsAreArray(ArrayFloatNear(
++          {
++              0.02, -0.02, 0.04,  0.06,  0.08,  -0.04, -0.08, -0.06,  // =
Row 1
++              0.00, 0.007, 0.006, 0.005, 0.004, 0.003, 0.002, 0.001,  // =
Row 0
++              0.3,  0.6,   0.9,   1.2,   1.5,   -0.3,  -0.6,  -0.9,   // =
Row 2
++          },
++          kFp16TestTolerance)));
++}
++
+ }  // namespace
+ }  // namespace tflite
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow=
-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tenso=
rflow-lite_2.20.0.bb
index ee445e75..559ec5ef 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2=
.20.0.bb
@@ -17,6 +17,9 @@ SRC_URI =3D " \
     file://0001-Update-CMakeLists-for-building.patch \
     file://0002-Update-CMakeLists-for-building-shared-object.patch \
     file://0003-Fix-GStreamer-TensorFlow-Lite-pipeline-failures-due-.patch=
 \
+    file://0004-Disable-xnnpack-delegate-target-operations-for-armv7.patch=
 \
+    file://0005-Add-fp16-data-type-infrastructure-to-TensorFlow-Lite.patch=
 \
+    file://0006-Add-float16-support-to-EMBEDDING_LOOKUP-kernel.patch \
     file://tensorflow2-lite.pc.in \
 "
=20
--=20
2.34.1


