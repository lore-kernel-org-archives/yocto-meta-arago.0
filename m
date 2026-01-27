Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F1FD2FEC4
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:16:41 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16929.1769534195440010546
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 09:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UfJKaOd0;
 spf=pass (domain: list.ti.com, ip: 40.107.200.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3jLpulb944mtLzKbdkz62ZSaXPJ7HbUXuFUAEWElPQN5sDkNIqFGXkXgnPQsXuYHxlU7cjyxr4MFJJwDFvR7/xsfSCQm7GLAe43v59aJ1BYAvskcip+2g0Wlunt/5zl47ZW2Li5eEXYeZLPo5k4acCCokE7DNJWNOasvUD44dE5+p920Gh9DGvDytrOmPG6t/qSC2P5Ms0m9AZAkset36Jn/uPZGYDUuMw3+1WuA61HnCimlpoS6+1kP/cnYlz0EVw5E8nXqKHW3lxQ7ud1qOShmz362vHtF4BxZMPDjdvVU6g9gJ0RPJAPSAv7QB2gcT7wXuQQuPmxrLXXEHQ9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOc445x03/gLvFExEapCxK3EGoJTEAs9qWuxf/YUvh4=;
 b=nDcXn2+TbGj24AaT8bqn6HM1bVipLWwE/VuL+j2D5UZOtDcqeCwTVttWBHzM8RDFk2aHmqkkGH0lqiZhsLJJRTxOyVe9BhmvIdwei9J6TAmyDzzZrDiTDdl+U+IsqiwxmWA7+77hg0NWEGNjT6JFvfU66BTrq0ELHXuZVMdqs//0n4tfUDbRmSGu4g03dehZEDpwZGQdOHJUmdbtXlNGBHOhUlRFjVYM54pwZebPfOYoizl7u1lQkvrrNjPI4dCrAs7wTjyTzFSxz10nRLWrfmULNrcYcyL9eFZ9tAXnFK6dIP6CNcAxY/EjcmUG/Ld0SY2cxmTcuCdV8U5hBW7Clg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOc445x03/gLvFExEapCxK3EGoJTEAs9qWuxf/YUvh4=;
 b=UfJKaOd0ydIVyw1MxA34A6MJ7pkvNXATlOFECfIJbZdiRurAnzTRAmiMseR7dfBNsEIDN7ZCFCMsB2O28k8NQwon61mU6V4AbrC70wFyqqJVnLorvTf5lTJ8F3H4bADZLpjiQQMmmV9MSwJSdXwBb7XZokLigbkwFJHN1/iITZR3FkkNECiXYQwbzi+T1ENIZ68R4gpuCFepVkCiFj4xcAZepYHiq/VyoO6jMEMQjFCbazEzQKL337dIHhEl1Qr63UxuuyyXSuQvTFwDEElq42C/IzyFBDwS2R0oEQ4/EP/+gvZikI4IG/oskD4RPcVzy5VD8wCOmbqCL90qPCeGnQ==
Received: from SJ0PR03CA0103.namprd03.prod.outlook.com (2603:10b6:a03:333::18)
 by CH0PR10MB5130.namprd10.prod.outlook.com (2603:10b6:610:cb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 17:16:31 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::70) by SJ0PR03CA0103.outlook.office365.com
 (2603:10b6:a03:333::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 17:16:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 17:16:30 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 11:16:22 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 11:16:22 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 11:16:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RHGMFp3885877;
	Tue, 27 Jan 2026 11:16:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5ADFB138B5D; Tue, 27 Jan 2026 11:16:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] *-telnetd: Remove telnetd services
Date: Tue, 27 Jan 2026 11:16:22 -0600
Message-ID: <20260127171622.2388158-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260127164327.391138-1-reatmon@ti.com>
References: <20260127164327.391138-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|CH0PR10MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4b66ef-ac99-4344-83ce-08de5dc7d053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UL+EUdkQIBxOmMBoCyWIxKPoYsmIS39pjNu45R/DlsCqPzRnk+SYpdGOsTuU?=
 =?us-ascii?Q?Ybi2/b5Fx/YGejNr1Nu5LVySmMw44MLK97Ft4WJoL1q/nvx2eoO8dJVx8Mgn?=
 =?us-ascii?Q?3+B2EFRvMEiv8I78+86kpJOM/CNos9fPpYwHzDz1Lx07YPtryMm2EG5ZXYBx?=
 =?us-ascii?Q?IlHRVJgEl+WqmowkI5/6UdO91nL4Qg/47vQJBp1M7NA6kd5iHyW2YrUZY5mh?=
 =?us-ascii?Q?2X4oaS72QbUF3yWIGd/caQuw2F9dbVLoTDpFp+5lluHTPq9Ma5i2wLsO4jf/?=
 =?us-ascii?Q?JVgwvAa0DXILNbxLHmYzrIwEEXlpHejZWE5117K/YUBvhlTxB2hx1/WcXRZH?=
 =?us-ascii?Q?LBae6l5JEOiAUNqf8oBxMmsfJ+jUhPxvaUJSdMplRp+tgqB4KxCBU4utWOgL?=
 =?us-ascii?Q?4dkGVJzkXEsNonvlvo9WYM2rRW2lcoR5bJOeH5Fhe//114PtG/MXrRYr33TS?=
 =?us-ascii?Q?DrzMKDon7mYXC7oqk+98o/AmCJu+A4rcmc0Zmz4YXznAq/Dc2huyzzGoCIm2?=
 =?us-ascii?Q?/xdD1PmomkN5ILaotFNo0ye0ZiKM3rMqLMWCt7OdmBiQLEPaZOWQphChl+sI?=
 =?us-ascii?Q?2ujbkkeIzgUTykYpwQ46gE9sKCntxHq8feRb/0w+JIEP8gRfzxk/+gulicM+?=
 =?us-ascii?Q?FD4jWVIjrYXh26MgucH1Sf7+D0jKe+jhIdeR/7OT+cOjcbiykdDpR0rvBFPU?=
 =?us-ascii?Q?YihGojsDWMDmvJcxRTXto+yLfJKGRyfdRR7KuvsGVq0Kp2aRW518mYyTj+YY?=
 =?us-ascii?Q?xbtXBW5afDERaJcdvjFyEBNwrXYiN92jBuj0oIsFC/yWN/KTfUt/1jx0wCvD?=
 =?us-ascii?Q?C2W/Cbbz+tfvZfiL0YM+C7oj5EM473paaLTjTYQYNOFQsG7YTynjpnH9udli?=
 =?us-ascii?Q?PDGglNcRJZo8X3rbgVxbH6Yo3Y4OwLbIB0jlfaRpQyrIHgmV1jwXejnNQ6ef?=
 =?us-ascii?Q?7A0/F8RypPygAXnpQHbrpRUMNUFeZ/h4pY1PwY6LQQrtHtGAc0pw0X/QIfMR?=
 =?us-ascii?Q?TmvnLmS/Yf8HzAFsyQXrkcIIoJCoU939WoKoq8D2h6/ysfw0f4XX3+JT9X1s?=
 =?us-ascii?Q?jigSTwUOieeGYGPEQqoVD/WxZqUwQy1DzBm1nXIhuVi95fSroiaduJY11WZd?=
 =?us-ascii?Q?Vdhg/xSOaYnaMXru30Fzr7lybZ6zWOKv2H4H3d3ZOJjMfckut5gykFvyX44p?=
 =?us-ascii?Q?0F3gmIC15MFdf4lSIdSLpUDV3yeGQYm4jMPEJRKECfkhwoaAt4y3Usg0Q83A?=
 =?us-ascii?Q?wGok/sYkrD6VyDwGWiJPHhyBOo/Fr+5DV5QYIkGu5Lt5DPCeGCk4YlcCO0kk?=
 =?us-ascii?Q?4bbDNSz7GyUs3t4LTzPXtFFcQkzyqvPCp09rVMIsmdpusl32fGZiYvrtWNU1?=
 =?us-ascii?Q?LInOmb0TR+l9li7geLcjKTDcifrtg3uIEf19H9pVCqSY5lp9JjfBJ3cnRF2N?=
 =?us-ascii?Q?1Sb948gCCDzWOihRHUvxEupuBfOQHwlPjgmS9OZ2hebQfL4MjZEOSYXqbFK5?=
 =?us-ascii?Q?nAWSTBdK8d3wHpgygoFOHfWJFRk3zh0SQQkQDvmQaTUEr9Y4vEZ43ATVkOCn?=
 =?us-ascii?Q?t7yLUbJVVFRAgdIiR2muh+yMHGJHvNNGGOLeYTrsoR2enpVfzzBWUF5QXrBc?=
 =?us-ascii?Q?FFKHukmYjOaKWVzfCH80/gKtssbEhF/jfAOvfUX4fEy46hacnJNJfgmSjWh/?=
 =?us-ascii?Q?+2BnLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:16:30.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4b66ef-ac99-4344-83ce-08de5dc7d053
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5130
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jan 2026 17:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17042

meta-arago / na / 20260127164327.391138-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] *-telnetd: Remove telnetd servi=
ces
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 27 Jan 2026 10:43:27 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b99d88d08675c978ac801d02b92093c49=
ae60936

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: meson: Add patch to fix Qt6 private header detection for =
cross-compilation
- Commit SHA: 1d3940fb66f2a19f94bb86eabcbfb9d19a8b5eef

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




