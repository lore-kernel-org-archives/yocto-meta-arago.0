Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF75BF47CC0
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:43:57 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52956.1772739835457644741
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nxGFkdy6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.67, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvaWMXpzT9DY1N1m3oqPTtd7GSYvW2LE2QCWdjkRlGGGXYG/2HHhrOPen2xuMu6bOMZUhOZI2fOtlphMF82uQLsG0ihq8NPzFuHfgXKLUwrnUQch8Dm2vvCPSd2n3pQRFeCsid/CARalNl9saYnUF+2p325JiOpZYi3OIi7CmI/heIpYj3FLtShXR9YgnngssY59Uwu0enlJKwqTn5gCjQySfVwssp800hbDMliL91+AjJ2B/uqDzhXgooOg4zKuBprWfDhSjrH1RdUfT1owTHMjAYp1mHJ2F32EADL7XprWIrnrJ/pyRoGKvWUW1HNN0Gxi9hyMyJZSKS/kVbQsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvj5CoT8jjQe9Jd3ukxpwfdMIG85aNNrSZo7O7c7Rw8=;
 b=b2N3wVrnJ2AGIZSXugPLET7v7L1wtjhp7KVK1YPqBOQGlOaRs2l8FMfamtoVmxFpfZmDidqLKM+uicggRNQNqc+pnpemt+RAtFHIY5zUd239dZCJTbMnQz9v/8OtweoOttmsDcLeuzo5Sdtj1mJzhOOTynTLYxJpsqb6BV+ePS6hn+ouZ5sBrjp4AvrTmVaUzIwJDxcd4XPrhtPvOotk4UdBo8bqWIIbeL/3NwBvwes8DxtWFFI5mm1g/MKYlcRgrVIB+jb4NVQRxKtRteInTAUGZfwKN6cVhBqKjbCUJUvCqVrYL9ZAM0KBr2P0tqbV5lK59Dmwz6YWHQVXfUbxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvj5CoT8jjQe9Jd3ukxpwfdMIG85aNNrSZo7O7c7Rw8=;
 b=nxGFkdy6pO8P9LO5Dzfn/lAYRjpDKU0VUadRw0vDjKG8qZxMsM/izPKKW/4nUiRmmRYsIQshNV7qx+3VnGreAO2mA+0vvqr691ZM8WqvhDVY+mi4+EvUjFFTl/G1M0Ltr3aYcdr4HHzItdf8ILQrl7th3P1L54t0xWtOg1CvvkA=
Received: from BN0PR02CA0059.namprd02.prod.outlook.com (2603:10b6:408:e5::34)
 by CH3PR10MB7355.namprd10.prod.outlook.com (2603:10b6:610:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:43:52 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::2c) by BN0PR02CA0059.outlook.office365.com
 (2603:10b6:408:e5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:43:51 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:43:49 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:43:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:43:49 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Jhe5d2933792;
	Thu, 5 Mar 2026 13:43:47 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v6 2/2] onnxruntime: upgrade 1.20.1 -> 1.23.2
Date: Fri, 6 Mar 2026 01:13:39 +0530
Message-ID: <20260305194339.2081304-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305194339.2081304-1-p-deshmukh@ti.com>
References: <20260305194339.2081304-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CH3PR10MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0c6890-9bb1-44c6-974a-08de7aef874e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	Sjq0dftSiZSqk7DggSDWc8kzrW/i4SR51Dm8NrSKFvivcn6JUVIUAw3ABKX4PAUjUHhq3zcjKtX3PhXjqBIMrAkTkHeyxsD16WMX/m+kLs+94dWX1XtpTfXCR5JCn7sxsu8IiD/ZECaOy3BlgTwLC6tjmcfgeqztwfvU8ScvTpjlGQo8+fiQJGb9trUrWI0QWXVhBoGqVuss5XjeGKcGLZ+RWkZ8b/hwPZXCd+QFiF/gETsfn2yAJKmVNZgJPG24pcF3qt7c2gUIJ55U1HhYz7YOr7nf+uUss1rOk7SbGa4dmAShEKywd9wQ+DDoF5TRn8WF2nhKkxj4doRlbgUnCe74k4AQj7TwG359bheEPyiaFsGI8aNenbMi4As8vkYneOOi+gO/hd2qTgupqtnrgkQVCg7AL6YDk0TMmlwne3/o88su2oNgZilgot+FNSU2Z8pXp/T60PDTphyeYGrbEAoatPfn1tyX/DPYRrK0O4NrBFvoG7jcm6GjUDEbEVlsCXDuAYOsys9NGQMI4bWBn3r+v7TUySy/tm8+t8hFKNmqT+eADVXVUR0GEP7kwdMyXiNIqMOB1b7KokCNHvwVabVSUOEh2NDTSZuml+sWW1A+gE6lIw56WCHUJv8u91XqpqyIxYbd9iw4nVL/VDH5wawIM2jRQkn+0kDoxDQZ85eRDJuj5XEpJE4FNyuB5qbXGECNye7H4QzH5r7IieL/42nzsYWM6WAgP6I6tw5JM1UmblUtex94Z6kpwtRHVIPMGkHUD10slzIWsCQfFKpwe1Ev0ajudZb6NBkULIlWib8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UiyYb6tou5XpPnDm56pCPvSt7MtmyBQQtMK9XukOXCefbLBljjI/jVxb17F6YM04of0wgGzAzCbIKqKCZC9RIIMdxrZtAjSsG9GG+8p8WWIFNvIbw8C9mw0xTOPbXqLHQQrqvV/fES4U6I3ttjkwBs+lp1wgapx6ebpWX25oi21842tW595/zoYdP2saMKI5Y2YSOoucnO3VA3dXBLc3q+NR0eIt1V1pOymXP7vI7RyEvjX7Pv2X9Vi03cz1NaLkKJK5pQeHF0ZZ0E5Ulb+YxfwLWleZR3eM+d9bSbmEcfQ47vuF6zyAROuqOR3nij4KElsJhJFrezbOzgwPpo6vh26/JErVcE9Z5rRGjePosbkU3ZdC6igB1nKfgx1r9fbieoWd1fwVZjOkFD/SZC89oDpymG463f3pOfd1SWCrNqHR9fob0kO0rPt3cB4auNwF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:43:51.7815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0c6890-9bb1-44c6-974a-08de7aef874e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7355
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17263

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

v5 -> v6:
 - No Changes

v4 -> v5:
 - Fixed incorrect patch version=20
 - Fixed indentation issues

v3 -> v4:
 - Removed redundant google-nsync dependency
 - Fixed improper tabs/spacing issue

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
 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} | 53 +++++++-------
 7 files changed, 55 insertions(+), 221 deletions(-)
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
.bb =3D> onnxruntime_1.23.2.bb} (73%)

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
similarity index 73%
rename from meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.2=
0.1.bb
rename to meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.=
2.bb
index a5026484..6b8e8de0 100644
--- a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
+++ b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.bb
@@ -5,30 +5,32 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f7e3b1308cb5c00b372a6e78835732=
d"
=20
 SRC_URI =3D "\
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
+	git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=3Drel-=
1.23.2 \
+	git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Ddate;destsuffix=3D${S}/_deps/date-src \
+	git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dcpuinfo;destsuffix=3D${S}/_deps/pytorch_cpuinfo-src \
+	git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dflatbuffers;destsuffix=3D${S}/_deps/flatbuffers-src \
+	git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dmaster;n=
ame=3Dsafeint;destsuffix=3D${S}/_deps/safeint-src \
+	git://github.com/eigen-mirror/eigen.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Deigen;destsuffix=3D${S}/_deps/eigen3-src \
+	git://github.com/boostorg/mp11.git;protocol=3Dhttps;branch=3Dmaster;name=
=3Dmp11;destsuffix=3D${S}/_deps/mp11-src \
+	git://github.com/dmlc/dlpack.git;protocol=3Dhttps;branch=3Dmain;name=3Ddl=
pack;destsuffix=3D${S}/_deps/dlpack-src \
+	git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_2025=
_05_12;name=3Dabseil-cpp;destsuffix=3D${S}/_deps/abseil_cpp-src \
+	git://github.com/google/re2.git;protocol=3Dhttps;branch=3Dmain;name=3Dre2=
;destsuffix=3D${S}/_deps/re2-src \
 "
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
-SRCREV_nsync =3D "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
+SRCREV_eigen =3D "1d8b82b0740839c0de7f1242a3585e3390ff5f33"
+SRCREV_mp11 =3D "0a0b5fb001ce0233ae3a6f99d849c0649e5a7361"
+SRCREV_dlpack =3D "5c210da409e7f1e51ddf445134a4376fdbd70d7d"
+SRCREV_abseil-cpp =3D "bc257a88f7c1939f24e0379f14a3589e926c950c"
+SRCREV_re2 =3D "6dcd83d60f7944926bfd308cc13979fc53dd69ca"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
 COMPATIBLE_MACHINE =3D "(^$)"
@@ -38,11 +40,9 @@ COMPATIBLE_MACHINE:armv7ve =3D "${@bb.utils.contains("TU=
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
@@ -80,13 +80,16 @@ PACKAGECONFIG[armnn-bn] =3D "-Donnxruntime_ARMNN_BN_USE=
_CPU=3DON, -Donnxruntime_ARMN
=20
 EXTRA_OECMAKE:append =3D " \
 	-DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
-	-DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/cmake/external/date \
-	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/cmake/external/cpuinfo \
-	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/cmake/external/cpuinfo \
-	-DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/cmake/external/flatbuffers \
-	-DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/cmake/external/safeint \
-	-DFETCHCONTENT_SOURCE_DIR_EIGEN=3D${S}/cmake/external/eigen \
-	-DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/cmake/external/nsync \
+	-DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/_deps/date-src \
+	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/_deps/pytorch_cpuinfo-sr=
c \
+	-DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/_deps/pytorch_cpuinfo-src \
+	-DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/_deps/flatbuffers-src \
+	-DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/_deps/safeint-src \
+	-DFETCHCONTENT_SOURCE_DIR_EIGEN3=3D${S}/_deps/eigen3-src \
+	-DFETCHCONTENT_SOURCE_DIR_ABSEIL_CPP=3D${S}/_deps/abseil_cpp-src \
+	-DFETCHCONTENT_SOURCE_DIR_MP11=3D${S}/_deps/mp11-src \
+	-DFETCHCONTENT_SOURCE_DIR_DLPACK=3D${S}/_deps/dlpack-src \
+	-DFETCHCONTENT_SOURCE_DIR_RE2=3D${S}/_deps/re2-src \
 "
=20
 EXTRA_OECMAKE:append =3D " \
--=20
2.34.1


