Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B29D26D8E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:29:01 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16855.1767983335271243138
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=LYfTi9tD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAUzKx4HKwmHHcBxMPijUaNtY4LkGN+M0sHqcfgdRXdYKISaXYcKrb+osfzoNPhOrV0WdzjksX4lvuo9u0AxazcMTzFXHORfUcsLsKtnFiHTnf+v49I/xRgmoKCuVjS7AKnGqSiK3vG4Tbaps+bVsP9oS43xk+01ve3XCMXFpqCjnHv+k06ANE6PI+ghEJJQ0tVjFj5je6eEdhzwLA5vPt4GfUm7r8MvY+erIbrEvqEMYOLA72wDuVG2SPOLL+5CFLrVnX8A+IPKp7ZatSspZt8iYh8XlRdfDWnqcjFKUVmhwDjMpcm9Io+3T/otbmsFFG1BOWtKoxWIn22QrEq/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swfny1Bl/DRfs1YVhMrRYlkFCAFdQXua41/gEinRC8k=;
 b=ll1lyUwtER+cgBRvskA1i04oRnEUqd4AozlL2oc2rOyB6rQcNYj4pZxoMXk0wrpsQXzJJGBeURz1aEsI/b7dbFTb48w2FBFPVLkxsh18Dr7UUprJ5SHbhQA3oXiTFhysvH85kkKxqkqip9FcvEn/NILSuWrgmshy/T7aBkO/nNYmMyf2ibtSnO+t1UUIWEzzGFeTA1fZSmQ6gW5FzI+hBpUJ4uB5Epsy/mIs+v4YcLV+tEq/TR/bl+mUvhYyvyPy0jjZB/mO+0RRWOBmt2jrIkrkSYoUU/8QMzbiUXYiUxIF0S24mwrqS/BRgnTp0GtOb31tmwnJJ/LEfumXKSpT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swfny1Bl/DRfs1YVhMrRYlkFCAFdQXua41/gEinRC8k=;
 b=LYfTi9tDv3T5aRqk75VlYrf8/9t/1o/KvKZZOeRVdSIbVB2kfrDBZMhYDqKBwQ8uwpa8RnSFCUwBoUkzpRkINn0fYmKdwoRyhKuAI4kBiWElqdHhmR94AouqyNrMjj2t4o+Yl57b3PAGYKIzqhWGEDitPWISsoOr+LYJO5lds6Y=
Received: from BYAPR11CA0079.namprd11.prod.outlook.com (2603:10b6:a03:f4::20)
 by IA4PR10MB8518.namprd10.prod.outlook.com (2603:10b6:208:56a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Fri, 9 Jan
 2026 18:28:49 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:f4:cafe::37) by BYAPR11CA0079.outlook.office365.com
 (2603:10b6:a03:f4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Fri, 9
 Jan 2026 18:28:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:28:48 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:28:48 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:28:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:28:48 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609ISmv9477780;
	Fri, 9 Jan 2026 12:28:48 -0600
Message-ID: <6058face-2e40-47f9-8f75-43271061453e@ti.com>
Date: Fri, 9 Jan 2026 12:28:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] conf: Add support for bsp-ti-6_18
 to ti-core-initramfs
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <188922F928D4DF96.2339348@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <188922F928D4DF96.2339348@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA4PR10MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 28adc1bb-d8d6-4e23-2b67-08de4faceea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0Fadkc5NXM0WTVYTjQ3UVMzaVliQnYwUWErdkFOMWowQ1pRTWI3RHdHQk0z?=
 =?utf-8?B?RUd1aU1lcGxnZ0FhTnVCYjhFUHdLTm44QmZKeVdqdmwvazNRMGxCQjk3Y2lF?=
 =?utf-8?B?MUNJamUxSTV1WVEyanhQZVVzcTBHeFhmeXlKNHFaZ3EwYzhWeURYQVNuQ3BM?=
 =?utf-8?B?d1BHaWdpSGpZVFZsdHdBWGVuQWRyQUQzZU5GSjhPZWZkN2YxRHFoeWpTeFV1?=
 =?utf-8?B?OHdQV3liVHFGNXNMLy9ncVRuMWVNZTZaMEpXSmJMSGg1VVQyL2VoclRsR01K?=
 =?utf-8?B?Ykl5dHlsamZPZ2xPRDFWejczSi9wSnFFSmlnTVZ6RVE1cThxbklwMEZsNzk2?=
 =?utf-8?B?SmlFSTdRbThGdmpFN3U4YkFjTVlVSW44N1p4RU5xYjVHRzlVMit3NkZ0REov?=
 =?utf-8?B?cXhaU0RJbHU2MVFUWWhCbkJxWFJDN2NySjQzVTV4OUM5MGlCUS9obm05T3pP?=
 =?utf-8?B?UFdaUFo4WTBaYnVBYWNKVS82VkJHVFRWSGlzbFhKZGc0ZkhPb3d4NnIzWWVR?=
 =?utf-8?B?cStaZzF4MWQyTzU3N1lvMWcxbUpUUktvcGoyaUdMRWVmRUhzT1lEQ2VUZVkz?=
 =?utf-8?B?aytLRlAyYzRtbTV4bmNoQ25CMnBSSlB3WmUvK2VPdHFFb2JhRzZyWWcxM21B?=
 =?utf-8?B?QUJ0MGgvVnkxS0xFMG02YmxLT25oT3oyejZvU09sSjR1TVg0YU5XQkxPdms0?=
 =?utf-8?B?MG50NDBVczZzNFE5VzdsN3dNWWFlMWFlRm91NStnRUhMa3hlTUNnQlMzSWVa?=
 =?utf-8?B?NHNIV3FrVHZSZFJqbityeGFCV3MvbGoxeitOZHFQZlBjVDVHbnIwaU5uc0k3?=
 =?utf-8?B?aTNCVUZnTWRiaG83b041dnlEcHVmeU9PZGNsRnl1eU9NNGo5UlhsRmNJSUVX?=
 =?utf-8?B?MUx1Z0tCZkVHdXRUTVk4akRUa2Yra09pTXA4dS9aVTFzd21yZ1BXNHo1TVhS?=
 =?utf-8?B?bVlGSW43QlE5dmRpZENlQzBJWnpBTEVUSUdjdWdTdmJFUnFTV3IwcFJwWng5?=
 =?utf-8?B?UndYd1l5NFhyaWh0ZURqWlJoQlRRUzhUWWN4aDBuQ2graUdHVTBUWGR5SER5?=
 =?utf-8?B?KzFERzVnSytCUUxwTnV3b3l1N1BXdzZJZEltbDEwRGpjSnE4ZEpSc2dJNnhr?=
 =?utf-8?B?bDFRd2dqK3lBYWNiK0ZUR3diOXU4WThOYklmQUpUbHREMjRPYUhVTTNDVmNx?=
 =?utf-8?B?MlhIeXhvVXZDeXRjM2xQR0hoTXc1cDF5NE91UENnUjBpWStDdnE1eExIOTFv?=
 =?utf-8?B?TEJIZHFodyttMHlSdG1mQkxWclhaTmFOZ0lISEJRdUVyVVJZTVN0dFVTL0Zm?=
 =?utf-8?B?SWRsczYyZm5paWN0T29weGU4bS8xeFV1d3dhUUZ4YTBvTEtGelhlQXozanZv?=
 =?utf-8?B?Y2dtbFRMQjB0UkU4OTVjaERGMzNReVNmUkZUK0NXYlFoUFB6KzZsb2haQXA1?=
 =?utf-8?B?VU9aSnpDblNHNTJjNVYxZFNTTVdvakMyaFJrV2h0SzhVeU9qQksyTlozSEN0?=
 =?utf-8?B?Rjhpd3RNQWQwQ2RJVm1qcHNXZnk1V2lvd2tSdHNqdHh2MjhuYU9JZVExaHdm?=
 =?utf-8?B?dXhESnN0L0dWYVVEMmRPbW9hbXcybUd5WjJQczhjS2pEaWVDUnMyRnFHTmZ0?=
 =?utf-8?B?UEZRcFhUY0MrZzE1S3RIRHpwK0g2MUlzcDN2T3JVZ2Noc2I0T0xDc2NOQ29G?=
 =?utf-8?B?UU5iN2h3Mmc2aVl3SHpBQXUyNldnUkNvSXNPUEgyNllYSWhZYkZsMEtmR0lU?=
 =?utf-8?B?ZWdXUHJudk9KVElMY0NyWDFHSnl6Z3pEOHBTU0pzcUU5eDhkYXJabmRGUi9j?=
 =?utf-8?B?bmczelExNGJOMEtZT1RVbE9USjhCR3poRDZkd2NiTjZkR0RycjB1Q0FjTStG?=
 =?utf-8?B?U2huQituTGdrYWhxVENFZjJFZWpwS3ppelI1MnkyM2lxbk5FRTRndjJ4bGxL?=
 =?utf-8?B?aXYzRFpydkxOam9kZ2ZyUTl6Y2h3ZFNvY0JmUFRXNktQSDljQ1QyWGZxeXIx?=
 =?utf-8?B?Tys3WE1IMDRJWURQdDliVHFzMXlORGVXWmNyRy96T2t1aGhUMEFWcnNwbTlp?=
 =?utf-8?B?VzhwcmVvcGRUUzVLMng2NmRWWmdqQzJqUVcvb3pFay85UWJkSzl3NUdaWVRC?=
 =?utf-8?Q?n/cc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:28:48.8328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28adc1bb-d8d6-4e23-2b67-08de4faceea0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8518
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:29:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16947


Wrong list.  I'm on a roll today...


On 1/9/2026 12:19 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> With the 6.18 we are moving to using an initramfs to provide non-default
> modules for booting.  So add that override to the machines that need it.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Forgot to add ti-soc.inc to the commit.
> 
>   meta-ti-bsp/conf/machine/include/am62axx.inc | 5 +++--
>   meta-ti-bsp/conf/machine/include/j721e.inc   | 1 +
>   meta-ti-bsp/conf/machine/include/j784s4.inc  | 1 +
>   meta-ti-bsp/conf/machine/include/ti-soc.inc  | 3 +++
>   4 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index 08111f82..1fd4a1ac 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -12,5 +12,6 @@ OPTEEMACHINE = "k3-am62x"
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
>   
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-tps6594-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 5ec43049..29566dac 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -20,5 +20,6 @@ TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw-j721e ${TI_VXE_VXD_DRIVER}"
>   
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
>   TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
>   TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
> index 6ba427cb..42c95b11 100644
> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
> @@ -14,5 +14,6 @@ OPTEEMACHINE = "k3-j784s4"
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw-j784s4"
>   
> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
>   TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
>   TI_INITRAMFS_KERNEL_MODULES:append:bsp-next = " kernel-module-cdns-pltfrm kernel-module-ti-j721e-ufs"
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index ca182968..74346430 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -33,14 +33,17 @@ BUILD_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
>   BUILD_CORE_INITRAMFS_IMAGE_FILE = "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz"
>   
>   BUILD_CORE_INITRAMFS_IMAGE_STEP ?= ""
> +BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-ti-6_18 = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
>   BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
>   BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next = "${BUILD_CORE_INITRAMFS_IMAGE}:do_image_complete"
>   
>   do_image_wic[depends] += "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"
>   
>   TI_WKS_INITRAMFS ?= ""
> +TI_WKS_INITRAMFS:bsp-ti-6_18 = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
>   TI_WKS_INITRAMFS:bsp-mainline = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
>   TI_WKS_INITRAMFS:bsp-next = ",initrd=${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
>   
> +IMAGE_BOOT_FILES:append:bsp-ti-6_18 = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
>   IMAGE_BOOT_FILES:append:bsp-mainline = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
>   IMAGE_BOOT_FILES:append:bsp-next = " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

