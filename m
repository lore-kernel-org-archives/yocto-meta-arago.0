Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AE8C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 13:11:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8326.1783516278234205937
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 06:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=U5EvuaoB;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=K2A9L347;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668C3QfE2266686
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Jul 2026 08:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/1HJVk73q6GfNP12XFZGVzQ+YwlcAVWljNHFyffh+
	1o=; b=U5EvuaoBwc2PlVRaUKNULvdFK9CpkdH4fJYeeI0lRscZmK7oGyZhgbs+F
	9lXxWVUDZqIwTq84KZ+Nf5Ya++AKNRu6m/zCG24gMuJvRYocLN3RG6ZB+s2jJtRU
	DPF1PvesCjA0iEJ07zDx63WPm5RiXiWBWRHgLL29dKCmdluKkpAvf6qTFMSt01vl
	j42IfSlRnYUDYCOcBHTrJBnbnLLFPYWkJUZEnOCOV36G5DPYpPNVWafqLiDipzPs
	0WCa41ejZex0te+FeWpyj6yTAzx7FbcbnPU6ATMHRw9VXEwH1YdLuYVoHpWyXMNl
	uSwDJvplMv0nc+T+nVpOUt0cNiVlw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9ng30hqj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 08:11:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrQF+BtA9TvLMhB0cer2nYXBymObR0rxn4xGvXFVkPGX/w3OoUa5QLiKklVL+ovFwiGAySvt7ZucXHN+Gnp53XA+wiFC6lpVGlcZwbmUij02MGkBn7BtYt1omMDFN5fxp10gN/CxIpR73EgvJ8rm5RefKnGFUbmd7ZkJ5dxN6mFDeDZjKE8SWn6zvFFkAXSdrAra+/v/OTYfG+yK3Nm9RM9UIT/Mxhn8AVMMjGCmEaLGGaGERX4Q7F2bSuEWwcDriwYgWJ7OEdoHidU48V8SGMCMHd7II/hjtevvo1oeKpd6KOZKGG+XifRxMp7v5qM0EvjnJgo9xPEeffA/egEWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1HJVk73q6GfNP12XFZGVzQ+YwlcAVWljNHFyffh+1o=;
 b=Y8Jv327l/4PhvKm/pwxGbdUUB/Xi4M3vpOmTL7ETGrpMrQ4gJxWvl8pbGk+OncumpfDOl7jB91MPenA11zaTPjN3Nc20n6AwU546BQ2Xx49SuZ48d2nf45eeSJw7zYp7/RtifpEutcKnbgQ2kpEZadspvUz72JEQNp8IGvMS9dItBy5sLisRL9/VSqpp29lDWKvxvB/7spm2QBxc5d0jqkOSS2imqmMTNs/gurmGtkcv1JCtEod22AB+9NNPfEDVtj6rdL3mVIIzQBtVsf6VRIUE3X5DVpy2ZqT13nCr+ZIEI86NVOlJxYCpFMR9ujnkroZvIQIrja5mxpnCT7bGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1HJVk73q6GfNP12XFZGVzQ+YwlcAVWljNHFyffh+1o=;
 b=K2A9L347HViWy3Nkd6xB/tjzDoDDPpZS50xwTyl3+Y++DancirxgvcN71DWomuPOusW9MjdlA+2xzE87CeiWRGgY7El3lvYH2wVJHAs8EiKzOsFrpNXflkG5bWtBfGxXKdYZop8qSKQg7J04BqcvKq6KchZo0G1kkhXLwGO+mxQ=
Received: from BN9PR03CA0548.namprd03.prod.outlook.com (2603:10b6:408:138::13)
 by CH3PR10MB7435.namprd10.prod.outlook.com (2603:10b6:610:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 13:11:11 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:138:cafe::7e) by BN9PR03CA0548.outlook.office365.com
 (2603:10b6:408:138::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 13:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 13:11:09 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 08:11:05 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 08:11:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 08:11:05 -0500
Received: from [10.24.51.87] (devarsh-precision-tower-3620.dhcp.ti.com [10.24.51.87])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668DB3Li2822346;
	Wed, 8 Jul 2026 08:11:04 -0500
Message-ID: <f57e49db-d0ff-4114-9f5f-05aeb7cb7b4e@ti.com>
Date: Wed, 8 Jul 2026 18:41:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] yavta: Add patches form embedded metadata capture
To: Rishikesh Donadkar <r-donadkar@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
References: <20260708115552.2277504-1-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20260708115552.2277504-1-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CH3PR10MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a2ae54-7017-4697-62e6-08dedcf260ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|10063799003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	k93rqVh6Ed/hdKnDSiciJHvtwyCXQUFcoirSsAeepB7SW7FelFKhyEwsKHIe+2qBMDtIw7pa1uxbJiJhd6a7qiG6Pg5kR5mYDYsTvar3BVirw5jQJlD/Eumikw3vkc8fAsSQYx9pdEjyHGXCairA6+6jBYxDGWSjWpapfPgIPzxnLOccMT7l/2/9HlmSr8nOFAuRLvE3Brg+ULNWTzXSIaIpKI1eri6DRSaWs0QWT1anjr3jqiXIbqkdR2TvzGpxvWGRB8/KLoj7kE+Lxy2x0hCsM09d3pbcsOkfwLBTYsse1k9w04mb41OqJk4GI3a+fSeLnPsT+DRHDGFPn4Ek35idgJhXHy8bvl6Uqmv/d4MZ69HFyx9IfxFXxQl0aXdqAb0IY4bl6P0HUEpYRMKTG+/YgWu86NetkPHUBubrKcNP2+In5MuY8MQ0LybakkxBq08mqq/6CejdzLtlowv7BfVUOFie8v7YViY7bSRcZm0s3ISeKebOm2IsaSJhKmz/RShM0GbdlhMo9xnc5xd46OQIJDjpPyEuIhIaLg7yVUZLAISFKgy5cGs+8f9JgKqi7+1IuPCMONphqoVvLuAoBAyU9HAWCwKo/W9oJHVTDulFeBa8IHn8mVAh3Lryf6YeXRrWLBtIiQmCA6llLRggQk3VA7AsjzVZkGMH/DSgqLCWOj/mMCSLC8y7SKEx/q99WoJHiXL6h5gSDMftFXMJDw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(10063799003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3YTgEq00z0bs2XmLw3ue2ynX65+quVXhWueoiODt5Cosc8pQJwhErMcI6HOwx6BXW1nxWWk9jqts/hHq9CzmlYLxQofWV+6R76Msl0KliKU8gE8Q7V86qRtQS+7LuFhrAs2Rcn8iq5QlDpn9MET2a+OQ7p2b4SwttBw2w4gCecw5DHkrraVJmm9ILr8niuT2cmE9uDT5H5813qOvH/Am3mWe38Cz83gKKkSLNs6v5VGGNQIL+uJeh8ofk87yawt64EoFl6Xe4+yRDYw9f3LMiwEE0y8dyX7khSVuJASZRtMxj1Oqq0tC2JJIFe1G6+XQws6R7JqzPmLfVqolXy9q0aQK5Cz7ihen3RfgqFo8bkMcDU97JMWGgt9BCGvMMhfvLKfqZ3oLx3zyrivWdyI05svjSdfJU1O48jGTT+HPOpJVeclTjHdUkNpC7W2w6Ifn
X-Exchange-RoutingPolicyChecked: 
	sQqL1Y5QbPT4shSE92TfUKdV9D+eKmP9H+F4ENfKxhls1WjfXVJ/yz557YGYxq5OoS/vNV8oD/d7YUqeRpT0Cn17sd3K4fmUfc6PBlRZA9bFDbDN6yYm/JUIihJP4C1sQ6Q/j9ylNNYB5eTnKgBwXB+0p3yE1a5u3U4xNQmBKSd5ntr1bUgDxQvEYAB/ffDd6HX+vTn16M1qY47QmVbrOx9fGGnYRXwGtVK5zNe5KNR8xgHYwWSuLh1uY13nvfyxccy6w78jX3AXQKICml5QZIOAUEbzT1N13pL9tCAi32wDwgUtdzCYA4x2ONsn3SBr58GQy958nDvXgafxe8AjXg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:11:09.4257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a2ae54-7017-4697-62e6-08dedcf260ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7435
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX1a/PvmZdEphm
 LBHpPO71tdkA6eKLyP5l8ZEfptNyMw3o1bBCGqww7I408xhWyOCVrhAb1O2ztNHu2APxW64RArp
 wRob2vcq0gSunlyB2/uk4Fm1ed5W9KVq5gZoNRvaEnddXbWX/3JebDAzzK1a6zr5GbiRiBQsFDM
 vfi6N9ypfp4sJmgqHU7XpSPByaleRIQ2l6PS7BFBHtSjG2hGTmQ65sa9HnuVSRg5HYEjaFcEXJ5
 fJPsbuKwYtF+kGvxpBsOHtPfaxKXqhDPq6elYwRtMu/gILlcp4/CpA8N43wTuQ2EkLE+ClS7lw3
 0V6lnNjEQuGB9OxpJMrYPqAgFHW1UpzeAPuDWmc+W6HMiC/sQ6iJmUJNL2UJzHBqQPhwnVZF8cq
 xxGVO2rA0c+HGIgTXpEP/w1KC4rKhz8FXoxvbDIhsWh/Aadw99zY7RPRWnQwvxxsxAubY9IZ1PY
 +9W2VmpclPGIFA7zWcA==
X-Proofpoint-GUID: qwY6Ewo7mdz2jCQmmNaflAT5wty8B5ks
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX+mhJR7vTQ95h
 tWD/0QozMffist4+ty3q1yKZvFt2q64UGT/HIkAg/rs78ttSOmyEVL5W4TAojiAVblF8VGufO1X
 +E1Tpe2v/Ek1emO1vGBZioEVONBqw6M=
X-Authority-Analysis: v=2.4 cv=OfaoyBTY c=1 sm=1 tr=0 ts=6a4e4c75 cx=c_pps
 a=VvAZzv+PhNtEUaR8E1V7rA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=ByK1oeHJhkfmtsgSyzIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qwY6Ewo7mdz2jCQmmNaflAT5wty8B5ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080129
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Jul 2026 13:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17585

On 08/07/26 17:25, Rishikesh Donadkar wrote:
> Add patches on top of yavta to capture metadata from sensors
> like IMX219.
> 
> This patches are not added in upstream yavta yet because
> embedded data support is not yet functional in the mainline
> Linux kernel
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
>   .../v4l2apps/yavta-arago.inc                  | 10 +++
>   .../yavta/0001-Update-kernel-headers.patch    | 89 +++++++++++++++++++
>   ...et-and-get-metadata-width-and-height.patch | 52 +++++++++++
>   ...support-for-generic-metadata-formats.patch | 42 +++++++++
>   .../yavta/0004-Add-metadata-layout-ctrl.patch | 31 +++++++
>   .../v4l2apps/yavta_%.bbappend                 |  4 +
>   6 files changed, 228 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc
> new file mode 100644
> index 00000000..ca04b36d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta-arago.inc
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/yavta:"
> +
> +SRC_URI:append = " \
> +    file://0001-Update-kernel-headers.patch \
> +    file://0002-Set-and-get-metadata-width-and-height.patch \
> +    file://0003-Add-support-for-generic-metadata-formats.patch \
> +    file://0004-Add-metadata-layout-ctrl.patch \
> +"
> +
> +PR:append = ".arago0"
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
> new file mode 100644
> index 00000000..6e798577
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Update-kernel-headers.patch
> @@ -0,0 +1,89 @@
> +From c4dd8eb96b5d6f6e791fc66752a97b362cd885f2 Mon Sep 17 00:00:00 2001
> +From: Sakari Ailus <sakari.ailus@linux.intel.com>
> +Date: Thu, 24 Aug 2023 10:57:07 +0300
> +Subject: [PATCH 1/4] Update kernel headers
> +
> +Update kernel headers to v6.5 media tree + metadata patches.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> +Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> +---
> + include/linux/v4l2-controls.h |  1 -
> + include/linux/videodev2.h     | 23 ++++++++++++++++++++++-
> + 2 files changed, 22 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
> +index 8a33537..150fa87 100644
> +--- a/include/linux/v4l2-controls.h
> ++++ b/include/linux/v4l2-controls.h
> +@@ -1208,7 +1208,6 @@ enum v4l2_jpeg_chroma_subsampling {
> + #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> + #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> +
> +-
> + /* Image processing controls */
> +
> + #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
> +diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> +index 397a99e..bb2d05b 100644
> +--- a/include/linux/videodev2.h
> ++++ b/include/linux/videodev2.h
> +@@ -812,6 +812,18 @@ struct v4l2_pix_format {
> + #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> + #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> +
> ++/*
> ++ * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> ++ * adding new ones!
> ++ */
> ++#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> ++#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> ++#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> ++#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> ++#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'E', 'C', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> ++#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> ++#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'E', 'C', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> ++
> + /* priv field value to indicates that subsequent fields are valid. */
> + #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> +
> +@@ -842,6 +854,7 @@ struct v4l2_fmtdesc {
> + #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
> + #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
> + #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> ++#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> +
> + 	/* Frame Size and frame rate enumeration */
> + /*
> +@@ -1005,7 +1018,6 @@ struct v4l2_requestbuffers {
> +  *			pointing to this plane
> +  * @fd:			when memory is V4L2_MEMORY_DMABUF, a userspace file
> +  *			descriptor associated with this plane
> +- * @m:			union of @mem_offset, @userptr and @fd
> +  * @data_offset:	offset in the plane to the start of data; usually 0,
> +  *			unless there is a header in front of the data
> +  * @reserved:		drivers and applications must zero this array
> +@@ -2359,10 +2371,19 @@ struct v4l2_sdr_format {
> +  * struct v4l2_meta_format - metadata format definition
> +  * @dataformat:		little endian four character code (fourcc)
> +  * @buffersize:		maximum size in bytes required for data
> ++ * @width:		number of data units of data per line (valid for line
> ++ *			based formats only, see format documentation)
> ++ * @height:		number of lines of data per buffer (valid for line based
> ++ *			formats only)
> ++ * @bytesperline:	offset between the beginnings of two adjacent lines in
> ++ *			bytes (valid for line based formats only)
> +  */
> + struct v4l2_meta_format {
> + 	__u32				dataformat;
> + 	__u32				buffersize;
> ++	__u32				width;
> ++	__u32				height;
> ++	__u32				bytesperline;
> + } __attribute__ ((packed));
> +
> + /**
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
> new file mode 100644
> index 00000000..e08ff913
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0002-Set-and-get-metadata-width-and-height.patch
> @@ -0,0 +1,52 @@
> +From 94ea50843fa80fd91f8aa3ef3618310a53f40dc6 Mon Sep 17 00:00:00 2001
> +From: Sakari Ailus <sakari.ailus@linux.intel.com>
> +Date: Fri, 9 May 2025 18:43:38 +0300
> +Subject: [PATCH 2/4] Set and get metadata width and height
> +
> +Support getting and setting the width and height fields of the metadata
> +formats. This is required to capture line-based metadata e.g. from camera
> +sensors.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> +Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> +---
> + yavta.c | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/yavta.c b/yavta.c
> +index ba94bfa..25b95e7 100644
> +--- a/yavta.c
> ++++ b/yavta.c
> +@@ -889,13 +889,14 @@ static int video_get_format(struct device *dev)
> + 				fmt.fmt.pix_mp.plane_fmt[i].sizeimage);
> + 		}
> + 	} else if (video_is_meta(dev)) {
> +-		dev->width = 0;
> +-		dev->height = 0;
> ++		dev->width = fmt.fmt.meta.width;
> ++		dev->height = fmt.fmt.meta.height;
> + 		dev->num_planes = 1;
> +
> +-		printf("Meta-data format: %s (%08x) buffer size %u\n",
> +-			v4l2_format_name(fmt.fmt.meta.dataformat), fmt.fmt.meta.dataformat,
> +-					 fmt.fmt.meta.buffersize);
> ++		printf("Meta-data format: %s (%08x) %ux%u buffer size %u\n",
> ++		       v4l2_format_name(fmt.fmt.meta.dataformat),
> ++		       fmt.fmt.meta.dataformat, fmt.fmt.meta.width,
> ++		       fmt.fmt.meta.height, fmt.fmt.meta.buffersize);
> + 	} else {
> + 		dev->width = fmt.fmt.pix.width;
> + 		dev->height = fmt.fmt.pix.height;
> +@@ -951,6 +952,8 @@ static int video_set_format(struct device *dev, unsigned int w, unsigned int h,
> + 	} else if (video_is_meta(dev)) {
> + 		fmt.fmt.meta.dataformat = format;
> + 		fmt.fmt.meta.buffersize = buffer_size;
> ++		fmt.fmt.meta.width = w;
> ++		fmt.fmt.meta.height = h;
> + 	} else {
> + 		fmt.fmt.pix.width = w;
> + 		fmt.fmt.pix.height = h;
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
> new file mode 100644
> index 00000000..3728e5b5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0003-Add-support-for-generic-metadata-formats.patch
> @@ -0,0 +1,42 @@
> +From a4f5a948d05827d95ff2f73a997fd3cdba46d2bf Mon Sep 17 00:00:00 2001
> +From: Sakari Ailus <sakari.ailus@linux.intel.com>
> +Date: Thu, 24 Aug 2023 11:08:56 +0300
> +Subject: [PATCH 3/4] Add support for generic metadata formats
> +
> +Upstream-Status: Pending
> +Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> +Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> +---
> + yavta.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/yavta.c b/yavta.c
> +index 25b95e7..6a494da 100644
> +--- a/yavta.c
> ++++ b/yavta.c
> +@@ -340,6 +340,7 @@ static const struct v4l2_format_info {
> + 	unsigned int fourcc;
> + 	unsigned char n_planes;
> + } pixel_formats[] = {
> ++	/* Pixel data formats */
> + 	{ "RGB332", V4L2_PIX_FMT_RGB332, 1 },
> + 	{ "RGB444", V4L2_PIX_FMT_RGB444, 1 },
> + 	{ "ARGB444", V4L2_PIX_FMT_ARGB444, 1 },
> +@@ -424,6 +425,14 @@ static const struct v4l2_format_info {
> + 	{ "DV", V4L2_PIX_FMT_DV, 1 },
> + 	{ "MJPEG", V4L2_PIX_FMT_MJPEG, 1 },
> + 	{ "MPEG", V4L2_PIX_FMT_MPEG, 1 },
> ++	/* Metadata formats */
> ++	{ "GENERIC_8", V4L2_META_FMT_GENERIC_8, 1 },
> ++	{ "GENERIC_CSI2_10", V4L2_META_FMT_GENERIC_CSI2_10, 1 },
> ++	{ "GENERIC_CSI2_12", V4L2_META_FMT_GENERIC_CSI2_12, 1 },
> ++	{ "GENERIC_CSI2_14", V4L2_META_FMT_GENERIC_CSI2_14, 1 },
> ++	{ "GENERIC_CSI2_16", V4L2_META_FMT_GENERIC_CSI2_16, 1 },
> ++	{ "GENERIC_CSI2_20", V4L2_META_FMT_GENERIC_CSI2_20, 1 },
> ++	{ "GENERIC_CSI2_24", V4L2_META_FMT_GENERIC_CSI2_24, 1 },
> + };
> +
> + static void list_formats(void)
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
> new file mode 100644
> index 00000000..cf0a4bf9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0004-Add-metadata-layout-ctrl.patch
> @@ -0,0 +1,31 @@
> +From 7d5fc4a3b0982fdc894c946d16fc7152d7da8b30 Mon Sep 17 00:00:00 2001
> +From: Rishikesh Donadkar <r-donadkar@ti.com>
> +Date: Tue, 7 Jul 2026 13:28:41 +0530
> +Subject: [PATCH 4/4] Add metadata layout ctrl
> +
> +Add V4L2_CID_METADATA_LAYOUT ctrl
> +
> +Upstream-Status: Pending
> +Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> +---
> + include/linux/v4l2-controls.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
> +index 150fa87..32291d3 100644
> +--- a/include/linux/v4l2-controls.h
> ++++ b/include/linux/v4l2-controls.h
> +@@ -1208,6 +1208,10 @@ enum v4l2_jpeg_chroma_subsampling {
> + #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> + #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> +
> ++#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> ++#define V4L2_METADATA_LAYOUT_CCS		1U
> ++
> ++
> + /* Image processing controls */
> +
> + #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
> new file mode 100644
> index 00000000..602fd07f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_%.bbappend
> @@ -0,0 +1,4 @@
> +YAVTA_ARAGO = ""
> +YAVTA_ARAGO:arago = "yavta-arago.inc"
> +
> +require ${YAVTA_ARAGO}


