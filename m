Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ED8F3C265
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:46:37 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14615.1773063995591988802
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=S42zZuEX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjdA8ywDUGQ6jjVlPqAcT/JHg6Q3Dr5AIyVnX5pqvTkpQT19fjuYxX9YEdMQddH/6BMHdbSmhRNU4DHDwRYXfqYxzSRY96AezLm9ISB1QzjgVt/xBwbtMzY4nhvUTJJB/dZ3aixgoa8k3OoAICCLiLciZ5hfXUhSuMOpy1OXBgkjvGUwPC3oWf20E+kpgez74n9XRfJoPFrT8nlCKmZ5fhLg1qOBpc/+c5AMTL6dONPquYbIoUH8Ii/szRmxcvPT9img5hR8MoeqicYisyHpW4WT25+p/+5apII8GeTR09DaYCMXJ5WfPlUE8M2yvHaiAO+HbEzV4x+K7aJd50Rf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsfD9UMfyKgLWsrtcOySsR3WCAiSaXl9xt0fbc0koLw=;
 b=lVSMZzhgyUK/FNGqfXzg4upcFkRyROsAJArB8Py6anrEWeCzQKvqKi5N1VRwFfj50tc4b9QfMVSuVyLcEoWwYgedTmnHj9lWZ+ypGAbsHAU37v4adseQi3kApoE/dAvuCFc8PchHEGQOqIX6zrSqowIeoePV7uJxOigCzOftPa/WW/DCzf7V+qz+5TyZdEv8kYOx5lmeTPSGSFMlvI86TuFikrgqC4wrK11rIRSufj4U82n2Oh+y90Rcd4v+3ZcQC9MZl7K7eVtYZMWTBqpIO5XzVHbzUARUVkGUal94B0a2gMVJ47GRvNZXjZ/YEDwK4rp+TJyBsDxs4vCiol4DDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsfD9UMfyKgLWsrtcOySsR3WCAiSaXl9xt0fbc0koLw=;
 b=S42zZuEXzlg6h8sOZ6T9W15PqYlQHtjxILF6ehH6uQUyUWZkbGq0Mv0BQHtz4HPqvIVfE8h8lPWxf6KrsMmGZzVljvUnq3ZfH9mEpIvIGWZfgNBqSuZO4WfnwISgSjGHddI/VTehZq2N6GR07ruQqFIfbX+iMQ7/2gGYWotcs4g=
Received: from BN0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:e8::16)
 by CH3PR10MB8216.namprd10.prod.outlook.com (2603:10b6:610:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 13:46:32 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::84) by BN0PR04CA0041.outlook.office365.com
 (2603:10b6:408:e8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 13:46:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:46:31 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:46:28 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:46:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:46:27 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629DkP5a685708;
	Mon, 9 Mar 2026 08:46:27 -0500
Message-ID: <a0c95c4c-3747-40c9-be99-3902a939baf3@ti.com>
Date: Mon, 9 Mar 2026 08:46:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 2/2] kernel-selftest: Add the
 pci_endpoint selftest application
To: Aksh Garg <a-garg7@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <c-shilwant@ti.com>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>
References: <20260309130109.52886-1-a-garg7@ti.com>
 <20260309130109.52886-3-a-garg7@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260309130109.52886-3-a-garg7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|CH3PR10MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 0493f9f5-1412-42bb-9315-08de7de2457c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	FOXLHviGCkQ5fRRTQrjiq19G3TIKV5ydofVwaeZ6jwEOA1evxbgcXAmq5mIvC3Exbbsg0K9pw3J54CbIZSL1cYM6pM1ljQjFDiSupE2cNklwIwlVlmAln2WllzauJX9IrSzh2BRAPOzB50HsaFzUNFuRo27+MRrnwIuVVHKWIpq/UjgsAnRIK6hXjVz3sd1vai3LVDRGJFe4TqbB+6c4R2BLjvBDIMwYJ4eMujA+oannXem6ix0Y4ol9Yc7i+XrntaWxPQIBMyyWCyLzEO9iOsGOF7VNZtbf9hLe1bDmnBtsGsDaXDurQ4feU4QeXdMNShWEVgcPm505AbSD7jICDpB5u5hrenfi4kThztKQIsVeP9CNq055nL8jMD+0rzxJpbuJY6/zQd6EyM0o8OE+Q8xijxVcRFkwQwWjsGLzP6Gm9LW0bceC9F4aM37HKXj0P8d58JeonZjddbqDb8epuvE2jovH1xNM4OZDxxbAAvrv2sf5m2bK2MzFbl4CLRkOXx0MhpxhWcTZFhYPQOfrpTaqH+Rhh8R7xa/c4flW98islQ5k0LGFmwI4zNR6P5cW3Y/REjgB0+ugmBeQXCGYIbDTXRE6CcV5L5joDzjETkzBv9z/XAavF7a6JS+p3WPqqHKDmQhrTp+1jOHgpob9JzKcWUDPOVpYy3pwx418Y6UUrwOIwJ8lzEhWTOda+NU4WftqkZBxo25NJuLR3p52nPsSIysY75NREUhovJ0kXV6GGjLEmFeaVbFPuz0B8rvuBcZRJg6sKuqP00mCew6BIA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aej801CWhrL7/A3S+RD1SybwXrdSMtzkZ7bmk9LEz9hCRpkxIcdi1rKKHdyFEuivFtxnGZ5/UwmAWgbPB3ADPyE+iEYZtc+DRPbVsYr/+kxovCNoc5HyKNWQZBx/SogNPM0YJDqxJ9m2ZTTDolwa6+q0eFBB9Com68KLExdnI+YLaFXidoBbATdb6HiJ8w5ORTKGe/ggRY5HQe/YPamVn21Mfh4jFEScwL5UPIe1KZnaTH8mTY7Z9S+FKeADPY/Bc3lZKEFT8SLx3SH95Vb52fbHy9IF6KSKqOn+xMB9qhBIlXc/RCn0Vi0DpTVnLIjG+2EusG8KGN1MgDC+UyMaosBsvkkPgdJ9ezl8RzhYhYytxidgcBdztanlrALSv5Df6EEyVZVGg2cav8dXemNEab4ZIFyu6G5KABGd1wflE5drTYQQfzrCWbfTOincFj9Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:46:31.3885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0493f9f5-1412-42bb-9315-08de7de2457c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8216
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17296



On 3/9/2026 8:01 AM, Aksh Garg wrote:
> The 'pci_endpoint' selftest application is used to test the PCIe endpoint
> functionality. Add this selftest to kernel-selftest-ti.inc
> 
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
>   .../recipes-kernel/kernel-selftest/kernel-selftest-ti.inc        | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
> index df5ff68ddc90..9f543b126ab7 100644
> --- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
> +++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
> @@ -31,6 +31,7 @@ TEST_LIST += "\
>       mincore \
>       net \
>       net/mptcp \
> +    pci_endpoint \
>       ptrace \
>       resq \
>       rtc \

Similar to the other patch:

TEST_LIST:append:bsp-ti-6_18 = " pci_endpoint"


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

