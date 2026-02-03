Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D27E8784C
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 18:30:40 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.583.1770143431407288928
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 10:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=q/o7stXb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.35, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGre6+N4svoh1c+uORHbF5py2PF7EQugS20B6k/SMyaps5fFsjpD8Q0LNnZJXNQo/FsDHlV2p1UVzW8pKMdXgDjoTN+XaVnaaZmmWl7vraSoszC2pI4wuBFDrvpi1KO5ZmbBmy0HIWmnkX2t5EWix5mf62ewIPzSX9CkBPXnF0VcCt7a8t1j+gDIDVZ5jmcaZoq1CURDwC2+68QW9iR+Svzqp3q9kCaY8ClTqBlqbHF0S7g7DECYxbIkJI6xDbD6duSAkWSbxvOCkXLtWoIgbIBCtAnk/NG1UInDSnqqE8LKXm7f6QK0E8OwyYvcn6/lBs1bcyj4wpqmzLsqH5xkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1eecKJ0GDgc8qw58W+ZBbDnyOU7qMvPv7ZGoVX81OU=;
 b=sIH/QJZdwD7l2C5WkEhOJYqutN8nMW5lxVa477v3D0Hl9QegHQEosWH3FAP08fp0VHgmhJGixKoi5I3IzmDSzX5C/eocvsb9r1stRhQFY/NgeIpKr12lyR6k/awLlOZLFjV+/KVvxvt73leMtX6prk7lv5oou9sW9k9B76cRDtkJGqjBcbnvePSleq0ihP7gXM/iJ9t9i92XyjqBp0CMf/urLLl3/9b1u/xMSncpBxNkpE6xiu3XhQFktFrjLo+eppiYCYy8f91hT5JJ7PaE9c/BCiaM2eZSla5Spq1UyFgS6sBr8kZnKzJnzkAKtZAslnNwstaikZthkTfTablrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1eecKJ0GDgc8qw58W+ZBbDnyOU7qMvPv7ZGoVX81OU=;
 b=q/o7stXbN5A9qvMvZ8166qcIvvj7b4ubwfRRNDv3xF7keg4rLbwrhsHXKyD+9DfDl/jbpFTxLLP+1VOZBM62gd8RXzjEqFRWPp45bFXYK34lVmDVzSHpMrQ7OBYoT3kYFIn7F7uGZMG6TdRwd+Rwafk9UIvUUg8Faeb00JLqjv4=
Received: from BN9PR03CA0689.namprd03.prod.outlook.com (2603:10b6:408:10e::34)
 by SA1PR10MB997583.namprd10.prod.outlook.com (2603:10b6:806:4b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:30:29 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::eb) by BN9PR03CA0689.outlook.office365.com
 (2603:10b6:408:10e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 18:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 18:30:27 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:30:22 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:30:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:30:21 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613IUL5w194608;
	Tue, 3 Feb 2026 12:30:21 -0600
Message-ID: <2dedd538-9749-4ffc-87ce-6bc76dd4712f@ti.com>
Date: Tue, 3 Feb 2026 12:30:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 1/2] meta-arago-distro: Remove TI
 SDK branding from Arago images
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260130220830.2173125-1-afd@ti.com>
 <20260130220830.2173125-2-afd@ti.com> <20260131152918.GQ11121@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260131152918.GQ11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SA1PR10MB997583:EE_
X-MS-Office365-Filtering-Correlation-Id: 629085a4-4836-45d4-2d63-08de63524d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?alBKck9rRlFjRm1BWFByQndZc2UzeXdUOHgrZjVRZHEwSlVRS2d3ZG1XSmxT?=
 =?utf-8?B?aTlmYWh5SGFKUUpDSzhMUHFMNlpRTnIyUUxUcGk4d2h6QjZQMWswMTU0eTVO?=
 =?utf-8?B?d0svSnhmRzFWb3J1N3VEMTlFcGc4RkpZbVNpaDdrTUVKMGNwU3ZwTWRJbGM0?=
 =?utf-8?B?Wkc1YTJ2c0duQzFSVzhRTi9DNXgraWc3aTFOWTZsMFcxOEprY0tKbkpvTFJF?=
 =?utf-8?B?RzU0MVRVbUl4MS83MGM2WXRRRjF1UGJYZUhibkFwUlBvaGlaaDVTdG55UjFr?=
 =?utf-8?B?UmhoUll1UlpZT1R4S2RMVWowTVRXVGd3NlJoc3VHTW9xQVRSVjlhWFhGS2Q2?=
 =?utf-8?B?L1UzTVFPdlc1d2ZUUGtrV05TaFhvN0hwYXo4S3lLRTNoU1lobUpnMm0ydGk4?=
 =?utf-8?B?aTErWVNLZzVDRjM0Zi9zTXhOYnRhY1lSRW40OHZsV1ovVWljaDhMYS9Ia1FB?=
 =?utf-8?B?U25VcWJPekx4L3RheGk4bWRMb2dJTXBYUzBKZXRRclRuOS94dGZjYVd0bXo3?=
 =?utf-8?B?MlB1Yzk5SnhBV2NWYlNBSlo4SS9KenJBcS9kd1JlN2JEYW1kRnhwU044NGxm?=
 =?utf-8?B?MlVkczNFbWFyMlFOaGdPcTZSay9ySnFpZzd5SlpndUhnZElXcFVhK1lQckdm?=
 =?utf-8?B?YlpFOXVIdWRoMFRtaExBbjY0ZkR1dVBubjNsUUlCams2Um5ralJKbUJhTDJ2?=
 =?utf-8?B?VktMZFhBWmNWT2RaWEpuZ0lrYzIwTE83bnk4QU4xaE13Y1RyRFR2TlhHQmJ4?=
 =?utf-8?B?a3M2RkJ3MXdHdmxUc21OQUl5TzF2UW43Q0ljakhYdXc3K29MNGY5Ui9ZWDNX?=
 =?utf-8?B?TXNJVFN6VzA1VmxXbm1CQjdPZk03ZkhlWk93M3RISXZaRE8zUEVDLzY3R2lz?=
 =?utf-8?B?SGdNWVdwS2x4Zi9uaFRybWZhMlRha0o3ZENBQ1RIVjQzcjJ6d0xvTE1adUhR?=
 =?utf-8?B?UGNkM2NZMkhiQ1M1R0ZwYmZ6QkVrcTBYMC9sTUdXeVN3TXZ0aXZwenlNNzVq?=
 =?utf-8?B?Nm01TFRzc0dRNExjZzVGK21uOXN0bjlkMmtJZHcvV0dHNmRTYWNTS05SY1c4?=
 =?utf-8?B?MWNIL1VqNFN2WGU2QWNaVEwyZmNUQU1yLzZURGRLVUw5YjdrK29FcDFQRjdB?=
 =?utf-8?B?dVdOMGE1WGkzUXBuV295QjRJbXF6SGROWVFxTFordGNwSS8vWDZMNCtpWUhn?=
 =?utf-8?B?VFFGOHVSd1dwNkN5a2ZFb1hZaTMyRGI3YkpHMktPUXFNM1RJL2NiaGtmMEdM?=
 =?utf-8?B?LzZITU8xOU0yVzlIaUFJcHRxWjgyN29ZNk5uSUdsSGcvb3QzME1CNzJJZW0v?=
 =?utf-8?B?eCt3MzFCaXVMRXIwRWdwb1k5bng0K3FlYVNBZlp2M2RhVk90WS9sUFJwSmNx?=
 =?utf-8?B?SzRaM2RQVXorYXRTc1YrMWZZRFp3WERJb2ViTjMxaUoyYlVtMXRaQWIxTVNx?=
 =?utf-8?B?aG1QbVM3Ymc5RUdiTEFoQ0RxWHFlRFBMaklzNEpmQlJxK0kzUEhlRHVEbEZa?=
 =?utf-8?B?TTV5d0paK3BEdlhHMmZ4aXJGN3h1TXEyMGUwZEpVVnE2cFJaenZaR281SFE0?=
 =?utf-8?B?dE45QitZN25qaHJsQndSS1JoT3ZkYXhnWVgyMHpLUzRxSGxSTnVDOS9jaGJY?=
 =?utf-8?B?OXpxM05ma1BwSVVRSm1STStuMU1oSWZrYnJOdENtMi81dFdOZzZheWZvbzJX?=
 =?utf-8?B?bU14RWtzTWc4d3VxNHV3NVZuZGJ0a3RIT0dmRTkwODYzK1k1RU5LMmlCU3VM?=
 =?utf-8?B?ZVZaRVlMSnNEWjJuTTQvZUNuZjBZYXB4SjNMK2F5bGdmNi9uS2t4ZmpKRXB6?=
 =?utf-8?B?MVpkQ05GcDAybEpoK0NVMisxamNweVkwbjYyWWFVdEhEU2xjQXhnd2p6QWt3?=
 =?utf-8?B?N0pFMTRIUkN3N2JOcFBvMUh0dDJpZnpHeTJIeXhBRzBQK1MwQkhzeE9oOXEx?=
 =?utf-8?B?MDFvK0VVRjJPRGFiNU5DZzZmZ01jdE1PUVN1MU5UdFFNdTJnZjd6Z1pFVEY4?=
 =?utf-8?B?RUkxY3JNc2FVelY5V2duTmtEUGdMWDRwYllFb01qSWFUZnNubTJXUjFoeG90?=
 =?utf-8?B?dVphU0NaTHJEd1pDb2lkZWxRTG1vUGJJQmdHSVBsdk5KOGRVN0VxditnN2VX?=
 =?utf-8?B?UHZZSGxDd2haZmNVeWxUbHFtdzRkVXplSzh4YWUrN0NPN2JhMjVRbDJqdDh1?=
 =?utf-8?B?a0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+EBq+SRsNVsFL00D3FCI5J7Sp0lIgN28LKaMyAvGUcz4ijhjNOtL8le6r2YFMBIULkVlrmQT1w5rZh28z1tmABiXAsUWtnCDovoAoa5J+wfYum41U7nRBWX5yQKlECwCagIReEGCcJS3xLRO3XhtL9S1iLJaMQE80l5hiK0Tzme1eHO+GRyCnW7dIpNZ1a5qJ15z7kF97oIyh085FTgdKjymM4DsgQPbCbU0KIsAu+hrSWefx8X1dIyjc3psJBF7yT49ebT6EsMqSuXC+zA18BGNhbAuyl3hSHASQOMdyMAKRRXcu4WLmmhVLo2LkAso/Ko4ypY0pIbyQ8xrmc6AhKkq6ymjJfpthYZWr45BMou71EDUUCpExVNLUTLwjjslJl1/0Le+xZ8fX5wyjqhDcmL5JuUYpqUM3/PZBF0Jq0fgJGJAuJ3rGMnf+TdaRvwi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:30:27.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 629085a4-4836-45d4-2d63-08de63524d9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997583
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 18:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17070

On 1/31/26 9:29 AM, Denys Dmytriyenko wrote:
> On Fri, Jan 30, 2026 at 04:08:29PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Arago is a reference distribution for TI hardware and a foundation for
>> application/product specific Linux SDKs. While Arago can produce an SDK
>> for TI products on its own this is not *the* "TI SDK" shipped today, which
>> is generated by a layer called "meta-tisdk". This "meta-tisdk" produces
>> images with the tisdk branding such as "tisdk-default-image" but as Arago
>> provides images of the same name this is done by appending to the Arago
>> version. This means the content of "tisdk-default-image" changes depending
>> on what layers you have included. Instead there should be different names
>> for images containing different content, the solution here is:
>>
>>   meta-arago -> arago-*-image
>>   meta-tisdk -> tisdk-*-image
>>
>> The tisdk images can still be based on the arago images, but this way
>> it is clear what you are getting based on the image names.
>>
>> Rename the images here in meta-arago to be prefixed with "arago", and
>> remove some of the legacy "TI SDK" branding.
> 
> Looks good, but I see that git didn't pick up the rename of
> tisdk-jailhouse-image into arago-jailhouse-image and treated
> it as add/remove - probably need to lower the similarity
> threshold with -M<n>?
> 

Seems -M30 is enough to get git to see the rename, will resend with that.

Thanks,
Andrew

> https://git-scm.com/docs/git-format-patch#Documentation/git-format-patch.txt--Mn
> 
> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   check_yocto_rules.json                               |  4 ++--
>>   meta-arago-distro/README                             |  2 +-
>>   meta-arago-distro/classes/tisdk-bundle.bbclass       |  2 +-
>>   meta-arago-distro/conf/distro/arago.conf             |  2 +-
>>   .../conf/distro/include/branding-bleeding.inc        |  4 ++--
>>   ...t-image.bbappend => arago-default-image.bbappend} |  0
>>   ...t-image.bbappend => arago-default-image.bbappend} |  0
>>   .../bootstrap-initrd/bootstrap-initrd_1.0.bb         |  2 +-
>>   .../{tisdk-base-image.bb => arago-base-image.bb}     |  2 +-
>>   ...p-base-image.bb => arago-bootstrap-base-image.bb} |  2 +-
>>   ...k-bootstrap-image.bb => arago-bootstrap-image.bb} |  2 +-
>>   .../{tisdk-core-bundle.bb => arago-core-bundle.bb}   |  6 +++---
>>   .../{tisdk-core-bundle.inc => arago-core-bundle.inc} |  4 ++--
>>   ...tisdk-default-image.bb => arago-default-image.bb} |  4 ++--
>>   .../recipes-core/images/arago-jailhouse-image.bb     | 12 ++++++++++++
> 
> ^^^
> 
>>   ...jailhouse-inmate.bb => arago-jailhouse-inmate.bb} |  6 +++---
>>   ...k-thinlinux-image.bb => arago-thinlinux-image.bb} |  2 +-
>>   .../{tisdk-tiny-image.bb => arago-tiny-image.bb}     |  4 ++--
>>   ...sdk-tiny-initramfs.bb => arago-tiny-initramfs.bb} |  2 +-
>>   .../recipes-core/images/tisdk-jailhouse-image.bb     | 12 ------------
> 
> ^^^
> 
>>   meta-arago-extras/README                             |  2 +-
>>   .../recipes-core/packagegroups/ti-test.bb            |  2 +-
>>   22 files changed, 39 insertions(+), 39 deletions(-)
>>   rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/{tisdk-default-image.bbappend => arago-default-image.bbappend} (100%)
>>   rename meta-arago-distro/dynamic-layers/selinux/recipes-core/images/{tisdk-default-image.bbappend => arago-default-image.bbappend} (100%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-base-image.bb => arago-base-image.bb} (89%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-bootstrap-base-image.bb => arago-bootstrap-base-image.bb} (91%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-bootstrap-image.bb => arago-bootstrap-image.bb} (90%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-core-bundle.bb => arago-core-bundle.bb} (81%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-core-bundle.inc => arago-core-bundle.inc} (83%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-default-image.bb => arago-default-image.bb} (91%)
>>   create mode 100644 meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb
>>   rename meta-arago-distro/recipes-core/images/{tisdk-jailhouse-inmate.bb => arago-jailhouse-inmate.bb} (53%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-thinlinux-image.bb => arago-thinlinux-image.bb} (94%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-tiny-image.bb => arago-tiny-image.bb} (81%)
>>   rename meta-arago-distro/recipes-core/images/{tisdk-tiny-initramfs.bb => arago-tiny-initramfs.bb} (93%)
>>   delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
>>
>> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
>> index 7b3e20db..a6a46f42 100644
>> --- a/check_yocto_rules.json
>> +++ b/check_yocto_rules.json
>> @@ -12,8 +12,8 @@
>>       },
>>       "GUARD-1" : {
>>           "skip_files" : [
>> -            "meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend",
>> -            "meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend",
>> +            "meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/arago-default-image.bbappend",
>> +            "meta-arago-distro/dynamic-layers/selinux/recipes-core/images/arago-default-image.bbappend",
>>               "meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend",
>>               "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend",
>>               "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend",
>> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
>> index d4ff2dd2..d5ec23af 100644
>> --- a/meta-arago-distro/README
>> +++ b/meta-arago-distro/README
>> @@ -1,4 +1,4 @@
>> -meta-arago-distro provides Arago distribution configuration for TI SDK products
>> +meta-arago-distro provides Arago distribution configuration for TI products
>>   
>>   This layer works with the latest Yocto Project release (currently 2.2+) and tracks
>>   the stable/maintenance branches (currently "master") of the corresponding layers:
>> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> index fb2073ef..cc5d1481 100644
>> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
>> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
>> @@ -31,7 +31,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   # List of target side images to be built and packaged.  By default take
>>   # the base image but this can be modified if desired to package
>>   # additional images.
>> -TARGET_IMAGES ?= "tisdk-base-image"
>> +TARGET_IMAGES ?= "arago-base-image"
>>   
>>   # path to install the meta-toolchain package in the SDK
>>   TISDK_TOOLCHAIN_PATH ?= "linux-devkit"
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 9f68e162..90c757fa 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -124,7 +124,7 @@ PACKAGECONFIG:append:pn-kmscube = " gstreamer"
>>   PACKAGECONFIG:remove:pn-opencl-cts = "opengl gles vulkan"
>>   
>>   # Configure RAMFS for jailhouse linux-demo
>> -JH_RAMFS_IMAGE = "tisdk-jailhouse-inmate"
>> +JH_RAMFS_IMAGE = "arago-jailhouse-inmate"
>>   
>>   # Enable UI and scripting for perf
>>   PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
>> diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
>> index 4efbb225..9d470c16 100644
>> --- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
>> +++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
>> @@ -35,5 +35,5 @@ DATEH := "${@time.strftime('%Y%m%d%H',time.gmtime())}"
>>   CORESDK_RTOS_FILE_PREFIX = "${DATEH}-"
>>   CORESDK_RTOS_FILE_SUFFIX = ";downloadfilename=${CORESDK_RTOS_FILE_PREFIX}${DEFAULT_FIRMWARE_FILE}"
>>   
>> -# Build and assemble TI-SDK, but don't package it
>> -IMAGE_FSTYPES:pn-tisdk-core-bundle = ""
>> +# Build and assemble Arago SDK, but don't package it
>> +IMAGE_FSTYPES:pn-arago-core-bundle = ""
>> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/arago-default-image.bbappend
>> similarity index 100%
>> rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend
>> rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/arago-default-image.bbappend
>> diff --git a/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend b/meta-arago-distro/dynamic-layers/selinux/recipes-core/images/arago-default-image.bbappend
>> similarity index 100%
>> rename from meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend
>> rename to meta-arago-distro/dynamic-layers/selinux/recipes-core/images/arago-default-image.bbappend
>> diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
>> index 57070459..c64f0303 100644
>> --- a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
>> +++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
>> @@ -8,7 +8,7 @@ CLEANBROKEN = "1"
>>   
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> -BOOSTRAP_IMAGE = "tisdk-bootstrap-base-image"
>> +BOOSTRAP_IMAGE = "arago-bootstrap-base-image"
>>   
>>   TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
>>   
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/arago-base-image.bb
>> similarity index 89%
>> rename from meta-arago-distro/recipes-core/images/tisdk-base-image.bb
>> rename to meta-arago-distro/recipes-core/images/arago-base-image.bb
>> index 25738059..005704c5 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-base-image.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "Arago TI SDK base image with test tools"
>> +SUMMARY = "Arago base image with test tools"
>>   
>>   DESCRIPTION = "Arago SDK base image suitable for initramfs containing\
>>    comprehensive test tools."
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/arago-bootstrap-base-image.bb
>> similarity index 91%
>> rename from meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
>> rename to meta-arago-distro/recipes-core/images/arago-bootstrap-base-image.bb
>> index ed964415..f6fc23d9 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-bootstrap-base-image.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "Arago TI SDK bootstrap base image for initramfs"
>> +SUMMARY = "Arago bootstrap base image for initramfs"
>>   
>>   DESCRIPTION = "Image meant for basic system verification of linux kernel.\
>>    Intended as basic test system, this image does not package the kernel\
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/arago-bootstrap-image.bb
>> similarity index 90%
>> rename from meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
>> rename to meta-arago-distro/recipes-core/images/arago-bootstrap-image.bb
>> index d0aef0de..d6fa5444 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-bootstrap-image.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "Arago TI SDK bootstrap image usable for board bringup"
>> +SUMMARY = "Arago bootstrap image usable for board bringup"
>>   
>>   DESCRIPTION = "This image is a complete package containing a rootfs\
>>    and an initrd with platform test utilities that can be used for new\
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/arago-core-bundle.bb
>> similarity index 81%
>> rename from meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
>> rename to meta-arago-distro/recipes-core/images/arago-core-bundle.bb
>> index 0711ec10..4b188fd7 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.bb
>> @@ -1,11 +1,11 @@
>> -SUMMARY = "Installer package for TI SDK - NOT for direct use on target"
>> +SUMMARY = "Installer package for Arago SDK - NOT for direct use on target"
>>   
>>   DESCRIPTION = "This creates an installer including all the default images\
>>    recommended including source, binaries, filesystems, etc.\
>> - for TI SDK. This is meant to be used on the host system.\
>> + for Arago SDK. This is meant to be used on the host system.\
>>   "
>>   
>> -require tisdk-core-bundle.inc
>> +require arago-core-bundle.inc
>>   
>>   DEPLOY_SPL_NAME:omapl138 = ""
>>   DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
>> similarity index 83%
>> rename from meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> rename to meta-arago-distro/recipes-core/images/arago-core-bundle.inc
>> index 2e3a3072..63b73229 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
>> @@ -1,4 +1,4 @@
>> -# This include is for the common setting used to build TISDK images.  These images
>> +# This include is for the common setting used to build Arago SDK images.  These images
>>   # include both host and target side content.
>>   LICENSE = "MIT"
>>   
>> @@ -27,7 +27,7 @@ DTB_FILTER:j7200 = "j7200"
>>   DTB_FILTER:j721s2 = "j721s2"
>>   
>>   # List of target side images to build for the SDK
>> -TARGET_IMAGES = "tisdk-base-image tisdk-default-image tisdk-thinlinux-image tisdk-bootstrap-image"
>> +TARGET_IMAGES = "arago-base-image arago-default-image arago-thinlinux-image arago-bootstrap-image"
>>   
>>   TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
>>   TOOLCHAIN_SUFFIX = "-tisdk"
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> similarity index 91%
>> rename from meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> rename to meta-arago-distro/recipes-core/images/arago-default-image.bb
>> index 27c5671c..becd3e9b 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
>> @@ -1,6 +1,6 @@
>> -SUMMARY = "Arago TI SDK full filesystem image"
>> +SUMMARY = "Arago full filesystem image"
>>   
>> -DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
>> +DESCRIPTION = "Complete Arago filesystem image containing complete\
>>    applications and packages to entitle the SoC."
>>   
>>   require arago-image.inc
>> diff --git a/meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb
>> new file mode 100644
>> index 00000000..e1b265b5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/images/arago-jailhouse-image.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "Arago image for Jailhouse Hypervisor"
>> +
>> +DESCRIPTION = "Arago image meant for running Jailhouse, a partitioning \
>> +Hypervisor based on Linux. This image is derived from arago-default-image and \
>> +contains additional firmware and management tools for Jailhouse.\
>> +"
>> +
>> +require recipes-core/images/arago-default-image.bb
>> +
>> +COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
>> +
>> +IMAGE_INSTALL += " jailhouse"
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb b/meta-arago-distro/recipes-core/images/arago-jailhouse-inmate.bb
>> similarity index 53%
>> rename from meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
>> rename to meta-arago-distro/recipes-core/images/arago-jailhouse-inmate.bb
>> index bcde33d6..0ee22878 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-jailhouse-inmate.bb
>> @@ -1,11 +1,11 @@
>> -SUMMARY = "Arago TI SDK super minimal base image for jailhouse linux demo"
>> +SUMMARY = "Arago super minimal base image for jailhouse linux demo"
>>   
>>   DESCRIPTION = "Image meant for basic boot of linux inmate for jailhouse\
>> -This image is derived from tisdk-tiny-initramfs and contains additional\
>> +This image is derived from arago-tiny-initramfs and contains additional\
>>   packages for OOB demo.\
>>   "
>>   
>> -require recipes-core/images/tisdk-tiny-initramfs.bb
>> +require recipes-core/images/arago-tiny-initramfs.bb
>>   
>>   COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
>>   
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
>> similarity index 94%
>> rename from meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
>> rename to meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
>> index 477986e4..a30acbfb 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "Arago TI SDK Thin Linux image"
>> +SUMMARY = "Arago Thin Linux image"
>>   
>>   DESCRIPTION = "Minimal bootable image with container to start the next\
>>    complex system up."
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
>> similarity index 81%
>> rename from meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
>> rename to meta-arago-distro/recipes-core/images/arago-tiny-image.bb
>> index 40c58e99..76047f75 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "Arago TI SDK super minimal base image for initramfs"
>> +SUMMARY = "Arago super minimal base image for initramfs"
>>   
>>   DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
>>    bare system, this image does not package the kernel in the\
>> @@ -16,4 +16,4 @@ IMAGE_INSTALL += " \
>>   	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
>>   "
>>   
>> -DEPENDS += " tisdk-tiny-initramfs"
>> +DEPENDS += " arago-tiny-initramfs"
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/arago-tiny-initramfs.bb
>> similarity index 93%
>> rename from meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
>> rename to meta-arago-distro/recipes-core/images/arago-tiny-initramfs.bb
>> index 8a4262b1..4605b7a1 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
>> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-initramfs.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "Arago TI SDK super minimal base image for initramfs"
>> +SUMMARY = "Arago super minimal base image for initramfs"
>>   
>>   DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
>>    bare system, this image does not package the kernel in the\
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
>> deleted file mode 100644
>> index b7bfc825..00000000
>> --- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -SUMMARY = "Arago TI SDK image for Jailhouse Hypervisor"
>> -
>> -DESCRIPTION = "Arago TI SDK image meant for running Jailhouse, a partitioning \
>> -Hypervisor based on Linux. This image is derived from tisdk-default-image and \
>> -contains additional firmware and management tools for Jailhouse.\
>> -"
>> -
>> -require recipes-core/images/tisdk-default-image.bb
>> -
>> -COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
>> -
>> -IMAGE_INSTALL += " jailhouse"
>> diff --git a/meta-arago-extras/README b/meta-arago-extras/README
>> index fc04e6af..9a4c5b25 100644
>> --- a/meta-arago-extras/README
>> +++ b/meta-arago-extras/README
>> @@ -1,4 +1,4 @@
>> -meta-arago-extras provides additional TI SDK applications that are distro-agnostic
>> +meta-arago-extras provides additional TI applications that are distro-agnostic
>>   
>>   This layer works with the latest Yocto Project release (currently 2.2+) and tracks
>>   the stable/maintenance branches (currently "master") of the corresponding layers:
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index 22957218..f2ae1aef 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -169,7 +169,7 @@ RDEPENDS:${PN} = "\
>>       ${TI_TEST_TI_TOOLS} \
>>   "
>>   
>> -# Package group for things that should only be present in tisdk-default-image
>> +# Package group for things that should only be present in arago-default-image
>>   PACKAGES += " ${PN}-extras"
>>   RDEPENDS:${PN}-extras = "\
>>       ${TI_TEST_EXTRAS} \
>> -- 
>> 2.39.2


