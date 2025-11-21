Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE980CFC29A
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 17:38:17 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17057.1763746695491872090
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 09:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iF8Z9CGo;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.193.15, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3DhXXnqdArPl7rp4MmdwhfWVQZOHQNm1oCrxKiR2RhM8Y+BLLAY7k0/ww1OZu0nPrMsxL1nQInLliRnaJ8Lo+GBpjIUN0daIkHhl6TicdTfgCvQNNziyURh6dx9Mj7FB40/LCOJx0+VH5QkMoIAA+6Yup0dIoi/n1J2A2e+YkUFSN2ozSEq2haoPXsINrI+8IiTWbztK/rQdzWq4L/Jz+y7cor5Zui5+KCAU+Ax7lqWQfvoOEKjwiz7klx7eXIZeOf33QxD8fj84ATvE1eyEinyeoMZROqNKV5tzY6Sh6FnVNK+8wRzjUOnZm4j+IgohmHEXRgt0N1LGZnHrsyaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbz7giMpIIpz+kvngVXLtXoV2UOGXepBtIRZ6b3RN0Y=;
 b=YqhGabXDTJn6p+5CQzA7aLRH1D2I1NPcnzRC4T3RkdLjvaBBWxP5qQGHcuePVhuC9OCRAjOyRskeDiO3MssY9ghexmaOVBRsDXNrdBOum8QUTfeMYMxJlIwnfZz68d0HQi1JaFwrXqCTa7sIvcv0nUmRMRYWcsihrR7g7JB9UiUS2q/zYuSJJqiU6aZDBQfyCKUutXNbTbISFaQgdXqbjrM9AdNXkiEmbHYFJQyH7xI6F4L8Q83V4ZWfuNLs/ZFJ+5ev0N+opkJ8q7s8Iq+nXrd/wsxHM8tpFHR0sXokasZx1CDnH6N2pEOmOTfvZg5R9+UuFx4X6FoREXfvaoWyxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbz7giMpIIpz+kvngVXLtXoV2UOGXepBtIRZ6b3RN0Y=;
 b=iF8Z9CGoDZv/4aCHbRX43mS6bBtKJCJeCoxY2coP1fFIb719PHjfatmlS1FB9nUQ9qr4NLl3Kihq/aPPoqt80TmZyvfrwHYRAKlwtUvU3a7feLaAqaFjAEYBwQ+AdIiHCVGYamgD1SLvk6O+mhZ0sjk5An+UIZPN4nQuSEujWUY=
Received: from MW4PR02CA0012.namprd02.prod.outlook.com (2603:10b6:303:16d::35)
 by PH0PR10MB5579.namprd10.prod.outlook.com (2603:10b6:510:f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:38:12 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::41) by MW4PR02CA0012.outlook.office365.com
 (2603:10b6:303:16d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 17:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 17:38:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 11:38:08 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 11:38:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 11:38:08 -0600
Received: from [10.249.33.103] ([10.249.33.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALHc8771682643;
	Fri, 21 Nov 2025 11:38:08 -0600
Message-ID: <397c8b7c-902d-43cc-aaa9-71319d39509c@ti.com>
Date: Fri, 21 Nov 2025 11:38:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: Update
 to 2.4.4
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20251121160030.459921-1-afd@ti.com>
 <188a10c2-9e9a-40fc-8693-e303861e9508@ti.com>
 <1baa5712-9a85-4e04-aefe-4a6d3458a5ad@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1baa5712-9a85-4e04-aefe-4a6d3458a5ad@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|PH0PR10MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: a6331fad-c12f-4c42-9894-08de2924bdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TMtac54SqmEEWr4VyIWauwKApUNGccl85KFlLHmVWo7Si7+Dphf3zDwkMiyh?=
 =?us-ascii?Q?cJOORfFbFpgrGsrz3+8V9PEHxPPxtUVxoxnnxvW6jWpp7CjL9wrZzM636sjR?=
 =?us-ascii?Q?D63xZ0SIZxT3CUnxJkWPa0tfEYHyGSWM5atmgOd9FwJmjeIIgvuJRSCWJH7U?=
 =?us-ascii?Q?sQe2WBzwhDkcYj88vYIIAOmvss5p7J575QcTqhjaiUUQkJHGi+DyZBf6nqF2?=
 =?us-ascii?Q?eDqU5SY1n4Y5eAnVvT2Y/RjtYyPm3AAOBQxFxvlccwa0OUuXhKTaDhLuy38o?=
 =?us-ascii?Q?TWyXpDSKkBLhW5QuF4ihpr3ObbMsi0wh8uWZgP/QGvBqgbf0IwdzfJ9aoyhZ?=
 =?us-ascii?Q?5pJmlpTp4pw9Sux0XK8uz9Z5P/z3OiyWBe/9MPCh5e8jT5IOdrR/DhFJ0XcP?=
 =?us-ascii?Q?gWXRIJbrbtwTVLjkLdgxOVFpWhWmPTUN6u+BiQ+TDrdAgX+dXiPRRxg3bZ4r?=
 =?us-ascii?Q?TI5Igz1nK+gaEz6Gi+ycLljOri2smc7U1uIpZZiZoxHm9OU+bwNHc4Okqbk2?=
 =?us-ascii?Q?4eqXdKbOVH7xrIUKAjCYWu7/su8EigPeodpQmMQX0+4/EKXrChxqufI/MQFh?=
 =?us-ascii?Q?n1RtAtPzciUOOooq35TRJiNOfQRDsuyCHP6SxHEauls7LkYgTd2rfTOCSqmY?=
 =?us-ascii?Q?OWxN/MGVyDsxiq7MRpQm6ACNRgCw5eBsFOrlbzCG9NjiPgR+RECPb8HIfX+K?=
 =?us-ascii?Q?uF0StWEl1PAtT/MGXw/gaZPp8FvPoBv0VZ83yytD+cGbdD5wXMJ+S1A4cjo1?=
 =?us-ascii?Q?FAq68pwfRax6Bj8lfB8AUgH2yTDLJVOWYVS/D2YAs4A4r1wBjnYiZzSJ7Ktc?=
 =?us-ascii?Q?DCD5m/Dhip/WDMtdZRHpPqD7p8lLf4pJ3Aeexoxw2IZkHnUFpWT1rHDcim2a?=
 =?us-ascii?Q?m4c0fVHepMxIaGjXhxMRE56EDzmVvIrOzBFOPKMsDOjYQ2d9IEGzXaAshpLp?=
 =?us-ascii?Q?u73JwHH+wXSEFu+JJb/WQhBmgnRT+D7F8rOOVVWIeYWXKQvMettMcFDMCf/v?=
 =?us-ascii?Q?Gbk5J3SFCSqVmr7Mf5CW6hw7zskUY5TCD3iQ62DocjUrtWNw4vI2+fJFK7Yl?=
 =?us-ascii?Q?JRJp6xr30809JPCY/Bzn3tAku0NtbdS1BXntXUhdZ2qxsbLJTHXFGTYaDqh5?=
 =?us-ascii?Q?egykNBLtRB80bsmH8qlVUqh/XoQ0Yk24jxAzEHWSXTgG10Mf92RjxOkAiZt2?=
 =?us-ascii?Q?m2ITHZJijJNGSysLBLwbioWjX0TRPodVhHPWBHXZ92iIsSNhwx2Dc1Qi4GwI?=
 =?us-ascii?Q?xO945CcU2ZjXXvSw55xH0BKU5b/m4iVe2R2lW1azmanPPr3klU3ZWmHGsi3k?=
 =?us-ascii?Q?Ro07H5hC20pH/nzN1+U0OmpmrqB63OwhGRCuRd4GoXXOPMNI2OJYFSp6HChC?=
 =?us-ascii?Q?reV7YtiHWPD0zloHl/YcnYWg5R1B8mBseTcJFrChwMJOPDwamKKj5Y3ohnLp?=
 =?us-ascii?Q?r1mPW1VX1zgL+8zwy2RwRNHn50T67DvyJ+Nx26XEGJ3moCxa3j6XMSPv57+P?=
 =?us-ascii?Q?a3nMFlzhrcM+vTUiq69Cx3ynPxte9HxubeykVnh+kyvtY/KaOAFyeW18Kn3K?=
 =?us-ascii?Q?mMmeC9mk2A338WYkKog=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 17:38:11.4700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6331fad-c12f-4c42-9894-08de2924bdfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5579
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 17:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16824


I'd like a v2.  I just updated the checker and want PRC to try it out. =3D)


On 11/21/2025 11:29 AM, Andrew Davis wrote:
> On 11/21/25 11:21 AM, Ryan Eatmon wrote:
>>
>> Please do not include the meta-arago-extras: in the subject.
>>
>=20
> My bad, made this patch a while ago and forgot to update with the
> new rules. Can this be fixed when taking or would you like a v2?
>=20
> Andrew
>=20
>>
>> On 11/21/2025 10:00 AM, Andrew Davis wrote:
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 .../nnstreamer/{nnstreamer_2.4.0.bb =3D> nnstreamer_2.4.4.bb}=C2=
=A0=C2=A0 | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>> =C2=A0 rename=20
>>> meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.0.bb=20
>>> =3D> nnstreamer_2.4.4.bb} (97%)
>>>
>>> diff --git=20
>>> a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb=20
>>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
>>> similarity index 97%
>>> rename from=20
>>> meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>>> rename to=20
>>> meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
>>> index 63995d83..0da572a7 100644
>>> ---=20
>>> a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>>> +++=20
>>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.bb
>>> @@ -4,8 +4,8 @@ LICENSE =3D "LGPL-2.1-only"
>>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba590"
>>> =C2=A0 SRC_URI =3D=20
>>> "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3Dht=
tps"
>>> -PV =3D "2.4.0+git"
>>> -SRCREV =3D "7c57c288250578cad598f065b6fda6c0ff720cf9"
>>> +PV =3D "2.4.4"
>>> +SRCREV =3D "3b32573bc104b4708af44837466b8b6c73f94869"
>>> =C2=A0 # Only compatible with armv7a, armv7ve, and aarch64
>>> =C2=A0 COMPATIBLE_MACHINE =3D "(^$)"
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

