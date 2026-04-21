Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F27F94CA8
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 18:55:42 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44385.1776797740816894586
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 11:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lM9IZZ5o;
 spf=pass (domain: ti.com, ip: 52.101.62.55, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjI8POn9ADEghhtQe4LNoarrmNViQnmzrbvKfsk5fI3g1rUjMtYNWYgBiSqFxHPxXVE4dX2V+ok8ok+4C7OBH91/GqET8C/NcweFl9dw730hyO3PhQMwcKM04JYKWxJjtv9nRutUEZzMR8JrX6vrVNU4Bi2Q68IwyU9enmMa3tWioJBShlunxWNDXXYAVoYUoVTLUNZFGF8gLOwliJpL0DUrwouVLw9bjxdpOYl/0jJGZU/8MOZy8ccuiN1BpZ0XsbQOiE8Q7AcTvCNdTLW6xvgKehyRkUqlNZCR/ih9MTSPYFa7vWL68ft8hKa5WGXkZZWsIK5aJWvZc/AD9CkW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5kW+jkSA0x4Z+SrnhnPE0cWEfq7szeK8+4m6iXz16I=;
 b=SYm4ZfTR6mw6s5Bs+qiK198+44yCI9wP+VA3D5rdjrPuhW/gdYsreRckjUzdBniwCwdudxcRdu5lB+gy6q7Ae8tW7NHREd+QLMsvagN2HEgFdKMYkmtvuFrsJKSUbBZtR/fsFOsGF6gOWUqgAlfjjKekjHhe+KEc+XZmMBd7iAe50FY5T6MvpuPv5qUgnH+gABii8hPQcOLDZsWgx6KVCQ4eXZIDn0F4CEPPUCXSjj8Z01wZnTbggSjUiuGsCTnJGff7asP4VLrzPk4S4n8U/9+EKWIt0JkYlUVK+IcaBxdP7jdcUs3AbNDlSx6HSqCHm3gE++T30pqoROpu1HErsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5kW+jkSA0x4Z+SrnhnPE0cWEfq7szeK8+4m6iXz16I=;
 b=lM9IZZ5okly0Idl4DZu43jCGu+ETbfy2Ytkaj5PcUOHoBfPJcqKcDydIztg5hxSl0ibbv0e7PJf4ci+XrpUub7Cu3Wu9BrorN8Op2mO/qv0WfPkPcT5tJHLSdpryyC0yMUVOf1f6CfrVjG9iLD8gvJWJmVoGXMiKHFlgd89zFw4=
Received: from SN7PR04CA0078.namprd04.prod.outlook.com (2603:10b6:806:121::23)
 by CYYPR10MB7571.namprd10.prod.outlook.com (2603:10b6:930:cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 18:55:37 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::85) by SN7PR04CA0078.outlook.office365.com
 (2603:10b6:806:121::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 18:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 21 Apr 2026 18:55:35 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 13:55:34 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 13:55:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 13:55:34 -0500
Received: from [10.249.32.238] ([10.249.32.238])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63LItYpj774174;
	Tue, 21 Apr 2026 13:55:34 -0500
Message-ID: <7570debb-fd71-4196-a7d7-d55c99fece7b@ti.com>
Date: Tue, 21 Apr 2026 13:55:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] mesa-demos: set default
 PREFERRED_VERSION
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
References: <20260420195557.22133-1-denis@denix.org>
 <37e9ff17-ca6c-414f-ba39-84f763983ceb@ti.com>
 <20260421182801.GE4186@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260421182801.GE4186@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|CYYPR10MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 5478cf40-f669-45a4-f27b-08de9fd7928f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|36860700016|82310400026|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	D8v97/8rD76EEbvbNOfhrpp/3XyG0ng4YXr6VMAguXN9ugbsaw/zScMVFU23VPu+P50GrkwJh6Kiq1mE3j4pq9ov9Grh/6ME+rC5AnVWjA/fvI0ZWMu4eMDLvB7wzLki4RjIhhzDW2U+Q/b3DwIeTBRIWcIE75GmCVOozgPfdZ9yeJ+uF1n5qDbVhOLscgRnBAsAwwwk0HD/hcWi+3M+X6vMGJf3GMDlkqMzffTHe7xIlQ9YrYxDFmz5Z2MA4yGAVcQZ9snHrz/G3Udpb2KQov2wZrOtXbJq4t/ZGlWjybMw9mvgebloFyOSlhbAYh4v89l+6U8u8MlDMdCf0YAeXU8WhoJ460PPUHPTLNiivbG55fmZUxr6mGMifrWza2N/HeYElJ8bvNd/bEQ1Q/YsoOALd6cqe6M1wlmT9V90XDAY4mlbuD2ptJJPn1bPCFOM5nIVUblkpPixcgPGN2eu18y+331Ult2iGld3RlbZksk4IC1gsBuahllFT/IShgp/u2abLPyOOIW7uAs2AdaMfG9mi8rS03xn0B6eovqXOolp7CAr+6YjLkFlsNHkDYwn+bsugPxZnYpDSEfWEKnwI4Xc5EjnNe+syjKMLi1I/8ToQGNKK9/ZmZZ4suwSIcp8LCc2qJEV5kTyu8858shlWbUyWKXaw3WFvO2LucnTtPmt2KMM45tnbsN4jmOUok0/DjENkVvuoGZ60XBm+qPI5g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W+Wr7lmuVltmOyL8iIO3iQ+q5Kx5cBxyxH5bxBoonr0z14sQo649TRYFO7nbtS5QoofVznrYWcZCReMtfdzjf3JL/XTuFub1MZgHoZZJ2M8PRGTIhMCMuPHH4PVekjv2bIGkKKwewh0UfBr7ue2OcObDSlzttO/Cv8WLUrycuLr8q56hvwQstDVDRohaNfIq6yb2lHPnR2kesstO2BkMGGGudOrhTIfw2BFWx+raImQf6kDm/lSL4+9R0MHXtj+KemKb9KjcCH+umxOoa4K0NudULAqqyE87EaW3c2jyx6oXVZo6woXCV4yqk5Kj8u0ez8etMFLNySMBXJPtp3hBNfnOC5oKsR+Pju8Qr3kuafzIvAf00Hbbddb/0Ewd4B5eYwIHN/L/fND2zfB6pqzIfM0nzmXsgi/K1qAJl5h7m2vWSmncqJ2A1oTnZJWrpCaO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 18:55:35.8197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5478cf40-f669-45a4-f27b-08de9fd7928f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7571
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Apr 2026 18:55:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17481



On 4/21/2026 1:28 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 21, 2026 at 08:20:52AM -0500, Ryan Eatmon wrote:
>>
>>
>> On 4/20/2026 2:55 PM, Denys Dmytriyenko wrote:
>>> From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
>>>
>>> Set default PREFERRED_VERSION for mesa-demos to use the version from
>>> OE-Core when not using Arago distro. When Arago distro is used, it
>>> gets changed to our version in arago-prefs.conf
>>> This addresses the signature change issue in yocto-check-layer.
>>
>> This means we have to stay on top of this change for when they
>> change the version from 9.0.0 to something else.  We will be
>> preferring a version that no longer exists.
> 
> Yes, this is correct and rather inconvenient. But lowering DEFAULT_PREFERENCE
> won't work here, as meta-arago-distro has a higher layer priority than OE-Core
> and hence supersedes the recipe's DEFAULT_PREFERENCE.
> 
> It's either keep track of the OE-Core version or convert the recipe to a
> bbappend, like you already did.
> 
> Specifically in this case it's not so bad - OE-Core has version 9.0.0 and
> Randolph's updated local version pulls additional commits that were merged
> after the release, making it 9.0.0+git. So, when a new version comes out and
> OE-Core updates the recipe, we would anyway need to remove our local version.

True.


> 
>> Need to think on this.  Thanks for tracking down an alternative solution.
>>
>>
>>> Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
>>> ---
>>>   meta-arago-distro/conf/layer.conf                         | 2 ++
>>>   meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb | 1 -
>>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
>>> index 2ad036f5..af3be2b9 100644
>>> --- a/meta-arago-distro/conf/layer.conf
>>> +++ b/meta-arago-distro/conf/layer.conf
>>> @@ -39,3 +39,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>>   "
>>>   HOSTTOOLS_NONFATAL += "corkscrew getent socket"
>>> +
>>> +PREFERRED_VERSION_mesa-demos = "9.0.0"
>>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>> index 2da3ceff..62cb0ee6 100644
>>> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>> @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481
>>>   SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
>>>   SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>>> -DEFAULT_PREFERENCE = "-1"
>>>   PV = "9.0.0+git"
>>>   inherit meson pkgconfig features_check
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17480): https://lists.yoctoproject.org/g/meta-arago/message/17480
> Mute This Topic: https://lists.yoctoproject.org/mt/118927074/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

