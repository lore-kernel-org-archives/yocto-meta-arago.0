Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395DDCF58C9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:07:10 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13727.1763575612386566467
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 10:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CECvbqIx;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.201.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQD0IYvI0AZsqXU+HiUekaKZeWCrMlWQm9JLuXqEcyYrjvjZYRK3o7DIfLGSUGbmOYENNq+eDVpkz/LWy8iZVwZsGMYc8pu/rtdHbBEwYzQDOx+DtZusWHE6vRBlxw0G5/bGlnQNXPDd/Y+8c50hylCeERAy2ujO4WCKU7QXoEsFlGEd3OK0yxGjNGMg/zb3Ke/0KDGcMpLIPmndL0iMvpPFsX7quFhF7RyO06u9yhZWZuTZXsM3/t99XyZbj98y7/uCbkerWGoUEXeH5Hrcqk/y2VMZSdKcElwtoCUg9ckRL8GWEwi01MrjU3nXjwAcML8RjHnfUiA56QXaiOAhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KlfJXtcm3nL/IAaBRGkWYExmxE66TIeGjEFJiFKxmc=;
 b=AI0+agYTtxwJm40UxpDuC/upKfYDIjVO6RsG9Fvpv5I4C3KfwmC1JTqDVxqsBmF2tZDRr79PXQpfDM/k83g+8Lq9TSfdcf8Dv32vRkMPk4GcJCxIZD+t7s+WLVkOcBwjMwcwbBgyYYn1jQ5IbW6XsYd7EuY7211KBWziJkhL1ZokV6Jumke2znoz1qGxoFgjr/zAHNP6WnhqRy91ll16GDOJFdBK1ewGsfofjusw7bPRriMydpPynHO/RqjabVaQ/ou2w21oGAFO9CR0adYdmqe3678xjEUTtFyEi54Ze4fAIj7aoxFOm/tGGUDlM8M74oNgqmtTkcAAOHMsEEBhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KlfJXtcm3nL/IAaBRGkWYExmxE66TIeGjEFJiFKxmc=;
 b=CECvbqIxvc+frHcD+aeIUUanHTFVOrK5NABZgBKM1ua0/Z6cMBEovCwEF5XmgQdPFnbXaLxsvbQycUMscrHjqnHWRJeTm5UYpJ4yshFp5jCCdv6PqDEqf5cKPJwZlysKSXYmSYNcNfmkZKbrkhKfufKLTgyn2Hsr1KMtXaSiwOY=
Received: from DS7PR03CA0147.namprd03.prod.outlook.com (2603:10b6:5:3b4::32)
 by PH0PR10MB997665.namprd10.prod.outlook.com (2603:10b6:510:384::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 18:06:49 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::21) by DS7PR03CA0147.outlook.office365.com
 (2603:10b6:5:3b4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 18:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 18:06:49 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 12:06:46 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 12:06:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 12:06:45 -0600
Received: from [10.249.33.103] ([10.249.33.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJI6jIs2318465;
	Wed, 19 Nov 2025 12:06:45 -0600
Message-ID: <c4134c5b-e723-4d38-b24a-3c424ba387fc@ti.com>
Date: Wed, 19 Nov 2025 12:06:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v5] coremark: add Coremark CPU
 benchmark
To: Denys Dmytriyenko <denis@denix.org>
CC: sadik <s-sadik@ti.com>, <meta-arago@lists.yoctoproject.org>, "Prudhvi
 Veeramchaneni" <prudhvi@ti.com>
References: <20251119124115.1228847-1-s-sadik@ti.com>
 <9738a8bc-244f-4199-bbe9-9e33313bfcd6@ti.com>
 <20251119180442.GH3125@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251119180442.GH3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PH0PR10MB997665:EE_
X-MS-Office365-Filtering-Correlation-Id: 326308d2-1f70-4c04-3627-08de279668f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bDFNY21yQS9yYi94NzNQRHNlc0R0S2s5WmdsSWNHRlpidkEzK2xLS3MvZFVq?=
 =?utf-8?B?Vlp4NEhWK0xYVTFPWHg1SldBVjF1bVF4MkFjRlRLL0FNdGdHY3E3cDlOWFBN?=
 =?utf-8?B?cTZmb1RDZmJjM0tHOU1oYVpXbkh5N085OGZEN1UyMkhCcmRobzV0Y2FKSVl2?=
 =?utf-8?B?TUMzdVpoV3RXSmNtN0ViVzY2MlEwQWtPS3g0Y0EzaEdtbGhMNy9SUWlyalJN?=
 =?utf-8?B?RG40Z2tzV2R2ZEdlTCtRdU5jYWZvWmJtSlh5MlRsMUJEWnV6Qy9XVHJlY2pw?=
 =?utf-8?B?Y3BydEdWNWUzN1JZMGU3NFVuaTdDZURWWWdxaHc0S2doVzI1RkVObVNhVEgy?=
 =?utf-8?B?bng1N21PeFgzYjJtOWJuakdiRTJObTFlbmVsZzZPQk42OEFoa1AxN1c0QnRX?=
 =?utf-8?B?eG5kampMUldqa0w1UDM0cktmMzBSOTMwMEpzdkQ2bHhnS3djNVNRdjZUMWp6?=
 =?utf-8?B?Y1BkK0pmaDVtbjdLWEcwaUR5aXJGTGFMYUdwekNNQm12ZU9WUVQ1RThFTEZN?=
 =?utf-8?B?NHFzWVlhQTh3dnNGRlFQYmU2aVZ3K3UrZHozMlQzMU81L1ZKeENhVGZzS2ZP?=
 =?utf-8?B?U0NFelZSakZ2UDMvZmZ3K0lPRWYrTmwzUE9BbVVkaWkvWEQ3WUJjRXVIWlJr?=
 =?utf-8?B?NFV0cEpORzRnZEJicFkrazk0SmRndS8vcVZmSlBzQk5ZdkpNeWYwVWY3bGUv?=
 =?utf-8?B?WmRybjF1c3doRWRLcndmb2lMMUJWMmlNbTVkaVdySXRERFE4R2VFZng3dnVo?=
 =?utf-8?B?aHpwdDhVeWtZcHl6RGdnaTUwbmRxNWV3Q1dEcWhvUmdVMnl6amdoejlRVTVK?=
 =?utf-8?B?QmNIYVozK1FHcWpqcFRtdGFobU1JYy8rcmU1dUxhdFVMVmR6Kzd4K294MHVj?=
 =?utf-8?B?TVhnOW13K1ZLcTFEZzhEVmUyWkdIUXBYVnh1dU10UmEwbmlBQVovb1FwMER1?=
 =?utf-8?B?ZkV0cTlGVUtsU21XckovUzNLV1NXVUhVQndRWm1tL2xaNXAxTEoxQ0JOSVV2?=
 =?utf-8?B?cVdKcWh6Uzl3VnRYN2ZuVnlHRklFbHRUSGwxNnYyQ1RseXFvMkpOQkZ1OENM?=
 =?utf-8?B?aGlHZjBrbXc2MGhyeUU1a0ZwQXdRK05yZ0FlREZudmFNTGJNNDk2QmpJT3Rp?=
 =?utf-8?B?Q3ZiQ2FTZHhiUGNMeGxyWDZ6eGVPOXJQUWpBOWhlQUU3cDNaZHpzRUgwdHJk?=
 =?utf-8?B?cklEbVVqTXRSeXF5K1lGWlpueHkyQStKekNSbXk3TUx0endHZ1BHa2hzL0dH?=
 =?utf-8?B?bFJLV05OS1BRc3dZcjIrblVRRUFPWWE0RC9FVG9mV0lqemtud1BEUkpNeWdE?=
 =?utf-8?B?RG5SaGNORmN3U3B0U3RGL3NxZmZBV04yTlFKQnFYNmtrdWI2akFHemM1cEU4?=
 =?utf-8?B?bGVTc3VBa1BxUUpJMmlGejFQYmFJM2p5Yk5zdXphZXJXeFNtZGZvbTlxbENT?=
 =?utf-8?B?NHhQc2ZYZWNteGVGMERSN0ordmJSc3FEMW52NGEzUmZSbFdTTHRvSzdBQ1I3?=
 =?utf-8?B?elhENkdqNDdCQWsrSVBYWjFaOVg1Q3kwOVh5bzFrM3hBRTRFYjcrVVFMaHhH?=
 =?utf-8?B?OHRDenV5YWZaYVhWR1FJUFYyOXVmaVcyaFZaNjJIeXhwQURsMmZidFpKSm14?=
 =?utf-8?B?c3dNK0crM2ZBWmIzZlhDK1A0S0VZUEpBWkVhWWlBdmQ3OUxiUG9XeUhZVTZ3?=
 =?utf-8?B?RkRMV1ZWL3ZkZUxOL2lINmxpbm12WE5MV3ZVL3QyVkhQUlkxQnFkS1N0RU9i?=
 =?utf-8?B?aDc3aTYrWHFxZFZjbHZtRXJxY0xxRmRoNFlNR0x4dnI5amJrTkNsN2ptRU1l?=
 =?utf-8?B?TmttSVV5VzlCZVhxZUNDOGhrYVY5K1ViY05vUGJyQ0VnR0xMa1JFMU94SlpX?=
 =?utf-8?B?WGhDREhoUE1JNDNrMFk3eXQwU0I1bFhUOXlodzg3WFlWbXpScllwVHlKNFJk?=
 =?utf-8?B?NGJ5aXRjUDFvRjFOSmErY3RDMC8rY0lJS3hHaUREZUtaaFdWZnBHU1kyalFh?=
 =?utf-8?B?YVhZVDBteHRrdEZ3dGN0c3VjWmdzUVpwZ0ZvZEZhZ0ZDN1dDUHlubWtQdE9v?=
 =?utf-8?B?bVBBdGkrYzgyNU43N3hPNDdqZVpyRmVGanZvdVo0eXhPbTJRYmFJT2NpRHVm?=
 =?utf-8?Q?O9/Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 18:06:49.1866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 326308d2-1f70-4c04-3627-08de279668f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997665
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 18:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16798



On 11/19/2025 12:04 PM, Denys Dmytriyenko wrote:
> On Wed, Nov 19, 2025 at 11:27:01AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 11/19/2025 6:41 AM, sadik wrote:
>>> Add CoreMark benchmark recipe to measure CPU
>>> performance on TI platforms,Integrate CoreMark
>>> into ti-test package group alongside arm-benchmarks.
>>>
>>> CoreMark is an industry-standard CPU benchmark from
>>> EEMBC(Embedded Microprocessor Benchmark Consortium)
>>> that provides a standardized method to test the
>>> performance of processors.
>>>
>>> Signed-off-by: sadik <s-sadik@ti.com>
>>> ---
>>>
>>> Changes in v5:
>>> - change subject line to include recipe name
>>> - append _git to recipe name for tracking of version
>>>
>>> Link to v4:https://lists.yoctoproject.org/g/meta-arago/message/16784
>>>
>>> Changes in v4:
>>> - change logs moved after the "---" line
>>> - change the summary of the coremark in recipe
>>>
>>> Link to v3:https://lists.yoctoproject.org/g/meta-arago/message/16776
>>>
>>> Changes in v3:
>>> - sent patch via UTF-8 encoding
>>>
>>> Changes in v2:
>>> - Include Coremark licese file in licenses
>>> - Use oe_runmake with proper compiler flags for cross-compilation
>>> - Removed unnecessary TARGET_CC_ARCH, COMPATIBLE_HOST, and SRC_URI checksum
>>> - Move coremark in alphabetical order in TI_TEST_TI_TOOLS
>>>
>>> Link to v1:https://lists.yoctoproject.org/g/meta-arago/message/16707
>>>
>>> ---
>>>   meta-arago-test/licenses/Coremark             | 91 +++++++++++++++++++
>>>   .../coremark/coremark_git.bb                  | 18 ++++
>>>   .../recipes-core/packagegroups/ti-test.bb     |  1 +
>>>   3 files changed, 110 insertions(+)
>>>   create mode 100644 meta-arago-test/licenses/Coremark
>>>   create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>>>
>>> diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>>> new file mode 100644
>>> index 00000000..7655a445
>>> --- /dev/null
>>> +++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
>>> @@ -0,0 +1,18 @@
>>> +SUMMARY = "Industry-standard benchmark that measures CPU performance"
>>> +
>>> +LICENSE = "Coremark"
>>> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
>>> +
>>> +SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
>>> +SRCREV = "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
>>> +
>>> +S = "${WORKDIR}/git"
>>
>> This patch looks better, and I'll start testing it today.  But I
>> also need a master version of this patch since this recipe will not
>> work in master as is.
>>
>> The only change that I think is needed is to remove the line:
>>
>> S = "${WORKDIR}/git"
> 
> It still doesn't set the version, as _git suffix in the filename isn't for
> that.
> 
> I see when CoreMark sources were imported into GitHub, they were tagged as
> 1.01 corresponding to a 2009 release, and no new releases or tags were made
> since then:
> 
> https://github.com/eembc/coremark/releases/tag/v1.01
> 
> This means we should probably add
> 
> PV = "1.01+git"
> 
> to base off of the release and track individual commits since then.

Good catch.  I should add this as a check to the check_repo step in PRC. 
  Making a note...


> 
>>> +do_compile() {
>>> +    oe_runmake PORT_DIR=linux CC="${CC}" XCFLAGS="${CFLAGS}" LFLAGS_END="${LDFLAGS}" compile
>>> +}
>>> +
>>> +do_install() {
>>> +    install -d ${D}${bindir}
>>> +    install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark
>>> +}
>>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> index c1166bc2..e05add8b 100644
>>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>>> @@ -89,6 +89,7 @@ TI_TEST_BASE:append:armv7ve = " \
>>>   TI_TEST_TI_TOOLS = " \
>>>       arm-benchmarks \
>>>       arm-ddr-bandwidth \
>>> +    coremark \
>>>       cpuloadgen \
>>>       input-utils \
>>>       ltp-ddt \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

