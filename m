Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F78CFC298
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 17:29:37 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16858.1763746172396269591
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 09:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tbbRJajZ;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.201.14, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukqvyZgkrP3/jWG89/Q/P+gnV+KtgckFDODjpo6wRkHmTsFubiCNOHA/8daaUJlahns7xM+HezEWmdjRTR4p4WBsvFv72SDN6ISh0/gzyWdqQRWM5WW5xxeAnvOA2xtdfK/uSQoYtLOh9g+AcWNrA7Owfx0Rj93796xhHfMoUbYd6+TWHvM8YX/5FvRo70/j2/bcxftStlUv1+4quRrXdrZv9LGghPRXw89Ln0b7th+JmGQP4xXSVdW3JUjQa26wsVuv7zvTJP6KjzRyCDrWz8b3SrrM/Nd0qfcdrPJgenIiMvZc78cNaHERoVopFzkchzlK8cOJyf4qkoK59GxqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvQzz4ESelPU4i05PBA+QucDb0qoaJ2qGAPXHkzDvKg=;
 b=dWvg6S3KGn9oO+IOns7HbZmDv+ZJLm5MgMk92dplUtanbL+vY2YyIK3yT78zsVBGh0oI0VYbX8DbSLuV78MTy+MourEB6zSIJFIt1AGDhK8Gvja5djdIZpKE0rrREohlPyTTKsdiURD83OzbGzPjF3WSCUGIKz/kvRnZfHmUJy8Gau//ZgI2iABetczvXVplu0lq4mYF+L3OcbqHie5ImSpDibZuPggy+SPtXz+8Sv01kvVCN5pSSTD53/Ql7KzZ+ZtkvM1DYTX5WCCeqVd5molCJtEYPfNaKAAmPgebm7cA/8O+IOaqakGhSDL1Mn5SkNAM0lk5O0tpQm3Iq/7aAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvQzz4ESelPU4i05PBA+QucDb0qoaJ2qGAPXHkzDvKg=;
 b=tbbRJajZBrGXMEt8SKpF15QS76apnO2NvgdQS/D+QGpwcFCpHLq9mVCZkua0ZwT0FrcnFjb1hlsPnXilgbV+zHKoL62VgfM5g9m5S0LtEcetqQrXSuvQ9anMiu27OJsryHmTWRJwEROq63Nh1syH2NoyqiM+1uxJ/bGebSBYksk=
Received: from DS7PR05CA0106.namprd05.prod.outlook.com (2603:10b6:8:56::24) by
 SA2PR10MB4633.namprd10.prod.outlook.com (2603:10b6:806:11a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Fri, 21 Nov 2025 17:29:27 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::65) by DS7PR05CA0106.outlook.office365.com
 (2603:10b6:8:56::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Fri,
 21 Nov 2025 17:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 17:29:27 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 11:29:25 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 11:29:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 11:29:25 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALHTOpJ1658633;
	Fri, 21 Nov 2025 11:29:24 -0600
Message-ID: <1baa5712-9a85-4e04-aefe-4a6d3458a5ad@ti.com>
Date: Fri, 21 Nov 2025 11:29:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago-extras: nnstreamer: Update
 to 2.4.4
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
References: <20251121160030.459921-1-afd@ti.com>
 <188a10c2-9e9a-40fc-8693-e303861e9508@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <188a10c2-9e9a-40fc-8693-e303861e9508@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SA2PR10MB4633:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f66b19-890d-4795-1055-08de2923858a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lMDSLqMMtAF7WXYccxksJR9h6OJCpD7Jv5mcod8cZLCV8zXKFu4WVdJCdHmV?=
 =?us-ascii?Q?q4qS8BPksi0JX5NLDuX88SizvyR6ozAipcMnkkhcr03rWCw9rB3GKO0XPYdL?=
 =?us-ascii?Q?zQJVclCnHUXiKxiQlgIkjYf9qlV3lO8IKzInToStQ7ynHV/BJq89RW6ZWTI+?=
 =?us-ascii?Q?ie8flwVpqefo+ZGSbuowl1WcHY2gLm+9oeCOmoby/TJIzqPldtlf4k+lRkZe?=
 =?us-ascii?Q?uNRTnMKm8zS/iEweiYwoD3H5PDLHt40h7AwjGLtUHsS51JGnmVXlRYZDycWn?=
 =?us-ascii?Q?q7S6wIo39xixUv+CnaIudWa8ICnvt+WX2jz2Emdyie9eQV7tbaBRml0wzH89?=
 =?us-ascii?Q?JC56aAsPqlNP4ycyAuDZmjkt2AXeB4w2p+J5UENhBTewi00cR0XtCaSIEKxm?=
 =?us-ascii?Q?CPUFJrcUP/XpPT5Ig+XyBCFmZemVOtx0YQdum74835ClCrlrvN+Tbv+8Sqrt?=
 =?us-ascii?Q?xxB+y80K2qh2m/Np2O8bqF5ruG+Ps7p37SzQeAD7cPLgBnOQWtO4h30S6f3r?=
 =?us-ascii?Q?+AWSp4YEbiaXqkOTCXaawCH4rCNs7FaAb4wIoXSAmVqI40cL4+mBHt3I2q98?=
 =?us-ascii?Q?9FyFJYcSIRIME/ieUUfUhqH7VZ7NrPLWIwTMmt6ajQt1OV2CEleWd+r4W0sW?=
 =?us-ascii?Q?mmaU2b4b3041vMVCr2T82FORruuovMDDc7xrDoPmBtFuTaFVEaSLu611vP1q?=
 =?us-ascii?Q?3NiuW/ri/jpvJbQ0aIVaC2wc1ljx5vWXejWQxy3iwGCUYfTQZpK16g0O4tup?=
 =?us-ascii?Q?uw/Ch4VHb1H0n1C7fZRnYYmI0NcTz3rcg+dlbqJjbWHHxVncpPsYj7E0UEVh?=
 =?us-ascii?Q?6eawibT8doWWt3/l33vb3/uZ4q/Ghfa0B4lfz8CVpW2++1F6CCPdhfI1lAYs?=
 =?us-ascii?Q?XNkA70/VVk+aXLNTOHVx0ki9WFmLHMT6ZKQuzRhUZPnquUnd06TkU0GSsrn2?=
 =?us-ascii?Q?d4l3vmg010vyJw2eOWJ7P+Mjk1MctbWFIMVYzlBCWFNzq6t7b/gnAVWJ18ay?=
 =?us-ascii?Q?37bwCMIyBd04Q0dCbTNfev9vHn8FTmdhhvBfPOUug0zMWL8zhPkKXPQHcWwP?=
 =?us-ascii?Q?UGy02hjtwg3e5Sf1eioIdCKYaK34KtJQ/wdXZAj6RKpOjRMEblCa8JI8FMYh?=
 =?us-ascii?Q?WbMUscGZWY098ct9WrbLwxeSXc12/DfQkT2jLtxDgvJva1/GQRjbCW3SR9Aq?=
 =?us-ascii?Q?kV5i/0zyWDPMO+bOMJUPGkYQBL48xo1arMtto4RXw3W5QmNPiRdugnmqvbbv?=
 =?us-ascii?Q?edZy24sVy1HaeowOFxPCmLT3B3aREJbqsEDfX+DNHgdewZNmIjb4OY3LPWKZ?=
 =?us-ascii?Q?r+xi9JfivHchzRnAcd6WsmOo/MBJQR27oO7gvUZjG6S1/DkOBgimXRagZEVi?=
 =?us-ascii?Q?jUHWKVRZ1B3TfsldkjvOMUSF+hNIu8vcYc+oY4S+odM6+xl8hf8JX4nGrT6m?=
 =?us-ascii?Q?ihyrHFgvyKwC4MGFCvjgFPeRnOIG6puQsJeKJcYU5dZ2DDR0q5r7BGnYgydK?=
 =?us-ascii?Q?KE65QmZGv3m3enik4gt6IFwLn3bS7kqK8rWgBsJmCCBs2ph+cCPitM8e70LW?=
 =?us-ascii?Q?ylVCSFEI6t4nb7HyAb8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 17:29:27.3552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f66b19-890d-4795-1055-08de2923858a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4633
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 17:29:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16823

On 11/21/25 11:21 AM, Ryan Eatmon wrote:
>=20
> Please do not include the meta-arago-extras: in the subject.
>=20

My bad, made this patch a while ago and forgot to update with the
new rules. Can this be fixed when taking or would you like a v2?

Andrew

>=20
> On 11/21/2025 10:00 AM, Andrew Davis wrote:
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 .../nnstreamer/{nnstreamer_2.4.0.bb =3D> nnstreamer_2.4.4.bb}=C2=
=A0=C2=A0 | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>> =C2=A0 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreame=
r_2.4.0.bb =3D> nnstreamer_2.4.4.bb} (97%)
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_=
2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4=
.bb
>> similarity index 97%
>> rename from meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2=
.4.0.bb
>> rename to meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4=
.4.bb
>> index 63995d83..0da572a7 100644
>> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.b=
b
>> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.4.b=
b
>> @@ -4,8 +4,8 @@ LICENSE =3D "LGPL-2.1-only"
>> =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127=
788f1ba590"
>> =C2=A0 SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3D=
main;protocol=3Dhttps"
>> -PV =3D "2.4.0+git"
>> -SRCREV =3D "7c57c288250578cad598f065b6fda6c0ff720cf9"
>> +PV =3D "2.4.4"
>> +SRCREV =3D "3b32573bc104b4708af44837466b8b6c73f94869"
>> =C2=A0 # Only compatible with armv7a, armv7ve, and aarch64
>> =C2=A0 COMPATIBLE_MACHINE =3D "(^$)"
>=20


