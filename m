Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA99CFC297
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 17:21:27 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16875.1763745683753142001
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 09:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dOTlzVtj;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.201.65, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1ci7ULizAuZjYGYMESHL9I7c8s6lImcViomMu0LE4POKixn8OIEK94iJfUB0ba0X++7mI5uP9caRIgLoyr8iW3lLi5os0um7cuiRcdv61FInm7M2DOq3tgXuSvzHuGtABqmmffA/oeBi3ljviz4E+YRUlvKrWcGaV7uFOjJxLfRRkGiNg9+uFHoFVhGM+D981pUVOpOqiRhFiCQXZA9ODRyFrbU4M+PIM5idHf7Ux1YbEFhVT1pUdglmtUJTg5jicfVtW91VHtR8YHrFLBW1YE+2J5SU6zy2tdHaXi8DN5RyM2yHNF9sMc6jx7TEd6kqX2qIb70cAKRewoLN6/8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vk2dngcC6+mZ1kcFcxIjln2WQIZs5Rv0GPT0+2zDEbs=;
 b=vmvpXkFQzax+UD1kPXfDOFOvPaA/nwJGJ0e8lz9jq7ZtnN9TlIlI/80hNcMV6Mf5CqJasmuWal3hsn+WPz+2YcVmQC29O4Vh3ieic698SGEP2PLqnuNhb7JdDfsa8jChEeEEd3DxvjBXa169FsrFfY0lBoegjPK7V8lWUJPHIWyLHRD3w8BEzhFlLhdh5tjXookc2tzpISXaWSin8yzjwEHikY1BtORjWCz+QktGw2wOxNk/QcvuLGN7gtgUPu4a07lNCTTuORV+RSXcwblPu4laz+iqs4BfQAOBL/LdBc7Q4/1gtrOBOLoqN8u/tJG8O20IIQAjnhRX0K2bFneb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vk2dngcC6+mZ1kcFcxIjln2WQIZs5Rv0GPT0+2zDEbs=;
 b=dOTlzVtjo9rap3tXQbJzi5cTc35IJcsWx+QB7wZxEdodrQSl5c8LVMht6Dx7xKflIQuWCSjeJKsjXuf4r1oiLyZ075U2JXdzzcukc/1XPPFhV3eH+EDHz91VD82OPzkHMQ1lnETY8txeL2gXOuUCRMYnKJ7wRV82ZaoQ6Lrx1C0=
Received: from DS2PEPF00004565.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::506) by IA1PR10MB6076.namprd10.prod.outlook.com
 (2603:10b6:208:3ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:21:21 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:92f::1002:0:11) by DS2PEPF00004565.outlook.office365.com
 (2603:10b6:f:fc00::506) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.6 via Frontend Transport; Fri,
 21 Nov 2025 17:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 17:21:20 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 11:21:19 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 11:21:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 11:21:19 -0600
Received: from [10.249.33.103] ([10.249.33.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALHLJZW1637948;
	Fri, 21 Nov 2025 11:21:19 -0600
Message-ID: <188a10c2-9e9a-40fc-8693-e303861e9508@ti.com>
Date: Fri, 21 Nov 2025 11:21:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: Update
 to 2.4.4
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20251121160030.459921-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251121160030.459921-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|IA1PR10MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc71c77-a2ba-4672-cb59-08de29226390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?emlCWkRwN25Heit0WEVNVWd6UGR1cTBiaUllNEVqT0s1cnVFSUEzdzI4cnlz?=
 =?utf-8?B?SFUwRDBmUzhFQllQSTdoYXpGSW56azhGR2tPRXg3REo3ZDhhRFBVT05xOHk3?=
 =?utf-8?B?Tk1zVW0zWjBuYWdYaHk5RzluMWJTVVd1bEdtZFpZY2I3MUlhLzNRNkdlY0RC?=
 =?utf-8?B?WlZBd2x6cXJraWhhV1pzTDVzVUNEZ2lZN0grd2RqVlA2blozNE9pc0RtQldQ?=
 =?utf-8?B?MExOWmxZTThpK3VYb3k5K0RqN1hqVENlWWF6RW5rRnVUaGFTSTA0VmhQZS9z?=
 =?utf-8?B?ODJIWTlWeWRBZlBKYzhkaDNBek9MWWsyOW4yOFZMR3BHVVZ2TGF3YzFYYm9T?=
 =?utf-8?B?SHZQKzlsM3RveW5qaEZjU0VCR0FrYSs1dTN2TmpWR1pMekJPT1owWE9GVktr?=
 =?utf-8?B?TFNDUllWOU1DZzY0amFGK29WNnlaTmFydEtuV092QzlYQ1ZtTDdEelBPY1Bj?=
 =?utf-8?B?MjhDSEkyN2wxTFpER0FOcGoxSWFWc0JsOXBKOThTaUdjNVBVRnRsUDMxMmN1?=
 =?utf-8?B?ZEpXRmN0MldRUUdmU3BBaWRuNXFENzM1RXRISnFzbU4rNjI0RGRFR2t0bmFL?=
 =?utf-8?B?S3BMNTBPMURadVB5alZ6YWQrYjZJRU8zOWJvUTk3S05rOVFXQlB1WVNPTDRK?=
 =?utf-8?B?WkppSXY0TGJlN1RKdmZGZG9GZzF4aEtsNllvaVMwdEg0d1lpU3VuRi9WVXZk?=
 =?utf-8?B?VDNDdkdCZGlncy9CRFc1OHhQcHBRdHlmQS9jYW5WWThlTWM4aVZrQndKSU5R?=
 =?utf-8?B?S0RtRzBmOERBQWRyeE55MHhCUlpiN2NZRTVVWW85Vk1xMzRUc3VnRWF3TUtN?=
 =?utf-8?B?SEJkMXhRc3VtdFU0bVhtRXd3ZENnai9WSk5zTjcwZ1NSQy9ybnZ4dmE0SlBP?=
 =?utf-8?B?N0t5WHFnQlRBNlF0VzJJaEljanByVnh0ZnRhZGFmd0pzM2EvQThlK2NhSEVs?=
 =?utf-8?B?Tmc5a0VWaWNONHpKbkNxcVkzUDdiV3BoYXhsVHRGNXJ1Uktoek5aRVFvSUxv?=
 =?utf-8?B?WE9maFdiV3RrRkhNdG01WmlRbVpCNGZEa1RZbmh0T01ITGJuUzEzd1Z2dEE2?=
 =?utf-8?B?NnAxWFBjc1FtRjIrTHhaOGJoSnU0cjB0YUFFbW1NYndnRGYwQkdNTW1CN1E1?=
 =?utf-8?B?QTZGSGltOEd0N2NSNlJ3R0RqeEpBZElDaDRFRnpGVkUxQ3RBZklaeXp6SnlS?=
 =?utf-8?B?cXo3cmI1emxKRlhwMGhqSXlMOGRMTDl1ZkxXUEZjcmc2bHhjODdieFEwa3ZJ?=
 =?utf-8?B?OWhmeThES3krMXJDM2NNUHVkNFRZb1hOYVdUQ0FFOWdEeEtmNE5PVXBiWmds?=
 =?utf-8?B?RU5QcDZEekdUL1pUN1JpaW5tcWVFVTRlQmpEUC94UlkzVjRqOWxlOWNiUjVo?=
 =?utf-8?B?Y24rQnlYVm1BM0lEKyt3K1FEd3d6a0JwdTVUdXlkektZejZqc0lJNXEycWRk?=
 =?utf-8?B?VzlkT1VqZ0xSWmFNRUZpdzhPdFlndzZ1ck9kMU1mL1VHMUF2bXhtOW5QSUln?=
 =?utf-8?B?T1crUE42dDFrV3c1UEFhQTdTSlUxc3ZXMVYwNGZ5eHZMNFlkbkx0YzBmUmtG?=
 =?utf-8?B?UEJ3cVVpWm1TSTVWcE8zQk5KYW5VckJ1NWFteEowcEUwekJCbmFEQ2ZvdzVD?=
 =?utf-8?B?ek51dFphVlArOXkzZ0pibTBWdmxseENjRjFTWC8rU2VYUWZOY2Fja29OTGx5?=
 =?utf-8?B?R2FEaUVhMGtPS01sakRLWXBFRXBDa0hFQTRaVVZPTWdKbGdaVUpYMS80UThD?=
 =?utf-8?B?STMrRk9BclJLR2JySGlCWkpoRHVwcVdQYmpGZXFZV0RiSUZUOFZEU2pWQzZ5?=
 =?utf-8?B?b20wMmxZcjd0bkFIWlZ5b3kwTHB4ZXNpK1Rja0JzMWovVzRTKzZvbDd4NVhQ?=
 =?utf-8?B?R1V1UFJTd3k2MkpZT0dhc0l5TmJ0MXZjSW1yYlQ4aEdlWEwrM3Y5TVJFL2J1?=
 =?utf-8?B?MVpqbHlQVjd2QlB6d3liREJlTHJQZzRubm5TQ2Zqb3VIQkwxNXo0VVBERVRI?=
 =?utf-8?B?Nit4SHZMSUVkeWdhaG51WWs1QjVhQXhyZkZXK20wU3o3L0VYRlUrY1d6ei8r?=
 =?utf-8?B?M2tDSTNZOGJoQkcrTENCMzBjMXZQRHJNUExDMW9PcFh6YmFtV29oSjhiQjM0?=
 =?utf-8?Q?KdU4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 17:21:20.8780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc71c77-a2ba-4672-cb59-08de29226390
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6076
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 17:21:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16822


Please do not include the meta-arago-extras: in the subject.


On 11/21/2025 10:00 AM, Andrew Davis wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../nnstreamer/{nnstreamer_2.4.0.bb => nnstreamer_2.4.4.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.0.bb => nnstreamer_2.4.4.bb} (97%)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> similarity index 97%
> rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> index 63995d83..0da572a7 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> @@ -4,8 +4,8 @@ LICENSE = "LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
>   
>   SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
> -PV = "2.4.0+git"
> -SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
> +PV = "2.4.4"
> +SRCREV = "3b32573bc104b4708af44837466b8b6c73f94869"
>   
>   # Only compatible with armv7a, armv7ve, and aarch64
>   COMPATIBLE_MACHINE = "(^$)"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

