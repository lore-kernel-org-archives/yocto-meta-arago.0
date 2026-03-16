Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA30F506CD
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:10:43 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49914.1773666637801314336
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 06:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fYXkicpR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.65, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMsUS7Co/UK5Yl2MVlQAssSZ5klLqyZ8issdNjSWoTfMZ7fRUpkg2t+cdVJvnjo5vIzayCyr3niAcTazn9DMYAoGMthESsVa489gRNEG5jk9+1ayBpv/A+xlxQ+9wOAfchs+42esWFMUb0Wkmu3MP5/YmhhmLsp0vgfK1vpEATIzUplnWzgfVLzg0n9ReF9jRC1IM8LMbIC2mk0y3/xq7+BpqwhmfiBC4d2W241dlTQGH3LjCgE1B3qWda2TkBRUH0KmP8jO0hn9C/m5H16y4yRuZUqxl4YIIC5eshz1PhC0tpNkBGkjpi2PNG0NmgoUpEdrcWwoMTSKyNVSgzkWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn+IlYE2jRjAUjLAPtN/qO2dNT3XQ1rklApX4YDgijM=;
 b=HA9Z1FFNI5r6McNxKJSek9Ge0yp2mFqm+F7XGPtkCix/esLjjLrrU7pjsG8END8ASE6FCbYJJYU56uwxyktWFVJuWHKTYX7xTlMLNLjYcff5ceyOV3WTBrNnGIP6Ai4KA3EQwHg76LY5syIricdHFZqw6LvDGFJsHVfu2suzVF/KXfmWMiDlvPdshIacNF0Ks9yxU+bC3DHD0nFhIccT9BIRWOuokDQRdRmwoIbM0h94znRo3CMw39C5uVxE4bcdGxeN1A+4CVLJ/G00AHWB/AZGsI9FsepsR+56FtmD7Yf4Mw8WOuYad5pj4sUza+//i+LDrpVn/pr3slGsXpaa7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn+IlYE2jRjAUjLAPtN/qO2dNT3XQ1rklApX4YDgijM=;
 b=fYXkicpR6f4EkxSHmP41Dl0VEWGg8T9t2A7YcRDSHodIelSuWQN8gjf86Y5LB+d9SDAT8BXBP0zkm08o5WRJWzjhzvcW3TaWCi4bxLkbonstNhbS9yXVGDrGdIcHRbYtEXE9GmETpOcofZI51Nvv8hY/E7dvEOzgcs+7bT8hfVM=
Received: from MN0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:52c::16)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 13:10:35 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::df) by MN0PR05CA0021.outlook.office365.com
 (2603:10b6:208:52c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Mon,
 16 Mar 2026 13:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 13:10:34 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 08:10:23 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 08:10:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 08:10:23 -0500
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GDAN8W854690;
	Mon, 16 Mar 2026 08:10:23 -0500
Message-ID: <54b6b817-38de-4a2b-bc22-f54379ca78a6@ti.com>
Date: Mon, 16 Mar 2026 08:10:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test package
 dependency and fix buildpaths QA issues
To: <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260316092648.1377711-1-p-deshmukh@ti.com>
 <20260316092648.1377711-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260316092648.1377711-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ0PR10MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: 75777ddf-5b21-4321-ef14-08de835d68ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	DEO3hA7fOsyF44CfCzDBX9PSLfR0oayHNYu+tXjiFACY12FTB1Z09WwLJTYRUX6Cz+3uVc5mIg29LiyZpMv8dMX0vmFxzB8EIxj+bvxg8dQYAn1PlvisdDzpksBq5ss3MB8Ote/DizyIDQObl0lMUgaTXt+skDSDkiu5G2SwYjX160AyqWyJlvhWAHz85wsz/YJ4OZQB3YwxO0rADr/AXczIa5XyhEVlLMs5nUCMkOiYiHst5MJ6/a+dxjNJ+MAUU7zdsd+RZ+wdug3+woV/3aBTfAtytinoFTzT3LD5zrooezQG7G85nWG9EyBPjN+s0Uygu02KG0beFwd2BrjrboVLkwq51a8jCSfTAS9ELzWHAQBUJefsqfbfm4KOMmRUE3n34/puqYhbmlrrz2g8R3SKOTtDLGD2M/OKn55ln+Iw1qU6T2aXbwMJRlv5uKOu5u7YsFiZI85H0eedg8IgmKLPM4XObda6utULVx5+Ne45f/sq5+T6hCc3YesSIrwH3p6GbKsa9wlQcmS1uxpyN1Un+bOUOJStWEjEczqxT+KTNvFK9KIKjKdyZlFJvYBZ3Ys4ykHW7GFIgodOK+d5J6Vnx+iaLYVQW6QLtU6xzHX5Id68SBc1gIKop21T4KMaaJuQr2GUGalDKlecXzAxeFVK+aStFTwwI8jnbMsk+u46+qBC85A8zaW5hZRIpnFd47cTS7BbJNkc4XZ/tVii8BiIN5kLVNZFRESUcQTwmKYQ9WJoMDQ2si9mjaj+qayUjFueOz9oVHABlA0FlMIlgQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EgPAMtawfZScv18UG0wa1pyRYjJyzXQ1/aVS6hgApubSo9sspztOWZ5/DcFSlaZKvn2ClU1YU5Jz3GjgZdfpkAaXbWP3KTOc9CZIKc0wixnyPgCkBSyI2GLF7zNcNCM2kZOH0BTzvTx1DyTASvH5QHj95+RDIMT6qT04nZaTJc0Fy6evRWo8FcWQrXGA0QFTa3QLsS1b3DpGKIMyhOPzkkWuYZmloXSf78N/zh6TSjfbus+cy4HcSlVcUsj8YX8cQe6sXUQegNRmfRRJ+PUEi0riSf9tFpQX3QUxLIfvyU6n65TmdvSO2/GMc7+jpylQB+vol57KwMcjD0+vqYESFd8MVzWJqIwlx3k2V9mA9gFkYOi/d64pzQy7GeypMvVDEYBa/SF+Bxt6409VFSmIJfpJIgROCGRvn3EU4INCmbBH3q39CN/ThbWo9edVZcRk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:10:34.3292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75777ddf-5b21-4321-ef14-08de835d68ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 13:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17348



On 3/16/2026 4:26 AM, Pratham Deshmukh via lists.yoctoproject.org wrote:
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
> +RDEPENDS:${PN} += "nnstreamer-tests"
> +

Why are we forcing the tests to be installed when nnstreamer is installed?  In fact, I cannot find any recipe that even refers to nnstreamer.  How is this even begin included in builds?  In my mind, if you are wanting the tests for use during our testing, then nnstreamer-tests should be included in the ti-test package to ensure that the tests are present.


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

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


