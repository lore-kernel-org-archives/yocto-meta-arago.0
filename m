Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E0DCD4853
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 22:06:03 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9725.1762985157876310993
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 14:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=SN69MNek;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJVsU/d8XT/L0+niXwD7oEOXdWzaPaDo+waSTWLgauzC4KJuWMHObN4cxPSiCTVWv35C4Gvpg/NavNyakd9MtYkbqVbt2ucSAnVKcdCcfJ/Dij+sur62JRwIbBdid88S9VjouY97ZNTAerLssMcTHxi4+uTaB1ifl1SSn9ha8pJqNw0HHKr+jvLgiJh/5QOaIP8ySrJ9DzN7iE6A4Bdaut3qmQ4JzH+g7lWEhsFLLuBNeM7N0/T64l6J6dkXYuedNHN6W6avVQJv/tyhMSA4MQGBmm63a6gHdZuL4C4j/umj/HAkV6cBv+B8ZRlk136uUq0HMIWI4RvaviH8TW8m3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rb/7SgxE/ppfzwzY2FJNQpOXlepbPK/G8jNgRz93jsE=;
 b=yozLwQnKrWyupkizq+JP3yKgYtPJX/cWO59+p6wEMz9m2pJjQnHOVhgJTAYJkgGVHMaTLrzxxPiT8rYgprAtz96gaia52DObeidR3Rz/11PcWxYAvp9AtuGmpxj+Y0bq2MAMc2gGSEjVxnjelGcaTuFSxoxwIlR1CCmMyZGFIoJhQhaXMU2APS76P5sBEe3FZLqqfdQk9sFaST4cwtOeZIcazvoUZv64wz1YJqhO7TIJ5l39mNbqIOvZSwRqUJLXALdRfm2+OIz0Aw7tXu0C4SW4HwVLSkt5JA87w79mI0036Ph0pYn9iehU4HlKlCl77n48t1d/UZjAQ42CL+zGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rb/7SgxE/ppfzwzY2FJNQpOXlepbPK/G8jNgRz93jsE=;
 b=SN69MNeklquu+7O68j0N2MAtcIZ2CeKyEFnqH7BINjg2nYq71vj2Mi8mw+DXblIFpqXGH4wnw9jx0UCQ/lE4XVpIDY43miAb8cN4R2VJyqxOUdDxYqBM9fy6wic51MULmDLppgPBVpyt/ZqEKpv0FfQBY+8OWv3XACXObGnWcic=
Received: from MN2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:208:239::10)
 by CO1PR10MB4547.namprd10.prod.outlook.com (2603:10b6:303:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 22:05:50 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::5) by MN2PR08CA0005.outlook.office365.com
 (2603:10b6:208:239::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 22:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 22:05:49 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 16:05:46 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 16:05:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 16:05:45 -0600
Received: from [10.249.34.12] ([10.249.34.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACM5j5n3371567;
	Wed, 12 Nov 2025 16:05:45 -0600
Message-ID: <ffca3dab-129d-4ad3-8ec8-3276bee0a3cc@ti.com>
Date: Wed, 12 Nov 2025 16:05:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] udev-aragoconf: aggregate generic
 udev rules
To: <rs@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20251108011752.3782760-1-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251108011752.3782760-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|CO1PR10MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 073e3f55-e8df-45f5-93de-08de2237a3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WW40T1N2WlZpZU9wOFNqdVdGbEJBcjRUS3hTTWNQUm1oN0xHUHN4aTVCU3NJ?=
 =?utf-8?B?Nkt2WURHRTRzK29UQk42UVJQbWk1SVlEaTFwVDAxQWlVd1hTVjFxQXJLcE05?=
 =?utf-8?B?bERQWG91bkpyM0RwZmJWUzNvVzVHK0xyeU5JTXNSYXI2NlR1VWMxZnNjbHY2?=
 =?utf-8?B?VEM3cEIyMXlsQ3JIdkdvU3FmVFhYN0psVGNSUUVQUG4wOEsreTN4Rkp1VDNK?=
 =?utf-8?B?Sk1wNElrNG1XWjUwdklxTFhFYy85ZWt1ZExhMmFtc1paOGc4ak9HblFoYjVX?=
 =?utf-8?B?eExNc3FyWTdCY2RCUXVNQ3RPY0xvNWg2QkRsUnVZUTJlYmJFK24rTW1xS1E1?=
 =?utf-8?B?OTZFTExpUFdOZTlWUHdLeDB2czdFOUJSUHQwbUhlYWdXOTlrSmdCNGw3YytL?=
 =?utf-8?B?NG9UNnRGZWppNkllMzJOaGdOVU9JMGhyRGNTZ1NBbE16T0JJRmZBb09KZVl0?=
 =?utf-8?B?bU10eHpPTDgwYkkrTkhtempmYStCWm44NjFkbkU0d0tkdUhVc1I1OFgxbTFw?=
 =?utf-8?B?QndWTDl1N25UcWdlUHFNd29HQjduYmhOOVNkOFlENlBQL0tJaXBqZytOdFo2?=
 =?utf-8?B?Lzlab25JdXhDdllROVIzbzY4UGhXWUozdHJ4TXJiTStwdHc4dUNyRWEwZnor?=
 =?utf-8?B?eE1SWXRBSW90VXpmekhJNlFOeXhMSkp5TzNBN0JkMTVVeU1sTVZDSE1WRlNn?=
 =?utf-8?B?ZTN1N1Z4WGR5Z2k1ZWdUamJuL016V1V3REV1VkQ1b2dDM2pycFVZZEg2bFRC?=
 =?utf-8?B?UHJpdVQxa0wwQjNud0h2dm9PWjhFcjhYbnUweW1QdTZoMXBFSFlJNzFieGJY?=
 =?utf-8?B?TjJaV0VzZFoycTVnMjVTQ2QxMDd6OE5ETTVOOVpiZWZYV3oweFVENnl0ZDIx?=
 =?utf-8?B?cnVQTEZxd0JVa3lFeFNLZzhMQ3dkQmxrdWNERHpleFBtajJyYWlFY3pMWjVL?=
 =?utf-8?B?T2dnOWg5K29oc0gzNFFvRHRNQjBlVmJyNzk3TmVPRmFWeERFS0pzQ09pZ1l5?=
 =?utf-8?B?TkhhdGVGTWtPZ1BTMkNsbUM5MHpReGVrSUl6SWVqNXRQbVNYOUYwbFk4Rjgx?=
 =?utf-8?B?NjNCQWtJQmtlVkNMYzl5YVBaTWRmaklXTVkzR1l2REF2M0wvc1NGSm9jTXZO?=
 =?utf-8?B?Q2JFRU90MDlHTlh2THFoU2R6UUtxKzBtdkZqeGxMWGFuWVRqdDBpQXZ0cElY?=
 =?utf-8?B?Z3h6eVF3UWsrYzN0eENlVG5WZTI3YXl3a0NaM3hPYW1GUEdQVGh0dDk5SXhY?=
 =?utf-8?B?SEphak9IbDAwZGw5cEpYcmRyZk1WUWg1a2lZSUI1aWY5bndyM1MwTE1NY1k1?=
 =?utf-8?B?SFNZZFpCbjBxZnEzRC9IT2VldWxPaDBkRlBlaHZsMlc0QTlGY0VaNmExc1Y3?=
 =?utf-8?B?eXNSVFRCeFlzNWJXSlNWMVpjb0ljWnViQnl4QlJkSkJwTkFwYWxxOWE5bm5a?=
 =?utf-8?B?VDVMeEM1SkRrUzVIaEo4YUV1Z3dTc2dpME9rNWxmQlhDL29hNFhkVDVTV3Nr?=
 =?utf-8?B?N0RHTjUwQkRYVHFpRTJyUFBIM05SaUpXVWZjR1Zvc3V2anVJcVJMSDRIYkZn?=
 =?utf-8?B?VHljUnVsc3JZWWtoeTVyNGJHR0Ixbi9WR21DWlQvZnArMk5KcGI3K0c2d0w1?=
 =?utf-8?B?UUdXcUFaNGl5MUVIdnZYT2o2YWMwbURMWDkrVkRlSGc4MnpKZTRGU2pQYmhR?=
 =?utf-8?B?djkybTdLWVFPTXYyV1JzTitJVGxSSWVnTS9rdGx2bVpobHkwbTRTZmIyVCtr?=
 =?utf-8?B?ZjZTcmtkNDd6M0JZVlE1alErZ21zRTMrR2dGcGtBcUVNZ1BNUDl4WUhWeCt0?=
 =?utf-8?B?ZVNkN2x4MllQWE5JQXVycElMUlhscmdKRXVZamppaG1FaVdtQktDTCtKbHdV?=
 =?utf-8?B?ck50QVFIZUs5bjVLcFZsekNJeHcyeWcvVUtjTS85QklMd3dabWs1bjY4WDdB?=
 =?utf-8?B?dU1GYlArM1dIcjBhZmNvUGlSL0k5dGxwZWd2TFEwQjRrbVpoTHFXSXcrdTR2?=
 =?utf-8?B?NUdPUmJQSm5ka1plbm00b09QeUcySkpLdnJTMi95VEpSRUtxWVdyWUZ5T0Iv?=
 =?utf-8?B?Z0M3QmR2d3lzTTJ5czgraDV5bHV2aGN3ZCszdnozc0FJRksxQXZubm1jeDha?=
 =?utf-8?Q?dDJU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 22:05:49.7345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 073e3f55-e8df-45f5-93de-08de2237a3b8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4547
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 22:06:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16747


Should there be a master series for this same change?


On 11/7/2025 7:17 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> These udev rules are specific to TI platforms and should not be
> appending to the main systemd or eudev package. Split them into a
> separate udev-aragoconf package to reduce duplication and cut down on
> appended content.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-base.bb  |  1 +
>   .../recipes-core/systemd/systemd-arago.inc    | 27 ----------------
>   .../systemd/systemd/usb1-rules.sh             |  3 --
>   .../systemd/systemd/usb2-rules.sh             |  3 --
>   .../recipes-core/udev/eudev-arago.inc         | 22 -------------
>   .../udev/eudev/dra7xx/udev-cache.default      |  5 ---
>   .../udev/eudev/keystone/udev-cache.default    |  5 ---
>   .../recipes-core/udev/eudev/local.rules       | 26 ---------------
>   .../recipes-core/udev/eudev_%.bbappend        |  4 ---
>   .../udev-aragoconf}/37-can-am62.rules         |  0
>   .../udev-aragoconf}/37-can-dra7.rules         |  0
>   .../udev-aragoconf}/37-can-j7.rules           |  0
>   .../udev-aragoconf}/37-can-ti33x.rules        |  0
>   .../udev-aragoconf/50-arago.rules}            |  0
>   .../{eudev => udev-aragoconf}/usb1-rules.sh   |  0
>   .../{eudev => udev-aragoconf}/usb2-rules.sh   |  0
>   .../recipes-core/udev/udev-aragoconf_1.bb     | 32 +++++++++++++++++++
>   17 files changed, 33 insertions(+), 95 deletions(-)
>   delete mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
>   delete mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev-arago.inc
>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default
>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev/local.rules
>   delete mode 100644 meta-arago-distro/recipes-core/udev/eudev_%.bbappend
>   rename meta-arago-distro/recipes-core/{systemd/systemd => udev/udev-aragoconf}/37-can-am62.rules (100%)
>   rename meta-arago-distro/recipes-core/{systemd/systemd => udev/udev-aragoconf}/37-can-dra7.rules (100%)
>   rename meta-arago-distro/recipes-core/{systemd/systemd => udev/udev-aragoconf}/37-can-j7.rules (100%)
>   rename meta-arago-distro/recipes-core/{systemd/systemd => udev/udev-aragoconf}/37-can-ti33x.rules (100%)
>   rename meta-arago-distro/recipes-core/{systemd/systemd/local.rules => udev/udev-aragoconf/50-arago.rules} (100%)
>   rename meta-arago-distro/recipes-core/udev/{eudev => udev-aragoconf}/usb1-rules.sh (100%)
>   rename meta-arago-distro/recipes-core/udev/{eudev => udev-aragoconf}/usb2-rules.sh (100%)
>   create mode 100644 meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 5cb4e30c..e27a9ca2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -22,6 +22,7 @@ ARAGO_BASE = "\
>       bash \
>       opkg-bash-completion \
>       udev-extraconf \
> +    udev-aragoconf \
>       libgpiod \
>       libgpiod-tools \
>   "
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
> index 44889345..0aac3c7b 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
> +++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
> @@ -3,28 +3,14 @@ PR:append = ".arago7"
>   FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"
>   
>   SRC_URI:append = " \
> -    file://local.rules \
> -    file://usb1-rules.sh \
> -    file://usb2-rules.sh \
>       file://10-eth.network \
>       file://15-eth.network \
>       file://30-wlan.network \
>       file://60-usb.network \
>       file://timesyncd.conf \
> -    file://37-can-j7.rules \
> -    file://37-can-am62.rules \
> -    file://37-can-dra7.rules \
> -    file://37-can-ti33x.rules \
>   "
>   
>   do_install:append() {
> -    install -d ${D}${sysconfdir}/udev/rules.d/
> -    install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
> -
> -    install -d ${D}${sysconfdir}/udev/scripts/
> -    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/
> -    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/
> -
>       install -d ${D}${sysconfdir}/systemd/network/
>       install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
>       install -m 0644 ${WORKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
> @@ -41,17 +27,4 @@ do_install:append() {
>   
>       install -d ${D}${sysconfdir}/systemd/
>       install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
> -
> -    install -d ${D}${libdir}/udev/rules.d
> -    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
> -    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
> -    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
> -    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
>   }
> -
> -FILES:udev += " \
> -    ${libdir}/udev/rules.d/37-can-j7.rules \
> -    ${libdir}/udev/rules.d/37-can-am62.rules \
> -    ${libdir}/udev/rules.d/37-can-dra7.rules \
> -    ${libdir}/udev/rules.d/37-can-ti33x.rules \
> -"
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh b/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
> deleted file mode 100755
> index 68e83511..00000000
> --- a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -/sbin/modprobe g_ncm -r
> -/sbin/modprobe g_ncm
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh b/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
> deleted file mode 100755
> index 97071264..00000000
> --- a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -/sbin/modprobe g_zero -r
> -/sbin/modprobe g_zero
> diff --git a/meta-arago-distro/recipes-core/udev/eudev-arago.inc b/meta-arago-distro/recipes-core/udev/eudev-arago.inc
> deleted file mode 100644
> index b0c44b17..00000000
> --- a/meta-arago-distro/recipes-core/udev/eudev-arago.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# This fixes an issue with touchscreens not being detected with the default
> -# local.rules.  This can be removed when this change is picked up and
> -# meta-arago switches to Dora
> -
> -# look for files in this layer first
> -FILESEXTRAPATHS:prepend := "${THISDIR}/eudev:"
> -
> -PR:append = ".arago5"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -SRC_URI:append = " \
> -                  file://usb1-rules.sh \
> -                  file://usb2-rules.sh"
> -
> -do_install:append() {
> -    install -d ${D}/${bindir}
> -
> -    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
> -    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
> -    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
> -}
> diff --git a/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default b/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
> deleted file mode 100644
> index b1aa63f8..00000000
> --- a/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Default for /etc/init.d/udev
> -
> -# Comment this out to disable device cache
> -#DEVCACHE="/etc/dev.tar"
> -PROBE_PLATFORM_BUS="yes"
> diff --git a/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default b/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default
> deleted file mode 100644
> index b1aa63f8..00000000
> --- a/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Default for /etc/init.d/udev
> -
> -# Comment this out to disable device cache
> -#DEVCACHE="/etc/dev.tar"
> -PROBE_PLATFORM_BUS="yes"
> diff --git a/meta-arago-distro/recipes-core/udev/eudev/local.rules b/meta-arago-distro/recipes-core/udev/eudev/local.rules
> deleted file mode 100644
> index f14352d5..00000000
> --- a/meta-arago-distro/recipes-core/udev/eudev/local.rules
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -# There are a number of modifiers that are allowed to be used in some
> -# of the different fields. They provide the following subsitutions:
> -#
> -# %n the "kernel number" of the device.
> -#    For example, 'sda3' has a "kernel number" of '3'
> -# %e the smallest number for that name which does not matches an existing node
> -# %k the kernel name for the device
> -# %M the kernel major number for the device
> -# %m the kernel minor number for the device
> -# %b the bus id for the device
> -# %c the string returned by the PROGRAM
> -# %s{filename} the content of a sysfs attribute
> -# %% the '%' char itself
> -#
> -
> -# Try and modprobe for drivers for new hardware
> -ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
> -
> -# Create a symlink to any touchscreen input device
> -SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
> -
> -# Auto-mount any SD cards
> -ACTION=="add", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
> -ACTION=="remove", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
> -ACTION=="add", DEVPATH=="/devices/44000000\.ocp/48880000\.omap_dwc3_1/48890000\.usb/udc*", RUN+="/usr/bin/usb1-rules.sh"
> -ACTION=="add", DEVPATH=="/devices/44000000\.ocp/488c0000\.omap_dwc3_2/488d0000\.usb/udc*", RUN+="/usr/bin/usb2-rules.sh"
> diff --git a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
> deleted file mode 100644
> index 51afb053..00000000
> --- a/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -EUDEV_ARAGO = ""
> -EUDEV_ARAGO:arago = "eudev-arago.inc"
> -
> -require ${EUDEV_ARAGO}
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-am62.rules
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-dra7.rules
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-j7.rules
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/systemd/systemd/37-can-ti33x.rules
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
> similarity index 100%
> rename from meta-arago-distro/recipes-core/systemd/systemd/local.rules
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
> diff --git a/meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh b/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/usb1-rules.sh
> diff --git a/meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh b/meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
> similarity index 100%
> rename from meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh
> rename to meta-arago-distro/recipes-core/udev/udev-aragoconf/usb2-rules.sh
> diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
> new file mode 100644
> index 00000000..c1ffa663
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Udev rules for assorted TI SoCs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +inherit bin_package
> +
> +SRC_URI = " \
> +    file://usb1-rules.sh \
> +    file://usb2-rules.sh \
> +    file://50-arago.rules \
> +    file://37-can-j7.rules \
> +    file://37-can-am62.rules \
> +    file://37-can-dra7.rules \
> +    file://37-can-ti33x.rules \
> +"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}${sysconfdir}/udev/scripts
> +    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${sysconfdir}/udev/scripts/usb1-rules.sh
> +    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${sysconfdir}/udev/scripts/usb2-rules.sh
> +
> +    install -d ${D}${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
> +}
> +
> +RDEPENDS:${PN} = "udev udev-extraconf"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

