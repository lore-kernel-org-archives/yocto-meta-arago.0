Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8EDFCE07E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:32:20 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70028.1772112732735065597
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MVNbNPVo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.13, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfUbFqr53oE3Q+7x3nl3CS3EWxBrfKjsvdYakaMMCIFNsmbSX+g+oWT6kXoJimANuSbpClROp2ZCfI6g5YkVWP21kFsg4ds0zZKScOYluNb1/d0qh6E/4w6U4JbFe+O2BkMCQjJc7uqFsy7DESDbueofVhMBcB6GIkd9FOP1uwLBzYCfIxsnc5LHAa3+UPenFXySXjS7e4DbUHFcqq0J0Vrnmf66eN9pSZ29NomMI51GB1vXIrTPHw7KYLwD6uFH2cbpvCFBC419akzP/JscvEekLBR7apl1VWOtufitd9Ky6P2RglfkfUYHPvlSMco3bWvAGU8wRwcVISKDuNl9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM6F3ivmdWY9/Cwkx0MSReiFGZPNjDdf4oYAIzpEemE=;
 b=E5JBI8M0K/oOtGDHoxqFYxJIm5kUVl6d9ER3RqB6x1aquzMlzvZ+c/I6pF537IFcyg7dllDfmZ00cQNSO4YV2iu6eUEt/5aRKhG6i9nflgnvWIakx4D+R8Mb8eZUcEwgkpFlFcKldQSmyYNjq4/z2dL9JH+TggE5kPyVNa0gtoj0H0hWKhBhcnVuMeChYE0o8xFRyk7OAOv0J/C1exlW0bd9XB/ex9RT1+pEi9JrNQYFkh/YJmzkYWIB5q5W8mlaGCvAC40mZTw/S7/z10MFXu/sFgTQe8k0y+dYlx0HkzMkpJxfCJHj7JHx2+dlYaZTvuVtF2CM7c7/W6368ShxqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM6F3ivmdWY9/Cwkx0MSReiFGZPNjDdf4oYAIzpEemE=;
 b=MVNbNPVoNoBRMc+NzyjZfixh8uS7PqsFTe7W079diIG35Gr5s4LLPj4CYdSvUbMhIdxRaNywKH9Xs92rVwY7R56FCTyMe4d5TOsb5svkQd2WqT3P/6F0egXn7yxm0RBaPJ65aT/GPis8ze4dM1poXtLlxIdFDvEwOx88cl+Bt8U=
Received: from SJ0PR03CA0203.namprd03.prod.outlook.com (2603:10b6:a03:2ef::28)
 by PH3PPF553978BD2.namprd10.prod.outlook.com (2603:10b6:518:1::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 13:32:10 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::fe) by SJ0PR03CA0203.outlook.office365.com
 (2603:10b6:a03:2ef::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 13:32:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 13:32:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:32:05 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:32:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 07:32:05 -0600
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QDW3FA1943317;
	Thu, 26 Feb 2026 07:32:04 -0600
Message-ID: <44eeb2ee-be7f-41da-a278-7dfeb20a6f2e@ti.com>
Date: Thu, 26 Feb 2026 19:02:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] conf: am62dxx-evm: Package
 k3-am62a7-sk-e3-max-opp overlay
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <v-singh1@ti.com>
References: <1897CEFF3998E67F.558139@lists.yoctoproject.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <1897CEFF3998E67F.558139@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|PH3PPF553978BD2:EE_
X-MS-Office365-Filtering-Correlation-Id: 67748b2d-12f6-45d7-a8ba-08de753b7098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	cjv+CRCokTe9XJFaIYIiccfKZZbHu6Kc3J29AmUw12N8hrC4pYd3DJPMj6EW1O2iLdP/eF9JBW5kqy6AwuIkSd2wrk9iJKZiJzDRKakssLoKy+ZA7fPU9rCrdzvxmV7YvCH2hsbOdjbhFbT0XEvXLT0G/AVG7dAPpX9qqAuisHc24rbKZmQyIiB17Y6zbXcV+yIphfKLrO+lCpCsm2Iw+uabL8O3Egjd1aD5TBPOCurwfVcKcjkRuMc4ISuL3+FsjD1PnaYcGRNw+CS0GQCceS6KyhUfGxD5TbgLknw6XA6GgapEYd6gF88ABD4G7rnuKUrpgu0rFnVjxhHfo32mWh9m1o8Z/afh/NSQNDQ7+LW87efk6dWNQx59SNeMEu5WaGjISFsP95GYKC3V5agTc+ab85JGzyonFDrm2pA+DxId2U747iUnsREVfDUopcxb7F7Qdci0w5E6qckFli7Fuiu6POcwnjr1pV7XomR/e1aNd59Wcfac+2bM/sN5ufxD7ga9Rc28a6eLrgsLmp/NbT/J4DnTLSI6rE2iVnMhgIhiOAkrjpirrVyJSPk1ywF7GM2zJyL77kUhhvhDU89W+0X2UwSh0SmwDHSCqR3IticH/eqbXmmhElEvSZC0s5O90JTyciqe2KoDfTIUW4M/EQnf7OhN6ppmK2Xs0gl+lojlPVFVRQKkJm9wYy6UaM1j0f/S6KBeuDF5eNyF0uBoZT7oulfm7LVD6REVLJkxuksHeBTMITG0TpW8usB9xefk1f9beLo7nz6CqamT0Id9cf74NamP88R5FVKktk3T9YhptZDeCeZ4l80Gksny3ERQxzK2Wev8FsLD3OQXy40o6Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+XO17Yjrri3E133GRRc3bqHWMDzb9I1UOxa9CDooINLFRbSMjCI8V++UTfYaxIqkkHCIO4WIu/NWOw2m3DRl889gMNL9CF4/OIVIE76KPQuVKa9yLcQ9cWawar0+nOKSz9qakzfD8eDoVJEqCIDF2XbibPy/HEixg9OAJ6TM+9/+Buf1OHepZChIlxOr9CLN7nzffh4XW/8guMjF4BmbgYBN1N/zkcrVmR/fs+9zOa84F00RPd//FIIU6Dvq7a1lLXhuMEvKkmxNNty/lD1OZtiSyZGpUTo3lEnFMfNRau6fZ+6VAYTkDl84271tZawCm4EOvaS2FzpzGM5zakEjfA1byn25+cGniLJpSH1JrDiQhf5VcCNwIdmLTuAB7G9PS9F7OWuPj62urXktYXAx46+vHT2Tz0hIpbktSkS8kyjticpmUVOuXcXivVTNd4zl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:32:08.4502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67748b2d-12f6-45d7-a8ba-08de753b7098
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF553978BD2
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17156

Hi all,

Apologies. Wrong mailing list.

On 26/02/26 18:59, Paresh Bhagat via lists.yoctoproject.org wrote:
> Package k3-am62a7-sk-e3-max-opp.dtbo for AM62D2-EVM to configure C7x DSP
> to run at its maximum supported frequency of 1GHz.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> index d19d4790..ef9df2f7 100644
> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62a7-sk-edgeai \
>       ti/k3-am62x-sk \
>       ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
> +    ti/k3-am62a7-sk-e3-max-opp \
>   "
>   
>   KERNEL_DEVICETREE = ""

