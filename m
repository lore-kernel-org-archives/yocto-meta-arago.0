Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587E6C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:13:58 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50942.1789164836282589229
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 15:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Q48IXx4Q;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pUmuD7OQ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BHUvFn213706
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 17:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VFoFaeOy4un5+DXOypLrES4o1dnBNg0bDhTIIYuaF
	UI=; b=Q48IXx4QJ6j7nhxf3/Rve863l3J5qckZ7HfBihV/LEJQBb9FU1BcVnnWy
	HuV2auQS6OR6XJ8RXmeh749hFNJ/Svu2iWQl+YTrUnE0NjbL7+mHBAPug4uO9fw8
	c20xZxJ7N7zDfPhX3Qp5iqCcswP0d+01YmpwvsKzP/RD488+S/m0NJQwnWTC9pKh
	6ymbbLccZKoOu03Kve07fWV7neGUyjZYl7fq7uoEgnaPeI+EGmHqh4DNx7CwHq3G
	iaxyQdhqtLu/8nmQOT5z8FfO156Xchuu0ZYvWPEbSz003iLJjxGgilnvToNzjfnj
	tjZmgvWQ6keKTYAAUuT4NmFDlwGvA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyyqjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 17:13:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHQBEBpCfaKHxpE5XQtZYe1KmsMBf+4654xMrGShP5PvCWloBS6nNJwSd89L9CGXmCJn4mExWgVwWzKUmf8lGgibe+Z5RQ7qG+wognQ8IOKV2fABlujQC+UC9fpsWqUxduVqhVLwf9gliDKdF0eA8wxzkJeNtKe2ZiBHPrQ7SPqUfBQz7fqL/eFTQOZNWye3xYv6MQIYC3q31HtwnEsvXuO9Ch9bWvbJZxyxY8W8/7z/rnylGR39ydDbZSUNf6YcIaORwonEIWOEVHrkg3R9fMfi4gEUiu70O/EqfJdna5/Ev+XL9JJM22NssqLqYt7Imk00AwEFmiolOEgpYv3A4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFoFaeOy4un5+DXOypLrES4o1dnBNg0bDhTIIYuaFUI=;
 b=Yn6785lvzyn05Df8rYzR66UNVtpkDOGd3WvLV2A+pjVqpPfH33izC97VtQZMKZ6v+XpuViTR+3MM+JXLhvfKmnXScG3ZKKxi3id/ousqUlDlsK8XTgpVNnRVcm+UsJj4ylFPLaH5yVtEHT4PoCKx2C6pbI/nT5kaER/orl2OnFtFknoZbxyhZ23jbWsE1sn/6Ki91C+WU49u8DtBqV+4x4G17lr57imTf35/ilIW+pJOaOlPhbz/qSeSkOqC7cUdnflUYEyrZhUvVCLHvP3JTodB0b1FQ9cQ3LNXafD8AqrNULgbixYdFYgOE2VZ+4fuNIDbV6TakCgVDDr6e1u+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFoFaeOy4un5+DXOypLrES4o1dnBNg0bDhTIIYuaFUI=;
 b=pUmuD7OQYTJDu+Dtn17s1JNm7KYxocV3lJWUTFiZQl8qyo6X2eQTqZGh+wdBcPk7pUEbjrnEocK3o4nUYkeynfngujqvgNH03HcoNVhXtRSwOBfwom6EzOtrAIik3lHs1GcHMOYHv88XP+ht+Qa+f7AqN9JMDLl1IJ6we+HsMyc=
Received: from BN9PR03CA0906.namprd03.prod.outlook.com (2603:10b6:408:107::11)
 by EAYPR10MB997900.namprd10.prod.outlook.com (2603:10b6:303:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 22:13:52 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::5) by BN9PR03CA0906.outlook.office365.com
 (2603:10b6:408:107::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 22:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 22:13:50 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 17:13:15 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 17:13:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 17:13:15 -0500
Received: from [10.249.34.43] ([10.249.34.43])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BMDFvD1865305;
	Fri, 11 Sep 2026 17:13:15 -0500
Message-ID: <e3a40718-caff-4063-8a8d-cb0aa08078f8@ti.com>
Date: Fri, 11 Sep 2026 17:13:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/wrynose][PATCH v2] chromium: restrict
 force-h264-youtube extension to supported boards
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
References: <20260911183900.631578-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260911183900.631578-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|EAYPR10MB997900:EE_
X-MS-Office365-Filtering-Correlation-Id: dbfa6f40-b201-4b15-3bc3-08df1051f5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|3023799007|10067099003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MgzfkKJOFjjzE5Y3eo3EfORGIdCCPgxkJACBcOurW+hyPGw3C38itkiY+HMLJ/ZLfkeSvIX/gNcdYbMHzUEy28aVCmrRymGUp195vsZKwY1L92si98inWRrsEd+hFKnkmDSDwJ+s/j6bHYIvVlE4vDPK1bNk4Tz+Xt9QSBdz1OAyop7T88JkVgHWrK8Mk6+dUezKnPQOLZcS4uguAGntbBdiUjMcnWkGPx2k7weU9aHCFD0R/o7XI5/rG3o1iTDsjuZTTXTVncHoXBwObzrIp/M3wizJwN/+Rc3rQDN8o+EUF14uuGxCmuVpl2pJW/h+1tDcVfwtCvQfRfcxDWuppTsd8oJ3gj4NQd2OKd35Koks0hIt3XhvL0RDP6HSQZRR0eQNy5HwAaAqrR4bknVMyAABLWhKC9Qp3bWvcEbpvGApqCcdpl4Bqp9ArI941DvcEdzVY7K6ZKhk3nLUdXvkY3JeiuqcffzbLZK9p9NBE37uRPoyjT7qd2qjG1vAGCU1iConmUbfDBGheO098kuKS5donCmRRu6blrFI0LxWVSdBoDIhCoof53iar1LmvTb5Mzo7zZfVRfgojgRsprx12odV8UokP/OWbKlM2dAQjshkLtYw6YD0dPBJE2nh+rOOkCfa5xk+ybOUc3x78rPtAfzRDbxFgIQP9PkYNcWwn5Cg9YHbUfFDHqzWpnaxv8izdDMSjpCJDmC8mt1oHSGv/g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(3023799007)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FVKfeHZJO9xJaQ/lGnboVw1vDfCrBj9NaA9Oy1Uzm5+vv/f60abM2M8jd0DigBJyADgW4gigvWSRKCJB1ejNfoQ2vJjZOXCbaFfkh1i+zESba9UjiN7zIhoH0fk+FunznkuCBVJvOG9HvKDCOoHVdfQZ7qfLhWXIgsjAGvF0eMxfmEJcUWsfA9W16pZ6XUTJEpBqeXN5a/U50JhaH0beP+qi9qAPGMC37N422hMtMlJYWw3bba9D329DLmM45quzC+SVjOpXl8bRI+0Z5ZXk4xKd1aYDlu3jWb6thNmjZUSbIPrizUlHM7DOSldmULArN8OMuug1XfAEZyjq8T11+HxvbDM7cdmASzcIgM/XPMXNQRCmP0ZzHJrLNtdZSA7oN9e+74PcIzANf061VeVTSbhdFyqvK9eDDpXyGZ3ygG2mT/u0hEYxX5NZwMHj4kWt
X-Exchange-RoutingPolicyChecked: 
	PJZUGA1sfhSBYOcHOcFAWHhUztpTE8RqoGqnDAlSeUsk/g9TtT2M9QTnBvsfFLXVbPeHX8kiBz/5jeaiH7SAsPC4izoSS0wPeh42nuHLaANoJ4FYsqB2ntdSB+rdSMh2LgGssI/OOzs+m97CgnJUlYBXJ5dEYoeKdHZk/XaYu4Q3KRxuKBqsgKCKEgVVXGY0bC3FQrdeXlRvVUtXjuIvIN7oA9Z0OzW6Za3z29S6GFzRh1dMuZuBsdz2YM0u0B0MUntnSre6peUdibV1l2fYHdec+giCzT+US4sXbFlqcRNcfO2w9Wmx+9TEB1cauzPeuM+zZitPSYSUBMxYcSrBDw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:13:50.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfa6f40-b201-4b15-3bc3-08df1051f5bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997900
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNCBTYWx0ZWRfXwt28qpkcwpwJ
 2FqVKrTvqUXSWHmeykFi09HhJELgKVPSMMKp4qQLnjUttjvAZgBOE3qTVF2RVosh0nYO2mbPv++
 bUdzXlm4A5l7L/ehLGMS9Z9EIv365wQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNCBTYWx0ZWRfXx86eWRmAiVmk
 GFE7e0YbyOAoSl417IvNkQn1m9NZ+KNDJ84kZDkZnHuCXxkbFKxUVoVOGEA/QSAnqq571rZYIcj
 Su6utf6fgShBmQiZeArx1rk9NCOAAPuBME1KEg9oeBylRVWOqH6EyxTtGh7azF20SSuJpTwu2DJ
 mQnKh02Meifn1xAQNi62lxHWMa21GS+tEa+VGEOAppeXExG+J+NGfnsQb/OkbnKtlMBMGBTLIfQ
 DHR/fEsBGetQuj86cqN5wgni8pPMvOB1zhtECy6fAQT2s0sfN72HfKYqZ3iaToAvs2qT7ZdTyNP
 h5eUOStbXYKLqjNcwtZzJqk8xy6DNUdz8LJMdDL6ahO83AEp7p21r5RLZfPhAAJQvfx2zUf/BNw
 A6YPftcOqc8P6+/7UHSAz4YyM/3WxEDwRsEAMw1x/ZwDEiFTHCxXfi+m8sDCI48un1ip4cWw4qz
 ama3ILJGDct48JsBBYQ==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa47d23 cx=c_pps
 a=xAd66yR1laZozgwquCAwlw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=gNqQo8IDOAhgxNeHLeMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kAZGKITkNhaFpSoG1j2MrtqRepDfMz77
X-Proofpoint-ORIG-GUID: kAZGKITkNhaFpSoG1j2MrtqRepDfMz77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110314
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Sep 2026 22:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17670



On 9/11/2026 1:39 PM, Thorsten Lannynd wrote:
> Split force-h264-youtube into its own package, enabled only on boards that support
> H264 YouTube hardware accelerated playback.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> 
> v2:
> - Shorten commit message title
> 
>   .../chromium/chromium-ozone-wayland-arago.inc | 29 ++++++++++++++-----
>   1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index d8eb0204..108f77c7 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -1,6 +1,6 @@
>   PR:append = ".arago0"
>   
> -EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
> +EXTENSION_DIR = "${libdir}/chromium/extensions/force-h264-youtube"
>   
>   FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
>   
> @@ -15,11 +15,26 @@ SRC_URI:append = " \
>                     file://force-h264-youtube/manifest.json \
>                     "
>   
> +PACKAGES:append = " ${PN}-force-h264-youtube"
> +FILES:${PN}-force-h264-youtube = "${EXTENSION_DIR}"
> +RDEPENDS:${PN}-force-h264-youtube = "${PN}"
> +
> +CHROMIUM_H264_EXT ?= ""
> +CHROMIUM_H264_EXT:am62pxx-evm = "1"
> +CHROMIUM_H264_EXT:j721s2-evm  = "1"
> +CHROMIUM_H264_EXT:j722s-evm   = "1"
> +CHROMIUM_H264_EXT:j742s2-evm  = "1"
> +CHROMIUM_H264_EXT:j784s4-evm  = "1"

Would it be better to create a MACHINE_FEATURES for h264 and then have 
this just key off that.  Then you could send a second patch to 
meta-ti-bsp that adds that feature?

Denys, thoughts?


> +RRECOMMENDS:${PN}:append = " ${@bb.utils.contains('CHROMIUM_H264_EXT', '1', '${PN}-force-h264-youtube', '', d)}"
> +
>   do_install:append() {
> -    install -d ${D}${EXTENSION_DIR}
> -    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> -                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> -                    ${D}${EXTENSION_DIR}/
> +    if [ -n "${CHROMIUM_H264_EXT}" ]; then
> +        install -d ${D}${EXTENSION_DIR}
> +        install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
> +                        ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> +                        ${D}${EXTENSION_DIR}/
> +        sed -i "s|CHROME_EXTRA_ARGS=\"\(.*\)\"|CHROME_EXTRA_ARGS=\"\1 --load-extension=${EXTENSION_DIR}\"|" \
> +            ${D}${libdir}/chromium/chromium-wrapper
> +    fi
>   }
> -
> -FILES:${PN}:append = " ${EXTENSION_DIR}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

