Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA8BD0D142
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 16:44:17 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10565.1767804254616561283
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 08:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=E4MydKZm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.2, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkPfQH7f/b6O006J86Y3opONrHheA6l9a35kqiRr1pNWgP+D+0nZmj1sa3q7LefuZzdAwXHcr/ewTCycFk4TaPXQ/6Bcu0xqceB1FJ0WwYd3soPeRgAyjUSAw8LoWicEf3N+DmlokQ6xOulLDVQbfiXxAi7UAe8uxZ630xit9GhNzEivlrXHXhs7gjLF6q/ZH0hdxZVxPriLhTZl0PZ6qEjxlGTZnn1c+scGaSudxw6AFBZ4zxngW1RiSE1F5+5A2jeSFjkja91JlyEMoWBadF5J3NbPDHBCECl6WdK/ZPDXBfKNddHcbioVey0hZgEFYEFbKIYClhMHKV+8NKtu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCR2ydCV15Xpy8leQdPbo+r6df4mw30gJ3musChBJHQ=;
 b=FkojoKMnsmh5NS/Ly1k6lG7YsFueS/vUEuGGE4OnfFcxdrJ8sD4WnK4uWWWedssomZE3SkthW+n5O7jbbOU32gs51OdkHuyg6Uc5eDiDLRvkgVcMOOVHnFaby/wYWEjoLnPhN+MC6gzdKxZ5lGqGBeF9SP8yBhvqPgKAmj/S5CY1wh2Oza0B1Ay07TQVbzsX1cKpwMpkWpjuc9IuYEt/Rr4P0sXrfwyTaHR1p+vwhbJBYMWqHjPAsMjzT2LA24vlniWT4Bxf4PU7JdqgpfZw7ISbD8jWEJTBjhKTHSV+RZQSBXDjGG7pchy+8yg5kdNi1vQN/76TJJOArEwLNgFVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCR2ydCV15Xpy8leQdPbo+r6df4mw30gJ3musChBJHQ=;
 b=E4MydKZmlvzQRCVnXwqR3omPd1zA0Ox3pf5BzHOvqbPwXtSiH7Xkvy8vLhPEzNHbUEIAaUxv8agydAmWvazcA9OBa6MqvSeyzEpQr/AqDVaAEe4Ka+D3820GJZqrO0Km0wkObE8rxXLippoNC7dP+gI8qObNqGkQoj9ZtgB6V9A=
Received: from DS7PR03CA0216.namprd03.prod.outlook.com (2603:10b6:5:3ba::11)
 by DS4PPFB033C1B5C.namprd10.prod.outlook.com (2603:10b6:f:fc00::d42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 16:44:11 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::66) by DS7PR03CA0216.outlook.office365.com
 (2603:10b6:5:3ba::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 16:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 16:44:10 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 10:44:10 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 10:44:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 10:44:10 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607GiAQU909296;
	Wed, 7 Jan 2026 10:44:10 -0600
Message-ID: <eb255bc9-74be-4202-b783-e1ed6bd7ec5b@ti.com>
Date: Wed, 7 Jan 2026 10:44:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Davis <afd@ti.com>
Subject: Re: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon
 scripts to meta-arago-test
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20260105221926.2503358-1-afd@ti.com>
 <20260105221926.2503358-2-afd@ti.com>
 <58492a2d-1cfb-4289-ba1a-f86939d54b36@ti.com>
 <2068f564-6855-4087-905e-c7da0c151ddb@ti.com>
 <4d22d3da-ecd4-4897-a0ca-d20ccfbf4686@ti.com>
 <20260106014416.GI11121@denix.org>
Content-Language: en-US
In-Reply-To: <20260106014416.GI11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|DS4PPFB033C1B5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 7253f135-df14-4915-6872-08de4e0bfbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFJYMTlSWk9sN3FsODZsV0RXWmdPRkxEWjZheS95ejRtK1hxNnQzVUpqaXRR?=
 =?utf-8?B?R09OaWpHKzBrdE5PcXNqdzdpYWU4bWtmcU83NmJtejROKzVlSEZVOE92U0Mr?=
 =?utf-8?B?VjBOUzRBMTQrTzJvMVNLR0NURm1BcWg0U3JFS2wwaitibnRYTDRZaDdWU1NI?=
 =?utf-8?B?am13QnFuc2cvZi90L2taa2NxSVFXK0ZwMHRtOTI5Vmo1UENvbEhkRmNJM2or?=
 =?utf-8?B?ZEVleWMrU3V2RE9qeGJHbVFlWklLYXcyd2ZxU1VZSUdGTGdBSEJDUnZBWXJs?=
 =?utf-8?B?ZVJuYWFDVVFhV2tRYlFTNUplWjhOL1F5eEphWkpTVFF3Q3JRdnRtUnVWZE9B?=
 =?utf-8?B?TEhjK0VrKzJJano5TU4yNzYyNnRZNzg2Qi9FUjErcTNDSWVVaHR2N1MvL2tq?=
 =?utf-8?B?ajVVcWJJRXhya3pIb0JpZzVjZ3dWUTNGbU9RdFZjOVlmTG0vMTV6N0dDU1pa?=
 =?utf-8?B?M1Y3cXk2WUhDWGNKc2xReGRSbnk2M1JnZkx2cFJNOGx6WmZHeFhORWlGTkJo?=
 =?utf-8?B?UDk4TDVWQy94L2RHU1RBUEMwQmJjaGNEUldjalJSc0E2Y1VmR0dlZklyc1Iw?=
 =?utf-8?B?aFF6QUhEakVSNDRLMHhHcHIwbm1Eajh3ekJVS3hWczRCeU5JVnZLaHFJSEYz?=
 =?utf-8?B?MllpM1VoOHRTTlVkbTlCeGpZWXZzM09xUklxdU16TGVpYjBOcnRrNWo4dWx3?=
 =?utf-8?B?ZFFEeXhoUzdRWVFtM2F6OWxFa254WjE1U1MxaklSQkp6c290Y1NlN00vUG1Z?=
 =?utf-8?B?TEpLeURBNi9WS3VBUDZNbVd6TnJmcU0zenVXUmt6TldXaVpmcEhqL0ZDSDZk?=
 =?utf-8?B?SGpkK0N5Z1lBUy9HdFpBZWh5MGtEYUZYR3l2Z0lUZDdLWEo1cTRnSjROYTJz?=
 =?utf-8?B?NS9HTlZIZ083bXNaQ3ozaGRCdEpXOUZRWG5LeDFhWHZRZWYrSXlrMVllQ2k2?=
 =?utf-8?B?QlpFYnk0SmZrckZ4SnJKVU8ycjZzaW9WMExKSS96U2R4TE5QWEZJK21CQVRD?=
 =?utf-8?B?THJWenZVRGJML2lhQ3RFdG9MRXE0ZlNnSEIrc2tJYWVrRzJydGlQMXEwV0dn?=
 =?utf-8?B?SDY3T1lkeUYzWXczcmlLT3RKam50RXhWMC9NVlBCTkU3TEFwams3bUxpdkU5?=
 =?utf-8?B?TVhveXRwNlpaTzRvYnRDMmJxZDNOVGpDcmJxSTRrSmkyT29aMjE2U1EyUjRu?=
 =?utf-8?B?SzljdFJyU0dGdzNKamxNOThteUZlZUxQWVRpaW1SYjFLa04wZnluUlBodmpN?=
 =?utf-8?B?eVREYXhCMXRLWmdYUkxWUktYa0xZdWkwOUpLdHdHSnpoczdpYnhHSi96WUFL?=
 =?utf-8?B?c1hoUktYd3ZTaW0zQ0R1b01ab0htdHByQThoQWhIaG50T1JEMGxEamN1SEZn?=
 =?utf-8?B?cEtwcTRhSVRiUytvSndrWEZSTEVnSUJmWWcxODRXZktWVkF6OURVbFc5SE80?=
 =?utf-8?B?RENOYzA2aFFSQytEd29teTZERHhHSThvQ1hMNWRwTWVIdmRrb2Y1VXJRSkR2?=
 =?utf-8?B?S2VmOGc3bDNkRG5DckovQTJEZlQ0SWxPWEVQT0NyUnV2QkNVMFBMTFkzRnpY?=
 =?utf-8?B?aHJuZFFSMU94VFBlbkI3TjFaN0R3QU1BS0IzVkFaNlFxeFhDeFI0L00xdmFJ?=
 =?utf-8?B?Z20vdFVyZ04wdTRhanlraGdXMmtUN0d4bHpsckZJYkVHdjRDam1mZ09BTHZJ?=
 =?utf-8?B?NWJEVWdpSnFzZHpwczNIeGlmazBGWE0wUVB0dlJQMDU2TWJ4Rm1pY0htRmM0?=
 =?utf-8?B?TWlzZ2ZoM29BMVdzZGRJVEtLOXpER0lLekZDcHZNVytDQ1A3NEs0Y2JQMExH?=
 =?utf-8?B?WHRFVk1EcERGWXFLdFlHWTd0MXBWdWtoUVQramxUZ0VJUFNWVENmS2JBWDB4?=
 =?utf-8?B?RENnZW1aM0w0RDdQWkVVY28vNHZFTmJDMDZIampGOStwVlVkTmJzV1RqVVFs?=
 =?utf-8?B?OExocWMvblJCRk9iQTVzVTg5SUlnMVBPMG9kNThQUE45dkpTNU5PamRCVVpi?=
 =?utf-8?B?MGx5UkZsWGZINGdqcEZWdEJ3U0VwbUlCQy9nM09qd0hORzBmQzNCWWVNUS9j?=
 =?utf-8?B?WUVqS0dHb3N3ZkhtNithaStld0VEYmxCeFZxaUMvTUVqcVIvYy9MbDFQbllT?=
 =?utf-8?Q?icdI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 16:44:10.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7253f135-df14-4915-6872-08de4e0bfbdf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB033C1B5C
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jan 2026 16:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16938

On 1/5/26 7:44 PM, Denys Dmytriyenko wrote:
> There's a standard DEBUG_BUILD variable that can be reused for this. But...
> 
> It is a build-time condition, which means you end up with two separate builds
> for release and debugging. Do you test both? Or how can you ensure testing
> debug build also covers the release build properly?
> 
> The idea of only building release images and then installing test packages at
> run-time for testing was to mitigate the above ambiguity...
> 

I believe it is always best to test the same configuration we release, so I'd
like to avoid splitting the build. Instead simply looking to have a cleaner
split between images with testing packages and images without (all built with
the same configuration). Having the ti-test packages installed after by the
test infra itself is also a reasonable solution.

> That said, I don't understand why it has to drive the run-time testing over
> telnet or ssh? Isn't the early boot testing already done over serial? Can the
> user-space Linux testing be done over serial as well?
> 

This would be much better. As Ryan pointed out, even SSH doesn't save us
completely as we would need to still inject login info and such. Serial at
least requires some level of physical access to the HW before getting root.
Not perfect, but so much better than open root exposed over network.

Andrew

