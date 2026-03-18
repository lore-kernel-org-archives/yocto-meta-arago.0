Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A78103E197
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:00:04 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17802.1773849597570859536
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 08:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=eHxV/nXK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.50, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNwg8DEdSBPE4eEGjSf1+j+rAybcwkQWj3TG2YFohfcY9F7OaZLtJNA+y3LcJ/jMsgpEABKgi+yBMC1fr7uNtAwAwxNJVoafgeGr5MPxcBHIE4kEoFNc+LEUFm9ujvzXsFezoLICCbiD3XVh9PkhcsL2YVsffK94/a7H8Ixu/lpf6DI1h9h93u+CG0yXivSaPstEsyhd16ntZFLRodleOjJ0t7t8FXw8GHGveUaokEy3T5PLGCYU7CuDKRluy4S/eeVRfZHoCB/mNtp1KwFI2T3Y95FbT1lHdxZCgYJDKb5RJrxEBvEiYfv36PoTRAG+OmrC/CPfEGFdmbIqZ3OItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoOEh0YBXWjZES+OqLLwPd9Ax5TayhwPtt2ZftqnMV4=;
 b=tKxdw78UBDJDNGF1g2I3+vEBwM6INaXvBN/gyUNwWmMiRYo4ECeiwZlfQMFsh4Kf+2PAKJvrndIMLjytTBw7pm6/zssYskZYd1LxidxdeO0oMgFKXltuD/iAcqrrG+vuqRKJ/fZgMsjVkyf2YJ/nQDJ6yvtzjmmBR+603tG0xWVwHYxID67tjib2rayFIAw04Db2p/AXu8PfIegrwcohxbb7S6CAFduUobL+Q5aorScRKVcZ0dMfRdzD3GCcoqZATmYLrxyU6A5XOYruNfqwwHwXAIpE4E6w0bu8N/igV8dO6CILqFuO2cd+6gEXGOBxdLXe+TCgYaD9ssRIXkkQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoOEh0YBXWjZES+OqLLwPd9Ax5TayhwPtt2ZftqnMV4=;
 b=eHxV/nXKCHSgu5Znxg+UILS3wwEy+jxlV/hWrgeXGB/mU2gtKMi7vxzDmb8YC+7sDlOy4ztmOY9/xVCO2ZD8ut/YVCDnTGx/09WepfgC4pXfuu5PJcudO4FWqAjGDV2B6JAqE1+69Xhv57mZEZ3gIHGlqZc4GcBLVE12VIdH3eM=
Received: from CH0P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::15)
 by CO6PR10MB5555.namprd10.prod.outlook.com (2603:10b6:303:142::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 15:59:55 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:ef:cafe::1e) by CH0P220CA0007.outlook.office365.com
 (2603:10b6:610:ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 15:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Wed, 18 Mar 2026 15:59:53 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:59:51 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:59:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:59:51 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IFxpPs606310;
	Wed, 18 Mar 2026 10:59:51 -0500
Message-ID: <bcb06b9a-7b93-4d92-90a6-c68a757d4d1d@ti.com>
Date: Wed, 18 Mar 2026 10:59:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] flutter-samples-material-3-demo: Add
 --no-pub build option
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260317210138.46226-1-a-christidis@ti.com>
 <20260317210532.GE11121@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260317210532.GE11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CO6PR10MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd25f51-9cc6-48fa-065c-08de850764d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IuOWiJbHGMY9Pa3AnNT5ZJdrKpqS+qxMgCLrI9tFp/qRxuZJ+uCL4SOhKWYOPWwEabIk8ynbNZFhiGPVhOJQ90bs98Nn4ReO4fjlYqBzaUPIDniyVTLtHph6EaI6dhuhQG11xJ4AE4SqrYOpPuYrwpvNtioDAdhaFsgcP8uIpV14qin2p1BUtc5XY/skEPX4Ouikuc5VsWAjY+4KU+7A3r3QL7yrmG77q6KBhFqQ5ibJUdwN9URDMr4IZ5RfE2WfWgP9AyRMw4q2oZX/45ykiMqYwfkxBlPuOGFho1+FEJUV3xcge2t5Sd/ObAs7Zu29JqdUMtSKLmPqDgsFpOC3x8AmumXrrmmbJyxD9R1RzmLe4CnbiGVHrXPC3PSQl/5D+zUucbERV5n+g/ldtAALXQIgSyKXtUTwB9xFjiXretDZejfX4U/Q07MGbSmAAHHY9flJYOgd6l+2oUGHldqvTRA5I2lphE6xLuPfBKY+D2mOSvvjW9V49ZRmFmvUK7wPI/OmCux2tU0Ko0E8O/UJwgvrAXFsAv7zWvWrIeKMT5DWmp9bApaWBpHazpqSHHginv9s969pyQyFrFVzXbui+9AkQhdYqdwBuTl550jFSsNDZaQng6GzGeiD80jiqweB2sBCrBWR5F4omQtJAQ1AyHpmu+BsA5qqJ4I70tvTcSW0TYK5YVWCV3hv6jDcrRtKZRHtZnK4IfxZ4DUD9ZorqMmVUML2uJpnE73JoVIyyo+XgdXTYd1NZVh2LdJdwFIMfFFpM/ktmwoJW6Lw/EyVBw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZcU5MoWqaj20IcUBP53R7H95HePdxJHWWyrP8EORnxZUVN1223QGdr81kXbaqwKamyZ7E3kfnxRBRjY28yrwOsDmcdH9a/7mSfoySZucal+BP6q/uNlYBoiDSioeOlVsvFPawNP4VUPGJe+3lvqeMh+bNC3G3YRYUyfTblC0wpfrRw1j7UcXJWN7XqKQhj4/geW1qqxynaVijRhqckOJB2I0QDsOhKAh7x6TZVK2BniwAcmWCDg7vbr2jkqJ4O1W9CXIHde+Rshb5PnIft5kDy9VuzRmtJfStJDN+w+TCG3merQGFF3eSHBu9tcNjNFYE3uegw9Gg3ZA5I8WmpDJVUbEEx5BhNxJUleS8Qe7pX5zU+80LiuNBBPcv1Jeh/s0H9u1EbWpplo9Mgz2aWiWJlvuQwILydn4j8U1IGbCgDvURWRnrQD8CLnEbpeggrcz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 15:59:53.4910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd25f51-9cc6-48fa-065c-08de850764d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5555
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 16:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17400


On 3/17/26 4:05 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 17, 2026 at 04:01:38PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Append "--no-pub" option to flutter.
>>
>> There is a patch pending upstream, [1]. The maintainer is inactive/on
>> vacation.
>>
>> The upstream patch modifies a class, there is no clean way to modify
>> a class, so I'm editing FLUTTER_BUILD_ARGS which gets consumed by the
>> class. The end behavior is the same.
>>
>> [1] https://github.com/meta-flutter/meta-flutter/pull/744
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   check_yocto_rules.json                                        | 1 +
>>   .../flutter/flutter-samples-material-3-demo-arago.inc         | 1 +
>>   .../flutter/flutter-samples-material-3-demo_%.bbappend        | 4 ++++
>>   3 files changed, 6 insertions(+)
>>   create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc
>>   create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend
>>
>> diff --git a/check_yocto_rules.json b/check_yocto_rules.json
>> index 25c8c952..70bbe734 100644
>> --- a/check_yocto_rules.json
>> +++ b/check_yocto_rules.json
>> @@ -23,6 +23,7 @@
>>               "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend",
>>               "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend",
>>               "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-wayland-client_%.bbappend",
>> +            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend",
>>               "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
>>               "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
>>           ]
>> diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc
>> new file mode 100644
>> index 00000000..b2c9e13d
>> --- /dev/null
>> +++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo-arago.inc
>> @@ -0,0 +1 @@
>> +FLUTTER_BUILD_ARGS:append = " --no-pub"
> Will it work with += here instead of :append?
>
It would not work, the variable has a soft default that I want to abide 
by and append to. If I use "+=" it overrides the soft default value.

I finally got a proper use case for ":append" lol.

>> diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend
>> new file mode 100644
>> index 00000000..f0ae3799
>> --- /dev/null
>> +++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-demo_%.bbappend
>> @@ -0,0 +1,4 @@
>> +FLUTTER_ARAGO = ""
>> +FLUTTER_ARAGO:arago = "flutter-samples-material-3-demo-arago.inc"
>> +
>> +require ${FLUTTER_ARAGO}
>> -- 
>> 2.34.1

