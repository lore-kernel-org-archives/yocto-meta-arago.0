Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1B8C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 08:32:54 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9120.1789029173527424020
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 01:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qQVAbibQ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xTwpVpYd;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5G0fe2238932;
	Thu, 10 Sep 2026 03:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=SF+dG9gOlo7WfWo
	G9VXRxf38NhSuWQgkbv9Rv89XoM0=; b=qQVAbibQu6M3rqjA0HCWUcFDyNNKr+O
	By8CCKXDAoBE0c5PKepIb/Qen68tSWheCDPW3osAaZQJuJbi6W9+Pmr4cERp1150
	rY2gkAhq3Af7zra5oD5nu7zU6za8E3KrkPSQ9yYrLcm0vvnCe8sjkdYIkJcJ2eHm
	p4e6O1DWswDTZpaOnqxKE5M2aUs1gDHrP8QEJ80POG70zEsF71/DbuEqgSv6n+mZ
	EUsj4e1vE+VVYbfnSNNPrYXxM1H/0i/YRGnIk/rYIwg+b0amY3wt+JFYeYRDxOR+
	OZsmWOa9+jqvSFLpTVU81Hj6E9u1GxnQhuGWgmp1GVy4s8x/Wp1I+Sw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxfvbex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 03:32:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSNzq77FnVgRZyHEQbLOuSv6IwsJiE/epn0gbBWHpHfy5TdmqCkrcgqGPTjSGcbEEtwJRHAHXEkNpzgVdP/PLANEAQwAiIFb8KjjSd9fC6iulTEOntDtPlVTlwrkp7jxO1SuCGU0f6rVCAnFh1UfrApOjdNbPqGvN1oy1AyDbmjmnZKrjnonK0zm8WjZK+Q/IHLCen6s53x6/bGwtM0IPH4O7ESsVFC+q4tyGDIEO+4JO3MVmC6h/Jvogz9Qj77MlBFa8GFJUpV9ZSN9cL96TBEFlUU1gVuZqiLIcii4orXuj6bNJ/YQKUpN3wJEO0E041KL2nXxJaiTsM6QLLaOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF+dG9gOlo7WfWoG9VXRxf38NhSuWQgkbv9Rv89XoM0=;
 b=anIxYQc9BI13aXP6MRkVyJuJelsfEcTGQcXnT6ayeuiINf+E73MJYncmjmgxxV54w9cYJm5QA3mO5UaHfmv+X3KYmos3zcPm2VD5XU5CcJTGQRIMxMOFGId10ZdZHVhYJTb7FZHXz2OdE9RFeCdBw6GqPjkD4HQPDBu22dExr7edqKk8p2uaV6ic+H5Wtw3NMELYSY1dr9jGINp1peyT5V8q+K2JHP2rUhqc5G0kQuW5qEoxjyxzGnB4xoh7rBw/Iux3HGffFdbdnj2sygy/7eC9n70l1bMyzgymXNadSZ2M4nADZYoEHWIQzCyD3p964PKXMuy84omVb6CkH/QUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF+dG9gOlo7WfWoG9VXRxf38NhSuWQgkbv9Rv89XoM0=;
 b=xTwpVpYd1lDg/omK/VQlhcjmvD0TgPhloj0o22bJbblB1xBIE8VoDa3b2SccD3K8LqVzDNKTrfEztK61suanohu1xB7Aw1PT8Ss5vk8Q6ZunbQOjjBINVJOq2UJq1JDc9XL8RdJCqx1Eluf43zn90mZncKiDnec3gklHwvOmpBo=
Received: from SN7PR04CA0113.namprd04.prod.outlook.com (2603:10b6:806:122::28)
 by SJ1PR10MB5979.namprd10.prod.outlook.com (2603:10b6:a03:45e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 08:32:47 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::9d) by SN7PR04CA0113.outlook.office365.com
 (2603:10b6:806:122::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 08:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:32:45 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 03:32:39 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 03:32:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 03:32:39 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A8WcNU1988245;
	Thu, 10 Sep 2026 03:32:39 -0500
Date: Thu, 10 Sep 2026 14:02:38 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: Re: [master/wrynose][PATCH 4/4] recipes-core: arago-default-image:
 Add PipeWire audio stack
Message-ID: <20260910083238.tjhgmhp4e7kalgv5@uda1250336>
References: <20260901030233.686017-1-p-bhagat@ti.com>
 <20260901030233.686017-5-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901030233.686017-5-p-bhagat@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SJ1PR10MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b745d7b-9f9c-40b6-8935-08df0f1616b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|4143699003|10067099003|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+yduWN71U7nVIHep+vS5k6IKcw0Nci0Wa9OFu7gGWQMo4w8LZMbzHFb7fn442n3SaPVBqLtr5/wh6MS8o2ipe+jLWT+q/HMv6JRQUi+AGJDqt59vSIDSx0ci6YIcEh+i3HzkMdH6AFV4+6Paf3rqMNB1JuYmDMPMxmBtlsgNw/Db6tWNyy0GWFiVDvouZ0EAd9VUT/fEViQUwKi4V8YBVzkrvX0X6JBf35Teo4Bg84uiY9etWhQkOtEMm1kZU80q8KY7mwcRjxR6ywh4vlpa8dmKtl8iZJVwPHWs+9Jx7D6t+X2bl1/pbE4/6FM7i0WLIutTJB90DexEuUH/weHV4onYsamOkvo4I/g+aO3N8dcRNCIWq78at5FBitdSCK5V1tUJDzBtiuOlWXFWDysEkRcnJZaKso5x26WJjNSuuTdDO6dUC8rt4tIl6yfm69NmssB26/yaHmb4rQXypfSdqDaGk3C27KoFUUWacmXNvR5veakDYHQveUOXSko1WPAR1abRHZBWYEesiYQWH9+8Zd+2aTMjyL5StODjaWzj6tQw1KrmH9XPZJmA9lg3vuOOVjGL+u8eG/hO6AmC46dxZnLgvtQCoJwpajWWa8AZIgbecIEXP0lhwfyQ+nHnviZG7QNjdx+NfGroMgyfDBCwklOkyNaoNykK5ooemzy2EJLrOQIlpNyzplTuX+Ed2KstYRRv5aIa3Xo5Bzgvw6MInA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6posokzrAAJmHZczqmjOCPBizEUFYEzsQ0AGhtm278mC67TvMOTuo1c0hat9+FheHS2uIO9wQwtiaZx2mA3YVgmBByKaDf3+G1g/N4L7i2E4OopFyURiKENZNBfY859RqjH85uYGzIk5dYlUJDRDXkOdzPNtzoS06kefNcdiZE63KyyGH1eqIjgkq03NlkGq1/yEIM93BV49R3AOwL6CLZVtsIqyzPNF8g1n+rxHGXnti2eVqXZPJ8L2nkGHZa56MNbxXiaZEgi1iz/7CKKCjSkvPaNoapxdRVE6QhTfR1x4zLCVCpLMNpUZT2sGLkZpV/CnpYTf9Nj8Nr+dyUjveA+VueHP19jGeXTKvEMg66GR8f55rTAaAAcFb63FXNxbPFid6mlaBd6ldgUHtXAS8gQJI7Nwxy+Khm7AymCaeEoIVB0NFo35KLMyvQxrcSpj
X-Exchange-RoutingPolicyChecked: 
	j/FimAP6p1l5vJ9/uGi8vlAXDMMU+vaa/3jlHBRYunGJkUfUxHLlDTtqsPOK48dCzv+8H/3G/Yl5WbQdkNznh0nbN9Sh/vTSUc7LX8cJ1UFxKgHKczORAJclJEeoU16NAJWCzCLmphljvFQPgRA8Ab0I5tC5D1O+rhwGUYTccZRZd/duGrxOTUL1KU/vlTc2liCrthy/D9P+102+44szVKqg3hrMGKeTGoAHVuOckHB9qegCpsB2YyeBI3Sk6zrcg5FQlmgWHHf9hfW5l6GBkWfsBn45rOUyNXLUGTLf5TL1jwFJZIincX9wrmBjJ+aTyGkTN+Krr1haVPdrOq8WWA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:32:45.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b745d7b-9f9c-40b6-8935-08df0f1616b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5979
X-Proofpoint-ORIG-GUID: NUxf1GKL1k0A-NoZ45dLvmPB0uBYVV3z
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa26b32 cx=c_pps
 a=Lj9o+5Kg1g76LDS8oSCIAA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=CXuS1b9CJ9DmuK_9hTAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX0zvYl7P8jtm6
 YNzexxfWe1C5fgYsmXk9+3BgZaqJoaIPLIZT1GlpGwhvqZTg/I2g0Eq/RgZxp9bbmfXjkgsgdpR
 doM49zLACgqvyOathhgcSWQYGLINFAIEpmw7aNqRbbzY9NzUcwyyaRDSMEBlw04XQ392hBk0kvw
 wMHbdQ2JxYXnDQVfbpKwk93lFcenznZSzzoLwVzSC6N60/yXdaXFBNUe+781YFARbXsh0SeOQNa
 a8Buof2k9JV8OdZzeTi5s50npKirA6wwfmLCM8lLfxzZL2jtQ+mLqy2ERGnN+9G3Mf4q99/hsbR
 7jwpzlAW5nlT1puTAqZiGH1PSySuVSdp+TBrzVI6N7acTfDYwo3Oxh6L6fTVY5hKdwleKKF+ZzZ
 5uIeNF01k5JyqorxFp7DnBk6IrqacRaM01eVBNCO8An8RQkzqJhaYbfnpHPqlh3Q+36lFgG0mR2
 M+Tdyhgm8Ar6IPbZ3vw==
X-Proofpoint-GUID: NUxf1GKL1k0A-NoZ45dLvmPB0uBYVV3z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfXxprsQM2BH3WD
 aFgKsFK1zKgxlxaB/HpQkdQdHN+UVWE/SU2N1riBFIR0Qp9k/V2+aPwaEQDwyKK2+IAsJGVgdZl
 tZffrh6/lRi3IQ5vsocg3Fn29+Dd7+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100094
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 08:32:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17662

Hi Paresh, 

On 08:32-20260901, Paresh Bhagat wrote:
> Include PipeWire and WirePlumber as the default audio stack across all
> platforms. This brings in the core PipeWire daemon, ALSA integration,
> PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
> plugins, and the WirePlumber session manager.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../images/arago-default-image.bb             | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> index e01f7c2f..87b55a68 100644
> --- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
> @@ -43,3 +43,23 @@ IMAGE_INSTALL += "\
>      ${DEVTOOLS} \
>      docker \
>  "
> +
> +PIPEWIRE = " \
> +    gstreamer1.0-pipewire \
> +    libpipewire \
> +    lua \

lua is already in wireplumber DEPENDS, this line can be dropped.

> +    pipewire \
> +    pipewire-alsa \
> +    pipewire-alsa-card-profile \
> +    pipewire-dev \
> +    pipewire-modules-meta \
> +    pipewire-pulse \
> +    pipewire-spa-plugins-meta \
> +    pipewire-spa-tools \
> +    pipewire-tools \
> +    speexdsp \
> +    wireplumber \
> +    wireplumber-dev \
> +"
> +
> +IMAGE_INSTALL:append = " ${PIPEWIRE}"

-- Yogesh 

