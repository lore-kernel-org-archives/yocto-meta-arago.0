Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAC9E9A049
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 13:50:12 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12275.1771422604982812504
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 05:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fiL4+VFW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.12, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUsU1pKQTtVO8b9NYueq8B59224HpoJQEEFLpWXNGNBLPq8hKWUcH4ID9dw2Agfvk05AjDJKPIDlY2Opo8eBCH2wer6Uh9g69Q4itcKBhRDT5LUJFByy2G95nzIHvYsbh2ocJh1z19YGv4g20ToQyF91LXMDQ3qsF3JnYcHIMduU19TLGeAKGUbtgAeWDNNZ1tuSXOIJo8i39ziAWrnP0D6F4YsxXmoOt52yZBB7FwjyTWvoX03JUL52in0DX0k6ttefIkY8nseOKeiZTg8406jylPFxUE5/KmnOSxca9s0C9dxShdt6yBtFQpvSBxGzlrgfYaOioJb0CgOK/+EjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAem2N4qnailpHaUaZ0p0uCnhSddSKvMytRMONrvcN0=;
 b=pniF/1iQHWuMWEf3Uj1NfFT7aAJy0RsydxDSOzEgW2xXrzQIGAN5B21xaTGDRZQpy1GrMQyf6zrMAdd2GnB/N1MEpmhozyDEVm2S9UwRitGajXpXAudQX+/5HU4/M5Hzq5wIUIv6dX4SXGa5kFWQlHvH5lmZYGdayb+WIAzRpoVQcjGcD5E11Ks8RLerf7RCxdzYrJgWhq2CVkMFKoibHKa8337wgQpTFucAmXxnGbouJH8R4v9seSXi9jmyVNshq3xtIFmm0xhN/K6ItleRPu+tzuVU5chVf1mJvcqFes5ORPLc3OOXkbXa+N5iS+nEaSFM+iS/shnE2kp2Gtsq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAem2N4qnailpHaUaZ0p0uCnhSddSKvMytRMONrvcN0=;
 b=fiL4+VFWCRMowBGx9kd5fM1z489Qnkjq6JLLwjAGEA0bVBunAQry/8DEu0kGue2W55pCSOrBwp7eHKu223d85SWAYsPPJSACuxIhVk+XNvDEZt1ar0/joE91FGKs9P6w8NJ+ByGKsBcuYcr9LMUPlWJJAzsAjUYzSLG6TwL4Mj4=
Received: from BLAPR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:36e::7)
 by CH3PR10MB6858.namprd10.prod.outlook.com (2603:10b6:610:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 13:50:01 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::a6) by BLAPR05CA0007.outlook.office365.com
 (2603:10b6:208:36e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 13:49:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 13:50:00 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 07:49:58 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 07:49:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 07:49:58 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IDnwxw927384;
	Wed, 18 Feb 2026 07:49:58 -0600
Message-ID: <ceb64797-cf5c-417e-b647-335e4759120d@ti.com>
Date: Wed, 18 Feb 2026 07:49:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][RFC PATCH v2 1/3] recipes-multimedia: Add
 pipewire configuration files
To: Denys Dmytriyenko <denis@denix.org>, Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
	<v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>, <j-sahu@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
 <20260210155201.3029549-2-p-bhagat@ti.com> <20260210183604.GG11121@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260210183604.GG11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|CH3PR10MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be01b5d-e8e3-40ed-e785-08de6ef49c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|4022899009|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3B2N1psV1pRK3Njc0FaL09ZZk0zSGpYa051VUlKS2hBZHJBeDBkd1NLZXp1?=
 =?utf-8?B?QkVCdngyM1R4b0JRZEc3QWJpWDhmb1B0dkw2WVlxSVlGQktLdFVUcjFBdm1D?=
 =?utf-8?B?WVpMZDhaZlN1YW0rOVg1MnZUaGRmbERZSkRmaUdmRU9CK2Z2SjZJMVFrdVVu?=
 =?utf-8?B?WHZRbWQvWXZ5WWJNZlZZejFZVUorQWJsbVg0eGN6Y1FaTG5WWnBSTWYzOCs4?=
 =?utf-8?B?eGFjZS9TSUlwU2Y2VHJNeFFDc1JJNHRHK1JkelJ1a1I0U1IrZmNzbWc5UVZq?=
 =?utf-8?B?eVoweU1IK2ZPRjBNRmNJR3ZQMmFxakFOWlNnYVZ2MkNHL0MyQm1CdWJQMzRl?=
 =?utf-8?B?K1pGM1k1ZDVTRVR0SFlRaGRGUi9jenp5bmM0bVpiZGRwaTYxalZ4VlJIVFpR?=
 =?utf-8?B?MVdBbXRLL3ZKMXg5RldrTW1BeURiV3gxTlpMbzlYZEt0UUozRmpUblg1RG9I?=
 =?utf-8?B?bUMzbW5FeUl2TkZYdldKcU5NVE4rL0grMForOU9KOThSNGxQRjJZS0dKdXF3?=
 =?utf-8?B?ZldwM2Z4bzZlWU5GdWZ0UTFnSGJ3ZkFVSXFQNmQzZ3hzSlJMY25QQUhPbHZK?=
 =?utf-8?B?dU56VlROWDdNYmlIQUc5U1ZSdHNxcjlHTWE4Tjd4YmJucU0rVCs4bEhoRGxL?=
 =?utf-8?B?akRnMFRKd2ZsdVhwUGtkYndBdlZYZGZHOHVidGhhNFlFUng3czlSWXRvT0RR?=
 =?utf-8?B?NHg0NFVmQytOZ0cvaFl1eU00cmhnR0dWeHJ3ZTBDeis5RGd4NnlkbVRMaFpK?=
 =?utf-8?B?dXh0eHhIejZDM2hsQmF4RFdheUNlYklJSHpKdi9JTzQwUTA1d25PQWRlaEtU?=
 =?utf-8?B?aDRFYytMNDFnUHh2c3NRUUt2OG9sSHdTb2VFQzFxSHZ1VSthc0RrZVdsdTYv?=
 =?utf-8?B?SkQzOXBaT0xjQmJvMWFxcUcxWm50MlVjVVZoWTVGcTNnNW9mMm4vNEtGTndG?=
 =?utf-8?B?eTJWTEppeS85VlF3cjhxUEc4c1JUMzZBOWpWVVl0Q1JXWEljUTc3clNyR0tl?=
 =?utf-8?B?UFcrdUU5SmtkMjZOMHByWXlUNGRJWXJ4QTRPYVNBZk9MMTQ0MHRxRzZ6R3Nh?=
 =?utf-8?B?dFZGVVFEaWJjZENUSS9UdWduU2RYVGtrMS85ZStSQUZXUTFTRkpzc3Qvc0dH?=
 =?utf-8?B?eG5oMkxjYjFTVngrYjJMZk05ZG5QWGViaXpiV3kxVXNxNVAraHlDb08xM0cz?=
 =?utf-8?B?KzVMNlRSSDZRa3p3MVAvMk1OemtuSzB0cVMvK1NpQm1WdG9sazN1N0JuSVRn?=
 =?utf-8?B?NVJGVWEzNjNNazREOU55RWxDNjlXTFN5a2dsajlxRTdYSXYyeVBaWUpqK2RO?=
 =?utf-8?B?VEQxalRvWkVPTGFBamdQNVF1dXZaRzR2Q3JkYmoySy94NnpZQU1yQjhUT2ZF?=
 =?utf-8?B?L2xlWk9QTXFWd3B3T0UvL2NqWGlua3pMZTNscmxSV0NJMlhKdUNaMWp6OWNl?=
 =?utf-8?B?SzNGTzBmemwzMitlQnNtTFBQSnV3cVhEbVExRlpxSUNscThMekNJYklncS9u?=
 =?utf-8?B?bnU2N1BWSjUyc2IvSVo1c2tNT1JZT1M0bHNPZUNPUFFaLzhibUVNU3Ricmd1?=
 =?utf-8?B?eS83aGduZld0QWlIRHM3aWNHZlp6NWMvaXg5VFBFZi9mdk9QbUEyeHlXMEJD?=
 =?utf-8?B?UmdWdnpva2JVZGwwMHZJUmtKSDBLOFh2dFlhaXR3RzdicVlCUHUvZkFmeTRN?=
 =?utf-8?B?SkVWM0tpZmtndW0rTkxJcWJJSU5tM3A3eU12RFBrczdTSzVHMXNpczRnWTRD?=
 =?utf-8?B?WU1jUlpGTHNrV1RWNUdUVHd3Vk53dFgyTURIOWlOMFFVeUdKNWR4VnFJdS9M?=
 =?utf-8?B?NElObnAvUmVzUEh2YThnVXU5WTFFdHcyOU5PSzVqODdPZVpqclZyazFjak9J?=
 =?utf-8?B?RWY2ZEJGdU4xS3FjL0plVXd5M0hlRGJQZ2ZKNTlWTWFiSDZhTUkrZnJtWHNM?=
 =?utf-8?B?ZHU5cE9DVi9MdXRlZEU3UGcza2ZFVmt0S0FpM0lvOGlraEkycFdidTRxSmVq?=
 =?utf-8?B?b1Z3bmFLalB2aVNmYzd2QmNoV2hXb1ZVUytvd0MrRFFiQnRDZ1BVbTRKRmZC?=
 =?utf-8?B?TW9vUmF4aHp0UEl3YW9IV2N2NkhENUpyM2tYZGFlWHFvaXdWVUVKcUM0SmR1?=
 =?utf-8?B?UTlhTEErVHFJd0ZZSkwzOXR1cHp1bE5VUWZPRncyaHdrR1ZrMXRFUzJDbkdl?=
 =?utf-8?B?a2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(4022899009)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BxhEpWGusSowy0CWRPMD05ZobxKZxWaW8O46t97hGRkYiykEo4oXX75M1OdJAAhx0EYCI/142t3B7oLsan8g/nuAszmNPN0wbtD4MYAGjFQ2PFUZvVK4sPSgmqfe3MqpDXaC2zFra+c/8T0QnNxRAXHBAH28GS7yqGNIaR6sq40ll2pZsHGXjRPHnMtQ/5Tpx/4a98ioJy4S5YhsExRJLYg/XaOE/16tQc2ZCUmoFFqlZIlGBS2k5O6va12x8YgUpdNp8g1Hfj3bvjDDY9uKL4yCFjeLMMfNy6snBcu52wW8WtHDeR9xZc/ebtM/85DJKosbWiV/StrkANWxEIubKpOvSJgoohFr7IocmPx4xXMIrpe9zJJN2dimYFp2c/8F04jOmfYFYYCt8W+L1WT53pVF6lCNcjMBozZEokc+N5UJWKazQuwFU3z3ZXoZosYT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:50:00.1040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be01b5d-e8e3-40ed-e785-08de6ef49c0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6858
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 13:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17120

On 2/10/26 12:36 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 10, 2026 at 09:21:59PM +0530, Paresh Bhagat wrote:
>> - Add 90-pipewire-sink.conf and 91-pipewire-source.conf for stereo AM62*
>>    audio playback and capture.
>> - Add 90-pipewire-sink.conf and 91-pipewire-source.conf for 8 channel
>>    audio playback and capture.
>> - Add pipewire_%.bbappend recipe extension
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   .../pipewire/pipewire/90-pipewire-sink.conf   | 19 +++++++++++++++++++
>>   .../pipewire/pipewire/91-pipewire-source.conf | 19 +++++++++++++++++++
>>   .../am62dxx-evm/90-pipewire-sink.conf         | 19 +++++++++++++++++++
>>   .../am62dxx-evm/91-pipewire-source.conf       | 19 +++++++++++++++++++
>>   .../pipewire/pipewire_%.bbappend              | 17 +++++++++++++++++
>>   5 files changed, 93 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
>> new file mode 100644
>> index 00000000..72562018
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
>> @@ -0,0 +1,19 @@
>> +# Pipeeire sink configuration for AM62x, AM62A, AM62P and other AM62 variants (excluding AM62D).
>> +
>> +context.objects = [
>> +    {
>> +        factory = adapter
>> +        args = {
>> +            factory.name     = api.alsa.pcm.sink
>> +            node.name        = "alsa_audio_sink"
>> +            node.description = "Generic Audio Output"
>> +            media.class      = "Audio/Sink"
>> +
>> +            api.alsa.path = "hw:0,0"
>> +            api.alsa.disable-mmap = true
>> +
>> +            audio.channels = 2
>> +            audio.position = [ FL FR ]
>> +        }
>> +    }
>> +]
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
>> new file mode 100644
>> index 00000000..2079746e
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
>> @@ -0,0 +1,19 @@
>> +# Pipewire source configuration for AM62x, AM62A, AM62P and other AM62 variants (excluding AM62D).
>> +
>> +context.objects = [
>> +    {
>> +        factory = adapter
>> +        args = {
>> +            factory.name     = api.alsa.pcm.source
>> +            node.name        = "alsa_audio_source"
>> +            node.description = "Generic Audio Capture"
>> +            media.class      = "Audio/Source"
>> +
>> +            api.alsa.path = "hw:0,0"
>> +            api.alsa.disable-mmap = true
>> +
>> +            audio.channels = 2
>> +            audio.position = [ FL FR ]
>> +        }
>> +    }
>> +]
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>> new file mode 100644
>> index 00000000..9251a2d3
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> 
> Should the file be inside am62dxx/ instead of am62dxx-evm/ to apply to all
> AM62D machines, not just the EVM?
> 

I don't think so, the audio codecs and channels are based on the board, not based
on the SoC, could be an AM62D based board with only 2 channels for instance.

Andrew

> 
>> @@ -0,0 +1,19 @@
>> +# Pipewire source configuration for AM62D.
>> +
>> +context.objects = [
>> +    {
>> +        factory = adapter
>> +        args = {
>> +            factory.name     = api.alsa.pcm.sink
>> +            node.name        = "alsa_audio_sink"
>> +            node.description = "Multi-DAC 8ch Output"
>> +            media.class      = "Audio/Sink"
>> +
>> +            api.alsa.path = "hw:0,0"
>> +            api.alsa.disable-mmap = true
>> +
>> +            audio.channels = 8
>> +            audio.position = [ FL FR FC LFE RL RR SL SR ]
>> +        }
>> +    }
>> +]
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>> new file mode 100644
>> index 00000000..36112dc5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> 
> Same comment.
> 
> 
>> @@ -0,0 +1,19 @@
>> +# Pipewire source configuration for AM62D.
>> +
>> +context.objects = [
>> +    {
>> +        factory = adapter
>> +        args = {
>> +            factory.name     = api.alsa.pcm.source
>> +            node.name        = "alsa_audio_source"
>> +            node.description = "ALSA 8ch Capture"
>> +            media.class      = "Audio/Source"
>> +
>> +            api.alsa.path = "hw:0,0"
>> +            api.alsa.disable-mmap = true
>> +
>> +            audio.channels = 8
>> +            audio.position = [ FL FR FC LFE RL RR SL SR ]
>> +        }
>> +    }
>> +]
>> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>> new file mode 100644
>> index 00000000..fdce686c
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> Any bbappend for upstream recipes should be properly guarded for YP Compat.
> 
> 
>> @@ -0,0 +1,17 @@
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI:append = " \
>> +    file://90-pipewire-sink.conf \
>> +    file://91-pipewire-source.conf \
>> +"
>> +
>> +do_install:append() {
>> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
>> +    install -m 0644 ${WORKDIR}/sources/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>> +    install -m 0644 ${WORKDIR}/sources/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> 
> In master, please use ${UNPACKDIR} instead of ${WORKDIR}/sources
> 
> 
>> +}
>> +
>> +FILES:${PN} += " ${sysconfdir}"
>> +
>> +PACKAGECONFIG:append:pn-pipewire = " pipewire-jack"
>> +PACKAGECONFIG:remove:pn-pipewire = "jack"
> 
> This syntax I gave you in the beginning was meant for the arago.conf global
> distro configuration, where you need to specify :pn-pipewire - if you are
> making these changes locally in this bbappend, then you don't need the package
> specifying override...
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17100): https://lists.yoctoproject.org/g/meta-arago/message/17100
> Mute This Topic: https://lists.yoctoproject.org/mt/117740046/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


