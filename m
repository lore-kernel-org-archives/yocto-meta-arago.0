Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61404FC619B
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:19:26 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63153.1769152763525644810
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 23:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Y9eldlJN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.54, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNznit0DIHhWH70UGNis9N91OtGXIishNDdklfNk/dysbl2HR3OGXExK0wdx1eUC+rrlfBpL68coFkDOcbcwtGxyub4XDpo43yWHSG/rD/piTyep9qNZ2aHppsSL7gVuXfM++d//CqGVkFBYmdOb9Hbg6raL82eON5ICuJkq2aspYZ3N8oHzHrWTEiitW47cCPtTcGUm0OCsZrX1EJuhwCkgi2PntfIKFFB48JLJXKcpPouJ6D+OgWkSN9Jmx5ZBHEIX+jmNo9rJahIXqPwLMYqfF8SKHZDkIVjjYV6F8iZD+BlWwunJh1rZZmewqCIb/BzaURJPuze7S4ddLw3Ymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK5YdosD1lq4je1yEjUsZn6Lz4ZnuFU3WGXGV6d2mH8=;
 b=t4VX086D6WPamA1c+NXNjIuv7lahtvRQbcHULbJy1L5pfcbmfDjc4O59BGgDqNAk7jYN5egI6mJg99RC+tvIML0ch09TdJ7n6nxJ8Wpks+e0ytYE1aU+3l3JPYhivoPtpGaD7JF3DWajP51tcbjWZRkDqnNgqDZ77g7JvSzPcLwABkC90NZLXg26N45P7BI9hMkfX4N496l1BL4BPeysSECI1TraSGktpJMxTjTASD4/ljAZHDp1qyJG/LoDOWYBP+nVIlR6K1i6+yinkOuM1lj7CEGsICfdkqFfxYHIMdkrcJ2K5btYpGQkB+q3afIkAuxDIafKlnbzV9hLZkDhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK5YdosD1lq4je1yEjUsZn6Lz4ZnuFU3WGXGV6d2mH8=;
 b=Y9eldlJNBCuDvCHo9xmzz/mUOckqQR4JdnEhExAHghcL1YBzTgula2zoIaXXK4rsyIfoWYHGBm2KRYLSqJ//LdYf8lh8J4NScpFfCLC9sPJLx7bJfJrPvqgnNBHVR/uSNmdz82geaYjV6R9sDDuBLWFKh9sVBClwvcmX0Q8HEW0=
Received: from DS7PR06CA0043.namprd06.prod.outlook.com (2603:10b6:8:54::25) by
 PH0PR10MB4743.namprd10.prod.outlook.com (2603:10b6:510:3e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 07:19:20 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::b1) by DS7PR06CA0043.outlook.office365.com
 (2603:10b6:8:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 07:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 07:19:18 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:19:18 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:19:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:19:17 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N7JGri1935658;
	Fri, 23 Jan 2026 01:19:17 -0600
Date: Fri, 23 Jan 2026 12:49:16 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<afd@ti.com>, <devarsht@ti.com>
Subject: Re: [meta-arago] [scarthgap][RFC PATCH 3/3] tisdk-default-image: Add
 audio server support for am62dxx
Message-ID: <20260123071916.rmk6qveuttbnqfpj@yogi-work-pc>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123060348.2493115-4-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|PH0PR10MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: 660342b4-b130-4971-67eb-08de5a4fb902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fA+s+8MjCUTVGSjqXMzRgjVAhPPmYunCdRG2ljI+2gUT77QlO1xHso+WMip2?=
 =?us-ascii?Q?kzQjCnYnsR6tpBFhAoTzeFwolFMwJ3YfZKtnBHUqImnrST8hfEViU9op6nvH?=
 =?us-ascii?Q?NCSQ+r2KszU5i8rlz6tbTqAjrMJI5n5kr98tYvJTZW2RRl8BETwNYrGVkNq+?=
 =?us-ascii?Q?anapc4pYoGzLoTN565hiz7moLYhoFkRYSnQWrWb25x2FUzGErEqMzp4YNTON?=
 =?us-ascii?Q?37jACHPHTqJqGJeTsd4ACkG7ihkckC9V3TxvbAzv6wYDMLphkwing1MntkfF?=
 =?us-ascii?Q?L0G2rgZTnBfih7jcUWg4qM/UVNRUndemu0VknwIgyzeeFWI7XG/EJkqDDUP3?=
 =?us-ascii?Q?85tozAMAY3Hd/hHglPW/yg7ZRMVUdDDueXXlacKzJhiSQ/8Ven8w+SMPG7DR?=
 =?us-ascii?Q?l2uq2l7XpD+UJ0bMN/RAa4wsyrECVp5WwOnq0NxcNFaqh+KL6vm7ZvftsCNm?=
 =?us-ascii?Q?LLSry9mUGflNdt0QsoBVVLXVRnnCJ1U73ASNlS5Bzbg3U5Ces8eBQ1KwL4Qc?=
 =?us-ascii?Q?/XMTa8fgXRCCd1py9CTWwPWytxiwA+FC1gpnx501b78ljj5U5n4zMTFqA+Zy?=
 =?us-ascii?Q?4X0LkpEGPuxQ25soGjiYOllS4grsEhNeTrH9gu5WA6B2lhKXxifxGqPSOCru?=
 =?us-ascii?Q?N5jkGK5Rt1+mqmRTWObQW8w9ugwvJd1z2p2lckdAXrMbjwPSnBqwdeglUHhp?=
 =?us-ascii?Q?0B5oXyWvJSwnes1rzxV98g+xGy535/ncDce/jFYwRX/kQ61Paa4N2wQ13I3W?=
 =?us-ascii?Q?ZrWk7B+9K5oADvuQ9k0xRAXw5QtC84omIvDsOXdgD/+XN7nIinF/srI2gLLo?=
 =?us-ascii?Q?lN4CeviQukAph/GOTb27HYzLWNgmVjRky76OWFxLbDB6Qrk2NzS/C1s7PAl2?=
 =?us-ascii?Q?Gal9UPtNXf1JWEjlcomg+h1yOCJFszC9AYmfZd3dfq0/WtCMDMMZB2H3GFIW?=
 =?us-ascii?Q?iN5cpxdQHLEWelBhBhfiKUFWeCx0fcL87US3h0iUZ9ChzLz4TDtF/fcrIHrP?=
 =?us-ascii?Q?E5ige9km8oy7cMDmnSSCoyfTdeeaa7CuDZo9EUlP7/Hyfjes34LHV1xmNcTZ?=
 =?us-ascii?Q?+QDTxxYvha1Mt5R+XptfNS4RNKVHrz59qaJLdBkt2F1youhGW5N09lJp5ro5?=
 =?us-ascii?Q?3dbZb+E8xgXGXscepGX1VFQZAZxGzXATbLPX3EPktmgxo2JUc60uHY3ok//P?=
 =?us-ascii?Q?NfeiINWZg9CIbUM4X+bRqiDUpal95TksQT8/jAf5u3k6VpLi1lyiFnzn7/ZX?=
 =?us-ascii?Q?1VH2Yodfd1LG7x40oxu7buISpFUbPOwKxM9bVCdTtOkG0m0PSsF4VwV7rXvV?=
 =?us-ascii?Q?USXi8lFGnsl7cCt9p993iuRIzGd8HQg1WmzJslRXJJkAKeGHs1BH3ePWBIMw?=
 =?us-ascii?Q?LTVrotfLReS7mrUJ7FrGfReHFob4QgZsbM6iHzzFUDKj16A2Q+uVk6ElIwy8?=
 =?us-ascii?Q?FZT/8x+MBE0uvc0btb6e2TUSiOPkwy32DEV6jmWZeosdbcHWvnvZPPNRaLZS?=
 =?us-ascii?Q?Oa+XW2G8uX5MeKVKU1kJQezYu/ACRWE4Kb9FspG95FOemnJyb5hpcMkPTgP4?=
 =?us-ascii?Q?nOYEldNDaE2BxScuvcw144mp4ksc7lnHKMkURPaA4D8nTf6nDXHQNh/mwGV3?=
 =?us-ascii?Q?rA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:19:18.5093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 660342b4-b130-4971-67eb-08de5a4fb902
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4743
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 07:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17027

Hi Paresh, 

On 11:33-20260123, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add pipewire and wireplumber audio stack support for am62dxx:
> - Include pipewire core components and tools
> - Add ALSA and PulseAudio compatibility layers
> - Include wireplumber session manager
> - Add GStreamer pipewire plugin
> - Configure pipewire with proper modules and plugins
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---

Thanks for your patch!

>  .../recipes-core/images/tisdk-default-image.bb  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 264d1b2d..d5db6fd4 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -47,3 +47,20 @@ IMAGE_INSTALL += "\
>      ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>      docker \
>  "
> +
> +IMAGE_INSTALL:append:am62dxx = " \
> +    pipewire \
> +    pipewire-tools \
> +    pipewire-alsa \
> +    pipewire-pulse \
> +    wireplumber \
> +    speexdsp \
> +    libpipewire \
> +    pipewire-spa-plugins-meta \
> +    pipewire-spa-tools \
> +    pipewire-modules-meta \
> +    pipewire-alsa-card-profile \
> +    gstreamer1.0-pipewire \
> +"
> +PACKAGECONFIG:append:am62dxx:pn-pipewire = " pipewire-jack pipewire-modules pipewire-spa-plugins"
> +PACKAGECONFIG:remove:am62dxx:pn-pipewire = " jack"

As per yocto docs [0], `pn-pipewire` would not work inside an image
recipe. I suggest dropping PACKAGECONFIG lines, Instead put the
PACKAGECONFIG lines in `pipewire_%.bbappend`

```
PACKAGECONFIG:append:am62dxx = " pipewire-jack pipewire-modules pipewire-spa-plugins"
PACKAGECONFIG:remove:am62dxx = " jack"
```

[0]: https://docs.yoctoproject.org/ref-manual/variables.html#term-OVERRIDES

Regards, 
- Yogesh 

