Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA74EC1451
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:56:48 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18762.1772546200893688568
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=W4DsEscb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.11, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6p+23Wvqfw9URIrjEBfOQXTN5AkDfXlqZU3GQYlIpiu5UMZd0knw7Ar49UKnxtdBm0WS61FDEppYkwKDPn0maYwbO66rZxmSxcqXfFAowAjnt90xCPZ9dHtNBW0EIu/CeYFYkb9KTOOqYQNdtBIOeU4Sih4d/h752uU8rfyHhIjarCl+BFK7MXmBc2AKAepZia/Ihky7zLDcu/UhGBZNP/7vvjclGt7LvQlNb1B3Egj+rwmxvpBHISDADvDrZirNTxFgOSD19ecEZHfgTTrr31gfq7kYHqvI0eSo0uhPFm4VcrpAEWJuIDD4QpL4WRNUH93N05NZy3viC9lAnBCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0pQFX8thyW+J+3k5TbE1RuS5fE8qHKGG0qlXYFoyjE=;
 b=TnflEqor7VvVMvGGIqWfXfip72iIi8bW2rnby+sag9VtCVJ4zV5nBI3QYsOlhVmEdY3Wd9OsBcsHJz4m9YsIAX+oZl3yt7cB14FRNM86AyMC0I2mpOesxsyExjEgukWx1b2CzVZuzqDKRG5AO+FgpXdgLMtzgR9BNdljEmb4tEOyJBOR0Fz8HOBpjftldw2mP6jQLop2QrBW35SapwH57+Hpr+Bhuns2RxPLdbEERi9i5pvoFpRg8Hw6YSgdrM6bxh9SKgJyfDiVbeSzHKUznfciDhvdRHzeJRzlrsNU6FkSv/MBfXuxt6BKQX74ad355wZm847l4XeIniWMCis/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0pQFX8thyW+J+3k5TbE1RuS5fE8qHKGG0qlXYFoyjE=;
 b=W4DsEscbMiHR0YmJLwGAxSpXRaC5rLhOcc+DP38cjlOByeBZsbPtpibV6pCorZF3FiqdWziiyGYI9AH4JBDuB9U/84tbHep1C2iU8xsxoDdPM+Y07AZ/fM3kjse7q5Uv5qYpj6NXygZz3czH1v+lxOCtpzJJc8NBRt1R16GAWJU=
Received: from SJ0PR03CA0120.namprd03.prod.outlook.com (2603:10b6:a03:333::35)
 by SA1PR10MB5823.namprd10.prod.outlook.com (2603:10b6:806:235::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:56:37 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::60) by SJ0PR03CA0120.outlook.office365.com
 (2603:10b6:a03:333::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Tue,
 3 Mar 2026 13:56:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 13:56:36 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 07:56:35 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 07:56:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 07:56:35 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623DuPkQ2219689;
	Tue, 3 Mar 2026 07:56:32 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v3 2/2] onnxruntime: upgrade 1.20.1 -> 1.23.2
Date: Tue, 3 Mar 2026 19:26:23 +0530
Message-ID: <20260303135623.2564012-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303135623.2564012-1-p-deshmukh@ti.com>
References: <20260303135623.2564012-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SA1PR10MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb46b3f-7eee-457a-1901-08de792caf9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	zHHB7FRDCsZc/5PtIWS2cnuIIBi8X6xh0UQghiZL8DRWBkiCXX0BOyhYrE40dgqkPgCMaDtsEYR12DoWmqrcJhvmv5ySGsDOeBZ0O2Fb7XRvj4+4eLHeRgrrHJUAbkrnVwQaorgmIfEnwzOV+NmVkjDUkvbkvn4LhpXMstbQU2TaoKYaD6Lpj5YG0RVFByDwmS1qgP4uOx75JhDeb2VcNkmcgdL9P8jlOMEy3Y8dseLjvMQm366aO5c2T5K4rRirDFnu006jfqZTdm/X3UBuKzDp8uHxBszgPtbq+YJ3qdZb3QV2x5htDJKqD41VWCfTpsCGaN02gW38+mUXfaiC0qL28JHa3p1HkXw823r2185NQp5imXITz7R1g1M2mYxVaeNxMrDbNRxlIT6Ph6clPkg1cz4tMcnqJrINqmAl9T3FhQjqinidtuHo0kLEUuXmnHkZtAFnS78U69IDa6EUeDimqKhpRPGf6D1zUAfOCtKXkbbbL6e/R2K2mA4eLFZE3MNDOs+p45vdHJJaK4kNPNsvta3KfkQSsPUAYMMNmJrpqpA6tctEH0TXW06p5Ya2uLJoeKDLziaemDX1A2X6kTMUsR7VkA/cjZfrdbigesU52vS3/W8LWwdVAWL+x83lwTMylOl7H3GHYUco6A+iKzbgEpQbZ/waKnD4+XdwZHjCf4tc8ELHCwlqpk/9eVlk3CbnBfG0Ij0K9vdUgHl8PfInW5TANrmSxUaAD/cQxpU8bpZ6B2AzqTcUYpmbjI0ha5gZoYaujf7IZ07D6yuDC3nREPqmEcKhVPgFNw4yc5o=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dUDxQGf1zH5Zp2IxESVtGM5Vr0Kn7j3mPtnApLnpEpttBEg0s9zLVKhRBKgG+dSs/G4PBc5eYLrRrD0TwqogYp5glNJJbCwZrZlgt4X+EAiFWfX/7lNXQ6Rc8AEJuEUlvyiQULM9wZTRFEvFUbnl1nG7qcselgqJ5bO/e+YBhYtBBCtmTO0ZgczJ6LpJc4UnpaGJC/+qWsWDzngB2Mf9RlKyOPJ/uRrlX6d+JoKA0bODSnp2VYpRc5mHK3Vfu6b9dKTmgRfLjRIB6MoOhGq9lHAztO5txloyJZ9/zVmylroY7+v2JyiKSqcHBPYQnUce5zYXQ1kxBR/TaV3HFAo6BvSuTSF25mgmBup1zrMxstKXbqa90UqWxoU8G94QeUpYpwo0AgA1h6xCowogqmsabiXR5ITg8owbBIJw7SFQ5jwSVHqgs0mEEDJci3wMS6Rb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:56:36.3480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb46b3f-7eee-457a-1901-08de792caf9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5823
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:56:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17195

We are migrating ONNXRuntime from v1.20.1 to the latest
stable version v1.23.2.

Removed Patches (Fixed Upstream):
  =E2=80=A2 0001-Remove-executable-permission-bit-from-source-files.patch
    - Commit Link: https://github.com/microsoft/onnxruntime/commit/392961ff=
aef52f5a51c230e26df8c16492580160
  =E2=80=A2 0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
    - Commit Link: https://github.com/microsoft/onnxruntime/commit/fd22509e=
3645a23e62c51680b534201c324d3342
  =E2=80=A2 0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
    - Commit Link: https://github.com/microsoft/onnxruntime/commit/49e94da6=
8244fa51c28396d0642707121eacc527
  =E2=80=A2 0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
    - Commit Link: https://github.com/microsoft/onnxruntime/commit/3fb2dc73=
f53b84b3df81639eb6340c1bb5ec774d
  =E2=80=A2 0005-cmake-Print-out-result-of-find_package.patch
    - With the updated helper_functions.cmake this patch is no longer neede=
d.

  Added Patches (New Requirements):
  =E2=80=A2 0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch
    - Fixes missing stdint.h include causing uint32_t compilation errors

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:

v2 -> v3:
 - No Changes

v1 -> v2:
 - Added commit links for the removed ONNXRuntime patches

 ...g-header-to-fix-uint32_t-compilation.patch | 27 +++++++
 ...ble-permission-bit-from-source-files.patch | 72 -------------------
 ...-in-option-text-s-buildings-bindings.patch | 25 -------
 ...D_LIBRARY_PATH-to-search-path-when-n.patch | 32 ---------
 ...MAKE_CXX_FLAGS-in-build-information-.patch | 30 --------
 ...ake-Print-out-result-of-find_package.patch | 37 ----------
 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} | 68 ++++++++++--------
 7 files changed, 64 insertions(+), 227 deletions(-)
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
 rename meta-arago-extras/recipes-framework/onnxruntime/{onnxruntime_1.20.1=
.bb =3D> onnxruntime_1.23.2.bb} (46%)

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
20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.=
2.bb
similarity index 46%
rename from meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.2=
0.1.bb
rename to meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.=
2.bb
index a5026484..f47523ca 100644
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.bb
@@ -4,33 +4,37 @@ HOMEPAGE =3D "https://www.onnxruntime.ai/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f7e3b1308cb5c00b372a6e78835732=
d"
=20
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
 SRC_URI +=3D "\
-	file://0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch \
-	file://0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch \
-	file://0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch \
-	file://0005-cmake-Print-out-result-of-find_package.patch \
-	file://0001-Remove-executable-permission-bit-from-source-files.patch \
+	file://0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch \
 "
=20
 SRCREV_FORMAT =3D "default"
-SRCREV =3D "5c1b7ccbff7e5141c1da7a9d963d660e5741c319"
+SRCREV =3D "a83fc4d58cb48eb68890dd689f94f28288cf2278"
 SRCREV_date =3D "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
-SRCREV_cpuinfo =3D "ca678952a9a8eaa6de112d154e8e104b22f9ab3f"
+SRCREV_cpuinfo =3D "8a1772a0c5c447df2d18edf33ec4603a8c9c04a6"
 SRCREV_flatbuffers =3D "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
 SRCREV_safeint =3D "4cafc9196c4da9c817992b20f5253ef967685bf8"
-SRCREV_eigen =3D "e7248b26a1ed53fa030c5c459f7ea095dfd276ac"
+SRCREV_eigen =3D "1d8b82b0740839c0de7f1242a3585e3390ff5f33"
 SRCREV_nsync =3D "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
+SRCREV_mp11 =3D "0a0b5fb001ce0233ae3a6f99d849c0649e5a7361"
+SRCREV_dlpack =3D "5c210da409e7f1e51ddf445134a4376fdbd70d7d"
+SRCREV_abseil-cpp =3D "bc257a88f7c1939f24e0379f14a3589e926c950c"
+SRCREV_re2 =3D "6dcd83d60f7944926bfd308cc13979fc53dd69ca"
=20
-# Only compatible with armv7a, armv7ve, and aarch64
+#Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
 COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
 COMPATIBLE_MACHINE:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","neon"=
,"(.*)","(^$)",d)}"
@@ -38,11 +42,9 @@ COMPATIBLE_MACHINE:armv7ve =3D "${@bb.utils.contains("TU=
NE_FEATURES","neon","(.*)"
=20
 DEPENDS +=3D "\
 	onnx \
-	abseil-cpp \
 	protobuf \
 	protobuf-native \
 	boost \
-	re2 \
 	nlohmann-json \
 	microsoft-gsl \
 "
@@ -78,22 +80,26 @@ PACKAGECONFIG[armnn] =3D "-Donnxruntime_USE_ARMNN=3DON,=
 -Donnxruntime_USE_ARMNN=3DOFF,
 PACKAGECONFIG[armnn-relu] =3D "-Donnxruntime_ARMNN_RELU_USE_CPU=3DON, -Don=
nxruntime_ARMNN_RELU_USE_CPU=3DOFF"
 PACKAGECONFIG[armnn-bn] =3D "-Donnxruntime_ARMNN_BN_USE_CPU=3DON, -Donnxru=
ntime_ARMNN_BN_USE_CPU=3DOFF"
=20
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
=20
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
 EXTRA_OECMAKE:append =3D " \
 	-DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/protoc \
 	-Donnx_SOURCE_DIR=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR} \
 	-DPython_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
-	--compile-no-warning-as-error \
+        --compile-no-warning-as-error \
 	--log-level=3DVERBOSE \
 "
=20
--=20
2.34.1


