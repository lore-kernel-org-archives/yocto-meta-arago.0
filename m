Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767FCC61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:11:24 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1646.1787904681006148396
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 01:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Cx6CrRxV;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wRZwifjW;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S65MCq569363;
	Fri, 28 Aug 2026 03:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BtZR9l5DCEt7Vr59xtmhjqVywcxpSyQdVO+bzzCa4
	DM=; b=Cx6CrRxVmxNR94NfIpr5TBBbJqkq/6sRVeQTk6xarZhRuIZR6VJaiVKE6
	r9DWQN+iCazJTzzlBXXDmshgXM2XPBUf2+rNhCCGbUMp1D/V24+ciEr6hZBt3sQc
	Ws7ZtRlWkkJNZduyOm1VDPk1vH6nK/M1nVJq5kQHs8qXAdXLZUYmKKGJpdw90tsM
	C2EMjXDZo8R/cWVs3XFxNRVYQbBBlm7/lOLArer1Lrn24d+rN1SGQRnNQCI5Rw9f
	Fa25WO4veLweNr1CMSTQMQngAITJkT8Idtm6uvMb3C4afVANYD8tHJe9VJnp9O7I
	l6oxFF//NAn5BdsooZx1GnCGUsWsQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24r1csy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 03:11:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEisbu7qSB7SnjMAK8e7ldC2qR6Zze+g6Nkxy4IJJpXRe8mHvqnT8ggMsJNww4JhkBPc2TaRllWJsicEKFohBT6LAjpNZsmJSJIlI2u0X883ea5otmDgKqVj7lOYHc6vchdLmTegFeTxMN/tAZbkBA95G4Pv+AzAUVfmpupPc76/iy8QNO/KvUXkc+sbuSQk6UKen7lcKQCLCKGLYplh834ZHFHEXOv5eF0X5Me+/ZQs3jzQeGwI2Ydh+KUamDu6fVigR47zZEhiVyKxQR18beeotRSgytRi5X133y3BVhWVSoYLDbNoLJyUO77EMaCl8j9mOmHa0cDgsu20EH5VPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtZR9l5DCEt7Vr59xtmhjqVywcxpSyQdVO+bzzCa4DM=;
 b=tVIj4z/noCKUYX4vatTdwqLGASX1aAsRYPefX+v4qQ0ft4wL0kEhFAQcj2p+m4P4pR55Mmfz6TJW6HR49jlXmUM+KTZDft/8lLtahfeb8cba54NzXe+5KxXRJC7FHZbwYBiwHVYFQXp6nGOQNlIdN98uTzny1TDmVtAo4t/PGqWjMcusN8kXAMGNkA/unGaWxYmymQG51kg6Q+FzOeiHzlWkIUvTnk1ql0BX8MNanQpXdr64Pd8U8cNmZKZ0+p6Xzt5EwLCmzj3neeEtNPRqhX3gRCkC5lNmlQ9TS57VlW/+8y7XwxafiORQUP+ffeBzLjaWpOGrStBgAkrdWHSptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtZR9l5DCEt7Vr59xtmhjqVywcxpSyQdVO+bzzCa4DM=;
 b=wRZwifjWbddKJKbd6V+O2yEDYYpWfMGZESBskUfIjR+8BxadJZJzAnAg9hPWEbBKA5uVZd1KTQQOhK3aoZ8lY44oewZuMvfFoKqcUY1hoW/LNrOZ7ovuS98Ej3t6CPYgcgf1l5rql9CYYOi5vLlIr82LjiEX2uT8f7reEDqVI1s=
Received: from BN9PR03CA0579.namprd03.prod.outlook.com (2603:10b6:408:10d::14)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 08:11:16 +0000
Received: from LV8PEPF00000068.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::66) by BN9PR03CA0579.outlook.office365.com
 (2603:10b6:408:10d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 08:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000068.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 08:11:16 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:11:10 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:11:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 03:11:09 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S8B6702428343;
	Fri, 28 Aug 2026 03:11:07 -0500
Message-ID: <0e26d50e-b89b-4645-b75e-de80c2dde935@ti.com>
Date: Fri, 28 Aug 2026 13:41:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH 2/2] tisdk-default-image: add
 ti-vendor-kernel-headers-dev to DEVTOOLS
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828055034.1106316-1-gehariprasath@ti.com>
 <20260828055034.1106316-2-gehariprasath@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <20260828055034.1106316-2-gehariprasath@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000068:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d67060-c85d-49f2-85d8-08df04dbeeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cg6lnba6r45xXjwm/DUeIhpfGT1wHgjevJf7m6F9rT4dvXm0MpEUAkwUjBo43Gs5Fn3780SRIKobTPAw8NvgCcFsKIBvQWISgloYBBcJsDsWThgxFYJFHfFtmUlNWVww4QVD+LvlG1wx4WIDEqTUiUW7FbdHIuYJxC3wqZJfgRzk0dguNfp9gAg6mCoS9yXPZYhRsoj0/74sAioalh2nmrJPTa6+AzCI1PEWvwMRoq6JEZqnyMDwWbI9uVLm1AT8VlLuu518QxR0sJo846tZzbgw2rIuCOInJ/6pbsf0HNs56z7mGvamJJBXJ6Fel8y1oyNmRvoga68rfKHkeNe3Xz7dYurFkhfdNbMY6dR1Kbx8SrJ10ldR4/O6h8Zb14mOyyjSOqPnqlB3DMHAy5n8K52ERPldzLfvuVBfB278Ez0YFSFlmyykfAbemqqsB7AW+shse5GW/m+hdYpRcVfYmk/82q+vRpY5BZaiFQFek2HylbzgQRSPWeCrr7QtxU9VwIeAmkeKU4TQDasvbyYdkOeL5p1dAElVHcxE0Er8sgnWC5HarcU4cdRWUwHkym5ZOh8/oAqbS/EBMs+OJ2ETwoAsevkj9wBvHEcBlhPeGrYLN94JD9ERcOBt3BJNQFhoVVrL9nWrRg71CS+Wfjr5hf4vrnNdvpt0Wksf/MiPxXmijPILS2sWIlkzddYjTgnjMzJELNxQNyVBwIU31b5ePQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	slcDoGFDsGrgGOwUQpb2ex+9c6VmMaiL+ESkHbYvndy2J/m2/Dbjovxt36yXqfy9V1gbyfmTvG4pMBmIDrcoXah5LPzGjxGR9jepS8HiaXKqkuDQ48TTO834tsLrEWtvuKGf3BejQo4x8wp2DUmH2R+DrSkeRL1VGB+k0R7WRM46Q/WKQBB0bTrVRQMfq/pyo+U1QJ8dmtVU5LYSUIXhfHfwC2pGjW+mgGFNt4yMeJs0ACa8jH+ZGpfYA3MU4/BBr/FZ93BLFSC5dbSzj7DJyqvr8ThCir3cA+eCP6kPAad3JqOvWPJsHidUaG61G46NQTaLzWsanM9LnqmC0Liv0+oTaASwScXleLB9tjfh8qtQtSdEYBxN86gyiqat0Y82ik8h1IPZiSmJ5nxQMTd2+JBgIW+9bQgsJt6WKtwUMQpuE2GTS76YtYFokRD+ZSqI
X-Exchange-RoutingPolicyChecked: 
	vBNRIHrMRM8DS+RTKZptv42RWTk9hGKbAJcImpl+Cr9cq+Y8Gx7iNZGwfxN4yEjFCs2X6Vu7SweYZxrT3aoXXTCbnfz3Riul08o0v4p01F8zmpKRzMEnMTxUvIRWmclLKR0cYnRIkRpm3AcsRlPG8yTc3pGCA8pdejdgbeEJ/e8Gpp8/73kQ5NI2LNPiIzjVu7FC1ILSILiqmQQ2lDmDRq5Ll7ynDPEN2Leuw3WP4mocxFYYeUb7RSPVSLEyULXKnRWj3y8SZknhtxdusT5El1pHvc5gjrqFU3T5e3Gg5mDc9r/mZOTMx7Y3AA0CPoUas159+jpO1GNLHt8Kmz0QLA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:11:16.1672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d67060-c85d-49f2-85d8-08df04dbeeee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF00000068.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-GUID: 4PCOSwVXe3czbMhMJ-uKatm_aYt8jJ1a
X-Proofpoint-ORIG-GUID: 4PCOSwVXe3czbMhMJ-uKatm_aYt8jJ1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfX9+GWwkSLZYiX
 Pti20yrDXQy5EFpgQooO/+wnigOlu+Ju5gBSdNBKz/PVlEnKqOYzPm4aGOHHKkuVDhtTGefERV/
 lF97Y0Cqr6Eo3Fon+2P+lGVSVe0cQdva+qby0sKicnSg8eyPJCF5g+5XI8XqFYtw7YaqbcUmJum
 fNIObxK2AZrEX3ka4P4l7U+BPXpH8PPpvzs/kEV81PG9e8U0STzRp8E0DtzJzDYAArDsXoYQNY0
 lwBrVLauEqqIA3oxyqiELAE3ZJc7+M7fM5cmaFBM4ApCGZic0aFVaYa1DzvL892gdOItJVrzxy9
 pQ3SnEt+KqokJhchGV4KQcSAOI77lD20t8C5mFaIzVLMdFi+zMqNZCpUQsoOYCrGffnxCJJPldi
 M+xP27hwHWsgQBvq5Yf92lIeqxW1PgpMMv/aoA0KRhUpKMvFOjMynT/AokXpKevELAUWnEhUKsj
 9XDNO+PRo+HL6sq+jgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfXxPoeltZrgUGV
 gwsnfaaZ+y5/bbHgjqMWp1ucWO2IdjqgmFmzc0FUj6Bi/fnUlTHz3qAxE3Fq5hmLzn55fUdwpYf
 DqlK9sVAYU28joUD5n8DWQbjVBxW71o=
X-Authority-Analysis: v=2.4 cv=L6gtheT8 c=1 sm=1 tr=0 ts=6a9142a7 cx=c_pps
 a=F30aWN9Bm7kNfdI93JtEUg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=5xf1T2hDGtI6YKNWTrcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280069
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 08:11:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17619

On 8/28/2026 11:20 AM, Hari Prasath Gujulan Elango wrote:
> TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
> present in the standard header provided by the linux-libc-headers,
> so on-target compilation against them needs the ti-vendor-kernel-headers-dev
> package alongside linux-libc-headers-dev.
> 

Pls discard this, I have resent it as a separate patch instead since 
it's two different mailing lists. Sorry for the noise.

Regards,
Hari

> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 264d1b2d..cac6628e 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
>   
>   DEVTOOLS = " \
>       linux-libc-headers-dev \
> +    ti-vendor-kernel-headers-dev \
>       build-essential \
>       packagegroup-core-tools-debug \
>       git \


