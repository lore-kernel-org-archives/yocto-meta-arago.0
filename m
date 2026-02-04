Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D39E9D41D
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:18:24 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153.1770225501441025345
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 09:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WNltpvsU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.15, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWAUPdoRUfdIb+mkanSbPmHTf/FUfN1gAmhe/QGfYH58ogsRI9/KdVp9N2Jwv0+fmxag616MwW9H1UsiY4PAx36MRY7pQn45w01jlKWxqYY5AxjT1Cfw/KX02ESOBO01K9pkh4NMNxDSAeQhofPN7pZqll+H1XUZ6JlVd4Qnx63qVUHTNlyxWKRBKgJ6T1nJCRVrAbnG/yiknC2GuqgEZfDzoyUn/xQHpeE+X7Qth5ot8wozDKIxrpZbjDPZ6DLdhKtKlz1CyI8LBCBWllQyh1VMnMTA/Cc2eBLNric7jIdqLTWIDVhWqGokpzUED2l75Jfz0RnAcmi78/CzJA7clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unpwptWHyWWj7O5f/NBzv8wQ81bj0f0qp4FsFU6HYLM=;
 b=nZBu1cXelNbgPGI61OFXNe9ppSi+4aEghFu5jtSqyS5dEgmdlHo2hWBfjFkCmH8hAT9qXk39nFAR9H5VKCybG4QmXwqwGhz91oKCPqYQ4oH/4WxPqWPQZRS1LjZHg3Yjd10hmTfCrxu8jIO2i6IJyNyuOK02VTPg5lBP4ibaXBJkEeyE9T4lBc08HM37lCXsTku2rBQKENViK4CBCl40x+9MMY1CUCbi0UxMNl9s1nyEMPE8QPtX4ED8GYAXwyAq1l3QImTF56sE+feupGnxuZ3vdhdDsJPfKU/3e0H32PoyQtQ/q1yBUBJu/p4Honm/fpyn7LmdPcLAPEEcOiMymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unpwptWHyWWj7O5f/NBzv8wQ81bj0f0qp4FsFU6HYLM=;
 b=WNltpvsUa6Ctyf9ltJGq9/z/8ZyXiB3a73UmhEqr89ZNdAxnlTEPPp4k2mnqiPU1Sj6paZ6G74t1mOlNA3PfGydN2fDO/0LivgEreBX9zJAkfV/3mYlm70m+8yfXOroqPRQwlyafteah9PwaXZN4Yo/zXtAFesA6Lhft9A5pnZA=
Received: from PH8P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::15)
 by SA3PR10MB7071.namprd10.prod.outlook.com (2603:10b6:806:319::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 17:18:16 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::9b) by PH8P221CA0042.outlook.office365.com
 (2603:10b6:510:346::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 17:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 17:18:15 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 11:18:14 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 11:18:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 11:18:14 -0600
Received: from [10.249.64.47] ([10.249.64.47])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614HIENU1483402;
	Wed, 4 Feb 2026 11:18:14 -0600
Message-ID: <90bc15f9-45f6-4cb3-b78e-9b72dd0d7365@ti.com>
Date: Wed, 4 Feb 2026 11:18:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd
 service for system-wide audio daemon
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20260204160813.2393421-1-j-sahu@ti.com>
 <20260204163056.3336685-1-prc@list.ti.com> <20260204165030.GA11121@denix.org>
 <1891195EB4AAE182.3711945@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1891195EB4AAE182.3711945@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SA3PR10MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 536ebe20-feab-4dda-b9ff-08de641161e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kBfOnP3pnbL0Q7xDx3aAzW5w5KFJd6c6IBhfPJhlIsAov4Gtwd6j4EcXcPXW?=
 =?us-ascii?Q?rmCIPmRgx+FYRkUA4a64JzNJ2codmySdw6ZVRtG/RvPlITNwEAjFi9T2vSP1?=
 =?us-ascii?Q?FB23tZCfiMxb74p9Ms/qc3PvxJi8dD7JXiS1UMqEJM4ryDsj1Kr9LkHgSuSE?=
 =?us-ascii?Q?gsy3VW8TJDPeKjX9P85hEuxlF12PZlfM1WvqHLVzq3uC4ny2pkHJ6qJjP+mx?=
 =?us-ascii?Q?jpPllIfiACy9FfIXnuF0/kITU2rdJPYQ2seSRMCdrnL7+f+E0U3c3bvU8oCK?=
 =?us-ascii?Q?Sxghf2+VJ1npc5Y9yE91k5jMcjQntTng8K4tDsV0h5kIxEFd+6YCqYZZ57MU?=
 =?us-ascii?Q?8Ktolp6v9E0r3/ckfa+DWj6aEeBwr57IWlPT6+jHa0wi3VD0GG4R2F+UHj0W?=
 =?us-ascii?Q?Lk7ET6Npv4UK0SRjHH+qSv+TIwsWp+Pma6h59Vam/yafWlO3/mdDhvt95Ke2?=
 =?us-ascii?Q?/QwI3Uw7HL1jp2OsBf3GmK8zq4vEuY4LBUa8LIpKurUkkIxGs3hFKgVXaxFL?=
 =?us-ascii?Q?MVDb4rBKYq+FB8TuQOFlKdEqejrpMLzEZxgcCrGA37OteDU81vR2PtARznNI?=
 =?us-ascii?Q?XgV0Jwr2tPMfnc/e+OGR5XNJ/cVdwAwtTJurRTjQ3VcBMoMkhKbit8WTbInJ?=
 =?us-ascii?Q?glaBXVCKcw1DlrA2rAW+fWJRXj+Zi4zePJ0xR1XgC1tzWaUCe88y54CxLWO8?=
 =?us-ascii?Q?1WMv6nK9sdi+Ef3mhJov2PYX5hGND/1iA7d32E4pUIkqvbieO2bzhpT9gn7u?=
 =?us-ascii?Q?W5Wk2dtyCuKMG4qEQmUa8iNoqwIi91UC0TTZDmtNbJB4blFcyu4LJgt85zYh?=
 =?us-ascii?Q?XRRKR6ZCJWPutyYv0wsQPX9us0q+gEpyDT4E+uhiz67jESoXv/5GnZYHqHaE?=
 =?us-ascii?Q?PGY+xIlU9zSZk+eBjwLcN2E6ZkwIW6K3+0RK+L6yDGS7Ic+zRo0IEWLOy2bJ?=
 =?us-ascii?Q?A5TM07mR3V8v9fCP6MiURuQSBUxnthwbuUUGrbHV0HwcERP7E4ZTPcWb2xJB?=
 =?us-ascii?Q?xu+vqHdzEr7N0JD8SemhdCk+KtMPX/RG8kh1IMivXsnijRnOxnRGF342ScAO?=
 =?us-ascii?Q?NAlayre+RFA3crgpJwG60l9apOY3PE+rCtcUxychQbvBr6LcUjZJTBZnwjfx?=
 =?us-ascii?Q?g7U2lgV85lS94SosATlr2zDRu9SdNfT04tTh9IrB9v7gbj0kg4+vHHx1Nd5C?=
 =?us-ascii?Q?rgyT8wKtX4FqA5J9R2pgbRFEmz5igwamPspMUMqJ21u9Hkar1jU8AmuA7YXU?=
 =?us-ascii?Q?xFEU7e2aPGI+U4LqauYSS88W2JE6XhkxzbFAeUf7n2TXVS9KGeCAhCbQAr+j?=
 =?us-ascii?Q?qDRvLGbiXOBRxQzCcdw/Y5Dx++trUyx3dwc1fA0nJfEa/WD+a6Ggz4N0t/XX?=
 =?us-ascii?Q?MQC7Tqbf1A7z72WCqIpNSpt+xotQbeysq/tTaxSnah6xzFk8eP6pFXyf4HpB?=
 =?us-ascii?Q?QSQicD+tcxG6V9NImYN8aTV8MnkIfUjg8RgAn6su8TWpjcNMlEucfQ9MIP2b?=
 =?us-ascii?Q?KT2vzjJzFq+Ym8uIWR711VsZsW5owvZMuhDE+x8vjstijRPQbCvZwCumxfMe?=
 =?us-ascii?Q?T6ECs9TOaD6CunamYGn1WQdav3nzyXsgoR1YZs7mDXVmc0gdGg8QPSa2r4wM?=
 =?us-ascii?Q?D+MwamBaBjerFYEGUsXXocjMkAmukPcV/XTpcYAjquiRQyMcrdAV1JGb1jfA?=
 =?us-ascii?Q?BRLbYA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ictTiMHgoMljKMDWe+YG/+apq3IqLgKUC/vrXMg/K4P6ADmkfSAHfJ4Xr1gD9dGNSNj2Inlis0ICpIhMxb/LnWOqypDnhe1eVr3FL64kNqRifn3t6qGNFEz0M1gk74u+b+jQoSnnAhUFZQEC4fy9/awTlMxzT7dhaOhQDiYmtPdjhEhmLVhuVGbW29O52xAcKVtAk1lTM2ewkWKLnC+xEhcF09ckphGP1h/MT0KTDvjxqoat9fmLzbsNN0N090LTiBfA+GbrNXlhqQ50K4s2jYAoVgeSzXWaSMfoR4PgcArUZQrfhkd6apHT4X3td54v1HmkHSjIBGJMqXDEsfXgw6Xe4U6O5ib+/WDe7PQ5bLqI7VdV3l05aoh34z976VBDYAWtMQ82c2Qe95lmjzo+sfssxDbPMFjb0ezqnCSgLh9SAq0BwzU4izsrvlyDVB83
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:18:15.2091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536ebe20-feab-4dda-b9ff-08de641161e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7071
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 17:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17084



On 2/4/2026 10:53 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/4/2026 10:50 AM, Denys Dmytriyenko wrote:
>> On Wed, Feb 04, 2026 at 10:30:56AM -0600, PRC Automation via=20
>> lists.yoctoproject.org wrote:
>>> meta-arago / na / 20260204160813.2393421-1-j-sahu
>>>
>>> PRC Results: FAIL
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 check-yocto-patches: PASS
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Patches
>>> ----------------------------------------
>>> All patches passed
>>>
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 apply-yocto-patch: PASS
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> master
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Summary:
>>> - Patch Series: [meta-arago][master][PATCH v2] pulseaudio-service:=20
>>> Add systemd service for system-wide audio daemon
>>> - Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
>>> - Date: Date: Wed, 4 Feb 2026 21:38:13 +0530
>>> - Num Patches: 1
>>> - Mailing List (public inbox) Commit SHA:=20
>>> 9eb3f83089e67ac2fdf065915304bcd7e28f2a85
>>>
>>> Applied to:
>>> - Repository: lcpd-prc-meta-arago
>>> - Base Branch: master-wip
>>> - Commit Author: Andrew Davis <afd@ti.com>
>>> - Commit Subject: meta-arago-distro: Remove tisdk name from Arago=20
>>> packagegroups
>>> - Commit SHA: 5fb7dfe249b07778f706eb50635e2c5a2c56b13d
>>>
>>> Patches
>>> ----------------------------------------
>>> All patches applied
>>>
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 check-yocto-repo: PASS
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> master
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> PASS
>>>
>>>
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0 yocto-check-layers: FAIL
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> master - FAIL
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ERROR: Nothing RPROVIDES 'packagegroup-arago-base-erver-extra' (but=20
>>> <build-dir>/sources/meta-arago/meta-arago-distro/recipes-core/packagegr=
oups/ti-world.bb RDEPENDS on or otherwise requires it)
>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable=20
>>> providers.
>>
>> Ryan,
>>
>> Somehow there's a typo snuck in in the commit:
>> https://git.yoctoproject.org/meta-arago/commit/?h=3Dmaster-wip&id=3D5fb7=
dfe249b07778f706eb50635e2c5a2c56b13d
>>
>> At the very bottom, it has 'packagegroup-arago-base-erver-extra'
>>
>> I checked Andrew's patches and neither v1 nor v2 had that typo.
>=20
> Yeah.=C2=A0 I had to manually apply his v2 patch, and clearly I screwed i=
t up.

Fixed.


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

