Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8EEEA4E16
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:59:26 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162281.1772463555692933658
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 06:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=askeFYHo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.23, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Njdt7/TJa1MkjjjCuqbDBbPkmIA9XgsARClr9N72610+cwnQNogFuvlrQX/XD2oHxrBk4eQPgVjOtM24DacDeTTiAEn1os2a2hAXlx9Bez0gzWFmDqcNOOMnBD+TIpNn1wFcusoIYdWRmQavis4qaACtPpS1KKIMnDkHug2kd9kZpRhFx8iM8El/SugxHvX1enY/0yCUaKOtWOMIjrKcyxdHE/xLmi0DOjLsKq4GrKRQp+OoD/5gio0Pe0hDHNGMHOQwBNSdAoXomeSKb4NeMICYu9ZiAsfsaSrG71lfC361s1ZnCiK0MSi0K4v79+1vbB3jOViClFdrquBaj7XjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mooJBY5CbHbVWWEoEFWj+B3WXvqxcISzBvlbj5b5y0=;
 b=fvJkFmowJngAz5h8Y+sNwpAUs5ZMlQu25XOO1pGh8i7VVtJDcLVHAaAHIdp8mQfKeB+dz7opTgf+57bHTfVImZ/DuIH59OgFeFKJDZ4uRaevHrzug0IltTonn+Xr/ZHJ7Uyp/XT4HJtwdDueNbPdOs0F67bTkLay4ksUpTgjtVTuXl8zaiEoLrc44c7xSjEVuA/gKZrcBBVpuJ3RLg1r8qgndlMt3MvsLGAuAUsVPr4LJVOeTd1m0T22Ursxq5PA3lFPQP7bimnDjTbgMUyj6txY8gyvu5r56Vs1xj//mKcU9ouJ3dd58S4L52gxO/apNv0Trf9IHqYcrA5V/wnULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mooJBY5CbHbVWWEoEFWj+B3WXvqxcISzBvlbj5b5y0=;
 b=askeFYHoN0a3FQfpoIZJ111Z4DBORIZP8WhENTWhEDEwmu+0QtBdIQ+2hioJqPVJwb1/0jqxli2w8OnVgYr0CeLHiP5o4XHS56mRsp7ltZGIt9tlUnVKaiSZaGkYCZvJrLn10MEISUFq8cMuYUTlJrqnfgLt6s6p2Bpeasb2n8U=
Received: from BN0PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:e7::33)
 by CY5PR10MB6022.namprd10.prod.outlook.com (2603:10b6:930:3e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:59:12 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::35) by BN0PR03CA0058.outlook.office365.com
 (2603:10b6:408:e7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 14:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:59:08 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:59:08 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:59:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:59:08 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Ewvka960610;
	Mon, 2 Mar 2026 08:59:05 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [PATCH 1/2] meta-arago-extras: Migrate ONNX v1.16.1 to v1.18.0
Date: Mon, 2 Mar 2026 20:28:45 +0530
Message-ID: <20260302145846.828106-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302145846.828106-1-p-deshmukh@ti.com>
References: <20260302145846.828106-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CY5PR10MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: a59b20fb-0bed-4506-3801-08de786c41e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	Jj9Ok6zSPkfY1uMoqJNTz19Vsdj+ENEO6ILuKlVAZC+voyr5qD7fPexXQPk3WYzxgOxlxYmEEs/YwD6mVBchTcuAI79dOIj7b4w5GXeBw6i+mOpuHNcIrEoDZ+k6anb2OSXkgYUYv+YWy091lTGvzHiKPRqsOioDQQE9xqynCSySnhGGlZGwjKw2VubP7OWXDOQFAskaFFdS6hl4VrbErTyRTb4FMeSwgfo7x79keeSpEQUP/3BHWk92Dl7L5itfh+bW+ZVSLNEBaAP7dnSlv4iL31y7pW4Z4vq0b+aCCjec7zeg/WSBsIXpCb2+f1n6Yl4+3YxtjSmel2LccXob1niEUFv11CPhbNQqD9kzbc+TgWDpakucuPHHXfyLvOznzsyUxMvDfyCdDUjuBMijXDJAXL3Fcw19nsgCGxQHToeATDireLQ/DAJeDqh0yiPKQ8hc3U4k0d0ejC6Ag15G1OCCLsI2/KvWyq8qoOKJ/ILJLf26jeATxQNa+MPKgiAFH3oq/tob5Y1JkitTOwGbHZdAI15PV9X5LN0QqX6H+bzRHm5MHuW5aYAkG9b0bdKNjnq170MlWLKmrR4uWcJIqitKX4SnJq3TNz6JQbUMNISCZfbL5kzyMxG2jR1F2pNFeOtAs3PCapPl9o/lBowzX00dGX8YqEPj5JBEdAAKgV7RIUeZMNP4UbOOY3mXX1mrLwJq7LVqXkZYPnIobXKN5iBAT9HihZwZsiLNIxwOodSpYl23JdAIgNt3VSm2YR+PZvlkS+sK8C2ycH+SdZk3PGOJjHNgemRtAcaYjmoYN+I=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rbUkjc4Awk4TemaNN4Lftq5CYzo69xGIMZ94WcEUhwYfXHEtvze/8tpmWM4gSSHlGqUia0C2v2udsKiyZZSg1Y/lC+BcPIjy6ohGAcvLfOj8lSjgGLP2S6WUfChiVMMAzsX1JvRGfDCoLBva9RFJDxSVvRrhY9I5502LawjPzAYj/+ku4suO4b3hEW0UjFN09yGm5zBqMq/GmWS6SjaLckGy+OvJ63YckAtdnk3RHBr65dn59SwqkWiRGXuIEM8GemGqbxs098t4kGI1L1joltEkcUe7qQ7FoYkoO5yb0ceyk5if7Oq/JVGUQUrpZGihGmeJmgeNTPRf5BzexA2Fw4tVFKtrSD7jMT+jQcEUD/X4REGBK3N2KKxvnnC5gu9FdjaoWD2r7LJCivTN3wJUrxpbii757ZTzTPkiuO3E132xq75BgNNriMaWwoZfm9i5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:59:08.9192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a59b20fb-0bed-4506-3801-08de786c41e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6022
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 14:59:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17171

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
 .../onnx/onnx/0001-Apply-onnx-patch.patch     | 197 ++++++++++++++++++
 ...age-Protobuf-before-checking-if-it-w.patch |  25 ---
 ...-export-internal-targets-directories.patch |  28 ---
 ...uf-target-check-by-calling-find_pack.patch |  36 ++++
 ...tobuf-directory-exports-from-config-.patch |  37 ++++
 ...en-trying-to-create-the-final-onnx_g.patch |  34 +++
 ...ol-visibility-when-tests-are-enabled.patch |  36 ++++
 .../onnx/{onnx_1.16.1.bb =3D> onnx_1.18.0.bb}   |  11 +-
 8 files changed, 347 insertions(+), 57 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Appl=
y-onnx-patch.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-=
to-find-package-Protobuf-before-checking-if-it-w.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-n=
ot-re-export-internal-targets-directories.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0002-cmak=
e-Fix-Protobuf-target-check-by-calling-find_pack.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0003-cmak=
e-Remove-Protobuf-directory-exports-from-config-.patch
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
-framework/onnx/onnx/0001-Try-to-find-package-Protobuf-before-checking-if-i=
t-w.patch
deleted file mode 100644
index e35b27de..00000000
--- a/meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-to-find-packag=
e-Protobuf-before-checking-if-it-w.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7e118775c120ec802d13ac3e0125d726323aee87 Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 11:44:56 -0600
-Subject: [PATCH] Try to find package Protobuf before checking if it was fo=
und
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b666eec4..f6fbf159 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -127,6 +127,8 @@ if(ONNX_BUILD_TESTS)
-   set(googletest_STATIC_LIBRARIES GTest::gtest)
- endif()
-
-+find_package(Protobuf)
-+
- if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR ((NOT O=
NNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
-   # Sometimes we need to use protoc compiled for host architecture while =
linking
-   # libprotobuf against target architecture. See https://github.com/caffe=
2/caffe
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-e=
xport-internal-targets-directories.patch b/meta-arago-extras/recipes-framew=
ork/onnx/onnx/0002-Do-not-re-export-internal-targets-directories.patch
deleted file mode 100644
index d6cc85e7..00000000
--- a/meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-not-re-export-i=
nternal-targets-directories.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0bdd879060cb5022b62d06bff0f21a21c3be18ca Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Mon, 3 Feb 2025 11:28:52 -0600
-Subject: [PATCH] Do not re-export internal targets directories
-
-These can be specific to a given project build and should not
-be automatically inherited to dependent projects.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- cmake/ONNXConfig.cmake.in | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/cmake/ONNXConfig.cmake.in b/cmake/ONNXConfig.cmake.in
-index d588f8ae..a61af089 100644
---- a/cmake/ONNXConfig.cmake.in
-+++ b/cmake/ONNXConfig.cmake.in
-@@ -6,8 +6,6 @@
- # library version information
- set(ONNX_VERSION "@ONNX_VERSION@")
-
--list(APPEND CMAKE_PREFIX_PATH "@PROTOBUF_DIR@")
--set(Protobuf_INCLUDE_DIR "@PROTOBUF_INCLUDE_DIR@")
- find_package(Protobuf REQUIRED)
-
- # import targets
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0002-cmake-Fix-P=
rotobuf-target-check-by-calling-find_pack.patch b/meta-arago-extras/recipes=
-framework/onnx/onnx/0002-cmake-Fix-Protobuf-target-check-by-calling-find_p=
ack.patch
new file mode 100644
index 00000000..8c01a2c7
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0002-cmake-Fix-Protobuf=
-target-check-by-calling-find_pack.patch
@@ -0,0 +1,36 @@
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
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8593fe4a3..9fed84add 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -142,6 +142,8 @@ if(ONNX_BUILD_TESTS)
+   set(googletest_STATIC_LIBRARIES GTest::gtest)
+ endif()
+=20
++find_package(Protobuf)
++
+ if(NOT ONNX_BUILD_CUSTOM_PROTOBUF)
+ if((ONNX_USE_LITE_PROTO AND TARGET protobuf::libprotobuf-lite) OR ((NOT O=
NNX_USE_LITE_PROTO) AND TARGET protobuf::libprotobuf))
+   # Sometimes we need to use protoc compiled for host architecture while =
linking
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnx/onnx/0003-cmake-Remov=
e-Protobuf-directory-exports-from-config-.patch b/meta-arago-extras/recipes=
-framework/onnx/onnx/0003-cmake-Remove-Protobuf-directory-exports-from-conf=
ig-.patch
new file mode 100644
index 00000000..c6e9c698
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnx/onnx/0003-cmake-Remove-Proto=
buf-directory-exports-from-config-.patch
@@ -0,0 +1,37 @@
+From 6ce0573c3661424c5723f9bab6773a3f6ede79fd Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 17:24:56 +0530
+Subject: [PATCH 3/5] cmake: Remove Protobuf directory exports from config
+ template
+
+Remove CMAKE_PREFIX_PATH and Protobuf_INCLUDE_DIR exports from
+ONNXConfig.cmake.in as these paths are specific to the ONNX build
+environment and should not be propagated to dependent projects.
+
+Dependent projects should find Protobuf through their own
+find_package(Protobuf REQUIRED) call instead of inheriting
+build-specific paths.
+
+Upstream-Status: Pending
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ cmake/ONNXConfig.cmake.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/cmake/ONNXConfig.cmake.in b/cmake/ONNXConfig.cmake.in
+index d588f8ae1..a61af0894 100644
+--- a/cmake/ONNXConfig.cmake.in
++++ b/cmake/ONNXConfig.cmake.in
+@@ -6,8 +6,6 @@
+ # library version information
+ set(ONNX_VERSION "@ONNX_VERSION@")
+=20
+-list(APPEND CMAKE_PREFIX_PATH "@PROTOBUF_DIR@")
+-set(Protobuf_INCLUDE_DIR "@PROTOBUF_INCLUDE_DIR@")
+ find_package(Protobuf REQUIRED)
+=20
+ # import targets
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
index 3cfb4097..06a84b24 100644
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
+	file://0001-Patch-onnx.patch-apply.patch \
+	file://0002-Try-to-find-package-Protobuf-before-checking-if-it-w.patch \
+	file://0003-Do-not-re-export-internal-targets-directories.patch \
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


