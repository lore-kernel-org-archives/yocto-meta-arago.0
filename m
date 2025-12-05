Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D3DD374A8
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 21:25:52 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4333.1764969950569937958
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 13:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lWO9Sk93;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.51, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTUKqMpTMZoCjqpMqgQmPgMlCe+ZMnxPtG3RoJkttsBsOacLXmTYdNVz9TLQHPmNW1uU4ffhbaXnvXpUPhkkh9S3YE0pI/JzSfTwMuhgVWERH2q1fIuNv4xorxLANOcxkbDOhkL8539ldlMS5czcf5LPYoU6nPU+pZaG2BDFUaAiQqMLlA93hueFeaPus8YAEOXRZfxeEjdJ2u7tT0WmTEKf9zi8ai86+XHjIL3RRZ6ZZuLOAMkCMcB2j0u3M9l8JMtqLR+WLo+DdDlvh5UPDWv0V16Fa+5a8ekRGRy1RT+gCqpbr9voBa0q69smMC1jKxsDtt0ySJkpqGbeZ4qdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtRJfs0os0eSdjkTCckjzw6TWhagqqxV4ZDjKibOPGI=;
 b=oAKByqOZE6sODcFK2Syv0na40ucZaVvYkcmIKGErg6YSRxXV1uCUixWGIlrxgxdIvE3NsQMjRDToQB1YJjjD1IDnNAbVtBRwBfj2nx4yYzapkMJq9OE8v2L2zkNiPVUwu91w7Cbg7ZJWskj+nh8i/E9TbGxn0ki3uASBHGo/PgT8ZqOYCc6+YskYbBEEGMwHdDt7ZEgDSluTq9SOjMFpOaEyre5eg5aANX/H2eQaOnNlE695CD0ICs8xkwaz13ats4rTfTzN+CSzjLT9WnRlv2NfhtMvxUUPk9jkZtyUqF1oX29Z5PAiKHZ/PxcAOrelkcW65g3wyljsYoCqQfewaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtRJfs0os0eSdjkTCckjzw6TWhagqqxV4ZDjKibOPGI=;
 b=lWO9Sk93tVhVDkNp82AVsF2DAfyzpzieM2GFIzXrTlrWXVL+eE2Dj99aQJ6zGdifNAV3i4fSVRkxKtoU5JdKmDlPnNGwVTVmD3CjUJKvCxXe1tblFNxYzZF/LtGzmmkzu3E6HVWzgliaU5A3TeqYhkrgAV7ZRCSji4NWRqALGAs=
Received: from BL1P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::11)
 by IA1PR10MB6734.namprd10.prod.outlook.com (2603:10b6:208:42e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 21:25:46 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::cc) by BL1P221CA0032.outlook.office365.com
 (2603:10b6:208:5b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 21:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 21:25:46 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 15:25:42 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 15:25:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 15:25:42 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5LPgU73934130;
	Fri, 5 Dec 2025 15:25:42 -0600
Message-ID: <43890281-3c9d-491f-bbee-319e38ad6e8c@ti.com>
Date: Fri, 5 Dec 2025 15:25:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] dbus: remove license selection
 override
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20251205205232.2471677-2-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251205205232.2471677-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA1PR10MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2354424c-9205-4eec-a577-08de3444da7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTRNbXZ3Qk5RZlJMb1lPUTNicmZDM2J4UWxVaEVIbW83TTN0U3pKczdqTmQ2?=
 =?utf-8?B?SFd2c2dYenkxY3c5dTUwNmpBS21NR0RkUG9ZaVN4UG03RFMyNW5UT3VxcURs?=
 =?utf-8?B?YTFybU16ZFRTcXRpZ0w3bUJISms0SVFXckF5MlFoVjdRcXZieGxYNDB0eXo3?=
 =?utf-8?B?NkZWV29mV1F0WFBWMjFSZlZQeVFYUVQzc3J6d0JkdEl6NWJOZHBLalBoWU5Q?=
 =?utf-8?B?dzBvbytLZjJHNVdwMGdRemU1UWs3RTJIdk8xbEVLMGdYMkROTG5rWGNWUnF6?=
 =?utf-8?B?NFVKUVVXVUZjck9RNndUQ01uRlVndlhuUHlEK3BIZ1JUY2g2ZEtYQ1Bra200?=
 =?utf-8?B?TWRjYkNKY0M0UStsK0dBT29TUkwyTkNPazF5Z0M3U2M5LzdSUUJ6eU5lcW9O?=
 =?utf-8?B?dzNrbXZidW5acGM0YzBpMzJzV2pyYkxHajNDNFBjSWtIN0tNT3dkMGFxSnNQ?=
 =?utf-8?B?L3FoNGMwbVFUTkh5dnBWVDArbFZ4RkdIZkp0ZzNjckE2ay9XWU1EWDNIZ3dQ?=
 =?utf-8?B?WlhNb212dG52NGZ3T2VpSi9BM1Bya0gzTlZFYXhFeVlFVUFUVElJOVhWemhV?=
 =?utf-8?B?Nmcvd2hTcFJRSUprOHBDVDlkdG5FcjR3QTFremlDVjB3M2ZqN1JsUHg1MEs2?=
 =?utf-8?B?UzdyZ2czSEFGN3pVejlmTTZHbzgzNURnRWpLQlBZeVJzUUFNeTdCZktvK1dn?=
 =?utf-8?B?c1lhaTgybUQ4dEV3OWV3cWxlVERlL0lZVTd5dnV6VVFUMTBQWkJvY2dLRTBx?=
 =?utf-8?B?UnJCZDVWZ3ZkSEtQOUZnUjlmdVZqRUI0VERCMEZzSXR0VHhNcXdNdXZJTWJo?=
 =?utf-8?B?TFZud3JKdC9hM2RNY3BYWGkxbHJnOVp0a29FbFNTa1VGczVOUUxSR0QrWlVw?=
 =?utf-8?B?ckgxdm5SMncxZitKL0N3NE95Z2o0bTRKaTU5WlZFclArRUJRMC9QYitCaU1M?=
 =?utf-8?B?Y2hpM3hRUkQzbTV4RGlnZFpXYXlGQTFGV1VnQjRVWmM0WW5MemQ0V0NjaFla?=
 =?utf-8?B?UFZmZHlkMm1EU1Y0MXc5eWxsRjlsV1ZFNUlNcFMvV2kzR1hpTHF0U0NJZVpU?=
 =?utf-8?B?SWd2aUNBTVRtNjhLSm5yb054TDcxaXltZ2J2UElDcCs1V0RRejZwZ3BqNzdj?=
 =?utf-8?B?RHpTbm1hWmU0RExvMmkvVmRxdlB6VjM4NFpQN2luZEY0c1BmeWpyZk1ZMEtr?=
 =?utf-8?B?emREL0xYQmRxZEhySEVtaGlpRWZUaDE1VkdmRjhnY255VkpCZjZhdTYxNnQz?=
 =?utf-8?B?YjVNZXRYNWxWZHV5NXdvUS9lY3kxcUFFTmk2S0pvbkxTUWk2WUYxWGs3MU5E?=
 =?utf-8?B?Qll3d3AvS3NZb1BTelBCY3hUSE5HNm9OaE9IN0lQSVRwZkxoTmNsMHZKVmpn?=
 =?utf-8?B?akZkaitSODFhcS9ZeVJPMlVUVTZrWklMclYyc3JYaTgxQXBqcThZblo2L05V?=
 =?utf-8?B?dVIwSWpMczVnTmxCL3hnb05PaGVhMlhXS2FMRTNlcUdRLytEanN2eXVqdlla?=
 =?utf-8?B?SURGZTh6Vi9la3IvVGpwQTZweWFlY3UwbTUyS3RhVG4yQyt5UDlOTXI1bk9n?=
 =?utf-8?B?WEsyd2c3NFlCSzNuRE9BMVRCbnRxSXBMOGhHWmZuWE9ZSVUvTlM1aHluUFdB?=
 =?utf-8?B?aTUxY093YjY5ck15bk1HL0cwS21FcXZvTVkwNU1VQWU0elpPWUhxbW4yL0p3?=
 =?utf-8?B?RzlLVG5zZzl6UFJxdDVFMkJ6dW1sUXdpVXIxR3BDcWZWTExzaFBRMitsRVVM?=
 =?utf-8?B?RWo0L041WWlUb1RZZi8vU0JUTG1UZ0xHSmp3MXU1bVU2aFg4akNHMXFmSGIy?=
 =?utf-8?B?RVZLM01tUXRPZnd3bnlNdXJlei9kTW5wZ21KNzZKcDIzUks3cm5ocTN1UkU0?=
 =?utf-8?B?NHRJcHZwS3MyYnlsSmo5bXprMUEwbGRJdXQwTjBERVRCb3Fsa0ZYOHdMUVVI?=
 =?utf-8?B?Q2Q4RFJYMks2OVFNRnFNajlSa0EzREppQWVrNWd5bmYyR2tIRGZ0WXRGcVNY?=
 =?utf-8?B?SkdYRmN3QjdocmNzYUF3RmplTkpLcUpjaU5aWmtKNDZrUjVPRDhsOFlYK2FL?=
 =?utf-8?B?ZmIwU2huTS80OVRCK1J3eTJVczkzRGpoeEI1YmlxdHB0Sklpb2tKZ0x3Tk51?=
 =?utf-8?Q?NNgQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 21:25:46.0517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2354424c-9205-4eec-a577-08de3444da7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6734
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 21:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16867

On 12/5/25 2:52 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Not entirely sure why this exists. History indicates that someone wanted
> to select one of dbus's two license for distribution. Not entirely sure
> we need to change the recipe itself to do that.
> 

Seems we do the same for freetype. Not sure if it was to fix some SBOM
check issue or what. But yeah overwriting the LICENSE to hide that the
project is dual licensed doesn't change the fact it is dual licensed..

Andrew

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/recipes-core/dbus/dbus-arago.inc  | 3 ---
>   meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 4 ----
>   2 files changed, 7 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus-arago.inc
>   delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-core/dbus/dbus-arago.inc b/meta-arago-distro/recipes-core/dbus/dbus-arago.inc
> deleted file mode 100644
> index da612c59..00000000
> --- a/meta-arago-distro/recipes-core/dbus/dbus-arago.inc
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -PR:append = ".arago1"
> -
> -LICENSE = "GPL-2.0-or-later"
> diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> deleted file mode 100644
> index 5464eaa7..00000000
> --- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -DBUS_ARAGO = ""
> -DBUS_ARAGO:arago = "dbus-arago.inc"
> -
> -require ${DBUS_ARAGO}


