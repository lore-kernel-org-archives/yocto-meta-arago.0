Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0528D374A5
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 21:04:42 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3858.1764968679222894000
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 13:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=D/DwNWT7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.53, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGt6ZQUXnmP/mVRWaga1CGh0Ms2Sdbr8ZoGkGeJ9cNZk7GJAEhiBoEh1JaVzZsNHXelGxfeCTWJHEEHcKmHLI0iNwQz1GR4k/0voBjwytVi2vDi2C4J0qIkn5YrLxwRq1iIcoZP9JI/mhJJsfrQstX80zNBTUZQ8xRFyxF+ucPs+rQAYkqPImFwTNiSo90K/E6vkEIOwIxAZTQDGNoXSJUXBaE8vAmmPzr8WtU3RzcyrIaC74p2NYoqyX93h0ptpQ5MTeRAEooHULqQZULAkYEMmu5rUr9cJFpJK9K4VzjsvjvtG0bBsb6MvEhpQ6V81hkJEl2mNTsrelIJsH23jdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7/dl66ftgaub9BoRkprIVvXJCg6xEotcScTsjKLAzg=;
 b=bMDFbyG6Fx9uAUXuSBqFfAmrnsu0pmJgVMl/P4+8FKuzuNiX3UeVffbc2eTxRdfTI6DVmDfy4T4jYVaeF3LgkT9Bx6b96HcnwXJV8zmoiDLx6kDbkZqqsSdr33ZrLUTHGFxkSRE4OYUDE8hGWsUTyh0we2LbqYH0AYZQTPV+wKhujv+fmgMZDRVpqY2JdGj60sBrYBLLG9X7QCBZhIFBdJ4LhoFdmD8NuIWoRW6bbDpGM+JiUE/nMO8QN3JTaJSiJRGEsxRR7fHxad87GVPGnKlTTtFxO7TsJFgCOrrQeqKP2f4sBJKGlqloEPJfwnjNQdc7ydKbgVO7zTpv/nsbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7/dl66ftgaub9BoRkprIVvXJCg6xEotcScTsjKLAzg=;
 b=D/DwNWT7U1NA33wn+4lAJtMbE9Aoz898lP/C6RqU3qTa+kolNsPi2wSLPMzc3C6+ND1jjvMernrfab8qti7myOliYUk/fDVmNLly4ZGMqcarv5dfTCIH7InN1ROGjogvO056drlpCHJNFIihDislBoY+dbytBmbSN+lCNwP5BdU=
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by CH3PR10MB7501.namprd10.prod.outlook.com (2603:10b6:610:15d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 21:04:34 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::4f) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 21:04:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 21:04:31 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 15:04:27 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 15:04:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 15:04:26 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5L4QDK3910809;
	Fri, 5 Dec 2025 15:04:26 -0600
Message-ID: <735e1e2b-f677-491a-b64a-dcd52c839c13@ti.com>
Date: Fri, 5 Dec 2025 15:04:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] coremark: Clean up buildpaths QA
 error
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20251201184100.1372032-1-reatmon@ti.com>
 <20251205204834.GF11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251205204834.GF11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|CH3PR10MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7415e1-d99c-4371-a59e-08de3441e308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UFNlUUprNGlUOW5nSlBQNmRVRkpjWDk0NjRYakVGSUVKZUhVN1VTM3JwTmZs?=
 =?utf-8?B?bUNNY2x0YzlKR2FNQ1R6VzJJOGVyVzNpeENTaTVFQ3BoT3V4dkRaeXR4UWR5?=
 =?utf-8?B?cXFqWWVwbUhQT2R2WEpvTzh6Q3h4S2hIN1Z1bUpzVkpOaHpFMWR1OGRtSW0r?=
 =?utf-8?B?c1h0YWlsZVQ2Slh5aFBFM1lwYTA3L2R1VmljWjVkRVB1dElQeHZKZjYwRkFP?=
 =?utf-8?B?aTdITmtsZ3Ird0RxUVlaYmxwQlZIalhJczhwclhIVU5VbEgyTkc5Q3RwdFpF?=
 =?utf-8?B?dUlMSWtGWU8yeHBjU2hoL3R4VTJ4TFM0dE5NNHBxOG90MXNhcUh0WkVsYUZG?=
 =?utf-8?B?ZlhmbHlHSWQ4OURSbTlVK3VNR0R2R084T3U0KzU0MHlLMGt0QXB3bllEWVRB?=
 =?utf-8?B?Q1FXY0JVaGdmUnY5QmZMaCtSdGQySUNXa1VwbmxKdlpmanhEWkg1SVErb2FB?=
 =?utf-8?B?YWU3dTltUVZaaitiMWsxaEMxcFZ5OHZJSm9oMit3dUgvZjdWNlpEQ3o2Tkp2?=
 =?utf-8?B?NUY5NDlaNGJaSUsyaEJYYTlrRlNaQklxUTkvVzJTZ3VkTko4YUhzcU9JSkw5?=
 =?utf-8?B?RjJST0wzVEU2NVlmblB6cDFtZjVFcHNhYVV3Z29KdDFCQjUxSUZEWFVZZG9I?=
 =?utf-8?B?MGVEb0w3L1RRcnRSeHdHTjhBUVZ4OFVIcXN3SEtJZkVzcmRuN0l1MjBydUtC?=
 =?utf-8?B?ZFZkV2w2Vm1GT0R5M3JQb2VybmthdXA4ZnNSeXY1bkYrSlp1TWI4MG9pVW1y?=
 =?utf-8?B?aGxpSGVmME0zUXluc2EvSUU2NE5Wek9QbWdzeGNmM3dkdnMyTGRFa2dKb3Z4?=
 =?utf-8?B?MGJrcHhnRE5IUnFpS011cTVLUWkyZDVKaUZzQkdpWnJzK1NDTTA4RHJuK01J?=
 =?utf-8?B?RWRmOGN3bm5SSEJCK09IQ0tRaTJwT3BPQXBoSW9wNjVKRUxyVEs1bWpsbkpD?=
 =?utf-8?B?NEttdm8vZllnelhmK3lUQ3V5Vjl3YTRsaHcyaU43bE9yT1FpZmZwOGhEMkZW?=
 =?utf-8?B?UVdrUTRkb1EvNmkyRllDMGwyZHZDZWl0eUkwOC9PNFpENHh2QjJWYjVrRlFj?=
 =?utf-8?B?SEM5dmE3MjZJZWc2b3d3ZWRlMmJGVkZNOW9ZanFEam5EbjFsTE9BdGM0Q3BK?=
 =?utf-8?B?Z1FNeE9HeUNuQ09HM2hnV1RmY2R4eUZ1cmdpTEF4RkVGd2FzV05vc1ZmeS9P?=
 =?utf-8?B?czlUSUNaTEV2L1pabHJFSGN3ai9WR1BQdm1GYmRUcG1NN09FNnJObXZhd2NH?=
 =?utf-8?B?ZXVIdTJ0Zmo1dEFkNmE4VE9TblhVNU01V3VwQzhRVExFSTFzQUVCSlprdHcv?=
 =?utf-8?B?U2E5bThXMXBqazA0YTlxWmV6VnEvbG1XVE1qWnFqWHhyZ0pEY0M2V0M0MUF6?=
 =?utf-8?B?SU50YUZDeEZtRDNua3N0Vm9jUUJWQWtHVVgvN2k1L250Q0NFWkpPaXhZNWhi?=
 =?utf-8?B?ckJ1bThKV2ZWVFZyQ1ZKSzduU045cFdFT1YzYllhcDVEUk5RMW1OTjVvMXdB?=
 =?utf-8?B?RzExRnBXZCt5ekJ6eHBidmIyUkMxZCszQkViUUZNb1kyU25FWU44T2FjWk5r?=
 =?utf-8?B?SVZjWTMvcjErNUlCQUluQjk1Slowem94TE94RDlGenFFQTdpaGptSU1TTUFP?=
 =?utf-8?B?NUNrbzVualdoUktQUGVKTmptNTBvRkxYeUxCUkZXZUdJbE1sMDhQZy9vWE5k?=
 =?utf-8?B?bmFHQVdZeXdxOWFGTnJpQlNNQ3UyMElvcWVBUnpMbGFlRHp5K2JySnNKR2dG?=
 =?utf-8?B?ZTh3bGRvODFZVG50RUgxL2tFVXBCcFZNdHM2NjVjNHNlVWpBck80bk5SNndt?=
 =?utf-8?B?WXljOW9wQzNyVStVR1lnNi9YSGhCV2NFNDJyMnZDRkV4ZTJPek1JNlVVNi9H?=
 =?utf-8?B?ampQQitxdEFzcXdxOWM3VWF1OVQ0bWc4aGtTR2dXZmY4K0wxSFBEbWc0a0Rh?=
 =?utf-8?B?dkRMQnN5N1pnbWRYekZNMXVUaXlKYTk0bjQzc0pUZUhLUWlrNzU1WDdUVlV3?=
 =?utf-8?B?VGxnZTgwTUliTjJDbWpsK0pYR2VOLzUrQVJXMnNGNlg2T2xwU0hsY3BuYzU3?=
 =?utf-8?B?R3dJWEErcHhKalZZUEdLaVRWRGZkczFxMERjaDZzWGRxeWtYejRrQUhiMGpm?=
 =?utf-8?Q?aY3Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 21:04:31.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7415e1-d99c-4371-a59e-08de3441e308
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7501
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 21:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16865



On 12/5/2025 2:48 PM, Denys Dmytriyenko wrote:
> On Mon, Dec 01, 2025 at 12:41:00PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The coremark binary includes a copy of the compiler flags in the output
>> which breaks the reproducible build tenet of Yocto.  This patch simply
>> replaces COMPILER_FLAGS with "".
> 
> This is also needed on scarthgap, where it is a warning, not an error, but
> still.

Agreed.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ..._main-Remove-printing-compiler-flags.patch | 41 +++++++++++++++++++
>>   .../coremark/coremark_git.bb                  |  5 ++-
>>   2 files changed, 45 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
>>
>> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch b/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
>> new file mode 100644
>> index 00000000..ef7c78b2
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
>> @@ -0,0 +1,41 @@
>> +From 0af4e2298ccacc8afc0294b7a731f0e866155427 Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Mon, 1 Dec 2025 12:21:23 -0600
>> +Subject: [PATCH] core_main: Remove printing compiler flags
>> +
>> +Reproducible builds do not like including anything that references the
>> +build environment on the host machine.  This would include printing out
>> +the COMPILER_FLAGS macro.  Substitute it with "".
>> +
>> +Upstream-Status: Inappropriate [OE-Specific]
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + core_main.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/core_main.c b/core_main.c
>> +index a4beeb6..f0ab87f 100644
>> +--- a/core_main.c
>> ++++ b/core_main.c
>> +@@ -380,7 +380,7 @@ for (i = 0; i < MULTITHREAD; i++)
>> +     ee_printf("Iterations       : %lu\n",
>> +               (long unsigned)default_num_contexts * results[0].iterations);
>> +     ee_printf("Compiler version : %s\n", COMPILER_VERSION);
>> +-    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
>> ++    ee_printf("Compiler flags   : %s\n", ""); //Reproducible build fix: COMPILER_FLAGS);
>> + #if (MULTITHREAD > 1)
>> +     ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts);
>> + #endif
>> +@@ -410,7 +410,7 @@ for (i = 0; i < MULTITHREAD; i++)
>> +                       default_num_contexts * results[0].iterations
>> +                           / time_in_secs(total_time),
>> +                       COMPILER_VERSION,
>> +-                      COMPILER_FLAGS);
>> ++                      ""); //Reproducible build fix: COMPILER_FLAGS);
>> + #if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
>> +             ee_printf(" / %s", MEM_LOCATION);
>> + #else
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>> index 1e002c06..9d770c44 100644
>> --- a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>> @@ -3,7 +3,10 @@ SUMMARY = "The benchmark utility to measure the performance of CPU"
>>   LICENSE = "Coremark"
>>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
>>   
>> -SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
>> +SRC_URI = " \
>> +    git://github.com/eembc/coremark.git;branch=main;protocol=https \
>> +    file://0001-core_main-Remove-printing-compiler-flags.patch \
>> +"
>>   PV = "1.01+git"
>>   SRCREV = "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
>>   
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


