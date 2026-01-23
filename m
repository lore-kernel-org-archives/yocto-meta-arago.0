Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC115D74EF9
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:11:20 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1901.1769184673240611043
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 08:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=YUN05shq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.53, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGAp3UeC2SxE6HOQ958+ejswQKj/fT6UmN8oYLzMhy2yj/BzSNoloH4Dq07KUW+PpSP70bdcVTVo0hEx0l43RCT2mU8/fJpuVrsA8NZ8wS4vbsqpgJj4XvkawMw4U4w8KIMUcqr2lTr12ZvblrvkXPWE5+kq0Bvm5UNWjQcM+P4+J0ANH+oUioVgc22NexcCF7D8mNSd4nwEvDPmwam0cfOyu4Z3HXXUVwmtDmDcGTe6YgM4AA1q19oveezwokRS66lIMU7MtniskjFIeAr7ZmdlF6K4EhFoLwuZQa1GquHtD7TY2xbCD+tSlh5G8jCLNVMjPYU/BHHeayqEWBz1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcqI2urx7utO+1NBlL/0gXg838/3FMXY14GYNajo+2w=;
 b=W+k+7C8sDnKcQssb/6nafMA/RMtNDe4m93fkZ9nvtbblQEkcIfQWtFBb8KM9wUV3I9mL+9y+Csrm1H2pL87W3BNtUN4QgRY5cWTn/6L5D50CCGNinPPRn1YHVrQOTtSa7lBmq1OkhdrCLH6HKvuOUwe/9JoXrcmF7uDduc7QC2jalTh8DGOW90SyiMOh9mqyVh7hT5/PA5MzGVKOlIBUiXJXQ4cu77+NUXONnLRh5TRGEDGjkUPMI+75YWnzwwn7fmBZrs2X3HJMURQLzAMRiucrP3MuR2Eo6nPFiVgsHPmFi0Ttw1kQdQeE6X4L7psSOZQDQtr6cmxeoLl4M+SC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcqI2urx7utO+1NBlL/0gXg838/3FMXY14GYNajo+2w=;
 b=YUN05shqRgEKMi+FMmQEtYLUf9YnnxYJOZ6hUzF+9NZEAzVO42qGMm/mgL2PDKl5w6yV+qdi2TT5ATHs+X0iDofy+nPWUXwCxDs9A3wIBJg7nJT4qv+CtWdzPO9Dv4AdQZNJ1G5w8Fmb/bgvx8Mrmnkx7/LiRaC7e9s2oxeeoCw=
Received: from SJ0PR13CA0030.namprd13.prod.outlook.com (2603:10b6:a03:2c0::35)
 by SJ1PR10MB5979.namprd10.prod.outlook.com (2603:10b6:a03:45e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 16:11:09 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::7d) by SJ0PR13CA0030.outlook.office365.com
 (2603:10b6:a03:2c0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.4 via Frontend Transport; Fri,
 23 Jan 2026 16:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 16:11:08 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 10:11:06 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 10:11:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 10:11:06 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NGB6oC2449509;
	Fri, 23 Jan 2026 10:11:06 -0600
Message-ID: <446b4187-af51-4af9-b97f-97058399cdb6@ti.com>
Date: Fri, 23 Jan 2026 10:11:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][RFC PATCH 3/3] tisdk-default-image: Add audio server
 support for am62dxx
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<denis@denix.org>, <praneeth@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>,
	<devarsht@ti.com>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-4-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260123060348.2493115-4-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|SJ1PR10MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cef2f4-5a7d-4a18-daea-08de5a9a049e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejQ0TjhHT0RZbWpjWXhqU2RIMzB5Z2NEMFZPZjN2Z2VObjgzcGJ2VWc3dk5L?=
 =?utf-8?B?UFNFVmdNN2VaRnRvS1JtWGU3dWlSK2hETFpiWjBCVFZ5cHFUQWFpN0tVWUR0?=
 =?utf-8?B?WFBNSXJMVWFFZUdHMVlJTG9JUjVIZWd6K0J0Vkk3K2FvNTdmRm5Rc29tdkVk?=
 =?utf-8?B?MUdObTRRdHBXU2E1Z3I5ckgzNEloSkFIZTZ1YVRCMnl5YWVrcGhPK2plcjNC?=
 =?utf-8?B?TmpkUEk0VEhQL29OeCsvbkdKaEMwT1kxLzQ2ZFRvTTgrYzAreEZrc01MZ1dw?=
 =?utf-8?B?WFF5OE5WK1Zhcy9LMzNnQWs0TU15KzFhS2dTNy9NMlhDUGVkaXBFNmVVUEhM?=
 =?utf-8?B?MEhoUnJ2NjdQenFHT3Zad08xcjNuR3RFaFFDRVJxa01hT0ZLRWNYWW00SThy?=
 =?utf-8?B?QVNWdVUyRnUvVTg4R0VtYjZvTkI1VzZWZDJ4bjhIeWQwMVJhSExob09GaTdC?=
 =?utf-8?B?Zm5jcU9INUhPYlZSUXQ4WXN0ZitNQU44RXpHVDBpTmlneTdyV0Z3RVhYT2wx?=
 =?utf-8?B?aVdseHNhSENYRStDNWxSWkpqdlc4OUpnZVNBQnVDYU5nQ205VDhiUTY3Qmdh?=
 =?utf-8?B?bHhEeFl2eUlqc2hLWHM1dEV0S29rNS8veTEwR3NtUjBkSG9VUDZLSFlDckZE?=
 =?utf-8?B?aUVNc0dhNm12OUlWTGtyMzlMMVRYVVBTRXhlWjhLckpzeFVhZVBQSTFKVjM0?=
 =?utf-8?B?aThMK3VWTkNia1ZxSTJqTGJCbHFsU1dzdDByM0laMUgxdzBTNTh5MEFNaC90?=
 =?utf-8?B?U0R5Zi9LM2NyVXo0cU1ibWZhVEs2TE1DWVRCU0dGZmhPRDd2QlRWTUhzNDFX?=
 =?utf-8?B?azBkcTZKOThIOHA1UUIrNm96VUx3S2pBQjhpUjU5aVVtamZsQXdPc0pXYm9L?=
 =?utf-8?B?aHR5WEtXSzhRUEpjMU56cWJab0haMzVub3h2NDZFYmUwZVRxWXNlWGRGdEZQ?=
 =?utf-8?B?SzhrNFkwbXo3RjFkVnRrREVJUHBZTTUvWUl0aSs1bHBKeXNUbkE0Y3pGdnRS?=
 =?utf-8?B?ZGFHNzdpNTNWOHBXNkMrQUVoNlYrV0ZoNWxDRHdlWW5NK1V6bytIN3k2M3NO?=
 =?utf-8?B?alhwY3ltb0IzQ3hqREllbXZwN3hxLzJLYnJKNUR5WE9oMnpSSzYwWjZaUm56?=
 =?utf-8?B?ZmZ3QS91NGs4OHFQalFBYnJMYlJzT2dibStvbGIwbWZ2dmpMRkFJa1dIWHdy?=
 =?utf-8?B?M3BIVGRjTVRaR0Y4azlYNlEydlRRRWQ4QTh5MHc2akFuUUdjN21mTGxFM3Rp?=
 =?utf-8?B?cEcwVXNURmJETXVXaG1namVJVnFQVnQvRjVsNlhwcU5hdnhVNjJkcENiSktC?=
 =?utf-8?B?YmsxMVZlZFNBc0pXK25obkplelRoTENMZkFoZ3lLY3I5S1BDekJ3WWlGaTJC?=
 =?utf-8?B?OFo5SFBxQWlLcStvbDg2b3Eydk9TZktXSnc4K2FCV2MvT0hseFdldjNUbENN?=
 =?utf-8?B?Nm9wVEJ1RlU4RjZxa2s2cjhiNURMdEVwV1BUaU5vaVpCaFpaSTJBSUQ0K1A0?=
 =?utf-8?B?SzVHWGhHREE3Y3I1WW9rNWtOYWYrTC9aYWJLakZpNFNYSzBXVGtCSm0yNko3?=
 =?utf-8?B?YWVTTmxJSkw1bGNHU3FkbG9DWTRZV3hXWFR1U0thdG4rNE9NU2V4NWFsVU91?=
 =?utf-8?B?ZWlPNXhEdVZWUm4vSSs5eHRXamRTMW5NNkdXUG00N2dkVkJMUzBidW44Undt?=
 =?utf-8?B?MG0xSzh2SFRucy91RHlUbVJTZlZTSlBmNVlZejBaelVDT0dZZHBzQy9UWVB0?=
 =?utf-8?B?aUpVODE1bHV6N1JTbUVuOGJPMTROVzkwaUdod2JaemloVXh6Z2hCOTBYTUJP?=
 =?utf-8?B?aC9DS2NtZDBUNllQQkZqL0NYM1RQNzBGYVc1NnJSM25hN0F4VUJTS3N1amZm?=
 =?utf-8?B?R2dvanpnL3M2K2RIRHA1NEkwRzR5Q0tvMnBxbGhNTmFWY1B1MlRWOXdMSE9j?=
 =?utf-8?B?Y1J5a3pzbG5TeUd1enBnYnhiZWdqOVQ1YlRMR0d1d2dBczhCSDJ4UnVVSjZZ?=
 =?utf-8?B?V1FUcVNzUEFoQWxGb2tIYjVCamlLSTd4bGRJeGZNc2w1cStWMUt1VUJxYTU5?=
 =?utf-8?B?V0FxdDRhcG9YYVdjRWJmVGFJd3JWdDg2TVhVN281MHkvdCswT0c0bGZiYWVL?=
 =?utf-8?B?RGtSLzRGM2oySlE1bVpuNGdqelpFZy93U0xMRFJUNW5pbjQxV2dQWW4rbFMz?=
 =?utf-8?B?cTN3OWc1dk8yZlpDWUpINUxKVjJ3ZEcvRzBRZEhlV3Vla2RtYllPcmJTTzF2?=
 =?utf-8?B?UjJxZkN4Rm4xeUpxTE9TcWU5RlNnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:11:08.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cef2f4-5a7d-4a18-daea-08de5a9a049e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5979
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 16:11:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17029



On 1/23/2026 12:03 AM, Paresh Bhagat wrote:
> Add pipewire and wireplumber audio stack support for am62dxx:
> - Include pipewire core components and tools
> - Add ALSA and PulseAudio compatibility layers
> - Include wireplumber session manager
> - Add GStreamer pipewire plugin
> - Configure pipewire with proper modules and plugins
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../recipes-core/images/tisdk-default-image.bb  | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 264d1b2d..d5db6fd4 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -47,3 +47,20 @@ IMAGE_INSTALL += "\
>       ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>       docker \
>   "
> +
> +IMAGE_INSTALL:append:am62dxx = " \
> +    pipewire \
> +    pipewire-tools \
> +    pipewire-alsa \
> +    pipewire-pulse \
> +    wireplumber \
> +    speexdsp \
> +    libpipewire \
> +    pipewire-spa-plugins-meta \
> +    pipewire-spa-tools \
> +    pipewire-modules-meta \
> +    pipewire-alsa-card-profile \
> +    gstreamer1.0-pipewire \
> +"

I'm sure at some point we will want to push the "more modern" pipewire 
to other boards as well.  What is the reasoning for only doing this on 
am62d?

Please create a PIPEWIRE variable that contains the above list and then:

IMAGE_INSTALL:append:am62dxx = " ${PIPEWIRE}"

Also, for ease of looking up packages, please sort the list alphabetically.


> +PACKAGECONFIG:append:am62dxx:pn-pipewire = " pipewire-jack pipewire-modules pipewire-spa-plugins"
> +PACKAGECONFIG:remove:am62dxx:pn-pipewire = " jack"

Agree with Yogesh.  This is not appropriate in this file.  This should 
be in a pipewire bbappend.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

