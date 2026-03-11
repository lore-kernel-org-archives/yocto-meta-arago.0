Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D10BFD88D8
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 01:32:01 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10927.1773192715611055897
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 18:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QPcrHbAL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.12, mailfrom: b-brnich@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAJY2nTVRbEwyWIuUVKM6OEnyLlWgJpyqHGfeP0Y0kXxAT9mA2CFQAu72P4smgh9S6CJBwZGM1Dvq30b/xwYaH4QWqaYapeeZn7zfreSTNQUSBrv/mefzH/5UZIc4oEBThZtkzLgcbDaR6TR3VyttArJu7SNTYDnz+iVc6atTkmpvVkp+yt0a+R5QE8yibbkYJIsx8ZDVta1RfAScfUOypESi87HVQQpT+xyvknHn5sjHNPDCaxS1xpYOy4nHjejD8dT3ABPKM2M5gbJPcSI3V9CaBR1dxiad/c+R/+iWWGn/9oasdQn/TpEpnLFXP65J3GJ7t8AwepJHAHAunAYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mkuR1kyRvJBFw4ufxvXWTgO4YMmz1K463MKXPB0uOQ=;
 b=jUDDxUQGSoyRvqWH8z88ZY99mME1KkVlxUIt3QXQOdd+6JdjjBmw0qYFU0Q9bUr8BwWEcBY2xqa6qVQWrwCJm7VokhobUZZqtYae4L6WwgkzZQa50zc4e3aR9ifGpzv5s3CIC7vpj+WHOMh6mKeM5jg3DG2yiPHXIiRYh3BbC/XLQG1tCORMuVFUgUrlSe8zsv8ptdZ/+QAPilWb543M+9wo+jbDSIt30IGWECVZG2JNoYCHnunWJ2D3aYYZJpu+eNYhBVG+eVbZ4jbzcrBD4aZu4DBrgS+ELtB+ENlhupm47Xphy2KqnGLPwtnUz3aWVWRdaOTFlPntzaZFkui07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mkuR1kyRvJBFw4ufxvXWTgO4YMmz1K463MKXPB0uOQ=;
 b=QPcrHbALYAG0XlI+tXvsKCcM3kLCIsAhr+WPRLN5DB/7n5QxlV4BN0mZYjKgA104HTOJ8yFDBGYFNWrnbDE6qOujoBUq+bF9Nmdk3Gbdaz4HEO9KTRCc8EtDyJq9nERN4B+GrTfKocInUwBYND29mU/nZyZWiMGngIPmXSMcuew=
Received: from BLAPR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:335::8)
 by SJ5PPF8C7834C85.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 01:31:53 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::5c) by BLAPR05CA0026.outlook.office365.com
 (2603:10b6:208:335::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Wed,
 11 Mar 2026 01:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 01:31:53 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 20:31:52 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 20:31:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 20:31:52 -0500
Received: from [10.249.69.206] ([10.249.69.206])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B1Vq1E3610631;
	Tue, 10 Mar 2026 20:31:52 -0500
Message-ID: <5f5eb791-88b4-4eac-8b34-e90b2707733b@ti.com>
Date: Tue, 10 Mar 2026 20:31:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-good: Fix Failed
 Negotiation in Non-contiguous Formats
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>
References: <189BA53B1BF064FA.2412760@lists.yoctoproject.org>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <189BA53B1BF064FA.2412760@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|SJ5PPF8C7834C85:EE_
X-MS-Office365-Filtering-Correlation-Id: b96e7af4-136f-4c22-a597-08de7f0df991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	A23MOHIYHcpgPM8DsKvfY2Xkx/W5OBP3vyfKfc5bxbCiKyMj61d+PyMLoGPUttbeuJe5hHu5EDaFhtGDt1H/oLMbcls2yHpJ7SWuoAI43TD4gtU09q8ehfa7h3Q99HFytwwXfCPd4frIv9qLOiodF0EFjDMqcLQ9VMKMMrcKNHOeHiJPpJE76N/tdBwOgn1KpWlbxXCn+QEdpjpznmzx0GdUr5iaW98Q1b2naJV/qy14tbWOOW6A/2WnnKcWTrCj4JaAlZtREEF0IGhIhyGBVKreeRRDyf+IntEa+82AEbvlMkQ0O7+WQczjs6rmDtS2YeMRlOQtdFR/gfdLLE3+u0iGGkcKg9MgI/FaB3jJmuRN8htNFuvkQaoSHy66bB9DtD5kKkIRbDeuEChpSjDI08qMhw4lMP0bOqgtFRuLnayTNsPDEda3m2Ba8SOQ9wqrjXEXbtFvTrwWkM77xsqPbPxd9K5tkMuETAOBOTWezMJYOUpqaQhnHBjcQwMqJmFOWzmb8q1jSbgQ826HbBSpFceaP5uBqtIvMSRiXuhRainlOy6W6m5Xk1w0fTBkCO9ASUnkavPiUJJJkm/9rVQA9GnVq/tAjXfLFFhlIoHJQREwVmH+1LfumwR07qaKYdsszYBp6dM+V5zbVqeX0YC71gv8vZz6VH6ZQ4wrhkC0aHTw9uXxZYfKaeKw50YgB33ZUolQDKMseg6ZvESjcEIK3GcK/VUiFf3dFL4qSjFsApYCOEMeFkQQV/OGWdWeP6vJQTBJRSzTP6fK0SJkroDG1Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q60UBJsGQj2mD24BD54h2QXrSKFG5wGRY5ZRLtGoohnJLulYXiEmd38BnMqEs+zeCu+Amdj3oDmbqN/HIl7JsurE12PVra4FBZRKqYnWWmIyajUCB+G94Dlv+lC6nZiiRNzV8/+gAoS+rBYFunAGjtUM2+ypZZL1Fj7fg1+bhwMSdC4+1K7V0P+WAOXDhowL/YRrXmzmpogGxXWUubaMr9RliNMN5uXvRsth8vu19lSQVXyrCgZi/d6dKj9WSI7/53avRqaLr5DXdJUJnKQycg5h/u5NDNO/G7LihxGVET+wBRbFmGYNudzhyIO6IHuoUPkBjUfdK21B4GB3JORsGItVg1P4PeA/u4iz0zylwNdNvWlXyn47LhMP3GvlcUYj/Yysp4etumM8B6OkzjJLA2v/lEEJgWOvSjmIdalOv+sFmuo7uqAHXoDl5Hj0gsVs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 01:31:53.0390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96e7af4-136f-4c22-a597-08de7f0df991
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8C7834C85
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 01:32:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17304

Hello all,

Forgot to add master to subject. Will send a v2 for this but will wait 
first to see if there is any other feedback.

Best,
Brandon

On 3/10/2026 8:29 PM, Brandon Brnich via lists.yoctoproject.org wrote:
> Upstream gstreamer has introduced a new method for mapping V4L2 buffer
> formats to their respective GST format. Previously it was a big switch
> statement manually assigning all contiguous and non-contiguous variants to
> fourcc and fourcc_nc respectively. Formats that didn't have both options
> would only populate the fourcc. The new mapping properly sets the
> corresponding fourcc/fourcc_nc. This means for pixel formats that have no
> contiguous option, the non-contiguous option should be checked prior to
> pipeline negotiation failures.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>   ...pt-non-contiguous-if-contiguous-form.patch | 36 +++++++++++++++++++
>   .../gstreamer1.0-plugins-good_1.26-arago.inc  |  1 +
>   2 files changed, 37 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> new file mode 100644
> index 00000000..db7e6f0c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
> @@ -0,0 +1,36 @@
> +From 8d29018dd31be2045f6724db0942ae1a7da0a789 Mon Sep 17 00:00:00 2001
> +From: Brandon Brnich <b-brnich@ti.com>
> +Date: Tue, 10 Mar 2026 19:47:35 -0500
> +Subject: [PATCH] v4l2object: Attempt non-contiguous if contiguous format isn't
> + present
> +
> +Gstreamer previously had logic that would set fourcc even if the format
> +being negotiated didn't have a contiguous option - YUYV for example. A fix
> +was sent to properly set either forcc/forcc_nc properly. For formats that
> +don't have contiguous formats, that would mean attempting non-contiguous
> +options wouldn't happen. Attempt non-contiguous formats before erroring
> +out if applicable.
> +
> +Upstream-Status: Inappropriate [TI-custom]
> +
> +Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index dbfe4992be..b4a7c32f31 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -2167,7 +2167,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
> +
> +   if (fourcc)
> +     fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
> +-  else if (fourcc == 0)
> ++  else if (fourcc_nc == 0)
> +     goto unhandled_format;
> +
> +   if (fmt == NULL) {
> +--
> +2.43.0
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
> index f64790bc..9e418b86 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
> @@ -7,6 +7,7 @@ SRC_URI:append = " \
>       file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
>       file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
>       file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
> +    file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
>   "
>   
>   PR:append = ".arago0"


