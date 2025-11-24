Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C865CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 14:48:08 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18295.1763995682609707519
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 06:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=LjXb07Ex;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.70, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mggkqb8zNL4CZqRVKOmBBU9XTs/CeaMP2AjVpHETG7dX4N3QDBXx1efq5/fxgnHYS9UFgklu5bwVeUaDGELYutDaDTjFtvJpSZTnRwGt+xwFGaFT8iRS/pJiJ3gArw6YLWnA4vqsAKKkuh8H+YCJOoWo+BwUNVJaEjAykdvZxT9MR1nN6LNj6vfTn5VwkG0rN4NPlZeA/FQGDZSXZAMClLqHAxI9Fe++OM4iRroZ8PfAfaG0ITp5j3Edf83FTYE1QZektG7SMQ8asUXGy6jnATgAaie69pPCpGsbq/XectC+lVF3N1qkLSfdY1kfVyziwjRzkDC/8Qf8tK0XFOievQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRJmE0rYlLFoPD1xMY6zDQxY0Ohuw75Isq6wjEvSW2E=;
 b=RDhV2exosPMGM0If6Vm3OTxRSrEzWqo7X4Q3QXGFWkR0SkVTygn0ipRZKt+FZER7HlnsaEPzyZRQaz/a5Ue8H1FfPhi1SbWdZjvdQrmUwovKTCQprJ9KzZ1LnBssQE1e5af7AwbyNDPK7Nd3ZYybCwjspooqqGPcoT0HsiSSZKgUFqojXD2K1O81bPcOeT/4LRc3H7QZdnag98T4wYjhv+dtnGK6mc3uu0AcjVQ8NMjgO3Z9iqaBs68iQV5MBMAqwk7YYdWhnP2B2z9A9UrQnItGapaoLoZc0rvBBZNA5cSLZcWTswR8G9kUjEmJdNYrdjnXXv9vq7dPxLQMBqCvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRJmE0rYlLFoPD1xMY6zDQxY0Ohuw75Isq6wjEvSW2E=;
 b=LjXb07ExkUUC4GcFj3H0hu9iZISWTJ9jIpXW6eQFUr6uMj5c7vbP2bEMVUiRgCDzEZEX73HTwTt28gyO1IwjTXd3DeKWVbVG5KY9WQtiL33ymhkRZelNC+/ighqS9wsN2iw0Zd5OsUtsDYQmQDPlW092CxFuJRU0fmikMB+pARM=
Received: from BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28) by
 DM6PR10MB4251.namprd10.prod.outlook.com (2603:10b6:5:21d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 14:47:57 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::96) by BYAPR01CA0051.outlook.office365.com
 (2603:10b6:a03:94::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 14:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 14:47:56 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 08:47:51 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 08:47:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 08:47:51 -0600
Received: from [10.249.34.208] ([10.249.34.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AOElpC72075487;
	Mon, 24 Nov 2025 08:47:51 -0600
Message-ID: <54898c34-58f2-4ac7-aa46-24458f9153db@ti.com>
Date: Mon, 24 Nov 2025 08:47:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] arago,conf: set preferred runtime
 provider for weston-init
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20251121234400.1356544-1-denis@denix.org>
 <20251122000026.1022350-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251122000026.1022350-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DM6PR10MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e604d4d-c085-4908-57fb-08de2b68746b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZG8rK1VzejhEdk4zMVZIVG1kUlJOQVZpWVVHbWErMjlZWHljSzRRU1NCZ0do?=
 =?utf-8?B?RVBSK3g0ZWJxYTlpNllIMDJDdHY1aEhheHJVWmNBR1lpWHFEenV1TzV1TGZ4?=
 =?utf-8?B?NG9pcXN4cFU3b2l2MFFrc2xoaStqRHNHVk53REg1SnVRTzRqb1BrQ1QrMjR1?=
 =?utf-8?B?MHQ2YmxCM1l4WG9KU3VGMGFTaC9YSnprNGJpNWxiZyt2UnJpU1ZPMDZsdEJ6?=
 =?utf-8?B?UkRLaXovejJ5UW9zczdhTUV5MGJ0Q1QwVXVHWVc5WWd0Y3VLMHpjWGFlVEdW?=
 =?utf-8?B?WURZT25DL1FkQjhUODA2T3VmbWxGTzFVOHhyTDlnd3p3Zm9ncVF3TUtnN2Jn?=
 =?utf-8?B?dnNkbGR0c3NKaGVIMkd6T2hIVkpMT09scU16VTRnUEg1dVBrUTJoRFBSWTNX?=
 =?utf-8?B?VmUvYTVCSDYxWXB4OTB6V2RGWG1KZmFZTzZ6UXNkRjNWdStpSmNEM0lsRzJk?=
 =?utf-8?B?VktiZDJvWFNIdkoxOHUwdUUxMDVlOG53d2h2NmRISU5hRVM3MER1cEZtVTAx?=
 =?utf-8?B?QnJESURlVFE0bUI1Z0pLT0FjZElOek1Zd0FhYWdJaWkvWlg3dURVZThCR3U4?=
 =?utf-8?B?YkE2SzBXb0s2cEs5akgrblJ2UWJzV1EwTVJneFVla1N4eGlFM1h4MS90K2FD?=
 =?utf-8?B?SlpkUE9vTjNXVUdVU3ZVV1J1Sno1eU10ckVxQXpIR3Y0cEJQYTdxN254eFJq?=
 =?utf-8?B?MmUzMG5pZnZYeEF6RmJPbjAxUThTenJ5Z0ROVU5WMXdWK1ZkUTF5UDZGRUh1?=
 =?utf-8?B?V1lvM1JTMnhaNm5VQ21ldnZjTVFqaEVpRlAwWE1HSEh5SnhqQnhNNzFRK21L?=
 =?utf-8?B?MTlXblUxRzJOMVhoWFdIREZXNGZERFNJY3RDbi9PS0NCR2t5cW5WREtWdHN3?=
 =?utf-8?B?dHNGVDRCU0ZBdjhuSlpTUUUwaWZEa2hJR2FwOXZUdCtTUlcrQkQvTlFSZWo2?=
 =?utf-8?B?SnpNcFRiYUxMUDlib0JmSDNIMk02NVpjNlNTblcrTmE5Yi9BL3YvN210WXZE?=
 =?utf-8?B?aGp5eHF6bWU4amplM3c2SzZUTGRQS2RuME55Z1RwYWJ2cjNYT3RQUkNtZFZ4?=
 =?utf-8?B?NkY1WDgrblAweWF6MEZMU1c3ajZtZURhaitMRy9LYWhCSWNxanhDWXliUWo1?=
 =?utf-8?B?S3c4WC90R3dZYWpCMWE5dE9hWTIxa0hHajBVQWUzY3h6eGlYSmRPd2FIdUlN?=
 =?utf-8?B?ZlYrQ1drRUpXb0FwUCtJR1A3SFoxdDhYVWpXTlNINXFweW9UQTdOOW4zb2xu?=
 =?utf-8?B?UE9PMlU4eklLeDRkdnFOak8rUXBKYThsMHRiYmR5T2RmTTFXeFpsc1Z5NXNy?=
 =?utf-8?B?MEZOa2hoOWVFdkRicDFNdzdUTGhlZjdxTGFKcko3dEM1a3FjR2VkdWhiQ2Q5?=
 =?utf-8?B?WmN5c3RiMDhsNDlzQ3VuVEk1TlJjUTZqQlBPQlh4NkpKclByVURlQjFkS2ds?=
 =?utf-8?B?V0llQXRTU0JzbVNFT1RpVXd5YXhhdzQzbHhDZkhPSXprcGFHaHpEVDlIMFA3?=
 =?utf-8?B?cmVHZ0RtTS9sZEVCdEFUeXNZRUh1TjJyUTNhbWNSSTUrQzVZYUdMOEp2UlNE?=
 =?utf-8?B?S1d3YnVTaldwbUVEVmNGcU82N0kvNEswSEoyWmVZNDd4NkR2TFlFcWxTRUQz?=
 =?utf-8?B?bUp4V1p5NjNaV0lMZ1VPMmtUa3Q0T0hIb04xZ0NJMFZzV2FTMVlrSTk2OWM4?=
 =?utf-8?B?WHZjdDNOY0ROR0dVN0RnaURMOUdjNk9qNGlOTFo4SXZaQ2FPc0RuaXVXVkMx?=
 =?utf-8?B?NmhHOVZFQ3NBaHZwZ21yMFpwUnUyTTZFZ2xwN1R4SmZWK29sWCs1djdXbTdz?=
 =?utf-8?B?enpSZW1JYVNxWWVxWnROemo2cmltc2dGYUFtVTlISjNsTVpaV1FrUWJ0NTkz?=
 =?utf-8?B?VkM2T09GM3N0Uk8vcFl0R0g1UUszZzZwSEtLMERrZGNRUy83MTF6Yy8reXVt?=
 =?utf-8?B?cUZjZGhyQ3h6OWlXdnJTbTRGMTJJcE1iaHFVK1J5QmxQVDRhYUZpTUtubDRD?=
 =?utf-8?B?WGIxSHU3RVlSMHV3a2VCMnRQZzZnb3VNc3Q2UzNTa3VMVFNDMkZLQ2N2T3Yv?=
 =?utf-8?B?MFl0MnNlcXkvWkpza3ZqZUNPUHJhcmh0bUR5Q3h6MENIU3BkeTJnL1hZK1hm?=
 =?utf-8?Q?2ixM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:47:56.1741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e604d4d-c085-4908-57fb-08de2b68746b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4251
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Nov 2025 14:48:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16832



On 11/21/2025 6:00 PM, PRC Automation via lists.yoctoproject.org wrote:
> meta-arago / na / 20251121234400.1356544-1-denis
> 
> PRC Results: PASS
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [scarthgap][PATCH] arago,conf: set preferred runtime provider for weston-init
>      WARN: Commit message does not include file/recipe name: arago,conf: set preferred runtime provider for weston-init. (COMMIT-MESSAGE-2)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> 

Score one for the checker!  Change the comma to a period.


> 
> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> scarthgap
> =====================
> Summary:
> - Patch Series: [scarthgap][PATCH] arago,conf: set preferred runtime provider for weston-init
> - Submitter: From: Denys Dmytriyenko <denis@denix.org>
> From: Denys Dmytriyenko <denys@konsulko.com>
> - Date: Date: Fri, 21 Nov 2025 18:44:00 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 60ec81d5be40337dee935203f168119768e48293
> 
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: scarthgap-wip
> - Commit Author: Ryan Eatmon <reatmon@ti.com>
> - Commit Subject: nnshark: Set missing PV
> - Commit SHA: 7b5396d2e36debe754adaaaef84d4eb46688d4e0
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>    check-yocto-repo: PASS
> =========================================================
> scarthgap
> =====================
> PASS
> 
> 
> 
> =========================================================
>    yocto-check-layers: PASS
> =========================================================
> scarthgap - PASS
> =====================
> All checks passed
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16830): https://lists.yoctoproject.org/g/meta-arago/message/16830
> Mute This Topic: https://lists.yoctoproject.org/mt/116417043/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

