Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF5ED29C4A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:56:47 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9715.1768924600889981248
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=V5rrBCty;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.45, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMD+67aAiv+vct1cepIaXIoWyMurBwzAEfis4uAnf7mOCNVG5XvTKDk0sWEWjPoJoVcUPNEwCs3HoNsEDhjPB+lPlH2GaaVmgeg0S2p65YBj9iKGonyCATnkKS4jaemBV7hDhdNtRNpVxRXXMEOCuDiAun6y4OEsf9Ez03nTwvikTjBp3/FqiKqC8Cw85f88vrBVawXYdKlut3AehNAtJ7F86Oc01C6m5K8rCTKOLrhBjq/me85l9pp9x2iYv8ltirG6pCyUwPRzbGllDZc0UE7dZmn6Ebe14MSCMjkPU+UQ/gsEDCRgSN6QhHCeOTIrptRtGGzhHn4D/5EcYgtTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT37Fl+q5edQBBZ7Nj1kS/kQIGCt5tQyurrXRz9DAIw=;
 b=L+FAFWFlIbufLHVV+X+sBiHpum+Q8xba0WexDPJ2lEUWxi4fe/55KwPVW1zDpoznSsF1Wj1vzUPmtMNcCrH4rd1+hYTqecAYXmcl6ugWXpD/M/8D82oKgYI5eeekTMaAsrx0FuhPTcIzyyvknuXZ4nLhdXZZ2WNWayAOAR9OnOHk1pRsYutDYM48i7i8RKqGZCh47FIHmq67G9nzQ4cr0qlsoI3OQ095SJV5p+jyCq8pLs1hFWg+TJ9w3/5Ha/07fjWBF4oqU3qAPm+5cSVEguqgIMgr0qP0IV2JjK53aLjJbEaSOQM66NBvahU6+Lq70oX7SAXyEmWM9p/MnljXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT37Fl+q5edQBBZ7Nj1kS/kQIGCt5tQyurrXRz9DAIw=;
 b=V5rrBCtyWjVqpRjh7eHdf258DGwV1CzwWqmGBtTNgg6UG10Q7SH2OVgx83kP/PVQnz1BKHFFxy+IHGN98sZK3gjgTnRTZ7ZdP/s2RPK6tt4j0kdA8gmXrBvcDLVgfCtSFfEHJBIEbKd6yWXmZIi73s8GKLvwcY2uaKvY5mkWyrw=
Received: from BYAPR02CA0022.namprd02.prod.outlook.com (2603:10b6:a02:ee::35)
 by IA1PR10MB6051.namprd10.prod.outlook.com (2603:10b6:208:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:56:34 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::1d) by BYAPR02CA0022.outlook.office365.com
 (2603:10b6:a02:ee::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 15:56:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 15:56:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:56:33 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 09:56:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 09:56:32 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KFuWG01317907;
	Tue, 20 Jan 2026 09:56:32 -0600
Message-ID: <c6a5ad33-1859-4150-b494-b427ff4bb2cc@ti.com>
Date: Tue, 20 Jan 2026 09:56:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 0/2] Clean up patches for open62541
To: Denys Dmytriyenko <denis@denix.org>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260120152519.12538-1-a-christidis@ti.com>
 <20260120154224.GV11121@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260120154224.GV11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|IA1PR10MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba2dcb2-43e6-4e56-f40d-08de583c7c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTJsaGRXV1ZYZG9XVjdkS29VbmFLZEh0eFdlNGEvZXgxRE1VaS9tbDl5cklU?=
 =?utf-8?B?OHhnMmJHYmpFc2tCR3NvZFhZaUp1dTYxaUhJMjMrVWp6QjFXMk9XcWJLOGRr?=
 =?utf-8?B?RTJJVTBDMVlxMThxalp0ZzFxcTFDcWQvUjdCRXIyczBveE1zaHl4K0Z6TzJq?=
 =?utf-8?B?WjBrOWFKZ3ZlU05EODF4ajhTQkw5ZHlWa2lES3Y5OHFWQVh4OVZUZ1BBbTQ2?=
 =?utf-8?B?S01IdFIxZFhkR0I5cG9XbTZQQ0pBOWlzNStPc1hSblFSbEJLRmZOQVREdkps?=
 =?utf-8?B?TWVZYjZSQ01PK0wwYXRBdFA4R2gwRHdCTlI4UW5DSm5rUWFQVU9uMzFvUU81?=
 =?utf-8?B?WlJlQUpZWHBveWlzdGdyZUp1UER6dHRFN3YvbGp4Ump4eUxCZjJUMGxhZlBx?=
 =?utf-8?B?UGtCb2h0MnVJQW1OK051MG9JNDFnMHh6dUtLTlhmMHpla1B3Z2VVZmpud0VH?=
 =?utf-8?B?Uk5RSzhXR2gwQUJZdUgyT3BnL2pKNXJCM1luUUZLamFFc1UrbnUrSlVraTVD?=
 =?utf-8?B?dkhWZjI2RkJoMGo3WUFxOC9MeXFVTlN0UEgwZmFQU0VURS9UMDk1cnY1QUxq?=
 =?utf-8?B?a2RvT0NzaExWT2pENWxROGc3eTIrWHdTNXFNWVlnZEJqM3AzMnRScDFJcm1y?=
 =?utf-8?B?SzNxVzNKWmZ6aE5OZG1TZzRNSThRRkdUOE50eWI0anVqakV6aVpCOGxhdmZ4?=
 =?utf-8?B?THpYOHY0SlE1MlVRckQ4dHJSN3lRVlFmbjdNYk01a1dLTzdwbWgvaW9HbWpB?=
 =?utf-8?B?TU45eXpBVEVaSzBzMW5mMW9XaDVRZ1pXTy9uNWZ6U09xcit0bTVDdkozNloy?=
 =?utf-8?B?dng3eEpEQWtKTTNQcUZkUGVBT2xqbUFWbGN1YksvQ01ubVgrSy9vOVpnckk2?=
 =?utf-8?B?aVREdGN5OUcra0xZaWdwZTAzcTkzcnB1aGlvSWRrVm1BVUNxQ1hBc2xqVFhB?=
 =?utf-8?B?bDk5eGFGME9KV2llYTAxVi9UbThKT2RHakorM2ZjeERPaGxuRXpQUGdZMFlL?=
 =?utf-8?B?OVZYaWRrNGM1SmpuckRPOEhFZFFLWldpYk5aZStGYzhsUi9NWUVzYWFmWXhX?=
 =?utf-8?B?ZzhtZS9zMXBpbXI0S1pPOFB5M0cvUzhUUUlkQ0g3bDhjQ0RjRCtTUm91ZDFT?=
 =?utf-8?B?bFZySVFsZkZ6WHB1VDBQRTFIV3Z3NDduN2h2cE5jYTlsVnpKTDI0TTZFUEI1?=
 =?utf-8?B?c0VSSnhlanZMekNtQTVEMUJkYWdqenZYeEphSmt3K051endPeVl2UWlVajJ0?=
 =?utf-8?B?N1l4aDB6RTY1N1RYdmo0b1JTenhmTGRCSWlaY09lTk5vTnJkTkR1T0YvQVVn?=
 =?utf-8?B?T0FtakNTbE82eVN2WHVGMzZzVFQ2VjJlL0tIK0lOOWlhWGJYWWE4NUFKcFZR?=
 =?utf-8?B?enl1UjEwbEVTWVBnVHhWalNscjJsc2VjM29kNjJqYkZHdmoxTWw5cnBEZS8r?=
 =?utf-8?B?NEZ4UCtVQTJDcVV1NXo2d0hZbkV4d3BNUzArMlZhMTVlRVF6VWVZK3Q1MHgw?=
 =?utf-8?B?a3BGRHlGTGdFcUc1L01Ea3JROThITVZ2NzJEaXdPNTJxRityeWgrTlNSd2tB?=
 =?utf-8?B?QXhuWUt5emRIUUQ0TzJFZ2xnSWUzR1B3bXMyaEtaN0NqczJhYm5za3JxSmc0?=
 =?utf-8?B?ZldmWS9nZDRwdStmbEtNQWdtZkhDYTZKSWE3L1dURU5CNTZ4b2N4REVpWHBI?=
 =?utf-8?B?OU8vN3BVOHRQZEJzOEUxZUVqK3ZESi9UazNBSjNrc25rb1FLd2FWZFRwYXg2?=
 =?utf-8?B?aXNSNlUyMzNONGJKUmdtclN5TkpBZHFlb09PQ3B4SEdNRlJQVkE3WC9TbVdy?=
 =?utf-8?B?Z1prV1dodi93NDNJV0hVZ1BIM2JjNjdnK3dBUTJ6WmpDT3lMNlZCZWcyNmhC?=
 =?utf-8?B?czlRQ25NeFBxRDJhdjdLbXdQdjhXdlpRRFNPRVJ2ZFE5Vko3L0hKODRaS1M4?=
 =?utf-8?B?SlZnVWM1eDRhaW0yU3JtQU8zQWZDaENkODByYitnR29KQmZoZTl4YmVGaTR3?=
 =?utf-8?B?UWNvUE9ZYldLbkp4SHdCTnEwa0diZmp5Yzd4bjBQbXU0MklZSldkNlFHMzVS?=
 =?utf-8?B?MFlJaklYV1RmZjUvNjdMdGJ5V0lhRFRNZ0pOelZIMU4wbHhmL1pPZ3VLN0JH?=
 =?utf-8?B?TzNiU3ZnUmIva0N6VFRDRkZScWFrNUxEOU1tL2VSTXFnaEtiRWJ1TG1rWGNC?=
 =?utf-8?B?R3lBNjBVbjVBeG00cFJ3SFBYZXBFdVdQSHFkYUcvQVNyaU9XUmdHb09iYjJ3?=
 =?utf-8?B?NE1XSEpJcHBlR0YzSHJFUCtBeTNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:56:33.5561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba2dcb2-43e6-4e56-f40d-08de583c7c1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6051
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16990

Yeah just noticed that. This series might be redundant then.

Ryan's patch 
0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch is 
status pending upstream, with no link and I cannot find his PR on the 
github repo.


On 1/20/26 9:42 AM, Denys Dmytriyenko wrote:
> On Tue, Jan 20, 2026 at 09:25:17AM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Dear all,
>>
>> LTS migration related efforts to fix the recipe.
> I think Ryan already made the same changes last week:
> https://git.yoctoproject.org/meta-arago/commit/?h=master-next&id=bf47628886392400787668c9b203334ce00e2e4d
>
>
>> Kind Regards,
>> Antonios Christidis
>>
>> Antonios Christidis (2):
>>    open62541: Remove deprecated examples patch
>>    open62541: Add patch for implicit declaration error
>>
>>   .../open62541/open62541-arago.inc             |  2 +-
>>   .../0001-examples-Remove-sys-io.h.patch       | 68 -------------------
>>   ...plicit-declaration-of-pthread_create.patch | 30 ++++++++
>>   3 files changed, 31 insertions(+), 69 deletions(-)
>>   delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-Remove-sys-io.h.patch
>>   create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-fix-pubsub-Implicit-declaration-of-pthread_create.patch
>>
>> -- 
>> 2.34.1

