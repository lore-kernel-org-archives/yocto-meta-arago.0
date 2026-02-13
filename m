Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D769EF99CD
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 19:18:55 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79901.1771010333628995441
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 11:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=j1xx4fBL;
 spf=pass (domain: list.ti.com, ip: 52.101.61.5, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWag+N3eV/TCTQi/r359bVx+GNVBU2ygtf8Qjx++7br/ViG8vq3T+MRL1tMYT57r6M1cXgsLOP3mhVm1srMuFIkSHAfA7Z3wSmB66gOsjLz6w2+MrQzC6isHAPhFahKIoj5j96hO2gJdqdt3MCIvfbAVVk1ht758saS78HXhwF0E57/hZ3k0n2i5uo7GbLJIT/K1qeLuQr3r634FWl/JrUn1TxC0FoK6XRkFFoHNqv8SPlvQ0vjyiLRkvEvNglXAuVxgkRA4pckxcUOvLCwhGyqtI/z60XOCpgevauvo6lke1aEwvnOrkBK/baRUb43ARvroO8ZQ02Lc82hX6Fq4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67x832NV0KRHaFCUrEDB2TX51iaxGjORx+QGVUyxjdg=;
 b=Wm/ew8UUEsiD9SIsmOlqkhYC1ZHbAGn+8u6ZTxMfA0+kHXQcP0Ri8JYVTlD3yfMjVoBua6wHvw/v9QGlw0mMsy7zvrPEE2X1sepxtY8zIunPEkOO+wqiasja3RI1wq2AzhlnShdbKDD41HAcuF5ODKfM8e043ZAELkG7obC9WVCKAFEXeelN+4oPHH8Nk2mgyh54uT263nRiFu5TcjQCufYpzCTWxMOkZB5RlYo0mmXhYNd1PTzHlw2JPPpqFtZNQ3nrNmjeKQLpDISQ8WamYhabDC25rHiZjeaZQ1l+lqrZyvFU3GCSFDPD0JFSkaQ0j7BBe+L5G0ud/2DxHsT+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67x832NV0KRHaFCUrEDB2TX51iaxGjORx+QGVUyxjdg=;
 b=j1xx4fBLzckFM/1Dl0sVm9Z7qrvA9qhQrVk/ikodzkB8wdRlp8VK4tbyCjamCoDI/bA0AuRBmQ3Hib5mLCVTE0Lp0AFGItdDqrZ3fLQ+zoXyVkzJRUS5bWtL+rcX9xMEX0xnnqJYqaAgK895k4v0lcbQnajUEQaAoaAkjzwLs967iBwvIEGUPcDYzMp0/GwDP4nP2dMGb4OxPK0HVj5XHHXNPTBoF/8VafTIfdKIV6Dc0vTgFWHSbpqTsuhRoEjCDDwn87CS8v9J1TND7Ax+/+UfoR4qIkScHijKHJxl22rKNQCyCJz+zTh9LV3iONoejlRxx/17KWeabfqroSF8hA==
Received: from BY5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:1e0::32)
 by LV2PR10MB997778.namprd10.prod.outlook.com (2603:10b6:408:378::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 19:18:51 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::74) by BY5PR03CA0022.outlook.office365.com
 (2603:10b6:a03:1e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 19:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 19:18:49 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:18:48 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:18:48 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 13:18:48 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DJImmV1249876;
	Fri, 13 Feb 2026 13:18:48 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 470DA9ACF4; Fri, 13 Feb 2026 13:18:48 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
Date: Fri, 13 Feb 2026 13:18:48 -0600
Message-ID: <20260213191848.3543668-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260213190329.2150661-1-lcpdbld@list.ti.com>
References: <20260213190329.2150661-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|LV2PR10MB997778:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc7c2b0-7808-4499-d7d8-08de6b34b768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nNCH1erWwFWhnODPmpTTSkc1xrvnE1onQo0h6jin5oWj1AngMo5Th54mvVbB?=
 =?us-ascii?Q?Pdux62veju6WEKN88DSpI8v2Mqt50bBatUjPIYSS5Iq/iXJ23OZG7+7dQh0w?=
 =?us-ascii?Q?UoM1gGSJGhkmGAjbHo4gfkYwf5ubodLiXBZ9FVW0Utz4oW6inL+WEvpySH2V?=
 =?us-ascii?Q?cF8r4BS4Om2AgWY3xsEN7phRhPCfntha4/8dDIqRLgYmFnUixe+Q3dcKnb9A?=
 =?us-ascii?Q?jFVVymrc0nzMU8JvFtcXoRJi40fm5rYRVdDWJnqnPOOZlarUK2ACeYfCTBTd?=
 =?us-ascii?Q?XWMRlkhHWI3C4pKTRDrszI8Wt4J6MEOafjzFbgM2ERJZwGaFB/ShxkNAr8yF?=
 =?us-ascii?Q?tdG/5VxvT5F6hdabFPyjhOxKDdq6b04WePMGtyVZM+MkHVx3hpf0et6aCL+0?=
 =?us-ascii?Q?T+m9aGcWgxd0C93HQ0aJXugIrkVKvKfz5AtlOB31LW3SDJBYqWAxYI+9hzQ8?=
 =?us-ascii?Q?ohIMWP+v5cSs708mFbT/Z+EDN7ZwVL3vq+dFXIlHZlCvPipNTEfu8I6ILRFy?=
 =?us-ascii?Q?1hIm7a87ZFYE+kLgpaIOiBDDWBW9rWVUCKM8GhRe3q8+iG5P/5pyTnINMgaU?=
 =?us-ascii?Q?RzjhY8Y3NK5/+Pf+bvqne/BFvzitWq6rTbLqFi4OoVGfQrJdDctc0Qa/3gRT?=
 =?us-ascii?Q?Szx3TOhdn3p4DZZyfAhtoYfML4Jf5JuQBO8Xst1YZQta52WIttABKaijwGcP?=
 =?us-ascii?Q?wBwQRJauQ5M0r4WeYxomx+68MgHk11ou1w0/lsTosuAOQwuSLh6ArCXgD5PF?=
 =?us-ascii?Q?2thaZ0SWEKu78RtAvT2L9gjuvWceXnD9+c1xeBh3JfsW9VCEka/lCYfNHWsr?=
 =?us-ascii?Q?iLSso5Ia4x9TabOAtubzNXTVWnwcaj0G+2OgKW4318Q9Xj2ekK88t8+5M2/R?=
 =?us-ascii?Q?vghKszULOA21bs+BxZNoTtxh6i6g0xFhKWemIr/Y/F0lwMMjOKcQKpaWrRze?=
 =?us-ascii?Q?B2+qPCKEHDVrUMozvT9+KSGf1wk9aPcy8bfC34TNa9GZnZJF3WVNZILpbwwp?=
 =?us-ascii?Q?UVgLf39eDHNuQ2z1N+coGakuTLspDCkPqKwkxJmfFQxDA/JZGG7uVtFlyk5c?=
 =?us-ascii?Q?9wGRiUck8NOu+q3If/UNgHQEaGwWVAAuFkIssWKbs3eGmuH9TyQ2NnjId7hB?=
 =?us-ascii?Q?CWYEOpVZ2LJL/BxktHSlTvqxJYE+cOJQvICv6kHhCAoNAO3E7lDCDFjxUvEd?=
 =?us-ascii?Q?tU/A8O3Jgjz3rhClTHa9gLVzaci7UOCvTQU3peUW72VkyOsWJ0kkjZSWKPIu?=
 =?us-ascii?Q?wTNWJE6RQPjtxl6TLThzKzDpxvWsguMWnCjNV/S5tg53r/YxDVjVcA8icZ4k?=
 =?us-ascii?Q?/ClGLbNCTAa5YbqHeBEVU6Rq4vSgsVgppJEgj99sD6nrba1DODi1LXMb6dXT?=
 =?us-ascii?Q?X0uPMdpTn6vW7e77qNaXClzrNR8wvJICZmcmVKyHNxHctDexIl3a/CBJcYTj?=
 =?us-ascii?Q?KKqjz+c0dzlkN9uT5g7wKIo9NN0G9FEYoxrxR0ScJdWFYeFz98dYSYpTYPum?=
 =?us-ascii?Q?ssvIlwwHUcDTnp4w0CH/N+mqBzj556dvr7F6DtH4kaci05ksJ+xGlH+mcF2n?=
 =?us-ascii?Q?DQxCVAUM95MG7Lr8uks45SP+XaV3DYp8Gt6LDJ4IgXKjgovGhNlS3bqkiugS?=
 =?us-ascii?Q?Te/9WTzkvZ0z/bDYJg+0S+aavPdeyEQZSxpWwMGE5N0XZRilJtxHgot7406c?=
 =?us-ascii?Q?zTwXTQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x2m+eC4cIikxMe+vXFT937cDM87XFgDLDJD1Py7HDzFVtw8WChpaRmiXKBnn7RKFZZkFXeA2ThZFSAGogEumyfgb2WyyLa4YFUG4js2PoCa/nvcAp1nBCZjAv0Qe9Wh3cJj0e5ALrZdFgSFXAhCVFqFu0wF7v4RW1RmI4WgsYJBjc+4+SL/CSupHSDRh9R+MGBkBAHyHQ2WyXWUS1ofmrXD6qn2QJIcTAl7L1Nti3dLf8OS/6oVMkdcCDipgbQxrSPfjziebSoaxwwGBiYtY5L7aiRSn5exRDGo4x4uWtkkCJrbV3aoqBRkUPwEXB8Fs7jKzmFSSoZ96DgvIWkrJSTN7NU01JxzqKEovHIyzp+tCa3quuTkgoAgHYIDA43Ex3Yzh1BQgwEnOBHMwyNbwcYlkS7j0wxTLVIvNnX9JGUowZF+jI/iJ7k4nQXxsjwIn
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:18:49.1440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc7c2b0-7808-4499-d7d8-08de6b34b768
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR10MB997778
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Feb 2026 19:18:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17105

meta-arago / na / 20260213190329.2150661-1-lcpdbld

PRC Results: FAIL

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master-=
ltsprep.202602130934
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 13 Feb 2026 13:03:29 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6f5fd3055d5b26b924da44db338180d44=
cff5223

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: netperf: Remove fix for GCC-10
- Commit SHA: 41fe03693d81e415a32a9407d28f4c6e4455e54c

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'systemd' (but <build-dir>/sources/meta-virtualiza=
tion/recipes-core/packagegroups/packagegroup-yocto-builder.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




