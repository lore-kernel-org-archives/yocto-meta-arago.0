Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F17F506CD
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:13:03 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49962.1773666775406366139
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 06:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=DBBrJ97F;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.25, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWUdYbkJQG2ewssnxdbpLhsKR2HnadcqdCVIIu9D9hFU3qt7aFUQutnBjU/Yh7AttNPDQSBIXD5vudIrD+oLDjcdR1Zd2eDBHRgCXtRwG9OSh89Ab5SqGhcUT4Cw0R3txcWhxTDDRzAonMHfdzSPY7T3GOp08wk0vSDB7mFIxauUzhM86sMqNYZ27BQ9PXkC22EzXkCdoU5rU5pC091g3JFBn86nwmpKC47hb7xISCqNG+RBQx2bGVBDnXtuVmGV1cPotyYUroT+GNoc7hdS473MyxeuSq2vAfuhnOELu48Ly9oJlxZ5YR8rZQPf219tMkzMNULHAz1hgaZ8VJIZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXWnj0QU5RZlpIYdrBngenL6TA57LjGnp9UHzaAAXMo=;
 b=FEx0oH43giK4nb207dNn8WqsIXgbvwoabOdrpz1W6kS9yidtaMilhvvNxEEaC7ARu5Gv89wR+S6M3yE31PxI5lzmWF8ma6wT8VtW1bYZ02vWESAOxTAAsOgTygm65cbidwXvee7jovYJwqZRkaMUoat3tlC1VL9lyasrNYRcStVmDhnbd+HV5gqhS2eP8DjsI0cZSP3DYSpZE9cmZvHJHwDUFgRkz2LM5GtjpVE+GTa53iXALw18gRRsvrgsmHAyjiAhMNQxKowM7VxKPTXDJmcRAY6BzfTuvm55kDakjet+LarBLizVlc0TRkChISk7Tk0vBlrs9HH2WYW6+W/Pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXWnj0QU5RZlpIYdrBngenL6TA57LjGnp9UHzaAAXMo=;
 b=DBBrJ97FhaCn6Zw2pa9MwicI4CRzNS3j7lJWYmsWOMIuNcd4GNk7ousXQ+vj4tYCTLFMLsyHjpCfWa92KEplUYtowQT3Upi8bQRI8I9hv72enqDWanBS4OPsrcEHHlA4sf5qP22eRx32dx5VTbCD+b+UulrR6MLThXUj0k2nSD0=
Received: from DM6PR02CA0144.namprd02.prod.outlook.com (2603:10b6:5:332::11)
 by SJ0PR10MB4815.namprd10.prod.outlook.com (2603:10b6:a03:2da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 13:12:52 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::46) by DM6PR02CA0144.outlook.office365.com
 (2603:10b6:5:332::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 13:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 13:12:50 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 08:12:50 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 08:12:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 08:12:49 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GDCn5Y857510;
	Mon, 16 Mar 2026 08:12:49 -0500
Message-ID: <1349a61c-100f-4aec-a8ca-b69c075da061@ti.com>
Date: Mon, 16 Mar 2026 08:12:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test package
 dependency and fix buildpaths QA issues
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260316092648.1377711-1-p-deshmukh@ti.com>
 <20260316092648.1377711-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260316092648.1377711-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SJ0PR10MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d218555-9d1f-467f-2bbe-08de835dba15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	u8kOWsBcdkHu0cFkqSG7EKXmJvCf+GqIURmpCF5K7y3hgYR8VJNsu/Lwk/PeqnrUl2oZcs8neQ6fzlm/u+wJe66+kWtyqf7ixDUyUki9NEhROTHC/Y/KVErtHq6n5hV0mbNYmhtCnxcjKKDTmW8CzVcZ3pFNg58ngHiPlXljJLtFe4he88I4wQh7rxR7He9BMvga1KAyCtX0YYrJvE+n31h+BjZiwPWi8IEr+9F/EJu2yw5BeHMptODqhGOrmrqa42/tCYNewZefmOR3oKDSD3HtLPJv0U797x7yHnyFkLGbrWrOTED8/LqfkUUDwTc85qZfd2AyRO8Nln1862xIBqkE6vAtwIHq/RbV9sOrM4Zy1VpTMzl6CVQ+3Ldtmndq8z14di33uk8uaVpEYaspHlVUzisd3mvNmqzl/SORNHNVD0EqlMoNR90b13JD0cyX9quxPNEvz5EKdV3tgBxwTGuQX5ATKDn0zUZD2bxYhtSTcpyEYrLAhrcVQzTkuf1x07aWL470oybpp6Y8k3n2Yvjp+eQhgwjDobCPfxHyasH7QsKBWrs2fvXIP0jStTgUT8nZS6FHvajK6fVeDr/fefWNYRLPHABcAAXmutMkwLlI0i+GPQaPU6Hn3nLztUtMOu/PeIhrK/j43wm3jWJBAiXKszL1mTfXiVspq/uWuhxJiAsyhIqQHnfWNwqvHPa03tnBTneszpfumwozblHoYL81SehuKQiI4lpUdvYQMHFyMZgezP4HFMq5GFPd60MR5uXnJ5ZIdWWFvx/X/G/HrA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ngLET8kdTqNyo9XxsSqHMl7HqOTVKBztmhxCrpqz8tFOBt/PDOFFCXJcti/Gp5QP04e7tNHe20uv7kKHV8e0vU8PYl97gQwNpV/8UNpBfoFp2sX33H0CESpIQGGlD8i761PtWPngy7NN0kE/y8c38bnVtzRTH8eB0YakeKyhZBpeYiRNe89K8TfU3q8qbNx6AJrFwYVcHWJpMktV8oJdo5hTHY2SewFiMq6lepsToQsiobgIJieavup5DXGmsCky3VbKeI6Oo9lvEuHXDAURh91PiLR4BcrK2CyShZeXhVjshcyvXnshbgtZ4ti8HGSkbYDLGInYpvmMHvhv90ss+XPQTxPFW/zEOCiDmem1W8s2Ee60JQnLHUcszgKOqP4Slq8LuTWx17QoQSZfhIu3SafF2aUAWXbdkI3qKoVDw93UE0Kgd7nZqA0WyzCqGdi2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:12:50.9441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d218555-9d1f-467f-2bbe-08de835dba15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4815
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 13:13:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17349

On 3/16/26 4:26 AM, Pratham Deshmukh wrote:
> Add runtime dependency to automatically install
> nnstreamer-tests package when nnstreamer is installed,
> ensuring unittest_filter_onnxruntime is available for
> ONNX Runtime benchmarking.
> 
> Include buildpaths compliance patch that replaces
> absolute build paths(meson.build_root()) with relative
> paths in generated unittest files, resolving QA errors
> "contains reference to TMPDIR [buildpaths]" in unittest_tizen_custom.cc
> and unittest_tizen_custom-set.cc.

These are two independent changes, each paragraph above should
be made in to its own patch.

Andrew

> 
> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4 -> 2.6.0")
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
> Change Logs:
>   v3 -> v4:
>   - Use RDEPENDS approach instead of package consolidation to maintain
>     clean separation between runtime and test components.
>   v2 -> v3:
>   - Fix runitme dependencies issue for unittest_filter_onnxruntime.
>   - Upgrade recipe to make it QA compliant.
>   v1 -> v2:
>   - Added fix commit hash in the commit message.
> 
>   ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
>   .../nnstreamer/nnstreamer_2.6.0.bb            |  9 +++-
>   2 files changed, 49 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch
> new file mode 100644
> index 00000000..345b3eb2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch
> @@ -0,0 +1,42 @@
> +From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00 2001
> +From: Pratham Deshmukh <p-deshmukh@ti.com>
> +Date: Tue, 10 Mar 2026 15:23:05 +0530
> +Subject: [PATCH] fix: Remove absolute build paths from generated test files
> +
> +Replace meson.build_root() with relative paths in custom_filter_path
> +to prevent Yocto buildpaths QA errors. The generated unittest files
> +were embedding absolute build directory paths (e.g., /tmp/work/...)
> +as string literals, which Yocto's QA system correctly flags as a
> +build reproducibility issue.
> +
> +The runtime code already handles proper path resolution using
> +NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative
> +fallbacks, so this change maintains full functionality
> +while eliminating embedded build paths.
> +
> +Fixes: QA Issue "contains reference to TMPDIR [buildpaths]" in
> +unittest_tizen_custom.cc and unittest_tizen_custom-set.cc
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> +---
> + tests/nnstreamer_filter_extensions_common/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/nnstreamer_filter_extensions_common/meson.build b/tests/nnstreamer_filter_extensions_common/meson.build
> +index ecd1878b..ba72ee20 100644
> +--- a/tests/nnstreamer_filter_extensions_common/meson.build
> ++++ b/tests/nnstreamer_filter_extensions_common/meson.build
> +@@ -9,7 +9,7 @@ tizen_apptest_deps = [
> + # Format for adding subplugin into extensions -
> + # [name, extension abbreviation, dependencies, model file name/folder path/file path, test name]
> + extensions = []
> +-custom_filter_path = join_paths(meson.build_root(), 'tests', 'nnstreamer_example',
> ++custom_filter_path = join_paths('tests', 'nnstreamer_example',
> +     'libnnstreamer_customfilter_passthrough.' + so_ext)
> + extensions += [['custom', 'custom', nnstreamer_unittest_deps, custom_filter_path, 'custom']]
> + extensions += [['custom', 'custom', nnstreamer_unittest_deps, custom_filter_path, 'custom-set']]
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> index c62589ac..fbfb887c 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> @@ -3,7 +3,11 @@ DESCRIPTION = "NNStreamer is a set of Gstreamer plugins that allow Gstreamer dev
>   LICENSE = "LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
>   
> -SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
> +SRC_URI = " \
> +	git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https \
> +	file://0001-fix-Remove-absolute-build-paths-from-generated-test-.patch \
> +"
> +
>   SRCREV = "b970e9eff6bfb4e915463842422fe14bb2e53f84"
>   
>   # Only compatible with armv7a, armv7ve, and aarch64
> @@ -56,13 +60,14 @@ FILES:${PN} += "\
>   "
>   INSANE_SKIP:${PN} += "dev-so"
>   
> +RDEPENDS:${PN} += "nnstreamer-tests"> +
>   PACKAGES =+ "${PN}-tests"
>   
>   FILES:${PN}-tests += "\
>   	${libdir}/nnstreamer/customfilters/* \
>   	${bindir}/unittest-nnstreamer/* \
>   "
> -INSANE_SKIP:${PN}-tests += "buildpaths"
>   
>   FILES:${PN}-dev = "\
>   	${includedir}/nnstreamer/* \


