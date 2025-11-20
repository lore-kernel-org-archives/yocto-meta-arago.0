Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AEDCF9C40
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 16:10:06 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.253.1763655005797204981
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 08:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FvywFZYm;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.46.52, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTxuQdN83hqRZEc6cighGmaMFXKswFxmpXdWuBRXDl1gGur5Jw7+VBKYFwtJeO8yUtTbHmE9UmXNjMKqBExO6vg1Tn7vKSGqWxT77FZCyNhOPRULqBC5AAPGQ0aRv2MQpcv20g0x+WFTM1jANNkxshoEpZhyozdBGsIjpCYmtOpXZsUfdCXEJ5wQkBFIxtADjrUdGx7172XbgkAirixMedPqa2YyGGRo/jEqbI4lxE7WK2Of1ttg4Gp9gWhmWWvL3SJB9FpaILH1MVBKhk7sxIhOQfVQiFHRCBQgw9hLyF1yAMRCot2y7+Ax2eNJU4TxG+CPCkBXe9lbgY1ZiS1zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+iblWW5ban7pqP7/4DXXkbUDvuiZDAh6XFEb7A4AKw=;
 b=gVKcd4H+lYPr+cWQ/70aMi+qvg49ZHnhJ8Vn+23L2VV4Mm6QYNii920C/prIkE8zkcTY2r3kBtFePG07bLjozN7ZeEZZHG1m8yw7FA28s+irss24SxwWPn4GpVGhHYMF+blhs2vXKHU0sAy4S8l07Ba42y7cr6uUpHaIDfQOGdEdV0rJpltyN1dy44gcymGDCcdGzeTZgRcrKaCbUmTIG5wpRmHqwQBC6KGHS/jQDxi7ksh7fQhVzRHgBaLh69dNprKE7V8TdWaBmfRSPDc8Fuz20NeqHEEXuC9xioy/Yr7lOjPkNg59FKwUW1L4nxXS/R12FErRdKinrwzowhcUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+iblWW5ban7pqP7/4DXXkbUDvuiZDAh6XFEb7A4AKw=;
 b=FvywFZYmOwlnPqGR/S3OVx2Y0hqrIcuzW3JIJMkhIy7d1yXF3Ks8ZmDn1XpOYpZB94wDJG6AcGH6Mrn84XHtKB+vlce1xqYZhruCzkGscIFKouuyNPfFeyj1mXiQGUNaxPcop0oZjVNupvhsHujJl6TH8o/JfxsE15iGoWprzpI=
Received: from MN2PR22CA0029.namprd22.prod.outlook.com (2603:10b6:208:238::34)
 by SJ1PR10MB5977.namprd10.prod.outlook.com (2603:10b6:a03:488::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 16:10:02 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::f1) by MN2PR22CA0029.outlook.office365.com
 (2603:10b6:208:238::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 16:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 16:10:00 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 10:09:52 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 10:09:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 10:09:52 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKG9qjC3908500;
	Thu, 20 Nov 2025 10:09:52 -0600
Message-ID: <1f1d3c0e-ee93-48a9-969b-cd2e617a3b65@ti.com>
Date: Thu, 20 Nov 2025 10:09:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] nnshark: Set missing PV
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20251119215228.185294-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251119215228.185294-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SJ1PR10MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: c5331db0-20c7-4158-ab46-08de284f41ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SSt4N0crQ1UrNVp4dWdKU3hHcm96bmRqWklIYUFEUklZVnp5UzcxQ2laZFJB?=
 =?utf-8?B?Kzd6cVc4cmJqQkNHOEpFZmQ5RVU2U0lBU1NLRDhvbDh4S0JqNzdHVkNUMith?=
 =?utf-8?B?aTlBRmczZ0VlVWd5YVVlelI5K3ljQTBnWDk3SHB6dzJTMEZZREFBd3YxZ0t2?=
 =?utf-8?B?MDZhU3E5TTJpNGttaTdNV2Y3bElVWXFoakxoZjNOOW5PWXhoMW01K3hGRDBp?=
 =?utf-8?B?N1FNY1ZEWW5kTG9nSkVGYmtldm0zRjNTd084QjM5bXhnWXBUalZURU9ZTm40?=
 =?utf-8?B?NE5CaWNqNW15NndqMWJpd0xMMWFvbVZwSks1RHZOVjIvTUpnbXJOdkVKVEhi?=
 =?utf-8?B?bWptTkxSTCtpZjF5bDh2S0lET0VpUEpSelIrNlBiZ2FOU3ByVXBoQnUwMFFq?=
 =?utf-8?B?ZTFPa3o5V2hqNkVJWU9JQ3pCR3lZSkdiSVdaU3pHd21OYTlES3JPSDZ3YWhX?=
 =?utf-8?B?Nmc2bkNwU2VGZmF4RnBmZVRTMFgyRjMrVHFaYzR5OUkxbG5tRzlWV2pTTFIr?=
 =?utf-8?B?MmtZaEc2QTVjQWZoUDhWV3Z5QUZLWHdDaUVBSkRFTVRzN0NDM3VyN0ZDM3lz?=
 =?utf-8?B?WWFsSURqMTZoaXFCb2dPWU9SSmdOOSt1MExUYWFMRmpaOWFXQmJzNnVaeUhD?=
 =?utf-8?B?a1ZxVlNhQTRLRUF5Zm1yanA4V0dRRmUxcVlSQnoyR0VYOGNsRjRvV0ZlQ240?=
 =?utf-8?B?MWh1azdnVi9kMnMzYjJmOTRld2xNaW1QVnVJLzJORDdFWkZjZmlmazIvK05i?=
 =?utf-8?B?c3FITGIvSVBIV1NnVlkwNXh4QVd1UFRKcFZpNFdHNWtYTUxpYUVIWVFoc2Fx?=
 =?utf-8?B?bHZpWTR4UzJ2Zjl4c0NVSTFxMEozQVhmaUFIZk9oR1lUeE9kamNGMFE0Mjdy?=
 =?utf-8?B?T3lGWjVYMVpjaVJoWTNlMVpSUHRha3diL3dLdFVPT0MxNHVJRXJoS2g2Snhh?=
 =?utf-8?B?NmVtR1FRcHRJbzVjUUNpcU1pa0dSZDVkUVlWTzM2SnZRS3dBbmNzazYxd1JB?=
 =?utf-8?B?UEpibXVJTkErM3FYbk5xNHRIWHZoOVhOQWxmeXJQZUJJMjhGR3FJSXJMc25s?=
 =?utf-8?B?clZtUzRnN1dRZ1FHV2UyZjBWVmF1VElkcFViM2kzVE9NZC9yMTFUZmZ6d3Ux?=
 =?utf-8?B?d0M2cit5UDA3WG9KY3M1aVpIQ0RhV0hScE9KTWwwNVJRVndTelJEK3RWZDBU?=
 =?utf-8?B?eXRFR3hwQW9HZmNYTWwvUTR2Q1FET2RWSjJwT0d0Znd4azFIS2FCcUdPU0Fr?=
 =?utf-8?B?UTgyTHdwVGdwYnFDSU45M3cyWkRHN3dmZFVqSU5TSC9IYStuMzc0NHVxdGRD?=
 =?utf-8?B?Z1R6QTlraTE1SzdqZmZHNnRYZlR2V0hVbVJGb3pVVlJmNXMzUmswVHdyRHVH?=
 =?utf-8?B?ellGdnMxUHdxUk5KZGcrUzJmNUZoTzRidXUzM1RkQlNWNXdPSDRXOEJMQWVq?=
 =?utf-8?B?RG1taFdBUDd5NWxlV1ZGRkRxM2VQaGR0NVdHQitLYnMwbEhMVkhtTXZBOUph?=
 =?utf-8?B?aUlRMitlNkhtdjRFYUpMZFlFdWJwN0Jta1BtQXJLOXF3anNncm9rWG5DalhN?=
 =?utf-8?B?NHhteFFrbjlwdXBQckxxTFhtUkE1NTRkcGlZanFmaHRSeXh6bmN5S1NVK0dy?=
 =?utf-8?B?eWFIYUkrWTBWTW8yRCtpbEdjSzFIWUVJWS96Qjh0TUh0Ui9KSStBNVhxN0lK?=
 =?utf-8?B?UUhIOTNiOGNXclZpcTN6TmhUU09RVTlxNHg3QThQODYvQ09ld3k3NjBxMW4v?=
 =?utf-8?B?a1B5UTBRT1VCUm1tbjdGS3JmQnpKdEhINDZmMFliNnRWZEcyK2hUczV0bG91?=
 =?utf-8?B?NlZyQlE4ejBsSEcxZGNocVcreEdSeXpiZGUybVBWdUx1WmZBcERtOWlKQXVm?=
 =?utf-8?B?b2F5R3U2VnFOanhJYjNRczQyUU9VYmEyS2hZRENSUHQ5TjdvVTJuelpOWFpt?=
 =?utf-8?B?b0gxdnVFVWZKLzBYSzA1bjBSQnIrOU9UVWhwR2J0SGRRenVRNm1vZVdXTUNv?=
 =?utf-8?B?cUV1bWtrYjRNeTNVaUd2emRmOGtvYlh4TEYrMG1iZkhuNE53Smo1RVd0SmtM?=
 =?utf-8?B?RlBkRXJNVkEwdmpXcnN5WElwWlllWnBOR2JQQT09?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 16:10:00.3849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5331db0-20c7-4158-ab46-08de284f41ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5977
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Nov 2025 16:10:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16815

On 11/19/25 3:52 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Based on the git repo, the latest tag was v0.6.1 and then some
> additional commits in git.  So tag the current PV to 0.6.1+git.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> index 505aaa4c..89be15f5 100644
> --- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
> @@ -5,6 +5,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
>                       file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
>   
> +PV = "0.6.1+git"
> +

That tag was 6 years ago, same issue for Coremark in that other thread,
seems some projects just gave up on doing tagged releases. I wonder at
what point the "version" stops making sense and we should fallback to
only the git sha? Oh well, problem for another time,

Reviewed-by: Andrew Davis <afd@ti.com>

>   SRC_URI = "git://github.com/nnstreamer/nnshark.git;protocol=https;branch=master;name=nnshark \
>              git://github.com/GStreamer/common.git;protocol=https;branch=master;name=common;subdir=${S}/common \
>   "


