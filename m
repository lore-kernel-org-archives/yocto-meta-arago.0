Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F3EE9D416
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:53:49 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25355.1770224022552546037
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 08:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=oYKlQw/E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.13, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgxkxY+koEJfHkwf3jHlS4snYJBS8SKpGY/PtYFoRy9ljv3LodV6Wbe5z3TCwviUfbj1objYDTQYnR3AHc8CghOxIeP/UpSEciE2Oizy5P7GtqkcCTdv/9iZhCsw7BApFQiQEJQ5Sct0m+wYH2khYeWOF5TZR3iaCYZpCkadC4axq1ZjkgAsoh5RXtvZ1Wtojs1P4PzITj+iY5vZOmDce/MFJcJM/1EHIjPy9uSB/2z1pcxlv95CISxEcKFOowmcNdYb9fed5iM4hmrKUxxKHaCSgavqnR1/7PTABfKjJe5a2CgXcGsNRhKngbk2kYahI4IGm3kqrj5vMZWhtePd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I44WHrJJcKdZ6Md9sbSH2US4cjAOwhBjDnLm8JRG6RY=;
 b=s0uQP+ZPZhEpbMbGrbLFucMW+et5Q833Y3/9FEoc6fzlz68Z+YkszZuhV7dkMon358Ls31oBNR4bbc9jiDY3GxZdx4FmHassXmy21xvqbfOUdb7qz2IVyXN8ibaH2gxogqb6RMhFZi1uXCuhFGSKqAFV6zJe6mCjuH7uI6uIiuEJh0/RQmt9lIJa6erz11kBmj2SU2L/aGCylalt9pHQY3LQUqb13jjH7aR6iPz72PsHstcPk+4xGV2GtfZrX4qOd1Ae1FuzJfYuzcgEXz0tkbRu+kMmtHqXW51mxybFIIj+OHR77mUkPJViiFI9BDNrFxR5eiuzWhfuW1WoCPkexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I44WHrJJcKdZ6Md9sbSH2US4cjAOwhBjDnLm8JRG6RY=;
 b=oYKlQw/EwDpg63+AQbfk4bQPORkZlJzY3MYknxjWFSW9zEcBwE5+q8K7o3Ed7Q7fPdPftDmP3FbxyrYptnKDBIeVDd/E41z1QVWNXSJzvukwYT+Af/NdzRm1KMiHSwoTsFFCnT4Gr9J6hXSPrJb9/VO+Cay9EU6dSV3lKzW9Y90=
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by DS7PR10MB4848.namprd10.prod.outlook.com (2603:10b6:5:3a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:53:39 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::c8) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 16:53:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 16:53:38 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 10:53:29 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 10:53:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 10:53:29 -0600
Received: from [10.249.64.47] ([10.249.64.47])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614GrTQk1448837;
	Wed, 4 Feb 2026 10:53:29 -0600
Message-ID: <82eafa29-10f0-4632-9e79-b2ba8cf610f0@ti.com>
Date: Wed, 4 Feb 2026 10:53:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd
 service for system-wide audio daemon
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20260204160813.2393421-1-j-sahu@ti.com>
 <20260204163056.3336685-1-prc@list.ti.com> <20260204165030.GA11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260204165030.GA11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DS7PR10MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: fa701965-e108-4a76-541c-08de640df192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UHd2UlFhcFJrSjZhNzBNRElDdThLb2s2c0szL1pXcFNjbGNTaXJ2L3RybmE4?=
 =?utf-8?B?bEV4K0ZEU0Z3TXRPdW9tN1ovci82VkUyT3h1YUJnYXhIaHNJTURpeUhLRnpY?=
 =?utf-8?B?Nys1c1dpVXJDMVFsSkQwUFRCMWlVQlBMYTdwQm5xSjBsekdDano4RENkczRa?=
 =?utf-8?B?dDhoaVJPdzBaSWdieDBxOXM3MUJGMVE2Y01LNHA0NTJXNlovaGcwNURXbG8w?=
 =?utf-8?B?NEd5Y1RMNUNIa0k3MkF1eUpOWWxuV3FzQUQ3SVJaaDNtY1JrU2pJb0FpMjhJ?=
 =?utf-8?B?dXdoY1RQQno0aXZlZHVFWkZTZUh5QjVMZHdoZjNtVzlwZWw5SkhDc0JnMHNk?=
 =?utf-8?B?ZmJrcm1kWi8rVjN2M2xPUjZwaGR0Qk0rNWRYZ0V1aUFFSENMRXhGYTJvbXpY?=
 =?utf-8?B?enRWME8wTlNXa1pOeW9lMjh6KzhhMVhKeWJWWHlpNFlCTXlHeUtweVpEUVlH?=
 =?utf-8?B?TSs3M1hzYlYxNWc3R1VsZytmTndvdWtiRFRDZ3Z0SVNYS1BEcFpBN2xvMUNS?=
 =?utf-8?B?T0VsT3d6UU9yVitpTVNiK0tVeEVnbWhVbGFhdDBJSXhDRkxiNHIycDVWL2Uy?=
 =?utf-8?B?TTdaKzFpT1U1U2gxWnRJdmVXMWNnNWhySHNVbU1FQVdHZGpsa2JPeHJDWUtF?=
 =?utf-8?B?U0JCazhtZXZvNmZYT1MyUC9KUTVIMURmVkF6Qm5GV3AvWTFRMHAzRVFPZENn?=
 =?utf-8?B?Y0RQRG9LeW9oMkZPZHVzaEtHc2hqMzh6d3ViVERkbTRwZ21ZMXdBRkg5OXpY?=
 =?utf-8?B?M0U0eExVdWIxbGRVMW9paG1XNG1nSGFWb1FWdHB6aU1LOWpVVE9MSTliZitk?=
 =?utf-8?B?YWVhYkJ4Q1l6Y3luRnU3N3dsTk90ZGtNaTJDYjBHdmVoZGxnSUs5Tk5LZ1Rw?=
 =?utf-8?B?MUo0dTQ5T0x4Qms4ZGFGbXVpeUEyTHJkZEpUZCtFTFRjL216SjlDZWpjaVRS?=
 =?utf-8?B?L1k4ZlY4RHB1RE4veGI0eXFONHZJdDUvYkl5d3llZXFzeDhyVkxMd1dsTHJG?=
 =?utf-8?B?RTlab3ZFNXlzSWxmbWI5b1l5LzV6LytheVY3K2xqblhXUFBMQnRxbkkyYUM2?=
 =?utf-8?B?WHFZM0ZMWFJ6ZmdhTTY4MURrTzZwSjZrbVlNeGRKeUhHend6Y3FxeTlkZSsz?=
 =?utf-8?B?S1dzMWFFc1I0RmZTUzVrTGIzaGVHWUt1UVJUcjJHbG5HV2JvWFRKN0NmYkFT?=
 =?utf-8?B?bkFUTGE1alFhTEs1U0tpZWo2YWRybWFJRE5Ga284R2wzNkRENjZESllmeHRV?=
 =?utf-8?B?aWM2NlgyWHVrT0Ewd3hpa1VyL3kwM1RqQndQVHUvTHBYaEpBZktWQnBWeWxT?=
 =?utf-8?B?MENoMVJDNlFxRFRlc3JKb0tzSTVCV2VOMmxubnRIaEp4VkZQWDRDZERxT1Jp?=
 =?utf-8?B?Y0pzT0d0aVZvQnFuRktidXRaWit5UnZ6ZWhUNUM2ZjJoVkNZa3hZdVpPME0v?=
 =?utf-8?B?NUdlUzJlVGUxejZWSlRJcHQyVEVUSDM3cGNES1RXWURNV3YzY29tRHNQcUo1?=
 =?utf-8?B?bHNDcDBMYUx0QUVXWkl3NGkxZEVyMGdrM3pTVzZwLzkrQmFDYnc3QXlYOXlD?=
 =?utf-8?B?VjFzbmlnVlYvZThiT3ZGVHdpUmw2ZXZLUHdkVGN0LzV0bWNzbWMrSjNpWk9X?=
 =?utf-8?B?TXlSYUtZRjBLZmZYWnhHNDZVc3grRkt2bU9oVkVTWm1iemJPYTEwU3BUemFY?=
 =?utf-8?B?cXlNZGFNczF6ektCaVBFUHZONTFYdGFoTFhXeld5MFlmSzVqKy9HTXpSMjNS?=
 =?utf-8?B?NVVUelJZcFZ6WTNUT2x4TUFQdVB6dE5RNnZHUTFSTnplL1JJU1dpeU0wNmpv?=
 =?utf-8?B?SmlkUHMrMkhuSjJvUnRobXpjNC9qejlIazgva3hFVFBqUWQ0NHk2RjBMQXVj?=
 =?utf-8?B?TGdTNmlDWWcvVWNjdzMrQWpORGNpUktTVVhoU3lKNVhXc3NzZ3F4L2t2NW5w?=
 =?utf-8?B?RktaWDRxMW1Md2E4eGFJMWNFVjZzcHVxNnhaVG11ZHk2dUVZNjN2QndyV0Vz?=
 =?utf-8?B?bVRrM3JTeWpQYTQyWkh5eXRMT2JNNnQwaFpxL1hHMmhlZDE4VFk0UjlxRjVG?=
 =?utf-8?B?bHk5ZVh2T0hrWG1ma0t3V1RhcXd4MWpucTVUZWsweGN2MGs0eTFUamt4TXJ5?=
 =?utf-8?B?aU5ZVWQzbEQwemhPTE9zL0hDdjBqbTN6ZHFUSmhZTW9SQ2FYUkN2Z0hFV0p1?=
 =?utf-8?B?V1g4bHlhamVjeDRNakR0TnlYVDJ5TGFCeFFUa1BuOWFPbFMvVU9sanpZZklj?=
 =?utf-8?B?ZWRZczU3bG9aOWNaNnZVQkdjcWN3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0c71KD1LGcRk19zxBGIsvA5I7pL0W/3zBoevP0/haOhjJKr3YyYyqw/HGRF4Q1i6icjeYYXMs/N/Fn0amWl1KkfccovrCjLRddDZ7TIklzRw4QWYtLmEO7LtwPhviFJEpuffY3F3MxFKmPTpll2+CLYvqrfYSbeZG80zWotHXsek2BRM7y8NUQDYtRbJn8Wpo/V9I5voF3GBKPxASB2ebU+SHH5kZ0/0QMhkYhW/3gDq35i31F3EMnGbuYExuV9hXI3aUDkmqyXOR5/J9U2T0jNDs9zXSXRNayArS7xY/zPmtFGA7j9vQ/SIZt9Nc99upIkNmFblQ2obX0OmUm2krM1CwLzpiY7IixtMNuRGAdUYM62ZuYeOegpQ9Zwc6VISzJdKwrh4K4RrC+vRqixuJpWKX6qaZdHvDXNbALluxdMfebXRnvz1SvE/VtN5YeqT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:53:38.2202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa701965-e108-4a76-541c-08de640df192
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4848
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 16:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17083



On 2/4/2026 10:50 AM, Denys Dmytriyenko wrote:
> On Wed, Feb 04, 2026 at 10:30:56AM -0600, PRC Automation via lists.yoctoproject.org wrote:
>> meta-arago / na / 20260204160813.2393421-1-j-sahu
>>
>> PRC Results: FAIL
>>
>> =========================================================
>>    check-yocto-patches: PASS
>> =========================================================
>> Patches
>> ----------------------------------------
>> All patches passed
>>
>>
>>
>> =========================================================
>>    apply-yocto-patch: PASS
>> =========================================================
>> master
>> =====================
>> Summary:
>> - Patch Series: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd service for system-wide audio daemon
>> - Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
>> - Date: Date: Wed, 4 Feb 2026 21:38:13 +0530
>> - Num Patches: 1
>> - Mailing List (public inbox) Commit SHA: 9eb3f83089e67ac2fdf065915304bcd7e28f2a85
>>
>> Applied to:
>> - Repository: lcpd-prc-meta-arago
>> - Base Branch: master-wip
>> - Commit Author: Andrew Davis <afd@ti.com>
>> - Commit Subject: meta-arago-distro: Remove tisdk name from Arago packagegroups
>> - Commit SHA: 5fb7dfe249b07778f706eb50635e2c5a2c56b13d
>>
>> Patches
>> ----------------------------------------
>> All patches applied
>>
>>
>>
>> =========================================================
>>    check-yocto-repo: PASS
>> =========================================================
>> master
>> =====================
>> PASS
>>
>>
>>
>> =========================================================
>>    yocto-check-layers: FAIL
>> =========================================================
>> master - FAIL
>> =====================
>> ERROR: Nothing RPROVIDES 'packagegroup-arago-base-erver-extra' (but <build-dir>/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/ti-world.bb RDEPENDS on or otherwise requires it)
>> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> 
> Ryan,
> 
> Somehow there's a typo snuck in in the commit:
> https://git.yoctoproject.org/meta-arago/commit/?h=master-wip&id=5fb7dfe249b07778f706eb50635e2c5a2c56b13d
> 
> At the very bottom, it has 'packagegroup-arago-base-erver-extra'
> 
> I checked Andrew's patches and neither v1 nor v2 had that typo.

Yeah.  I had to manually apply his v2 patch, and clearly I screwed it up.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

