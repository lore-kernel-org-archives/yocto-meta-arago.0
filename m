Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96318FD45E8
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:04:45 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54170.1772049877792725784
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=myOeZ37y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABZwDHn1d7DCzQRBpdPRxWAYlxb+sqYL0TYLlWDMaGqs/xSeab5E62CpfsMLmyTFy4xLbmrDSllDFR/MsCGp93ZBENJEagKYzCiKcKegwDRAIV9VjbbRRd1zWoN9FBPACeNWj+OkTzROIy0h5xPTWGRar6sUvDJ6U3bukjIl9zkS/jVPMZd2SYkrPaCUUBY1GaCqJbRs5iLthWLxd2FsCKeinfEIaMmiOp2LC0CvCMiQpN+wXg0Otv0nRAr0VKGxkqjjmjp4HJ0q4rTHGNATFkTLNyE+c/zyRuSHAlqZQJs+6SmxizVa7/AqJZwDm4UsEWEHq6jFvECv55cEp/KAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4lB1waEMgFFhBeoJ6q8wpTjvBLOElLUnEYqz4/GdwU=;
 b=aTtzYDZ1fjM8m01SNjBzUg+4bKqFqbkh3Lk5dcYIWHPjXxWop9AhSNLgK1nC8KI2Ly/2gIA/zf+EYoHueslL7MtUiBqxcffgf3E8q1b7MdVCLS/sIfthQJw02akmGddwvMR1pEH8C8JA56ZIz6wmRxB8Csb6XIN3KN5hfgAkVs+wVGjA5hMCOMXiYwOEmBOe1kzM2c2N/ZM+QwNQPgUMJjXdjp34Qlhz3dknvR07BqUuvcjk4PEviZQjsT7w///JR2dHlm6SWxXvJOOEc3YYSDOkL0WuOxP5v3NR2eySGv/9/wvTog7Zgh9R6eFZ5fab8Li7HctPfQbCNb5cbEIVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4lB1waEMgFFhBeoJ6q8wpTjvBLOElLUnEYqz4/GdwU=;
 b=myOeZ37yUrNIFbfeiFxioB5tPKNp9lgNl8a4+ivVWKnrgXppGVAK3VPDwwWAeSgKWD1ijU7v8CHJ6WV+bPnDghOZde+muiRRhDi+GQi5TXck0J8d8AQfqvNr6hY2K7u3mgbRgq+N5ycQRq+iEF87kaK4uNlkDLoxeku/o7vmZEk=
Received: from DM6PR01CA0004.prod.exchangelabs.com (2603:10b6:5:296::9) by
 SN4PR10MB5559.namprd10.prod.outlook.com (2603:10b6:806:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 20:04:33 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::e9) by DM6PR01CA0004.outlook.office365.com
 (2603:10b6:5:296::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 20:04:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:04:31 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:04:30 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:04:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 14:04:30 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PK4U2F557041;
	Wed, 25 Feb 2026 14:04:30 -0600
Message-ID: <60f134bd-9981-4c2d-ae95-e35c9a5bd5d0@ti.com>
Date: Wed, 25 Feb 2026 14:04:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] ti-test: Add Required Multimedia
 Packages to ti-test
To: Brandon Brnich <b-brnich@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Darren Etheridge <detheridge@ti.com>
References: <20260225190339.3295692-1-b-brnich@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260225190339.3295692-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SN4PR10MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7f6c04-d5f6-4d1e-4cfa-08de74a91734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34070700014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	n1KTSbrRyDOhAhsBN6md9mx9xPav0sYOxh9PPuNc1HDiH+8Lu9f1gEEj2/XWGQ+kzRpwUbx5Sc17kSdrvFUgDDo2QB4I9R14f81n9hwyoTdfl4vWR0DiaHzdclzz/ugwvDTD0KhO2KD3IIrLxgn589cNb86/xMk3g8BoFdiXlquiA5v1Z0ebwXxz5T8fi7Fa0iJAb/S2KLOo+u0BIBB8D0zyKChfoynCBlzhQYuX3yu1EvIUEavY2EHO4VtZjUBRPT2bZGkTmyH/UPmhe5/tfPSLXdWWHGqosyseGqlD9o19xqs21oWekrgI0AP6xVgRgjgLN/cn5ML3V3MuxZWENJjlzmLnGqoskyUI1pjZblXv0Ic2Y5y+4phGHuYQPOCPqB3oAGKS71KfY8e6XFAQp/9RlS9pn9p4solotXpkmhddghXFL2Ugd9uKXAUAcaIlHP2KnE/nS/Fk04eo7tLRniWJKysEf73EDN7MjR2gRJ56iJpCHoL7oU/nopw+Wb2swK5XxE7ZIYShiFqzDKurBhDKsQVHZEYjMhA4wb3Fj0Hcz0WIQiYnsgZrDxfuBD8LFYgPTmBN9xsZOhkl5jDPrwhcJOvG7zXMXkqXQCSnGSEt9XrMRHNHucX21WetSX/xidctTlJvd20GSS1VRgSzeiESU8ZeLzdvjYOlOjOsoXPxuiucoufQz09KeC/rhbLHf+t3sj9qmwZPTW4nRZxbtZKs2pQd8PZtdlEVQNEKEAocEkejUSOa1kO0su72/p5CPOHCMxDLpAaEmEQzpm3ETxlyidvxGW/8Yh6dDaANU42m6evoF7IKtL+wRPV3ujICBU91uJ+kApQasetPaGR7GQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34070700014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YBD7Ypa+EFcps6ca0IkO7G6byd8eyXvpJkiLNjW6m/LLFZqK7kEU/YnUrB5xaJHMabcV2VJksVNc78CsxckEs8DSmPh0AAOBENXMTiy6qKtYEd1DFFmywlkvit6f1nfEX9o/uaNT3Jon8XacLFFJ6wp0zAYH6I/yQfAjiY4HzWiqqMgnpTvgTCS6h83KSaPBe2kGw9YYv+koaruyf32PDF8h3RvCRwKKYoE+xOySFYN+bmw6sKfgiQFgLU8OMYfyYgZQYgNhOz+q/jf314VKXdLWomVnIxmx76w7frjgpkYQSfMltguQ7Q0BbfnlXTHxRMGiPIn3TwkxVObfqR/Tx++WtYaJoB74qkzVbF1OgE3+IgkfwUpxOJiNkDix4F3PDe4brTV7s7/azuXJ9BkkaYfwxHQo4s2IYnt2q/mA/WWKrbYyYTqNBv5kFVALfhZt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:04:31.9747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7f6c04-d5f6-4d1e-4cfa-08de74a91734
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5559
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:04:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17149



On 2/25/2026 1:03 PM, Brandon Brnich wrote:
> FFMPEG and MPV are required during automated testing. Explicitly add
> these to ti-test.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index f2ae1aef..c694545d 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -16,6 +16,7 @@ TI_TEST_BASE = "\
>       dosfstools \
>       ethtool \
>       evtest \
> +    ffmpeg \

This might be a problem... there are licensing issues related to ffmpeg 
that we address in meta-arago-distro, but moving this to meta-arago-test 
(a layer that *should* be able to be stand alone) is going to cause issues.

Denys,

Any ideas on how to address this?


>       fio \
>       git \
>       gst-devtools \
> @@ -36,6 +37,7 @@ TI_TEST_BASE = "\
>       lsof \
>       media-ctl \
>       memtester \
> +    mpv \
>       mstpd \
>       mtd-utils \
>       mtd-utils-ubifs \
> @@ -145,7 +147,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
>   "
>   
>   # Disable due to breakage
> -#    viddec-test-app
> +#    viddec-test-app
>   TI_TEST_TI_TOOLS:append:j721e = " \
>       pru-icss \
>       ufs-utils \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

