Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F3EC982CD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:06:27 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8114.1768575979681653696
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 07:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IT8YsnBE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.57, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOPF/Xg45wGPwYsHHvvGyI9rtMigrEOP062d841cuE/1/LS84acwBlrywW6WyLpbdLes6x5iF/qI4X3x6qMHtl+fCnkyIX5iPKQCNKAcBbHmYPe5n96QRwHL8hwsmPyTgp045MzoH8bDLLylpA/KzZlSnGEQTG2mEm8LL3XN2Me35sVwZRAweU57Z5eJkp5gCfGX1tTGPzovNFTfpM3WHuyTN5Of+0YYNb4ghnn+4780CFyG8kXK3PZqsz8pj1O1huPQhcHMQADluMSAd/PbA2Bv6VL/cdlunzEyhmKIsTekyyswVlfMMMKEJ3RXWZCQCRVf9JJX1wM6iDj2d+kshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IYQj269zh6Uu3WdTrdM8OcxyiJS7SgQaxDUpidrQoA=;
 b=tgYlZIek/TozsnTRpBCA8t99TfFJxWs8tBCeK37APLl089YUwRzuv/kZLTf0dMn2mIBwmtdy4EKJKwYMb2KMrS3jdR5JtcoLtEnBdVss+iKxGD6dbK7F1aHrMY9q+amQ1nLVaiOGiq+3emLK3QiDv92ugaM7UBwSyq9vo6l79afSKGwUSZ1S+pi7JLbLG+hk/ln+d3zWrMEwFNMtMuv6RTC7UzW0WQIZbCxeQZMd/H8blIJBw2QBn/NLsXo4/1cUbvtDZJnCsuefC/4Xcl/s3qqR0YuVoPp8SR8zMv2AB93sASTvqo9x1S2674WzgTkl1HtQfnZiBEL8Vjg4A0jMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IYQj269zh6Uu3WdTrdM8OcxyiJS7SgQaxDUpidrQoA=;
 b=IT8YsnBEL7DgBY+LAR+oFdV0byl0D+Wb4APPzIVpqrZP/FUUWgn0Yo8eTeRLK6n8GRq1+XCKibEqDtwFen4nJx1c2MsSupJyDp7wfpAU6V6zx5hGLC0X9gDlwalKXJzJl9th6uI/OLwzHRW0D0dnwsg32xJZKDHzYVPr/ij1+g0=
Received: from MN0P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::23)
 by CO1PR10MB4452.namprd10.prod.outlook.com (2603:10b6:303:6e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 15:06:17 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::3b) by MN0P222CA0020.outlook.office365.com
 (2603:10b6:208:531::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Fri,
 16 Jan 2026 15:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 15:06:16 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 09:06:15 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 09:06:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 09:06:15 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GF6EZU3316376;
	Fri, 16 Jan 2026 09:06:14 -0600
Message-ID: <73826b7c-05d8-4117-bcc2-574046bd95e2@ti.com>
Date: Fri, 16 Jan 2026 09:06:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/2] meson: Add patch to fix Qt6
 private header detection for cross-compilation
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20260116143722.2135247-1-j-sahu@ti.com>
 <20260116143722.2135247-2-j-sahu@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260116143722.2135247-2-j-sahu@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CO1PR10MB4452:EE_
X-MS-Office365-Filtering-Correlation-Id: d203c27d-ccab-490b-cc67-08de5510cc76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0x1Y2xwZFpRUStIV1QxTHlHSFlQUFJUOGlNWWFKYXUzZ01pejVpeEZwa0FB?=
 =?utf-8?B?MHpBVnllaHhMZVlveVhGOVVXeGkzeWtLL1Rvdjc0aEg0N1pRaExuQXcyQlov?=
 =?utf-8?B?eFpGRTE2bzhMd3FWN2EzamRSMlNYZGhIUzR2RGp5Mm52dmREb29zczkrZ1My?=
 =?utf-8?B?WDVGOVNqaDE0anUzWXU2cy9pSXNONlAyeXhZVXZGUHdPSTJNeWRSVWg5Yzlk?=
 =?utf-8?B?cHI4c2VoaVZJZFJiYVB5TDB3RCtmSzl4dTZZNGNYalI5ZTJxdGNielk3MU5o?=
 =?utf-8?B?MXd3Yml0MzhEekpITVMwWjkyNlpiSEltS0tCNlpueDhyWVY4ZmYxRU9tS3NW?=
 =?utf-8?B?eVQvQThEdXplZytHNFRBSmRvQjRjdEhqd3JOazBNTTIyWjAzSUhVZ2dMSEo3?=
 =?utf-8?B?T1ZHUWJiVlJKRUtpTnhBZGduamtuNkZlbzBHL2l1cStMamNpWkxMT1U2U0JF?=
 =?utf-8?B?VitOcUFNb1lmRStaVWR6VGlvMkdKSzRSM0lHeTZyTHlPdUtBaHJMMG85OGZ6?=
 =?utf-8?B?bzNONGNnc3Y2RktjUkd0Z0VDZ3VCcno3eGY1bU02RHBSK2N3Tlc0L2dUTjJV?=
 =?utf-8?B?NVFmVzN2azFISnFOYXVSclUybFRHWm1VUWNMSmp0bWtXS2prc1p3czArdUNT?=
 =?utf-8?B?TzlmUEJuMGZCaGk4TVV6OU5NMVg3cndQWDRlbENWczlQOHNPQU1tQTFuYjln?=
 =?utf-8?B?andSWUsvb1lmSzBjRGc0RGxSc1BaTmtxZmhrL0YzamtBQVRzWWQyUitJaDA3?=
 =?utf-8?B?Nk1jTWYyajh5RHpSLzVPZlRhVFYxci9rNC9COGR4azd2L2syMVdyVE1LNEto?=
 =?utf-8?B?SVFPMStUQ0hLWHlkRTFyN3ZCVE9ZTTBmejdBekJYeFAwbXk5SGRHalIzVGJm?=
 =?utf-8?B?bTlWdDlnZ1EycGxvQ0tHbVZ6TlZaU1kvZ2pCdlpDSjlRMDhoQkUwbk9GRkxW?=
 =?utf-8?B?ZUlqaVNqeXJvanpaUis5NVQvVzdiWEo2WWdTRk9BQ1NZS0xuelFUVENCb0xE?=
 =?utf-8?B?cWVGR1dvb01ndVR6Q2RneUlSdlFtTmUvbnlTVnRkVTNjMW9oU0RZK0IyVmNt?=
 =?utf-8?B?UVR4Q0FuYWRNVnpyVXVreGc2SEhybGNNcWF6TStrb3RPSVFacW1oa3lqc1d6?=
 =?utf-8?B?OHdWWi9qSDVTUkwxKzArMDNKbENQSVJkak5qUmRNSDVLQ0pMZkl6R1kxYkRu?=
 =?utf-8?B?V1hXZVR2bmkvM2wvSXVRNHBDeWpDWmFrS0NoQVpLNm5uL2RWUlViRUdYSGNm?=
 =?utf-8?B?ZVRDZUE3ZXVQVlAvaGhpTFdlaDM2VU82SkVkTnA5VmlZdUhXdFAxMTkwb201?=
 =?utf-8?B?Y1l1cFY5d0tNckk5WEVnMHJqVGVxVzFndkE2d3NXZFlybUVheFhZVlVsZzB2?=
 =?utf-8?B?bXFIR0h4ZDlRUHlxajFmUVArLzlpSEJlTWhZTHBva0ZJRXdoS2dpbWR4MkJ0?=
 =?utf-8?B?SWpDaHFoSkdVWC9Ealh3VFhLemhZQ2toVzQ2YzVOOFZVNTJJQ0paUGZldkFG?=
 =?utf-8?B?eVlLTy9yeGdYL0UvcG1ZTFZuNTFGeTlORkI3TmlZOG8rVTlMREpqM2d6UkNx?=
 =?utf-8?B?UDc5a296SHIrM1cvYXovTGdGT3Y2dkplWkhUZFJxSG9OUEc5S0pvWVFqWHJ1?=
 =?utf-8?B?QXR6cko1TUxnT2RJT1ExRkZ2bUhMMVZLdmV2bjZpUEk4bmtTY1FTeGJoSCs0?=
 =?utf-8?B?bXdtMSs4UWkxN0JxRXdvblNuNlBXY2tTQlhMazdKSWhFRG85VHp6endMOEFZ?=
 =?utf-8?B?b0FiTW1UQU1uZnR4NjVRUDdQSGRsYjlMc0JiQTI2bFVuQjVMb3U3QjU1WFNU?=
 =?utf-8?B?eU10a3V6cDVJOFZ3RE9oUTdBOE5KeXBGekkrSStTUG1MVERmYVRHV01Tbzht?=
 =?utf-8?B?K3J6L0pvdW44aThYNUZQRDRuWEZhbUtENklxSjJ0ekF4cUNqNFRsZjhFaGJ1?=
 =?utf-8?B?M2gyMnZONWJUZTZMaXNBVmdRY281VC9MNjZObWlFVDQwM0MxNVRud00rUXo1?=
 =?utf-8?B?YzhpenE5YUtTcUJXTEdxU21tZjB5Q1IzYVpuQjNtS3hZbEtqYkZheGpIYkRQ?=
 =?utf-8?B?bGY0STV5T1U4c1Z2YkdVWldQc2ljOHI0VXJobnlKR1kxeDVnbXJSRThLRUF2?=
 =?utf-8?B?SmkreUR3eGQ5a2YrQ3FSU1drd1JoRlRoejJqUVcwa0NzbERrVkFxTFZSMnVR?=
 =?utf-8?B?dnFGNTd0NnNmUm1hcDhvNVc1WFgzSkNkKzd4ditRUWFkQWs1ZHB6cUlZT29l?=
 =?utf-8?B?UkdrNkp1cG8vdzVJMy9nMGRIQWVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:06:16.9099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d203c27d-ccab-490b-cc67-08de5510cc76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4452
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 15:06:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16971



On 1/16/2026 8:37 AM, Telukula Jeevan Kumar Sahu wrote:
> GStreamer commit 6efccf0ee18a[0] introduced dependency on Qt private headers
> for building Qt6 qmlgl plugins. This exposed a bug in meson's Qt dependency
> detection where it checks the build host filesystem instead of the sysroot
> for private header paths.
> 
> Add patch to fix meson's inability to check Qt private header paths in the
> sysroot during cross-compilation that sets PKG_CONFIG_SYSROOT_DIR and prepends
> sysroot to Qt private header paths.
> 
> [0]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6efccf0ee18a3cf7f426a5acceaa716e7c41f5dd
> 
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>   .../recipes-devtools/meson/meson-qt6.inc      |  5 ++
>   ...respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch | 72 +++++++++++++++++++
>   .../recipes-devtools/meson/meson_%.bbappend   |  4 ++
>   3 files changed, 81 insertions(+)
>   create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson-qt6.inc
>   create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
>   create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson_%.bbappend
> 
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson-qt6.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson-qt6.inc
> new file mode 100644
> index 00000000..4a6cd19b
> --- /dev/null
> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson-qt6.inc

Same as the other patch, change -qt6 to -arago to follow the convention.


> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/meson:"
> +
> +SRC_URI:append = " \
> +    file://0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch \
> +"
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
> new file mode 100644
> index 00000000..ff14dc1c
> --- /dev/null
> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
> @@ -0,0 +1,72 @@
> +From 39f0e9c9b620b4289da61422022e507144a681b0 Mon Sep 17 00:00:00 2001
> +From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> +Date: Fri, 9 Jan 2026 17:44:57 +0530
> +Subject: [PATCH] qt: respect PKG_CONFIG_SYSROOT_DIR for cross-compilation
> +
> +When cross-compiling with Yocto/OpenEmbedded, pkg-config returns paths
> +without the sysroot prefix (e.g., /usr/include/QtCore), but the actual
> +files are in the recipe-sysroot. The _qt_get_private_includes() function
> +checks the host filesystem instead of the sysroot for Qt private headers.
> +
> +This patch adds PKG_CONFIG_SYSROOT_DIR support to prepend sysroot when
> +checking directory existence and when returning paths. Changes only
> +activate when PKG_CONFIG_SYSROOT_DIR is set, preserving native builds.
> +
> +Also fixes dirname assignment to use full path instead of basename.
> +
> +Related issue: https://github.com/mesonbuild/meson/issues/15456
> +
> +Upstream-Status: Inappropriate [Yocto-specific sysroot handling]
> +
> +Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> +---
> + mesonbuild/dependencies/qt.py | 21 ++++++++++++++++-----
> + 1 file changed, 16 insertions(+), 5 deletions(-)
> +
> +diff --git a/mesonbuild/dependencies/qt.py b/mesonbuild/dependencies/qt.py
> +index c245e5c..a3846ec 100644
> +--- a/mesonbuild/dependencies/qt.py
> ++++ b/mesonbuild/dependencies/qt.py
> +@@ -42,16 +42,24 @@ def _qt_get_private_includes(mod_inc_dir: str, module: str, mod_version: str) ->
> +     if int(mod_version.split('.')[0]) < 5:
> +         return []
> +
> ++    # Respect PKG_CONFIG_SYSROOT_DIR for cross-compilation
> ++    sysroot = os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
> +     private_dir = os.path.join(mod_inc_dir, mod_version)
> +     # fallback, let's try to find a directory with the latest version
> +-    if os.path.isdir(mod_inc_dir) and not os.path.exists(private_dir):
> +-        dirs = [filename for filename in os.listdir(mod_inc_dir)
> +-                if os.path.isdir(os.path.join(mod_inc_dir, filename))]
> ++    # Check in sysroot for cross-compilation
> ++    check_mod_inc = os.path.join(sysroot, mod_inc_dir.lstrip('/')) if sysroot else mod_inc_dir
> ++    check_private = os.path.join(sysroot, private_dir.lstrip('/')) if sysroot else private_dir
> ++    if os.path.isdir(check_mod_inc) and not os.path.exists(check_private):
> ++        dirs = [filename for filename in os.listdir(check_mod_inc)
> ++                if os.path.isdir(os.path.join(check_mod_inc, filename))]
> +
> +         for dirname in sorted(dirs, reverse=True):
> +             if len(dirname.split('.')) == 3:
> +-                private_dir = dirname
> ++                private_dir = os.path.join(mod_inc_dir, dirname)
> +                 break
> ++    # Prepend sysroot to returned paths for cross-compilation
> ++    if sysroot and not private_dir.startswith(sysroot):
> ++        private_dir = os.path.join(sysroot, private_dir.lstrip('/'))
> +     return [private_dir, Path(private_dir, f'Qt{module}').as_posix()]
> +
> +
> +@@ -192,7 +200,10 @@ class QtPkgConfigDependency(_QtBase, PkgConfigDependency, metaclass=abc.ABCMeta)
> +             if self.private_headers:
> +                 qt_inc_dir = mod.get_variable(pkgconfig='includedir')
> +                 mod_private_dir = os.path.join(qt_inc_dir, 'Qt' + m)
> +-                if not os.path.isdir(mod_private_dir):
> ++                # Check in sysroot for cross-compilation
> ++                sysroot = os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
> ++                check_dir = os.path.join(sysroot, mod_private_dir.lstrip('/')) if sysroot else mod_private_dir
> ++                if not os.path.isdir(check_dir):
> +                     # At least some versions of homebrew don't seem to set this
> +                     # up correctly. /usr/local/opt/qt/include/Qt + m_name is a
> +                     # symlink to /usr/local/opt/qt/include, but the pkg-config
> +--
> +2.34.1
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson_%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson_%.bbappend
> new file mode 100644
> index 00000000..1512fdf6
> --- /dev/null
> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson_%.bbappend
> @@ -0,0 +1,4 @@
> +MESON_QT6 = ""
> +MESON_QT6:arago = "meson-qt6.inc"

Same as the other patch, change _QT6 to _ARAGO to follow the convention.

> +
> +require ${MESON_QT6}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

