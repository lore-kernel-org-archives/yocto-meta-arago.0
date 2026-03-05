Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828FBF3D318
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:48:40 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47366.1772725710881069049
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DADqFqcy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.5, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6eqjDbYH/fU7eTMsDb/hSVdJNY7WfdY3k8eyHhJiRRViQ/4pueHRjR6+RyTjVWXt7ltKEoBKCjQZfN/VYmDr8sCITKrXy+1AYgGUTZVBvsb0eAhboFY/iBWMn1+Mo1Y1wgFEA2gFhiTZrtev+0ixAqhooIhWx3kxCBlth3cA/Uoece1D8cUBHc2qVpOu5lNhm6sLG4CSMyHY7FsZJl9SuSeRfmg9wkU/ftyT/uPtQDaATHSIUbxe72pwpVgDTvC631mjour5NLlSS+zUQYSinMIcyNMRGOmaMDI22M45XMmbgiQHYDTQqf71KV8KGF5IKeiThhrSoGVy6GYts7yKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNM/vHg7o12rclg/KZj/R6Sw58Mfx0Y0pEx29GQj03w=;
 b=BRS92aQsUPJp/ArhAHSaQKKW5tng3GfmEVz8BTtTXbbzx9szjyFkhmZXr0GTHPWBMGs8ViE6Wp7ZyXN3aKRc789YNwZF2lJha1/L/ZYlQytf/0ZdHzHdeSXJOV8vFu9fNAqMplDogFKbXTS9Fe7RaQZUEfnqJkewDkHTmVk3dillqQZeIfgAcQpThXobkmGARStAWGYHXvEBbWz4Etr8sqqmk+graspxWrm0bESd5Ydy0y/WlYinmBO3rigMHNqkwtkZ1+m6ggTtMcyKdG8DNvRHcNCUMqZ1y2053ZK+8rfSXKFE+ouPgmw21zRY39/EtcSroi9jRVOHbFQATdW4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNM/vHg7o12rclg/KZj/R6Sw58Mfx0Y0pEx29GQj03w=;
 b=DADqFqcy7Pu1LMoqkKPnT/Ilh+fEmCUpTRl1BkWFPxtX+fq6quieBjriX/sYXTRGW4E3XQgK3hsp2LTVIcsJeji2zkhnm4zbtnRLPzLbnQ7R+7TfdREhzIRdth1lAD6ZgchuighINk5Nr4jaohGDMXPD3Ho7xb7ym+7Y1vl2iww=
Received: from BN9PR03CA0364.namprd03.prod.outlook.com (2603:10b6:408:f7::9)
 by CO1PR10MB4548.namprd10.prod.outlook.com (2603:10b6:303:97::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:48:28 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:f7:cafe::d5) by BN9PR03CA0364.outlook.office365.com
 (2603:10b6:408:f7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 15:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:48:27 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:48:27 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:48:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:48:27 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625FmL6l2600702;
	Thu, 5 Mar 2026 09:48:25 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v4 1/2] onnx: upgrade 1.16.1 -> 1.18.0
Date: Thu, 5 Mar 2026 21:18:19 +0530
Message-ID: <20260305154820.1461983-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305154820.1461983-1-p-deshmukh@ti.com>
References: <20260305154820.1461983-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CO1PR10MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e61fb02-17ab-4a61-0094-08de7acea4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	DNlkmfQYTCUGUDDmsoZjxt/Dt5cULGgwb/JtugnYtZ6JnsEetHdNZAxXTOY4E9S4pNpXvmiUP9B2pbnE611MNZSfIUU+XpLXwXiShRm5PwUYouUgHn2ePnQPyu2c5tjyt85o/sNSUnuVGkQGM3BUHLEbBJ16muPz7D7X9KGx0eh8tK7w0lgihUyBzfVyjTFKNHPxigNiwfRVG6XoAbAZcpi/ageyqqzWUGZi1m6dimdp/bkucr1wg/yvxBZLaSFiNF/UwCknauP7cQrcpt0u2WcKAxLaVPSILoye/zVAUkPYlzYFMTq+V/UQpJVX1mGizIvsE1Sro8RAK1jt4WMA8XSwN9AU9K8CzbfFikr0NIWCek/1Nuf+mHK+W1iJ7EizFgE1UV+PXrT7U7n4yX21imc3N1uhw2uTjhjVUDRIxelwrY0VuaJVrJsL+FMMInnTRBA5jju3vTmZE9bUOtYKS4MfoUlgIJekCK2QGE54XgNezXzmFz5sYQgVF0O27uRa1GWc8X6YWvP21TIWKjsDVRtNzmBxPydrtlcJBEw1db3gBseBowoyAffZAPN8Bq3f90s+GAv0jeZAcZ60mmizb0zFG4uVkXn+191A7UtDpZVDxp2ndLb6TcQBWSGmTAD3f6UqdwvsuvL/hR/U51Mw65RsocN/eiY2IkTm6j9iC49J2oP9uSiHM7lIpXxWcYHdkCJlfc42i4qSXVw5lzSnWe3w5GQL2qrhSm+ZLIens/0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	trDZ8OEtdtmk5KKw3RseTZFdKdcItrfaBWx8U79p9FNS6iYtkTAWASFsV/hfJS1bKWaUPrH9Ca1xsVq2+wNspwGNr8lYDHfXXHuGLhYk8pvDgW2zqOC0CNrlRC2+NQyB5q9spzWKrGpTlOhNDrxEBzFcxPkuZbpYRFJIQp5eD7P2Uq/DpCIauYmgRWiug8BmmOqkNXrnHEWgaTnWauTB8TGfEPezm63880tBnK38GJ5CtGm6vSsxy9hCi8nl2kVk2DC+/8i8kL93YOudYsxLCClItuHTPg/oz31s7lgF6WQqKXpSIG1QNKVoH0FUeiTPDKAjzQHOyEDo3jf2F9wLVOz8Y30Zn731CYtlYScST7N4jJM/eWSirhLARnPnRV+WFOhTXOjah/wOeCG3R9pxtoyE64RzgHqp0D+Dsp0vMfCl5YSbr8kTIUYNOh9u6qhq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:48:27.9224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e61fb02-17ab-4a61-0094-08de7acea4d8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4548
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:48:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17239

We are migrating ONNX from v1.16.1 to the
stable release v1.18.0.

Removed Patches:
 =E2=80=A2 0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch
   - Updated with new commit
 =E2=80=A2 0002-Do-not-re-export-internal-targets-directories.patch
   - Updated with new commit

Added Patches (New Requirements):
 =E2=80=A2 0001-Apply-onnx-patch.patch
   - Applies onnx.patch compatibility patch for separate builds
 =E2=80=A2 0002-cmake-Fix-Protobuf-target-check-by-calling-find_pack.patch
   - Ensures proper Protobuf target detection before usage
 =E2=80=A2 0003-cmake-Remove-Protobuf-directory-exports-from-config-.patch
   - Prevents CMake configuration conflicts in dependent packages
 =E2=80=A2 0004-Linker-failed-when-trying-to-create-the-final-onnx_g.patch
   - Fixes linker errors during test executable creation
 =E2=80=A2 0005-Fix-symbol-visibility-when-tests-are-enabled.patch
   - Resolves symbol visibility issues causing runtime failures.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change logs:

v3 -> v4:
 - No Changes

v2 -> v3:
 - Fixed recipe file patch filename references (REPO-1 fix)

v1 -> v2:
 - No changes

 .../onnx/onnx/0001-Apply-onnx-patch.patch     | 197 ++++++++++++++++++
 ...f-target-check-by-calling-find_pack.patch} |  29 ++-
 ...obuf-directory-exports-from-config-.patch} |  29 ++-
 ...en-trying-to-create-the-final-onnx_g.patch |  34 +++
 ...ol-visibility-when-tests-are-enabled.patch |  36 ++++
 .../onnx/{onnx_1.16.1.bb =3D> onnx_1.18.0.bb}   |  11 +-
 6 files changed, 313 insertions(+), 23 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Appl=
y-onnx-patch.patch
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0001-Try-to-find-pac=
kage-Protobuf-before-checking-if-it-w.patch =3D> 0002-cmake-Fix-Protobuf-ta=
rget-check-by-calling-find_pack.patch} (40%)
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0002-Do-not-re-expor=
t-internal-targets-directories.patch =3D> 0003-cmake-Remove-Protobuf-direct=
ory-exports-from-config-.patch} (41%)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0004-Link=
er-failed-when-trying-to-create-the-final-onnx_g.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0005-Fix-=
symbol-visibility-when-tests-are-enabled.patch
 rename meta-arago-extras/recipes-framework/onnx/{onnx_1.16.1.bb =3D> onnx_=
1.18.0.bb} (87%)

diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Apply-onnx-=
patch.patch b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Apply-onnx=
-patch.patch
new file mode 100644
index 00000000..305736e7
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0001-Apply-onnx-patch.p=
atch
@@ -0,0 +1,197 @@
+From 93894db295857ca77cf385a5d39c565ee3e0c2fd Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 17:22:13 +0530
+Subject: [PATCH 1/5] Apply onnx patch
+
+ONNXRuntime's CMake uses FetchContent to download ONNX as a dependency.
+Our onnxruntime recipe uses FETCHCONTENT_FULLY_DISCONNECTED=3DON so instea=
d
+of letting ONNXRuntime fetch ONNX, we build ONNX separately using the
+onnx_1.18.0.bb recipe.The onnxruntime recipe then references the pre-built
+ONNX from the sysroot. Since ONNX was built separately without the patch,
+the fixes that ONNXRuntime expects are missing
+
+We need to apply the patch [0] separately to avoid errors.
+
+[0] https://github.com/microsoft/onnxruntime/blob/rel-1.23.2/cmake/patches=
/onnx/onnx.patch
+
+Upstream-Status: Inappropriate [oe specific integration patch]
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt        | 52 +++++++++++++++++++------------------------
+ onnx/defs/nn/defs.cc  |  6 ++---
+ onnx/defs/nn/old.cc   |  1 -
+ onnx/defs/rnn/defs.cc |  2 +-
+ onnx/defs/schema.h    |  6 ++---
+ 5 files changed, 30 insertions(+), 37 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8b5af3038..8593fe4a3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -40,6 +40,7 @@ option(ONNX_USE_LITE_PROTO "Use lite protobuf instead of=
 full." OFF)
+ option(ONNX_DISABLE_EXCEPTIONS "Disable exception handling." OFF)
+ option(ONNX_DISABLE_STATIC_REGISTRATION "Disable static registration for =
ONNX operator schemas." OFF)
+ option(ONNX_USE_UNITY_BUILD "Enable Unity (Jumbo) build for" OFF)
++option(ONNX_MINIMAL_BUILD "Build only essential ONNX components" OFF)
+ if(WIN32)
+   option(ONNX_USE_MSVC_STATIC_RUNTIME "Build with MSVC static runtime" OF=
F)
+ endif()
+@@ -461,14 +462,28 @@ relative_protobuf_generate_cpp(gen_onnx_data_proto
+ list(APPEND ONNX_PROTO_SRCS ${__tmp_srcs})
+ list(APPEND ONNX_PROTO_HDRS ${__tmp_hdrs})
+=20
+-file(GLOB_RECURSE __tmp_srcs "${ONNX_ROOT}/onnx/*.h" "${ONNX_ROOT}/onnx/*=
.cc")
+-file(GLOB_RECURSE onnx_gtests_src "${ONNX_ROOT}/onnx/test/cpp/*.h"
+-    "${ONNX_ROOT}/onnx/test/cpp/*.cc"
+-    "${ONNX_ROOT}/onnx/backend/test/cpp/*.cc"
+-    "${ONNX_ROOT}/onnx/backend/test/cpp/*.h")
+-list(REMOVE_ITEM __tmp_srcs "${ONNX_ROOT}/onnx/cpp2py_export.cc")
+-list(REMOVE_ITEM __tmp_srcs ${onnx_gtests_src})
+-list(APPEND ONNX_SRCS ${__tmp_srcs})
++if(ONNX_MINIMAL_BUILD)
++    message(STATUS "Configuring ONNX minimal build")
++    set(ONNX_SRCS
++      "${ONNX_ROOT}/onnx/common/common.h"
++      "${ONNX_ROOT}/onnx/defs/data_type_utils.h"
++      "${ONNX_ROOT}/onnx/defs/data_type_utils.cc"
++    )
++    # Ensure ONNX_ML is treated as ON for minimal build consistency with =
ORT's file
++    set(ONNX_ML ON CACHE BOOL "Enable traditional ML API." FORCE)
++    # Minimal build doesn't need Python or tests
++    set(ONNX_BUILD_PYTHON OFF CACHE BOOL "Build Python binaries" FORCE)
++    set(ONNX_BUILD_TESTS OFF CACHE BOOL "Build ONNX C++ APIs Tests" FORCE=
)
++else()
++    file(GLOB_RECURSE __tmp_srcs "${ONNX_ROOT}/onnx/*.h" "${ONNX_ROOT}/on=
nx/*.cc")
++    file(GLOB_RECURSE onnx_gtests_src "${ONNX_ROOT}/onnx/test/cpp/*.h"
++        "${ONNX_ROOT}/onnx/test/cpp/*.cc"
++        "${ONNX_ROOT}/onnx/backend/test/cpp/*.cc"
++        "${ONNX_ROOT}/onnx/backend/test/cpp/*.h")
++    list(REMOVE_ITEM __tmp_srcs "${ONNX_ROOT}/onnx/cpp2py_export.cc")
++    list(REMOVE_ITEM __tmp_srcs ${onnx_gtests_src})
++    list(APPEND ONNX_SRCS ${__tmp_srcs})
++endif()
+=20
+ add_library(onnx_proto ${ONNX_PROTO_SRCS} ${ONNX_PROTO_HDRS})
+ add_dependencies(onnx_proto gen_onnx_operators_proto gen_onnx_data_proto)
+@@ -595,13 +610,6 @@ if(ONNX_BUILD_PYTHON)
+     target_link_libraries(onnx_cpp2py_export PRIVATE ${Python3_LIBRARIES}=
)
+     target_compile_options(onnx_cpp2py_export
+                            PRIVATE /MP
+-                                   /wd4146 # unary minus operator applied=
 to unsigned type,
+-                                           # result still unsigned
+-                                   /wd4244 # 'argument': conversion from =
'google::
+-                                           # protobuf::uint64' to 'int', =
possible
+-                                           # loss of data
+-                                   /wd4267 # Conversion from 'size_t' to =
'int',
+-                                           # possible loss of data
+                                    ${EXTRA_FLAGS})
+     add_msvc_runtime_flag(onnx_cpp2py_export)
+     add_onnx_global_defines(onnx_cpp2py_export)
+@@ -618,23 +626,9 @@ endif()
+ if(MSVC)
+   target_compile_options(onnx_proto
+                          PRIVATE /MP
+-                                 /wd4146 # unary minus operator applied t=
o unsigned type,
+-                                         # result still unsigned
+-                                 /wd4244 #'argument': conversion from 'go=
ogle::
+-                                         #protobuf::uint64' to 'int', pos=
sible
+-                                         # loss of data
+-                                 /wd4267 # Conversion from 'size_t' to 'i=
nt',
+-                                         # possible loss of data
+                                  ${EXTRA_FLAGS})
+   target_compile_options(onnx
+                          PRIVATE /MP
+-                                 /wd4146 # unary minus operator applied t=
o unsigned type,
+-                                         # result still unsigned
+-                                 /wd4244 # 'argument': conversion from 'g=
oogle::
+-                                         # protobuf::uint64' to 'int', po=
ssible
+-                                         # loss of data
+-                                 /wd4267 # Conversion from 'size_t' to 'i=
nt',
+-                                         # possible loss of data
+                                  ${EXTRA_FLAGS})
+   add_msvc_runtime_flag(onnx_proto)
+   add_msvc_runtime_flag(onnx)
+diff --git a/onnx/defs/nn/defs.cc b/onnx/defs/nn/defs.cc
+index 643662708..4aed90278 100644
+--- a/onnx/defs/nn/defs.cc
++++ b/onnx/defs/nn/defs.cc
+@@ -36,7 +36,7 @@ static const char* conv_transpose_auto_pad_doc =3D
+     "on whether it is even or odd). In case the padding is an odd number,=
 the extra "
+     "padding is added at the end for SAME_UPPER and at the beginning for =
SAME_LOWER.";
+=20
+-static void convPoolShapeInference(
++void convPoolShapeInference(
+     InferenceContext& ctx,
+     bool use_dilation,
+     bool require_kernel_shape,
+@@ -1102,7 +1102,7 @@ ONNX_OPERATOR_SET_SCHEMA(
+           convPoolShapeInference(ctx, true, false, 0, 1);
+         }));
+=20
+-static void convTransposeShapeInference(InferenceContext& ctx) {
++void convTransposeShapeInference(InferenceContext& ctx) {
+   propagateElemTypeFromInputToOutput(ctx, 0, 0);
+=20
+   // we need at least two inputs to have a shape for this inference.
+@@ -1462,7 +1462,7 @@ ONNX_OPERATOR_SET_SCHEMA(
+         }));
+=20
+ // For GlobalPool operations.
+-static void globalPoolTypeShapeInference(InferenceContext& ctx) {
++void globalPoolTypeShapeInference(InferenceContext& ctx) {
+   propagateElemTypeFromInputToOutput(ctx, 0, 0);
+=20
+   // needs at least one input with shape.
+diff --git a/onnx/defs/nn/old.cc b/onnx/defs/nn/old.cc
+index d8ca9a46f..1eda4c70b 100644
+--- a/onnx/defs/nn/old.cc
++++ b/onnx/defs/nn/old.cc
+@@ -4023,7 +4023,6 @@ ONNX_OPERATOR_SET_SCHEMA(
+     GroupNormalization,
+     18,
+     OpSchema()
+-        .Deprecate()
+         .SetDoc(GroupNormalization_ver18_doc)
+         .Attr("epsilon", "The epsilon value to use to avoid division by z=
ero.", AttributeProto::FLOAT, 1e-5f)
+         .Attr(
+diff --git a/onnx/defs/rnn/defs.cc b/onnx/defs/rnn/defs.cc
+index c0ed3a393..6c8e29092 100644
+--- a/onnx/defs/rnn/defs.cc
++++ b/onnx/defs/rnn/defs.cc
+@@ -5,7 +5,7 @@
+ #include "onnx/defs/schema.h"
+=20
+ namespace ONNX_NAMESPACE {
+-static void RNNShapeInference(InferenceContext& ctx) {
++void RNNShapeInference(InferenceContext& ctx) {
+   TensorShapeProto::Dimension num_directions, seq_length, batch_size, hid=
den_size;
+=20
+   auto direction =3D getAttribute(ctx, "direction", "forward");
+diff --git a/onnx/defs/schema.h b/onnx/defs/schema.h
+index acf3aac7e..62c61fd97 100644
+--- a/onnx/defs/schema.h
++++ b/onnx/defs/schema.h
+@@ -980,7 +980,7 @@ class OpSchemaRegistry final : public ISchemaRegistry =
{
+   class OpSchemaRegisterOnce final {
+    public:
+     // Export to cpp custom register macro
+-    explicit OpSchemaRegisterOnce(
++    OpSchemaRegisterOnce(
+         OpSchema op_schema,
+         int opset_version_to_load =3D 0,
+         bool fail_duplicate_schema =3D true) {
+@@ -1312,8 +1312,8 @@ size_t ReplaceAll(std::string& s, const char* from, =
const char* to);
+ #define ONNX_OPERATOR_SCHEMA(name) ONNX_OPERATOR_SCHEMA_UNIQ_HELPER(__COU=
NTER__, name)
+ #define ONNX_OPERATOR_SCHEMA_UNIQ_HELPER(Counter, name) ONNX_OPERATOR_SCH=
EMA_UNIQ(Counter, name)
+ #define ONNX_OPERATOR_SCHEMA_UNIQ(Counter, name)                         =
                                             \
+-  static ONNX_NAMESPACE::OpSchemaRegistry::OpSchemaRegisterOnce(op_schema=
_register_once##name##Counter) ONNX_UNUSED =3D \
+-      OpSchema(#name, __FILE__, __LINE__)
++  static ONNX_NAMESPACE::OpSchemaRegistry::OpSchemaRegisterOnce op_schema=
_register_once##name##Counter ONNX_UNUSED =3D \
++      ONNX_NAMESPACE::OpSchema(#name, __FILE__, __LINE__)
+=20
+ // Helper function
+ size_t ReplaceAll(std::string& s, const char* from, const char* to);
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find=
-package-Protobuf-before-checking-if-it-w.patch b/meta-arago-extras/recipes=
-framework/onnx/onnx/0002-cmake-Fix-Protobuf-target-check-by-calling-find_p=
ack.patch
similarity index 40%
rename from meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-=
package-Protobuf-before-checking-if-it-w.patch
rename to meta-arago-extras/recipes-framework/onnx/onnx/0002-cmake-Fix-Prot=
obuf-target-check-by-calling-find_pack.patch
index e35b27de..8c01a2c7 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-packag=
e-Protobuf-before-checking-if-it-w.patch
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0002-cmake-Fix-Protobuf=
-target-check-by-calling-find_pack.patch
@@ -1,25 +1,36 @@
-From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 11:44:56 -0600
-Subject: [PATCH] Try to find package Protobuf before checking if it was fo=
und
+From b6628fa7ee3acd35076d617157342b25c432715b Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 17:23:40 +0530
+Subject: [PATCH 2/5] cmake: Fix Protobuf target check by calling find_pack=
age
+ first
+
+Add find_package(Protobuf) before checking if protobuf targets exist
+in the ONNX_BUILD_CUSTOM_PROTOBUF conditional. This ensures Protobuf
+targets are properly defined before being referenced.
+
+Without this change, the target existence checks fails even when
+Protobuf is available.
=20
 Upstream-Status: Pending
=20
-Signed-off-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
  CMakeLists.txt | 2 ++
  1 file changed, 2 insertions(+)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b666eec4..f6fbf159 100644
+index 8593fe4a3..9fed84add 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
+@@ -142,6 +142,8 @@ if(ONNX_BUILD_TESTS)
    set(googletest_STATIC_LIBRARIES GTest::gtest)
  endif()
-
+=20
 +find_package(Protobuf)
 +
+ if(NOT ONNX_BUILD_CUSTOM_PROTOBUF)
  if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR ((NOT O=
NNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
    # Sometimes we need to use protoc compiled for host architecture while =
linking
-   # libprotobuf against target architecture. See https://github.com/caffe=
2/caffe
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-e=
xport-internal-targets-directories.patch b/meta-arago-extras/recipes-framew=
ork/onnx/onnx/0003-cmake-Remove-Protobuf-directory-exports-from-config-.pat=
ch
similarity index 41%
rename from meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-ex=
port-internal-targets-directories.patch
rename to meta-arago-extras/recipes-framework/onnx/onnx/0003-cmake-Remove-P=
rotobuf-directory-exports-from-config-.patch
index d6cc85e7..c6e9c698 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-i=
nternal-targets-directories.patch
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0003-cmake-Remove-Proto=
buf-directory-exports-from-config-.patch
@@ -1,28 +1,37 @@
-From 0bdd879060cb5022b62d06bff0f21a21c3be18ca Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Mon, 3 Feb 2025 11:28:52 -0600
-Subject: [PATCH] Do not re-export internal targets directories
+From 6ce0573c3661424c5723f9bab6773a3f6ede79fd Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 17:24:56 +0530
+Subject: [PATCH 3/5] cmake: Remove Protobuf directory exports from config
+ template
=20
-These can be specific to a given project build and should not
-be automatically inherited to dependent projects.
+Remove CMAKE_PREFIX_PATH and Protobuf_INCLUDE_DIR exports from
+ONNXConfig.cmake.in as these paths are specific to the ONNX build
+environment and should not be propagated to dependent projects.
+
+Dependent projects should find Protobuf through their own
+find_package(Protobuf REQUIRED) call instead of inheriting
+build-specific paths.
=20
 Upstream-Status: Pending
=20
-Signed-off-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
 ---
  cmake/ONNXConfig.cmake.in | 2 --
  1 file changed, 2 deletions(-)
=20
 diff --git a/cmake/ONNXConfig.cmake.in b/cmake/ONNXConfig.cmake.in
-index d588f8ae..a61af089 100644
+index d588f8ae1..a61af0894 100644
 --- a/cmake/ONNXConfig.cmake.in
 +++ b/cmake/ONNXConfig.cmake.in
 @@ -6,8 +6,6 @@
  # library version information
  set(ONNX_VERSION "@ONNX_VERSION@")
-
+=20
 -list(APPEND CMAKE_PREFIX_PATH "@PROTOBUF_DIR@")
 -set(Protobuf_INCLUDE_DIR "@PROTOBUF_INCLUDE_DIR@")
  find_package(Protobuf REQUIRED)
-
+=20
  # import targets
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0004-Linker-fail=
ed-when-trying-to-create-the-final-onnx_g.patch b/meta-arago-extras/recipes=
-framework/onnx/onnx/0004-Linker-failed-when-trying-to-create-the-final-onn=
x_g.patch
new file mode 100644
index 00000000..8422dcea
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0004-Linker-failed-when=
-trying-to-create-the-final-onnx_g.patch
@@ -0,0 +1,34 @@
+From 8e19cae53e24126cb57e486e0e7da96f02b3cbf7 Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 17:26:07 +0530
+Subject: [PATCH 4/5] Linker failed when trying to create the final onnx_gt=
ests
+ executable
+
+The main onnx library target was missing the ONNX_API compile
+definitions that are needed to properly export symbols on Linux
+platforms with hidden visibility. This causes undefined reference
+errors when linking tests because symbols like OpSchemaRegistry::Schema()
+are not visible.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9fed84add..89d4fed84 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -547,6 +547,7 @@ target_include_directories(onnx PUBLIC
+   $<INSTALL_INTERFACE:include>)
+ target_link_libraries(onnx PUBLIC onnx_proto)
+ add_onnx_global_defines(onnx)
++target_compile_definitions(onnx PRIVATE ${ONNX_API_DEFINE})
+=20
+ if(ONNX_BUILD_PYTHON)
+   Python3_add_library(onnx_cpp2py_export MODULE WITH_SOABI "${ONNX_ROOT}/=
onnx/cpp2py_export.cc")
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0005-Fix-symbol-=
visibility-when-tests-are-enabled.patch b/meta-arago-extras/recipes-framewo=
rk/onnx/onnx/0005-Fix-symbol-visibility-when-tests-are-enabled.patch
new file mode 100644
index 00000000..2cbb8444
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0005-Fix-symbol-visibil=
ity-when-tests-are-enabled.patch
@@ -0,0 +1,36 @@
+From b745ae1fed1e0819cac764a07d8f82abc1c438da Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 17:27:17 +0530
+Subject: [PATCH 5/5] Fix symbol visibility when tests are enabled
+
+The onnx target uses hidden visibility which hides C++ API symbols
+that tests need. Most C++ API symbols (OpSchema methods, OpSchemaRegistry
+functions, etc.) are not marked with ONNX_API, so they remain hidden
+even with ONNX_API_DEFINE set.
+
+When tests are enabled, we need access to these internal symbols,
+so disable hidden visibility for the main onnx library.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 89d4fed84..c4cded129 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -538,8 +538,6 @@ if(CMAKE_SYSTEM_NAME STREQUAL "AIX")
+ else()
+   add_library(onnx ${ONNX_SRCS})
+ endif()
+-set_target_properties(onnx PROPERTIES CXX_VISIBILITY_PRESET hidden)
+-set_target_properties(onnx PROPERTIES VISIBILITY_INLINES_HIDDEN ON)
+=20
+ target_include_directories(onnx PUBLIC
+   $<BUILD_INTERFACE:${ONNX_ROOT}>
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb b/meta=
-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
similarity index 87%
rename from meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
rename to meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
index 3cfb4097..fc565dec 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx_1.16.1.bb
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
@@ -4,12 +4,15 @@ HOMEPAGE =3D "https://www.onnx.ai/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
=20
-SRC_URI =3D "git://github.com/onnx/onnx.git;protocol=3Dhttps;branch=3Drel-=
1.16.1"
+SRC_URI =3D "git://github.com/onnx/onnx.git;protocol=3Dhttps;branch=3Drel-=
1.18.0"
 SRC_URI +=3D "\
-	file://0001-Try-to-find-package-Protobuf-before-checking-if-it-w.patch \
-	file://0002-Do-not-re-export-internal-targets-directories.patch \
+	file://0001-Apply-onnx-patch.patch \
+	file://0002-cmake-Fix-Protobuf-target-check-by-calling-find_pack.patch \
+	file://0003-cmake-Remove-Protobuf-directory-exports-from-config-.patch \
+	file://0004-Linker-failed-when-trying-to-create-the-final-onnx_g.patch \
+	file://0005-Fix-symbol-visibility-when-tests-are-enabled.patch \
 "
-SRCREV =3D "595228d99e3977ac27cb79d5963adda262af99ad"
+SRCREV =3D "e709452ef2bbc1d113faf678c24e6d3467696e83"
=20
 DEPENDS +=3D "\
 	abseil-cpp \
--=20
2.34.1


