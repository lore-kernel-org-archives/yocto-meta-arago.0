Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A64F44857
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:42:22 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155144.1775824933060544264
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=uczrcKYv;
 spf=pass (domain: ti.com, ip: 52.101.62.46, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGmNZB7XgwE2LspS6RyQfSnaImPZqOaI99yaNRTs8AVfvKjfgNo7TLRimmVRMEl8+vNsYC47rLJ7naV9tMulcJlu5kgHul/R253ZZ8dOiwncJO932fjZzbDD7QWzODQTxnXuL3AOQDFN3KcxgU76q1/PjGFRfW5okuCVLuxxtAh1M7FwCLpXKbgoaZfPVstXknBdGwKG+/jQK+47CnVAZe0ntR4ulzt+IrmptG+rJp/f4OLqMnyNDpOjTqSatJr0zAOFgiQumx/2wQpN+lYV2WhsZviKrsk6DTGKkKMGmCc8KjXBVNNbQxBTAc3LKbNTxhx6tHwyidIgzubCB1UeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMzIZRUOBAL8BvoTzx2l6W/c0vtXq9GN8NCBWaKTNxw=;
 b=fKmYreSewsfVU52xp/5YQw67HIcNpzt3VzAzOCJ3T0NN0wUgQjaUbYhjuXXdTGCsxMjPfYEAvwGE6TiP1ELAQKzlB3N0+qjGo/gYtgCPP86lAVwREmI7YaSzf52Hu2hqmAFgLAHUywYX8o/sfyJDGMbCH3nGH7apVuxv6VkRg9vKhDIVaW5el5p47dsmuRHS3nNjsnSZH52+LYCPfhdWMQXCRABswdmXcmnpYKEF+fC9tWSWU1lcShhEB2X0T7+DdwOXZFrtT0JcXG8HpGJmJXJi9gNB7N8rroJSH+kJopRVkhe8CIR26c1j24kVfEdGbCzFMf7LXViFNESwp5h05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMzIZRUOBAL8BvoTzx2l6W/c0vtXq9GN8NCBWaKTNxw=;
 b=uczrcKYv+UQw2KPjBRyKqhuOla+RgQugMUK5u22E3Wx7WVQ2fwJpjvSFBvoi8GFoPZwBveSJCbOo3tigbLSzwP60XuI3/cTXpgoAqRShTGc3XeXyi6ZVO7J0p7wJrMAUS0vuNPjZUdLX+ilxwrj9R/oT+47+jzQ7YtN8XtuUT4I=
Received: from CH0PR03CA0235.namprd03.prod.outlook.com (2603:10b6:610:e7::30)
 by MN6PR10MB7444.namprd10.prod.outlook.com (2603:10b6:208:472::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 12:42:10 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::b1) by CH0PR03CA0235.outlook.office365.com
 (2603:10b6:610:e7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 12:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 12:42:09 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 07:42:08 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 07:42:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 07:42:08 -0500
Received: from [10.249.33.61] ([10.249.33.61])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63ACg7VB1396576;
	Fri, 10 Apr 2026 07:42:08 -0500
Message-ID: <d2404ffd-61b0-4562-a383-9579cc8d01ab@ti.com>
Date: Fri, 10 Apr 2026 07:42:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: oe-core
 v126->128 migrate bbappends
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: <denys@konsulko.com>, <b-brnich@ti.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260409213918.1020996-1-a-christidis@ti.com>
 <20260409222737.GC11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260409222737.GC11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MN6PR10MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 85103068-ab14-4fde-00aa-08de96fe94f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	63IwsDHI0BRbiOSVAhowqxHBbZKvEoZiUwpP1JGkEn73fsx+LUs2GdzEK6AkmNx5goLfBKpWIO/saCVSbUx0ovwuEMYemKAcTot2969hOdQ6Tss61ShNsx2ykMRkWgT4r1pdjxtLLYpK3S72pCsbCa2wkzg6Rp/mJayCIHjICdrs5FMlFeiyp7xYnyuHhoVmXyovFCQjT9M3RGF6K27AZIkxHfX1NoXZoxUfyONnxgDY4G9lO22xO0kgpaXyoQRrTi809/IRUqk+NxShh02ykn0AQYbe7epPlE8K2Odsh6M5jfvHGaKxZPWIoK7j3vvZEGts6pu7worwFO1E5FgcOP+k50PEnRR8ps6RX/A88gKAHc04nf96MHnjC11HMG9tabDgy1TTdED5eAsqgmiRNJb3QhqShsKU+G0lK2z8lJUlTbzZuMxqZAmPF0+NVfnUzLgVXqLi7ef+gybRvGeMJoah4qzmFj2gOQ74+QyiN5Tfc9pgPkBOSOZh2VYV1H5Jcdiaxu0DSdvNZMvDV+2xsILjPlgTOORFICdQ7+8xKkZL+jT8eKEQoRst0My4Qf2bAFKC8bl2RH0box7wJ1Sw/nQArR2/d8dOk+JvLuvpVqT6seba/5mNar9cXHId9/UV5BNK2BNFgqFEN7XtN3TK14w38BkLpqOHHLgZgNMMIw28uDjOiAbdVMuRDxZzJ26m2ctqya4MFALeo9Lb74Pl2mr8jHwWIkP1t+vjGwoLC5wqrolxzCRza+CL1JHd8vLXBQiFyTglTSfBou90tTlvRw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OZL8JCo1y2itHIcIZTcghtjSu+ihDaX1PoF0kKhp28B2ZjWOaZHw7E16FcUATuveFQYCC2sMATvWqFRh6O9F7DoQZRF/4AdaNtMLTI4fHXo1M3rsPpUWFELPy/L0g/FDxnijG6aZ9ke7TVYM+UsRASmUpRCd/HwyRXpm3XQaz2qzIE5GE+iTSFclZU7+TqYAmTzaDt+wZXxeIxfQ/BQ5VzUiiCZt/o7Au2orEKfkZRLMU4ZR3FIf3KWq8s27FeuYw43VPv8RU0h11XACx6Hgz/dhaRGm+ISaSQGb3pwq8nR8wibO/8g+era8dIwl3qlXN1Z885cDYi4uNzjY/yBpw/hFHRpSEMy4ybI/cnu4xQomck0nq4lBhG0Covw8NYE1bA3PFJhgYfs/TkLgnyv6HOJC6E/8TB78FlA3TdldqY7KExoxBd3Py9XwkysAi+YW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:42:09.6984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85103068-ab14-4fde-00aa-08de96fe94f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7444
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:42:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17462



On 4/9/2026 5:27 PM, Denys Dmytriyenko wrote:
> On Thu, Apr 09, 2026 at 04:39:18PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Fix bbappend files to apply onto the new recipe from oe-core now
>> versioned at 128 instead of 126.
> 
> https://git.yoctoproject.org/meta-arago/commit/?h=master-wip&id=c923bf7b5b67b7261583f330dbe9ba22a2076b6f

Yep.  I was testing the builds to make sure that the version change 
didn't require any patch changes.  So I didn't want to send the patch 
until the builds were done.

Just sent my patch.


> 
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
>>   ....26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} | 0
>>   .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
>>   .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
>>   ....26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} | 0
>>   .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
>>   6 files changed, 8 insertions(+), 8 deletions(-)
>>   delete mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>>   rename meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
>>   create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>>   delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>>   rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26-arago.inc => gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
>>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>>
>> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>> deleted file mode 100644
>> index 0ceb558c..00000000
>> --- a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO = ""
>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago = "gstreamer1.0-plugins-good_1.26-arago.inc"
>> -
>> -require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
>> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> similarity index 100%
>> rename from meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
>> rename to meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>> new file mode 100644
>> index 00000000..e8392833
>> --- /dev/null
>> +++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>> @@ -0,0 +1,4 @@
>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO = ""
>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago = "gstreamer1.0-plugins-good_1.28-arago.inc"
>> +
>> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>> deleted file mode 100644
>> index 0ceb558c..00000000
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO = ""
>> -GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago = "gstreamer1.0-plugins-good_1.26-arago.inc"
>> -
>> -require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> similarity index 100%
>> rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
>> rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>> new file mode 100644
>> index 00000000..e8392833
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
>> @@ -0,0 +1,4 @@
>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO = ""
>> +GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago = "gstreamer1.0-plugins-good_1.28-arago.inc"
>> +
>> +require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

