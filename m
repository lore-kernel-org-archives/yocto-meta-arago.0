Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1CBFD88C5
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 22:24:39 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7455.1773181470978842295
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 15:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bVSQU0Hi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.55, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c52gvhxZ62JHavlNcVXR+sza+bnp3YgnRNHknFvuWO/w/RRL3nWxIYZHHP94rIF3I8h05Mj3Jn/rr5rNXE8aQY1kVqiCIv+VdMaNm3nJYSYHa46WpzgLha4muEOW9GBI68cbsA29XHQ4iDVpf1Tgk8QXSbooYg6Re/T2ddtGp5IdDk2nQCIsdLb/FfpHklsH/gYsccSpui9WrY5HC0d/axhCEcTWoafun9dhZcBX0sR7CUVGosLc65ExiNP4S8ysn7B4s40O8/LRHeAn39+8o8NFOmq1ISUM7+RpncYjDLeDFNVaL7T8Iqk8yTBF976pSCtgWYcfaG3n4tDv3Rvv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhMXaSJOqrPAAZLzZXH8gSxNXkYZoBQpFeauRymkPQA=;
 b=hwI6MXUIQdPm7SunFKD20HYbr50pPn9ZPySzlPncDnvoTsnMzt+Hkz8Xogq/ZYBlzYVHtpwJQzb2pX+BbHH58cTvIBqkPnr7kXKAS95qFkDPLLP2+HNtJsRktU18846Bmcj3GktBuC4UTlYlVzRco4oRbocT/9HrrUhj2HYJElYm8y2OumoP3mQGViEHupssqBqSIhsQa/40cA3uBai/S40w1F23XkM6DAmud7CWCKkNkw8gTtbd6M/azaE3BjCi1502zuKKhHO0qm04PL/Q3U5TqFnJcknOM1hEjsUsFE/38885dBO6ftPb16YO2qbX8cwp7a2/woOEkLWs3s52Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhMXaSJOqrPAAZLzZXH8gSxNXkYZoBQpFeauRymkPQA=;
 b=bVSQU0Hi2BsD0FLkIej+N92Xx/EIO4WJn1wM3ZBfjSJX2o/q2BuZj47gWp/eHS/r2kewfCbVGu4QpNMHDsUfs1YpTA9XPmKZIoj5W1l7ea7kr8IDPJYy8N2MxG0tRqM9OvkZnqdIK/smDIshUl/ljBc9xsnO8boz0ucbdy6meM4=
Received: from BLAP220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::6)
 by CO1PR10MB4483.namprd10.prod.outlook.com (2603:10b6:303:98::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 22:24:28 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::ec) by BLAP220CA0001.outlook.office365.com
 (2603:10b6:208:32c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Tue,
 10 Mar 2026 22:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:24:27 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 17:24:26 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 17:24:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 17:24:26 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62AMOQp63372994;
	Tue, 10 Mar 2026 17:24:26 -0500
Message-ID: <e0c7108f-2c87-470e-aed4-013cd3e65472@ti.com>
Date: Tue, 10 Mar 2026 17:24:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] ti-test: Add request and
 websocket-client to packagegroup
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
References: <20260306211447.882107-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260306211447.882107-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CO1PR10MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2ac088-00a3-4ac9-5c32-08de7ef3cae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	hcS1ecLOZlPUKgN588PbCzBMQ/HkLylC+lSwyxoEvs9msxr1+jYTkR5uGLjsqnmGiR5reb1pb0AGp+KzssofAWGjv7XTuHfza8TxmyzJa5cxOQsaWeiLI8/Vk4Jd8Wtj04GS8OITSry4wLP9E9c8CalGlKIzHck42lZcRqfZZDgsGkO5B4tbN9pN/AzhLiT2kPQ2ul5rQufQDzJIQnfF4j27NjE08Zecl7g0ZbOTB0i239842MSxldwOCOxPWA6OhEgv8TZ+AL/OnwVW6+17B7dhIODPFup1oeK9NehoGs32htDc0RKw2mTXUeXQ+lO799o5EPBmqKsqmu4yHyPGO3MAUGyTYXNu9EsLtXMHnOq5QE2UQ7d4dTeXIg9bHY6RJTGxIiSRs6ubIpK5WAihd+l4AxNTlpknMKTA9JQghKdXcrF4QrPUDGcvWt41g0gnlijf8WJ2ohm38A8eylh+KxJOgxb0f0HtfeRo06ABkrBojtgInMt1N4NfiIB6MUKZck1ikJjjRoNw1izAmdMiltDm1cmB0ea2cEYuOQs66W2mxTFwC8f3a39NgYCRxp1Hi2WyaReAM0EN+sqgI7PUWd8roe+S3rR2I20o3k4Fis00Soq7QT6bmX1o4zMk5J8sSfbryB37nO4Rfhmz3iGgMvPHeF4+rJgwyKcSxLzEDzq/hPkUIeAchdMYhUUnHgX4iN4CI9gwGU1dNEWG6mtmCHx2jj0lPotX/AlBI46tVeQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RgDQx2Eelvm7cuM6l+xuUowUx0onVX4N2ofpWWaBX9UZOAwYo4J7fa9LAMhWi651G+IF5yQneQalFrSJ0luj1Lg0Fpr2ilNWNKcK5p0OFT8V239UG2ei3NJgsFh9GhHCJmIR5qza5MI5Zkes2pRyt4bMp/eImK/zieiE7X91wFokdkoHKSmu4DQRCc0tP8Kg4PhGPRRPRcWK7WHOGfwpSefRa/VIOUiU4iWpWpdyxqXYFqXxyptI2OihW7R3cdXa42AZO0+o1XTLcDgD4Qq01VbdxVCACL9tAIgusM/fIjRllrXGxGR9o8wgUGkuRlgquzRYghj0l8HvbM6xcTmX/VzLg/+QpNSVg5TnfDWTyc2bkfaF+bmvSOoCyd1fGAPVzY1aalqBJqyWb2Ty9qDdiCw0sjWkHAx86fQyiQE482Ez8Ef2wnTDbSc0nx5JkS7T
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:24:27.8397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ac088-00a3-4ac9-5c32-08de7ef3cae7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Mar 2026 22:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17302


What this patch even tested?  This fails to build because 
python3-websocket-client is so old that it no longer fetches.  I'm 
having to send a patch to meta-openembedded to update the recipe.


On 3/6/2026 3:14 PM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Add Python packages required for automated Chromium video decode testing.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> v2:
> -Rebased off latest master changes
> 
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 65cf7f1e..b09ffcd9 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -72,6 +72,8 @@ TI_TEST_EXTRAS = " \
>       python3-pillow \
>       pytesseract \
>       python3-numpy \
> +    python3-requests \
> +    python3-websocket-client \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OPENCL}', '', d)} \
>   "
>   
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17278): https://lists.yoctoproject.org/g/meta-arago/message/17278
> Mute This Topic: https://lists.yoctoproject.org/mt/118178594/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

