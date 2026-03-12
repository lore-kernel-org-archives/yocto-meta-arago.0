Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FB711258BE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:48:21 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21834.1773323300041167523
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 06:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GZ6bLYFx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.14, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTonjs9opauSajqoD9H348eooLR0uo4UB5UZwZEVk/4mxftB7VxOeH41YBSotmPRvJfGfbShCq5P+MFLR703bdzolCHK2ex6j1cQrjTbsiuCF9i9LUKxROiqMJBIQUJi+FG3gejCUG28e0X+a8TF56OyWRjif4/Iylns4hCZjtQnzK5LvF41F3qD+UkZy5xYwmwLYlRDKX7hTsNf0AtZhTUONf7j3dRxTP0VlCi0D/PnqQLAacWqLGVtP8zxArQcGsJVtYB+bfuNRrpBEKZDUKU79i8DufHIYBctXBqbcGr7DZkwRkpw2cjRob0ih5ofSZbApkaOS5aaaHfhlbr+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWnpimFSuS7CjJPCi6WUjHToYDTPmOC6BwpRZfJXcRw=;
 b=u9uB14qZVlv5IHGPsinXBHhnQsA89MjlY0NED+Pz/USoz+/QivL2xQM4dACaeWyA1YsXzC4P/5hzS8q4BHZ5PLjGlVY4nO+/EWWPB5BY5OcPN8n/JAEAPl03ahv87KbEt0f4cC764jUSEdWlp8a8IJKvkA6Xom/832ULzRkUhaLFFDv888j9iudkLMj4RSj/wBuFzEiNpxWpe7E3RakPOOKHPPOM8xXwkAAV6e5YeWCvAhpMHGwyS8DCAcGeLC7oqzd3061dqWMq3oOrBsTwLSLCqzjTpPjfbLOHm5Ahof5J6rSKGYSlGolQQA07CuBMZyLfHdHusJ1KAvZDEyozTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWnpimFSuS7CjJPCi6WUjHToYDTPmOC6BwpRZfJXcRw=;
 b=GZ6bLYFxOuARNI/UNKqbQZWuc7MC3Nk5158/K5tALs9rKKahecTkjKw0si4SPaykg4co0AfxjlAXi0sDyw2b98hlMppufcTUZMp2QXOueOo4hOQ6nldNcN+zUgO6fWIQNyhZ5FzsGWNsuYlAC/17KBrCmX1Z/yzmsTsxFww5tZE=
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by SA1PR10MB7554.namprd10.prod.outlook.com (2603:10b6:806:379::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 13:48:17 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::97) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Thu,
 12 Mar 2026 13:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:48:16 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:47:55 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 08:47:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 08:47:55 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CDlsZH2403432;
	Thu, 12 Mar 2026 08:47:55 -0500
Message-ID: <ffed25c0-dbdd-4388-b4ca-90b4efcc43d6@ti.com>
Date: Thu, 12 Mar 2026 08:47:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3 1/1] nnstreamer: Move test binaries
 to main package
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260312130928.889341-1-p-deshmukh@ti.com>
 <20260312130928.889341-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260312130928.889341-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|SA1PR10MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 697feb2f-ebd7-4e93-989a-08de803e032f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|7142099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7fMLYORe8c3GcFOgKvxkPQuPloaKmrxq28BIi3bNFGbixsNcEzwaGnPK5GzEgRmfayYWYoHREn340cU0maPMU6ORt1FVkZ1x7BfRfpHqtTLwfxDyJZPArNUo7VOCkDr2cvMVAlBhIqpyyQTORTWOlpkhGhbmJL+cf8ymJI/2PlN2gQiBiTnlpgZkyPLx+K8nwKgx1EFgk7YPV+kiPLQwlVJh2Si+girokTr8TFLiw0ssNYlvGiKZcdseDrRVt5vg1smPILHqsjvFwfXebs81VVqw3xg393ZML2CaCea+kmYxArb0bTpStI76psIxJOqO6n9lw59xZHC6cL2JvpC8Rvk+qS1gcpvgT8FjRp+MxGwHUHzZPc+yqX3TIWryBPOEEeKIb/cPk2osEvC1PYFT7f14ayTb+SUw0HD8PnLHmT+7+3AsnCzQ9L3azvDRZ3BnRDCz0W4rrRACulsR2pDf9XodGPIychIppV3D5qu2uLeuzlRjuKEuKeP/aOVbsotg5ykExhETva6OLd9fdzvsTcLomz+JDhCO37/m61Z//m+2fFFfrMkW1PYoZi+q5a5Vez7KQEdQAZjw68L//2WeJofA9l1RiwZp9y52o6wWSCVh0vNqqa3DYFfh2B83YqsK79wcepPzNEMl3OIauvN6BeqPc0FHnELWXtFXnOGmc5AN6++UGqCiw1DDcjqe7l/jNxTdXD14mRSsTMVtkNmWURTBoRcgrIq/e6NW+ksvwSXELlQT3ZXO2ZzIvPIiskowDroR5HP6Vk/KUUnZF+iUTg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(7142099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/10PiTqNbpjQE5KMbmi9MCM2Nbnaz+/6Ni3J7/0ltfETFic+l7BxPgaTWQc6dF63SVuw9CZOSW+DldY9Kaqx5+lfXUh4qiDLuElqieDyVqTlCQm78gR/PDgRnZsPGdE6ahkEA6lpiv/c/RpvPadzlfpqYjWjgLu24s1tzf5U1GsfSIuQT29BjLMf9aOU0E3DGi0fLD5phJChP+FGfnKoRpxYgXSpEmawPP9w3mbRmjLrxL0BsK3xkN6U34b7HBsjWO4YiTVNyGwiAAUCXbUYxg/COfubPhhObQNvrTHWzuxfKXWYFgqNae34koUj3jv7xSSulENhasfRO4BfC54H/40LOFyNQWM1smrWDsmsHjGmhlfOLDgU5KP5kKiqkAnKNln454AC6jNLZSFDsaURXqSFw07zJF2JDURoXOKA7fQhhloW5bmoaSH/tIfClg1d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:48:16.1461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697feb2f-ebd7-4e93-989a-08de803e032f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7554
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 13:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17318

On 3/12/26 8:09 AM, Pratham Deshmukh wrote:
> Consolidate unittest executables into main nnstreamer
> package instead of separate nnstreamer- tests package to
> fix missing benchmark utilities.
> 
> This resolves file packaging conflicts and ensures
> unittest_filter_onnxruntime is available for ONNX
> Runtime benchmarking without additional dependencies.
> 

Why can't ONNXRuntime just depend on the -test package?

Also this commit content looks to be mostly around fixing
the "buildpaths" error, which isn't described in the commit
message at all..

Andrew

> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4 -> 2.6.0")
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
> Change Logs:
>   v2 -> v3:
>   - Fix runitme dependencies issue for unittest_filter_onnxruntime.
>   - Upgrade recipe to make it QA compliant.
>   v1 -> v2:
>   - Added fix commit hash in the commit message.
> 
>   ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
>   .../nnstreamer/nnstreamer_2.6.0.bb            | 15 +++----
>   2 files changed, 48 insertions(+), 9 deletions(-)
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
> index c62589ac..7bf64408 100644
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
> @@ -53,16 +57,9 @@ FILES:${PN} += "\
>   	${libdir}/gstreamer-1.0/*.so \
>   	${libdir}/nnstreamer/* \
>   	${sysconfdir}/nnstreamer.ini \
> -"
> -INSANE_SKIP:${PN} += "dev-so"
> -
> -PACKAGES =+ "${PN}-tests"
> -
> -FILES:${PN}-tests += "\
> -	${libdir}/nnstreamer/customfilters/* \
>   	${bindir}/unittest-nnstreamer/* \
>   "
> -INSANE_SKIP:${PN}-tests += "buildpaths"
> +INSANE_SKIP:${PN} += "dev-so"
>   
>   FILES:${PN}-dev = "\
>   	${includedir}/nnstreamer/* \


