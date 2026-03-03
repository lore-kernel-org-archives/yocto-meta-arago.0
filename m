Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09D6EDA6B2
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:19:12 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24033.1772558350782428737
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 09:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dTsjuxNR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.37, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8zp2i1QxNKpstRPcW8ptACtt+LDdBbzTisIPMYfcTCa9L7ezFN3JY7kJOn6mmNNBdTPTGenZxN96txhXrEbsWz5Z51YdyUFKNGoKIHj+TC+mAIBtAHRaMZDAD7WmI6LmNyXTGWYZjYcVSUYAsaXa1O3+SoHPK/Bo6wm6DwGxHKRD7ABp7ncLssvnmgr7WmtnAF+u1ROzsG/JGdze4WssRp9hCXxZVAK7kVmxg5TL/KheFJH0t892+e7+i+e1xN5XVNpWgSv3AsOiCa/iZyTpITJY1v9LIiOJ3ZbW+xfRyMKE64QA0j24Wq5GDRdQx7d5LCfjKsXauNlMhUYeechSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CnbkR4xSmHn1B8F11KkrigyE3H7EecuM2mn4tTaBgI=;
 b=OZR6zW9GUoV9jpp+eX1rgL+iHKk2am7je9AE6orxkwt+eVzAhN1beQ2UA5rG5RgixSWuu0+HOffJy6tIiAQOIE6tFhx8gUJj2yx9z2/XqOwyQvrMNIyv8IkTKYeNI2HDpvjBl831k3tPOQH7SEftVCaRv9HHIgpALPZWj2L8wyQmdxRtCGx51sCvuWvGNEUBS9kE46kuPWEYatkYf7F8mRXFyhKIFQxpModl27UIQwwKi2tLvBs9EFk9QqYDJYo9p8M8zgK00k82Hd+0esp3M22yv6rUXrXSf4LagMSJrYIZJxz7q+APgwyNfWqGNB5KiPXpCD/cUzfAkL5VQSUJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CnbkR4xSmHn1B8F11KkrigyE3H7EecuM2mn4tTaBgI=;
 b=dTsjuxNRYu99CiYUzUL8u8/PR04lIB0kS883Hj77I9MylS04DQvrTcFaFJKLk0HRPdEG+aG8JaSDZ6cPFtzefIIAbMnotNqDmH6/Oa52BW4cWHcA/N54WxjewtvV8xDZ3x9Vt/t2t1OwPz1UmvtyuoAThAkllxYCCovMSsHspU0=
Received: from MN0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::15)
 by CY5PR10MB6118.namprd10.prod.outlook.com (2603:10b6:930:36::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:19:06 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::40) by MN0P220CA0004.outlook.office365.com
 (2603:10b6:208:52e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 17:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 17:19:06 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:19:05 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:19:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 11:19:05 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623HJ5Xr3008814;
	Tue, 3 Mar 2026 11:19:05 -0600
Message-ID: <d27ccb3c-4f70-486b-baf7-2dfc0943e240@ti.com>
Date: Tue, 3 Mar 2026 11:19:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] tisdk-uenv: Add instructions to load
 initramfs while booting linux
To: <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
	<praneeth@ti.com>, <denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260303104930.889956-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|CY5PR10MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba7ef84-c4d1-46d5-5119-08de7948f98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	/k7EfTRSsSWi8aBw1s8Lup2CuekLIYSkJjaZhF1FJZw09icnsNxIxWj0mwwwFCDWJ6gZ77WpP8QxFmuWHiu215AOHBTBclqMew6egJrQ0klVSVuPj7QwAdy6+wg2Q1LQjFyL70VX9FvZyX8r7q7cOg13BE40yIp8FjAvVP4Cvh+DKI7HVE96ny2On+2Ii7nHwK56HmIKCXblFwaHhZ3+2E++2JPrL5ihSOJJnipnPcS4+1UUoFL3aj13MqFmJOAdVWlUkPRRm9VKbD114GwmjdLxpolJ5DAi+Gl15VnuuVlCPkc/Yu0I0CzEh7IyyCtd2BoDmzILwopzOuSw0iJtl7h9uRygDKN8KLVR0NOvkDZ+Nd0kHtrHjrkacAdRcHJNJkCTsKbzXRlX/c4O80NTJnjiXgxYHx4LJWwnRR6iV55NXArCsfLrrMjlGGQcjHMQmjmvGtf/mIrpJ7ZkZ/yi6cZIOfG5mJnN2TVK+keUGuKPxg/R0LxCDWirSyypp+b5i+jYt0coxlzFYzHWn7nsECUqcrCUVsaSqHaT6gzJxkQ2IK81oKJHPXagu2gOEXL3Z42pHJRLKF9MT1pJdwCGTD0ou+iBXFRhVDB/knGd4GB1xl7DaLmkTiY/n7Ryk0GDjSkZx/05eWJmCjWPytAYe2VKxX1JiISaCJ5hxDTefnsv00uY3CHKv1BvS8iNJKnh41bpfmlyGwhnXCqvQ/otnqClsPlpCwKkaEQnazoHLoXA8dDsgAPMLwiDMUXZ6BEjs4jN8j6DvuJt+QVlOLjpig==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x4LYttz4ZFe/tJO4fOFrEW6fUzpfDlWQ1rnKD+sG4IU5GqBdIX3cXQEn0RcJlAQ/5D3NE9Vkp/+Miqsyk6tQICOLNEJ4w/fyHvhhSWSn/FEnYCtttZixiVgGkeJHzvKNf7qUbN62B4BXkSykq5CnRYdm55P3k+LmvXVxUs1P7kgy5pUlKIDsaOQlfEwO+FbylJPB8peXy5loN+zcKixfZZtSr1HAFQp/s4RDyXlk+EIaY2Uhi208YtZL37Pxzm/tOjrvoJ1BTcA5kNgMi7JZz3eGCgtE9p4hyM+kvWxVyVBa1nhzIaU5cpezDPN/myKtxLjK8QzsffN5mw2qiT60okrPuLKVqegCIzgYniviM2AIDYNhpjw6akcf4V2vDz/wjs2634x6afOxjdiu6jsFE2Zc9blvEbA0wV6NqdfmkWUXWVi1J4arzt4Ohxa+z3zS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:19:06.3519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba7ef84-c4d1-46d5-5119-08de7948f98e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6118
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 17:19:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17206

On 3/3/26 4:49 AM, Moteen Shah via lists.yoctoproject.org wrote:
> Add instructions to load initramfs image and update the boot command
> to use the image to boot the linux kernel.
> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt  | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> index 0af0eef3..5ac61b34 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> @@ -7,3 +7,18 @@
>   #       default on all newer U-Boot images.  This also means that some
>   #       variables such as bootdelay cannot be changed by this file since
>   #       it is not evaluated until the bootcmd is run.
> +
> +# Initramfs configuration
> +# Name of the initramfs file in the boot partition
> +name_initramfs=ti-core-initramfs.cpio.xz
> +
> +# Command to load initramfs from boot partition (mmc device:partition)
> +# Adjust the device number (0 or 1) based on your setup
> +# mmcdev is set to 1 by default, partition 1 is the boot partition
> +get_initramfs_mmc=fatload mmc ${mmcdev}:1 ${rdaddr} ${name_initramfs}
> +

This belongs in u-boot default env, it is basically the same as `get_fdt_mmc`
and other helpers already there.

> +# Load initramfs and set up variables
> +load_initramfs=if run get_initramfs_mmc; then setenv _initramfs ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs not found, continuing without initramfs; setenv rd_spec -; fi
> +

This should be part of `mmcloados` in u-boot also.

> +# Custom boot command that loads initramfs before kernel
> +init_mmc=run args_all args_mmc load_initramfs

With the above added, you don't need to override `init_mmc` so
this line goes away too.

That leaves one line left, `name_initramfs`. How about just
setting a sane default name in u-boot. We got away with something
like this for K2 plats:

https://github.com/u-boot/u-boot/blob/master/board/ti/ks2_evm/k2e_evm.env#L12

although I'd recommend a more generic filename.

Andrew

> \ No newline at end of file


