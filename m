Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E400EC1459
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:30:09 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19625.1772548201581333183
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 06:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=S2PwjTUj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.4, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6TBsFtEuHZbXq99hCWiwETK85anV5q/PteLJs2BROn+nAlWEWccmUlTZF8hi7sxz/cEu2ujvvhJGY/AyP/ugqm2lIwIUPSAUnM/Avlk+8QL4OMIEsqkoqTrLZkcr7IuDMEzsId+vALqAyjlIpKJ/Plsnrc9warB1GdNAhuAyCuAUdHE/tWSfsWS7mb0ebcy+0uqgksba0Y1DuTVh4ZFp+HFxgIuMD7VvvO6wBZLp0utvjwx+V5J75odsvthrpGAV08nuW8E+kDTqh4aVnQfQptWqPN31BC/AbPstgLs2pimqmuzd3fj89UohTjORZWfjNsZHf7x0WaXqn2JK7jGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nONZ/Mk0Q8wv1ttbDtAkEE/tQc4b5tnaYQm+sI+dFp4=;
 b=HCUolrlyTGvBEo78FayOyJLRGWoIc4UqElOYJi/TTmVeeDv5duhv+RrI5v+JAy9XDm2++hN8Fdu20bJfH/rW/kz9vKyu45QMBzxqA6v6NqiglTb+0WgljCH9fp6AGcFoJ2wyj2+01mZn2JhazG9Y/wq+nC6GLa1pqgUAsKqUL1msRD3Y/hMgdAD+FqMEKOnlBljiWz6XRTaekLF7DjPssRc8AFhLNLezE1KpSRUQC2vTGobW3Nsn4DIk9gQOOper7X60RYwNtTp9oqgxbjehRENTCKigHCxLWRFy32v/mtRF1yp2WVjh6MatbDYPUhLx2cHMeJs0vt5DGw8iE/RpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nONZ/Mk0Q8wv1ttbDtAkEE/tQc4b5tnaYQm+sI+dFp4=;
 b=S2PwjTUjgI/UScgaAkQ+MBeqAfE7xAuIQhPySAV9KgKm5L4wLBw3AHWVQP6yrmx238ARwkIA/Or+N1HjL+AnkzO1lkURwNuBcWLgeWQOyIlR7GWd8NewjWKXdaAcFFeSZED76aeiHjcRffBV/BG911+9HV0Ui0rnYCMe6EbnZGo=
Received: from SJ0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:a03:2c2::6)
 by CO1PR10MB4642.namprd10.prod.outlook.com (2603:10b6:303:6f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:29:57 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::c7) by SJ0PR13CA0031.outlook.office365.com
 (2603:10b6:a03:2c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Tue,
 3 Mar 2026 14:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 14:29:56 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:29:55 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:29:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:29:54 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623ETsgQ2758541;
	Tue, 3 Mar 2026 08:29:54 -0600
Message-ID: <15b3b1ca-3ae9-43b5-a531-5a51fdf30a6a@ti.com>
Date: Tue, 3 Mar 2026 08:29:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/2] onnxruntime:upgrade 1.20.1 to
 1.23.2
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>
References: <20260303081105.2111463-1-p-deshmukh@ti.com>
 <20260303081105.2111463-3-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260303081105.2111463-3-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|CO1PR10MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b9ad13-55d7-4404-264f-08de793157b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	oAHBGnuj5t6P9rxC7Qpx5MBYDwEzND/61uV3CuJuVMIJiWxVKQW3YPnn0eeCTDCbAOw++UVoXvoGnRNU/n+yvJY1Od9ruc5ksiyCBtTs1y5W/jqQkkV8lYAUXNEx5SbLJx4vH7Q3auqmU+Wbx9Hlx88Vy63oBBvM0ch/hjvwivsEHa0Xc/oECrOhC6hyrGNqFwPxEWbGeBfZPj+b4eJGIoniU5FNrk9sWxBgWTpxHrvyq/r2ScpT4U6aW4n8rQvoYm+O0RrTzVzonUzMi6CfET4ybGhUAhHpN+xNPyOC/1HfIcI2090MmMitq/Rn8+fYshn0X1+5CCVSMBSrLEieSlU0cSSDM6BY2pgKxE/L3AlqQnqiumsIPsG64DdphBixOTwUh4I0GEJPFhVKdw9hODp2MaLcSWniQt+oPEvS/oaccR7obSEljA6wnMzYhudQUI1v/C/+xGjeZnbUNN4zQP0guqwdk6PY0e7lpsKcXFpUA3qRUa3cLXtQAinQGqbVaV5ciOTJ4q/iH4/ZP40S0+MOBrxfT8bRpZel1QtUU+8wat0K7Y983cU/l8j8HO+B0HgQ8U7FywYtyWpSFX97y+8U7vH6512njvUoiSruBv5/9l6BhuV9iOPSDlc6CrcuEUh7gZ5EirB1ehAT+RQuIvQV+lxVAcB6Smf+2JID0VxXXefvlp5AsSHZuY1I+7bOqaSs113NQndQrw366H4s4ftedVDRangk1kxBJ4TS2S6P8Xs8XeHrY4kta7g7zjxplffVGchLlddizqaxsaOW/TGn6+Z1vlZjKjGLInRyMrk=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8mhjsWZCAzCE9OPtqas1y3eTmLIN4WjnX+JVweuTVCjNtsbxXYgiik0hcmzT3gO4/ahKZT48q1OuU7hNNTGTY/dcdOcdfjovwysIbmK4yvgW69gA0DjB+JuvCN+0qYQgd3ILBo6pOfwGYMUYKAoMbvzJYHgpKOZ8k1gcyk8ti4+/Ts/9bTuvnNafvlYlbCf/iNStPYiHtLVGqJo5kOZFtUiAW8kFGhlWVnyx9+KqjMq64RPwhvAj8M/+1jYlEGQvrdD9tB8D8wZEnhJ/fhNXghuj7jSEuZdawYQKyaVhITbTI386LU3HSw7gvPMQfjne9nvvuvY4IpJCSOjpwP0cvY1KYtPNp9OPrw+ljSWBEXBqbCvkiZL9TiBuqgTVbgIyOfQraYTf3gPJGDVBSKxdXgNLtG5m6L8veREZb4TcFYm24qlcLboVe6ew6PIS410R
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:29:56.3818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b9ad13-55d7-4404-264f-08de793157b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 14:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17198

On 3/3/26 2:11 AM, Pratham Deshmukh wrote:
> We are migrating ONNXRuntime from v1.20.1 to the latest
> stable version v1.23.2.
>=20
> Removed Patches (Fixed Upstream):
>    =E2=80=A2 0001-Remove-executable-permission-bit-from-source-files.patc=
h
>      - Commit Link: https://github.com/microsoft/onnxruntime/commit/39296=
1ffaef52f5a51c230e26df8c16492580160
>    =E2=80=A2 0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patc=
h
>      - Commit Link: https://github.com/microsoft/onnxruntime/commit/fd225=
09e3645a23e62c51680b534201c324d3342
>    =E2=80=A2 0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.pa=
tch
>      - Commit Link: https://github.com/microsoft/onnxruntime/commit/49e94=
da68244fa51c28396d0642707121eacc527
>    =E2=80=A2 0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.pa=
tch
>      - Commit Link: https://github.com/microsoft/onnxruntime/commit/3fb2d=
c73f53b84b3df81639eb6340c1bb5ec774d
>    =E2=80=A2 0005-cmake-Print-out-result-of-find_package.patch
>      - With the updated helper_functions.cmake this patch is no longer ne=
eded.
>=20
> Added Patches (New Requirements):
>    =E2=80=A2 0001-Added-the-missing-header-to-fix-uint32_t-compilation.pa=
tch
>      - Fixes missing stdint.h include causing uint32_t compilation errors
>=20
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>   ...g-header-to-fix-uint32_t-compilation.patch | 27 +++++++
>   ...ble-permission-bit-from-source-files.patch | 72 -------------------
>   ...-in-option-text-s-buildings-bindings.patch | 25 -------
>   ...D_LIBRARY_PATH-to-search-path-when-n.patch | 32 ---------
>   ...MAKE_CXX_FLAGS-in-build-information-.patch | 30 --------
>   ...ake-Print-out-result-of-find_package.patch | 37 ----------
>   ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} | 68 ++++++++++--------
>   7 files changed, 64 insertions(+), 227 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnx=
runtime/0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch
>   delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnx=
runtime/0001-Remove-executable-permission-bit-from-source-files.patch
>   delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnx=
runtime/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
>   delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnx=
runtime/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
>   delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnx=
runtime/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
>   delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnx=
runtime/0005-cmake-Print-out-result-of-find_package.patch
>   rename meta-arago-extras/recipes-framework/onnxruntime/{onnxruntime_1.2=
0.1.bb =3D> onnxruntime_1.23.2.bb} (46%)
>=20
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/=
0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch b/meta-arag=
o-extras/recipes-framework/onnxruntime/onnxruntime/0001-Added-the-missing-h=
eader-to-fix-uint32_t-compilation.patch
> new file mode 100644
> index 00000000..21e0a301
> --- /dev/null
> +++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Ad=
ded-the-missing-header-to-fix-uint32_t-compilation.patch
> @@ -0,0 +1,27 @@
> +From cb67823df8cfa19cf1c0c0ddd1b9aa29ee7773ba Mon Sep 17 00:00:00 2001
> +From: Pratham Deshmukh <p-deshmukh@ti.com>
> +Date: Thu, 12 Feb 2026 16:02:40 +0530
> +Subject: [PATCH] Added the missing header to fix uint32_t compilation er=
ror.
> +
> +Upstream-Status: Backport [https://github.com/microsoft/onnxruntime/comm=
it/d6e712c]
> +
> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> +---
> + onnxruntime/core/common/semver.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/onnxruntime/core/common/semver.h b/onnxruntime/core/common/=
semver.h
> +index a07c24f016..98bb6a2cef 100644
> +--- a/onnxruntime/core/common/semver.h
> ++++ b/onnxruntime/core/common/semver.h
> +@@ -3,6 +3,7 @@
> +
> + #pragma once
> +
> ++#include <cstdint>
> + #include <optional>
> + #include <string_view>
> +
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/=
0001-Remove-executable-permission-bit-from-source-files.patch b/meta-arago-=
extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-executable-per=
mission-bit-from-source-files.patch
> deleted file mode 100644
> index b64e32ca..00000000
> --- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Re=
move-executable-permission-bit-from-source-files.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From 626066499c34c524924302342fc071f32442caae Mon Sep 17 00:00:00 2001
> -From: Andrew Davis <afd@ti.com>
> -Date: Sun, 12 Jan 2025 12:48:49 -0600
> -Subject: [PATCH] Remove executable permission bit from source files
> -
> -These are source files, not executables, do not set the executable
> -permission bit on these files.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andrew Davis <afd@ti.com>
> ----
> - onnxruntime/contrib_ops/cpu/utils/console_dumper.h           | 1 +
> - onnxruntime/core/optimizer/bias_softmax_fusion.cc            | 0
> - onnxruntime/core/providers/acl/acl_execution_provider.h      | 0
> - onnxruntime/core/providers/acl/acl_fwd.h                     | 0
> - onnxruntime/core/providers/acl/acl_provider_factory.cc       | 0
> - onnxruntime/core/providers/acl/math/gemm.cc                  | 0
> - onnxruntime/core/providers/acl/nn/batch_norm.cc              | 0
> - onnxruntime/core/providers/acl/nn/batch_norm.h               | 0
> - onnxruntime/test/optimizer/graph_transform_test.cc           | 0
> - onnxruntime/test/optimizer/graph_transform_test_layernorm.cc | 0
> - 10 files changed, 1 insertion(+)
> - mode change 100755 =3D> 100644 onnxruntime/core/optimizer/bias_softmax_=
fusion.cc
> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_execu=
tion_provider.h
> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_fwd.h
> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_provi=
der_factory.cc
> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/math/gemm=
.cc
> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/nn/batch_=
norm.cc
> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/nn/batch_=
norm.h
> - mode change 100755 =3D> 100644 onnxruntime/test/optimizer/graph_transfo=
rm_test.cc
> - mode change 100755 =3D> 100644 onnxruntime/test/optimizer/graph_transfo=
rm_test_layernorm.cc
> -
> -diff --git a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h b/onnxru=
ntime/contrib_ops/cpu/utils/console_dumper.h
> -index 9ebc44f441..64bd2b7b18 100644
> ---- a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
> -+++ b/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
> -@@ -3,6 +3,7 @@
> -
> - #pragma once
> - #include <string>
> -+#include <iostream>
> - #include "core/framework/ort_value.h"
> - #include "core/framework/float16.h"
> - #include "contrib_ops/cpu/utils/debug_macros.h"
> -diff --git a/onnxruntime/core/optimizer/bias_softmax_fusion.cc b/onnxrun=
time/core/optimizer/bias_softmax_fusion.cc
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/core/providers/acl/acl_execution_provider.h b/o=
nnxruntime/core/providers/acl/acl_execution_provider.h
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/core/providers/acl/acl_fwd.h b/onnxruntime/core=
/providers/acl/acl_fwd.h
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/core/providers/acl/acl_provider_factory.cc b/on=
nxruntime/core/providers/acl/acl_provider_factory.cc
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/core/providers/acl/math/gemm.cc b/onnxruntime/c=
ore/providers/acl/math/gemm.cc
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.cc b/onnxrunti=
me/core/providers/acl/nn/batch_norm.cc
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.h b/onnxruntim=
e/core/providers/acl/nn/batch_norm.h
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/test/optimizer/graph_transform_test.cc b/onnxru=
ntime/test/optimizer/graph_transform_test.cc
> -old mode 100755
> -new mode 100644
> -diff --git a/onnxruntime/test/optimizer/graph_transform_test_layernorm.c=
c b/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc
> -old mode 100755
> -new mode 100644
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/=
0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch b/meta-arago-=
extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-Fix-typo-in-opt=
ion-text-s-buildings-bindings.patch
> deleted file mode 100644
> index 88423190..00000000
> --- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cm=
ake-Fix-typo-in-option-text-s-buildings-bindings.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From be67663e9a44d146033aeb97804145a60b4032db Mon Sep 17 00:00:00 2001
> -From: Andrew Davis <afd@ti.com>
> -Date: Thu, 16 Jan 2025 12:35:03 -0600
> -Subject: [PATCH] [cmake] Fix typo in option text s/buildings/bindings
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andrew Davis <afd@ti.com>
> ----
> - cmake/CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
> -index d90a2a3550..e0cde678db 100644
> ---- a/cmake/CMakeLists.txt
> -+++ b/cmake/CMakeLists.txt
> -@@ -77,7 +77,7 @@ option(onnxruntime_GENERATE_TEST_REPORTS "Enable test =
report generation" OFF)
> - option(onnxruntime_ENABLE_STATIC_ANALYSIS "Enable static analysis" OFF)
> - option(onnxruntime_USE_CUSTOM_STATIC_ANALYSIS_RULES "Use a custom SDL R=
ule. It is mainly for our CI build" OFF)
> - option(onnxruntime_REDIRECT_STATIC_ANALYSIS_OUTPUTS_TO_FILE "Use a cust=
om SDL Rule. It is mainly for our CI build" OFF)
> --option(onnxruntime_ENABLE_PYTHON "Enable python buildings" OFF)
> -+option(onnxruntime_ENABLE_PYTHON "Enable python bindings" OFF)
> - # Enable it may cause LNK1169 error
> - option(onnxruntime_ENABLE_MEMLEAK_CHECKER "Experimental: Enable memory =
leak checker in Windows debug build" OFF)
> - option(onnxruntime_USE_CUDA "Build with CUDA support" OFF)
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/=
0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch b/meta-arag=
o-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-not-add-LD_L=
IBRARY_PATH-to-search-path-when-n.patch
> deleted file mode 100644
> index 75cb9b18..00000000
> --- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-AC=
L-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From b1689f3f963f4c07d3329a838569ac4c2fa2bd5f Mon Sep 17 00:00:00 2001
> -From: Andrew Davis <afd@ti.com>
> -Date: Thu, 16 Jan 2025 12:38:13 -0600
> -Subject: [PATCH] [ACL] Do not add LD_LIBRARY_PATH to search path when no=
t
> - defined
> -
> -If LD_LIBRARY_PATH is not defined a blank "-L" is added to the
> -link command. This causes the next object to be linked to get
> -treated as if it was a search path and causes link failure.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andrew Davis <afd@ti.com>
> ----
> - cmake/onnxruntime_providers_acl.cmake | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/cmake/onnxruntime_providers_acl.cmake b/cmake/onnxruntime_p=
roviders_acl.cmake
> -index e23d289271..19d41dc73f 100644
> ---- a/cmake/onnxruntime_providers_acl.cmake
> -+++ b/cmake/onnxruntime_providers_acl.cmake
> -@@ -13,7 +13,9 @@
> -     onnxruntime_common onnxruntime_framework onnx onnx_proto ${PROTOBUF=
_LIB} flatbuffers::flatbuffers Boost::mp11 safeint_interface
> -   )
> -
> --  target_link_libraries(onnxruntime_providers_acl -L$ENV{LD_LIBRARY_PAT=
H})
> -+  if (DEFINED ENV{LD_LIBRARY_PATH})
> -+    target_link_libraries(onnxruntime_providers_acl -L$ENV{LD_LIBRARY_P=
ATH})
> -+  endif()
> -   add_dependencies(onnxruntime_providers_acl ${onnxruntime_EXTERNAL_DEP=
ENDENCIES})
> -   set_target_properties(onnxruntime_providers_acl PROPERTIES FOLDER "ON=
NXRuntime")
> -   target_include_directories(onnxruntime_providers_acl
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/=
0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch b/meta-arag=
o-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-include-CMAK=
E_CXX_FLAGS-in-build-information-.patch
> deleted file mode 100644
> index e8f086a8..00000000
> --- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do=
-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 7ea6e35d3630f8c19080a0cb5a4a4c55c242a36b Mon Sep 17 00:00:00 2001
> -From: Andrew Davis <afd@ti.com>
> -Date: Thu, 16 Jan 2025 12:40:57 -0600
> -Subject: [PATCH] Do not include CMAKE_CXX_FLAGS in build information str=
ing
> -
> -While this information can be useful, it often includes information
> -that may be specific to the build machine (like include paths with
> -usernames, e.g. -I /home/myname/externalproject/fakeroot/inlcude).
> -
> -This causes issues for reproducible builds (resulting binaries will
> -be different between different build machines).
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andrew Davis <afd@ti.com>
> ----
> - cmake/CMakeLists.txt | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
> -index e0cde678db..e0d8fd0a17 100644
> ---- a/cmake/CMakeLists.txt
> -+++ b/cmake/CMakeLists.txt
> -@@ -1439,7 +1439,6 @@ if (Git_FOUND)
> -   string(APPEND ORT_BUILD_INFO "git-branch=3D${ORT_GIT_BRANCH}, git-com=
mit-id=3D${ORT_GIT_COMMIT}, ")
> - endif()
> - string(APPEND ORT_BUILD_INFO "build type=3D${CMAKE_BUILD_TYPE}")
> --string(APPEND ORT_BUILD_INFO ", cmake cxx flags: ${CMAKE_CXX_FLAGS}")
> - configure_file(onnxruntime_config.h.in ${CMAKE_CURRENT_BINARY_DIR}/onnx=
runtime_config.h)
> - get_property(onnxruntime_GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY GENE=
RATOR_IS_MULTI_CONFIG)
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/=
0005-cmake-Print-out-result-of-find_package.patch b/meta-arago-extras/recip=
es-framework/onnxruntime/onnxruntime/0005-cmake-Print-out-result-of-find_pa=
ckage.patch
> deleted file mode 100644
> index 249aadee..00000000
> --- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cm=
ake-Print-out-result-of-find_package.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From a73d9b9f4dba6d164e128d6c768d1b0a04e969ab Mon Sep 17 00:00:00 2001
> -From: Andrew Davis <afd@ti.com>
> -Date: Thu, 16 Jan 2025 12:47:27 -0600
> -Subject: [PATCH] [cmake] Print out result of find_package
> -
> -A verbose only message is already printed that states the CMake will
> -attempt to find a package using find_package():
> -
> -> Trying find_package(...) before FetchContent
> -
> -But it never prints if the package was found this way or not.
> -Add this result message.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andrew Davis <afd@ti.com>
> ----
> - cmake/external/helper_functions.cmake | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/cmake/external/helper_functions.cmake b/cmake/external/help=
er_functions.cmake
> -index e3f2211f96..9ca6a967da 100644
> ---- a/cmake/external/helper_functions.cmake
> -+++ b/cmake/external/helper_functions.cmake
> -@@ -138,9 +138,12 @@ macro(onnxruntime_fetchcontent_makeavailable)
> -         unset(__cmake_fpArgs)
> -
> -         if(${__cmake_contentName}_FOUND)
> -+          message(VERBOSE "Found ${__cmake_contentName} with find_packa=
ge()")
> -           FetchContent_SetPopulated(${__cmake_contentName})
> -           FetchContent_GetProperties(${__cmake_contentName})
> -           continue()
> -+        else()
> -+          message(VERBOSE "Could not find ${__cmake_contentName} with f=
ind_package()")
> -         endif()
> -       endif()
> -     else()
> diff --git a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_=
1.20.1.bb b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.2=
3.2.bb
> similarity index 46%
> rename from meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1=
.20.1.bb
> rename to meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.2=
3.2.bb
> index a5026484..f47523ca 100644
> --- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.=
bb
> +++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.=
bb
> @@ -4,33 +4,37 @@ HOMEPAGE =3D "https://www.onnxruntime.ai/"
>   LICENSE =3D "MIT"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f7e3b1308cb5c00b372a6e78835=
732d"
>  =20
> -SRC_URI =3D "\
> -	git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=3Dre=
l-1.20.1 \
> -	git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3Dmaste=
r;name=3Ddate;destsuffix=3D${S}/cmake/external/date \
> -	git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmain;nam=
e=3Dcpuinfo;destsuffix=3D${S}/cmake/external/cpuinfo \
> -	git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3Dmaste=
r;name=3Dflatbuffers;destsuffix=3D${S}/cmake/external/flatbuffers \
> -	git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Dsafeint;destsuffix=3D${S}/cmake/external/safeint \
> -	git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3D3.4;name=
=3Deigen;destsuffix=3D${S}/cmake/external/eigen \
> -	git://github.com/google/nsync.git;protocol=3Dhttps;branch=3Dmaster;name=
=3Dnsync;destsuffix=3D${S}/cmake/external/nsync \
> -"
> +SRC_URI =3D "\
> +      git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=
=3Drel-1.23.2 \
> +      git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3D=
master;name=3Ddate;destsuffix=3D${S}/_deps/date-src \

These used to be extracted to ${S}/cmake/external/x and now you extract the=
m to ${S}/_deps/x,
I do like the new location, but it might reduce the churn in this one patch=
 if you moved
their destination in a standalone patch first.

> +      git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmai=
n;name=3Dcpuinfo;destsuffix=3D${S}/_deps/pytorch_cpuinfo-src \
> +      git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3D=
master;name=3Dflatbuffers;destsuffix=3D${S}/_deps/flatbuffers-src \
> +      git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dm=
aster;name=3Dsafeint;destsuffix=3D${S}/_deps/safeint-src \
> +      git://github.com/eigen-mirror/eigen.git;protocol=3Dhttps;branch=3D=
master;name=3Deigen;destsuffix=3D${S}/_deps/eigen3-src \
> +      git://github.com/google/nsync.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Dnsync;destsuffix=3D${S}/_deps/google_nsync-src \

I thought new versions of onnxruntime didn't need google-nsync anymore?

> +      git://github.com/boostorg/mp11.git;protocol=3Dhttps;branch=3Dmaste=
r;name=3Dmp11;destsuffix=3D${S}/_deps/mp11-src \
> +      git://github.com/dmlc/dlpack.git;protocol=3Dhttps;branch=3Dmain;na=
me=3Ddlpack;destsuffix=3D${S}/_deps/dlpack-src \
> +      git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dl=
ts_2025_05_12;name=3Dabseil-cpp;destsuffix=3D${S}/_deps/abseil_cpp-src \
> +      git://github.com/google/re2.git;protocol=3Dhttps;branch=3Dmain;nam=
e=3Dre2;destsuffix=3D${S}/_deps/re2-src \

Tabs are used everywhere else in this file, use them for this list too. (ma=
tches
how it was before also)

> +"
>   SRC_URI +=3D "\
> -	file://0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch \
> -	file://0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch =
\
> -	file://0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch =
\
> -	file://0005-cmake-Print-out-result-of-find_package.patch \
> -	file://0001-Remove-executable-permission-bit-from-source-files.patch \
> +	file://0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch =
\
>   "
>  =20
>   SRCREV_FORMAT =3D "default"
> -SRCREV =3D "5c1b7ccbff7e5141c1da7a9d963d660e5741c319"
> +SRCREV =3D "a83fc4d58cb48eb68890dd689f94f28288cf2278"
>   SRCREV_date =3D "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
> -SRCREV_cpuinfo =3D "ca678952a9a8eaa6de112d154e8e104b22f9ab3f"
> +SRCREV_cpuinfo =3D "8a1772a0c5c447df2d18edf33ec4603a8c9c04a6"
>   SRCREV_flatbuffers =3D "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
>   SRCREV_safeint =3D "4cafc9196c4da9c817992b20f5253ef967685bf8"
> -SRCREV_eigen =3D "e7248b26a1ed53fa030c5c459f7ea095dfd276ac"
> +SRCREV_eigen =3D "1d8b82b0740839c0de7f1242a3585e3390ff5f33"
>   SRCREV_nsync =3D "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
> +SRCREV_mp11 =3D "0a0b5fb001ce0233ae3a6f99d849c0649e5a7361"
> +SRCREV_dlpack =3D "5c210da409e7f1e51ddf445134a4376fdbd70d7d"
> +SRCREV_abseil-cpp =3D "bc257a88f7c1939f24e0379f14a3589e926c950c"
> +SRCREV_re2 =3D "6dcd83d60f7944926bfd308cc13979fc53dd69ca"
>  =20
> -# Only compatible with armv7a, armv7ve, and aarch64
> +#Only compatible with armv7a, armv7ve, and aarch64

Unneeded change.

>   COMPATIBLE_MACHINE =3D "(^$)"
>   COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
>   COMPATIBLE_MACHINE:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","ne=
on","(.*)","(^$)",d)}"
> @@ -38,11 +42,9 @@ COMPATIBLE_MACHINE:armv7ve =3D "${@bb.utils.contains("=
TUNE_FEATURES","neon","(.*)"
>  =20
>   DEPENDS +=3D "\
>   	onnx \
> -	abseil-cpp \
>   	protobuf \
>   	protobuf-native \
>   	boost \
> -	re2 \
>   	nlohmann-json \
>   	microsoft-gsl \
>   "
> @@ -78,22 +80,26 @@ PACKAGECONFIG[armnn] =3D "-Donnxruntime_USE_ARMNN=3DO=
N, -Donnxruntime_USE_ARMNN=3DOFF,
>   PACKAGECONFIG[armnn-relu] =3D "-Donnxruntime_ARMNN_RELU_USE_CPU=3DON, -=
Donnxruntime_ARMNN_RELU_USE_CPU=3DOFF"
>   PACKAGECONFIG[armnn-bn] =3D "-Donnxruntime_ARMNN_BN_USE_CPU=3DON, -Donn=
xruntime_ARMNN_BN_USE_CPU=3DOFF"
>  =20
> -EXTRA_OECMAKE:append =3D " \
> -	-DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
> -	-DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/cmake/external/date \
> -	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/cmake/external/cpuinfo=
 \
> -	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/cmake/external/cpuinfo \
> -	-DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/cmake/external/flatbuffers=
 \
> -	-DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/cmake/external/safeint \
> -	-DFETCHCONTENT_SOURCE_DIR_EIGEN=3D${S}/cmake/external/eigen \
> -	-DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/cmake/external/nsync \
> -"
>  =20
> +EXTRA_OECMAKE:append =3D " \
> +      -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
> +      -DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/_deps/date-src \
> +      -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/_deps/pytorch_cpu=
info-src \
> +      -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/_deps/pytorch_cpuinf=
o-src \
> +      -DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/_deps/flatbuffers-src=
 \
> +      -DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/_deps/safeint-src \
> +      -DFETCHCONTENT_SOURCE_DIR_EIGEN3=3D${S}/_deps/eigen3-src \
> +      -DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/_deps/google_nsync-s=
rc \
> +      -DFETCHCONTENT_SOURCE_DIR_ABSEIL_CPP=3D${S}/_deps/abseil_cpp-src \
> +      -DFETCHCONTENT_SOURCE_DIR_MP11=3D${S}/_deps/mp11-src \
> +      -DFETCHCONTENT_SOURCE_DIR_DLPACK=3D${S}/_deps/dlpack-src \
> +      -DFETCHCONTENT_SOURCE_DIR_RE2=3D${S}/_deps/re2-src \=09
> +"
>   EXTRA_OECMAKE:append =3D " \
>   	-DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/protoc \
>   	-Donnx_SOURCE_DIR=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR} \
>   	-DPython_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
> -	--compile-no-warning-as-error \
> +        --compile-no-warning-as-error \

Random incorrect whitespace change. Please review your commits for these
in the future before sending.

Andrew

>   	--log-level=3DVERBOSE \
>   "
>  =20


