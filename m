Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE85EB362F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:00:09 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20416.1772550005890356386
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 07:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qgmHXOr8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.67, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4zZR+uiF4cuazAnwEBS+J+BpWckQWcAyUFtzeJOqn1fAMfnoh8JcpELtIzcsSu8MxukCVht4l7pm/ZEqRBcOsrxpzOaClmgTvuIuy6+iuLUw4cQ/HPgWDokowuX/A8gYI1h7ii/B9+VnZ4lRrJJ7w6JqvJjFKqbGTQf3V4+BDrbHnyhakFtzQ0ICCtOJ70m1LZK5vKLYH1ecD0On2Xym7lvIryOnC1575OusCbEh+7teA8yzBiMrJsRFlZymT9HytZ53s2t5vDu60V8YqJaznqzGP0s5fQyDIZEHIjJOFPQtgX6Md6uCh/7SCks+Iv3xr+VlJZ5waUZGLoWHE0SGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvdBezKGShtkDeyO3k2CMGf/lYCypJm/T5td7u1Zunw=;
 b=b0OuUP82uHaaj/RxqpRDyfI8bjo2QgpSKGYz5d7rb1pRBFZD2QgUdumUML+js7AO/emH+2pflRNPyWrORiDa7THmD6+N4Q0hImZbsHpBoEuykEEEZjrzFYXBtESju4F3L4c5EzsblHBhJOP984hQm9Ub350AH4NyA3bc4M+Va8eHvmbAsdgWpWwq8d5DIThD+Trml86Z+DjmlkDzmCiDc7NwaN0e8sRk50xkIlpdiDtGq1/FRuu59YICD0sv7dninFvkQ9SysfFhUJB6J3JpMFk91waOrIA1vIx6VADy2XgrNov19k4dS6xp012ea8IDyZqELUkPgM3u3zIE2FgIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvdBezKGShtkDeyO3k2CMGf/lYCypJm/T5td7u1Zunw=;
 b=qgmHXOr8ht7xCAn2+HC6wUR9z4Qgc8yXQDPQbUuG/4JXE3HT0Z6XMdODzcvmodRRTntyfi5xTC5I1rIOBSoJ2cHLzKnUSV2p56uPdc5K9Z/4hajzzp4BxEtHIZn6iBAV//dcyf6RlXeGe4i5kvQJtt3PsC+/wH7S2ayZDyqVNWs=
Received: from BL0PR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:91::21)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:00:02 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::70) by BL0PR05CA0011.outlook.office365.com
 (2603:10b6:208:91::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 14:59:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 15:00:02 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:59:45 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:59:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:59:45 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623Exie92300439;
	Tue, 3 Mar 2026 08:59:44 -0600
Message-ID: <22586384-c71d-4d05-9d87-bc48ea8d1f90@ti.com>
Date: Tue, 3 Mar 2026 08:59:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tisdk-uenv: Add instructions to load initramfs while
 booting linux
To: Moteen Shah <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>,
	<denys@konsulko.com>, <vigneshr@ti.com>
References: <20260303104930.889956-1-m-shah@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260303104930.889956-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|DM6PR10MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c8769d-6b44-4c13-87d0-08de79358c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	xuyOv5npq9zM3GrSNYHkDzEWQHghr1I7ZgYCWLo8otnttwaS1oBSoueFF33YskN8AqpwapbcdkA7ER9KrntJDS6DRJQ2LV1JzC4hVZAKQwhIqlqAisXac4gobEzdQcKA2VFHu26icMmzlqbUTjnz6iCwL84HJqYYxBvE2KkVkv0AKrv8g3ySU6fcZZt0jwAfneVPL/SB6szBjkIA01MGbhinKZZS1QzY1Uz7AuAqAYh4LvlafhJHX4LqLLhEp5CT39/wibXFScR8cJ5ZwYvbeYtyM4zYTfwjsWP5o5boCnszvVoiuwdmNLm531PypskOQZmNJdUXYWZ7atb59KbHNlskKiUvjudBFeETmpkacYAgYTFyerl2kTTgz3Yhbxzpvpzk1hy1p4ZPgsD501B0ijJllihfZIlPa2kOvYUT/au1ygRw6tUMci5weY7rFm0x4KG6OwvYCCHx2qVXecni3qmmkJz/BXYteW0Y6PB3L4y4UH2QkC/NwN81wU9ueiI3CPWznJvSsgXvMt+Z5/KbleQZrGxKLtU0Ze2FGw+0bb07wrRgPcnqvi/InfDxVbczozNwl6Jr5CPaEbKej/HcznjZAmmaT0iT36Wt+u7lFLXpIjhDaKq8XZR08Q16xUbKhwF12/f5eFjEINaOatsUQYNcB02ndU2loX6rATT5HoBdRLDtNODBtc1gGl7r6Am1IHgaovgEfcDwiRfX34WYMPcK9+8I1O8inU7Ct6ypZY73EwMyGmzsMIZEgGtFsVo4Bi0cOl4ACzYaz4UnA5Wy4qT5YtepvUIb5BfhYxjxJmABYcJi3l0lpiFrFDkziqJuQA0WmynlDRszLUDVnqIIkQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f343AF/8V/mjEY909uhv2RdadY3ObNmBA1xVrGP2MD+jbmVZsMhNz0SfzMMWtMQ+o/p5BgKU1VrbYlm2EK4l93YHY8O8UkhIHLqJ3/zJf3s1fGEFpYPUMJxHse0JffJJEsTEB8hdDS/lp2YAlMe0Owwsrps43tB7UST8dX7oMKYRPymQjlhzbGLUxq5MFFlsL9aENcNOLGDv+4WwC+wleaal/LJ04S8B933AKhAsgwTs5JqbFLswGfQQUfc3pA1BI3Ox+kVQI0Q2AqJB3EXTVlrM/1U9wG3fJbC5iqE+PAiC4T76XRvcCaGM28GtbzQFbAqRKlPhKS7FjzafL2/nM9ZV5+21HRkD0cCFLqqKt3ZrwdX1g3A02zeCEt/2R4xx+ONkQUbarkVWEutNORanEqGdzWOhUr/7pQzBzbZ/1zgkQA/yIHzZzGG4CRBFbaCg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:00:02.2787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c8769d-6b44-4c13-87d0-08de79358c1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 15:00:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17199



On 3/3/2026 4:49 AM, Moteen Shah wrote:
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
> +# Load initramfs and set up variables
> +load_initramfs=if run get_initramfs_mmc; then setenv _initramfs ${rdaddr}:${filesize}; setenv rd_spec ${_initramfs}; echo Initramfs loaded at ${rdaddr}, size ${filesize}; else echo WARNING: Initramfs not found, continuing without initramfs; setenv rd_spec -; fi
> +
> +# Custom boot command that loads initramfs before kernel
> +init_mmc=run args_all args_mmc load_initramfs
> \ No newline at end of file

Does this work if there is no ti-core-initramsfs.cpio.xz in the boot 
partition?  Or is this assuming that there will always be an initramfs? 
Because that is a problem if it is required all the time in all cases 
for all platforms.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


