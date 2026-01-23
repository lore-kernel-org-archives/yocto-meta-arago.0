Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59385D77891
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:14:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.423.1769188498016685517
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 09:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NC9ceHQn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.9, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG5BOyI5fdH8wloV6TFy46n6lCwKcO6NzyTgGn9pSD//6R5P+luDSZQMFA3ddiigzeJpPr2M/Z6R4uvHmwxC5/e9h+a90gBRmFy2RTos16wNFALVcSFjtQ5kRXUlr07excVkrOjXQXFH1257Su+cShSClrtM6QiRU1J0ZOw4HwypevaeWRIbuQmeXs8/hdb5FGqfJjF0iMjGfCwjLOLiI22uGJOSZ8PnETKXVt9zF4PDrHdr4wik+amCw5JSxzztjWt9nCLJOYyEGaUw1tjv4vr71q+x8wKnMWKKLeoNim/Vfb0MKHZX17+FO80jjmXgzcIY4mUl/JleE2eGpD4C+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e61+uK1uhSG/ySziO06ddk6bOdeP5IOYSzuVxYbLmnE=;
 b=UTb8Bl2/LFpZmvJnQ7o5Y3yIRAfiTWBtrY0vUFoa0GkQC4aaDM40hRCV2ITdx7iNBjOcW2P9fh1os+fVFrPzFZmxtM6OLCE3lqSYkTtltQhZGfo9+DWipXHexkYaIaNBmn8WFBpo6DotyQcDa8IToO/m6CDEkTiz90z8fD62jA1hzp2N5/YVIrNAxWl+JLUUpZRvNmWV4Vqmx4/f42cjDZ12PdS7C0CqT2GMtUSX3M2Lhyqxy7BK1jzHmWZYbsa9u1e8FgTu/rFjkHuF6E+CyA/Rsqbd3SenDuXPLaS7Alf0bLLUt4BpE7CrBIZ5WI2daDYzlna3YYCvqKWCCxbJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e61+uK1uhSG/ySziO06ddk6bOdeP5IOYSzuVxYbLmnE=;
 b=NC9ceHQn1QNIgKbflcu7kDsVpt9Ubo5GfcnHCVLLoOURZLkDAqAQVAflq7Gdjovry0nqmiZCR7aO453ZLQEa7zMO/Dbd8O44kqkIoKO8Issxpx6oTMMaDnQrzXs7NAw0t10wz+2xPkCPgDghydXAcAWhDpQA7TS6bGECsRYu1k0=
Received: from BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45) by
 SJ0PR10MB4496.namprd10.prod.outlook.com (2603:10b6:a03:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Fri, 23 Jan
 2026 17:14:54 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::3c) by BYAPR01CA0068.outlook.office365.com
 (2603:10b6:a03:94::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 17:16:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 17:14:52 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 11:14:19 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 11:14:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 11:14:18 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NHEIMx2670461;
	Fri, 23 Jan 2026 11:14:18 -0600
Message-ID: <2d7bc0e8-ae92-4825-98ae-cdc892accfcd@ti.com>
Date: Fri, 23 Jan 2026 11:14:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][RFC PATCH 3/3] tisdk-default-image: Add audio server
 support for am62dxx
To: Denys Dmytriyenko <denis@denix.org>
CC: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
	<praneeth@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<afd@ti.com>, <devarsht@ti.com>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
 <20260123060348.2493115-4-p-bhagat@ti.com>
 <446b4187-af51-4af9-b97f-97058399cdb6@ti.com>
 <20260123170112.GC11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260123170112.GC11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SJ0PR10MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 9624988f-0638-45db-e25f-08de5aa2ec4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDNFQVNKMTEwZmlVQXlJaXZGU3kxa29aQWdxVjFtd05BaEZ4QVI3UU5JdERF?=
 =?utf-8?B?Z0xISzQxeS9rRzFjZjZXQ25ZQThQaXYxUmVYYUdjTkNVb0ZIeUhYejRoV28x?=
 =?utf-8?B?VWtKYk9UaEx6WjJib2x4SjVOaTA5NFl6cjNJT0tCVWpjRFhGbXRhUnlNWWta?=
 =?utf-8?B?Wmg5UHlhazFKenJyL3lYVDNhNit0aE9CU0pWSzBNWndsekJyRWgrakIrbDUw?=
 =?utf-8?B?dVJKc3RtajVMRTZ2TjdIVWNPZmFJMS9MUjR6VkNCeitFRExlWUhsMlZrSVBO?=
 =?utf-8?B?VUJ1bElvYVJETFhrOHZCOFRYbTJ5MFVtUkZiVlladVpFMUJjK0RtSkRBakRi?=
 =?utf-8?B?ZnNUc0hOSThBVU1xUEQ2bi8rVVVqRXUzaDdmT2pleTd3Y3lQdnZIREZiYStX?=
 =?utf-8?B?bmx1SFNaMGFwRFpZa1g3Q2FuL3RkL0V6SFBzWVR3V09XRjRiK3ZETmVpQUVC?=
 =?utf-8?B?OU1pQVFCT3FKQVhMU1hvaWZ0SG1FQWhHT21rQWVxUjA0RHpYYWd5M0dpVjkv?=
 =?utf-8?B?QVNSSmtJRjZsRHowTHJyQVhpdGpwejFXMkxYRDNHR0gxbkgyY2xQditsUnpO?=
 =?utf-8?B?eFNTaHExaStCQ2tPRlZ0RHFpTHFMYnNPa2NEd1NDVGxIcTVhVmx6dlFQQW9z?=
 =?utf-8?B?Q0pjMXRVK0ljZGltMHpDWUhRUUJHWHBpbFc2UUljWnRmUjZ1ejJHQUNlb1Qr?=
 =?utf-8?B?RnV2Tm1CNjZrNWlxTnN1ajQvOXZwaUF1RFRUMHJvWXQ0M0dIb29lMEoxSWtJ?=
 =?utf-8?B?NWZscThxWmxlV3hwYkE1QnNMOWZ6OGFJUVlIamNlQzgwUUQvaDdOUUFna0kr?=
 =?utf-8?B?cGxyVCtJY1RIMVJQZlI2Y1ZseDFWRkF6SVFhcGUwdmdYc1VtYjVjaE1pWlpN?=
 =?utf-8?B?ODk3SE5wU3hSL1cxNUUxOWJBeFZqbHB6T0xoKzl4LzhGdmFzSHh0Nnk2ZFhU?=
 =?utf-8?B?YklibGJsaFd3bmFSV3NBbyszaU4yd2pQdFNFa3R3b1lIa1ZENnkxZk4yZ2xk?=
 =?utf-8?B?NC9taklGV0xGSkk5MjZhaFJiQ0JiN0F2NnVEMjhQRzFuTys5WmtveWZhTTd2?=
 =?utf-8?B?WWFtaTM4UThnaXBnMThLTXVmVDZkUlpLSmlaOGNNRXlEblM5UzZQdXFoMHBK?=
 =?utf-8?B?dGovczJlY2p0am1rUHJhMHN3eU1nMkwxMTJPcTFta3FlRG5pY0dXd3JIemQ5?=
 =?utf-8?B?Qy9SM1lyUW1jSDQzd2ducTVQcWxXZjc5TTJ3VmUzbUlsR0tnc3Q0eHJvV2Rw?=
 =?utf-8?B?TjBsMmdjcFlLT0F1c1hoYjUzOWhuc3VZcm5sbi9ua1dTV25KOW5tWkhHaXpV?=
 =?utf-8?B?b2FXWWI1SUNEUmE4ZTNzQkR2cTNvYWthQ2w3aERLUFJ6eTZqZWZlNkg5QVRr?=
 =?utf-8?B?TzBvU0dJcUZMT28wNTU1eUFzakRQKzZ0bHlQeVoxaFFjSFUrd2M2TzM0bWdO?=
 =?utf-8?B?UHRwY1ErdEdlQVgzUXNpbVRQQjUzVnJENWNnRm9WeTlYMlV2NVlGZ1JpNm5r?=
 =?utf-8?B?R29WWmpubjRsaG8ydjFlc1hJaEkxSjNOc0dMQjRleXFMeU9sdy96NkRhWlBQ?=
 =?utf-8?B?UzZZSnNKQ3lHdDlkeW1iOElLQzRrRkVqWExrRU5pM2p2ckZLcTcvZGVhSGxu?=
 =?utf-8?B?TUFndWVaK2R1SnlKUGhteGE2Zm1VdHEvMlU2ZDRtT1FwRkRMOHJ6MzdYVXVy?=
 =?utf-8?B?WWNVMm8yM2lpajRPNW14bzZxMFRPaCs3SUR6dnZMQkdMY0xnenlBUE1SQUkv?=
 =?utf-8?B?Y3NBSURTdUFFUURUTUx4em92TjM1dmM1dTZDMmJLdG51RmNRMy9pRDg1S1Jy?=
 =?utf-8?B?aFFVMEFodFhCOG1SUGRSdmZsL1o0eW5CaDQrWCtmMFJQZ2VEQWJkZU5CUS8x?=
 =?utf-8?B?UkRERjZLbWVRVDhTclBKOGk1aWh2MXNmMVNYcGwwbHQzUWlRcHhHS3hCL3pX?=
 =?utf-8?B?Vnl2a0JwaytYWkV6cFZPc3lZakd2YWhNNUpHYmhCcFlsellNa09BNzhUakt3?=
 =?utf-8?B?RmUvdndwcEVtTitwZFBxc09GeTdRQWp1T1JzVUV3dVBQOWc1TldsbkxuM2Rz?=
 =?utf-8?B?RFl6d1lvWDVjbWtlS2ZXb2M5TDhhYXhZNTg5cFV0QWRwMGM1cEQ5Um93T0VJ?=
 =?utf-8?B?c0tnb1F5dkFRMVlOdHZXcUVZWnVKdDNVSGQvdTg4dEJWTEVPbjJZMUQvbE1Y?=
 =?utf-8?B?TmRuR1lkM0RuSjVvZjNmNzQ0cVdyUTB1NWcyV1l6dlpXUlI1M3N3UE9pWGkz?=
 =?utf-8?B?ZFQ0WnoxdzJGdlpZYW42R0JidC93PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:14:52.7668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9624988f-0638-45db-e25f-08de5aa2ec4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4496
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 17:14:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17033



On 1/23/2026 11:01 AM, Denys Dmytriyenko wrote:
> On Fri, Jan 23, 2026 at 10:11:06AM -0600, Ryan Eatmon wrote:
>>
>>
>> On 1/23/2026 12:03 AM, Paresh Bhagat wrote:
>>> Add pipewire and wireplumber audio stack support for am62dxx:
>>> - Include pipewire core components and tools
>>> - Add ALSA and PulseAudio compatibility layers
>>> - Include wireplumber session manager
>>> - Add GStreamer pipewire plugin
>>> - Configure pipewire with proper modules and plugins
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>>   .../recipes-core/images/tisdk-default-image.bb  | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> index 264d1b2d..d5db6fd4 100644
>>> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
>>> @@ -47,3 +47,20 @@ IMAGE_INSTALL += "\
>>>       ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>>>       docker \
>>>   "
>>> +
>>> +IMAGE_INSTALL:append:am62dxx = " \
>>> +    pipewire \
>>> +    pipewire-tools \
>>> +    pipewire-alsa \
>>> +    pipewire-pulse \
>>> +    wireplumber \
>>> +    speexdsp \
>>> +    libpipewire \
>>> +    pipewire-spa-plugins-meta \
>>> +    pipewire-spa-tools \
>>> +    pipewire-modules-meta \
>>> +    pipewire-alsa-card-profile \
>>> +    gstreamer1.0-pipewire \
>>> +"
>>
>> I'm sure at some point we will want to push the "more modern"
>> pipewire to other boards as well.  What is the reasoning for only
>> doing this on am62d?
>>
>> Please create a PIPEWIRE variable that contains the above list and then:
>>
>> IMAGE_INSTALL:append:am62dxx = " ${PIPEWIRE}"
>>
>> Also, for ease of looking up packages, please sort the list alphabetically.
>>
>>
>>> +PACKAGECONFIG:append:am62dxx:pn-pipewire = " pipewire-jack pipewire-modules pipewire-spa-plugins"
> 
> Huh? pipewire-modules and pipewire-spa-plugins are not PACKAGECONFIGs, but
> packages...
> 
> 
>>> +PACKAGECONFIG:remove:am62dxx:pn-pipewire = " jack"
> 
> No leading space is needed here.
> 
> 
>> Agree with Yogesh.  This is not appropriate in this file.  This
>> should be in a pipewire bbappend.
> 
> Or rather generically in the distro config, as I suggested last week.

Good point.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

