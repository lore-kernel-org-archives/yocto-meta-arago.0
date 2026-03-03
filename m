Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2751E67A8D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 08:11:36 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13617.1772525494965038412
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 00:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PjrBeBHU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.55, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAJQi8DouKti1Qj9JOD4HfmxGat6Hk2d/gXdEiXHAZXTUFc+ULqskMe57MxsmaWBcJVM7uC94hPJOBMdHyJ7aJkOQUPL3ncxANXxie1PmmSIJp4YxZC+yZc9sfuIPLbpIm6jE99U8DBLpFKuzHLXnVFIBbwAouJbXyJXCj5ub82Qxmj3ixpG40i49UIq0yMIeEHJBq7vqjuf23RJhD0MRiF4w7YiA4fLpQXAdAxP/N1I3zT6J+kl3QpF14Tyi+RjA+0Mp1/wENXxJhen3a8okvup+KUK+UWAOguoW6d2c6pJaC/ubifpOsEmMwaKEEfrUpUXff7N83gB12WTy8b/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MMoa/ChvHAE4YYrPMm2jM0YCgTMHQTquNn+8/ZCvfw=;
 b=XGF3V3Jv5tLgQTu87Spd6NCxEDlcTnBfZ/3cVbKfDcibpu0XyXr/Lw83QXOsV0qWgihY3nu/JisDBv2OXuCcXfDzRupajKX1DIbuJr4DRB8SDLwo1zdf68yCfmOpNCm+PpgrSLKSGeR05VQENNX/6WwB2vVnuhk+/leShIAt7czt00YGRCC+4x55cyN/CWqWR9QNXSQaTr+x2om5eVm7SYi60eiJL1xeHfwrAeDb9r6f4yNU9maD+X8UZRi5mDjQ2IjDVkp2raBK96To8TM8B2ULmdkIkjOxky8V8n1H/d+JExYI4ajaQXisz6T8aaRsc4x+woo5L6t6p0LvLOSmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MMoa/ChvHAE4YYrPMm2jM0YCgTMHQTquNn+8/ZCvfw=;
 b=PjrBeBHUfRFf7EJrdLhZhttfN5IshuFQkarJuqRMqg+/9pzwk/3WxPm0s+Q95f72lU3ScG9mYoDs8vaLDnuVqWqKWEJVrg0ZJJmkZdp+x/w78c7Aw/FOlUdyxxf5J/H0skN9kaLzihh5DOKi3KP+TjdLLBqWYgGgcfGCv1xK1Dc=
Received: from BN0PR04CA0018.namprd04.prod.outlook.com (2603:10b6:408:ee::23)
 by DM4PR10MB6159.namprd10.prod.outlook.com (2603:10b6:8:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 08:11:30 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::ce) by BN0PR04CA0018.outlook.office365.com
 (2603:10b6:408:ee::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 08:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 08:11:29 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:11:16 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:11:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 02:11:16 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6238B6GI2262442;
	Tue, 3 Mar 2026 02:11:14 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 2/2] onnxruntime:upgrade 1.20.1 to 1.23.2
Date: Tue, 3 Mar 2026 13:41:05 +0530
Message-ID: <20260303081105.2111463-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303081105.2111463-1-p-deshmukh@ti.com>
References: <20260303081105.2111463-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|DM4PR10MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: dbab0140-0232-4fa4-3ba6-08de78fc7932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	KDWeuHxRapt2KcF2b8B0pb5+n46Gzld0MvUr1Tmmd+F2WhwsZIrV3AEaGT/I/OUcOnQQyp4evw2eWmjBfbqe0JjfmWSDvAYstki4OFwM5zCZwok1mGeDxK8ih2AV5XWchmWn8b0YKZmfdhA1Twv3BckR/AEqN8RYH4ow5m9tYegVqDujXAkRFOkWkuha9YSt58ZFDuBm4MEQKRXY5U8hx10lh+dvXYsb5wrdOxON5A2zq//pSAGmxinAT1jZTqOr9nmuiRLKQ47zM862N/PMDFza7vnro8E0K5qt75TrrQh97Ke8x3I2P4sebqJld9Wdbb9VyEdo2jixJuOxtPNwuZfps/WrPykM5jARiYhdUok9uPgwvv+7t2sR5W4HhrPvv1jot8Kci9Ls4tLqTw1kf68Rg4PlwySQ09Pnz3aEz9bssJzSAszjpfMOxoqEbCe29q8/a85PHThZ2vSiGCpRomLyxAsY/D7LaMCQIc573J6saybiu5pZw95n0hf00cWa3sKdCC7/Wzn1bTxLyWgjw+7xszNM07wEMvHf9gaIAunjv6ltb5wnBgYEyY0Eu5OLcmL/+gTlq24x50e3Ix4NHjDgySqDX+2SjnJCc2Y0Beg3iAtwz+yxH4JQ64Huh/2ChZ2p9te/nykFNyEoDcCOtgdqrMUB2s6mGRlfHvtfuugWFav6sb12rg698O0bNQn0Ee4bdSlNfKDBc0N2c187lfugodaAwJGJNOMk/Ar6q1wC6BtA8uYmRcTuNxH63rRYoMe8rCxt0rw/g1PRmqm6pF0xix//sd2OY18E7zpp5bQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sbZ6/HNeNzFn1nh2T1289fGsVRWMHIHHDN/ccR3+p8DClN8Ln9WT1VOSuxXgqIdnC3/1CBei0EYNDKS30Piv6LF+Bf9CFToZMwO0rAbQ6Z5de8DCbL7rfGoJL8OXJbrDKzMSOjKMnzwYGh311NyYcMfJcT1BZwv24tGC+S+U2AvzMR4it4Xy7iPRsvYTWbdQb3GPHo2D0pek+aU2uDVzbcEztlRpE2PEvTyLkUfiDLGYXzUvlzBxRBZMIt37hrgs0N8oRFr/YbGN+x4RZM83xOddaeM510ii9QeiAkrJQKKu0kLbhHbZdwWsAgPesCUfySne19DxlB6woaBQXaWssiHZcqsOlHZX8uPqKw2i+Axg5+L4BNyZKAKqvsrBQ0jh54r0/X9+tiMsctU5dvS5m1C1qp4f32oUunT0ARM1Joc8Sp3NAe0FlPYFeCLkaiE5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:11:29.2411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbab0140-0232-4fa4-3ba6-08de78fc7932
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6159
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 08:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17188

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


