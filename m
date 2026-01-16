Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400F0C982CB
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:03:17 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8026.1768575786894374258
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 07:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pt/E8FEd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.51, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfT1vsDYrO4ms4irnv5L7oNCLdURuQDeolmg+7/6hBJiRG2IdMsMM2YJ2AiMwApH/S04AbGijbJCcetOI6/rencaERvIv7KBDEZqrT+O4+TsOT2kZlIpLVPETFsxRfNzyNaFKxbmpRHYKZauWDip1kyV1yB6ZWxyalJXlk/qbrhpeFH5XdfppsW+VP+8EYA8XFosywjy7IBBS93/Jz6i6f9PtnNh5FYy+Ch5oQBl4Lxz6uEQRmWb/6y2SBbKQERFUegbSueBwZg/EJ/ZU6ixYJZzZNFhBQqG06617FJY71dkmrq+YsxMu0DIqgqvG+6fEc0QqT8qdmPNWjovlwZyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPGoo0HstkL9htHdu86oTdAyKgjo0ILo2DbpjjZQPPY=;
 b=NuQHz0EJrtiARoaYzq+3urB6Q7a3i2b5/s+pGhnH+J6cGgf1f1BUwuxErSIqNHIX85Gk26l+lHPfY4lr9gb+6RM5K4LkTohvLCSatGja4wcuEcG+5xf6EcilAZ9Ofmqq/AwKVDFZ3n3ri0GP/RJf0zy3tQQC020fU72QYV8qDH//Q3pySd1t0no4At5bRaFbnCOEvAzyumq8TL1ivfyTVy/hRp3rDeb1d0Fx8Yb8cF0B+D/71GxcgY7UPkTWpkIzjZ6dO4M0Q3e/8jfCGntM+trW+k64jJkjWwGdlAItuw7pLLjJOnbbzl9IPwvIiVXYwp3Vva8R+tLbkGTknVaUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPGoo0HstkL9htHdu86oTdAyKgjo0ILo2DbpjjZQPPY=;
 b=pt/E8FEdyVZFj54OcDXyK+4K1RE4fRmqjTAdlblL+KQ8BzyToJyPA0PBfpGLcLzwFuBspXcDxPH/r3rtXtaeCzolj7ZZAIJfI7IzTKr6EcqZuWpmQHDi9yZOQT6ay2ZdftTj9faXN8f0cwT4HdcyySWFPbpXN+TJLcaS9/XFu0c=
Received: from SJ0PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:33f::21)
 by BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 15:03:04 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9b) by SJ0PR05CA0046.outlook.office365.com
 (2603:10b6:a03:33f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 15:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 15:03:03 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 09:02:37 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 09:02:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 09:02:36 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GF2a8b3447265;
	Fri, 16 Jan 2026 09:02:36 -0600
Message-ID: <54dde48a-60f6-4572-accb-67e43561efdc@ti.com>
Date: Fri, 16 Jan 2026 09:02:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add
 QT6 PACKAGECONFIG support
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20260116143722.2135247-1-j-sahu@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260116143722.2135247-1-j-sahu@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|BL4PR10MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: e63379a5-8579-42d4-5e3e-08de55105903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|34020700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?azNocmZNdVRlbVZMd0ovbTAxdDlXeWlid2VBSm4wdVNMampsMHNrTDU3Tkx3?=
 =?utf-8?B?bzJTSGwwOXR2Tytlb2VaclpPUWhQTjFnNkZBaXBsS0hpVEU2Ump6UEpscUJk?=
 =?utf-8?B?Qm9zTGpHL3dGdUl5c2Q0UDhBeEp3dnNESHdCb0UwaUN0VVh3TXovRW9ZcTE2?=
 =?utf-8?B?OXNseEQrcmpReWdDU0JjeFdadXVVVWhPQy90enpxNnFjNWhMd25BZHVVcjN2?=
 =?utf-8?B?VDlCOUplQU9rUGtJNFZWYUxlb1ZlKzdQRUZTQk9wRGMwWkY3OGJneVZvZjE5?=
 =?utf-8?B?UlBrMWU4dUR1bVVlQW1oOHZOS0NQUG1QcU9Za3J6cGlxRk9tL2YxQ1J1NnN4?=
 =?utf-8?B?Q1JrNUpwU3F6WGVYYjNMUU16bjBCN3BaRHB2dU9wUjNBNlZQR3hMZUxvY2Fh?=
 =?utf-8?B?V1JIa1RheGhEeDBxVFJBQWhnSWF3WU1SUVNCNlVrNWt1UEc5bDQxWE1zZm45?=
 =?utf-8?B?WTBkRjB5RnpTaFlXTGtDaUhQWXlkZzlHZFV1MGswanNnaWNHbFMwOWV3RnM5?=
 =?utf-8?B?U3BKZkFaNFkrMXFJU3VUQ3VxMDk2NkhGckNEb3F0ckJpbXBYSmUrTzJqV3ps?=
 =?utf-8?B?UmZqTUNxTDFodTFNMldNZnJQSlNmVWxGem5WdExjNUpHc0pNaUdiN1J0RVAz?=
 =?utf-8?B?WWoxdnRHUFByTnZSQlY3cFJRQ0FlclFNT3NsMnRvRDF0enNzeElQYngxbjVF?=
 =?utf-8?B?VWJGdkZGR0U0MWN6Wi9qTnJoNjdrNEdvYm5HZnhjUzJvckFPV3dSeHJhWGhl?=
 =?utf-8?B?enNwQklkUFFKbHcxK3YrSGhkQjBrUE8rK2EycEJXQU5sR1c1SkJMb25pTlI0?=
 =?utf-8?B?NEJIVEErNXpJTURJejNKMlB0UENlQ2JaRnZkQk4zTE1XK3JJQXgyOWMvRUZH?=
 =?utf-8?B?a0JSR01HTjEza3NvcmZVUzI0clBWdTNHc2V3ejJkbnZQdmVPaU5OZlNreG1h?=
 =?utf-8?B?eFZsQng3N3RjWlRpZURJK1NUeFhYUGdxSGozN3VMKzMzaHJpcXRCek1YS0pT?=
 =?utf-8?B?SlBhTDh0K0svU2VJZHhGdU5QMEoxTFdGakY5YytIczE4YS9JelRmTTYyVHhP?=
 =?utf-8?B?b29uOFdRWSticXpuMjROWW4wbVRMVHF1cDQ5ZzRqWVpCUTNtVGVnVUd4SS9v?=
 =?utf-8?B?bGpLM0pvRzhUVG0yMlFOYWE0UE5WS0h0RmZ2MkprOVBkYUlkUi9CK25kbzZa?=
 =?utf-8?B?UUhzNUZXUmZQcW5HZFJiQllQUWgxOWNDdU9lUThiSGxueUpBelhUSlFLL0Zp?=
 =?utf-8?B?VUQ3TXg3WXJWWXByWHhtelpzZGFHQXMrV2JXSVBnOU4wTVA3Zng4S1ZkV1dh?=
 =?utf-8?B?aGl1WGZBK2pjcHdvemk0ZjdMQmdJbk02U2hyeTdubkNWeGF0LzNFajlxZzE4?=
 =?utf-8?B?a3A1T21LbHR3ZWNBLzQ4TE9LeWFpc3c0ditVYTVSWXRmam1ZbDNPTkEyeDVj?=
 =?utf-8?B?UnU5NlJhakZvd0M2OGdkdGJJSWxJTzBJNE1ObXE4TndNaWNXVnhmOXBYT1px?=
 =?utf-8?B?YnZZTjFRWit5dkVOYzVFQjF2UjNEWE13QzdXeXhGalJZTTYyWUVpdCtPUWdy?=
 =?utf-8?B?MWlmY0lxZmJuY25rdnk0Zno4ZEZSSjRNdll6cU1EdTlpTlBwL2o5ZFJBOC84?=
 =?utf-8?B?eFlvbUxKOGxRZ1Btb3RnK0NpYmdzS2lZanlBNG1kdUY4T0JVRjBwRDI4RXVt?=
 =?utf-8?B?NVc4eUNBVXZ6WFoyNGhGYmttYllNczQzSzUwTzdPQWNvKysvT0gzaHBRRWtQ?=
 =?utf-8?B?RGpQVEJaVFZHT3FvRUJnaXZlcGl4dDE1WkZ5bkhtU2wyWjFOU0ZNdHhyMlNN?=
 =?utf-8?B?YnI3M2RZMHNXaW12MWFYMFZBQitZUzBWUm92VGZ0VUhRMUFaQngzR3FjVm1q?=
 =?utf-8?B?dkJPN1hHQUdoKzNuR21yQmxFMGkxelowRW9BMUt3VkFpMlM3ZHhpMDR3VXFx?=
 =?utf-8?B?VnJQZVY5QXJmRE1sSTVVYm8ydHlCSnQ0SzdJR0N6MjFnRTlMbjRtUGhVeVA1?=
 =?utf-8?B?bUxYZm9RT09xWW5ud0RnNW45a3B1TTJXZ3FCeFJsL29VZ09OQzhIdW5veU94?=
 =?utf-8?B?eThDOUR4Q1g3S2NlNnpicERJcWQwd0IrNmI1UVFRMEl3TlBxMkdXNFByTmRO?=
 =?utf-8?B?d1djTUxqcGUrYVRjZ3pLeklrTTZnaS9hR0hEWjFwOURYMjRxQk1rcnVndytC?=
 =?utf-8?B?a0lKb2MrYUFTVlBISDZDeitoRWY2dEpnOFhtWmk3SHZDdE1QbXQrNFJBdi8r?=
 =?utf-8?B?cGRXUWsybVhXWHZRcUhTSFlscVVBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(34020700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:03:03.3084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e63379a5-8579-42d4-5e3e-08de55105903
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR10MB8229
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 15:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16969



On 1/16/2026 8:37 AM, Telukula Jeevan Kumar Sahu wrote:
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

The -qt6 is not needed in the filename.  The guard just needs to be to 
the name of the recipe being appended.  That way if you need to add more 
later we aren't creating multiple .inc files.


> @@ -0,0 +1,11 @@
> +PACKAGECONFIG:append = " qt6"
> +
> +QT6WAYLANDDEPENDS = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
> +
> +PACKAGECONFIG[qt6] = "-Dqt6=enabled, -Dqt6=disabled, qtbase qtbase-native qtdeclarative qttools-native ${QT6WAYLANDDEPENDS}"
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

Same here, the _QT6 in the variable is not needed.


> +
> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

