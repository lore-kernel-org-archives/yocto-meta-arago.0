Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3627CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:27 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17255.1790784440496110634
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iv4lcPfZ;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=T9TqPdlQ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1X8d3555891
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CAZnhstZJnDshd8D6mFA5UMluMMXgbziyA1LWBq6W
	uY=; b=iv4lcPfZr+wTae/F3iuF1CpbuZpM6j84tmAJ/AgBVfuH2TbJ2Ebt3+LHu
	yVB43PsSsnPTeyFyrUPH38vubVWCiqpn/+h8PuVzMooAJJw94z2c1ZetvjiHVYte
	MQJKsKfWAizlsCGYNnT18KmO6JZ99NJzwfTtb+BizP2EQwXPXeH8OorJ9+7cqdC8
	SMHvFwqFzk9i33lK01eCURCRXD8ZXn0yHihFVx5C1K0JGyh50Noyi/8IxBhlyg4I
	uUgmMLAXy8KJ433XsXWdUZEL1DP9hFhCOoDB2I7adTCD7eJ1qfOIkFyyh5Kt3M5r
	PzkD6o59t61lQinpVLkd6KHvD+7Nw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvacmd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 11:07:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlS8Ifve8wFWuNPcZwgU5FtMZOAKUzOSnGyV3QKfEX05Y2wxVsfaHOt20sHp2ppxO7jzHDPLvUrHKgdNqnUZr/EGQS4mzy5TnMTM+hWuGBsHdAhDwN02th7yF+PIZWUl+Wsm9QJDVqXW8TTj97941GVzyMgrYaknl7IiseaCtvZD/B8GuoUA/kpwMFPn+ZdhhF3VkZmvs05wsuGtfobPRoofMJvK7Re94wYuL2pVEEHX2TUxtRCGHIeW5fDTiZVhu2Yc+eYk0/z/8YXUtbBueGBzqIrZ2FNkizStN0OYWPaDyTU7lSpxeMw0A6z2HmEGQapQL7unRGAqOalDis9vBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAZnhstZJnDshd8D6mFA5UMluMMXgbziyA1LWBq6WuY=;
 b=SfDzAbWXYJqrg5EzrooDn8TrxM8E+howhrF86MKdGjBB2ywi5jkdkcUC66n28Jpu1fZFUQZbnTlFCsBCLoQgtUvgOSbS0duWystnkQoJZRxue+rxvfeHEKmg/7rPox8+pkEIWd3pwzQn2eQejJPpNlrMLooNZf8EN/CtDm7HndYUFzLqbgsHGKPy0+3RUjomf66HCBv6QJHn0WgerGpVIyqngjTlcCFXHYjMFPM+y6uCYsBNUlxxtILBSj8nIfzqqB9MNYe9XdGdJIMObxhlbc9CJ7E8eYIl6BNRz0VHfRAKIBrEitv+FZN6PX/21e8mvLMYPK2dpVxcNe9Ylk+g9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAZnhstZJnDshd8D6mFA5UMluMMXgbziyA1LWBq6WuY=;
 b=T9TqPdlQQVdEnnXyrua9DLYzThoiLO+HuMYCVE7/M2FYJ83vyOUjPmWjHOnnHhZ5a3EOInzYGIlpFrOdTfucV4qfCYb7wnf6ZAmwYrD6GbTSmK6GobzbdwZfFk8yzkPmb8ffr77g+imeuQcpDgqD8Wm5H3mwxMupGxE6IQ5j7vQ=
Received: from MW3PR06CA0017.namprd06.prod.outlook.com (2603:10b6:303:2a::22)
 by DS7PR10MB7252.namprd10.prod.outlook.com (2603:10b6:8:ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:13 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::a7) by MW3PR06CA0017.outlook.office365.com
 (2603:10b6:303:2a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:10 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:38 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:37 -0500
Received: from [10.249.33.162] ([10.249.33.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG6bik3425983;
	Wed, 30 Sep 2026 11:06:37 -0500
Message-ID: <ce2da311-31fd-4aaf-8479-ae2b31985fee@ti.com>
Date: Wed, 30 Sep 2026 11:06:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/wrynose][PATCH v7 1/2] chromium: auto-load
 arago extensions at runtime
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
References: <20260930160338.951001-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260930160338.951001-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|DS7PR10MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: d0dfe4dd-74c6-4cca-2502-08df1f0ce277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|3023799007|260925021911599003|260925021311599003|10067099003|260925022911599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HDi0aUeQf3s+Tw1zNNDqQItf/1KrnAS1UfUcEXOPPv99H2M/pN83fvNv1VkB1iiPlPhNsWhKLYXO38O60ALryV0f26KNl//Oc8i4Yz8m4Yw8AACwig2TkmRO7cMXe3q+5V1VVAIV2aIuTZ6Sy5B2pHtCmphZnf8R+M4+5Kkohkh6EprVB8jY53f36cSKIt2THOCyCmpJyWmKnDRwSprTi9vLe5wrzmoAxkGsdW0Y1V4REkhiJ1plOx1/qDqzr0PuGVKdqytBFHCZvgyiE8qg4T+uSER93R5kL8bSLMq3qsiWz67lL/6XuVMaKdPgFsGJtq4Qscl7NIonm1+cW+BDUF1OOi3fwvlPVRJ7CMTBdcarL75Y1GGUPrNQSyAtXO6VASYfRlMON6l7QWFWKrZH4l1vBRGJ7DH+gq28QwtIReYTvFrcSdWyHUPQzyhgaQEBxoOQ8aYgbeXvhT9ibmY/eLJ7xXuGg5yRRd0ioAf8QiTU7XwfsIh+a5GJa8RBURnALLHG8aWSG/ovDc1HxOY+BiFDgV/MMGe0Ut3KyzPsi5IYwkj/BKIbEHZcCuGhQvCd8utLDJoWU7QX5YtLzPzbtal3zndlCPULzOcomwFZ2/wcBD6185Be1x1MwDYxMCaDP54IK1lxPee47Ec986/SV3NLHVZ1Vi7HHPb90PI//epcabj3rqMAqpObQY6a2AcTSEgI89SUD4tGddnDQ/Pfwg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(260925021911599003)(260925021311599003)(10067099003)(260925022911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	weU7Dff2bwq+NdYLtQ1sqvQntjFhnu7qfbmEAYB75BcPLUr7CRODwSUhzK3un6SlFa/Ffpharwwio+d+aLwDf3DW0yB1BWSO5Xb2087kYGz8AiTRFonPZ+/ccYaHTOi9AcNSCnLePpxT8GeuNyHXJFBv+/5jg9ABVj2Y3K4uLK324PFuuPPNmfy0xOkpby4wyy/elkYL4JF2YESvBR0A7eg5sE4qeqDU7sxwsFMc7iK85WUKraRzat/eUdxPu2u+C3SWT34JNmg+tU055NSCC/OXBRmhA3B2LSV+TOfPOAU6r9ty9oHseNZ1Lk3pLwCo2UbhcLeA4CLBcoYacx00+Dl7oUKO+24MITtohKPdnuxc6/O3g/u69ic8a56V57GvPHxh/0+ySZ1ZsJcs2LX+N1IVxKGOIhuE9/0bUY1Fjv/rtJ6Zlx4fLSuPHwvtjI/4
X-Exchange-RoutingPolicyChecked: 
	QfHyDCvY6utgxXd5Dd61D3omHZHYv1UPSo6IXX4+k5mK/7HSSdN0k6z9Nmx//+W+0nXK7VByR/5rKP9YnYl6EqY+qMcTMWD5ePjw0brFhljW1vGBXpZfhGJQNPg7U2glXOH74khhTBJZbk+3PK0Xf6OJM5ISZmSr8ZyalKcSJzJOTcDQIGMkcfiYouDQdS0B6h7wFBAhbl/y/2Y/+SZFKJtRXFCFkIzqB8+CQu/n4ZbgdBDxRN+dE7RgGZ0qw2dy4IEdDcfoOGkWHZZsoUH9s/An5Zjp1FmLbrruIVvB/d0ZU/Ln95twoSswpoJakkPujFRsQJk2zvOVHggkPUKGEg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:10.8141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dfe4dd-74c6-4cca-2502-08df1f0ce277
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7252
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXwK1nrsjtFpC8
 UIJrTGp/ABHSKvTRDvH9F/Tf/JsksQfFCi+cNYXXYXrM+ytORaE85PDoY2ydb6Nn0NULeS/b5aJ
 oYnIb2bV1286abh3eJ0//BGyv61ESu0=
X-Proofpoint-GUID: 4X7HECbc6L3jeRXy_rg4eeMvaeGLtmaC
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd33b6 cx=c_pps
 a=xHz2x/H0+t1Z4EfVAX8SiQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=ofWy0XtGiGIotn3de_IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4X7HECbc6L3jeRXy_rg4eeMvaeGLtmaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX2K6oFOZpkIf9
 GlG507X9lPqLzotpCmbiYDT7QyrlT99+OAHkHBAi8OIWndcIi+41SOcc/pgrgfPUnF7IPlD7MCv
 hDEGSTc19RxhbHQibF1lN1vTOD+8OhMCXFO75IgsCgwvVAf3SYJMT77rSn5Nfqo0jl4a3Urj/yv
 mzw1wPPb7VeyIhBEv/QNKwB+I3TN7TYeFXE7A/XUsAd9ISv1varl2pPD9kBJwhxK8QKGShnNoSj
 Ki7FYRKR4i3MLk6DnK+RiSwX4idXk6j3ZiVvQh3Y4CzGvAgz9hQN6yo+RDfxDNvP/KraX0wzbbg
 ZcNDsu0NS/nu6ZbMdj63KAvR+zmokNHkIvbgTYnELD5Bog9HYttQC+bfsq1Klg5qhhZ1MKIFeXr
 KbgiRsOIVe9jfjPzzFHylgdZ6IcCX/zu3bPscMUAUxRA6+5gJQwhTAhUVgQNeALj0C6Yrl1kuCd
 v1MpysOS1uEZYwENfnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17720



On 9/30/2026 11:03 AM, Thorsten Lannynd wrote:
> Scan $HERE/extensions/arago/ at runtime and pass any installed
> subdirectories to Chromium via --load-extension.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> v7:
> - Split generic chromium extension loader and h264 youtube extension into
>    two seperate patches
> 
> v6:
> - Shorten commit message title
> 
> v5:
> - Use generic approach to loading extensions by creating arago subdirectory
>    and loading all extensions that live in the subdirectory
> 
> v4:
> - Add branch and layer to subject line
> 
> v3:
> - Separate the extension into its own package and install on boards with
>    Wave5 firmware
> - Enable extension if extension directory exists
> 
> v2:
> - Shorten commit message title
> 
>   .../chromium/chromium-ozone-wayland-arago.inc | 14 +-------
>   ...-Auto-load-arago-extensions-at-runti.patch | 34 +++++++++++++++++++
>   2 files changed, 35 insertions(+), 13 deletions(-)
>   create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index d8eb0204..40b74c18 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -1,7 +1,5 @@
>   PR:append = ".arago0"
>   
> -EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> -
>   FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
>   
>   PACKAGECONFIG:append = " proprietary-codecs"
> @@ -11,15 +9,5 @@ SRC_URI:append = " \
>                     file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
>                     file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
>                     file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
> -                  file://force-h264-youtube/force_h264.js \
> -                  file://force-h264-youtube/manifest.json \

I think these changes should be in the second patch.

> +                  file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
>                     "
> -
> -do_install:append() {
> -    install -d ${D}${EXTENSION_DIR}
> -    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> -                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> -                    ${D}${EXTENSION_DIR}/
> -}
> -
> -FILES:${PN}:append = " ${EXTENSION_DIR}"

I think these changes should be in the second patch.

> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
> new file mode 100644
> index 00000000..ec87e35d
> --- /dev/null
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
> @@ -0,0 +1,34 @@
> +From 5bcdc4db88d908abdeba11270740864a13bafad1 Mon Sep 17 00:00:00 2001
> +From: Thorsten Lannynd <t-lannynd@ti.com>
> +Date: Mon, 28 Sep 2026 13:22:56 -0500
> +Subject: [PATCH] chromium: wrapper: Auto-load arago extensions at runtime
> +
> +Upstream-Status: Inappropriate [TI-specific extension directory]
> +
> +Scan $HERE/extensions/arago/ at runtime and pass any installed
> +subdirectories through --load-extension, allowing all TI extensions to be
> +enabled by default.
> +
> +Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> +---
> + chrome/installer/linux/common/wrapper | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/chrome/installer/linux/common/wrapper b/chrome/installer/linux/common/wrapper
> +index 3547069c2a..76588abda8 100755
> +--- a/chrome/installer/linux/common/wrapper
> ++++ b/chrome/installer/linux/common/wrapper
> +@@ -28,5 +28,11 @@ exec 2> >(exec cat >&2)
> +
> + CHROME_EXTRA_ARGS=""
> +
> ++# Auto-load arago extensions at runtime
> ++for _ext in "$HERE/extensions/arago"/*/; do
> ++    [ -d "$_ext" ] && _ext_list="${_ext_list:+$_ext_list,}${_ext%/}"
> ++done
> ++[ -n "$_ext_list" ] && CHROME_EXTRA_ARGS="$CHROME_EXTRA_ARGS --load-extension=$_ext_list"
> ++
> + # Note: exec -a below is a bashism.
> + exec -a "$0" "$HERE/@@PROGNAME@@" ${CHROME_EXTRA_ARGS} "$@"
> +--
> +2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

