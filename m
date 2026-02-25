Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2471FD45F1
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:26:25 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55024.1772051179522394461
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=bIBkmVjM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.64, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqVaaJ7NHzoLzbQZNWBi0PlaMkOV6ckP5pE6PUJPQFNZEX1ZpYZ7B4MLYdGhtlVzcAxgoL5TxmWsdZYs3OJVyryYKJH53UyCh1hG+xh5akm3g2ytL0YL+8vd20CFQMlSzLweh9N9ZQ56OYXsVqC7VxoAbVxkyCyVpEecldG7+P/1zbH0QtfrFlmtmFobdx2jGumKMo1ElnKWY6+r/UM7CTLuUxS9phu6US7TPYjUTq0OJ5qKk31wbOwCyDxhiN5GNknBZ9+DW073ohmrMyS9rC2GW4yIqeDt8+/aaio2QPu3qKD7BOsTwtSw6PoZrzX5J1TLi/CkNcajb73cK51nXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDsXGxHZk1GgrRAvzfKTgYKe2IG4HJMVsb0/iKfMQhk=;
 b=lgdMLxqXVpOUGk8W00EWImgafj2Wvzgh59wYd5YwDmm1Vk8gcZcV0c3yLibeMEYzaBEcI8Sd3rLcKHchxilZQVG31QzROwaVjxYVW7KRZy5PQAQvkky/k7cAdKGqyFMdUSGxm7C3z9SZ6DwzaxtZIPrU4caHbC4SkTnga9NQRdbQVhakd6F5wvNhkELjwc3LMTCczxP93BZCx+W/WXgStxXEMBHlHwX2OaSMbfcfyQLFcqpPJJpL+oc7JrU9mZZHFxfijXgX86Kihhf/N05zilMu/uH0MY2v+YeTnrU2trCLBGU3Gpzx545lGvk47gxJ8tGc60l8uf3y2qYW49zTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDsXGxHZk1GgrRAvzfKTgYKe2IG4HJMVsb0/iKfMQhk=;
 b=bIBkmVjMxQDjQJfdQvcK4y7G8nB6dWPDpUK3mp5ksd7g99FgSwSL72POfYKUV2KCIDl35GAqyvhiMoctt+1Ys8wWYbR539oNvH2j9unmTGV1IX5T3UQvDuhjpM9LIy/BsE+pTunoP3I3Vv6LedMFqAK8DfJ6nDb+OhiTpaWf604=
Received: from DM6PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:40::34) by
 LVUPR10MB997811.namprd10.prod.outlook.com (2603:10b6:408:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:26:16 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::61) by DM6PR03CA0021.outlook.office365.com
 (2603:10b6:5:40::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 20:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:26:13 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:26:04 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:26:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 14:26:03 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PKQ3Z31076324;
	Wed, 25 Feb 2026 14:26:03 -0600
Message-ID: <c0f20ed8-412c-4fec-93c5-06e8be6ec6d1@ti.com>
Date: Wed, 25 Feb 2026 14:26:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] arago.conf: Tweak a couple of
 settings following oe-core changes
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260225021057.2555571-1-reatmon@ti.com>
 <20260225202447.GW11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260225202447.GW11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|LVUPR10MB997811:EE_
X-MS-Office365-Filtering-Correlation-Id: f26f3334-57e0-44ac-1135-08de74ac1f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|34070700014;
X-Microsoft-Antispam-Message-Info: 
	UgqZjJHGI+Z4U2Yqj1g4vON/5+fMztTaGazSyVXHkAv6GxdlZNke4TctW29KFgoJ1P1G3RFnbNPvLBdwvZMO1Hibniftf4YINRJMWA+xv1Z0D/8mkauK8EcTwBKxJoJMiLCq1p494HK2hvByFv3I3gu9d14XU8V0jdUBMPjck7VaJ67Pp46sB7VgfGFbq4ZWF3EZ59HM1GRyvVsATsPlZyO+oqCmCcY6jV812vewLQKFdaKJWgugWAPcK5sRk0+gHxMVFSviZ6GPR6DZOIbt3re+4j123PugPCtz8cT25VpnXiiXt3feBbnHpu4iW7V79U/VIH87zkKxWNHtiWkOTr/ZDbJHSk2c+PoE/iYex9+ll1cZD96R1oDO0WB42qIt33mONybd9IpGFHp26ivCRDYs+n8x6+1cfQGCHMB68PbbkrPUpcRu2oejNnSz/htFH+ukpKlqXSyK1HPS0o1nTwOYX1fgo91oP8zOuqBbEe/p4sDXTqmH9Zs02+Z49hplDrC4KpQk8hxdA4AeDlPuxxP5DpT3tNRnmwgWpNQFNc0dE+E9JQBRNkw053v0+GqYdI0RCBf1DFRqlGfYzOlSxM5AhHUwL2k1w1N6pYYRE+uYVn86ZSliUvKa29UYg2mLmRdKNsNN611wkIzDLPUWGiL2UQbXipV5JHDkRqVQdmLc9GnoIfxUjuN+CLb5qYZtOh6qzev2H8mE+K2oWJdLWWs7qew+oMnGhgGGMOJwVZKaXd1NfCZR2zLOwrX+0/HmFAHwOFx7hJUrzi/j7SMraOr4MxVzLLcnUZNVjqbRlQnli6KanjhTFMQV/esT7tE55uSoxCeKa4+BCSGt2zrrKA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(34070700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PXu0KLHbkus8tQzAV0Von8MQh0TbUjdaRBWQB1hgpIOP9alA2xxf8jkl3xTUjQ+fZVEFQ3vLZJGb9drCmAT27rkjv0wpxYhHIItdobVe+rkV8V+onCtuWVYfDnAk9ZS90jz/KAC4bhCvcQXKwFCXF+qHe3iR9SP+rAeDAOBSEjPdQLqW7Vx9lsodGZw4E0xJwVw+AovRSS+ffYiR+cMalXQkXO6Ina644PP/vRPOc42alQOQvDij/PRRaLk5ijOLJ58m+WUd3sFe6kO/zA0vNAqwE+Eq2kZGI4CRc1gFFYybntu3WTB4BD3+oSPcQtJgZ85xzDwpi8MjxrMieWtw7jush4PZR2uujeT9fH2hfpboUCnV2tJRBrnKglNyIJnnPUXDiAWvRUXmYp0p4AWwixR6/4vTiW2oN59o7C/YciEuZehctZOzcJ2wnIzvtqN1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:26:13.6473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f26f3334-57e0-44ac-1135-08de74ac1f0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997811
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17151



On 2/25/2026 2:24 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 24, 2026 at 08:10:57PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> oe-core has made some changes to default values for all distros [1] [2].
>> Target a few specific packages at the Arago level to back out those
>> defaults and allow packages to build.  The changes fall into two types:
>>
>> - Disable static libraries
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=03fc931bfe9ea3fa9f33553e6020cbc067b24291
>>
>> - Enable tighter compile time security
>> [2] https://git.openembedded.org/openembedded-core/commit/?id=4c2d64c10a5b0437ab1ea04df22386f0f95124d1
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/arago.conf | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 17c6fed8..691f9068 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -153,3 +153,13 @@ LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
>>   # We are working to reproduce this error and submit bug reports for this
>>   # issue.
>>   DEFAULTTUNE:armv7a = "armv7athf"
> 
> BTW, slightly unrelated, but ^^^ this was a temporary workaround and it ended
> up staying here for quite some time. Is it sill needed?

Good question...  I forgot about that.  Let me look into it.

> 
>> +# Some packages ship static libraries which are disabled by default.
>> +# Add support back in for these packages.
>> +DISABLE_STATIC:pn-ti-ipc = ""
>> +DISABLE_STATIC:pn-ti-rpmsg-char = ""
>> +
>> +# oe-core enabled tighter security checks at the distro level by default,
>> +# but a couple of packages in meta-ti cannot compile with those.
>> +SECURITY_STRINGFORMAT:pn-dsptop = ""
>> +lcl_maybe_fortify:pn-gdbc6x = ""
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

