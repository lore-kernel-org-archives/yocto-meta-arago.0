Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E967EEF8FF2
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 14:53:05 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19994.1772635981192804197
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 06:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WLc/hgw0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.3, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM45qxvIUS/49MlG6ghigmYKpQRh0wcApsUkLmmTiBVnIec01iP5+GwBepxa491cAp0pEbfIY+OoPgwdM/YZpq9dKWM4rTgZMsfFUgVQaHWwvudkWwClcaqU7/UspJ6GmyrOI7wiIz4iuKD04dwyMBS7NMtqoTT0+KnuzSy2JCXNJ33wA8rHGbXdRiUDWtTcf4AKvu53/lNkcNU8UMadfkMTHx3tVK48+7L0CBwndma2XGNM/mFpX/lGpW/j1idngot77euAlBfWec8PjOp6Croonf9vaJJiUj1+vXON+6b70VYUKPicQLf4OxlnpbXic0FS0nNfFBSk2O23UO84NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZUkjzH8c5A5T2N5ei41RuPWolQT8lYnsNCwRbnldCE=;
 b=mb3m8A0orzSNj7hnWNzYX/IobIA4Zqfjuu+nbTzHYFLZt/Ls6DcGwUEmQgssdDsVCeOClADYNj+QHf139v4KmCm5j7qhH9/HzYR1ytdWAt6oBpQh5AH8U9vtpKAbwjT/O9d7NMdpzTba/Gwb75Sm+BGobzoj+gJRjs7UaD67udkq2WrOQMKvcd89L2wo1QglqldmtBkrGt9AWPAe/Ee9+yQ/l6tkN25/n6TTEh0G9GVnv3W3YLpMNBsSept1HIe+fnJkoWs9eSYB069tcAxqWJGr1sqGgzUsYkaAJgTpPabJBBcAAoL6nTEubO3Y/BWhvNkxvJUyt2+qBELbQca0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZUkjzH8c5A5T2N5ei41RuPWolQT8lYnsNCwRbnldCE=;
 b=WLc/hgw0pg6xAXXAnQOZH5oezUHXRBEm19cQop6uPcvR5/ORjW/HlVdGviIexyEkZhjcuil6o55PhP2hgQu8JiY8Pl/hKS3YsNqfP+SfoUxCyLG2NN0aplZydJNKqnGlf3IQckPrrsU/BFdoz478VyprSF957+5gZzOUHR6SfT4=
Received: from BN9P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::27)
 by CY8PR10MB7337.namprd10.prod.outlook.com (2603:10b6:930:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 14:52:59 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::15) by BN9P221CA0029.outlook.office365.com
 (2603:10b6:408:10a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 14:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 14:52:58 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 08:52:58 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 08:52:57 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 08:52:57 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624EqvPr046410;
	Wed, 4 Mar 2026 08:52:57 -0600
Message-ID: <fdff0404-0fe7-440d-a214-7d4fd5db5437@ti.com>
Date: Wed, 4 Mar 2026 08:52:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 0/4] Migrate GP AI Stacks
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
 <20260304123522.3620841-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260304123522.3620841-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CY8PR10MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2fe101-c64f-43b2-a82e-08de79fdb9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|4022899009|36860700016|34020700016;
X-Microsoft-Antispam-Message-Info: 
	SdeP/OviEKXWW5mumd+6TY/M0gkP54GM8d7fyblYMP7MTG49nAyYHpKhuTW5t0A23MjGhRsU5dRmnlthS/ndz4jXUIX6eFbG0u9bhN/m8KX3TuLuo4AyoIUVY8u3ttC2TZm4MZzjFto/8vBws5H4+xBGc4xeP2K0G0iZdRB+DTg3J7x/KjY+Drvb6LA/yebLor9jtdhpINWA/ceQX5/Lgrm87qF+fjdcDzgqFn2pd/jR9vOdE40dXoboKx3fp7REMx9EUa5uDOuh8d7zisUZHKV4PJVTy6Pw8r4KxJpni4yStU45oMG90baOMyvtPk8WwzzZhlWHwjZHBbFpgQEpz6tULc1zjdnLXYzWtfoJinzOiAh7PCSX5puKa+mtAohulINIUawHwmhekanjM72OSdDrd5lGQYvlVMRqwbjRWMWTSWUN9oLHH8xr52drIKKEOuueilLRQwGTsxOmlKWRdGpVMBGp8eIsxeO7TeXt0EyYD/aXbVqL1cjYPBeowVLIIw9oTkb83hiv6SUwdc5/PdFwREKGUi16oUuGRQklKqdj0hzzaQH7hQ0lZaf/kwE7EHsfA5Oak+OaT2cPh6zy+aIxjXjjlL/WMouJddNHBOeg9SO+apDE7LvgxpFrg6aIv7MCtlNeNKx2iL2Q0T8/ZzceBI4yfcXnDMLI35D5oTQaB/Rp5WoV2+lFopSJ9NC/CYZAg1rKYRUFkGP9/1BR8Xi/o6GUKALZ/6tVmWEoosY=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(4022899009)(36860700016)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MLCZeefGmG95Js5cvShYaKozu8Q7CJXsvwP6azZD6aNWi7xcvp979lOLSQqEPLb+dOsvM+I/y3T062tQ/oeaBYt0Xe2VuqHwmCiXexU/KwUX/ne7nnXT/SiOFAGR7hfAEPqtHYJYsya7H6dsmgNtWnXDyqlXrt64DVPbt6O76vPRam35y1bVSZtjgN81B1WJ1kkbuDK5BYUlWEpCTG8ZCW+I4y1JIPmVnr0Bg+uGsHN0cwGHywYzs0uaAhZ3jIgZVq8dXrfZMP6keCVCN+NM9muXElMYL9/dtrInI1wLN4nnjxeDQ1CIb4E4Vnqr9p9/5Y5g/qzTB8PLeBjgxV3UDRmxeSMv62tjQhpoVESKSmy3eXB2x5db60zKuAvE1rD4SVVZYd2YwQ4BXp9fUBwgKdno69HQfbPGQU1nqJ4j1eqwpM4+bikCX9OTlVZcOCQF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 14:52:58.5315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2fe101-c64f-43b2-a82e-08de79fdb9f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7337
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 14:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17219



On 3/4/2026 6:35 AM, PRC Automation via lists.yoctoproject.org wrote:
> meta-arago / na / 20260304123221.1450993-1-p-deshmukh
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: FAIL
> =========================================================
> Patches
> ----------------------------------------
> FAIL - [meta-arago][master][PATCH 1/4] arm-compute-library: upgrade 24.12 -> 52.07
>      ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> 

Please fix this.

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#license-updates


> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17217): https://lists.yoctoproject.org/g/meta-arago/message/17217
> Mute This Topic: https://lists.yoctoproject.org/mt/118131006/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

