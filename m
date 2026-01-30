Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7659E6BF09
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 12:28:29 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9145.1769776095353634733
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 04:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=uv7vkpd0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMAhI9VzNVhKkVvc4BtER2tVleB4usHd1v8kHmzJjR0vtZh7P2uA6Beo7NfxHQ9bABeijTGwAdGzTUvuHv7X8MmAg/sKj9yYxd6QsgigkOlOcvPTBBSBvakj+1UTVYb6N2Z/qg4oVB8kLMLxPu3jsXLlPbJqggJn5JIqm0bfcqof7Wsva7eaqOr25Uboo9OQRhapei2ihccu3RuFp7H3L+ip9lNY2Ajd6QNcvQAwXpckd0e7qiWD7JWXnqyx5txsVt9bCHFrNP+/xiPKwiAYkbwsiIfttDJIo40PpTUKdqKxN48Suut+VJ4LFTewZIBoqTgn17rpDg3BR0/RupPrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30GSpc0IPHrbLqEvO5M+EzBr5/adM7eir6NrdiwlGek=;
 b=wadh3nyJY/iAoIaD0iYxzA9JpdVV11LsHpipTUXw0erposRijBHvlepnY5qSNunAVPcFR+xfK400wh+KHC48YNKeauGKxeax5brvSmEV72cBhHO01DG8i5oK4lazUoYPuxFRs4XY+Fy2c8lYlbqtWG4eCgspanHFRmRO5hoCZIcQYTdDWDVepnnd+99tAWV5Rq8PAp/g6PRZBm0aRfBBsfA5PwcWPYtRoC4NpnPygT+KlKJ5f6g++3rUMV7BoABBXlyRv0gLIMDWjX/XPWnZY2XddUcFgnGu19UDc3ckCo9MA/LnXy+LyJ0Ooa9fZ2jNSKbnJ1JzqE/eI+8XK/36zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30GSpc0IPHrbLqEvO5M+EzBr5/adM7eir6NrdiwlGek=;
 b=uv7vkpd0NoYKOAuxQjhF51xYuWM1G3IjJFgkNjWI4v2v6XfDjLJsolNk+RPtSU2xlCEoWdgOddBiu7rmAoFLuB9f+s/uub6OQ9nCC6Ai+lEiEajCgmA5GAxlKrMK3SRRIkgpgmSeE1xBb4jU0nzI2RkQFZSgCuwDUNohFEMWHhE=
Received: from MN2PR13CA0003.namprd13.prod.outlook.com (2603:10b6:208:160::16)
 by SJ0PR10MB5836.namprd10.prod.outlook.com (2603:10b6:a03:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 12:28:13 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:160:cafe::2) by MN2PR13CA0003.outlook.office365.com
 (2603:10b6:208:160::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.4 via Frontend Transport; Fri,
 30 Jan 2026 12:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 12:28:12 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 06:28:12 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 06:28:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 06:28:11 -0600
Received: from [10.249.32.25] ([10.249.32.25])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UCSBLh1705185;
	Fri, 30 Jan 2026 06:28:11 -0600
Message-ID: <b1670133-0536-43a7-a867-fe564f29f935@ti.com>
Date: Fri, 30 Jan 2026 06:28:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for MCAN
 to meta-ti
To: Anurag Dutta <a-dutta@ti.com>
CC: <denis@denix.org>, <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260130110622.2338091-1-a-dutta@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260130110622.2338091-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ0PR10MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: a67dc665-2b67-450e-08bd-08de5ffb0901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bTdYT093ajhnelozU0RXK2VESFRxSTNHcnFST0NOZVdFMDUwdHZFYlFuRjRk?=
 =?utf-8?B?R0lzSHpQSzB2dXB1WnQ1c09tNTJ1Ukx6eVUxSjNGYWJUT0dxbWdzdy9zK3BN?=
 =?utf-8?B?UTRTVHA5d1hUSkdIYktYQ1NGNmJxRU8za2lDTkI0SXRDSS9oK0M2clVQZkNG?=
 =?utf-8?B?R2F0cm5XL0hrY01LL2JadDBtNTdxZzhheGoxMXpvUC9aREFZMGFCdGRiZ2tD?=
 =?utf-8?B?WG1UcFpwN0JRQXR6anRlNlpjMWI5VWc0eTFRTDJzV3VhZE4yUlQrV3grY08y?=
 =?utf-8?B?bmppT1NUZlFDa0NlTi85b01XdWhJaHNxbE9KbW9VYU1aK0ZhL3lqekpIWUw3?=
 =?utf-8?B?NktxQWpBNW5ScUhjSzVIb0gvSWJiczc4bzg3SCtLY0duQVllcjRrbjBBdUJv?=
 =?utf-8?B?b3E4ZzdKdGQ0bTlCSGxXV2pVMkdlVWpVVmFEYnhwWnFrK1A3TE5wWS9iZWJi?=
 =?utf-8?B?NG0wQmM5cU5uYm5mNjhNTEVCL09Rb2hKZXZzd2xQTTJOcmdOcWFZcFJBRFFH?=
 =?utf-8?B?d2NqWXV0TU1GcUVvTUdpekZoazAvY01vZWtVK292YTcwRGNoazRxR2NEZEc3?=
 =?utf-8?B?ZnMrejRzMU5yVm0vTkdOM0h4endUSU9vU29meHNubGwyUHh2S0FEa3dHTFQy?=
 =?utf-8?B?OTNjNUJXYktZV0R5eWpWcExDeUxBeWxKOGhpOXlBYnIxRExlMnUxOEVGT2RU?=
 =?utf-8?B?Z3VNV21hdEk2WC9pRytjNDJveFROdFBmUmZTWjlQc2o5aDQvV0FlaTFDSkZ3?=
 =?utf-8?B?QVJ5VFZjbG1xZUxiUVNQUmZLMElUcjhodW5zbFBnTlZZQmRTMkk5L29hUW92?=
 =?utf-8?B?NktHVHRZVDJZdS80MlAwdUVHUG1JbFhpYzdkdlpma093ajdndERMQnVVbkNy?=
 =?utf-8?B?K0JFNDUydHpUVVJxOWxITWhYVnF2NXVKUVM5WHpwdmtHc2NFNHNPUm5VR0Fj?=
 =?utf-8?B?dzd4dUtmWXBIaDlqOXZxV3p3VzF1d2lZN1dEY1pyOUVPdnJQbkVwY293ZmlI?=
 =?utf-8?B?QXNzQm9Hem12OEVXMkwxWEtGR2NLclVFQTJnRDVYajZpQU81VFFURVdzSFhH?=
 =?utf-8?B?UG9BeHQ0WWRRMCt1N25GVnRoYnVJeEVDcVNvelVaaURTNU1HcUJwbzZncXBF?=
 =?utf-8?B?WDhGMnltSWVBLzZmZ25panU2NG03ZVppaFk4MVd6L1J1bUNnZm9HSEh4bjg3?=
 =?utf-8?B?TERJYks5QnJsQnVWOWprL2pBK2FpUVMzTTJSTnNha2YwNkZhajBQME9TQXFK?=
 =?utf-8?B?WTFYb3Fqa0tzZDFPblEvQTIwQlBhVXRmbzczd2g2S1NZRUdrZ0x2eEg4b1Nx?=
 =?utf-8?B?Y2JqMWMrcDd0VWs4VFliM3RVUm50c0U2TXBDcUZOZGJWYjgzbnJFQjlQTHZB?=
 =?utf-8?B?d2xFRjBHL3FQOU15cUdMd284dlNGUUxtQUZNYXJFMEpBTFVTRWhLaEVEOWY5?=
 =?utf-8?B?QkU4U2FwbVZPWGtDbWh4S3hCQnJjYVZHRUlqY09nQjAwWGVvcFpGMFBpSlMr?=
 =?utf-8?B?TXg3Q0g0NTRWYUZFQ3JKS0xqVmZ0eDhhTjZHcXhlQkVmYTBEVlM5NDhiSkU1?=
 =?utf-8?B?NU9BTG9zWGZiQW90ZkFHNlo4VFNZM1NtbjBpYm1jWHFWQ21uNE1BNENDdzZX?=
 =?utf-8?B?enJRRUNGbGxMclNPbUVxVHRGeExNY2NVY3cwcEx5dmY4aXl0a09QWURBbDVu?=
 =?utf-8?B?RW15bXdPU1k4Y1dVYkpuYlZZYnZZbytFQ0ZNbjRudWc4MHZ6WHcxWWg5aE0z?=
 =?utf-8?B?K1dQVGFaRmJEUWdya1JZMDlqcUlKanQ5ZXJoQWJJNkpnUno1NVJiR1FQakJT?=
 =?utf-8?B?bGxreXJNWERScnhGTkZHcGE5VmlzUHJXSjZ4bTBrSXBYdTBxTEQySFdBenhw?=
 =?utf-8?B?QUFIcHFvV3Y4dkNmV0YyMHpGSi9xOEYzdEVXMHpCZHVpb3FuZ0lxc2JoT0pF?=
 =?utf-8?B?NzJiRjE1NXpTakxQc2tGeGtXNkRoRDlZS3pTdS9pNDFhRGFIWHhMSEVmbzlC?=
 =?utf-8?B?R0dwOWVOcmZ5M2VhcFVyT01UY3dmYTFoSGcwSEQ4RkY3am9QN25mZC9rdlFQ?=
 =?utf-8?B?ZGdVYVF6TUxKYjVVTEZSb2VyekdJYWpQQ1NMNTM3YjdkbHNROUVCd2JqOFR6?=
 =?utf-8?B?ekh4QVgwN2NEamlBalZUV2FON0lSSXA0dktibUdJUjRwYkljdVIyTWh6Tmd5?=
 =?utf-8?Q?zSaoZnpyRkCfEM3+CeSDt5c=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	McgSO3p/ShMARSHMmaYGmjnJV1Oh9Zb3AOnllfVwWnXHJ6Gvjw0HnDoJ/k3sk7sBNE4ALBqPPBPU8FVKhiZIjrW2mUV/CSu2o2gywuYkionyn+BSucPA8/vtOsxtttH1cmPe8kVcEAU4DtM7Gqe6Ah5NBkUm8VJ2dEpOvREcnQY0+WDpgF5E1ZI5MYT4kHv02zsivdQ0ZNzCChYRtcIlu0GX9oGSwrqoNwTmPM9WsC6KwAkwAve7smV7GEW6cd7lY0sgq9Dh4sS1f31G/PFCvHdxq0tDb7WjBwX4qFHtMnhQmvQtpaeIQx5cTvWGxdJSeFv5oAnJI+ukt0yQjZYXn+/OwM2IUE+Pt1BcerDsr0gfVxF+w37WKWWHaU2qDJHuuxExsPTF8f6JpV91km5W2iNOgL38zeATsec8RLDZU91taNe3Le+menEQS/WUKCD1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:28:12.4507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67dc665-2b67-450e-08bd-08de5ffb0901
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5836
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 12:28:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17048


wrong mailing list.  Please send this to the meta-ti mailing list.


On 1/30/2026 5:06 AM, Anurag Dutta wrote:
> Add MCAN udev rules to meta-ti so that MCAN tests run
> successfully.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> Tested on j721s2 (poky) : https://gist.github.com/anuragdutta731/67c24da1616e74efa2b117a3bd88ada6
> 
> Link to v1 : https://lore.kernel.org/all/20260106060815.868724-1-a-dutta@ti.com/
> changelog v2:
> 1. moved all the rules from meta-arago-distro to meta-arago-test
> 2. removed udev* from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> 
> Link to v2: https://lore.kernel.org/all/20260107052154.1598698-1-a-dutta@ti.com/
> changelog v3:
> 1.Added the udev rules to meta-ti
> 
>   meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
>   .../udev/udev-ticonf/37-can-am62.rules        |  4 ++++
>   .../udev/udev-ticonf/37-can-dra7.rules        |  2 ++
>   .../udev/udev-ticonf/37-can-j7.rules          | 20 +++++++++++++++++
>   .../udev/udev-ticonf/37-can-ti33x.rules       |  2 ++
>   .../recipes-core/udev/udev-ticonf_1.bb        | 22 +++++++++++++++++++
>   6 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
>   create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
>   create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
>   create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
>   create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 698b46d7..68129df9 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -39,7 +39,7 @@ UBI_VOLNAME = "rootfs"
>   
>   # List common SoC features, may need to add touchscreen for specific machines
>   MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw udev-ticonf"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
> new file mode 100644
> index 00000000..59dc8075
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
> @@ -0,0 +1,4 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
> new file mode 100644
> index 00000000..3b14150d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4ae3c000.can", NAME="main_dcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="48480000.can", NAME="main_dcan2"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
> new file mode 100644
> index 00000000..f2804ecd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
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
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
> new file mode 100644
> index 00000000..62d650fe
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481cc000.can", NAME="main_dcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481d0000.can", NAME="main_dcan1"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb b/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
> new file mode 100644
> index 00000000..1ef487c2
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Udev rules for assorted TI SoCs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +inherit bin_package
> +
> +SRC_URI = " \
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
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
> +}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

