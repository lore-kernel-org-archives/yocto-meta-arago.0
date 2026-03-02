Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08D2EA4E18
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:59:25 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162286.1772463563294965113
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 06:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aHPmADf+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.25, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xt/EQFZI7TRupZ/gAtAiILSRtlTMwpnph5nKlnoZZkQMbIcxO+u7ocJi2RkrRL47i1dGeO0HgQmOzTPyCoSG6tKntFu0AAJPlPgGUDtiZUiCzNbiab2qIupJBLr1qy7CTkwIcuVKXzhsqk49sqq0dHPbXEvuszHpycFqNhnbq7/3hcjwlaJwSl7zcw+LIpg9L7BGm7CGOvMgjIZVahnkyuru2eE5fxep8R41vnZ+Ii6emX0Z2JfV4CaULoV3x7gij3mzsJEGBXRJ/IozY0toLMvTjlaXDWlwEy0NwA/wxLIWTJOQX+zNo4PiAjw0DrdasOyjAw0iEJxpO7VEuLfjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQV+fWLntYK/C6KcOZ3e7q9PKyHoi5k7+3VXW3PELOw=;
 b=GKwxlAQucHWf/mxHSE4V5ahSKd8N8hbQ8gEo09gbisHwsLkPrOJ9kjSQnUpyXzDXlZIV5kmGWk5iXmI9x7BJX9PmWxcguv4tIhxt27D5iS9matGFC1Vzlae6HRLePWSHkDY9esFdb+F4EQxGkhBkPqlCbEEOeZZaC3tURmJVdNoHqG23pQ3zDstV3N13xMqoS3jP/oUUVy34aJSktYHfCu1qIUBU8PGKnJz5hPhi41KimCTbn7KYivInS4ckXiwadoa0MLU1nhUYev9OjiyaRqpVaoWwbHcdfO5J6vcs5qzmmt/X7lvE6kWn+UG4fIBs6qYUvfKIFLioH1tjP3bPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQV+fWLntYK/C6KcOZ3e7q9PKyHoi5k7+3VXW3PELOw=;
 b=aHPmADf+a1KOLDkDPeS8J1F+Dy7Ot0GFWYPRVjcskP1226YAcP9XGuBQiJnBxj0MaXuqmdVwRUXSkOs5zh3jhMb4tboSRjRPzFsdfVTWokk7xwVxc4fXPQiazFblhf9Db7A4VqKQ1cxOy+CvxsB8rWteIFzUjNW2waoljrUNf6A=
Received: from DM6PR02CA0152.namprd02.prod.outlook.com (2603:10b6:5:332::19)
 by SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 14:59:20 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::b) by DM6PR02CA0152.outlook.office365.com
 (2603:10b6:5:332::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 14:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:59:19 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:59:19 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:59:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:59:11 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Ewvkb960610;
	Mon, 2 Mar 2026 08:59:09 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [PATCH 2/2] meta-arago-extras: Migrate ONNXRuntime v1.20.1 to v1.23.2
Date: Mon, 2 Mar 2026 20:28:46 +0530
Message-ID: <20260302145846.828106-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302145846.828106-1-p-deshmukh@ti.com>
References: <20260302145846.828106-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|SJ0PR10MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: f670b368-0ed5-4df8-6fb8-08de786c4861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|34020700016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	DLQ9a9VGZvR2PsLwns6Xmcdz4LFB/ZdlbeuklCZWW33hhLjDRxMnFqukDf20PqJ9hzzMBHzltBAac+KtyvpFiCAaLKUmngZqf63JEFsm/r4T9lZ+SGlUecUTC0GquM90wKDY7/gUbkD03/tcH1eq/MzffZTRJM5Y/hPhGRG300X4dDL+zr6CZitrui+y5U/ATKP5fqO8qE/S3t6LW9Pif3xvNKBcGcAoKlChPLrBM5PwTPCBxEVe74rcfulhRR0KtcVwJUNeNNauX2ehWBOlbvL00br1VwudAKHEGe5hyL284NORjry79SUFIuxzTg9PkbgmAudlIWEW2Tx+JLRm7PrMpmArbXymEuLHq1BWG3kAduFgPzd505IAevXBUVUWXS0zoaoxnhwAK2fYuonjVZgY1kSqXdTI8tPZQvxGEpXdW3q1pDVObmsQfmaJVup22maKiq7P21JfSjt5R6F24iY778KR6NNzSD0FH7JYYXMRcEPXtDHGOD8EbX7PT4PJjtN6/XRxsC0r0nO7c2pIMRvZR66/2JhJVx2YhW+ZKJjwElegK672qzJICvgJ0un57Pgl43WS0a2x5LLXBZij7e3hAtJshrlul8aV80aXjeZhvRjQUT8JJgKaUSm2X30pD787VKH8RBVa7pVLwgi80gaBGstImFjlWEVsr8TLcFD6UReMJkAnKUyOFDzGDwubQRCuuI58z/YVGraBfITSsn7OnNwWQiInXvZwJv/wf2iobc8kfuU6I71Ix3sC9l03ZfB1ARneXz48nvaWZc50vqRGpykMryThRNDQp377u6A=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(34020700016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	feeZL7XxCG6IRREX3huQX0kEBDEjSFJci4lILuGmm+UQzp9A1VDOHfODQQZADAS2zJyLMMwFv/Mxh0a3Lk9Wc9puH21WvhGPYRhazxUyaQFjmrG1HL1jbZ0DWrxf8m+G85GVN0jMMlpEDcxjYrtL5OUerjgQrdxcOnxA4zjwmuKoLdlB8fRxSYWicbf9ZCzbQieP1YAo3id5F5bY+JTeYPHDg1e2qCcZqkTWcMV+lqlxOSyGz/UgBOSMQuPa7jhznTRQdo/nSWNRo7JCvflJZAKg9tCv3pxxthrfreCahgR3CbmLlRNFLu7oTocDK8O8wJJKaaGK1OfADelssNxQJG/XVqjs9y7xGe/ziW1nLIDjiIn3EquLVkFnWIPOm7I28lnSQV+Bnyeeey7LN43ZKd+KP8qr4OPBZYhUmvibbHwJ+RApuw80WSJxeVbfhRII
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:59:19.8212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f670b368-0ed5-4df8-6fb8-08de786c4861
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5613
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 14:59:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17172

We are migrating ONNXRuntime from v1.20.1 to the latest
stable version v1.23.2.

Removed Patches (Fixed Upstream):
  =E2=80=A2 0001-Remove-executable-permission-bit-from-source-files.patch
    - Upstream Link: https://github.com/microsoft/onnxruntime/blob/rel-1.23=
.2/onnxruntime/contrib_ops/cpu/utils/console_dumper.h#L6
  =E2=80=A2 0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
    - Upstream Link: https://github.com/microsoft/onnxruntime/blob/rel-1.23=
.2/cmake/CMakeLists.txt#L64
  =E2=80=A2 0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
    - Upstream Link: https://github.com/microsoft/onnxruntime/blob/rel-1.23=
.2/cmake/onnxruntime_providers_acl.cmake#L16
  =E2=80=A2 0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
    - Upstream Link: https://github.com/microsoft/onnxruntime/blob/rel-1.23=
.2/cmake/CMakeLists.txt
  =E2=80=A2 0005-cmake-Print-out-result-of-find_package.patch
    - With the updated helper_functions.cmake this patch is no needed.

  Added Patches (New Requirements):
  =E2=80=A2 0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch
    - Fixes missing stdint.h include causing uint32_t compilation errors

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 ...g-header-to-fix-uint32_t-compilation.patch |  27 +++
 ...ble-permission-bit-from-source-files.patch |  72 --------
 ...-in-option-text-s-buildings-bindings.patch |  25 ---
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 ----
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  30 ----
 ...ake-Print-out-result-of-find_package.patch |  37 ----
 .../onnxruntime/onnxruntime_1.20.1.bb         | 157 -----------------
 .../onnxruntime/onnxruntime_1.23.2.bb         | 163 ++++++++++++++++++
 8 files changed, 190 insertions(+), 353 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0001-Remove-executable-permission-bit-from-source-files.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0005-cmake-Print-out-result-of-find_package.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time_1.20.1.bb
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time_1.23.2.bb

diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/00=
01-Added-the-missing-header-to-fix-uint32_t-compilation.patch b/meta-arago-=
extras/recipes-framework/onnxruntime/onnxruntime/0001-Added-the-missing-hea=
der-to-fix-uint32_t-compilation.patch
new file mode 100644
index 00000000..21e0a301
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Adde=
d-the-missing-header-to-fix-uint32_t-compilation.patch
@@ -0,0 +1,27 @@
+From cb67823df8cfa19cf1c0c0ddd1b9aa29ee7773ba Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Thu, 12 Feb 2026 16:02:40 +0530
+Subject: [PATCH] Added the missing header to fix uint32_t compilation erro=
r.
+
+Upstream-Status: Backport [https://github.com/microsoft/onnxruntime/commit=
/d6e712c]
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ onnxruntime/core/common/semver.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/onnxruntime/core/common/semver.h b/onnxruntime/core/common/se=
mver.h
+index a07c24f016..98bb6a2cef 100644
+--- a/onnxruntime/core/common/semver.h
++++ b/onnxruntime/core/common/semver.h
+@@ -3,6 +3,7 @@
+=20
+ #pragma once
+=20
++#include <cstdint>
+ #include <optional>
+ #include <string_view>
+=20
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/00=
01-Remove-executable-permission-bit-from-source-files.patch b/meta-arago-ex=
tras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-permi=
ssion-bit-from-source-files.patch
deleted file mode 100644
index b64e32ca..00000000
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remo=
ve-executable-permission-bit-from-source-files.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 626066499c34c524924302342fc071f32442caae Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Sun, 12 Jan 2025 12:48:49 -0600
-Subject: [PATCH] Remove executable permission bit from source files
-
-These are source files, not executables, do not set the executable
-permission bit on these files.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- onnxruntime/contrib_ops/cpu/utils/console_dumper.h           | 1 +
- onnxruntime/core/optimizer/bias_softmax_fusion.cc            | 0
- onnxruntime/core/providers/acl/acl_execution_provider.h      | 0
- onnxruntime/core/providers/acl/acl_fwd.h                     | 0
- onnxruntime/core/providers/acl/acl_provider_factory.cc       | 0
- onnxruntime/core/providers/acl/math/gemm.cc                  | 0
- onnxruntime/core/providers/acl/nn/batch_norm.cc              | 0
- onnxruntime/core/providers/acl/nn/batch_norm.h               | 0
- onnxruntime/test/optimizer/graph_transform_test.cc           | 0
- onnxruntime/test/optimizer/graph_transform_test_layernorm.cc | 0
- 10 files changed, 1 insertion(+)
- mode change 100755 =3D> 100644 onnxruntime/core/optimizer/bias_softmax_fu=
sion.cc
- mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_executi=
on_provider.h
- mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_fwd.h
- mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_provide=
r_factory.cc
- mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/math/gemm.c=
c
- mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/nn/batch_no=
rm.cc
- mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/nn/batch_no=
rm.h
- mode change 100755 =3D> 100644 onnxruntime/test/optimizer/graph_transform=
_test.cc
- mode change 100755 =3D> 100644 onnxruntime/test/optimizer/graph_transform=
_test_layernorm.cc
-
-diff --git a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h b/onnxrunt=
ime/contrib_ops/cpu/utils/console_dumper.h
-index 9ebc44f441..64bd2b7b18 100644
---- a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
-+++ b/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
-@@ -3,6 +3,7 @@
-
- #pragma once
- #include <string>
-+#include <iostream>
- #include "core/framework/ort_value.h"
- #include "core/framework/float16.h"
- #include "contrib_ops/cpu/utils/debug_macros.h"
-diff --git a/onnxruntime/core/optimizer/bias_softmax_fusion.cc b/onnxrunti=
me/core/optimizer/bias_softmax_fusion.cc
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/core/providers/acl/acl_execution_provider.h b/onn=
xruntime/core/providers/acl/acl_execution_provider.h
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/core/providers/acl/acl_fwd.h b/onnxruntime/core/p=
roviders/acl/acl_fwd.h
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/core/providers/acl/acl_provider_factory.cc b/onnx=
runtime/core/providers/acl/acl_provider_factory.cc
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/core/providers/acl/math/gemm.cc b/onnxruntime/cor=
e/providers/acl/math/gemm.cc
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.cc b/onnxruntime=
/core/providers/acl/nn/batch_norm.cc
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.h b/onnxruntime/=
core/providers/acl/nn/batch_norm.h
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/test/optimizer/graph_transform_test.cc b/onnxrunt=
ime/test/optimizer/graph_transform_test.cc
-old mode 100755
-new mode 100644
-diff --git a/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc =
b/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc
-old mode 100755
-new mode 100644
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/00=
02-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch b/meta-arago-ex=
tras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-optio=
n-text-s-buildings-bindings.patch
deleted file mode 100644
index 88423190..00000000
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmak=
e-Fix-typo-in-option-text-s-buildings-bindings.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From be67663e9a44d146033aeb97804145a60b4032db Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 12:35:03 -0600
-Subject: [PATCH] [cmake] Fix typo in option text s/buildings/bindings
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- cmake/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
-index d90a2a3550..e0cde678db 100644
---- a/cmake/CMakeLists.txt
-+++ b/cmake/CMakeLists.txt
-@@ -77,7 +77,7 @@ option(onnxruntime_GENERATE_TEST_REPORTS "Enable test re=
port generation" OFF)
- option(onnxruntime_ENABLE_STATIC_ANALYSIS "Enable static analysis" OFF)
- option(onnxruntime_USE_CUSTOM_STATIC_ANALYSIS_RULES "Use a custom SDL Rul=
e. It is mainly for our CI build" OFF)
- option(onnxruntime_REDIRECT_STATIC_ANALYSIS_OUTPUTS_TO_FILE "Use a custom=
 SDL Rule. It is mainly for our CI build" OFF)
--option(onnxruntime_ENABLE_PYTHON "Enable python buildings" OFF)
-+option(onnxruntime_ENABLE_PYTHON "Enable python bindings" OFF)
- # Enable it may cause LNK1169 error
- option(onnxruntime_ENABLE_MEMLEAK_CHECKER "Experimental: Enable memory le=
ak checker in Windows debug build" OFF)
- option(onnxruntime_USE_CUDA "Build with CUDA support" OFF)
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/00=
03-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch b/meta-arago-=
extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_LIB=
RARY_PATH-to-search-path-when-n.patch
deleted file mode 100644
index 75cb9b18..00000000
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-=
Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b1689f3f963f4c07d3329a838569ac4c2fa2bd5f Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 12:38:13 -0600
-Subject: [PATCH] [ACL] Do not add LD_LIBRARY_PATH to search path when not
- defined
-
-If LD_LIBRARY_PATH is not defined a blank "-L" is added to the
-link command. This causes the next object to be linked to get
-treated as if it was a search path and causes link failure.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- cmake/onnxruntime_providers_acl.cmake | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/onnxruntime_providers_acl.cmake b/cmake/onnxruntime_pro=
viders_acl.cmake
-index e23d289271..19d41dc73f 100644
---- a/cmake/onnxruntime_providers_acl.cmake
-+++ b/cmake/onnxruntime_providers_acl.cmake
-@@ -13,7 +13,9 @@
-     onnxruntime_common onnxruntime_framework onnx onnx_proto ${PROTOBUF_L=
IB} flatbuffers::flatbuffers Boost::mp11 safeint_interface
-   )
-
--  target_link_libraries(onnxruntime_providers_acl -L$ENV{LD_LIBRARY_PATH}=
)
-+  if (DEFINED ENV{LD_LIBRARY_PATH})
-+    target_link_libraries(onnxruntime_providers_acl -L$ENV{LD_LIBRARY_PAT=
H})
-+  endif()
-   add_dependencies(onnxruntime_providers_acl ${onnxruntime_EXTERNAL_DEPEN=
DENCIES})
-   set_target_properties(onnxruntime_providers_acl PROPERTIES FOLDER "ONNX=
Runtime")
-   target_include_directories(onnxruntime_providers_acl
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/00=
04-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch b/meta-arago-=
extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAKE_=
CXX_FLAGS-in-build-information-.patch
deleted file mode 100644
index e8f086a8..00000000
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-n=
ot-include-CMAKE_CXX_FLAGS-in-build-information-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7ea6e35d3630f8c19080a0cb5a4a4c55c242a36b Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 12:40:57 -0600
-Subject: [PATCH] Do not include CMAKE_CXX_FLAGS in build information strin=
g
-
-While this information can be useful, it often includes information
-that may be specific to the build machine (like include paths with
-usernames, e.g. -I /home/myname/externalproject/fakeroot/inlcude).
-
-This causes issues for reproducible builds (resulting binaries will
-be different between different build machines).
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- cmake/CMakeLists.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
-index e0cde678db..e0d8fd0a17 100644
---- a/cmake/CMakeLists.txt
-+++ b/cmake/CMakeLists.txt
-@@ -1439,7 +1439,6 @@ if (Git_FOUND)
-   string(APPEND ORT_BUILD_INFO "git-branch=3D${ORT_GIT_BRANCH}, git-commi=
t-id=3D${ORT_GIT_COMMIT}, ")
- endif()
- string(APPEND ORT_BUILD_INFO "build type=3D${CMAKE_BUILD_TYPE}")
--string(APPEND ORT_BUILD_INFO ", cmake cxx flags: ${CMAKE_CXX_FLAGS}")
- configure_file(onnxruntime_config.h.in ${CMAKE_CURRENT_BINARY_DIR}/onnxru=
ntime_config.h)
- get_property(onnxruntime_GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY GENERA=
TOR_IS_MULTI_CONFIG)
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/00=
05-cmake-Print-out-result-of-find_package.patch b/meta-arago-extras/recipes=
-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_pack=
age.patch
deleted file mode 100644
index 249aadee..00000000
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmak=
e-Print-out-result-of-find_package.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a73d9b9f4dba6d164e128d6c768d1b0a04e969ab Mon Sep 17 00:00:00 2001
-From: Andrew Davis <afd@ti.com>
-Date: Thu, 16 Jan 2025 12:47:27 -0600
-Subject: [PATCH] [cmake] Print out result of find_package
-
-A verbose only message is already printed that states the CMake will
-attempt to find a package using find_package():
-
-> Trying find_package(...) before FetchContent
-
-But it never prints if the package was found this way or not.
-Add this result message.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrew Davis <afd@ti.com>
----
- cmake/external/helper_functions.cmake | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/cmake/external/helper_functions.cmake b/cmake/external/helper=
_functions.cmake
-index e3f2211f96..9ca6a967da 100644
---- a/cmake/external/helper_functions.cmake
-+++ b/cmake/external/helper_functions.cmake
-@@ -138,9 +138,12 @@ macro(onnxruntime_fetchcontent_makeavailable)
-         unset(__cmake_fpArgs)
-
-         if(${__cmake_contentName}_FOUND)
-+          message(VERBOSE "Found ${__cmake_contentName} with find_package=
()")
-           FetchContent_SetPopulated(${__cmake_contentName})
-           FetchContent_GetProperties(${__cmake_contentName})
-           continue()
-+        else()
-+          message(VERBOSE "Could not find ${__cmake_contentName} with fin=
d_package()")
-         endif()
-       endif()
-     else()
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.=
20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.=
1.bb
deleted file mode 100644
index a5026484..00000000
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
+++ /dev/null
@@ -1,157 +0,0 @@
-DESCRIPTION =3D "ONNX Runtime is a cross-platform, high performance machin=
e learning inferencing framework"
-SUMMARY =3D "ONNX Runtime Python package & C++ library"
-HOMEPAGE =3D "https://www.onnxruntime.ai/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f7e3b1308cb5c00b372a6e78835732=
d"
-
-SRC_URI =3D "\
-	git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=3Drel-=
1.20.1 \
-	git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Ddate;destsuffix=3D${S}/cmake/external/date \
-	git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dcpuinfo;destsuffix=3D${S}/cmake/external/cpuinfo \
-	git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dflatbuffers;destsuffix=3D${S}/cmake/external/flatbuffers \
-	git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Dsafeint;destsuffix=3D${S}/cmake/external/safeint \
-	git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3D3.4;name=3D=
eigen;destsuffix=3D${S}/cmake/external/eigen \
-	git://github.com/google/nsync.git;protocol=3Dhttps;branch=3Dmaster;name=
=3Dnsync;destsuffix=3D${S}/cmake/external/nsync \
-"
-SRC_URI +=3D "\
-	file://0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch \
-	file://0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch \
-	file://0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch \
-	file://0005-cmake-Print-out-result-of-find_package.patch \
-	file://0001-Remove-executable-permission-bit-from-source-files.patch \
-"
-
-SRCREV_FORMAT =3D "default"
-SRCREV =3D "5c1b7ccbff7e5141c1da7a9d963d660e5741c319"
-SRCREV_date =3D "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
-SRCREV_cpuinfo =3D "ca678952a9a8eaa6de112d154e8e104b22f9ab3f"
-SRCREV_flatbuffers =3D "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
-SRCREV_safeint =3D "4cafc9196c4da9c817992b20f5253ef967685bf8"
-SRCREV_eigen =3D "e7248b26a1ed53fa030c5c459f7ea095dfd276ac"
-SRCREV_nsync =3D "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
-
-# Only compatible with armv7a, armv7ve, and aarch64
-COMPATIBLE_MACHINE =3D "(^$)"
-COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
-COMPATIBLE_MACHINE:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","neon"=
,"(.*)","(^$)",d)}"
-COMPATIBLE_MACHINE:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","neon=
","(.*)","(^$)",d)}"
-
-DEPENDS +=3D "\
-	onnx \
-	abseil-cpp \
-	protobuf \
-	protobuf-native \
-	boost \
-	re2 \
-	nlohmann-json \
-	microsoft-gsl \
-"
-
-PYTHON_DEPENDS =3D "\
-	python3 \
-	python3-numpy \
-	python3-numpy-native \
-	python3-pybind11 \
-	python3-pybind11-native \
-"
-
-PYTHON_RDEPENDS =3D "\
-	python3 \
-	python3-onnx \
-	python3-numpy \
-	python3-protobuf \
-	python3-coloredlogs \
-	python3-flatbuffers \
-	python3-sympy \
-"
-
-OECMAKE_SOURCEPATH =3D "${S}/cmake"
-
-PACKAGECONFIG ??=3D "python sharedlib unittests acl"
-
-PACKAGECONFIG[python] =3D "-Donnxruntime_ENABLE_PYTHON=3DON, -Donnxruntime=
_ENABLE_PYTHON=3DOFF, ${PYTHON_DEPENDS}"
-PACKAGECONFIG[sharedlib] =3D "-Donnxruntime_BUILD_SHARED_LIB=3DON, -Donnxr=
untime_BUILD_SHARED_LIB=3DOFF"
-PACKAGECONFIG[unittests] =3D "-Donnxruntime_BUILD_UNIT_TESTS=3DON, -Donnxr=
untime_BUILD_UNIT_TESTS=3DOFF, googletest"
-
-PACKAGECONFIG[acl] =3D "-Donnxruntime_USE_ACL=3DON, -Donnxruntime_USE_ACL=
=3DOFF, arm-compute-library"
-PACKAGECONFIG[armnn] =3D "-Donnxruntime_USE_ARMNN=3DON, -Donnxruntime_USE_=
ARMNN=3DOFF, armnn"
-PACKAGECONFIG[armnn-relu] =3D "-Donnxruntime_ARMNN_RELU_USE_CPU=3DON, -Don=
nxruntime_ARMNN_RELU_USE_CPU=3DOFF"
-PACKAGECONFIG[armnn-bn] =3D "-Donnxruntime_ARMNN_BN_USE_CPU=3DON, -Donnxru=
ntime_ARMNN_BN_USE_CPU=3DOFF"
-
-EXTRA_OECMAKE:append =3D " \
-	-DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
-	-DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/cmake/external/date \
-	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/cmake/external/cpuinfo \
-	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/cmake/external/cpuinfo \
-	-DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/cmake/external/flatbuffers \
-	-DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/cmake/external/safeint \
-	-DFETCHCONTENT_SOURCE_DIR_EIGEN=3D${S}/cmake/external/eigen \
-	-DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/cmake/external/nsync \
-"
-
-EXTRA_OECMAKE:append =3D " \
-	-DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/protoc \
-	-Donnx_SOURCE_DIR=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR} \
-	-DPython_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
-	--compile-no-warning-as-error \
-	--log-level=3DVERBOSE \
-"
-
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '=
', d)}
-inherit python3-dir cmake
-
-do_install:append() {
-	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-
-	# Install test binaries and data in test package
-	install -d ${D}${bindir}/${BPN}-tests
-	install -m 0755 ${B}/libcustom_op_library.so ${D}${bindir}/${BPN}-tests
-	install -m 0755 ${B}/libcustom_op_get_const_input_test_library.so ${D}${b=
indir}/${BPN}-tests
-	install -m 0755 ${B}/libcustom_op_local_function.so ${D}${bindir}/${BPN}-=
tests
-	install -m 0755 ${B}/libcustom_op_invalid_library.so ${D}${bindir}/${BPN}=
-tests
-	install -m 0755 ${B}/libtest_execution_provider.so ${D}${bindir}/${BPN}-t=
ests
-	install -m 0755 ${B}/onnxruntime_customopregistration_test ${D}${bindir}/=
${BPN}-tests
-	install -m 0755 ${B}/onnxruntime_global_thread_pools_test ${D}${bindir}/$=
{BPN}-tests
-	install -m 0755 ${B}/onnxruntime_logging_apis_test ${D}${bindir}/${BPN}-t=
ests
-	install -m 0755 ${B}/onnxruntime_mlas_test ${D}${bindir}/${BPN}-tests
-	install -m 0755 ${B}/onnxruntime_perf_test ${D}${bindir}/${BPN}-tests
-	install -m 0755 ${B}/onnxruntime_shared_lib_test ${D}${bindir}/${BPN}-tes=
ts
-	install -m 0755 ${B}/onnxruntime_test_all ${D}${bindir}/${BPN}-tests
-	cp $CP_ARGS ${B}/testdata ${D}${bindir}/${BPN}-tests
-
-	# Install python tests and data
-	cp $CP_ARGS ${S}/onnxruntime/test/python/* ${D}${bindir}/${BPN}-tests
-
-	# Install the Python package.
-	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; =
then
-		install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-		cp $CP_ARGS ${B}/onnxruntime ${D}${PYTHON_SITEPACKAGES_DIR}
-		find ${D}${PYTHON_SITEPACKAGES_DIR} -name "libonnx*.so*" -exec rm {} \;
-	fi
-}
-
-# Add Python package
-PACKAGE_BEFORE_PN +=3D "python3-${PN}"
-FILES:python3-${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS:python3-${PN} +=3D "${PYTHON_RDEPENDS} onnxruntime"
-
-# Add Python tests package
-PACKAGE_BEFORE_PN +=3D "python3-${PN}-tests"
-FILES:python3-${PN}-tests +=3D "\
-	${bindir}/${BPN}-tests/*.py \
-	${bindir}/${BPN}-tests/contrib_ops \
-	${bindir}/${BPN}-tests/quantization \
-	${bindir}/${BPN}-tests/transformers \
-"
-RDEPENDS:python3-${PN}-tests +=3D "python3-${PN}"
-
-# Add tests package
-PACKAGE_BEFORE_PN +=3D "${PN}-tests"
-FILES:${PN}-tests =3D "${bindir}/${BPN}-tests"
-INSANE_SKIP:${PN}-tests +=3D "libdir"
-
-# package unversioned .so files in PN (they are not dev symlinks)
-FILES_SOLIBSDEV =3D "${libdir}/libonnxruntime.so"
-FILES:${PN} +=3D "${libdir}/libonnxruntime_providers_shared.so"
-
-INSANE_SKIP:${PN}-dbg +=3D "libdir"
diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.=
23.2.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.=
2.bb
new file mode 100644
index 00000000..f47523ca
--- /dev/null
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.bb
@@ -0,0 +1,163 @@
+DESCRIPTION =3D "ONNX Runtime is a cross-platform, high performance machin=
e learning inferencing framework"
+SUMMARY =3D "ONNX Runtime Python package & C++ library"
+HOMEPAGE =3D "https://www.onnxruntime.ai/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f7e3b1308cb5c00b372a6e78835732=
d"
+
+SRC_URI =3D "\                                                            =
                                                                           =
                                                             =20
+      git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=
=3Drel-1.23.2 \                                                            =
                                                                   =20
+      git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3Dma=
ster;name=3Ddate;destsuffix=3D${S}/_deps/date-src \                        =
                                                                     =20
+      git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmain;=
name=3Dcpuinfo;destsuffix=3D${S}/_deps/pytorch_cpuinfo-src \               =
                                                                     =20
+      git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3Dma=
ster;name=3Dflatbuffers;destsuffix=3D${S}/_deps/flatbuffers-src \          =
                                                                     =20
+      git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dmas=
ter;name=3Dsafeint;destsuffix=3D${S}/_deps/safeint-src \                   =
                                                                     =20
+      git://github.com/eigen-mirror/eigen.git;protocol=3Dhttps;branch=3Dma=
ster;name=3Deigen;destsuffix=3D${S}/_deps/eigen3-src \                     =
                                                                     =20
+      git://github.com/google/nsync.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Dnsync;destsuffix=3D${S}/_deps/google_nsync-src \                     =
                                                                     =20
+      git://github.com/boostorg/mp11.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dmp11;destsuffix=3D${S}/_deps/mp11-src \                             =
                                                                     =20
+      git://github.com/dmlc/dlpack.git;protocol=3Dhttps;branch=3Dmain;name=
=3Ddlpack;destsuffix=3D${S}/_deps/dlpack-src \                             =
                                                                     =20
+      git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts=
_2025_05_12;name=3Dabseil-cpp;destsuffix=3D${S}/_deps/abseil_cpp-src \=20
+      git://github.com/google/re2.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dre2;destsuffix=3D${S}/_deps/re2-src \
+"    =20
+SRC_URI +=3D "\
+	file://0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch \
+"
+
+SRCREV_FORMAT =3D "default"
+SRCREV =3D "a83fc4d58cb48eb68890dd689f94f28288cf2278"
+SRCREV_date =3D "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
+SRCREV_cpuinfo =3D "8a1772a0c5c447df2d18edf33ec4603a8c9c04a6"
+SRCREV_flatbuffers =3D "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
+SRCREV_safeint =3D "4cafc9196c4da9c817992b20f5253ef967685bf8"
+SRCREV_eigen =3D "1d8b82b0740839c0de7f1242a3585e3390ff5f33"
+SRCREV_nsync =3D "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
+SRCREV_mp11 =3D "0a0b5fb001ce0233ae3a6f99d849c0649e5a7361"
+SRCREV_dlpack =3D "5c210da409e7f1e51ddf445134a4376fdbd70d7d"
+SRCREV_abseil-cpp =3D "bc257a88f7c1939f24e0379f14a3589e926c950c"
+SRCREV_re2 =3D "6dcd83d60f7944926bfd308cc13979fc53dd69ca"
+
+#Only compatible with armv7a, armv7ve, and aarch64
+COMPATIBLE_MACHINE =3D "(^$)"
+COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
+COMPATIBLE_MACHINE:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","neon"=
,"(.*)","(^$)",d)}"
+COMPATIBLE_MACHINE:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","neon=
","(.*)","(^$)",d)}"
+
+DEPENDS +=3D "\
+	onnx \
+	protobuf \
+	protobuf-native \
+	boost \
+	nlohmann-json \
+	microsoft-gsl \
+"
+
+PYTHON_DEPENDS =3D "\
+	python3 \
+	python3-numpy \
+	python3-numpy-native \
+	python3-pybind11 \
+	python3-pybind11-native \
+"
+
+PYTHON_RDEPENDS =3D "\
+	python3 \
+	python3-onnx \
+	python3-numpy \
+	python3-protobuf \
+	python3-coloredlogs \
+	python3-flatbuffers \
+	python3-sympy \
+"
+
+OECMAKE_SOURCEPATH =3D "${S}/cmake"
+
+PACKAGECONFIG ??=3D "python sharedlib unittests acl"
+
+PACKAGECONFIG[python] =3D "-Donnxruntime_ENABLE_PYTHON=3DON, -Donnxruntime=
_ENABLE_PYTHON=3DOFF, ${PYTHON_DEPENDS}"
+PACKAGECONFIG[sharedlib] =3D "-Donnxruntime_BUILD_SHARED_LIB=3DON, -Donnxr=
untime_BUILD_SHARED_LIB=3DOFF"
+PACKAGECONFIG[unittests] =3D "-Donnxruntime_BUILD_UNIT_TESTS=3DON, -Donnxr=
untime_BUILD_UNIT_TESTS=3DOFF, googletest"
+
+PACKAGECONFIG[acl] =3D "-Donnxruntime_USE_ACL=3DON, -Donnxruntime_USE_ACL=
=3DOFF, arm-compute-library"
+PACKAGECONFIG[armnn] =3D "-Donnxruntime_USE_ARMNN=3DON, -Donnxruntime_USE_=
ARMNN=3DOFF, armnn"
+PACKAGECONFIG[armnn-relu] =3D "-Donnxruntime_ARMNN_RELU_USE_CPU=3DON, -Don=
nxruntime_ARMNN_RELU_USE_CPU=3DOFF"
+PACKAGECONFIG[armnn-bn] =3D "-Donnxruntime_ARMNN_BN_USE_CPU=3DON, -Donnxru=
ntime_ARMNN_BN_USE_CPU=3DOFF"
+
+
+EXTRA_OECMAKE:append =3D " \                                              =
                                                                           =
                                                             =20
+      -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \                            =
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/_deps/date-src \              =
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/_deps/pytorch_cpuin=
fo-src \                                                                   =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/_deps/pytorch_cpuinfo-=
src \                                                                      =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/_deps/flatbuffers-src \=
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/_deps/safeint-src \        =
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_EIGEN3=3D${S}/_deps/eigen3-src \          =
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/_deps/google_nsync-src=
 \                                                                         =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_ABSEIL_CPP=3D${S}/_deps/abseil_cpp-src \=20
+      -DFETCHCONTENT_SOURCE_DIR_MP11=3D${S}/_deps/mp11-src \              =
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_DLPACK=3D${S}/_deps/dlpack-src \          =
                                                                           =
                                                               =20
+      -DFETCHCONTENT_SOURCE_DIR_RE2=3D${S}/_deps/re2-src \=09
+"   =20
+EXTRA_OECMAKE:append =3D " \
+	-DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/protoc \
+	-Donnx_SOURCE_DIR=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR} \
+	-DPython_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+        --compile-no-warning-as-error \
+	--log-level=3DVERBOSE \
+"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '=
', d)}
+inherit python3-dir cmake
+
+do_install:append() {
+	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
+
+	# Install test binaries and data in test package
+	install -d ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_library.so ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_get_const_input_test_library.so ${D}${b=
indir}/${BPN}-tests
+	install -m 0755 ${B}/libcustom_op_local_function.so ${D}${bindir}/${BPN}-=
tests
+	install -m 0755 ${B}/libcustom_op_invalid_library.so ${D}${bindir}/${BPN}=
-tests
+	install -m 0755 ${B}/libtest_execution_provider.so ${D}${bindir}/${BPN}-t=
ests
+	install -m 0755 ${B}/onnxruntime_customopregistration_test ${D}${bindir}/=
${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_global_thread_pools_test ${D}${bindir}/$=
{BPN}-tests
+	install -m 0755 ${B}/onnxruntime_logging_apis_test ${D}${bindir}/${BPN}-t=
ests
+	install -m 0755 ${B}/onnxruntime_mlas_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_perf_test ${D}${bindir}/${BPN}-tests
+	install -m 0755 ${B}/onnxruntime_shared_lib_test ${D}${bindir}/${BPN}-tes=
ts
+	install -m 0755 ${B}/onnxruntime_test_all ${D}${bindir}/${BPN}-tests
+	cp $CP_ARGS ${B}/testdata ${D}${bindir}/${BPN}-tests
+
+	# Install python tests and data
+	cp $CP_ARGS ${S}/onnxruntime/test/python/* ${D}${bindir}/${BPN}-tests
+
+	# Install the Python package.
+	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; =
then
+		install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+		cp $CP_ARGS ${B}/onnxruntime ${D}${PYTHON_SITEPACKAGES_DIR}
+		find ${D}${PYTHON_SITEPACKAGES_DIR} -name "libonnx*.so*" -exec rm {} \;
+	fi
+}
+
+# Add Python package
+PACKAGE_BEFORE_PN +=3D "python3-${PN}"
+FILES:python3-${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:python3-${PN} +=3D "${PYTHON_RDEPENDS} onnxruntime"
+
+# Add Python tests package
+PACKAGE_BEFORE_PN +=3D "python3-${PN}-tests"
+FILES:python3-${PN}-tests +=3D "\
+	${bindir}/${BPN}-tests/*.py \
+	${bindir}/${BPN}-tests/contrib_ops \
+	${bindir}/${BPN}-tests/quantization \
+	${bindir}/${BPN}-tests/transformers \
+"
+RDEPENDS:python3-${PN}-tests +=3D "python3-${PN}"
+
+# Add tests package
+PACKAGE_BEFORE_PN +=3D "${PN}-tests"
+FILES:${PN}-tests =3D "${bindir}/${BPN}-tests"
+INSANE_SKIP:${PN}-tests +=3D "libdir"
+
+# package unversioned .so files in PN (they are not dev symlinks)
+FILES_SOLIBSDEV =3D "${libdir}/libonnxruntime.so"
+FILES:${PN} +=3D "${libdir}/libonnxruntime_providers_shared.so"
+
+INSANE_SKIP:${PN}-dbg +=3D "libdir"
--=20
2.34.1


