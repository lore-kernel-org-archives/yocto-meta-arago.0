Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668A9C47BCD
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:14:07 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86277.1767690841727624361
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 01:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Paqs7S3K;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.48, mailfrom: a-limaye@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1SKK9RQF0sKkxcqMJ6onUcUZvElm8HE6JNpcVzf2vUQIQ4aEFoSBdQ69/J/z1it+nI9dUVUYIDjrp1jCADfHGTP52uzZ/vOpP8F4RgwPtD6zt0+l9lm7F5Uixr9k3+Um1S0ofsvodw6yGoayZopHljAzphWrGLdpNphnhgxTR4n2TvisZpaWyp6LvTalqxxeCdwZ4ATpzDNputh+4JvWEcd9Zm38AoaemPokK/zfFjxSJPnsTzlky3tE86cgMpB4FNsn/v84DkH0HI15oU3e0L93VDEDfj1/EgNU+6YfoM/CxxdAX3OvRsaUGPnsWqqxx4R7D9PyTwPWsbNx3mtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/ORMHKOSG7I7mYbYl82t1ctvlqcscLhwtYtAYlcosI=;
 b=RSRMxtf1watTVqq5H7sDaTyHoq/JoNKftngLC7089BoPko45DmD+nS9gn3WJ32UUgCaT5AryyEnnxptiqDMIqMreIiKWkBiICR0rSGFw1/wgabVujSiEMVJQCuYkskJVjxV0VWg17KESQnqlfRfeszSZVoCwjtREQRWiGsCJSvKRiVcVCD1NLkJNP9mbquGqfowh+NTkAyy8Bcvd24425hPGp2ht8vfanBt2e9pxJSvUm7I8gvShOT9agCtgELdEXq+wS6vABG1Z0MjtOve20Wxdlownqkvw5oXfcANb7dp3rlLTGUmP7NvP0foox7YhrMmWWwHL59WeyhAAYS3Rcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/ORMHKOSG7I7mYbYl82t1ctvlqcscLhwtYtAYlcosI=;
 b=Paqs7S3KTIOvgNSvMMeSvuaYvMQygHEbtpUwB3BnTMG1x0x42rMF5ZYsUFaRAMd+9RKWgR+UvoaLivn8IrtmRCJtxrmKuowGxQ/EShHwbEKgV6CpbJApPDkTp9bgI+O1hEKQsxx34X0XSgTsdCvXp7LV+TkziGyJAf7bglmceDE=
Received: from CH2PR02CA0013.namprd02.prod.outlook.com (2603:10b6:610:4e::23)
 by DS0PR10MB997626.namprd10.prod.outlook.com (2603:10b6:8:315::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:13:59 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:4e:cafe::4e) by CH2PR02CA0013.outlook.office365.com
 (2603:10b6:610:4e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 09:13:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Tue, 6 Jan 2026 09:13:57 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:13:52 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 03:13:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 03:13:52 -0600
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6069DoGN2774599;
	Tue, 6 Jan 2026 03:13:51 -0600
Message-ID: <08c69245-044f-4630-86e1-fbbae1dab093@ti.com>
Date: Tue, 6 Jan 2026 14:43:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago-test: recipes-core: Add
 udev rules for MCAN to meta-arago-test
To: Anurag Dutta <a-dutta@ti.com>, <reatmon@ti.com>
CC: <gehariprasath@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20260106060815.868724-1-a-dutta@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20260106060815.868724-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DS0PR10MB997626:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdf94f4-ec49-4bb6-e588-08de4d03ec36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REJZQW5rMTNUL3h0NWxaUlVTU0RiSnBBRU5TZGhneWlWOWg5S056MUlPV2dw?=
 =?utf-8?B?eGRKcE1saHRVTnp4T1ZKOThHUld1RHhtTzdFK200VUVpeUxDUUVlTkpkSTRH?=
 =?utf-8?B?MFo0elNSQlUvQ283T0l5NWF6eUhpSW54Q2Y2OWFHYk4rUEdYVGVQQVBYbFow?=
 =?utf-8?B?dThpZHBkdW5jUkpoUkJjbVUwVTNHK3F3QzNwNTZKK2hNZWlxS0kzS05EV3d5?=
 =?utf-8?B?MmQwOGJqcmMyNzdBWVZCNi8rMFlDSzZkdTN4WkF6MG5uT2Q2anZDYTBvVEFU?=
 =?utf-8?B?bDM3azc5eWFVcnpiUnBFeXBuK0t1WmYxbUZzaG11ME1HK2cxRDQwK21IMCtL?=
 =?utf-8?B?R3pueE8vQjk4SWViQmQ5dnhJdFBUSDhaczQ1SVI4Wmp6R0ErRlBLLzVpTFRk?=
 =?utf-8?B?dkNDei9udStFS3VwUGl4VXJuaDhvL1pEZDdOMlQ1UDhzZUkvNmJLbm9yMlZj?=
 =?utf-8?B?R3FqbE84UzdvL1VSQzVkVHlkYzRTdmE0MmFrdnJXSkhCa1ptWUpHQVgwNmpY?=
 =?utf-8?B?Mlg3dWdVem45K0hWZyt5WWZnR1ErWjUvVzFDSjNFWlNWRTFtU3JvWXhJK012?=
 =?utf-8?B?dFQrbW81eGlIWDh3RnBKQThkQ1FkbVpVR0hHeG5Qc09LUlNSNy9ocmd2VWdF?=
 =?utf-8?B?TmM4WVlhSCtSTVhtWEo5cGlaV0hYNm1FR0cvbGNHREdCSmN2dnhFeVZOcDlt?=
 =?utf-8?B?RUwrS0h4MVB1QytBaEc3ZUgwd0lBV0hiaCs0UmUwZnkzQy9jbnBiTmtySjJV?=
 =?utf-8?B?cFJnaWdEc1ozdERpM01RYzlYOXhXNjNXMUFrbFhmS0pnSEpzUkRMeXlkRDJn?=
 =?utf-8?B?T20xeTV2YTZYSGxVUWgzb25ubWdWTENUajJiNDF3T01PQzIzMkZTRU41MS9a?=
 =?utf-8?B?TytzcUFEdXlRUUtuM1N4bHd2YXRYTzVXenNvTTdFRkRjbmJCdDN5ZWdYN2h4?=
 =?utf-8?B?RENybExKSmZKYWVaRSsyV2FPcXQ5NXVHTEVncEpqN2VvY0FxVFZRT2dhQkFO?=
 =?utf-8?B?SG5Fam0yZ2diNy9BNDg4SWVWVGlUMTljQVVpSVMyaDdvM2RKQjVmWUYzUklt?=
 =?utf-8?B?T0dCcGFNbkNjdHBudElmMXUwQnprM3IzeVFjSUkwOHRFZEp2RWF2RUNCa2da?=
 =?utf-8?B?UmFOTTBxQ2gzTHdZZ3VuTFBNRjVUbGF0MStJR2Q4b0g2MDRnbE1ZSzRPTU1r?=
 =?utf-8?B?Ni9ycUlzVzdKUWVBM2FYZTYzUnZrVE41MXBoaWgybTZZNkE2bkdyano2bTVH?=
 =?utf-8?B?K2NCSUZzQUl6V2p2aW1VZlBJcGhCSkdGL3FHTVBIa2svczlMbmhoaUNYM0wv?=
 =?utf-8?B?RDRJNnF5T0FQeENhZmY2a0xBNFdYRHNDd0FCZGcrMlhtRDEwY3dZaldiUlVj?=
 =?utf-8?B?Y0xLQmhOL1BvU25NUmxvWkdoUXY3cElLZXRKc0VkVDRpYktXM3Z1ajNvc2pK?=
 =?utf-8?B?eWsrTzNKZ0VyZDVEK1FGSTNiSmthNGh6MG9jU3lqOHplZ1FueStCSVNwVXRz?=
 =?utf-8?B?d24wZ1QwaW5vNFBkSDBQV1VVakRLY3k1cmNSdHVNbWxyZ1I5QmE1ZkpzT2JT?=
 =?utf-8?B?TENUOHBINWxkN2tIVGtrVUdYR0NsanNqZElrVCtxTWkvUWxhMDRmbDhKODIw?=
 =?utf-8?B?ZHdEWHJmS3VNVjllQkFjQVRwK09teFFqZGJ3MTR3L0VPVUh5cUQ0dmk1NTZz?=
 =?utf-8?B?S3lFOEZ1WTMxVGNmU1ZOYlBHYm1tV3lmWktRRitnM0I3MUZyMFozTHhLL0lY?=
 =?utf-8?B?RTFEM25WWXZ5M1ZzOWQ1Z1psT3V2eWRKUDd5U0VjM205RGtYS04xUWtaTjlE?=
 =?utf-8?B?U2pvYmM2OUFFdW5pUFY2VEh1eDdwUnU5V2Jscmd4bDJrVnVsZEEvS3JTQXpQ?=
 =?utf-8?B?NVVHcXc4UVAyY3ROOTRROVIxWWpSKzhqckRlZ2paSDFWMU00SGZKclJrVE5k?=
 =?utf-8?B?WkxvYkI4cmVncnNBb0ZsSmxYNzNBRjFQLzhSN2ZDcUhieC93SllKNVpQOWwy?=
 =?utf-8?B?UjdGZThhdklaQUtBeW90L0ZGWUsrREVTS3VkK3hxYjJvMGFJck9tcUxVUlRa?=
 =?utf-8?B?NDhrRVJnWURVeFVNU3BxOTlGcXBiYUxDeGJCTHZCTjhMaDliVVNaekd3MVRW?=
 =?utf-8?Q?MJOs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:13:57.6036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdf94f4-ec49-4bb6-e588-08de4d03ec36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997626
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jan 2026 09:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16932

Hi Anurag,

On 06/01/26 11:38, Anurag Dutta wrote:
> Copy udev rules from meta-arago-distro to meta-arago-test so that MCAN tests
> run successfully with other distros such as "poky" as well.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>   .../recipes-core/packagegroups/ti-test.bb     |  1 +
>   .../udev/udev-aragoconf/37-can-am62.rules     |  4 +++
>   .../udev/udev-aragoconf/37-can-dra7.rules     |  2 ++
>   .../udev/udev-aragoconf/37-can-j7.rules       | 20 ++++++++++++++
>   .../udev/udev-aragoconf/37-can-ti33x.rules    |  2 ++
>   .../udev/udev-aragoconf/50-arago.rules        | 24 +++++++++++++++++
>   .../recipes-core/udev/udev-aragoconf_1.bb     | 26 +++++++++++++++++++
>   7 files changed, 79 insertions(+)
>   create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
>   create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
>   create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
>   create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
>   create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
>   create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
> 

You need to move these instead of creating another copy of these files...

meta-arago-distro depends on meta-arago-test anyway... so these files 
should exist in -test

> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index dad5571c..96e0038a 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -61,6 +61,7 @@ TI_TEST_BASE = "\
>       v4l-utils \
>       xdp-tools-arago \
>       yavta \
> +    udev-aragoconf \
>   "

1. TI_TEST_TI_TOOLS is probably a better place for this since this is 
applicable only for ti-soc
2. The package lists in this file are sorted in lexicographic order.

Thanks,
Aniket

>   
>   TI_TEST_BASE:append:ti-soc = " \
> diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> new file mode 100644
> index 00000000..59dc8075
> --- /dev/null
> +++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> @@ -0,0 +1,4 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
> diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> new file mode 100644
> index 00000000..3b14150d
> --- /dev/null
> +++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4ae3c000.can", NAME="main_dcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="48480000.can", NAME="main_dcan2"
> diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> new file mode 100644
> index 00000000..f2804ecd
> --- /dev/null
> +++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> @@ -0,0 +1,20 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40528000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40568000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2711000.can", NAME="main_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2721000.can", NAME="main_mcan2"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2731000.can", NAME="main_mcan3"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2741000.can", NAME="main_mcan4"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2751000.can", NAME="main_mcan5"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2761000.can", NAME="main_mcan6"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2771000.can", NAME="main_mcan7"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2781000.can", NAME="main_mcan8"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2791000.can", NAME="main_mcan9"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27a1000.can", NAME="main_mcan10"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27b1000.can", NAME="main_mcan11"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27c1000.can", NAME="main_mcan12"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27d1000.can", NAME="main_mcan13"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2681000.can", NAME="main_mcan14"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2691000.can", NAME="main_mcan15"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26a1000.can", NAME="main_mcan16"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26b1000.can", NAME="main_mcan17"
> diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> new file mode 100644
> index 00000000..62d650fe
> --- /dev/null
> +++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481cc000.can", NAME="main_dcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481d0000.can", NAME="main_dcan1"
> diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
> new file mode 100644
> index 00000000..3ff14eb0
> --- /dev/null
> +++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
> @@ -0,0 +1,24 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Try and modprobe for drivers for new hardware
> +ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
> +
> +# Create a symlink to any touchscreen input device
> +SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
> +
> +# Auto-mount any SD cards
> +ACTION=="add", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
> +ACTION=="remove", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
> diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb b/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
> new file mode 100644
> index 00000000..49d00b54
> --- /dev/null
> +++ b/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Udev rules for assorted TI SoCs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +inherit bin_package
> +
> +SRC_URI = " \
> +    file://50-arago.rules \
> +    file://37-can-j7.rules \
> +    file://37-can-am62.rules \
> +    file://37-can-dra7.rules \
> +    file://37-can-ti33x.rules \
> +"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
> +}
> +
> +RDEPENDS:${PN} = "udev udev-extraconf"


