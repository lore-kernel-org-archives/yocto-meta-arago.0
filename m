Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6950EC1453
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:52:28 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18683.1772545945107206189
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gxUoXb/U;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.0, mailfrom: bb@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbRGjz+P7rR6xs72rXZRUeHhjM5aBag+wRuRQ5JWh1H8nRHzsbQxlDRYAUKpMl4xCxPbJgHUhYqU4okD1ePLDcjtaqgHsapeVCI9cudMP2Wd8aQ49JYXBozokAkRYOlldyIVCkmaQXisTrjoNUyXBqv9cdLWXHdMXTIrr39GBPZOKrE/OoP2uZfNLrzYeD+RqVXJBVG80v+ncS++Wcc0eYaDXhVCl+XML8KrtdYZhAzD20rC/lLNG51NtVrFVTuFEbQb2fKgPvFA+IDQRLvS71u+CVMJ8UI+FXaLHmspg5yAGATU0x4k4Mkk0xCon3Dn9s0r2vkQo+/vZTJzUzzEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCtFWpy6M6dxw5txVJa+++3bWFtUyJm8Gwyl7bnkHTY=;
 b=fK/zlnPaL0YItf3XHrynny3dqvuH1XIkHXaOxRtdu6+HKUwkOeIRCojyz2k1hr1rD5x1gbuTyCxOClwUF87nI0+AkN4RAx4WkcQai6Lp89m5Wg4LoARaTQ5csgIb5MixwurcI7503p/viz8VhrfZF0ibKTak/PPI2qkSkmIRsOpBUBh8Wn5h3Mc3vnv2mgJjg5TwJdS0W+0qn+K8HY7HaIzgmeVJrtaXvEck3/74ZgNmj8PAV2Eh+vV+X9IwKxBTZDzSznfRIndgY/xM6EHbx5Ivbkf8cZIZcmjrn5FQdTop8rV4JnYXXxRRhMiBUMpMKHRDcSZquRm0Dk63ycg7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCtFWpy6M6dxw5txVJa+++3bWFtUyJm8Gwyl7bnkHTY=;
 b=gxUoXb/UV2tjQejnd2UyEB81sptYOaaUBmaSQ+wBU0zfZZMFCWQuFuovtikPuR5nnB4rMdnSXGgo1mnNOMDNbW2S0joLkdW280WgPvE2jq56EzVtxAZc3XPL8QdP9IUZXyHUA81QRjL+r3uJbbW6HFHkHDuL2i7WY+Xbp6xUiFU=
Received: from BLAPR03CA0093.namprd03.prod.outlook.com (2603:10b6:208:32a::8)
 by BN0PR10MB4935.namprd10.prod.outlook.com (2603:10b6:408:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:52:21 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::d5) by BLAPR03CA0093.outlook.office365.com
 (2603:10b6:208:32a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 13:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 13:52:21 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 07:52:20 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 07:52:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 07:52:20 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623DqKo02712321;
	Tue, 3 Mar 2026 07:52:20 -0600
Date: Tue, 3 Mar 2026 07:52:20 -0600
From: Bryan Brattlof <bb@ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
	<vigneshr@ti.com>
Subject: Re: [PATCH] tisdk-uenv: Add instructions to load initramfs while
 booting linux
Message-ID: <20260303135220.dyexqmrhoheqj5gs@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260303104930.889956-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260303104930.889956-1-m-shah@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|BN0PR10MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b1057a-b997-43d7-23d0-08de792c1776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	QutnS6Uw2pGGElPjjhlWrwld5VW8JfStj3roh/6GBz3I/KBjC5Wyx744ah/MsjLV+aS17kTz4NYJrqNym+UL0o9bekeup0BR9rQ1SJ7snL8C6TQpfRDDJk3JlJJ064dnSAfJeNs8dfgv+6VkJsLupGq7Res5FGp1sWjKZuiZJPokBkENl6O7d6XTAPJ2cFSNGAx/2bLGs0fcCYTPCmylNpE8p/CfjlxJ+kzvTr12SD7x/9QjDl66RaFkBpvcLg9IyvPKGWRKc76f8Is2pbHCM8RTLA+xU1FiWoLtsOEnnbhs2oM4HRysUzb2ODP5UZyoOf6+7WUCPcpXtE5KfOrvNHCYRJFs9ptdzKi70SKK+MC2qVt3o6fWo6DggKrcposF1l6jMKzceyjnztitv7b33aRg5BxNarc3JJEsJK/jm4rb3SdGX14pq4XmSucM0SxzRVzgk0mQ0DwjSgZm0bZxJBQlCxRkbccABZE3Zsgn/2GtCa7H5RfQUyIu28O4uOse1r6zoPeLQ8mtrU0svghl5Tzi1FXqw6XYjMw3KMpwzlAoFBNSBPjzanzQ9rQ6wIwarEusmGzLMU61jbyqAsC1yjvh1qr+d5iK3uJ9hnCvGeW1l0WCN/FZlGBqcaEs6PUjxgbqwXxcrdFZJ13NzV3TdfFKMCdY5Qdww80sG8XIHCVgjpjdoUlwUCDERisS41Nav47dETzPz1yjeo8sVam+4P/DPTRorE2thg5VTJKaAecIKTx6iTBpf0Rkq75U4Uqzb2zKg7pafeBl8nb8iUJziVzeC1Mb4rAYAHX6yPRWGB6h1XaKzXtvXwP+KLkpmoGiDpH1XGZTdmR1uE4lP21olA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bbmxjx1RljeS3SgSpAsjNu9z4biqaAPGzn+s/3UPJViukL1ycA92xgIFfsA3X/BYiabc5GhzWMbuxSg3Q65aVRel6yPeyTo0abonydK5YRHeDL5Zq3i7BKaLnd5Qr6ktk/RSH9iCcjbYDWenB0HtdEtlR/W560S7J0l1XROaA33gRx9GFgFnbtWxFEXWzUzqbLN7UMkQO4PdHL/TKhhMGS7UrGagnADcKtQnVcO1VBd4J6pI/XVZpIsSHNNRZBXCogr8+rdGnYjVNI0ZTpfcFR/ceuvaiI4pke196mcxEXg4gJLbs3EnYUz7HU/rEMsHUjmtpKhDx7aVuneRbqZh0jRqQBqAactPK7dyQfTINcjknWJMQLl3SLEvAT3AtG+OtsoeBd9y4LVlhGpOCnz5fg9f0477ybiev3ArLhbysnThYn/v0caCkgWBUrG2RuhQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:52:21.1141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b1057a-b997-43d7-23d0-08de792c1776
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4935
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:52:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17193

On March  3, 2026 thus sayeth Moteen Shah:
> Add instructions to load initramfs image and update the boot command
> to use the image to boot the linux kernel.
> 

I'm not sure it's wise of us to split the U-Boot scripting like this. 
Depending on which virtual/bootloader is selected could change the names 
and paths of these functions. (mainline vs ti-u-boot-2024.04)

We can move all the scripts here in uEnv (or in the script node inside 
the fitImage for SE boards) or stuff them all in U-Boot but adding a 
hard dependency between the like this will be unfun to support.

> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> index 0af0eef3..5ac61b34 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/uEnv.txt
> @@ -7,3 +7,18 @@
>  #       default on all newer U-Boot images.  This also means that some
>  #       variables such as bootdelay cannot be changed by this file since
>  #       it is not evaluated until the bootcmd is run.
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

Oops :)

~Bryan

