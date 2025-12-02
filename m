Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15341D1266B
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 19:23:32 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1565.1764703402414498053
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 11:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=X08lkS/y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.65, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jy676z0voPGNof/FarIXx03+OwpB5D3Glqy1nZAuUgm/YjnpghTDLR1zFvNovh7dk78b6VlUuaW0x8xGVQ9kF+pXNxcTdGHOvqv3cIzOzi7+KD1A9qSr6SHFu4q0S1Rw6hYuqq+IvNj1PcNiqtVOV0CmDYmRiHT9Edr1Nm6wyDVnFPfR5bLo25LFhd8wztKl7fH65OhvIhgWRIPZuOg61SyGZf4V+W8kIVwqAAmRh92e0I96aeY7vJV3yvYZQ/tdqScEbbt0j+vj6t5QdRhCllntOjdM3eFeqqf+YVAiySO3JU1HexYXLSiK/rqjMCoYp4w+JfpE4sssRHPIYjn1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2yhLMOfy55uBfR2YQoMhg7diOApl684BfGJSI3wgZk=;
 b=Xgzyv1nf3VgTds+Z4XP1qN0fRWfXsMWpmTa4ko9Qqa81NDEbI6s2exICjIZ5Gd9M/hNQcewpR4tAROCfivRXxFeGiUcUVNSfed0CUOMwhNxeNIrriJAFSNTjWB6/nrPNwkuotL/9jRWWrQMxHEZ035UKZRgVO5JrHD9rgfy/PmNH24QuD5762GvwMPEh9OA1z/num5CM7g6kz8GFJoobyQfRiigA2O8BfHFdlg+0dZRZIgwfmQ1+4nYz7LFS8exaCbZwm8foLN+up+7AXbGF8ItC3ThoEVFt/NkmhTKS/wFYLg7DhmQMJonDnzwsYechNxKY4aDlmSRszVbAIveOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2yhLMOfy55uBfR2YQoMhg7diOApl684BfGJSI3wgZk=;
 b=X08lkS/y5nzpVn5H6y1E7MgbjT9kPOKu0vEJQMdl8cr670NKReOpNGQA2NvLL7dH7aRW/rFA9c6WephsKhJDO1RBSNDGH/OSdxGTZrEz/LUJpScdTBIptClSi/S5XFarDAdNtYnSGRQ6tlZMdWWRmgFyYIGKBYYgom1FkAt4uF4=
Received: from PH7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::11)
 by MW4PR10MB6653.namprd10.prod.outlook.com (2603:10b6:303:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 19:23:19 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::26) by PH7P220CA0024.outlook.office365.com
 (2603:10b6:510:326::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 19:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 19:23:17 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 13:23:07 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 13:23:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 13:23:07 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2JN6Dk2761575;
	Tue, 2 Dec 2025 13:23:07 -0600
Message-ID: <4ca3917b-8303-4f5b-bd42-65cfb19551db@ti.com>
Date: Tue, 2 Dec 2025 13:23:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH RFC 3/4] swupdate: add bootloader
 support
To: <anshuld@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
References: <20251202111603.1616989-1-anshuld@ti.com>
 <20251202111603.1616989-4-anshuld@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251202111603.1616989-4-anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|MW4PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: b57832f2-845a-4572-b166-08de31d83f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXhJOFpQWForaE0wWWZEVHFTK0tUMVQzS2h6SjlUdURNYlJ1clRUYzM0bXRB?=
 =?utf-8?B?eEgxRG9maW5zWXhyYnNHaDRDd2ZRdm9sZm0zVzVqVytiTnRNbFNYRGNpdGRs?=
 =?utf-8?B?dldmRTUvRmN4T0hXRXdwQTFwVE9NMTNmVlRDVmdTWXVUMElVSGVWNy9iczRs?=
 =?utf-8?B?WEt2dkJ3RDZML0JiVTFHeEtNYWhlVG1Vcmw2cmxBdUZNOExBU0UwS01rUlQx?=
 =?utf-8?B?QU1ZWGphQXJ6ZTQ2WUhJUngyTjNsc3VIV29XbkV6ZnByREVCeEthRm5mNEtV?=
 =?utf-8?B?T1hQUmZBYS9OcEVkYnNNQjJpVFRDeGN4ZllKMzFrR3FQcENjblZ6bXFBVzdz?=
 =?utf-8?B?Vld1alV3TWEzcUI0K0RuV2E2RUxOVFNEb3ZLZWhSUGlMR2xzeTBEQUo2WFNN?=
 =?utf-8?B?M3hicXUyM0NMSDRVdExCc0dmSWxLZGc4cWoya0xYcjRkbDZsZG8vUG81eTVV?=
 =?utf-8?B?Z29sVHpzazZVdlB6YlVHUnlUaDJGa3RrMThlRG9yU2ZmNWJNTVFad2JaVWMy?=
 =?utf-8?B?Y0xBaHo2ZDZDM0JMck9NdDlYMlBiM21HVW5peElCV04yeitlM3VSQjFEZnpO?=
 =?utf-8?B?R29PTmgxR0lNTnFlc00vdUJGdVQvcjZ6OHpwckJob0VHU2I4NVJtWEVwWG1k?=
 =?utf-8?B?dnFtemNTdmVvTnJEQzRrRDFrdHMySlpTQmwyWGhwSVdFSjNnelZFZHBBMk0x?=
 =?utf-8?B?b0YzeVVmSFpwb3ZkSXVQdHFVYkVpWmplSXphOHRGeUxJNm4zbWh5M0lBemNC?=
 =?utf-8?B?L0kxTC9ydHUzWHhtdjlGLzBHeThjNmJoM010UjFJcWR2NzFiQ1htcG9ONEZY?=
 =?utf-8?B?K20vY0Q5NEM4VzZIM1JWZHZGSjJ3cUhDd3dGbUQ2M2pUNXl0OFdGeFFVU1ln?=
 =?utf-8?B?eGU0N2NrUmRvS2pqN0FxYitOT2UwVEQ3cVArZFV4ZHdReTdpOERjajdVZGVG?=
 =?utf-8?B?UnlucTNsaEkwU2pibmJoS3VkQTczMnM2M2taMzNlY0RMWGNBTXpzK0F5UkFN?=
 =?utf-8?B?TjFkaTR4RHEyeCt2cXhZOHBmOVNtQzlGUkxQTmFUcXhJaXprdDJkN05Yc1ds?=
 =?utf-8?B?b0wvcFRYSUp6aXE4ZnlHTVRGMWduYlhvbmVoNkZUMm1lZUY2N09tejhUVnYr?=
 =?utf-8?B?VG45ZHl5KytJdnV4VkFpendmSHM1bi9OZVR6OGRYTTdPZUtNQUk1Q1BBUnNw?=
 =?utf-8?B?WWxKZWZpYkgxenRKSSt4ekFJYkZRUW1ic2E3dCs4OEV6VDN2NlFmWU52S1lr?=
 =?utf-8?B?VXYyZlVhUkpCYnY3N05ZczlYa1hxTTY2SGJCRlNqRlp0UXJLRGsvN1hLQmNz?=
 =?utf-8?B?ekxDM1Q4V3lMd2xFRFcrSzd5bm9ZQjVzNnQ0bU52dDVoWlB5NGM0RUFmVU9T?=
 =?utf-8?B?Zm0weURRbmRJdFduOEFMYlN1cGcwRkppQjRKdEl2aW4zL0tlUzN4NmxHNVhD?=
 =?utf-8?B?VWNaVVdrTFRqVGlFaUVwWk5LWStsT0dCeHBldFJraFI3M3NWZW9TNlRNVjIz?=
 =?utf-8?B?b3gzaGFIaU03QkFuRWI1RWppd3Z4blZPY09UeTZkN0ExbW90dEN2amx6elhT?=
 =?utf-8?B?VFVxaXQwTDc2S2tXR1JuOUFXQXlRejZLRVdBVjc2OEw2NTlmVEgyM0prc2Fo?=
 =?utf-8?B?RGlXS1p3SFdsM2pjdWpaWDBraDBhaEMxbGIrOEtQNjV4ZGl0eVNabkhmWTVr?=
 =?utf-8?B?UGJkMHQ4Y002NmswKzFjRVBOUThHVFZDaUVOV1hKdWxCa0pucjU0VWJ5TzhR?=
 =?utf-8?B?c3Y1TXhhakFkYjdWNUVuNTZvMXdsdlFmY2laRkw3ajZ0di9wTEhUb291OG5h?=
 =?utf-8?B?dU1PSERtSVFXM1hHM1l3cEE4bHJYYUFER1hOUEVqTEsvTytjdVVuR3lqeUpx?=
 =?utf-8?B?OWNlV2haQS83NFFKSTc4dmpGVnVtNzZkeDdLSkFWMWdMUFJldUlQSkRrN09K?=
 =?utf-8?B?cHpLeXhCVzZLL1puRjhVSVV3UmJ5cktFaHBkaEtGWC9yck5wajhRYldDRFly?=
 =?utf-8?Q?MSibv2EuXVymx4l2M1MczVramr4NRg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 19:23:17.2450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57832f2-845a-4572-b166-08de31d83f07
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6653
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 19:23:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16853

On 12/2/25 5:16 AM, Anshul Dalal via lists.yoctoproject.org wrote:
> U-Boot uses the 'bootpart' env variable to configure the rootfs for the
> kernel at boot. The BACKUP_REG0 MMR is also used to store bootcount as
> per U-Boot requirements[1].
> 
> After each reset, U-Boot increments the bootcount and it's reset to 0 by
> the swupdate service indicating a successful boot. If the kernel panics
> however (eg. if the update failed), the bootcount is never reset and
> keeps on getting incremented by U-Boot until it reaches certain
> threshold after which U-Boot switches to the other non-updated partition
> to ensure a successful boot.
> 
> This patch adds support for the same to the final .swu image generated
> by the update-image recipe.
> 
> [1]: https://docs.u-boot.org/en/latest/api/bootcount.html
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
>   .../recipes-swupdate/images/files/sw-description     | 12 ++++++++++++
>   .../recipes-swupdate/libubootenv/files/fw_env.config |  5 +++++
>   .../libubootenv/libubootenv_%.bbappend               | 10 ++++++++++
>   .../recipes-swupdate/swupdate/files/defconfig        |  2 ++
>   .../recipes-swupdate/swupdate/files/swupdate.sh      |  4 ++++
>   .../recipes-swupdate/swupdate/swupdate_%.bbappend    |  2 ++
>   6 files changed, 35 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
>   create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-description b/meta-arago-distro/recipes-swupdate/images/files/sw-description
> index 8dc4e2b2..241bc95c 100644
> --- a/meta-arago-distro/recipes-swupdate/images/files/sw-description
> +++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
> @@ -15,6 +15,12 @@ software =
>   						compressed = "zlib";
>   					},
>   				);
> +				uboot: (
> +					{
> +						name = "bootpart";
> +						value = "0:1";
> +					},
> +				);
>   			};
>   
>   			copy2 : {
> @@ -26,6 +32,12 @@ software =
>   						compressed = "zlib";
>   					},
>   				);
> +				uboot: (
> +					{
> +						name = "bootpart";
> +						value = "0:2";
> +					},
> +				);
>   			};
>   		};
>   	}
> diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config b/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
> new file mode 100644
> index 00000000..57eec5fc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
> @@ -0,0 +1,5 @@
> +# Describes the env location for U-Boot in the hw partition
> +# Second entry indicates redundant env
> +# Boot dev			Offset		Size
> +/dev/mmcblk0boot0	0x680000	0x20000
> +/dev/mmcblk0boot0	0x6a0000	0x20000
> diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
> new file mode 100644
> index 00000000..e3d142f2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> +
> +SRC_URI:append = " file://fw_env.config"
> +
> +do_install:append() {
> +	install -d ${D}${sysconfdir}
> +	install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}
> +}
> +
> +FILES:${PN}:append = " ${sysconfdir}"
> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
> index b1362eaa..4a2d78c0 100644
> --- a/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
> +++ b/meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
> @@ -1,8 +1,10 @@
>   CONFIG_HW_COMPATIBILITY=y
>   # CONFIG_LUA is not set
>   # CONFIG_BOOTLOADER_NONE is not set
> +CONFIG_UBOOT=y
>   CONFIG_SYSTEMD=y
>   CONFIG_WEBSERVER=y
> +CONFIG_BOOTLOADERHANDLER=y
>   CONFIG_CFI=y
>   CONFIG_EMMC_HANDLER=y
>   CONFIG_RAW=y
> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
> index bb3a3593..2083062e 100644
> --- a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
> +++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
> @@ -8,4 +8,8 @@ else
>   	SELECTION="-e stable,copy2"
>   fi
>   
> +# BACKUP_REG0 MMR on AM62x
> +UBOOT_BOOTCOUNT_ADDR=0x4301c100
> +
> +devmem2 $UBOOT_BOOTCOUNT_ADDR w 0

Yuck, magic memory locations and /dev/mem, I'm trying to get
rid of our dependence on /dev/mem in general so let's not add
to the problem. How about CONFIG_BOOTCOUNT_FS?

Or maybe store it in an EFI variable, look into efivarfs and
see if we can do something with that to allow usersapce access
to this count.

Andrew

>   swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg -w "-r /www -p 8080"
> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
> index 0ce763f9..20f87435 100644
> --- a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
> +++ b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
> @@ -2,6 +2,8 @@ inherit swupdate-lib
>   
>   FILESEXTRAPATHS:append := "${THISDIR}/files:"
>   
> +RDEPENDS:${PN} += "devmem2"
> +
>   FILES:${PN} += " \
>     ${SWUPDATE_HW_COMPATIBILITY_FILE} \
>   "


