Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135F3CD041E
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:23:44 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77221.1767651814725078107
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bZrP5Wp8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt+R1tk8zyAGxfTU94T2PiyVRKYJjA9a5znDmnJNnc6AfIKWGlVJYEnSsMO26BvBmCA3SCdoeNREJwkqgd3p7Jv7m3EGS1rzO75S4kxdLLkbV6AZQxeL81dOYJFqZeAxvf2yNbsrdflmH0s6YT/pDPsO20xWphgblN43Z2IB4dDsOUeO0HNdH8kfcv6K8iEksp7now94DRz95QWZFM5GCVJHJHK+e8duweE8Arl8wzrRJs2JYCsLUm69pa9AswlgVz4c23h4Tl1GKUADQwI4dpLulaQLUhGhCgumC1wpmOR68re/FsGf3C7IaP4vlRevN9fpIJT9R0UNEcVLd7i00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kkj0TE+UGTOji5UO6qvxOfGJj4TQ8gmyh+EixKSNZ9s=;
 b=KN3Vn3M93f1bqOUGbZPi5vVjM6HhK5Hk+2qnqBMOmRTAQkg3zsI8IHAGvy3d9ai9QUkmPir2lk0jKZ5SN9on3G03wXruo7/ffjw/5s8LlqR52FrGACT2s/PzagffG4q13tweRHSWD456k8BoEsGH/fsCBuu4Mf49McpDzBnIunnItzZ3WHG6MgVAg1EIo9YiFJvNyeSi/o2+aVdorJkTQWtcpiu2dkpXe8b8CPEmpKnXbWGzGoCU+nrpGBdadRGvLWDEZvLRAH/BWvIs6zk0UyoPSNfhY+ciS0PRrTX++VrruMzxKnbfgK75IPIYs43cx84g2ZyG6s3JYjgcywrHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kkj0TE+UGTOji5UO6qvxOfGJj4TQ8gmyh+EixKSNZ9s=;
 b=bZrP5Wp8c9byeS8g6Nh3MOq7dwfUZZvquTmX8rGAf0ntsda9ZMArgvBPmrTHmle0jVlken2LbKB1OL83YEmxBWv7olZsSgLgVsXprbIFLV65T33ZeL+9SRbRrjMy3hX9Y95pRPaWJbXkHKtGcK0+VnQ0JG0ZSL0IH7MtnhhRArM=
Received: from CH5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:1f1::8)
 by CO6PR10MB5540.namprd10.prod.outlook.com (2603:10b6:303:137::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:23:31 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::9d) by CH5PR03CA0022.outlook.office365.com
 (2603:10b6:610:1f1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:23:31 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:23:26 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:23:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:23:26 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MNQHr1866676;
	Mon, 5 Jan 2026 16:23:26 -0600
Message-ID: <58492a2d-1cfb-4289-ba1a-f86939d54b36@ti.com>
Date: Mon, 5 Jan 2026 16:23:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon
 scripts to meta-arago-test
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105221926.2503358-1-afd@ti.com>
 <20260105221926.2503358-2-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260105221926.2503358-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CO6PR10MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: b37460ea-3890-4c7a-89b1-08de4ca90e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVI2cWJGd2NNTDVWbW5EL0FTREdjYU04SURDaXNkN1laTXRZK0krcEhUUC83?=
 =?utf-8?B?R0dsYXg4U0M4MFdYRFEwM2pBYUgwQ2lpbCtvendhZ044NGZhVW1NSC9IdGlz?=
 =?utf-8?B?aUYrM0FLYk9DWGNQWGVIdWdPOThYcWFaSm80d1FVVmhEMlhNdGF1Y1RXRGdw?=
 =?utf-8?B?bTNMdGNTdVZXelozaE1YNnUwNm9yWnY4R0ZFNmI1cFZuNmhackhQYlRmbjZF?=
 =?utf-8?B?a2xnZGhFcVpsa2tYak8yRkVJN1NFK0ZyNS9BdXZJN1B3TXlFNzAxUGozRys1?=
 =?utf-8?B?ZFNaWjRrcHlmQzB1S0ZEekJ1eS9nR1ovUkgzbmpDS1c2TXhuWElZZklnQzBS?=
 =?utf-8?B?cnFmT0JRbytuM2VoeGd6VUVqa09HVVQ4WFpGVFJFNm5LM0Z2Y2ZrQWtyUGln?=
 =?utf-8?B?eEM2ellxdjBkeEtlNVlYR0VmbjBmOEVTVjVRdDRLNXVqZ09hWXpZOXhCZlRO?=
 =?utf-8?B?WVNvQ21zNmJEazh5c25IVFBOTE84Y01uWkVocmN5OUVnVW9GMlFnZjlsZ1RC?=
 =?utf-8?B?Zk1nVENyeUdsdDZqUmNGUUxpSzQ0V205enRNV0tEVXpnemdCcXc5WUxYd2h2?=
 =?utf-8?B?cENPY2pKcGpGNzRGS0RvUnU1MDEzR1VGWmRxdjVEaDZRcnZaTU53WlRoM2Vy?=
 =?utf-8?B?TUJlK3JyRk1neTJ2TkNHNnUvQS9BNlk0SmNKb3QzZmhjMUFTbWl4dFpremFK?=
 =?utf-8?B?Ky9DY2ZJQ3hVcFJjcHRuVFUvTjQ4ZExHc2tGNWIweFJJekRrbm1rSkdxS0F6?=
 =?utf-8?B?MVBJMnM4RitkQzRITkpsS3FibHFQMHFFTHpVZkM5amRlWmJrNlJ3RS9FaFRx?=
 =?utf-8?B?cUJHTXJkZm9PeEpORUZiTXdUREdPSkdtUHJlRDJCaFNXWmE3djJHVEY1WXBJ?=
 =?utf-8?B?eGN6dE1SYWozdDFnTy8rK2M5eGlmYkFCVVA2cUt1Y2ZOUnpMODdZTXFEemkx?=
 =?utf-8?B?U1ZaYXNwY0RYNGU1L1d6cVhmT2JKNGJobE1NSG9CbS9aZ1Z0TzdCbG1UMk02?=
 =?utf-8?B?aU5qZW04cVJ6aC9XUTl0bnQ0dXYyQ2hCelU4QVlZK2YzMEFMbEJMRXlhMEh1?=
 =?utf-8?B?TndOSndtZHpkUFI2czh0dFpxVDZIQ01PMkxkQTZNN1ltcXJsVHVnSjlCSi9x?=
 =?utf-8?B?U0RLOU1JejJ3eXF2cGI3bStxWjNReGVmMFlGbWxRVWx0N3hXY2dFczlBOWdV?=
 =?utf-8?B?WjVIdHArcUZjcE0wcEw1RzJXZnRWbitRRVl4OWZRaW9zVTZoRWNIS1Q4MGJZ?=
 =?utf-8?B?SlZ3cVlLNUpWdDdrcHBzNDk5QTBYQXptSFZlUS9QbU1RckkwdWFRTDBzQ1hL?=
 =?utf-8?B?N0NIbGIrd2MwNmd5VHMrNUhnbThPRGtiUXdIT3FiTFphZXJnSXdvS01ZaHdZ?=
 =?utf-8?B?YkJsOEZ1Zk1oQUJWREhxZWxsV3IrS1NrRTYxdVZJTWc2NGk2N2ZlcjNGTGtY?=
 =?utf-8?B?Wjc4TDZvRzEwZW9INDdDMG43ajdZSlljRi9uajZYRDM1Z1ZiSy9Bb0wwZGJM?=
 =?utf-8?B?NnRxZUZkRHEyL0p1Q0FGUzRZajR0aFQvd0xJSno0VWV4ZHQ1RldhZjJWVk54?=
 =?utf-8?B?VXkzMDM3RmpJa3ZRQlpWTTNXMHJZaFhNNmlZeFlRMGNyZEM1RkJGaDBBK1hC?=
 =?utf-8?B?RG10Y0o0YlpvNHhxV2ozZWhRRlNxV0tHLzlVUmY2Q3FhL2FJN01YR21ZTDY2?=
 =?utf-8?B?N0x0UHVjYTljMnJBd0RSdFJnYWU5Y1BIKzNrT0hzNFFaSzZhQ3NuU2tYbW42?=
 =?utf-8?B?d3FpMUlVbmhDSDJJUHcxaUYzQlNFTUlRUkJLd0tYUkk1QmdvTEhaWU9WY3FG?=
 =?utf-8?B?OE4yazNiV0RnM0RkTzYxNVdNSkZXUTArekg4L01iUDJaRzJTektGYi9tWDJQ?=
 =?utf-8?B?YkZYWm9xdVgzdWxLTjAwV0lWVkY0RE9MY0JkbjZ6bzFjR3RuWC9aN2czNjNl?=
 =?utf-8?B?NU9jdmY4Rk9lMzZaTnRWU3d2cUt2c2pNYlpQNGMrUUxFWnJrNWllemw2a3pB?=
 =?utf-8?B?d0FvRWY4ZDNKT0VPdkw0am5sSXVUeEFCVjBtS1RrcXIyU2ZNa2t5M1ZUMHIw?=
 =?utf-8?B?bW10QWNsRHdRcTVwbGhqSkhUc0svZFIycm8vWFZaWjIwNVNCTDUwY1h4N3pu?=
 =?utf-8?Q?xG34=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:23:31.0673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b37460ea-3890-4c7a-89b1-08de4ca90e99
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5540
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16926


This one may not work.  This assumes that you have ti-test intstalled 
(which not all images do).  And without ti-test in the image, then you 
cannot telnet to the board during test.


On 1/5/2026 4:19 PM, Andrew Davis wrote:
> These are only used (and only ever should be used) in testing images.
> Move these out of the base distro images and only into images including
> the ti-test packagegroup. Move the recipes themselves also over to
> meta-arago-test.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   check_yocto_rules.json                                        | 4 ++--
>   .../recipes-core/packagegroups/packagegroup-arago-base.bb     | 2 --
>   .../initscript-telnetd/initscript-telnetd.bb                  | 0
>   .../initscript-telnetd/initscript-telnetd/telnetd             | 0
>   .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb   | 0
>   .../systemd-telnetd/systemd-telnetd/telnetd.service           | 0
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb         | 2 ++
>   7 files changed, 4 insertions(+), 4 deletions(-)
>   rename {meta-arago-distro => meta-arago-test}/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb (100%)
>   rename {meta-arago-distro => meta-arago-test}/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service (100%)
> 
> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
> index 7b3e20db..26275421 100644
> --- a/check_yocto_rules.json
> +++ b/check_yocto_rules.json
> @@ -27,8 +27,6 @@
>       "PV-1" :{
>           "skip_files" : [
>               "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb",
> -            "meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb",
> -            "meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb",
>               "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb",
>               "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb",
>               "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb",
> @@ -38,6 +36,8 @@
>               "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb",
>               "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb",
>               "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb"
> +            "meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb",
> +            "meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb",
>           ]
>       }
>   }
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index b80697e5..d36b4397 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -16,8 +16,6 @@ ARAGO_BASE = "\
>       mtd-utils \
>       mtd-utils-ubifs \
>       curl \
> -    initscript-telnetd \
> -    systemd-telnetd \
>       ethtool \
>       bash \
>       opkg-bash-completion \
> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> rename to meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd b/meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> similarity index 100%
> rename from meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> rename to meta-arago-test/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
> similarity index 100%
> rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
> rename to meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
> diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service b/meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service
> similarity index 100%
> rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service
> rename to meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-telnetd/telnetd.service
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 22957218..ebac81c2 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -22,6 +22,7 @@ TI_TEST_BASE = "\
>       hwspinlocktest \
>       hdparm \
>       i2c-tools \
> +    initscript-telnetd \
>       iozone3 \
>       iproute2-tc \
>       iproute2-devlink \
> @@ -57,6 +58,7 @@ TI_TEST_BASE = "\
>       stress \
>       stress-ng \
>       strongswan \
> +    systemd-telnetd \
>       tcpdump \
>       v4l-utils \
>       xdp-tools-arago \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

