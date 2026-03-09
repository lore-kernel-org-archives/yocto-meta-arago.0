Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317DCF3C261
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:39:57 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14447.1773063594822724950
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gFr+8yDe;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWj1WGFcOdAdysCkH6BXFnG1KCtGysYH9pmrrFAxD2NV1u+AphjoJ6dceAr4gu/TquU8w28uAeQ0RufbQxTKZveW1hI1dskTx4g/+ltRq4Fo6ypFkphCCiq433dUVTM8MWDPUgMb6yqL+qyX4i9kyt3hamPQAk9bftrGp8ccEmheGtkcpweRS6RZktQdKPimgLyWOXdYDT0wW6dku51hhuzc/jFd4kIPtP7tdDiTZZ6BSNoZiqqHIm1vcfyefElKv1h8wChNo36Qa/ZWTDuPcwVyg2a9z2tFJO8btklKNJZa8nbJhm5pOM+/hBb1MUpjXOlnNUSIz4QKqyx0WMhJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1hcP9wC3LoKzwGNuylldr+LPTSN6BT1b2/1Dr3wdbs=;
 b=o5krHEGEoqyJNG/Gy1ZblKdF2W8Z7hAeB5WGyDcRo8zSVaMwVAckCf0ntqLNT+HQJm4P1SNe2zz+HB7FAvQulrg5TF+mnUXvNVuqiAu8mq14gpMaX9WtrWqyZiaOCcPbtDWgQUPaKj8edl3duAFPOO2a7JI/YWITtcMoEyCNyVeCGLHK2liQYGa6nUz/UA5AFpmks80Jvn5ZDNG5Vkf7fqYM3/QxN+i15+NV7QDuUiZ4+Ny/XAExkoEK99tGTQKGp9v7kPpLgRGRHt82lHc4bP/ftMC17kaDJV5q8SIZz6O8/q11msal5q7AyD3onHyjv5qxvddZOeTz98FWps2D4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1hcP9wC3LoKzwGNuylldr+LPTSN6BT1b2/1Dr3wdbs=;
 b=gFr+8yDeAk0u3llaQY5IghQes6RgCQW3gCn9zC9YfAbpK89cCkifAre9hNTkzzPhSdvOe1GSX0n01WW2FUEQtXWYqMYwySEqO+vqQ0cwa5xRG4933yQNEFdS7ybAWelg870eigV6vpxAZqERNaj3vu8qIdrAwM6clyBtGBOiiw0=
Received: from PH8PR05CA0011.namprd05.prod.outlook.com (2603:10b6:510:2cc::28)
 by CY5PR10MB6239.namprd10.prod.outlook.com (2603:10b6:930:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 13:39:51 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::9b) by PH8PR05CA0011.outlook.office365.com
 (2603:10b6:510:2cc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Mon,
 9 Mar 2026 13:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:39:51 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:39:48 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:39:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:39:48 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629DdmrS676669;
	Mon, 9 Mar 2026 08:39:48 -0500
Message-ID: <89b5ca68-d45f-465c-8c25-7174c766e0c0@ti.com>
Date: Mon, 9 Mar 2026 08:39:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/1] nnstreamer: Skip buildpaths QA
 check for source package
To: <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260309061254.3942533-1-p-deshmukh@ti.com>
 <20260309061254.3942533-2-p-deshmukh@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260309061254.3942533-2-p-deshmukh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|CY5PR10MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abf5ccf-7748-43e4-c348-08de7de156f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	mlVE5kNmn34pDqxLYdw4IW30GHJu7IDC1pUHouIBFdwS9jlpEqy60TAefiPZtCDHsZvSkiblvvTjLeCgMdOfZrIF7CZ+OBHOfyCZfx18E+EvP0VIgFlc5XQmLp+M5g9QITFLclsFrn0JVp7OwvnwlXjIVU7i7WMMhB6JAsELQZiA/sxnGyhiMNSac0BliHBBVjzJXhac9ennGeno7EpcfBgNmAuPv9+YPx2yu+gRMf1wueBftS7PoQOtXbQrCImnXqGlietrsgJMjl6UDG5zB39P7K23q1qyE3+i85Mr6Hk5Y4SMTvYxSlVP4S9HYCTLxiXzNob4ILiPEgk3PqXnz40GqcM2xHWXet4COCF5OfVMbY/xl7F1kSMYqNZeOIDsuBvdx22O7844lwXkQ5dWFpLxR1o8ySRmH7ZWEUNnhMYjVI90bmoGUVWwFcdvAqYK3f49kUYJcylRCZbJR2b8VpK+9DTvtFcyqE7ltd6cfLjf3QjKOGQs6KOKn5ZKZnFuqAA5txjEIL7B4fwNZfeGDtMm9dXwfVb0ludwV6KyUbkKDfRCGbgKCyN3M2h8eUu8o40yu3ZdIbSiimZ6OlTIYWlPGleanV+1Y/rQiLbF+Yf+K6r5bv0dnB1TllNKFPNyMKuVkcKJIk+KD1v2yENfjxhwBnQjUvVmmYSMbBZc0ZaeDGTKwMOO0of/dWAnOsH30A+O4HZtQ8exYCfKLJyL6b9sNhXHz923pOye5Gu7c4oXOF3aI08rqfQGIFjYDaaJvxVfN2oLGJbBIGgC5sjIYg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fYfbmAJrssWbZWGwOv8hoVOcMH+XUQjBetzHGXLoiXq/+4UR4aYvLXk38NRTVjmDT6KBy+CUSTEi4xgSKXtw7Q8XAOqpfRLtNdNB6GqzvyubajsfuanY5iqxdiVVYNqF3+FF5eur1bNCYxqzp13tM5vpcgDI35gvkpj+EHg/MfBt6/+O3U8GKWwEqptqMLB4mARJGXw/oG6cAjVf14kzQhocQ6g0CddkfogjwsxYi0iFDUkUGdY58pvIYZ1qJjWJqA/GC+X/NI7/VMEmgnBURt7ng4fL7fHWTzXT3zWSrt0g+xQmoWDAZGD/+h2iROT9o38cA8PPR1WhQFweTp4Z8jZotJuwh31SGFoAckwTncBkCiKZgdQ25Bv98QLQIScbKvoJJP8wkfqbwWJuuLMLj1JDkSFzVKYfHmoMJjrISJgv4YhsXAZUfplLFh3MJHsy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:39:51.2537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abf5ccf-7748-43e4-c348-08de7de156f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6239
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17294


NAK.

We are working towards getting meta-arago into position to be Yocto 
Project Compliant and reproducible builds is top of the list of items to 
support.  We need to fix this package to not include the build dir in 
the output files.

In fact, we need to figure out the nnstreamer-tests issue as well.  We 
can't just slap QA skips in the recipes to get around build issues.


On 3/9/2026 1:12 AM, Pratham Deshmukh via lists.yoctoproject.org wrote:
> The nnstreamer-src package contains debug source files that reference
> TMPDIR paths, causing QA buildpaths errors during do_package_qa.
> Skip the buildpaths check for the source package to resolve the
> build failure.
> 
> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4 -> 2.6.0")
> 
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
> Change Logs:
> v1 -> v2:
>   - Added fix commit hash in the commit message.
> 
>   .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> index c62589ac..74d72d9e 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> @@ -64,6 +64,8 @@ FILES:${PN}-tests += "\
>   "
>   INSANE_SKIP:${PN}-tests += "buildpaths"
>   
> +INSANE_SKIP:${PN}-src += "buildpaths"
> +
>   FILES:${PN}-dev = "\
>   	${includedir}/nnstreamer/* \
>   	${libdir}/pkgconfig/*.pc \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

