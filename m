Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF90D26D87
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:25:41 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16734.1767983140967076367
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=H3ShJa+0;
 spf=pass (domain: list.ti.com, ip: 52.101.201.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3hLJaQ45lxe4jgoiAseBfOq225/anFZYnl2jPH7v/XAcs6wxSGEJev0if/I+z6JKRIWCKjQO7MkACRc8rP6zU1eKsm3Gu2AQdDat3MxNDW/GqU7eM3QpRQtTIDaIypsXcvpnTlRcjiImcZnNUcbonagD8FisCVfd02vUC0F9V0sqSY/tI3yC58IUGAs3rp/69h/8reKJPuHTjyGajobo/8D7aFxHMv2BnIVa0SJvEwNJv4F7DNzbobnXCqwAu2PEM7vDs3erW0jlgvMjxJhXkYdmp5VQCFOfFO5JyhaOpQ0tC1n6NpsKaEQLehrdYVQfAs9pNWBC52VFvlmcBQCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8cvzIcgxlQEh9o7djD3CMbKTj4C61euqhHn0PlyfIA=;
 b=RaPtzLHUhZx77/Owo+672d4kv7oLOi89oKcVUZnLCDjWqElwYRfQtzSzHz/bM1a8VPOpRMatEPwVfhrKKo8tLaRxy2YZwwWFpzZhRph7SOim3qZUfentADR8UR14foRx7tRWNBZESz45fhU214CH1YrjM7dIMgeazZ3XNfPA0dn7OfjkBjcVEV1D5yXxHtgMck9IX1axeQ0iGvQRnNH6XOZ2VMddBoTLZMwvn+cSpKGAFBHyatsA+M8vdrpT9S0Tx0udeUxD4x0jzDd8m+hQf1M0t4QTJdgIrpOVA9HC6aiFXGhk6vs6s83lAzY5uPiSa2qBHF11PESx+k18VmbV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8cvzIcgxlQEh9o7djD3CMbKTj4C61euqhHn0PlyfIA=;
 b=H3ShJa+0B1n8Dlp0hE5R74CkWxaKTVgzSaFCwHTIOb5w7NzUYpt/qrWPMd/GhIAXy1r6XJklYC094TsXjv5SBRuQwLeCvPxLxzsHR6S39SbIjCHGJtI+lrc5vrke8S3mXI2XjuL/7SQqskzClBAJR8UzmprO4VbLuyrzCx5o7Rw2Rr/Xg8d5mSDypoFuftj8RLeNMJ0UKIJ7I4JyXki2hZ52jVauyKDNJIRcGMFCy01vmPKh2bGwb4MyZdtf/OntmgnvX0XBr7TUh65n/0DymfWjJ3JeCfiBJsXm9+wUhyZlctWiha3gEbol92XQhvo5DATantefjGrwbtUN5dnS6w==
Received: from PH3PEPF000040AC.namprd05.prod.outlook.com (2603:10b6:518:1::5b)
 by LV8PR10MB7918.namprd10.prod.outlook.com (2603:10b6:408:1f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 18:25:35 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF000040AC.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via Frontend Transport; Fri, 9
 Jan 2026 18:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:25:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:25:32 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:25:32 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:25:32 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IPWgU2287371;
	Fri, 9 Jan 2026 12:25:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 734D99ACF4; Fri,  9 Jan 2026 12:25:32 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] conf: Add support for bsp-ti-6_18 to ti-core-initramfs
Date: Fri, 9 Jan 2026 12:25:32 -0600
Message-ID: <20260109182532.3933272-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109181934.2844640-1-reatmon@ti.com>
References: <20260109181934.2844640-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV8PR10MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: db134b6f-97ea-4d83-6a4f-08de4fac7a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wCmz43YiVaD5ErJT4gfirFVC2GNgZKO6MRzKKXm5qw4HzbMUmXnufwo91JVu?=
 =?us-ascii?Q?U2T+/6rVa3LB5tLszcMlriKFHPjCxF0TQOlMv5boI9FyRRD1qRPkHemw4+vP?=
 =?us-ascii?Q?QJy3JAecLsOsSVwP1BDUdeb4S+Bmq+7rYzVX1ctCvAc26vF3mcoSwsKAHC7Z?=
 =?us-ascii?Q?24oNLUXRQjWP6K1FeuGL5QqvOxkVO/yMq5GVJx8WUpDBm5LLviL8KuwYxroG?=
 =?us-ascii?Q?h89L6iVpsSgZlCobGjygcZ/qWnPowvBb2QRWMs/KsfroQo4ndmJNJ3PC92Bd?=
 =?us-ascii?Q?79W48SIVKGbHuToR/p519IkHgEoNDEIXShekrNyHbciLcpU/UvVDi95NxfvC?=
 =?us-ascii?Q?jIxX4me4XTzzDRrdI/ElKP+AFV+6fIqt26n2zQ0mQ1zzSDOO3LBNNH8tllGJ?=
 =?us-ascii?Q?33z3dLs24VdBmhcbDInB/a5EZjPZcAFyE4adDH1WKMK43KLER2N7Qe3R78dX?=
 =?us-ascii?Q?VEMVPOVNzY78F04EyKUl4HVHMx6sdPh4Q3O1joTpJSiMkLtbTsyXPYCv64Wc?=
 =?us-ascii?Q?HqXZNygf9jmnVat/EAhAH5+N0CaiSWSqbcIwjvh/xFxjL2vh0c7h/QyyXle5?=
 =?us-ascii?Q?6jhzfXFJIE7g6fFAck7mrTiAcLAD64NvBswRcMnkv1hUFj0NpXrCxE2DeH/c?=
 =?us-ascii?Q?YONIESsodapngau+o25WVi0E7xMGewk9eKdB8BDOsA2xuiDGCcIXS+08hRTe?=
 =?us-ascii?Q?Wp8FI16ngzJVx4NbTEigQy7s+YY+e0H0o/vM5Kk/nfyTUt1F2c6GcSMaKY0q?=
 =?us-ascii?Q?/RZTx+E+jNkTqihqq3VurtHelI4USa4rMpljwG+e7LfxgzhJcgAyYPVQgHr0?=
 =?us-ascii?Q?Jtc8ilVLzh810gONTUCW2IOENk6ULelbZC9QlDx1A2juVuI17/Uc3A6Xg7tz?=
 =?us-ascii?Q?z/13DOuSEI5iYyyHdzbVj2eaiOWDphNnX00C4hmMF5oW3VOwNrfoBQiyPE16?=
 =?us-ascii?Q?Aq+wMwLfld3/dJpezTWxbyKUO/dJOyGb66iAJjW/IycnFGiXi6OiAUF1XCLR?=
 =?us-ascii?Q?WB52/yIUxl345Nud2nXe8hXg10PiteDfdXxUxpwNQo3kM4vMRRjr59uLtRxG?=
 =?us-ascii?Q?QE45nbKoI+QpFomNIpLrynBo82mybqOCxnjRBdXYRE0yY3KOvJqjZxovhZWI?=
 =?us-ascii?Q?hLqDyYpmsdTz3outiKo+A5LLK2PqNOIcsxNaptxsV4nEEGwfm8ayxmwtur5L?=
 =?us-ascii?Q?uIPQaXb/QB/D4L2M+1e6XHk/bynRnKv/0samR5IYBs0Zb09pLZYkeNW7UKHc?=
 =?us-ascii?Q?wyRCIIg99wIo0Q4IgTfYEfn0TH/ExZc06TEaJrO+H98i8/CFruymHh/8OmKU?=
 =?us-ascii?Q?fnMScAuRH1cyQbmwLo1y2sgA++CrL47bWNxfo2DD15cLx9+nLLc3wCOvGDqU?=
 =?us-ascii?Q?naWgzCsH1vsh3n0FTcYIDzBEklgfxYAWrzUv5YUkIQcoMQctPgn9oiWC/p6h?=
 =?us-ascii?Q?7NqvqKfnCzqVJXEl+mRUYpCqXQ8hV4tdhlQP5JzUPvElQ1UKxcXNNTuoGLdt?=
 =?us-ascii?Q?5Np3HQzygcQM46RieilguxIlYZet0nRFatZDu5UrhCRkwp+dQyW5DP2h2m60?=
 =?us-ascii?Q?zJVOSF5p1P91FVIQbLc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:25:33.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db134b6f-97ea-4d83-6a4f-08de4fac7a8f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7918
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:25:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16945

meta-arago / na / 20260109181934.2844640-1-reatmon

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
WARN - [meta-arago][master][PATCH v2] conf: Add support for bsp-ti-6_18 to =
ti-core-initramfs
    WARN: Commit message does not include file/recipe name: conf: Add suppo=
rt for bsp-ti-6_18 to ti-core-initramfs. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 Add support for bsp-ti-6_18 to ti-core-initramfs.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2] conf: Add support for bsp-ti=
-6_18 to ti-core-initramfs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 9 Jan 2026 12:19:34 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e8eeaee7f38dfb422721d19a3ad3b739c=
7a8999e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH v2] conf: Add support for bsp-ti-6_18 to =
ti-core-initramfs
    error: meta-ti-bsp/conf/machine/include/am62axx.inc: does not exist in =
index
    error: meta-ti-bsp/conf/machine/include/j721e.inc: does not exist in in=
dex
    error: meta-ti-bsp/conf/machine/include/j784s4.inc: does not exist in i=
ndex
    error: meta-ti-bsp/conf/machine/include/ti-soc.inc: does not exist in i=
ndex
    Applying: conf: Add support for bsp-ti-6_18 to ti-core-initramfs
    Patch failed at 0001 conf: Add support for bsp-ti-6_18 to ti-core-initr=
amfs




