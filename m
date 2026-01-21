Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A47C4452E
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 13:17:41 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11456.1769001457416723980
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 05:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=KIGNuhcl;
 spf=pass (domain: list.ti.com, ip: 40.107.201.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHjXiWcZgC2YHZT0hF13jpzLUE7j80SoxLsJGDORxjd1SVUku8bp1yXC8ZLpTcK67ESiiXKjLW6FvCLkw85pTYzOthG0mhT5XDQW76SOR05EgT+xvo7s6VgYaPJapRTzMJdUztGiS3DkKG8piy58ibR4MzL7zxgrELFP3Pdss7Jb17Xyoeu0H5fyOqr3fRq+ic0lbo/8ZJcOmCEKf4YUN8zQyb2qowWR573IyOvNbBuh6Cstg8K+XHUMoDKW3thM1jWONZGx8Hc/2KY9zg6TrFo/ZmYTH0m1c1WeqdJv/ZbsXdqVYXUzuO2jHAbp1iA/dBV2EjzAk0l4g0cjX4ioQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/6xYUNoy3GRkPNWsdDI14/Rr5/UpRiQa5QoeZxbkIY=;
 b=D+07xydgALU//Y9+ez2Jf1JCbQKR+Jz6Z9JOCsRclXGez/d/zfda52ZY76h6ax3r/m/TK0prGkQw380UcnutiLcb95rLQQOPdxxL7IaZ5yoNCVEKg4q+TsmiDHg/n7PUBgBSeGfPNS4WdglzwzT8oz86OfZrVREDqsfOIFx325WD5U5afVxLbhQ+bTGGITL+U4qjBoGvnmSFIpre9EOGSA5Rxh1bQjL7U5ExgHAn0Nt9LxagpE3ik9qFpimobvzgr8gcAsEmSVokr73L9AlmWGc927ikRWKymUvKe2dmXQCZy6A+fK0flFlNeLyLjWUpzCNbpgygl4LNlpnAnb55DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/6xYUNoy3GRkPNWsdDI14/Rr5/UpRiQa5QoeZxbkIY=;
 b=KIGNuhcl6/+4x9eFaaVfUBigjEAH798YeORPIsVXdAzwQbpckVxeyps+hsLo5iQLqtlX4MUp1RNnNLKzLpZEc5juamEaDARv+o0Srj/OnyKvZfzfNiYIeGDs9VLSOFYaPnzKb6uFlrsz82XzaHB2jLMh9bNvZe2C0XaH6rMXdXGNIg0WlFWDbCvOAv2YvfMIDFrri+rTg1crxAQLtSBK6Ii/ftzh1h7QyW26kdiu+ZUNIashAJmo2WeqsPKvtMqm/QCt276xs1F0kqv3aA3BcoB5SAU+uD18wSnUsj2nvcz88uxn/R94awh+rlePUKUwb+UdchCjrz52bXhLxzUS9Q==
Received: from CH2PR11CA0006.namprd11.prod.outlook.com (2603:10b6:610:54::16)
 by MW4PR10MB6679.namprd10.prod.outlook.com (2603:10b6:303:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:17:33 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::85) by CH2PR11CA0006.outlook.office365.com
 (2603:10b6:610:54::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:17:30 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:17:30 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:17:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:17:29 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDHTBM3057500;
	Wed, 21 Jan 2026 07:17:29 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AF5FE9ACF4; Wed, 21 Jan 2026 07:17:29 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] open62541: Update upstream-status of pthread patch
Date: Wed, 21 Jan 2026 07:17:29 -0600
Message-ID: <20260121131729.1742215-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260121124951.49144-1-a-christidis@ti.com>
References: <20260121124951.49144-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|MW4PR10MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 455b77df-8ff3-40a0-ee60-08de58ef6e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GBFWidZXJa7PXbrEOJqrWoGj1J9QBVgh1zxxBF7CS27n/zw2ltw8vbwA90lH?=
 =?us-ascii?Q?/Ja4s+5rCZeF1xyepjqKKHSFMFyJYbS4YrDxXyZWgHXlXjo6kOM0j4RIirtJ?=
 =?us-ascii?Q?sZlFCeaYsmuWCjeG9WzP6s8+Sh6fdQikGKm/L5MmpLUD/cKieAWs5Z85WpOH?=
 =?us-ascii?Q?2fVHczP6rjPMFScKSKDVCNsrnVm+vD36eMkgcA6NibrKPXVR5lg3KWndQblz?=
 =?us-ascii?Q?FjRLTWbJs5aAjEwa5g9TjEDhmQPTxU/sWADZSRZGTwOnjnQG57s8OF4wiItU?=
 =?us-ascii?Q?9J147l679PNyvCfemYQBkI/tkiRHxYbfK1R5viQb7DNLbX1tZiVnkOs/EvBs?=
 =?us-ascii?Q?1C1esGBdvdkOY0+0COpzcRkJ9+HWGcrb/C7nPdcTOaa1C0EyKBgE5LgXPXAD?=
 =?us-ascii?Q?IDKk0NH+HLFEJeAeLijxWXqIvtZx/4/6cU+PeTq+d+kcBfg00bGDAuTzZrmb?=
 =?us-ascii?Q?AVaNhuUYRBC2O+2r6bagSLJ6C+senftdsdBpK6vJfb2/jQll/TVZdzOkohl4?=
 =?us-ascii?Q?Po+czFxrgpsov4vjVZL+I7SpQs3AgA6zMJs9Aa8KtenCRQ3RSB9DBsdyIwnI?=
 =?us-ascii?Q?nQ5QYWvU5BPd/WEqvaBqnb/Rt5rXeTYKHMgXB8RatokyVGVVtxx+CSuadpFl?=
 =?us-ascii?Q?jsI1suxsdDzW2gT28nyLC1ELOe0nDTyzR5uceeMZJjW+MuFKqPTkTzLSzIxw?=
 =?us-ascii?Q?stGUGHk7hqsYA0vwjzL/kHUlPufamGAgB4ge/IaGwpt+Go1TboCarkckBEGk?=
 =?us-ascii?Q?tEYJXHommURGV7dPdi7JJTvz+JMWDQKY29A+hh4B++O6KyuTyv2c5fE8arVP?=
 =?us-ascii?Q?ieM/ifn69sZL1oTRC3SQrsAsQaMYksB4AVAnY06Wa7P8DwAeZVs95P3TGbs9?=
 =?us-ascii?Q?kyQrtp4qyFHS3n1MfBXzoJ7kxHte8K+mrGIIEpUTqApdy2g3zTEBRBf6O/eT?=
 =?us-ascii?Q?F3xCz5KQs96dUOcfgDGAUGUPz71gFGJcxlvXH9Vvn0Euzo87w9GprKBwZT4f?=
 =?us-ascii?Q?k7nDdGnv9M2T9wueD/jk5UZShaWicBi4ZBKeGUmW44AdIh16IWgzNP9HYw93?=
 =?us-ascii?Q?DVjS01MaInnyW/ty92P2EfnQ4bpfXW4dYg/qMFi7U2xFS/YVq0cG4q7C6k0C?=
 =?us-ascii?Q?EWDfU0uNMEWJ8qdTR65MhxpxC5z24OqkoQylggARsbpWGH/SPQ2JAHwIrYmd?=
 =?us-ascii?Q?wKltuLLNrnpT3350kjz1SmvP1D8CFllRwdKH8GRcdMqDvHMRdAC0Fo5JgbAy?=
 =?us-ascii?Q?1uy5OuBON8BWmI1qkd6z4L5IglELKzzRZ8BAJ1z9/teZCyHDGcxe9osqm2z6?=
 =?us-ascii?Q?KXsWlO6SEbQsoIxKNFh7r6SgKHpQUd8EeW+6Y/TOL047liEdWALSm0IKfcjA?=
 =?us-ascii?Q?QuIwV2oHNy6CwJp5+kkgmtR5qWoU/VS6Auu+NOr3XcBwvrd6XmrC7ohrOn2f?=
 =?us-ascii?Q?dZ48zmbA3swdvJGGLrQ5DDDXBphbw/JwX5fSxOOrll+6LnCXIKgrqGuUWMVt?=
 =?us-ascii?Q?qgp6Qtb/H/olHscUwH6HRxCecYMR8Uo1ONGm1YNHyqh528yIOqrD24uN39bx?=
 =?us-ascii?Q?AUgUSLIGmJjmTrO/39L4Rn7dw2C8iVrha4ywBAV+wUSbjpOiJqz8dTlT7mWR?=
 =?us-ascii?Q?Cl/N85XP4x8gR8kI+P3iRoiI8EDbPDPnF1fsih4ZTEh6VVLv4TYSfPkiuM9O?=
 =?us-ascii?Q?bIo6Aw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:17:30.6577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455b77df-8ff3-40a0-ee60-08de58ef6e81
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6679
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 13:17:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16995

meta-arago / na / 20260121124951.49144-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH] open62541: Update upstream-stat=
us of pthread patch
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 21 Jan 2026 06:49:51 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 65e282bdd55860b9aea2a1eb45474af3e=
502266e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: Upodate for v1.4
- Commit SHA: bf47628886392400787668c9b203334ce00e2e4d

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




