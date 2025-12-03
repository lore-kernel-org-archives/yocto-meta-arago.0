Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D054CD116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 05:58:44 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8587.1764741517375177953
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 21:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=p9L+Ei4D;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.6, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSV6WH2pCTaVx1iYSSfaDRu3j0l0r5iKg4KZm+otRj7gb/5cd4H6G1LFcNm8n8dPdAegu47UxPHr63JyE6HeQYw6Va4WceVfI6omhZ04+r+fAsr8C1W/YAeHVkCt6MCN+Bmmm//7EhPABub+y6LWlHBPNSN7O8g9IVnwefysCsbPWNlt++KKDow5WT/EqeQzDII+6i65xOKetwHCTvu9W6gAqUPpwSWly2Z0mMGf1aKjLsof+EuzxsoFdCGB43aMvKElo71VbfvpL84Dv5tgv+R4/jK23yvGZABcZWpgRuJu7lyPEW9VTqSTp2a9FQHXlFIldukGODuFOXNwno+8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9OQhNNVR8s5QVBqzwRl8rZ/X78bry4uN6KIMnN1/ms=;
 b=hHmOhTNewARFYGTd+N5QAUCrARsLaMQ7NYsadEeo//ZsiVnUw30L+BwnJEriR1pGKcCNqoETDToKLu+Q45qD1GkYM5Cb+EzDTscJH6BDULHekrymoEWm0TZyWa1Ky+5jIgP5uFyAteSQKnfsoZIcjAbiVyEcAC+oqn47bI5Nfld6TUycLzwXOzesnGl/bkivm2C0qIPUk3bFSyV+pvHJ1HFoto9o51ffv9UrbYXUva4d7RdUCxnooDUI6/WdHeaIqfIYvKt4S70+RzOup2Y3LmFW+SGvBfAcnfDSogGZsREif6gi+WIuiIcb2PL4TToKoLrpTsCnDuwgPvD0x/5P1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9OQhNNVR8s5QVBqzwRl8rZ/X78bry4uN6KIMnN1/ms=;
 b=p9L+Ei4DbQ/JiHjfl5U/wIxUyQUVrBR7brD0nj/n0iLH6sUxcxz0lLHYdMqt5XQDSO/8AvdXkDgZbh9evpOxkEIJvR7ZX/xkJFFwD8OKV3kGmhOcJkdGaO9lWikM17u3jpHX/CRi5VLQnbNnIeebBisLncleTDBprzwXC9E94Cg=
Received: from BYAPR02CA0051.namprd02.prod.outlook.com (2603:10b6:a03:54::28)
 by PH8PR10MB6647.namprd10.prod.outlook.com (2603:10b6:510:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 05:58:34 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:54:cafe::dc) by BYAPR02CA0051.outlook.office365.com
 (2603:10b6:a03:54::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 05:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 05:58:34 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 23:58:31 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 23:58:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 23:58:31 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.158])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B35wU5b3518909;
	Tue, 2 Dec 2025 23:58:31 -0600
Date: Wed, 3 Dec 2025 11:28:30 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <anshuld@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>,
	<denys@konsulko.com>, <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH RFC 3/4] swupdate: add bootloader
 support
Message-ID: <20251203055830.73womzso5xslwr6l@yogi-work-pc>
References: <20251202111603.1616989-1-anshuld@ti.com>
 <20251202111603.1616989-4-anshuld@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202111603.1616989-4-anshuld@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|PH8PR10MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cad7ef4-ee2b-475f-2929-08de3230fe70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tazckrknyoPzc52HrFIGG4ObxvIvvmSqUyyqD+xlM7Z51u3HcafypEHMsFLU?=
 =?us-ascii?Q?EtqjkSt+/3QvBqht0oyLRRKqqdRee4h5EAh/qbmo/lTlhQAkIfH+/jxs+6I4?=
 =?us-ascii?Q?ogWfNdqTOf+JF46NIDjBvmLuqOz9ph+qb5Z9g65aacGchZBq8f6mnJCXBGSn?=
 =?us-ascii?Q?IJaiwbUHKpIimsB6tpfnvOz8vdqajYkCiW35EBpEGJYhASvMqGcnH9tDtgF0?=
 =?us-ascii?Q?np3pKyOTn5deILdG4yOtFEC1CUy9UjreZ2OuLl+t5XuikJn2pikaJCzFyPiu?=
 =?us-ascii?Q?IzvK72Ei+1xPFvDmYZAZy8WxmUS1RQcX5NZaiWXIx326WgJyuOQ+h1zKSyEe?=
 =?us-ascii?Q?oPEgM3pMxU6/OnQ2/CowInxO5sGvZ7hrOvzJKWNVFbUePLvyvurSH51ZpA0Z?=
 =?us-ascii?Q?FGmh+3UhmTWU5P8EEbhRFZ8Kwxd3mUuD2fOI0uEbREsR1CguDiLfKCUeV2xr?=
 =?us-ascii?Q?cpJ8lOEnpBB9ZLviYP6eBm9hI3cXPMgtwYKCaCP9vVML85uY+KetwzFvUJed?=
 =?us-ascii?Q?/Zpl388byS2s9s8QG9T9eetmXKcVroxnwmnRaroARwt5M3QRyAI+EQVim8zY?=
 =?us-ascii?Q?2gtQwjfL00AdHsFEP/1xKf+7ySgxJumaOMbPgkIc9+Sabzy4kNajR+8fYF9d?=
 =?us-ascii?Q?TmSfWI9E/1XLGA2duum8eSGXBpuHOkYIzlndg5LdCM6FRV0zV0jJdGeC2NJp?=
 =?us-ascii?Q?6H0iwTe0f9p0pm4EqDB9l13AwZai8nAvNNfzmNl42O3popTNUKqwBggaEloF?=
 =?us-ascii?Q?ydLeYnJIGf1b0K19efhpG8nUVwRNVAGpzptpIYOIFNNlGrAQdUPVi1pf7i9n?=
 =?us-ascii?Q?Cdy/+9DIA+yeF3PS1X6oDgi2kfuQ+RAD14EAsu9jJ3DQm3o6McdQIRQZgp2y?=
 =?us-ascii?Q?c1BsUoHDd80pMadS/Nym6UAD7RVO6csEos4lXfG+9rZxStgqYb62VjcCmvAV?=
 =?us-ascii?Q?+ti9w0s6ZOq9YNREkVxKYDUCWRSiqln7qMkzR5UaZcPxbeJPsU3pa+Fp8B33?=
 =?us-ascii?Q?/ugrkLaVDKPGSdnD5M49CifltTABhQpK0w/N2zGHw8Lwop5t4fEU0BcRH95J?=
 =?us-ascii?Q?+7YDDFzz9WPQctJssyhO0dU2zwsBZaMlzDjN7ebCNKySvPu2+Fs9CiHmKk9u?=
 =?us-ascii?Q?iuOiAt3rE1TUKnvxddPzm1oy2rtuGDcictNN9vEwZQ3kxeffL9g9Fn6ZbwiZ?=
 =?us-ascii?Q?gDqTo8puNL8Bqk+gpALNB8Fn71pGUTUVcoB3+YkPGVPqVVVKCIIH1oeSyCNp?=
 =?us-ascii?Q?ui7SHeLP1tDqIC/w0V8O0Kc02FNqpgX0XLoT7VgBslQwBeqWoHIaS8lEIIM/?=
 =?us-ascii?Q?Yek5keNw2HQ85CbcUaJDcsSle4l1eTCPBYsd+Zi68r6CMtqjqg8Zv8X7Yojp?=
 =?us-ascii?Q?b5M6+K4qFWfIK8DeWJEPQxfQaCYKT1N6g03+SPUwdUfTYIMn4vjCM/90waDU?=
 =?us-ascii?Q?5PsRda8cheY/9flh/cz+qCSc49ifprPJEGCEhFnkyntNa/5bjIFz2zI23op2?=
 =?us-ascii?Q?YgLsI5gSRU/cD/A=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:58:34.0741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cad7ef4-ee2b-475f-2929-08de3230fe70
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6647
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Dec 2025 05:58:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16855

On 16:46-20251202, Anshul Dalal via lists.yoctoproject.org wrote:
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
>  .../recipes-swupdate/images/files/sw-description     | 12 ++++++++++++
>  .../recipes-swupdate/libubootenv/files/fw_env.config |  5 +++++
>  .../libubootenv/libubootenv_%.bbappend               | 10 ++++++++++
>  .../recipes-swupdate/swupdate/files/defconfig        |  2 ++
>  .../recipes-swupdate/swupdate/files/swupdate.sh      |  4 ++++
>  .../recipes-swupdate/swupdate/swupdate_%.bbappend    |  2 ++
>  6 files changed, 35 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-swupdate/images/files/sw-description b/meta-arago-distro/recipes-swupdate/images/files/sw-description
> index 8dc4e2b2..241bc95c 100644
> --- a/meta-arago-distro/recipes-swupdate/images/files/sw-description
> +++ b/meta-arago-distro/recipes-swupdate/images/files/sw-description
> @@ -15,6 +15,12 @@ software =
>  						compressed = "zlib";
>  					},
>  				);
> +				uboot: (
> +					{
> +						name = "bootpart";
> +						value = "0:1";
> +					},
> +				);
>  			};
>  
>  			copy2 : {
> @@ -26,6 +32,12 @@ software =
>  						compressed = "zlib";
>  					},
>  				);
> +				uboot: (
> +					{
> +						name = "bootpart";
> +						value = "0:2";
> +					},
> +				);
>  			};
>  		};
>  	}
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

Does this fw_env.config work for all machines?  

> diff --git a/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
> new file mode 100644
> index 00000000..e3d142f2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> +
> +SRC_URI:append = " file://fw_env.config"

If this config is not tested on all boards, it would be best to only append it
to the machines that are tested.

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
>  CONFIG_HW_COMPATIBILITY=y
>  # CONFIG_LUA is not set
>  # CONFIG_BOOTLOADER_NONE is not set
> +CONFIG_UBOOT=y
>  CONFIG_SYSTEMD=y
>  CONFIG_WEBSERVER=y
> +CONFIG_BOOTLOADERHANDLER=y
>  CONFIG_CFI=y
>  CONFIG_EMMC_HANDLER=y
>  CONFIG_RAW=y
> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
> index bb3a3593..2083062e 100644
> --- a/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
> +++ b/meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
> @@ -8,4 +8,8 @@ else
>  	SELECTION="-e stable,copy2"
>  fi
>  
> +# BACKUP_REG0 MMR on AM62x
> +UBOOT_BOOTCOUNT_ADDR=0x4301c100
> +
> +devmem2 $UBOOT_BOOTCOUNT_ADDR w 0

Using devmem2 might be a bad idea. Consider using fw_setenv [1] to set
the bootcount to 0. 

[1] https://manpages.debian.org/testing/libubootenv-tool/fw_setenv.8.en.html

-- Yogesh 

>  swupdate -H @MACHINE@:1.0 ${SELECTION} -p 'reboot' -f /etc/swupdate.cfg -w "-r /www -p 8080"
> diff --git a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
> index 0ce763f9..20f87435 100644
> --- a/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
> +++ b/meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
> @@ -2,6 +2,8 @@ inherit swupdate-lib
>  
>  FILESEXTRAPATHS:append := "${THISDIR}/files:"
>  
> +RDEPENDS:${PN} += "devmem2"
> +
>  FILES:${PN} += " \
>    ${SWUPDATE_HW_COMPATIBILITY_FILE} \
>  "
> -- 
> 2.52.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16850): https://lists.yoctoproject.org/g/meta-arago/message/16850
> Mute This Topic: https://lists.yoctoproject.org/mt/116574476/9980049
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [y-hegde@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

