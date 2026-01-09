Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84019D26D8C
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:26:11 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16739.1767983161618074495
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TO999UG4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.36, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knCjAwVVOUWKugRDFpSFMVe58x6QWooik7O7Kob29d0faROoY83digst2vyKwL2WLNKB7HnjdQ1fvBOZqPnEdBhu/ydLSi71eYzgx6IOs8MojQHzSc4DSplHNWsCMKzTWon0ea4moZHi3Vu3nmPiF8AiOUiZHvLKhkGeFA2NvdTDweCJYQV5L9nx5EwMRMSanCKGNlT2TZwd9xYkJxbTzgtyNq1xHPVHiW2EPHJfjSYN60z3wDOiXAJISeDYYmH1h9vFnTVH4LOpoCYcRZDkJ8IAwum9XCUxTum8HkDRPWVgSaTFqnwiYfTXk2UO+2ijJt1aNypSSOmvefqgJMGkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrRN9WF56eb8vMPlfd5cXvSJ4FvOwpXqN0GAbvZytAU=;
 b=BwWty8qQzYqspRv22Bar44lkTLVfycYQa82KB0r34ynT4ywLSNkzG5yhpx0egaLcIBPHuMuwQToNXdZMid/OPPpQIlceifSOgeUjUsPEw1XJF00nj5CUixvK55fsd0mCVtlLc01Yi31DWNIm2ItiGmHSPpRqQAv7eDolHQonUs0QGjMkEnAY3rV9t2ogbQ1SAo3vK6s0zMcVpPsOdxKgkO7fXM0vlaoc2M4of4NshZQs5nS5BCClpTbtiHMi8hePUgBQI6MI7AC/GNgfPLWmE5Hp+9FhyrDD46QZVR9Yrw5pwNRMeBtybIKZPk7pXJuvx9/IrPhvJJ46TrBQUrM62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrRN9WF56eb8vMPlfd5cXvSJ4FvOwpXqN0GAbvZytAU=;
 b=TO999UG465nchiwH9ncb1cOoQCZulEBUyohbbrJHCFtp8yB3Wtidqhh8QeeFzIxbJWdbJ8r+DwiIQebpXixn+DcTxJJ00lQvkKMNPQEg2J7h3w5LS0cP7M7ywKYgvthypd27tDfoP1p0YtWtwHFlQ5QwBfQI3FdWsLBebicfEYA=
Received: from PH0PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:e::7) by
 IA1PR10MB7357.namprd10.prod.outlook.com (2603:10b6:208:3ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 18:25:59 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::92) by PH0PR07CA0032.outlook.office365.com
 (2603:10b6:510:e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 18:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:25:59 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:25:59 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:25:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:25:58 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IPwJi474836;
	Fri, 9 Jan 2026 12:25:58 -0600
Message-ID: <0f248559-9e3b-489b-b473-404ded0c359a@ti.com>
Date: Fri, 9 Jan 2026 12:25:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] ti-core-initramfs: Shrink size of
 initramfs
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <1889231A663B8440.2339348@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1889231A663B8440.2339348@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|IA1PR10MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf63c98-931f-4240-6504-08de4fac8997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|34020700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?em5wVkJaeURVSHFBdjRvK3ZodHNmWVlDb1U1T1pUL3BrZDNUZ1BrMTRWaEp4?=
 =?utf-8?B?dE12ekZHYU9GRWZxQnBmYk5lNzI1S1NVZXhEV0xKeVlXRDlkek5zRnAzZjJY?=
 =?utf-8?B?a3pPckJsTGFlb2xsNG9hUUgvRkZxcFdycXRpR0ZGbWF5cWcxaFhaRERwTTN4?=
 =?utf-8?B?YUh1NmZid0VUOC95M1VFVkdOTGU5ZndRT2FBeWFvNU0zMGtiQ0oxUGU1eFhH?=
 =?utf-8?B?Uk05YUJkTjdUeEpIRSt4ak5YTkVyT3dtbVgxakxrWlhyMk5HNGxsRTJobHZB?=
 =?utf-8?B?UytVSjVvMUJpNHRsQWZOWUh4MGtrQ2VIaGw3d1V0cEdzREVITEFtVmp2V0lC?=
 =?utf-8?B?VkwyY0F1ZWNZeG1aa1dlaFVFeXZvM3ZqVzF1NXpMbGkzK3RrVmE0bnBQZmhR?=
 =?utf-8?B?TElRNjF3Q24zVXMweTZ4dC9pVjhXYm14RUY0UlUvMW9CbWZlSmYvNitNakF2?=
 =?utf-8?B?RDc3ei93RGFOL2k2b2xRWm1aOVRBb1plMVMvSVFMV1dST0M1Uk95eHdRV29p?=
 =?utf-8?B?bDNkL1JUS3draTJzS2RMYytxTWtCdGNRMXFoNFdYZlEvclM1NVB2V0xLQnVR?=
 =?utf-8?B?d01hd1lVQ3RSbS9sdlpaSjNLcEtpZXFTMFExdlBrdmFWU2FyczZXajdacHlv?=
 =?utf-8?B?WUFrZzMzRGtUWm5rTFc1MmZQMXlncVBOckN6ajJhV3FEL3h1T1lITzY5RUxk?=
 =?utf-8?B?dUQwYzgxS3NyL2I2bWxzVmROVERxblRjTTdsMUh0UXI4bHRZSXYwOTFac2lt?=
 =?utf-8?B?ZWtyNjU4cmdqamJ5TjZmM05yVThZL0JJZlRhaENQWXRIZ2lrQ1EzTnZmSjJP?=
 =?utf-8?B?cVhHdzRwRjA5ZEdDdkliN0pnaEI0UTFDcnZ5cnNPcmo1akZ0MG5lZXhLM2lX?=
 =?utf-8?B?Qi9oQjZHNmRSNUM0THdZdGh4REFsQWhNM0pwRjlJdm8wMmR3d05oaGJHcGJD?=
 =?utf-8?B?TTYrdW1KbmNCbFJrQU5BU0VGQXNmYndkaEU3cGxXV1NZdDNxdFpRbHBFRERQ?=
 =?utf-8?B?RG1vQkNvUkFack9MTmdYMTFXUDZUM2pNb0s4bmE0eThmZXZjaUVUSlBUYmtM?=
 =?utf-8?B?MktTMzRIa0tWQjhTRVVMVnJMSnlqbEdHby9EU3hEWmdjL1BRMk9wN1d0UUhM?=
 =?utf-8?B?SGV6K2krNzIwd2xaL1VqQ0R5NXNHeERUNnpPNjc0aXYzQ2laM0F6c3VBb3Bh?=
 =?utf-8?B?dS9PT3l3Mk9jWVEzd1laQmtQOHRTM3RMZnJ2dFB1aUNHaG1lUFV2d0xydmlZ?=
 =?utf-8?B?SFNlcVRBVXc3SWdZcXNKOFVxWlJQOXg2UUpVcDd2ZzhxYmlWZjJ1TjY5Q1BM?=
 =?utf-8?B?ZkRnL3ZVSVBPNEZEdDJNSjBOUjNzOWhjMHpZN2trOGVsdnh0QzdJVFQ0VWNR?=
 =?utf-8?B?MmdTb1Fua1o4aEhwV0VxeXJtdlJRQUFkYWFmY1J1UVU5RkkwaGE2R2JRcWtn?=
 =?utf-8?B?a0xDYVNMNk5vK09RTXpkNm51ZEFRZmNpY0RTZ1FKaEJXdWgrUS8vOFF3Mmxo?=
 =?utf-8?B?M0lGMFU4Z0FHUGtMY25Yc2hMSWJ5d2o1elVpc3U3cUYrWk9RQVZveENycFB5?=
 =?utf-8?B?ZFdIZ0xyVWg2eUhFUDNZblZlSitjRFE2ajV4bXN6NzlMdGRGSUNyTTNrRG55?=
 =?utf-8?B?WWtQcW1KaElKdHl5TjBUQTFLdFk3MEdrSHVJTnhhY0hKdE4rbmdIR2JqN3RG?=
 =?utf-8?B?SFpwT0JUR0d4dWE4U2R5UHZlRUt0NWlPaXFIVTNtT0ZLaXRoM1J6dTVRZHMz?=
 =?utf-8?B?T0ZHem8vMDVjUlBOMDRXU1VXZGJ1TmdlM2NyWVBXL2QrWHpwdWtQN0djVEYx?=
 =?utf-8?B?V3pBd3l2WlpUakRKb0c3ck9INVE2a1FsbUFuZW5xVTM4bGkzcFBMb2RRZ1VV?=
 =?utf-8?B?WFVDTDVoM1BGcW9EaS8xM01SK1BmLzNsSzRKenBzWjR4WEgxNDNZRUdscU16?=
 =?utf-8?B?Z2svbE51eHk5OER4RnVLblhQTzZHVnJwaWI0QW5TUHVqWUU5WVRwTWdaWkJZ?=
 =?utf-8?B?L0hJUlFQNmlTWnE0NGJzdUVQOHIwZjN3TTBJQTArTVFRSXRZNmJGVGdOOWt2?=
 =?utf-8?B?WU9penpic3hWQTFWeENNRlhHREZva3UzYVFmazZ2MXhISTkzd29ISWFMalFO?=
 =?utf-8?Q?bXko=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(34020700016)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:25:59.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf63c98-931f-4240-6504-08de4fac8997
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7357
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16946


dang it...  wrong list.



On 1/9/2026 12:22 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> License-Update: Moving away from packagegroup-core-boot.bb removed the
> LICENSE setting.  Just adding it back in.
> 
> It looks like we were modelling this initramfs off of the wrong example
> from poky.  This setup produces a much smaller initramfs.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Add missing License-Udate.
> 
>   .../packagegroup-ti-core-initramfs.bb         | 12 ++++---
>   .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++----------
>   2 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index 86b69aff..c759808c 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -1,16 +1,18 @@
>   SUMMARY = "Minimal initramfs for boot requirements"
>   
> -require recipes-core/packagegroups/packagegroup-core-boot.bb
> +LICENSE = "MIT"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
>   
>   TI_INITRAMFS_KERNEL_MODULES ?= ""
>   
>   RDEPENDS:${PN} += "\
>       ${TI_INITRAMFS_KERNEL_MODULES} \
> +    ${VIRTUAL-RUNTIME_base-utils} \
> +    base-passwd \
>       initramfs-framework-base \
>       initramfs-module-udev \
>       initramfs-module-nfsrootfs \
> -    nfs-utils \
> -    nfs-utils-client \
>   "
> -
> -RDEPENDS:${PN}:remove = "grub-efi kernel"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> index 1a102d82..223fef7a 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> @@ -7,29 +7,26 @@ DESCRIPTION = "Image meant to probe boot essential modules\
>   
>   LICENSE = "MIT"
>   
> -inherit core-image
> -
> -IMAGE_NAME = "ti-core-initramfs"
> -
> -IMAGE_NAME_SUFFIX = ""
> +INITRAMFS_FSTYPES = "cpio cpio.xz"
>   
> -IMAGE_FEATURES:remove = "package-management"
> +INITRAMFS_MAXSIZE = "65536"
>   
> -INITRAMFS_FSTYPES = "cpio cpio.xz"
> +IMAGE_NAME = "ti-core-initramfs"
>   
> -IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +export IMAGE_BASENAME = "${IMAGE_NAME}"
>   
>   PACKAGE_INSTALL = "packagegroup-ti-core-initramfs"
>   
> -export IMAGE_BASENAME = "${IMAGE_NAME}"
> +# Ensure the initramfs only contains the bare minimum
> +IMAGE_FEATURES = ""
> +IMAGE_LINGUAS = ""
>   
> -IMAGE_OVERHEAD_FACTOR = "1.1"
> +# on the kernel image.
> +PACKAGE_EXCLUDE = "kernel-image-*"
> +
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +IMAGE_NAME_SUFFIX ?= ""
> +IMAGE_ROOTFS_SIZE = "8192"
> +IMAGE_ROOTFS_EXTRA_SPACE = "0"
>   
> -# To further reduce the size of the rootfs, remove the /boot directory from
> -# the final image this is usually done by adding RDEPENDS_kernel-base = ""
> -# in the configuration file. In our case we can't use this method. Instead we
> -# just wipe out the content of "/boot" before creating the image.
> -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> -empty_boot_dir () {
> -	rm -rf ${IMAGE_ROOTFS}/boot/*
> -}
> +inherit image

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

