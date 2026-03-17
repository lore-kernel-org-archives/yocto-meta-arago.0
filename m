Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278D5FEDA0D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:27:53 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84938.1773775665850587507
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=DT2LcPuk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/vJpfl+8p2Zaq4YaWO6CMX1sdSjjq3gO2v/XgXM6BE5q7WuPU9qU5tx0QYW9yKIfoqXimqbJjk8TCJaRwFz7nUMqeSnrEO7fy4cB86HpX4JOPF4lZIb259BoxKx2S5SAMhmp5TXVgHZ6ZQPLB+q9j2quhq3UEjn1VeO2PiFoSXSQYOvL3Pq/zzGUXJd8Stp639GItgB0HbMPDfEwOVfvxLcB/Pw3NolWawjSqJgu37FQbpJoyy7LsLvEZOph0Ccr8ElVdamc1bg1T1CoCDBpeZWpSO1HQbvV7sNloKMn5VTQFBbYLxN/9YkYsNkJu1yVFBr+b3v1wijT4mLAL9sxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZT5iABYYdN4Pcw71MSSrtovgQwHHHZTTbWbqbk3TFw=;
 b=YEy9ymXxX2jy3ytW8iwnpEynhDmyNChzlaN/t3/4JYYBnC4u+Y3OpOS+IHSeI3RjHLcLEBl9J/GYG4YVI3BTZl1CU0OXzGrvQNtHx21DHiKEXCyJzlLwhv4f/BpHOIwOqe6wwZ3XpEAKYSuzp2c/7WZ+VzvMzIy7v1NGtMYllCfaYH8kBo1yf/hPGQo5domG6CBfXCjX+AUpEDanK0TYpMOxnJHXLX35ahhTMPMzZ0nnlw5ePc3S42EnVZK1yCplrcr6lE7t8ifwuzcwmgSy468IhS5/ukt/mq5w3loh2C8GxVyRk+pidyqBTjAvd+ARRzmTYJDQR9AjeuudKdizgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZT5iABYYdN4Pcw71MSSrtovgQwHHHZTTbWbqbk3TFw=;
 b=DT2LcPukcUgLW7lDDs6Yt+6Lm/l03J07GNHVANqF4x8fCiCuriqgpFbW8m9JxBq34uEsXhqaoaDN5m4IDLiSiyOqdTDRT1WRyvuLTNK5KpwdEE83LiAl2WZ6InR5TpdyB1/yTMkeZ8v7XY9Eb/YMYL/+KB4SH7n4EzVGQlh1lEE=
Received: from PH7P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::6)
 by CH0PR10MB5084.namprd10.prod.outlook.com (2603:10b6:610:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 19:27:40 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:33c:cafe::84) by PH7P221CA0036.outlook.office365.com
 (2603:10b6:510:33c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:27:38 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:27:38 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:27:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:27:37 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJRbed3722073;
	Tue, 17 Mar 2026 14:27:37 -0500
Message-ID: <a890dd81-9744-4d8b-bbe1-abe8d2fd2139@ti.com>
Date: Tue, 17 Mar 2026 14:27:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] libsdl2: Add tests package
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260317185724.34717-1-a-christidis@ti.com>
 <20260317185724.34717-2-a-christidis@ti.com>
 <20260317191426.GA11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260317191426.GA11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|CH0PR10MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 2780e1fe-d963-47fb-a6df-08de845b4031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	npAhjTu1XVTz/lNJn2COxTju7wehnV5VyCLAGO2XLvr9MKuVToZ6jjDEnRKmGP1iSIVpou+ep3lpzBolD1/YdG74Wff8DQxOYzDrsOXMb+ArKMQWHVGKiJgJ8OB/TfSIToFgH7YqmPMeYnO8DBlI4XdfvcvyoI4/cntGiczknCsXwaajIeSJqXkQHZY6VMA4ZarEAueYWvLKnPvZDL1YOIgyG00UGal5kw6pGCw+Su8hAqYU9t5MM7mIpzmk0qDV5r0bdhElJCBqmgqoCMudilJJbOqtkqGlZpven4jHFg4rMhYAulY8cHte1tt1OuQjmnY2zUGlwoiMnPKB7sZOrc3iIDkTfVGB1Vf84bQjf+6IrLMkULmzpVV1/HAVTT15EdhX6AjlyVW4RjwcW57BeFJ4Jh3T6oBFA4xvjUqpmcVFNYhZ5k/0FT/SyXHXSVi9ZpnfqyyKhCF6TM+vnZ1QhSXxVhO/loPnmKytMa7os9dXqPLdU1p/xOrLtVxOgtA8u0YES+79HzwgohB1jI6FoQ9KWMUMa31UOKgrCOKcnXPZ6jNINVgHPXRMhwZAWp0J9ZAUexoKdZpLKYxVu9iUP8Nb+EsKyWZfIm9n4XzXBk8TU97rQCBQX5xn+sIoKb4gSaHj08MCA3En1KfJwuGgeX8X/YsKEVk9t19GXbJS27vyhlIT75uO37cvoNHDP4t6gzy4ObsSsQ4B4quUwQ7a1pYVHV9uCPm9EiBEpByqspA7n3zpS3ccIT0O1PuFkoxzI3gk39RqU9znTWcky5/Weg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PTmK19fBv22Br5adA9qkxlruE69PmcwKc0wxS5VveUwC22/9LKel265KG1/APSel8CUn8C5or7td76oKKIFFroIRxL7qaBej66oiuQskYQFdoIp72CLPH4ARMKuNZE41YnZ6X0GbXJ8J/fW8PW4gzHX8r+1CT3O0Pxj6pP+7CvE3AeYiuWxSpbVuGNf0hOM48RVtPRnbcA2yMppvqtAqQPugmdhYOChzpTePx/G3cSPC+bHX3G4BRY+9ePdt8lErtbZgqZVwh6KLsQynkuQpXXUBb2fDbKzwtveSzr0SzLYQc1foWO1/iGo0DC7+bmXjgv4oE+Wf088RHUoFf5bri8kFGsoTQdSYPGEc8g/MGYMP0/Ri23TMepDCu1T3zTLqD6Bz4cxLnifWH8xoLcsdtphF9HNSfvtZ7TpKcK2zv3SwItND4468VB0VuzevX7DI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:27:38.6263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2780e1fe-d963-47fb-a6df-08de845b4031
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5084
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17370



On 3/17/2026 2:14 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 17, 2026 at 01:57:23PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> The software provides tests, configure cmake to build and install them.
>> Package the tests in -tests package.
> 
> This might be useful to get it upstreamed as a new PACKAGECONFIG to OE-Core...

Good idea.


> 
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
>>   meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
>>   2 files changed, 10 insertions(+)
>>   create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>   create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>>
>> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> new file mode 100644
>> index 00000000..f33ff909
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>> @@ -0,0 +1,6 @@
>> +EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
>> +                         -DSDL_INSTALL_TESTS=ON \
>> +                       "
> 
> There's no reason for :append here, while += could work just fine.
> 
> 
>> +PACKAGE_BEFORE_PN = "${PN}-tests"
> 
>> +FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
>> +FILES:${PN}-tests:class-nativesdk += "${libexecdir} ${datadir}/installed-tests/SDL2"
> 
> If the values for these 2 are identical, why do you need to set
> class-nativesdk variant explixitly?
> 
> 
>> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>> new file mode 100644
>> index 00000000..385aa801
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
>> @@ -0,0 +1,4 @@
>> +LIBSDL2_TI = ""
>> +LIBSDL2_TI:ti-soc = "libsdl2-ti.inc"
>> +
>> +require ${LIBSDL2_TI}
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

