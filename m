Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAC7F013FA
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:27:08 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46574.1773653219370533452
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 02:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NmZCcKl8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.41, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDwjmRe0pVzn+9WDldz+gGcVVn7DOdX4ZITCdrZjgO6LN3/E0ufh50UNvrudiy3XLx5CvaNXirOTZ31hMkUtlT1xs7Z3JCVZKfpdngQkuCzBokDwK3/0vmnF4V8jF/JypEgG2rHg7V+4Qswa4arxDlwOL1kWtQGsCOYSxIgH51EQ3RueA9AMlqpHrjdkBwhltduooIfMwi1ybG3lp/bA6Du/1p8KEhOBsjwCAEjwpEb2We/6pah0rbIY3Ph0Lw/OxvyWLkssaAv6dtGZ/2dHRh2Togddipt6JwdAryR4Uz5zyzaD2Gfljx+CDgivC17Et/X0ZNZdDwGwGdYmaGMi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg9BB+M40zigyEVNkuzSG+taOtaDcn4LGY+mJNh6k2M=;
 b=SVRvhB3ghVGGvJZQWbb4tpj+uk0ruIu3g00UPeXqL+zxvyrT7ME0dtN52b7NFIESDZFa1KZesSbMz8Lhts9a+dJ3S7Q3Uv2RTPWmSLjNqrFon0Gvu7wVVlMkoWZ2ObAIdVxz3v5Ymo/RwBJVcRBEYoulaPjy622dNyQlQZWILN53NoV8N3l4pZXXxlzlzrX5Y9H9u6PLUidQ44cRX1Gkgigvun7crIAk4aPQPOSnLqhMLWns8eoPcpl3OROtJgCNlLgrsMif4Ak0NeREcYOQnDxseAvgp5RSqSdzEyOHaBs5cpiCct7U1jrDxamFmbGt1eH9pnesgE8LNBIi0bYzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg9BB+M40zigyEVNkuzSG+taOtaDcn4LGY+mJNh6k2M=;
 b=NmZCcKl8RAuiyb/C/YkJyfV6nerY6d1E4dYSmJQY8jfpjFrLDri6OpaB0Q92Z5pyZysw6FDr87Yj4g4Po7nc+fZlhPQ+OTi1c3BGGev1IFjotwoBKWZLkXKJ1zrtaIBxBk8Ictc47BcBhm4j5tkc47Xp0pgzP0W2DxeE9RRTufA=
Received: from SA1P222CA0107.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::28)
 by PH0PR10MB5732.namprd10.prod.outlook.com (2603:10b6:510:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:26:56 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::12) by SA1P222CA0107.outlook.office365.com
 (2603:10b6:806:3c5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 09:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 09:26:56 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 04:26:55 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 04:26:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 04:26:55 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62G9QnPW553169;
	Mon, 16 Mar 2026 04:26:53 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test package dependency and fix buildpaths QA issues
Date: Mon, 16 Mar 2026 14:56:48 +0530
Message-ID: <20260316092648.1377711-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316092648.1377711-1-p-deshmukh@ti.com>
References: <20260316092648.1377711-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|PH0PR10MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd858a2-16c7-4ccf-1863-08de833e2aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	bGfPzRAKb5B48wa+U7ue/UJ2VCMgt2bqh3BtNa+XlIhuXvTMcMLYvpXu5e+a3ihrMuhbZVriGbpUBa5WgpYqtgVzRkBpIMlxOigH45NX0BY1nIRdJ0Npel536kMSaxXGW9x1HyPaWfyT7qofe74vPquDiIoJk9eHRaSJPLJYSAonml1tA6ijLvwV3ZXxZZzqIiQihFsuIfA420R6MZxbZ0193USxOqzVRh5xZjvl6vsYZZ2YnwWhI+doqT0ryLXxi6fgBCXZP5Xs3PLF4ZVFcoTIjB3PQU4+tUzOzSMbWT3xiMMqAviY3BuI4rtsLbELl/Hset6m75a953NEjf6EwjDML5e1TyeQLjSuEmmmZpL1RNGHBZ7FTqNqHIuvt8Iga3f990JXy+6j6MipRb1RxGtIJEl5kprtvtqAeHqfxshofMXdKbFEadXsOD00zmt5rNYT0r4+LF8E96cuF7pIpP788jyj1n6QlJd6nvGVtmuCfrWKM/SUIPBghRgDjoQNkHQEKcCbs1DVDvHJ+kqCc/yI8hGTOIqtjpVUaOV8DeuHX2bGmovAniA7AQ40XjATUK92N2rDkjcYYUOF5isfqoZaOb2odeYLzX1rf7Z7+GCMEv0Q7LYBhQiJ7B8RTYyy3lRuwyqVQwNvC3lk9/GagNw5rGj6ntZUj8NlAlfKAj64dTornz+cPnS9SJv91oMJuA11Zw18XVgade2sr6W03cgpho60UlNAYXiY568pDA6dbj9R32suCfA7JUcVzZ1yrDlELzUVXfxhvlMZlQcKUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	s0QQvcYf3CM6O95gzjoR3yvU+URjhda81xPA/1T3a/Ewi6KHoJdn1AzsStW7sH1kBLfdavQ5u7nmU79TBaADPOzufu8lqbB6OVbQ5yyjaxMD/pt8hzz2+6Y/Pa1/RHTPZJKIbyJhEi6oDgTGVmBYY82YXu64CYVGw5MNXnISJnSWqXWUqya6OfRwa6py9JINJg0tOu8UyAq1VnvoX2fUwzp9wQvKgE7yAEo9P8qjLLfHtPlwWqJjKXdp2WQ3aio2FNssdDND/+3SlfNbGNz6+TSK3LmT8aEsOC77tjYmReXCBR6GQt3MjF+e2Ca+wuoaBkBfyzorrZmxe2Noj0oxpvnAgzIrCmI2u12mgxJKON/fA90DPhG4FxnVCMo5lpFn/PuulCiRzRS6uJEktOJg8WA6axqSFGUhVF5R6iiZ+cpxcedSOLpY8U+htL66wbRI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:26:56.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd858a2-16c7-4ccf-1863-08de833e2aec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5732
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 09:27:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17346

Add runtime dependency to automatically install
nnstreamer-tests package when nnstreamer is installed,
ensuring unittest_filter_onnxruntime is available for
ONNX Runtime benchmarking.

Include buildpaths compliance patch that replaces
absolute build paths(meson.build_root()) with relative
paths in generated unittest files, resolving QA errors
"contains reference to TMPDIR [buildpaths]" in unittest_tizen_custom.cc
and unittest_tizen_custom-set.cc.

Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4=
 -> 2.6.0")

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
 v3 -> v4:
 - Use RDEPENDS approach instead of package consolidation to maintain
   clean separation between runtime and test components.
 v2 -> v3:
 - Fix runitme dependencies issue for unittest_filter_onnxruntime.
 - Upgrade recipe to make it QA compliant.
 v1 -> v2:
 - Added fix commit hash in the commit message.

 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
 .../nnstreamer/nnstreamer_2.6.0.bb            |  9 +++-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstrea=
mer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/000=
1-fix-Remove-absolute-build-paths-from-generated-test-.patch b/meta-arago-e=
xtras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-bui=
ld-paths-from-generated-test-.patch
new file mode 100644
index 00000000..345b3eb2
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-R=
emove-absolute-build-paths-from-generated-test-.patch
@@ -0,0 +1,42 @@
+From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00 2001
+From: Pratham Deshmukh <p-deshmukh@ti.com>
+Date: Tue, 10 Mar 2026 15:23:05 +0530
+Subject: [PATCH] fix: Remove absolute build paths from generated test file=
s
+
+Replace meson.build_root() with relative paths in custom_filter_path
+to prevent Yocto buildpaths QA errors. The generated unittest files
+were embedding absolute build directory paths (e.g., /tmp/work/...)
+as string literals, which Yocto's QA system correctly flags as a
+build reproducibility issue.
+
+The runtime code already handles proper path resolution using
+NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative
+fallbacks, so this change maintains full functionality
+while eliminating embedded build paths.
+
+Fixes: QA Issue "contains reference to TMPDIR [buildpaths]" in
+unittest_tizen_custom.cc and unittest_tizen_custom-set.cc
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
+---
+ tests/nnstreamer_filter_extensions_common/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/nnstreamer_filter_extensions_common/meson.build b/tests=
/nnstreamer_filter_extensions_common/meson.build
+index ecd1878b..ba72ee20 100644
+--- a/tests/nnstreamer_filter_extensions_common/meson.build
++++ b/tests/nnstreamer_filter_extensions_common/meson.build
+@@ -9,7 +9,7 @@ tizen_apptest_deps =3D [
+ # Format for adding subplugin into extensions -
+ # [name, extension abbreviation, dependencies, model file name/folder pat=
h/file path, test name]
+ extensions =3D []
+-custom_filter_path =3D join_paths(meson.build_root(), 'tests', 'nnstreame=
r_example',
++custom_filter_path =3D join_paths('tests', 'nnstreamer_example',
+     'libnnstreamer_customfilter_passthrough.' + so_ext)
+ extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custom_fi=
lter_path, 'custom']]
+ extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custom_fi=
lter_path, 'custom-set']]
+--=20
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
index c62589ac..fbfb887c 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -3,7 +3,11 @@ DESCRIPTION =3D "NNStreamer is a set of Gstreamer plugins =
that allow Gstreamer dev
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba59=
0"
=20
-SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;prot=
ocol=3Dhttps"
+SRC_URI =3D " \
+	git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3Dhttps=
 \
+	file://0001-fix-Remove-absolute-build-paths-from-generated-test-.patch \
+"
+
 SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
=20
 # Only compatible with armv7a, armv7ve, and aarch64
@@ -56,13 +60,14 @@ FILES:${PN} +=3D "\
 "
 INSANE_SKIP:${PN} +=3D "dev-so"
=20
+RDEPENDS:${PN} +=3D "nnstreamer-tests"
+
 PACKAGES =3D+ "${PN}-tests"
=20
 FILES:${PN}-tests +=3D "\
 	${libdir}/nnstreamer/customfilters/* \
 	${bindir}/unittest-nnstreamer/* \
 "
-INSANE_SKIP:${PN}-tests +=3D "buildpaths"
=20
 FILES:${PN}-dev =3D "\
 	${includedir}/nnstreamer/* \
--=20
2.34.1


