Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C809EC982F1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:28:36 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4153.1768588114802222721
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 10:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WLH+2I+C;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.14, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryYnEXylFW63iBhFO6/aETwkUQwXUCv8a7Plbch3Bbdh6pCAZnvZvaV5RX3tyX8Q+VDTQTJb6bNxtkW+MX0dIxeiI0ECXz1Hj2BcSHFRSEsLxIWi052pX9iQ8YPhWiMmrh8MNGd1e0ZuNtJVwStKLSC+0HkTpEW7o5hklosg6a14lGh1aB3iNB76zWuRIlEk7MYkht4RaXIEvn/fY2tqG6Je3IIr5egSSs277gVVnxrSpi+Lz+TRrr7jEeFOsCFtZwD1qchSZnq5B14eVcpJj1gAS/SwHI9yvVCsfu/4qFUKV9mG45Wm0IpYr+gCVaNDFerUgpQzomL06jl+jjcZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGwP3Y7Jrb+bvE5QZvmOpB7mXLttVWNeV/Jmh5HOpQ0=;
 b=OUDLDBwVqNok45hQeiHFkyk6tyFmVR9zBv+dQCXsFGf4Pn8wNVlkaRoktLy2BA85BUUhLedQ/HI+nvg1AomKEygDBdPkD+/yD/k4wjxq2Qd7jjADZ1pJ4TV8YPhW9KrmWjgdcyJOedEmZK5D6eewO7AGQxvJQG6cFcH5cb7+mf5NrAwE+K1GyVzT+uH4cFWaBKJZQ9sDb0rGeOZIWz0jVW6viFHijZOtaiOcC5Q5zDNyMDJAUREkIEc3t5hW8yq6+zB/3veTnzQgSwsG7PMw5BdkGLsXep+ffpbQRCfxrsz3TcKw6xCcFh6dmQpMEGzT0jwBS+oWCqPPAipIheWWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGwP3Y7Jrb+bvE5QZvmOpB7mXLttVWNeV/Jmh5HOpQ0=;
 b=WLH+2I+Cqg+PCEtOwaPOlujR83A2BkOQ/iT1fTECaJbB/HhfpurJelejlXuTNN2yWBzCSR84CpYf+QDfSr3ZIbNCjkPDROQZ2XegQ4owEuDVZmTBKJ7oX+5r8E9g1noDq3OG3E7lPDhe+RyAVBfkcYDwD6UbyEZVb9Da5mTjzOI=
Received: from MN2PR15CA0043.namprd15.prod.outlook.com (2603:10b6:208:237::12)
 by DS3PR10MB997702.namprd10.prod.outlook.com (2603:10b6:8:346::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:28:31 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::31) by MN2PR15CA0043.outlook.office365.com
 (2603:10b6:208:237::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 18:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:28:29 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:28:23 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:28:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 12:28:23 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GISNW13566574;
	Fri, 16 Jan 2026 12:28:23 -0600
Message-ID: <3b1583b6-bd10-4dcb-b339-57d37c0c7049@ti.com>
Date: Fri, 16 Jan 2026 12:28:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v4] packagegroup-arago-console: Fix
 package names for alsa-utils-*
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260116173605.1565859-1-reatmon@ti.com>
 <20260116175646.GT11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260116175646.GT11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|DS3PR10MB997702:EE_
X-MS-Office365-Filtering-Correlation-Id: f0680d1f-cbaf-4372-52a0-08de552d0bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UVozMmpNMkJMWHdtWjc3RTNoMlYzSjM0NWhVa1ZxRk5ZajVrNThldmZ0czBP?=
 =?utf-8?B?YjdSaFlhQUlXU0FZU1JkQjRWTjBCRHFpUHRTcllTeEc3YUtIZnFoVHFXMW1Y?=
 =?utf-8?B?OCtXeldJWWh2S3BEbUtzUnEyaWY5cnJlaDdIcDV3ODErclZTRmVoNlhQRFBX?=
 =?utf-8?B?YldTbWNYYTM5MnVXYW9HQmxITmdMeHNIOTlWaWZuaGltNzk1R3djSlAxSkR1?=
 =?utf-8?B?dmNpUHhUL3RiMWk0TENqNGFjVTNRNFBleE4xaFlKMmRhUEFSSTZ0RFBWN25L?=
 =?utf-8?B?cDBya1g5SlZWTFkrUHlrZjNpd1hKMVZrcC8xeFc3SzVNTy90d0hiR3FNRlA0?=
 =?utf-8?B?WlhDNFBlYUFJdDBSSWx4eURraVNKT0kxa0F2c3QwZFc1Z2szSHBVL0tibURD?=
 =?utf-8?B?SDJsTDRKbGZsZ3BEME1Cdkkwdi84VU9sWkxpZXpBYzJhUnhDczdsTDNabGNZ?=
 =?utf-8?B?ZHpqakhleVZzbk1ydWtGVFg2NTRyanZQbWtiaEN6R1Nuc0xJRVZWMmtYR0hl?=
 =?utf-8?B?NVFLRVhMdjQxeE01bnJCMzhPUlg5WllCYld6cG5TWUVESkJFbW8rU3ZmNGFM?=
 =?utf-8?B?Y0VaRWw1WDZIcTVkUnJVWGc1MjY4ZGxsbHZPKzJJbi9wY0VBWi85TlFidG1t?=
 =?utf-8?B?cjlYVjB2YzBGRWxNOWVXL2x4b2lJTUlqTnoycFdSL0wxdEI1NkE0Z3h4RU5m?=
 =?utf-8?B?a3BCeEMvU0R0U1l5bGFSL3JWcHg4ZytBTjByM2gyTTdsRVlSYUliQzFNekU2?=
 =?utf-8?B?MUdOdmVRQmdCVmpKeXBjUXdQZ2tqSEVZY3lzdjhpN0xENFVIY2RXUkYwdFhx?=
 =?utf-8?B?TGV2QzNpUEl1RGJqb0pDaVNZV1c1WllLVXJiRENIL1RPRkNMZXBoVStaOU5N?=
 =?utf-8?B?RkYrb0ZVa29JYjlBZUM1MnNrZkNzNVBxVFpSOHZQTlRoSGZoQ0VOeThGZVRy?=
 =?utf-8?B?VXE0VHdiNlMxaEFuNzRwMER2a0lESVdhbERiMXVIa3hWNGlqWXNnWU9xZFBi?=
 =?utf-8?B?M29qYmpvTi9rVC9FbytVRk80NVNwU3M4SW5mdmt1dFBaVUw4NUkwQU5mNGtn?=
 =?utf-8?B?UUwydnBBblhaU0w2MUlZcUxLMmc1OFdqVzNodW44Q2JQeU4wOVN3WUc3ZzRt?=
 =?utf-8?B?ZGNwcDl2L3Z6UU9NQmVFUlR5Skc5WTdKYjRQZWdxOVJMaFRmdkdpWjZheitI?=
 =?utf-8?B?MmxaNkp1aDZzb1BETC94TkY1ckZPbVhmK1ROMXY3ZzJhTUxZOTJzUEN1UnRC?=
 =?utf-8?B?VnRYczhDQnQ2REZ2WEp5TjJSUjhlWDcram5PS1ZqNVU1SWR0RWpIRndMMEov?=
 =?utf-8?B?K1RQem91TkFUYlk5RC9SUkZVSVA5N28vZWVsT2tFSjdTU0ZMTVpIRXZuSnRO?=
 =?utf-8?B?cUN1Rkw0RUgvVTEra1crc2RYandaQTVwOHdsdzZ4SXIxdTZDb2lPZWR1Y1lH?=
 =?utf-8?B?SjNxS3RkMUE0MlNCd1poQUd3aXIyS1g5WkZWKzhzKzhLOTVxTXkrSGw2ZGdP?=
 =?utf-8?B?RUMyenMxaFF2cG5yR3JWcE90T3RRQTZqY01LMUYrd3VUZjlqd01KOThZZnJU?=
 =?utf-8?B?Wjl4WjRnVUNBajNWellWU1A1aEQ4NjhYaFhoZUNrSzY3dFJ5VHgwV2RpZmsr?=
 =?utf-8?B?Z2xzT0RmUW9nYmRuT2x4YWRlNW1DYUptT1ZiNnJzMW44NlM5MzMvYUpmVUVY?=
 =?utf-8?B?aFEvbmZKVnhla1MrRnN0MHpoL2FJYmpmTVZabjdiSm1lV3U3NS9MUWFUM2dt?=
 =?utf-8?B?eVliQVF2c3N0MWsxaHpsTE9WaEVuQmhxQXlLK2NGbkE3ZWp4OTNqS09vOVVs?=
 =?utf-8?B?Kys1dkR0c21nU0NJZ002Y3JYajJEc3VTVUMyd0lnYjRwSWMyTFpkUHhUNGc5?=
 =?utf-8?B?RUdyZy9hTlJQa0hvZlhNQWRqWVhCczZUS3c3cngxVjBEWFdISWh3ZVQyVTlD?=
 =?utf-8?B?QWVJaFM4ZkhSREVWc21sbTVQMkVRSEZhZG8rcjZnVG9vNXZ5L3ZVVGJuUWti?=
 =?utf-8?B?Qmp6MTZrcnFhc09VWHBqMGhEZng2MG5SR0t1VXQvN2UrN1Foa0xhYWhoVzVn?=
 =?utf-8?B?a0FrUEVRcCtiUE1KRHo4ajlQMHpQdkdzeVhuZjhIb3NLNlZ2elFOeHhzVHhk?=
 =?utf-8?B?cmpJRENpbzNiMTVnSnl2eGt5elRiK3drcTJTbGgzdkw1eCtKTWZ3dk45YnV4?=
 =?utf-8?B?dUlyM204R1FvYnZaekhjL21aSmF3bkNIUFNweHI2UjRQejBwMUE5ZjdEVEx1?=
 =?utf-8?B?RDV2ZSsraDZpaE05RXRQRjc4dUdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:28:29.2410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0680d1f-cbaf-4372-52a0-08de552d0bd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997702
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 18:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16977



On 1/16/2026 11:56 AM, Denys Dmytriyenko wrote:
> On Fri, Jan 16, 2026 at 11:36:05AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent change in oe-core [1] reworked how the recipe chose to name the
>> subpackages.  The name of alsa-utils-midi changed to alsa-utils-amidi,
>> and alsa-util-scripts was removed in favor of separate packages for the
>> three scripts.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=26a28ee7935091250a8c52f223a7a954d9e29d34
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v4: More pacakge name changes after more testing.
>> v3: Fix commit subject.
>> v2: Added three more packages in place of alsa-utils-scripts.
>>
>>   .../packagegroups/packagegroup-arago-console.bb            | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
>> index f6ec0a05..e13cb3c4 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
>> @@ -13,13 +13,14 @@ ARAGO_ALSA_EXTRA = "\
>>       alsa-server \
>>       alsa-utils \
> 
> Doesn't alsa-utils meta-package automatically RDEPENDS on all individual
> alsa-utils-* sub-packages?
> 

That's a good point... I completely missed that.  I thought it was just 
including a sub set of the packages.


>>       alsa-utils-aconnect \
>> -    alsa-utils-scripts \
>> +    alsa-utils-alsaconf \
>> +    alsa-utils-alsa-info \
>>       alsa-utils-alsactl \
>>       alsa-utils-alsamixer \
>>       alsa-utils-amixer \
>>       alsa-utils-iecset \
>> -    alsa-utils-midi \
>> -    alsa-utils-speakertest \
>> +    alsa-utils-amidi \
>> +    alsa-utils-speaker-test \
>>       alsa-state \
>>       "
>>   
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

