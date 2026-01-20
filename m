Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F01AD2628F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:08:09 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14367.1768936083247612436
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 11:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DOAfuQdc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.58, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUvG+/mShBlbjByg55swTRDiFz2k+s30Jmvs3giTC6g2xYt5oAqyH+RgAujrA0AH1fTkluiHjNMfvFmMxhYuXc/DzYJJGlaSGqZk9njpTG5bsl8LKF9RSjVSPjoNW/1ivCuLiBtTmaCJjebEpTIEJ4TiW43/6YKpANutb+j7IXtgbsP8fVMnIGeg9yooc+rZRDhtazOOfosNlSz887U+1KQp2puCE1Y2qoALaPOQguZmOvluxX9UGywtcmS3FD1/MlqGeIAJNjql+pYKYNmgBfHkcSbJeRQyCyp2ZjBT/EiYJy2P/QzZWiHQCPKgrKYXbZBoyr4rTEz+ZZHSkpHeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wfeot7/Iao9tiZycYjI8CuHXiWqQUVZoLjLC2Q1vEVw=;
 b=EHilvJsraEgfADW4j/+yK3FztcF6AGRa5D5huGtijegcTma+J+gwb5WWGy166eZxVeTb6cBGaHUau2MmnUMfptKawhxETkdV3SQTdUFo136kYMLS1fpTpWPyi27t7vvmoXkjB2eUGWAlrHoOpublgAtQDTFto95OROT7EjEetp+cAi/9/GnREyfTKG6ujU1s0Sjg1KuNwr8V+9UjvKFzndoqie4JtvG+UN1ZscJ/I3odrC0fqYJktt8b2BrGkBYTgdLFEWzzXVRl0WQOM0tumu6svgwLePbf8g9kDv8CCIWTqeVzS1YeF+++xLhEgcYa0rDO9eZsFqO2R1nrTpYo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfeot7/Iao9tiZycYjI8CuHXiWqQUVZoLjLC2Q1vEVw=;
 b=DOAfuQdcuUaqGWww2+bPRGA64h0Syfi+10yO4GxDhzzBgmIh83JV3w4LGyX7dPvrvqaCNlqdfJzsx6xodXrXbq00gxS1ZKxsoKRRaxx0Li7uLVR0J7zMYBoVNQmZ3bs0Swf1rACxRlZaVmMF0Sf+e6MKbFr5SxrIns+BICgDvgU=
Received: from SN7PR04CA0028.namprd04.prod.outlook.com (2603:10b6:806:f2::33)
 by SN7PR10MB6408.namprd10.prod.outlook.com (2603:10b6:806:268::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 19:07:55 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:f2:cafe::29) by SN7PR04CA0028.outlook.office365.com
 (2603:10b6:806:f2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 19:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 19:07:54 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:07:53 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:07:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 13:07:52 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KJ7qnt1569361;
	Tue, 20 Jan 2026 13:07:52 -0600
Message-ID: <0f661ade-e71d-409b-a393-44b5da4b5650@ti.com>
Date: Tue, 20 Jan 2026 13:07:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 0/2] Clean up patches for open62541
To: Antonios Christidis <a-christidis@ti.com>, Denys Dmytriyenko
	<denis@denix.org>
CC: <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260120152519.12538-1-a-christidis@ti.com>
 <20260120154224.GV11121@denix.org>
 <188C7B8D7F1F433F.3496637@lists.yoctoproject.org>
 <185dc696-fc84-46c7-ac24-aea83fc6bddd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <185dc696-fc84-46c7-ac24-aea83fc6bddd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SN7PR10MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 3867dec7-b6b3-4d4b-a3c3-08de58573766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lphYwVbmKS27MG1TvggJGPUPKnTT1UTNJ6gZNawbt5ziqxB70a+iKz0dnceV?=
 =?us-ascii?Q?iwiqq337TI348ehV8qNbuSFnOA6NVU9EvTwDIeGhsYkanIQUhmjoo82kIuw4?=
 =?us-ascii?Q?xg+tJDwK3soYJJ1xfieuwsHGYXyhn1hzEUp9GFe2n2hMTcWaSGk2PjAJr5Ya?=
 =?us-ascii?Q?uqwG7Q1uxwfaElSM/zLwmu5SH27xBiavupxlI3lQqpIReumLC1R6znJNrp/d?=
 =?us-ascii?Q?IaabWlDk/0eXnQWsX6w+86bLMbIE28l+8D5R8eRPtgyXGGaCDsdPs0rqJCoT?=
 =?us-ascii?Q?TsGeOU5m7Dnx4WSMR0j3KeYspVVeH84dX2DxjN0T2XaNocHAV+9GQkpwyC0n?=
 =?us-ascii?Q?HgMnkCWpSq/vNkHT3lDu9ZmAGCkqokMWruysBCC8UBLxeuONu41IV6Ya1oK8?=
 =?us-ascii?Q?xVgzqZV07CSm4d3N2iqMVDJKOK3RgKi75wiim0+KP9QxJpj2mWkv7eycn7z5?=
 =?us-ascii?Q?xmRztrA2UAC6gk8odcuS+91zHFz+bnhUaItTmXsefya6EmPGBVUZxkF66Nkr?=
 =?us-ascii?Q?YvUDnY2arK2LC5b4LzGs2xl4OSLoSBzCvfHXhvg3K/c3/xWqbi8v3Ot6Pukc?=
 =?us-ascii?Q?X1XQN16fTfmChx7skpC8bki05lhyOSnzI4IQchzw5F71DDIwV7O+nJ0MbHbH?=
 =?us-ascii?Q?/1Gor5bsUq4BHybanfjcGNcMXPiDm7RwVLC0E3kR9xIeSimqApH3B1duZmGI?=
 =?us-ascii?Q?oBFZQ+JBWCpuZEanZWyIgIbXHsd0x1MoMOLZkSxFXVrSr+2m5+QF9oMthRIq?=
 =?us-ascii?Q?33gy1maJSKrfhW0IxcbcLbKheVRdgI2AB5myDptS0koWskeEZq8NoUeyPbED?=
 =?us-ascii?Q?3tVfUGKIdzz1MD9HuWA0b/kKuN4ZtktelTogKSZHuiU0NQMjyoGrS5qIph2B?=
 =?us-ascii?Q?ejQZF+1fAWF4F6QLQIuKeBuMdfPVxgEt6YpPexIxHvElcrn3Z5QP8XYb0v7j?=
 =?us-ascii?Q?7N3GG7pkk/F+j/l7lX+pTm6WG/6fyguNCpaM+x49hnLsKgX/4pznTP8PL5J6?=
 =?us-ascii?Q?Y2/7DanFsxwsYezVVESEO+lT9bxY6YP62GmQGBHkR/sn+Qnn8YfZ63ahCJPI?=
 =?us-ascii?Q?sVNcF6ofAq3UKaf3crBKLcqYGvjK0jt1ZJhjLQc8Qz1FODPD3Mb12HRGycZR?=
 =?us-ascii?Q?jIQgQjIPWKEJU48ZZCcMikT4zZDKLcYo2ca7NCwJYBNKfp/+pg2kxqtgHv+P?=
 =?us-ascii?Q?qouKZbF8rJs5he5xEcvYxHoFF18KMxkUhyX+aCkNchvASLtMowUf6KvSZzEJ?=
 =?us-ascii?Q?yDYXHcadZDwL9Zx8CXxrKDphFJi192RYQstCFiHfWYjoZH5xL/8kDEuo1Rcp?=
 =?us-ascii?Q?QoqfeZHrCvK5x3S014NO3oCuDbWqV8zpgWkFcSW5nLEvNDOYRvJ7i0yTuvFD?=
 =?us-ascii?Q?xZIK3lAjUxeeRaZ0gAWjGxkhPnVGaT4/Pwi8k5ApWBOjCkHUbZNjxu44Z720?=
 =?us-ascii?Q?3lKGbGh+Be1JFgV8hXOBRRqEyNM400ZoH+sklT4ZoRwTlUV33XGuQMU5Vh3P?=
 =?us-ascii?Q?WZrIZp5VGi5mRQ4V/nK1dM3TyC2L5Lq24UCLAA0M5lUZ7eppUlx4hoZs0R4x?=
 =?us-ascii?Q?+wcJKqbt8tJw65pWddtLVxy5JxO3WMJ5i1a+wJfbM5TmvJ2I3Q5OeU+nojrQ?=
 =?us-ascii?Q?pA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 19:07:54.7269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3867dec7-b6b3-4d4b-a3c3-08de58573766
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6408
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 19:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16993



On 1/20/2026 10:32 AM, Antonios Christidis wrote:
>=20
> On 1/20/26 9:56 AM, Antonios Christidis via lists.yoctoproject.org wrote:
>> Yeah just noticed that. This series might be redundant then.
>>
>> Ryan's patch=20
>> 0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch is=20
>> status pending upstream, with no link and I cannot find his PR on the=20
>> github repo.
>>
> It might be worth while to use my patch, since I have already created a=20
> PR on open62541 github.

My patch was already staged in a CICD to promote (which it just did).=20
Send a follow on patch to update the Upstream-Status, please.

>>
>> On 1/20/26 9:42 AM, Denys Dmytriyenko wrote:
>>> On Tue, Jan 20, 2026 at 09:25:17AM -0600, Antonios Christidis via=20
>>> lists.yoctoproject.org wrote:
>>>> From: Antonios Christidis <a-christidis@ti.com>
>>>>
>>>> Dear all,
>>>>
>>>> LTS migration related efforts to fix the recipe.
>>> I think Ryan already made the same changes last week:
>>> https://git.yoctoproject.org/meta-arago/commit/?h=3Dmaster-next&id=3Dbf=
47628886392400787668c9b203334ce00e2e4d
>>>
>>>
>>>> Kind Regards,
>>>> Antonios Christidis
>>>>
>>>> Antonios Christidis (2):
>>>> =C2=A0=C2=A0 open62541: Remove deprecated examples patch
>>>> =C2=A0=C2=A0 open62541: Add patch for implicit declaration error
>>>>
>>>> =C2=A0 .../open62541/open62541-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>> =C2=A0 .../0001-examples-Remove-sys-io.h.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 68=20
>>>> -------------------
>>>> =C2=A0 ...plicit-declaration-of-pthread_create.patch | 30 ++++++++
>>>> =C2=A0 3 files changed, 31 insertions(+), 69 deletions(-)
>>>> =C2=A0 delete mode 100644=20
>>>> meta-arago-extras/recipes-connectivity/open62541/open62541/0001-exampl=
es-Remove-sys-io.h.patch
>>>> =C2=A0 create mode 100644=20
>>>> meta-arago-extras/recipes-connectivity/open62541/open62541/0001-fix-pu=
bsub-Implicit-declaration-of-pthread_create.patch
>>>>
>>>> --=20
>>>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16990):=20
>> https://lists.yoctoproject.org/g/meta-arago/message/16990
>> Mute This Topic: https://lists.yoctoproject.org/mt/117364498/9164840
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
>> [a-christidis@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

