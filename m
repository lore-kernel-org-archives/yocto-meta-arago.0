Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41AEC982EC
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:17:16 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3739.1768587428097619263
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 10:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JN8cmSIO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.25, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzfiVClfvVUG2Id1UVFCZhod2oWj4DgRIukQLZdRncz8K6HMV/gw7vlYlxqJZlMxFU7JoYDINeVtCuy0L5sT6SOOLBx928ZKsdt7ZwY8keLw+zSfdQiCGa0JvTCzQCtxEa9ai/JxDrZZyJnPXdEPn49D7UIn9/8KRyTNTjtG17EZEN87VOExiNdHvguxsQ4a8N0ez7vA43lJbr9GO57xrjcVAe5Uf+J8IYDqm2uxyumhndAuIHrW7U3GvuXJyGXHGUXD4+GUsfOBW8Yaod1wn52/7DWZJT+U2Nm+Q8nHRoeUXJHbs+4//39XuUblh44uPo1C6rrHyZ4YYJKfAFWJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKPM/BXV89QhWxf+rKpzdCIj9p69aiN1mGUdsAwJ7aQ=;
 b=eI1QI6BcdcPqw7qGJafUxILa69GdRODlmdY5eMn+EzUUr2KJlTnT4XZ1hWi6A6cgKRtVTDdK0k8CPsPvbfFvGEOtdXD6nCPK+YHqXDzjKwUHuJR080/JDGQck1va1AujGPU4qlE2Q3p0cXgUEPqFfaKo2QTkH+QbD5ZZHSoTC0eucBvDc0u/yHHeJ0lKl88jYur90POECaNAZpbseRfj3fCAKwhmlx2g27axn9EYDHzsxs8gmouwoApgUZ66ak1OsonyfxUzl++FtdoIwqBmXStL+Hh54Nm2/PwNS3yFOsSvsokcx4GxO+DqW8SiIIvK4uS6EH6Ie3ljKVKLGtzaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKPM/BXV89QhWxf+rKpzdCIj9p69aiN1mGUdsAwJ7aQ=;
 b=JN8cmSIOBznRqnnqbdPywq9U5cuiLGeJJv5a/G88jg4tChjrL0U5+qqXtb1/IFwPHS0Pq35YFaziECcduqAgJY91LiHOfpxqWSNyfL07DOb1DvpC+ZF73ZE4coFxKkaJUjCQU6tyTBeNSQrfCbd51IDj/Rpt3ynwSxFyBfT2PHI=
Received: from CH3P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::12)
 by PH7PR10MB6674.namprd10.prod.outlook.com (2603:10b6:510:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 18:17:03 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::48) by CH3P221CA0022.outlook.office365.com
 (2603:10b6:610:1e7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 18:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:17:00 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:16:43 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:16:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 12:16:42 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GIGgNI3553934;
	Fri, 16 Jan 2026 12:16:42 -0600
Message-ID: <c9350640-cf97-4939-b788-63173838cd35@ti.com>
Date: Fri, 16 Jan 2026 12:16:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add
 QT6 PACKAGECONFIG support
To: <j-sahu@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20260116143722.2135247-1-j-sahu@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260116143722.2135247-1-j-sahu@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|PH7PR10MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 93eec779-5397-4840-35bd-08de552b7154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUdWMGQxbGpjN1hNNWttcE1QZEMyUlFWb3RjWFV1ZUo5T0JoRWVpR29MSkRJ?=
 =?utf-8?B?cUNMaGFUc3pDYjl5aGZCTE9HcU5YUURDUkRpRk52T0Zrc3lsbmZJZUdiRFBj?=
 =?utf-8?B?V3kwVmtWa3Rpd2dLbVFwWDU5Ym9nS095NVFXcFllNkJtRnZKelVLcTArNmR5?=
 =?utf-8?B?ZWlzV1lPdHZuQVVUMVZoUHlGMXdRek1SdnlpdGM1bzlLOUxEWHVRMzBQTmQ3?=
 =?utf-8?B?NGJ2MEREZEVzY0Q2QjhXQlV1TlpuUVBlUUxmYTVaN3I4SkZsZXNHMnliRW14?=
 =?utf-8?B?SkdrZndUems5QzNvTjBBUWdLOGE2R3c1WUxPUTFDTnFERW52QXkzWThnbW5h?=
 =?utf-8?B?MmFWU28vZGw2V3dubUphak9oZldCRW9QTkRtakxrcVNsVS9yYVV5Z2N4ZzZa?=
 =?utf-8?B?VVBvYkdZdFl1T1JkR0dOKzcyRnhCVFBoMHQzRlIvL1B1V3pHaERpa1dkdFZy?=
 =?utf-8?B?SmZqZXhEMGJaVDBVTitYaDErQ3ArZ0dGeVZ6bURDSlpGeEUvanVUNXJyM1Jp?=
 =?utf-8?B?ZCtPZlVMclo0OW9FK0tvL2Z3SEp6UkFNZ081aFMwYVZ4TzVBd3g0ODNreTU2?=
 =?utf-8?B?TlJod0wxY09jSFYwcEtIb3RId3V3WmZ6QktVRmpQbEoyRmhmUGUxQzVDTWlv?=
 =?utf-8?B?N3AzZWZLUVUzamJXUi9LQWwvejNCUS9Wc0x1TzRaZEJoZVBaL3F2SEpZSXFQ?=
 =?utf-8?B?Z3V6S3NPZ0p5Kys0YjZDMjQyMDd3SEFYZUNzTW9ENW9kMWllYjZsTjB3Nm1w?=
 =?utf-8?B?ZHQ0a0JBa1o3ZDVzamF2cGNvQkVjNFN1UTZBOWdJc1NEeEFTNlZ1QXVLYVJv?=
 =?utf-8?B?dzc5aFJjMmpUYUcwcVF1eGcreFZtamRzTmxGYVNuZDYrbnByZWpHbmJUUGFm?=
 =?utf-8?B?Tis4L2pxWSsxMTN6ODUvSHdsZ3grRnFlQnRMTGpreW9QZzlBTXJPbWxtcE9X?=
 =?utf-8?B?WC9ZNUFHNVQ4bFl3bm9pbWhzZmNJemowbVgvZVJrcXJxMm1WV2JuUFkxdmZU?=
 =?utf-8?B?MlFMNSs1amw0cisvbEgyVHJzSHZNTmgydFhMWU1lT0lxSzlvM3pqbjl6czQ4?=
 =?utf-8?B?TmVFQjRNNkk4NVVidjNzU2V6U0xqU3JvUmVoWXN2WlFYTXJSZTZpUEJPY0tY?=
 =?utf-8?B?VnRNWUlqa205YjE3dkxZaHdRYko4VlRycE00MnV6N05XT1hYSUdkN29LSm1M?=
 =?utf-8?B?UlA4QUd3OVNlRVlqb1llREpCMnBvMmhPd2J3b2RURnZUT1JJYzdhblhiRVNa?=
 =?utf-8?B?YnFreFVkajdXSUlyejhrWWpZanFQR0xQeFlsaUZaK3dmMjVBUVdZcmFpWktt?=
 =?utf-8?B?UnpSanhwbzhoWllIaDlLbWNmTlNsaThIT2h1Vm11OHVjaHhQZXF3anZmcTd0?=
 =?utf-8?B?K21OdnpzTW5sUXNCRXdsWFhVVk94WHlaVi83MW80cmt1QnVwekpCQlAvRTFM?=
 =?utf-8?B?SjNFVTFWMEY3dzZaUnhWMjR4WjBkREdsOEVUYmx4cjhNdHdYUTFEcFRWWnlO?=
 =?utf-8?B?QVBnR3NMckVoWGs4aUU0a3p2bXhxcUh3V3N4YkFPZ2VPS3VkcER2dFdlMGV1?=
 =?utf-8?B?NEJiZXZKVHlkNmJyeVJUam9GbnNISDFwU3grbDhHdlRxd0NFb3d4NS80N1Z2?=
 =?utf-8?B?TUJRTkgreDVRL1IrN09oWERGNGc5WTl4dEpGREp1dXo0MHljQkpYSU8xMFlC?=
 =?utf-8?B?Nm80ZlZsOHJiMHEvRmx3M3N1NncrbTFCNDBMZ2JlVmI3bkR0RmZxTmxOQVpQ?=
 =?utf-8?B?YWJRdUdFNWhlNFJlcWg0UWliTW9laFZQYkpCRU5PUklMRWZDVncyYUVSOEU4?=
 =?utf-8?B?ZUR2aVpnZmJnTXA5eXQyNHBBSHRJOThEMTByN1l6MGs1N1Jrby90L3RPV25s?=
 =?utf-8?B?c2phQTFId1krVi84Tkc5ZkZlbUhQc0tkRlV5SS9aUlJEdFRBU0pRRk5Mai8y?=
 =?utf-8?B?TW9ySkc1K3N4bWRYRlNWblRieWVXQWhRZngwRUZ0VWJzTFFOd1dzWmV0cGZl?=
 =?utf-8?B?NFN4SnBtT0lHMElDL0hLWW13MGpMWjNjN2d3UXhYWE54WnFMMEJJSDRCT1Fa?=
 =?utf-8?B?cncvSXRDcCtjZ0lIcWFmbTlrUDJFM1RTL2pTRndRZW5kSGV4aWxhVy85Q1hJ?=
 =?utf-8?B?c2lCcXRsOGEyWWFpMmxHR2ZRcEF2VVZBemlDVFY2aEFNeG40eGZ3Sm9UYVNv?=
 =?utf-8?Q?8ARJ+9T4rxxEPqVFoOQ1Qz30L5Ihid7+HYHkqmqrLnGy?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:17:00.5564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93eec779-5397-4840-35bd-08de552b7154
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6674
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 18:17:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16975

On 1/16/26 8:37 AM, Jeevan via lists.yoctoproject.org wrote:
> GStreamer's Qt6 qmlgl plugin enables video rendering in Qt6/QML applications
> by providing GstGLVideoItem QML element. This plugin is essential for
> integrating GStreamer pipelines with Qt6 Quick/QML user interfaces.
> 
> Enable Qt6 PACKAGECONFIG to build the qmlgl plugin when qt6-layer is present
> utilizing dynamic-layer.
> 
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>   meta-arago-extras/conf/layer.conf                     |  4 ++++
>   .../gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc  | 11 +++++++++++
>   .../gstreamer1.0-plugins-good_1.26.%.bbappend         |  4 ++++
>   3 files changed, 19 insertions(+)
>   create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc
>   create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> 
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 3927a913..1a4a5bdd 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -22,3 +22,7 @@ LAYERDEPENDS_meta-arago-extras = " \
>       networking-layer \
>       openembedded-layer \
>   "
> +
> +BBFILES_DYNAMIC += " \
> +    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
> +"
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc
> new file mode 100644
> index 00000000..e30440e1
> --- /dev/null
> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc
> @@ -0,0 +1,11 @@
> +PACKAGECONFIG:append = " qt6"
> +
> +QT6WAYLANDDEPENDS = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
> +
> +PACKAGECONFIG[qt6] = "-Dqt6=enabled, -Dqt6=disabled, qtbase qtbase-native qtdeclarative qttools-native ${QT6WAYLANDDEPENDS}"

This part could be sent upstream to oe-core master.

Andrew

> +
> +# Qt tools like rcc, moc and uic are located in /usr/libexec, instead of
> +# /usr/bin, which is not in PATH by default.
> +do_configure:prepend:class-target() {
> +	export PATH=${STAGING_DIR_NATIVE}${libexecdir}:$PATH
> +}
> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> new file mode 100644
> index 00000000..27426f4d
> --- /dev/null
> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
> @@ -0,0 +1,4 @@
> +GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6 = ""
> +GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6:arago = "gstreamer1.0-plugins-good_1.26-qt6.inc"
> +
> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6}


