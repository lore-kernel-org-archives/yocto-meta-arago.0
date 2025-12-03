Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1C8D12D69
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:08:17 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16063.1764770893859102748
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 06:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=RRVk+t/3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.25, mailfrom: vigneshr@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSx7jibGrBNWmRQTcrzg37XTXMUoNZ/HXqW8WSQWq0k9YjQHFMZBFOBYjFd8ISClEWfICWE2RLHVET46DuJ4PNQjA6p6uXNOjKsZtsB0+utPiN/r/uUbHEjhpZzCVK677LXVfBgS7JctKbmmhx4X1JJyDWs4/3zvLd4GAyJqhuDdR0teXz7NpBtMHvZnytapWwI99RRDTqoWQR7LVh5Q8uafE4HnPOwpnbFm8rpNDiDyQfwmJSqoJL6/EjVvsourGFpQYhXh3BxSG30wm4mbsblskq2MxC2XhsFlKh3gkyMd8Hhqvt1OojXzPQldq2/51vrxuWZX2sGaX5yxdwCL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65KsTnALWgGcJ2WMJX6C3SrAZIYJ0imzcPHeG4L57Dw=;
 b=ZaBY6xqCvoE05fXW7VuZTpQgpmp4irpULtPth9ss1iXItbP+D08EB0/wgtPGfD+kwmGyOGgj+i41EtizT1EBDbiKLFAuRIudfu+yRP9SAT4Iy3fe9OnHmXN3siHb1DG+E/KzPnyj6ItuLn4la9WHhpW5T5N0n/YKgQKpg1OKNBw8ahaKXDM8d1orTsSxc2LiRQQhZvXNF//+Zpsk/uxkdcfmLFQP1wPzUrCbeet3uFVn7IJflvlzlvEdncVqtabcRQDP3R5bJLCoi1x+Pju+e2VoEqjiCIpYErxJrKfIA42n1k1iEPjthVxPbVjiPUvndYTQcm5DyPZUbMCTshJ3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65KsTnALWgGcJ2WMJX6C3SrAZIYJ0imzcPHeG4L57Dw=;
 b=RRVk+t/3X3Hb2CsbpvAxiG7Mj05DSPLIN4LdLNQRpjYO/dd6x/wk4dwsJNN5iwU9tPFXKt/LJyILJpxv8hYP7vN4JAfbt0eqWfBI5nckCaMYtfQAlP6rUq3iNOuXfBDLwZmz04Agk8nR++fGnZmN+0HC3+nUptoI/NVcGHLNRJA=
Received: from SA9PR13CA0022.namprd13.prod.outlook.com (2603:10b6:806:21::27)
 by PH0PR10MB5894.namprd10.prod.outlook.com (2603:10b6:510:14b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:08:11 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::5e) by SA9PR13CA0022.outlook.office365.com
 (2603:10b6:806:21::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 14:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:08:09 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 08:07:59 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 08:07:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 08:07:58 -0600
Received: from [10.249.142.58] ([10.249.142.58])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3E7uV94123511;
	Wed, 3 Dec 2025 08:07:57 -0600
Message-ID: <8f848b91-5e75-42f4-9606-004f7bd7dd0f@ti.com>
Date: Wed, 3 Dec 2025 19:37:55 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [meta-arago][scarthgap][PATCH RFC 0/4] Add support for SWUpdate
To: Denys Dmytriyenko <denis@denix.org>, <anshuld@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denys@konsulko.com>,
	<reatmon@ti.com>
References: <20251202111603.1616989-1-anshuld@ti.com>
 <20251202205914.GE11121@denix.org>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251202205914.GE11121@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|PH0PR10MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: eb76fe4e-8f6b-4791-b456-08de32756350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ayt1NVQ3UzRxQUZMZDNCR0RzcllXSWtHd0x5cWdlcmtIU0N6eU40dWxWemNN?=
 =?utf-8?B?ZDg3dDZ0enZOM2JaL2djcytwTmNSSzZEc201YVUxQjdHaFhLa1JZQ0gxU0Z3?=
 =?utf-8?B?N0F6YzA0MmNxdnFzdlVUTzhqSk5OMnpGOXZyc01RK2lCWTN6T1ZtbStoS0cr?=
 =?utf-8?B?dGI0YnNzYXNMSzhhZmxDUU9jZjlMeUpMQ29xek5GVEZHMkExMmJBczJTNXpW?=
 =?utf-8?B?QXNRaXRMOGhFQVd1NFcwM1FNTWhwS0N0d1plQk5XRmJVWEJoVmFvdW5VOUlL?=
 =?utf-8?B?R2tOZTNQV0VLN2Njd3hrSWpXZ1FXN2dhMTFmL0tMTXBwZjRKZnozSXpPUTJT?=
 =?utf-8?B?K21UTWVLMVhCWmNWd3VFMVZZTDh0SzhGVVNjeU9DNHFYekJxN2E1dlJYU0o3?=
 =?utf-8?B?a2hiSWRMQTdQWllyVFg1TDNQZUtoaUtwV1htTDJweUMxQ2pFOEp5a3FOcVZ0?=
 =?utf-8?B?NjBncXJIblBzZndTbzIwNWYyNXJKcnVlNnM5TTRPMTdlVENSN2dJWjBDUWpi?=
 =?utf-8?B?VmhVcFdVZXNaVWVvbHhvQmVOTWFQNHpJL3J2QU5ickk1U2k1bHYrMUpjQ2gz?=
 =?utf-8?B?dVgzZjBwdVBqMXdxTHdMb3JTRFBmVlZ2Y0tOSDJnK3V6SHRBTE10OEVVdGNV?=
 =?utf-8?B?dzVySDQvMVhDejhCRXEzVTVtam5ITEx3NUhSbEk3RExXQUc3Y0hiVG1YbUtt?=
 =?utf-8?B?SmRLWFJGQy80c3lhbmpIdGszSmlwMXptYTdPRVA0MzdwZ2M1bkM5MHNWMERr?=
 =?utf-8?B?bjVGMVNUVzIwRjJEbWcvN2VTUUZNT3JLMzVzV0g1SktyV1dIcVZKVTRKd2cy?=
 =?utf-8?B?Q1IvcFJaNW1PNlozMURWbmU4V0ZxVEF1WEdYTW8xankwYWdYeGUzL1VycVNC?=
 =?utf-8?B?MTVjajQ0OFIzbDZLMlNOb25QZ3FTZjlCWVFKSng5QlpXcFM1YUpMT1RqcnEr?=
 =?utf-8?B?WXdnenJ0bjUvakhIdlYzZmNMU29tM1ZleFRhQ2VyREVBRHJhTGR3ajdpNW5B?=
 =?utf-8?B?eEJWcXNaV3NBR0R0TzhlNUlqdmJrbVdUNEpYU1JDTWVMTHNkNGN1azh2NTlu?=
 =?utf-8?B?bmpicEREeUtPZE1LRHZoQlNyQXBNaGhBNzdRTlAwK09SL1VOY2EveFlocEh5?=
 =?utf-8?B?MlU1WitiQ1hRQWZlRUNnNW1RaGF2UGVjY2lRSVkrQ0oxenhMbXVnbFZOdVpR?=
 =?utf-8?B?NUE0cDhrbFl3dHI4bk9qRDdzRlRHalBLdklZT2ZIQW1uN3EyQmEvV3Fsbi9U?=
 =?utf-8?B?UE85dzVmd29GVEltd3FyUWhqeUlrclNLVnpLa1RXYlJWUGljcVljSCsrdVF4?=
 =?utf-8?B?SEE1Q01rWXNpdWlPY0VCQlBIVWtqQ3VKWGovaDZkMlhmVENGZUpYSm5lS2tB?=
 =?utf-8?B?VXlncVZscFZVUG1MQWYyYjNTMnk2TEVOL0x6Vk1QRTVBa2NjbGlMV2h5Q3Nv?=
 =?utf-8?B?eGR4ZmVTaElWMnd4M05wMGJZWnNaT0tBNm1FTGpIZjRyR2t2aC8vSjYycXVC?=
 =?utf-8?B?VjE3STg4R1ZBVkpZZzdyWjF4YjBBMUJGZlJDd0crQmh1UE1ESlNiV3c0OEFP?=
 =?utf-8?B?Y05WL3lOK0hmYTU0WWI3U3JTTEpFaFpOVVY2aTNnVjVkMzRibFpuSlh2UktG?=
 =?utf-8?B?bko0NDlOa0NEbXB2ZE5OZkdMdUZQVjFOMVhlUk1QUGxtNHlmSkFYaTczWTZZ?=
 =?utf-8?B?d21ucG50Vy9yZXR2d0wvMm1BekdxUnlqN2pKVnNtbjZiYjF4bTdKb0Voa2tD?=
 =?utf-8?B?SmV2a05wZDZTTnh3UmhtUENyQ1Y2dkJSRFRpZ043RTMyUlpKS2RuTktmZ3hu?=
 =?utf-8?B?b0ZMYnJIbWZhL2NYQkpTazNDZkdJUzRzV09SdWNZZ3RnQzhONHk2MWVYWDF5?=
 =?utf-8?B?RVZxclZMZmFNaGthYTNlQXRVcHRFOHBya3RqeUM3bmRURXdBc2FnU3FCVXdo?=
 =?utf-8?B?a2JrYmFBSW43YTFETFNKK0REVVRNVGhYNjE0VWl2L2hwWXNGSW5iNzhPaGNp?=
 =?utf-8?B?UXdycWlnd2xWNVduRjdhMlhSVDFhM0NKNmgybDhlaFhEZE5Db210M2E0K2lu?=
 =?utf-8?B?UnJzcWsrekpmcnpYeHBtbkpod2xqS0N5SEw5RnUwaUZIZGVnNUZMM1NuY2lv?=
 =?utf-8?Q?yXjA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:08:09.1769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb76fe4e-8f6b-4791-b456-08de32756350
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5894
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Dec 2025 14:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16858

Hi Denys,

On 12/3/2025 2:29 AM, Denys Dmytriyenko wrote:
> On Tue, Dec 02, 2025 at 04:45:57PM +0530, Anshul Dalal via lists.yoctoproject.org wrote:
>> Hi all,
>>
>> This RFC adds support for SWUpdate[1] to meta-arago, this provides us with OTA
>> updates with A/B redundancy for the rootfs.
>>
>> For now the support is enabled for eMMC boot only based on the 'ti-swupdate'
>> override. The below steps can be used to test this RFC on an AM62x EVM:
>>
>>  1. Add 'meta-swupdate' layer[2] to the SDK sources directory.
>>
>>  2. Since the bootloader side changes have not been merged to ti-u-boot yet,
>>     make use of the 'swupdate' branch from my own U-Boot fork[3].
>>
>>  3. Enable 'swupdate' support by setting the 'ti-swupdate' override in
>>     local.conf as follows:
>>
>>       DISTROOVERRIDES:append = ":ti-swupdate"
>>
>>  4. Flash the U-Boot binaries to the correct offsets on boot0 partition as
>>     per the docs[4] and run 'env save' on first boot to save the environment to
>>     eMMC's hw partition.
> Why not use a more established A/B solution, such as RAUC (or even Mender)?
> 

SWUpdate is still the most widely requested option from users of TI K3
SoC. Its a more versatile than RAUC as it provides flexibility wrt image
level vs file vs block level updates.

AFAIK, Both RAUC and SWUpdate are equally powerfully and well
established. Could you help me understand why RAUC is more established
than SWUpdate?

AGL seems to be on OSTree. OpenWRT, CIP is SWUPdate. Buildroot supports
both (default is SWUpdate), so there isnt a common theme. Though
SWUpdate seems more common in industrial focused distro space as far as
my knowledge goes.

Mender is a different story though, its open source but has commercial
element to it. And at least K3 based beagle devices are already
supported via mender.io [1].

[1] https://hub.mender.io/t/board-support-index/5742

Regards
Vignesh


