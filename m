Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C77F8FA75
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 13:21:05 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29110.1776777660010823768
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 06:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=DHVqUMfP;
 spf=pass (domain: ti.com, ip: 52.101.193.65, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZD+FDetmLNewXmXBluqLbYsXs0mQqtFVqFrmiXP9Su8H11iZpB/cWzCPZrcmiyq25zspk4ppxkLriZ6oUkBd6G0ZKVOzzeP63waabq/dSAb7vlxZjUii3rNVPLwEJzJty4IHt4273QJgqyX+TfN7XfW1J1xm9+Nofj7fJQzFMQrXb/HIO0BnhGMk5jkVXdCRbljryf+0TaGvwitNl92pYaLM/5s/ZJI0i/99SrbKm5J+PFIiW6zHBel9Vqxm++2uA4EPvVNoNglMLyI8tdeQVK5kOSc1EuaTKbRyDM5BHt2/K7eiD7pmXw3a2h/N6L0CrFoz/M+gyhCXm6R8z9+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMJgkaA5iH5ryo3JbVFfqXfzDWwodzDeOybB943Q9IY=;
 b=RY8aOmdPEnpwZh8IXBIPYOQHg79YXIvh9TaCcPOAE1oumb6toBT278qv0kwnxWT0AtwVCyxpJSXsu+EeWGJIOD7CP3LstU0t7xpYgi+wHZIS+JQKpExC3hXKCJ24mBBn4v+b7z1psBp/oMzGv+AIzWDVWpTEYQZ85pDbG/hezGKnq3/3VYDBVwCo71g6iRAhrN7hbGx0pjQ1dBdo7mbOpcNf8bQ7n0EFAcHc4YQZyu9n3xtVV3jPYbD/a+eMs32WYCYqN2Ok8Kv+S2JQ57HZ+0WXbgHZzYRxWE0yRFXqY1scMRzlrFiBO6WgP+INhMv+hFu2EQPHM7pPSnLXciaCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMJgkaA5iH5ryo3JbVFfqXfzDWwodzDeOybB943Q9IY=;
 b=DHVqUMfPhsGm5MSSJfkdPaTraJOvZbx6fevNBytF//73eHudtZ03KKIv0xfgv5v83LT3ifWdgIQiRMVt9iNTJ/Uu/IpraedaXMdgwgKoCvihemL08poqRrry6PZkpFldYktz9p5RljOa6R9hzOOmLvTMp3LpwiBsjKf0nTCa7wk=
Received: from SA9PR13CA0082.namprd13.prod.outlook.com (2603:10b6:806:23::27)
 by CH3PR10MB6811.namprd10.prod.outlook.com (2603:10b6:610:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 13:20:57 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::83) by SA9PR13CA0082.outlook.office365.com
 (2603:10b6:806:23::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Tue,
 21 Apr 2026 13:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 13:20:55 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 08:20:52 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 08:20:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 08:20:52 -0500
Received: from [10.249.65.135] ([10.249.65.135])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63LDKqU2535747;
	Tue, 21 Apr 2026 08:20:52 -0500
Message-ID: <37e9ff17-ca6c-414f-ba39-84f763983ceb@ti.com>
Date: Tue, 21 Apr 2026 08:20:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] mesa-demos: set default
 PREFERRED_VERSION
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
References: <20260420195557.22133-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260420195557.22133-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CH3PR10MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d52713-d5e8-4821-e82d-08de9fa8d1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fLBpLnh5PnYiw0U8ZnE5DJHMxZjmthsmXTp6DffZ5uofCHPBp4ZPO5XHl/2j4R3Pb1QZHT9FTeIMryz3Bt8OUTyTnAnWd8+pCaAxdB6HPiZg3FbzVIFTQ0eQf54kx82Arunh6ahhrYG6/bI7iR/adtBlFkMSRFp6pb1cKglNfdCjiFRy7qML/VCA+0FAm7S4WlPZhAx3/uHLAalp0zjZJe18d/9nao5BJ6kMov3bcxJ7amVHvwHNNkFI7vOTOeX04eQDLazSOekbiyQAk5qweeZsLFrEIXt2Jv3zWcdtvqj8hCKOJDJfD+7cuWGJBdb7MwcwAkRghb6V+8ib2vV/agW/+8JoDoXevy/MmI1pVOBm3FSfvSQtMAsCY8U3rFKgtK7Y2fotGjNaIWkZ9enPnC8yI75GT+uQpTPBmqBpI6p2ek+n7ZTZB5zSb1I13gw846pmdmHqDGdi5g6V9E+UlqBzh5bZJqoiVVfvMR0HAGa2v//71/H2yHQRFhYEwHX/Zfc0GNcFr1nOtUX3/TF/VTJplJCCj02kYDAWJv+NHa+5AP2xADW4x1+zN3z7taw4uQYSRL8XS86L/PF3HlVOYE7nDqWfVTjx4yiQ+Oxf1XCMby54o4Egqzrr86pDYHdvjsGRRUeTCcOxOuGiYkgS7W+o5hq8H45dTFnJCGNSsuArNe0uOOLtUdnqQvnjoBKFm7irpFnpIAseL6zoUI/w24V1EQxcSik+3262NLVxrDBARdPi0oicBjqVavlR5WX190sCGL4XNgka8LehgVRLqw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U6Hhsof5dMbV6TEKHGv8tJMqYkGJJFPXerS8Uw2rYDc7YeOGAoFo+3mG5eYULpypXnEKeCmg20X9Wa/pfOqh1JVFCYUAurqbFWCenSm5zca5VOKCFgMLerEU9MoeX1RjE8nk1L1C66/Wx8dWvkNRqnsAuVFPhjyraMQxfJ2K7x4JgwX0kC4CzLmb7xQonlAm4XgK5z+GUDf1LcUOVTsKLsAg5p6BnRl0P71SMzZrCrHCqbfxhouueChqV0uEGDci2UeTvKwC90u97tPx5QtXgRYnuQ6WiTdShCv3/ptdexKwkoY6vAGqb4vHufd81wOoosVzOYof2TWQeZg9QMn2E46kEIhLBSY1KKhM6BkEPDWTCJSVIV2QuW9fo1s54Ue55t0LBxL8e7GereMqW5bYkAeflUXeKVfWMWuPkrV11QhoYVfRWjV4Unpt3no9wZLC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 13:20:55.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d52713-d5e8-4821-e82d-08de9fa8d1f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6811
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Apr 2026 13:21:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17479



On 4/20/2026 2:55 PM, Denys Dmytriyenko wrote:
> From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
> 
> Set default PREFERRED_VERSION for mesa-demos to use the version from
> OE-Core when not using Arago distro. When Arago distro is used, it
> gets changed to our version in arago-prefs.conf
> This addresses the signature change issue in yocto-check-layer.

This means we have to stay on top of this change for when they change 
the version from 9.0.0 to something else.  We will be preferring a 
version that no longer exists.

Need to think on this.  Thanks for tracking down an alternative solution.


> Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> ---
>   meta-arago-distro/conf/layer.conf                         | 2 ++
>   meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 2ad036f5..af3be2b9 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -39,3 +39,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>   "
>   
>   HOSTTOOLS_NONFATAL += "corkscrew getent socket"
> +
> +PREFERRED_VERSION_mesa-demos = "9.0.0"
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> index 2da3ceff..62cb0ee6 100644
> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481
>   SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
>   SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>   
> -DEFAULT_PREFERENCE = "-1"
>   PV = "9.0.0+git"
>   
>   inherit meson pkgconfig features_check

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

