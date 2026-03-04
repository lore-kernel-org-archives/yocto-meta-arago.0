Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9080CEF9011
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:52:57 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23226.1772643167724897086
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 08:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=amzaQmcj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.59, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lovIo0W7qFShMSxOqjYMX9xpMZX2g8yYRgVe+fg7JD4goqPhFZRxz6qNxsnSh0BCp7aRLzphXa9BBNrAAIX4YFYtCHI3C6ZreCSbqU4rC1XocyaoXUtaVuwlJ+4Rx03bUNsY6bxsYy5x44cHFg+h83FzaUJjtNIhpQZGtPbWAxQAtbvADtg5hYk84xt4n65jycaqueQUqxjzA35ywRnBMLxSwWHJnN+bpSPrHBo17jx105FZHYOftwGaHDzdlWgL2EDu7fUdK9wEt6Y2CGgJ+mQ7wgZn7tDpueQt1B48Jqcgc+eVe6+AkwtxyezEko9wxb8WayDEESjSbvKsBeiiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqxrTDfvm6eryBs9ClMBl5I81NjIm4B6XUL7tDuN1Oc=;
 b=Bx6dDqkdqwmLVWrF/dbwr5qRuVfQC0OVAttHDiggyVFsntsmREhmxE9+hJhMTbOdFKYULixHcsULmZZUYfTH0zgznUV1EX7lDfjY+2TGEVZlXxva+e7QUsdNvy/vmhc5uB9JSQwKWrl9wddqVVUGl1nYKhpUArytHLlXQRLmWG6dYU16oBFGkT4dTaoKE2AechXQVtOujLAR6N3dzcpU/YJEo4OG1ZxS2UrpL0A+2TjqQ5GXIZBLMWX9GQNCJ0Ww7r001y24tf+XB2wFfU7KiIZ9CvbMlB+GzPFC8SqitmLVRmcEyiaL5NjsfxjYm0ynxmWEHf28sGZs9jkR2GKdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqxrTDfvm6eryBs9ClMBl5I81NjIm4B6XUL7tDuN1Oc=;
 b=amzaQmcj0+k+0JldDb49AMoEbyiT2Z1BkttNNAFhCh4QM5jn4aveX+hniiTo1Np86UI/VRiudnUW+xjOMvmhlorar5257zIMqxaHnxiD8ORNb7BrmpB5akM9e0BO9ZkPE3lHMmqvPJzqeK6f3iyHBE6Vp6HuYF1z+r8uz13HjS4=
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by SJ5PPF77807A52D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:52:45 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::b9) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 16:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 16:52:43 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:52:35 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 10:52:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 10:52:34 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624GqYoq223148;
	Wed, 4 Mar 2026 10:52:34 -0600
Message-ID: <3b988aa3-970e-4c10-a075-4e2f62422375@ti.com>
Date: Wed, 4 Mar 2026 10:52:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 4/4] nnstreamer: upgrade 2.4.4 ->
 2.6.0
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123221.1450993-5-p-deshmukh@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260304123221.1450993-5-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SJ5PPF77807A52D:EE_
X-MS-Office365-Filtering-Correlation-Id: 92faa57c-e18a-4ba6-6a75-08de7a0e74a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	cF2IxethEQdMeJ+6Iwth4ZkiS38oDSsZIljJxrphwbbDFTBRvqBKpM9m0mahowRGGuAWlhRo4mDuBxNbTmu6hntECBqatXGVfhKbjZQ5coKTPNHok8jA3hLHa+hAMyGO0/Pnit+T2vl2jb97MNhZHu+4OPeJHgv6i91r3RPhRsbIoIrNHVNBy29iNw7OvphY9xvJ5Yzr9wQzZornMTyC/YdayhouRKZVsIAkC6xdx8nBo/fGSRVMEyDm9WhU32Zf8qGZgQiwEsbNb/wylQqjkLb1cNDN9st3ZHGVg1LQCmNkREwWAJZyZFbTU6IYSFqM94GX/4jEBHzB/jK23mDJMy7qA8xnCpUsewrgIoGXC7Rvqg7r2lyWJx18kxzY4YW+Ic1ViBua+YbtNkEW2g/SwGDQtb5q8DKJUKuN80GpSsmeMhDj+uEeSi7lI8oCPcGPmtGjw56oU04eR1INbcWWR/gq/hptIP9BmRKkFb4ZAZ/Y+7NMCpnai47pDrvud04xg8HD62cyEIAXlFNwELBhF8YUiSFO9pSPOKGStEiGJXX9gHuTB7NOcz4StGjOfTML0tGly8moy8M8zuhVGYqo+2rYOUVhtbxvpSG88Ub2E1sX7z5TXq2Vmnq9SnYmwNSFJXxFDcv2sAGTHfSj+2T0Zj+ddaCYClmpwve1N4x3lcm2iV+MXzThGkPxsXFSdMSA8crd2g9gYcznciLtsSYH+5b/0EC6Sng4ZckPhnhTfF3LZqsMKObA3zW/8TZcvoxkgkqRurHNpMbLcydSWIBE7Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kALUT7n7NR0WEO8e+xhr7bx6ujIv2CKrKmEVuL2AOnjiXu8aQoOYoHvuO6Mf+vI2SZMtlNyaV9P8GD48+6m5tk35DYS5tKgQljgsL2jm+Di/NEauWlzGXgrBAbWFSxPyW5/8MTbRfm7z/fERGGa9XosYwMU/Ud45ltSrrXGPyeppSx2VpzQncOl1d+EU9O5zO21gVdpSKzMgxGQwbJCfP/DaDBC/6OqDys78c4QlaiPzWebwGK7lfAzQ5G20w00xrx56YQ8Ge/Ts8zbNrFmQhR0UZ8aV+HuXyhuxoWVJaRTbnGmJW/v7eJE4+7snYRSc6/BMSFgQ7U9D05YKeW++ZulJyFdLCzXedblnHg9Nh5bMcxjm7S+KV9OLOsIwU6MHYBOasQvE8hvtiUyp3FfG14NPh8ls1psJ9+IXNvINrtc+3Q86mqU+Lw1UDgzyCE8X
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:52:43.6991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92faa57c-e18a-4ba6-6a75-08de7a0e74a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77807A52D
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 16:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17223

On 3/4/26 6:32 AM, Pratham Deshmukh wrote:
> We are migrating nnstreamer from v2.4.4 to the
> stable release v2.6.0.
> 
> Key Changes:
>   - Updated version from v2.4.4 to v2.6.0
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
>   .../nnstreamer/{nnstreamer_2.4.4.bb => nnstreamer_2.6.0.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.4.bb => nnstreamer_2.6.0.bb} (97%)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> similarity index 97%
> rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> index 3419e5a3..c62589ac 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
>   
>   SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
> -SRCREV = "3b32573bc104b4708af44837466b8b6c73f94869"
> +SRCREV = "b970e9eff6bfb4e915463842422fe14bb2e53f84"
>   

If only all recipe updates could be this easy :)

Reviewed-by: Andrew Davis <afd@ti.com>

>   # Only compatible with armv7a, armv7ve, and aarch64
>   COMPATIBLE_MACHINE = "(^$)"


