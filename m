Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9590D778BD
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 22:01:00 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7242.1769205653341469235
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 14:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=BmduOv24;
 spf=pass (domain: list.ti.com, ip: 40.93.198.64, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggV9QkEYsdzDZOt6YMYBeqAXtPQT/FJT3/+n63luEMXkOal0KMrdTYzfjS4B90DU6gDABypL5H3n3t+IJFQkcT7Q9pv/K4vEsetRQrUZoAT8CEcbpLHC6MMJppem+fUlAwKKyBKOxwlsqlNX717ylNXXY5rBCp1qwrDLRiGQfSzKYWRSH9qDxqZTWfENhqNlmQkC/IwBIGbbJW3qZ7DLFMD4diMcB41c0Rr6alfPFjyRmo/ANDgig45p6xyfOSu4I5Ib2iTPnmbxVOfiKFzMDAHcGM/AldSaxBvSgAJiGzewZJxsz1TiVYr0jd5uJhgXFjLbk1BCipSU4vpvQNhERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGLm6LnIIjKA/vK0Ir30iHMSbavlxmoU+i58sr1jclQ=;
 b=C+cBsbqj0tTP4ZjT5ZcZJxWPRmpiN48vGGRqus+/kRMZiEQQ1hEeYaMzZn0Oq8wcRcxYePPo4jnAygBW1Dov2onAwwmAYiThLPSiaFoUYI43RwgnR610I3D6MxiwMLj/2y7mRpmJwekxhs4mEY1V/kQqWhUDGgXNVVt8rxfiuXVGNq0XZ7ElR29sl3qCWDIqQdq+vQUPrCeazcuThEJp6huwBoJtyOJ8a/5zjpitjkkuy7k3lTfFBRtSYS6jFnU4s3iz4uPcyzO1VoFEQfAg2wjjE6/qBBCeWs7Juv2XPGdJ1iffGrmDy70CKQ/4gBBRUBnoxpetEEzrm05veZarjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGLm6LnIIjKA/vK0Ir30iHMSbavlxmoU+i58sr1jclQ=;
 b=BmduOv24BP9x5NhY8/1BGA+R2OjoKl8UBAseSl6Z/yPBoXVgHGGMuMHiAm1GncLsolwd45yfYBCyNYEgjTfszYG0FpmyHAj76jYGCq4nJz+IP+U34M5/Lu+V1FN56NwvS4nRRieu6mgVTORtH8fbbTrCt6hOwhgR8BxvBkjwoOsSxoxzCu3cL5noxyudOZGQ1lyM93/nC2Ddf9+xGK8HaAf34dhGC9y3jlQMUZe7kL7vJOAz27jd9uIQFbH7zJzNC5iBbYcKCcdOrWG0cTElKWJ8SCMFwnd3FmX2/raeNEOVsur5TYRPj7K0wKC/ddWWogG0hFO/XFeJbuZJuwor1Q==
Received: from SA1PR05CA0022.namprd05.prod.outlook.com (2603:10b6:806:2d2::28)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:00:49 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::7e) by SA1PR05CA0022.outlook.office365.com
 (2603:10b6:806:2d2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.4 via Frontend Transport; Fri,
 23 Jan 2026 22:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 22:00:48 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 16:00:48 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 16:00:48 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 16:00:48 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NM0m6F070736;
	Fri, 23 Jan 2026 16:00:48 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 52BE19ACF4; Fri, 23 Jan 2026 16:00:48 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/3] pm-qa: Move recipe to meta-arago-test
Date: Fri, 23 Jan 2026 16:00:48 -0600
Message-ID: <20260123220048.2306132-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260123213731.827613-1-afd@ti.com>
References: <20260123213731.827613-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 819e319b-936a-44bf-087e-08de5acade17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E8QGIVldH1li/6zozTFbkuatyD3od5I4WpQBP6x9XKfaSvDA38P0FmkXmu/c?=
 =?us-ascii?Q?XRbd93CXT8VSQKJz/HoB+6q/cBrCNuQzDrvzCwv4+dEcOTI+bBSsc4bmjQHm?=
 =?us-ascii?Q?/PZUbr/EUgWlYLKchgcp+8th6gZ1YCWgfB6KI5u0PvjrHuUfdEW0Zc9FXra7?=
 =?us-ascii?Q?94cwvccu1TCHBydP3NuZogAuCrVqKBHQD4ghS8Ct9dUeh2ABxqidoMl6AuvY?=
 =?us-ascii?Q?A+geZtOQkAHIfsq2qt9r4SK+sZqEZQAmZWYEzC+pLChMEzG1i5mp2cwJhTrf?=
 =?us-ascii?Q?ImHLKHwyuELT8X1vYWD6qSRvGUbuUYdu1Q8y4ku8ZfZO/B8Fqj4+h+BpByGa?=
 =?us-ascii?Q?WxV7dZJSaoJeirhJZruSYmx8C1wsD8CC/jrnToeIkh7mHd8gsQqHAWE5ZG8q?=
 =?us-ascii?Q?s/t/uKtxqDP6mtIpAD4+AIYNjnJ2dnxt8SNQZSX728Ia88dQu+dQYjkhfRkg?=
 =?us-ascii?Q?CbYnjxWcdrNmC8g5EzVTT23wxx0mk2jhsPMO3rnKwUbcHic0WLMoEf3n/ROV?=
 =?us-ascii?Q?Uss5kTXFDYurtbeaC8LviopCuFOsMjjpdJR3lHoSUY7P0Z6wLeyaolixruSV?=
 =?us-ascii?Q?BSSQeuAQIPwAsThBSVsyDi8Jgb+ZB4kDTEyTVoA8W3Ppzx9GnADJPp5VsZSJ?=
 =?us-ascii?Q?c4SrcfkMArXIGyHUld7SC/SbVbP9vN1cthtZaPZ1GbCcuuJnP7lSlDVZGt8n?=
 =?us-ascii?Q?w4LQKSk2YpJq7+LQSF2Xljes9K//RXNXenvgouyT+HBzCSnq9RWvczxtH59/?=
 =?us-ascii?Q?wAWhpJLbbIwUzjDWCquVjZ/cGOa2eBIsH3MDWAj17HOdthfng0OtDu0Kgqr2?=
 =?us-ascii?Q?rxMyjeaf6VMxGGSZhefRyBOElwsIC+5YLtaUDhdtxC2ZAZsH0X2b0RSjef1P?=
 =?us-ascii?Q?WOANIt8Yt5rUFCCjx0wuiVtBprLUoPvmsZ2U2HCQh8/5vxz+DBOVJ5TFiAtA?=
 =?us-ascii?Q?e0pwOY+y103GEjBP1AeLzsVNZODoFnH860loQSfBjlNlE38HmJRqqxP6zwWh?=
 =?us-ascii?Q?8PkrBFvgySOrXYUS3PsPr7EAPqqoxc8SPXxcGFIvXiQIJfNozO2htxrtU06C?=
 =?us-ascii?Q?kKaEvJKkJ5HcN1ST4BhNTCl6AqIVZbSMgzoj73Q/NElHxcgPoVPwl1tJxB1e?=
 =?us-ascii?Q?0F8HON2tDbIpx0o6Xe/mcJ38i2ZXQHMNyonGgvdgvdU3shP4SbQ2ylHPitub?=
 =?us-ascii?Q?0Lvuace6DqftN+KH8TITQoP5TfuKvkrAVCGvjiZszBqcmbDOIWO0Wzi544Hg?=
 =?us-ascii?Q?Q2YF6BQIyZdHho1MAKEVw8G8YGKn5flKAA02lQL0ApdJUeWehwQcWNuV+ZAa?=
 =?us-ascii?Q?JB7LKq1CXDzBNTj8LLNhQraNN/rzYvDcUZfus9jOr/iyswdMPmZWxsk3v6h5?=
 =?us-ascii?Q?t1oPyjis9blrTCXbfazHUzUP+GLQVrgwxV+t2qxQGjruZIIVNwC5PjsU58xY?=
 =?us-ascii?Q?RnI+ZV0Jfoc5J74nzixDGjSXOdVXvk+rYhpYTuBXZHFm1cmslY9f6wUsDrEq?=
 =?us-ascii?Q?LSFK+cnZyBVc2sdF+G3Vd+ji7mjJWEZkt6Th7XB6sZqs3W8A2xFQShzE6L3d?=
 =?us-ascii?Q?6mT8BxTJeLS8DE4jWRHbOYzxl+6YSqk7KReikAezmSKEBIaeoWArnhzp4OtU?=
 =?us-ascii?Q?65wXz8Pl0/Ah1R20QzNQz73ZT6bDmebBnZ1W86T9m1W8CdF5ni/HL5OxWQ5v?=
 =?us-ascii?Q?vRkELg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:00:48.8442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 819e319b-936a-44bf-087e-08de5acade17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 22:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17038

meta-arago / na / 20260123213731.827613-1-afd

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
WARN - [meta-arago][master][PATCH 1/3] pm-qa: Move recipe to meta-arago-tes=
t
    WARN: Commit message does not include file/recipe name: pm-qa: Move rec=
ipe to meta-arago-test. (COMMIT-MESSAGE-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH 1/3] pm-qa: Move recipe to meta-=
arago-test
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Fri, 23 Jan 2026 15:37:29 -0600
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: be95edaa9fc28bd2c298d3350c91c4316=
39875a4

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: ti-world: Use core packagegroup to include valgrind
- Commit SHA: 75430bbcca44b9097763b2d0c1c6f22ebf9564a5

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




