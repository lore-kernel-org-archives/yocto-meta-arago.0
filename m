Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49104CFD624
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:34:05 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4692.1767789235455055955
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 04:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IMowk99s;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.20, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st1AWNVGPkQo6+l/PCN7LGQj75zeSqt9CyGNvaUVMCiFJH9zpOV7BgzVRCwxf4qVYyaARcj64GjBBSYytVioDj62z+l1D8AILXcRk+5cSvS/xGT1vY4qC5xFe47hey1BmnpEPoMMvrHbYgtNi0dV4bC8nm6ATKWRUqaIccQMR7lwhoqAGaWoNeZNKpQanTtzsrgdm73/gyAGt6crUCTGIAZzctjGrK0Zv9bOGiMUg+uS+Oo0TO4qehcFljTPZ3w7SK6Y2+Sz419XvAhRbakeH14IUeB1B/JJrdZY7BMb+N6DDIQWNiQWRvV9Zqb53ztb+elBqOjxemfGliaza3NtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBKcvUoaVczrMDkkmLLg+8VDKfTFCVo3vPoQ+J+AeVM=;
 b=EqOfmpFE/3GxxK7l1gOa1zlstnEE0e0xGDjFEnbImvKZNId/Yr6+f+7MuKh8OytepCpnRIDPCWlbCcm2zvwI8o/MKxzCkf+mERzkDfGXGgZQ8SuY2MyAUhtezlYZpkYDI3gRPMEuG1F8zKV1dAk+l0nvVegs0NcSMOP+E7aEtBkIVVftx7hK1yOv23ULgP2in2vf7l7d3Yl7VuSEduU7sA6gzijR2XYZOIZSeIQB6qcShmvn28FmnQjtmS+m4ULJ67xYACzukiFFIXGd2khPybsMhIsrEbhLc0R/cOeZz3Nd5DeN+56GXQujet2WVUCFb72RjkA4EbPe9IPGc/tEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBKcvUoaVczrMDkkmLLg+8VDKfTFCVo3vPoQ+J+AeVM=;
 b=IMowk99s+eRIoR9IHBhcx4jzXP26pPDHB97U0LeIJvMUmZguQbjzfDb25SkbftaEH0HqddatSG9tQbAMzWsBofUvQbGst2y5kho8bYbHVbmENtl1BGcp6jFJ3SEUibgAhUb9kS3rr2hzpgae57CvQMx6n8rR09oEbIe/ZfTORdg=
Received: from SN7PR04CA0025.namprd04.prod.outlook.com (2603:10b6:806:f2::30)
 by LV8PR10MB7750.namprd10.prod.outlook.com (2603:10b6:408:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 12:33:51 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:f2:cafe::3a) by SN7PR04CA0025.outlook.office365.com
 (2603:10b6:806:f2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 12:33:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 12:33:50 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:33:47 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:33:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:33:47 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607CXlBP707316;
	Wed, 7 Jan 2026 06:33:47 -0600
Message-ID: <fd8cf075-46d6-4654-94f8-61040bd19c76@ti.com>
Date: Wed, 7 Jan 2026 06:33:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] meta-arago-test: recipes-core: Add
 udev rules for MCAN to meta-arago-test
To: Anurag Dutta <a-dutta@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260107052154.1598698-1-a-dutta@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260107052154.1598698-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV8PR10MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c5885b-b62d-46e9-c55a-08de4de90305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SzdHaFFEaFJFWHU5YVJLZzBkWW4zbm93M21HS0cxR2kyV2RVNEVpS0dUSFQr?=
 =?utf-8?B?VTNTS3VaTy9weHJqMkxaaVRJa09YWmxPSDRINTFiMXRvcnBiRmVLckZsTmlk?=
 =?utf-8?B?eXhhVGxONnk2Z01PUXJBdmlzRHZUbWRvS1dIZnN1UlJmVXgxS3h4UklMaHlB?=
 =?utf-8?B?cDBrY2RyMkNRVXV4bTAxazlxZXZZTDgrdS9KcTM4dWo1WkhVMGl6VnZmclNO?=
 =?utf-8?B?MW9Mak1zbkJ1cFZTNVJMTkVNU1N5R2VaWlVWdHNrWU1RNTlJYVhEQWhpam94?=
 =?utf-8?B?S0ZnelFFbEFOTEMvb3U2VkFDczJrSE9XaVZvZ3Q1bjFMV1E5aVcyZ3lrcXB0?=
 =?utf-8?B?cmZCVWcwNnlQMGhqcFUzSHFxS3JEaW5zUm9VbExldXBQclB5MlZxL0VuMGlj?=
 =?utf-8?B?RXpXdWVjMGZBRktWVjZaVWJpTVNuUmFWZm1lRzdiYVBsaEU2WXNnWC8wNXFh?=
 =?utf-8?B?b2tjYzhBRkFyQjY0aWVyYWJjSEozWGgxbEpLMUdQUkk0M2xBdTZnSlhnZ2tn?=
 =?utf-8?B?MXphYWM1RlFnRWE3UUJJZnZLZzN1b2xzUGhlT3Ric2FxRWx1SWdJVGlZTjBn?=
 =?utf-8?B?dm9FYmc0OWF3L0VlUTU3dHlrb1c4OHBkN1IxclV1SzJZYlZMY1JRUm5Mdkwr?=
 =?utf-8?B?d0VHOFZoZ09XdlZ5b1RrZDdDTHNSWWVEU2lGWGY3aWkxa3BCNnlBVnpxcWxM?=
 =?utf-8?B?aTlxbkUyaUVyQXJMaUR6WHJpbGlmcFVleFhqNjJOYkhyUUw4U24xdkFzaFZU?=
 =?utf-8?B?WGk4dzRzRGdGdXRIT0gzTldRcW9zd2FpSnZYbWthTk1Ub1NlV25MN3hnWDl4?=
 =?utf-8?B?Yy9pRjkrUk82R3NVRUFjV1hUOVhnZ2FYRzBrNy8wM3VIKy93Q2JZNmpkYjBr?=
 =?utf-8?B?YVNvY1RtRHJBcG0yVXk3amgrbzNJZTlNZ1pkV1YyTW9qQ2hkeVlpU1hXOUhZ?=
 =?utf-8?B?TWJKWVNTa2hnd01QU1JiNkh2VHpQVW5RMmJyQUVjUUxyZWcwdnlHTmd6dTlH?=
 =?utf-8?B?WnRvYlkzREZnek5scDAxU1czMkJEaWdreWxZYjVGOGQ0NDVOcURtMk15YXlw?=
 =?utf-8?B?VThPWXdRVnB2MjFGaktWUm5sUTIwUytnZXllc010QjZIcDc3aUtSc1kvL0Vt?=
 =?utf-8?B?V0lvN3JhNXB0N08yd3MwUllCT01zczJFTDNxaWJ6blRzcHFFRUJ5VERPUURQ?=
 =?utf-8?B?REFMK1NvdWtNNHJiRzdrelhXL1lIZ21HY3ZXWk92OGRkaHR5ODhPRWJNREJC?=
 =?utf-8?B?QUJKY0lSeXl3NExCT3QwcG9KMnNLQk1BK2dBbVJhWnNuOU1PaG5FSk5vK25l?=
 =?utf-8?B?ZEVwaGx3ZjJKY0tLMHZYSEhsK1c4cDhqWXQ1bVRzekMxZHRCU2l1UndIMG9U?=
 =?utf-8?B?dVFkY2FUK0pnMGdNT3pQcFdPOTBseE1HWTVkV3dGc3lJbkdYQWMxblYvbk5y?=
 =?utf-8?B?MVVSczVJalZpUFhOSVBpdVZMZ0RYYzJtWHpqZlVER1YvcXZaK2FLTHllZHBM?=
 =?utf-8?B?MzkvOWg1bzI3eVNCN0hUdmN4VGEvbGsyb1lhSTNhUDhuelhpOEt6dDdSMDBj?=
 =?utf-8?B?RjlSZzk4VjA1TzRMY1hRWGRCaXk0WC9uU2M3YnJpcTNzTWIrR1AzSW53Z25K?=
 =?utf-8?B?ZDNxd0tuWmNRNjRKckdMWUNQcGVMb2FpTVVGRTR0M2REUTdIZmhFZlpzb3V4?=
 =?utf-8?B?M3JOUGVoQWFoTFY1S0VuZnBQemZrZFJTNmxYTUJHTllPRHZEOGZMSHdGMGFC?=
 =?utf-8?B?RDRGRWpOK3VvWWV5b2FuZmxITXYydGdqQ05wWjA2TlNvelhvcFJ5Sm1QQ2lH?=
 =?utf-8?B?Z3FzcG9EYm1ocHJuc0FBQUJMM0JRemt0QVBteE94LzlYSHJIUkM1aWh2QTVD?=
 =?utf-8?B?Z1lYMmxnMUhGY0RlZFpZY3NEZEJtM010ZmgxdkFmdmVXeWdaVkVUeFdiSGpK?=
 =?utf-8?B?eUc2aFd3MTdxeUhva3ZvN0I3K3g0c1hmNFplOERxTzVzelA4UTRFRzNQN25r?=
 =?utf-8?B?c3B2eFNxMmRTSTcxT2NnMzQ4UTZiWThQdS8xQmdhSWN4bHJzZ3FRL1FGcFNs?=
 =?utf-8?B?VUNPTHNPcGpiVW5aL3VkRDBqUytVeGNQSmRpbGlxUUJpUmlsc0hJWXlzYlpN?=
 =?utf-8?Q?KMnQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:33:50.6339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c5885b-b62d-46e9-c55a-08de4de90305
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7750
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jan 2026 12:34:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16937


On 1/6/2026 11:21 PM, Anurag Dutta wrote:
> Move udev rules from meta-arago-distro to meta-arago-test so that MCAN tests
> run successfully with other distros such as "poky" as well.

If these rules should be available for other distros, then I feel like 
this should move to meta-ti.  Well, everything except for the arago 
rules which seem like they are distro specific and not hardware 
specific.  You might be able to use the MACHINE_EXTRA_RDEPENDS variable 
in each of the impacted platforms to ensure that new recipe in meta-ti 
is included in all images.

Denys, thoughts?


> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> Link to v1 : https://lore.kernel.org/all/20260106060815.868724-1-a-dutta@ti.com/
> 
> Changelog: v2:
> 1. moved all the rules from meta-arago-distro to meta-arago-test
> 2. removed udev* from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> 
>   .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 --
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb           | 1 +
>   .../recipes-core/udev/udev-aragoconf/37-can-am62.rules          | 0
>   .../recipes-core/udev/udev-aragoconf/37-can-dra7.rules          | 0
>   .../recipes-core/udev/udev-aragoconf/37-can-j7.rules            | 0
>   .../recipes-core/udev/udev-aragoconf/37-can-ti33x.rules         | 0
>   .../recipes-core/udev/udev-aragoconf/50-arago.rules             | 0
>   .../recipes-core/udev/udev-aragoconf_1.bb                       | 0
>   8 files changed, 1 insertion(+), 2 deletions(-)
>   rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-am62.rules (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-dra7.rules (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-j7.rules (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/50-arago.rules (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf_1.bb (100%)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index b80697e5..6df03e60 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -21,8 +21,6 @@ ARAGO_BASE = "\
>       ethtool \
>       bash \
>       opkg-bash-completion \
> -    udev-extraconf \
> -    udev-aragoconf \
>       libgpiod \
>       libgpiod-tools \
>   "
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index dad5571c..47f8fcac 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -104,6 +104,7 @@ TI_TEST_TI_TOOLS = " \
>       input-utils \
>       ltp-ddt \
>       openssl-perf \
> +    udev-aragoconf \
>       uvc-gadget \
>   "
>   
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
> rename to meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
> rename to meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

