Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311A2EA4FC7
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 14:54:46 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36694.1771858483595144369
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 06:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jDwrKeqc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.37, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/Vhedbcd5abXB+gCGKppoSul5oaxk/P3Af23IobnU8Phj+q3xnyh/rM2GASRZVdZlOs53DrOyxIfq80Zyn1yeB4irzeuRtbT7LZ29O2m9V+Kifxfv14QmjM4Yo0KZL7bkNhexHp5IgqQiDZUFRNPq3VuODrSzXeGrHa8NgZkcHlacARjYn380RlEtcen7w9npJ9WOehIa33HxL/OV/Wkddq2+W3FwW338Re9+F4BPQy9/SdVyX+f9iuE9DQ5uGgw4wFIJT77WB4xLDhA37Lu4b82pVwfG3s1ltVPtFgSwLcshIRAhvW3h2sgURquE7DweYnOUcscJomltc9pFIhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8r7iaKytB0xrXHiSzyG/NyKu6xI/P7hdlLogTR1NYM=;
 b=ZFSjpQL2qRyV3y5t+Lg835kTnAAyKdutO/O8qJOAiQXBSWR5L9tGEfttJdB2Eh3qb5eOKgpDcJuV5W0so0AQ6PalT4OGPy2rBnZIFHiHrY8Ju2K0D9fEfSyP31D7YBB54cRrLsKRYyMjdLl7DIMjrPdeu6s0U1rYRz8cbS1j8GbCUZ/UvFQnT2CVRQITT0MvT2QPiUc4gyxDnvA2gvGd1X3jWaVBRq0Qia4cv39o5oGgs4QdwACqRM5FJdkPo8zwo7oN0AKMQzcnNqOiKy2+aXXZmMG+iMozrUsqWm6uR9XD4lOTHO4FbY0qvyTw9iZ4WiGbwu2rfAlKsFkafX3ohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8r7iaKytB0xrXHiSzyG/NyKu6xI/P7hdlLogTR1NYM=;
 b=jDwrKeqc/OnO7utwnGwbMvoe/LYWGeaHE5VPfyv6kHrjDvmxkGR2kUQXd8Ew1VrQ2KMMLvzoPBmgV/4VlX0gzI4+gK/alPzxszBcOC7kHGVtrhMqvSD/BazDzvUfwDDLVbefyjcosiyLessqtvHLCmqgymKwfVeuN9vqVav259g=
Received: from DS7PR03CA0142.namprd03.prod.outlook.com (2603:10b6:5:3b4::27)
 by DS0PR10MB8222.namprd10.prod.outlook.com (2603:10b6:8:1ce::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 14:54:39 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::3e) by DS7PR03CA0142.outlook.office365.com
 (2603:10b6:5:3b4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 14:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 14:54:38 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 08:54:37 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 08:54:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 08:54:37 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NEsbsA518455;
	Mon, 23 Feb 2026 08:54:37 -0600
Message-ID: <d18105df-6f74-4f5a-bcb4-b66d3829bbbf@ti.com>
Date: Mon, 23 Feb 2026 08:54:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layertool-setup][PATCH 1/3] kas: set path for all repos
To: <rs@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20260220235407.1064734-1-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260220235407.1064734-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DS0PR10MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: a98ac4c3-ad5d-4d43-d096-08de72eb7799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUdITG8xdHE2QnBEN1Z1c2VGWFd1Y21MVE1GMmRuMGJTS0JYYUxOVFRJcUZK?=
 =?utf-8?B?NzBRSEZQZkNwMS9ZUUlxTDhEWFd5MEhKbEdlV0cvTmNjWGYyK3RkWVBtU3Bj?=
 =?utf-8?B?OUJLTVhIMXVuRXZMRVgxR2d0VXA3U1MxQTRPaUM0SnNlbnBhNGFveldobWpK?=
 =?utf-8?B?SjZrMEczRjFwVGd6ZldvUlNFck1IUzZFalA4UExSWml5SjdHRTRHYjRsMXlM?=
 =?utf-8?B?dGQrTmZiNytCd3FkbnBEZkxYbGhHdzlRelllREd5ZWpNZUR1b0ljMWRjeUN6?=
 =?utf-8?B?cmZadGhzemdHK3M5c2tKTUV2YWRuaFRTMzJNdkgzYktONHNyM0FTbkN2TG5t?=
 =?utf-8?B?dC9jSHNwaUJJdTR5VUsvbDFLRC8xd0NkcUFFaDVWeHVMejQwM2ZpUVo1NC9Q?=
 =?utf-8?B?V2dVNVhtUytwaktOcjNTMTBWWlJTZ3RCRWpPUVp4RWQydTM1cENYZU1FNkFr?=
 =?utf-8?B?aW42NmdnK1ZCMUgrdkhOTjZBUUswTi8zR0FyNjlkS01laVJCak9oSDBtbkEr?=
 =?utf-8?B?NGVPcmtqVkU1cGJVcjNWUko2OU9BZXZOdVNNaVZZemQ0MGlpYjRBVndObUlJ?=
 =?utf-8?B?aFFQaWU0WDBtMm1HQjNlYmxDTTNyQ2NSWDBMeXpiVjkwVkIrWmpWbnk3VDNo?=
 =?utf-8?B?OXJnSmxvRE5qSklJZnVzcDdhWUNKei81YzBFeG16NWYrVjI2ZUZoTStIT3hT?=
 =?utf-8?B?RDVFdGlVbVFWZ2hPUzlRcEh1OW9jUUgyU2kvbWgyZ1pNUkRaeXNzMTBubGVZ?=
 =?utf-8?B?SjhBbU9lTjRKUXFTeE8yWVdVdWVrNXhSNHorQXFRRzVOdmdxanRXdG5ENW9O?=
 =?utf-8?B?NFlqbnBMcUJoajNya0w5Smw3MXh5UWUxQlZhNGlmTlkyRURrdXFBYVZaMXdh?=
 =?utf-8?B?Q3FHdnQvV09ZdGQyS2E5TUlpVGZuTy9OeWpQTFBXQ0ZKVEhvQkhFUmR6dlN2?=
 =?utf-8?B?YjlVR1NLWWhlTWpLbFVib2lBT3F4THN0cUlwQ2tyYTRrbjJ6bDVzamhaRGlM?=
 =?utf-8?B?TExsWWZiMjRwaUNOWlNpcFV3THZlbU9nMjhUcmxVcm10c0dHcFFmYVd1MFd1?=
 =?utf-8?B?N0paeUxQZ0tSOExsanBDc0FkQzBsbTJmcS9zU2piZ3YrYjkyZ1pxYTJFSVZB?=
 =?utf-8?B?VDJiMzVOUnJLN05FWk1waGJnOVBibEtURWlQL09CNStxU2lnMlYvajhmdmdv?=
 =?utf-8?B?SjJxOG1VRFlaenczeCtYR3E4VmVCdkYrQWNxWVVDelJOYjVxeFQ2UVNSYksz?=
 =?utf-8?B?ODY0WlBGbGlzMk1ldUlVUFZYdWFnNTVFdUp5dG9zUS9kSUdPdEhTL1BPcGwy?=
 =?utf-8?B?NTZUOEZ3aDdiYWdqUmlaSlJUc1hiaHNOR2I3SlViMGpyMktwZXZwSCtveWdq?=
 =?utf-8?B?bHpaK3FvanptNS9ybGxjU2tqalVvRXRSc1hGd0FZN1VNb2txZWpKMFEyRTYy?=
 =?utf-8?B?cUFGR0R6eE94U3ZCZUFtOWZKUUptWEk0K0kyN0lyaHBUNHJaUVFaSCtkaTBv?=
 =?utf-8?B?QVFTZXZoa1dOd3dORFNFd2FvaDR0Q0pJcTBnUm0vWHZXTlZuSGdCaGljWHYy?=
 =?utf-8?B?N0xGQ0N1VE43U2FFdkJyVUdjRHdJNkk0QTVBWW1pV1BLaFZsOWdHSEt0UUI4?=
 =?utf-8?B?MHg5UVRzRm1lSEFMZVlwUjY0emxaRmZrS3dJUk9VUWR4SUtiM29VTFFYM0Js?=
 =?utf-8?B?OXIySnZQMXAvQk9mZE0yUlJJQk1MRGduK3liQUZtYUdGNENEdFZsZ1o3SFBV?=
 =?utf-8?B?VVlnVk1YWFJoY2hEck9pd003Y2FTTDlnMFBwVDQxTmgvaWxFb2dOdm8vbDFy?=
 =?utf-8?B?VHFoUW9XenRBTmIrUGhFTHNHOE9KSjVJd0E2WEV1bnFJckVNdjBRN2c2Z25B?=
 =?utf-8?B?Z3A4bWorZStmQTVlUGNpU2dVQWU2a1FBNFFIbDcvTDk4MnFwby81bmw0MllP?=
 =?utf-8?B?OEFCZEx1UUxkMmphMkwyd1lpb3dDd2lkaG1iYVQ4NER4Q3FLbWZOVk5pZUdq?=
 =?utf-8?B?M0pkRlBiQU42N3BtdlZqU1BaMTBhNGkxOUpqVUp1MUZlYW1VZ3duYnkyOW5h?=
 =?utf-8?B?YUNtMzdBZnp3TG1ISVl0UVR5UWN1S1o5M0tpM3ZtVmhxVFVycjNNajhVS0l3?=
 =?utf-8?B?RVhRRllXQnR5YTYwWVpRZXpNbTFGUnhjMFJZaE52OUhmK1p0N3RoUTVxQzNr?=
 =?utf-8?B?dkI0aFZEM0svbTBBcDZDbG9zTUFsV3FySStSMHVDQmNPenR3d29VSGRxNnJD?=
 =?utf-8?B?QncvR3FjMjR3TnlSUC9xQWdHSTNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QL03xp/4dsqSsiNYZcbRRL7tZSVuWSRJeVmbNLVIPUhQqh2Z+yStHrlaLmAwvE4USojlWw1u68RmfRLCbIyRqmIME/rDr8dIE4JWsQrEzxH0C7rccsAIdDuunCNRg3xxgH0QqFZvyUud7aZes6q6EZYFEVHR+RqVHWzjV44uSogLUFZTJkgZLmjsTtrNUNF0eLDECDsdleEUcG5Ten31J39HYn1r6E+zk7oq1DJ/8kZkmvD2j9jozs0q6AM74pDsmjQVrvWdLLC6Y3wuwsKL9PEtiq4bMySoQl11qKuxhY6Ix2UfF373nCnze5yWiEmZXktCeKG8Rg4WaJmFtdzxijDYVYOrErRQwvkki3ccwaqmVpBQiGG689n92nG44H7qKbwfAXs4a6pEaxNT/USFNUZPfBdWwl2uotYhQ5vQPuvpsaBaf5C87PSCk707+gCV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:54:38.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a98ac4c3-ad5d-4d43-d096-08de72eb7799
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8222
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Feb 2026 14:54:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17130



hehe...   The tag should be: [oe-layersetup]


On 2/20/2026 5:54 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Kas allows the user to dictate repo paths to override the default
> behavior of unpacking repositories to the current working directory.
> 
> Given that the not all repo names actually follow a simple scheme that
> can be included in the gitignore we should instead force these paths to
> match oe-layertool-setup to keep things clean.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   src/xslt/kas.xslt | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/src/xslt/kas.xslt b/src/xslt/kas.xslt
> index b78b788..7d1fbd7 100644
> --- a/src/xslt/kas.xslt
> +++ b/src/xslt/kas.xslt
> @@ -37,6 +37,8 @@ target: </xsl:text><xsl:value-of select='text()'/><xsl:text>
>   <xsl:text>    commit: "</xsl:text><xsl:value-of select='@commit'/><xsl:text>"
>   </xsl:text>
>   </xsl:if>
> +<xsl:text>    path: "sources/bitbake"
> +</xsl:text>
>   <xsl:text>    layers:
>   </xsl:text>
>   <xsl:text>      .: disabled
> @@ -56,6 +58,8 @@ target: </xsl:text><xsl:value-of select='text()'/><xsl:text>
>   <xsl:text>    commit: "</xsl:text><xsl:value-of select='@commit'/><xsl:text>"
>   </xsl:text>
>   </xsl:if>
> +<xsl:text>    path: "sources/</xsl:text><xsl:value-of select='@name'/><xsl:text>"
> +</xsl:text>
>   <xsl:apply-templates select='layers'/>
>   </xsl:template>
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

