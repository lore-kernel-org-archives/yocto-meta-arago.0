Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6BBD374A6
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 21:12:42 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4006.1764969160685247189
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 13:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ns3AOVKX;
 spf=pass (domain: list.ti.com, ip: 40.107.208.34, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvh1yT7P02DSBlgPolodubYi8CLGb6u+QJpPOpk1+qQjb5w03/zBQR8vHFGHt7nYjPVGS+iysGhICvDqEAo5TG8GuN/tF7y4jkkkmfjl6nDojxpKa4XHzab1EE6FwI/CV7ecje3jQed0a+Kc7vFvPhYtKP5WyGcWp2y8AYukyB8lVhfd/F7GHvKdwKVXSHhE0H75GiAcIp0lwKZkMcixucNn91o4EppB11U0fRBxEbdZq9REY9QqGWaXZc83CnZAOSe71rApBW6vda2tYu1QnULg85zVeDhmolgDn8BRV+Y2w0Q4wyV8E7Gxflin+zhDHY+UgQ5eSoP99TwvUSpP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Czb44L44AtV0xq7i7tWbmaqAghbtVlL9GOD1RhD0qQ=;
 b=h2vVJ0Evd9vjfWPuSrZG8EMTnJHWtUDeCvBo6VrndwaEQzc+ssfqgGnSNk2Jk25aXCekuiuZYmhcnay5vTxQMhR3kospn3ekLNTIk4plgALAcq0vYTS7TpsJuPZMAlmNfy4Ud/sVAU5fOb0boi+Xcr2xWbwSsqNK2sp2fjDFQNXnvP8kVuD/VZjgY0nbu3fZ35zUsM2OMDSOP5VKR8u7pTyTuhTKKZl2bm4eYSvLuZjXVFrP07ejlIRXVVnG1confO27VKX2kMPymSxCGQF3Hxhfu29d9bxWB0/QhlBypHm+tzQMhdzcZmAMk+/ROZ0P3PLCvoVW/Pq1pga3kirWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Czb44L44AtV0xq7i7tWbmaqAghbtVlL9GOD1RhD0qQ=;
 b=Ns3AOVKXtW4JBpbDyIJwL5fS/1S9fPtBUP6nEN70ftdGBINOSbJAEV3VP2GRFUJdXPNCI0Zl4KrAHYvhNW7joEHLL3Np3lpmdovHt9YVGYCd3gw8yxHcamd3rj3p8VFctnmW/aduR9ySjDdLKmTGKOnbQq7qNEk/WE0CoW7n37jZXbTVMfJ7JlEU9J8aM975WJn8cN1+SRL5bi6qk0tM2kIlkh/Qh0l811io12qMaW5lo95UfLWpIwSqlIPsjFWHy+TaBlTpREnfcExap4C034XQqX4UFjF7CAxfe21ta1N/KJ7PfZe3lKZQM/GA/YqLGrHSmlN9IDzo1ErJrP5Gkg==
Received: from CH0P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::35)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 21:12:36 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::6b) by CH0P223CA0009.outlook.office365.com
 (2603:10b6:610:116::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 21:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 21:12:34 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 15:12:31 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 15:12:31 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 15:12:31 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5LCVU31170215;
	Fri, 5 Dec 2025 15:12:31 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id ED7779ACF4; Fri,  5 Dec 2025 15:12:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] dbus: remove license selection override
Date: Fri, 5 Dec 2025 15:12:30 -0600
Message-ID: <20251205211230.2011218-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251205205232.2471677-2-rs@ti.com>
References: <20251205205232.2471677-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 198fcf42-23db-4604-290e-08de344302fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sz8rIHYFd7jUnfdahBcP/o5TlNq3Hk32nV3emg8QchegAtK86LsfX4NYGTjr?=
 =?us-ascii?Q?lq11AJzK/R2Sqx+5HvvNBrZFNmvca3XJhne09O2/QzcrVddSkzMHAaql9CnB?=
 =?us-ascii?Q?O559FHJJ49nSIku3OFxPL5ydaYL9RVsp6c7QGgtgD85M9AO4XYQzg8xwxn8O?=
 =?us-ascii?Q?X2pubHCLhbNkMbxThFeuVwnlNuL5S0RivjuKUzMTjweW1GUmpUilokHGTrXY?=
 =?us-ascii?Q?NnptTArL/I5bBNh0DPnRCu2LkZpm/M+rAesR+zM727mezxG67xQze8jhigYh?=
 =?us-ascii?Q?ZV4ZN/JAdq0zL74+fXuRecxDR0Kt25FQfBl7eDtMpxLUSAG/28qocnWMMaQ3?=
 =?us-ascii?Q?J+BjhQMWV82d8VCYcXOoOBF9bjQ6KbFT6xjehPm7fXOH2Jt/qWljOYiYyHkV?=
 =?us-ascii?Q?OmKH3Sg9/ny9zABZsiVqzsbSU20Y9RShy/PiT0uyZm/ov74+XdVapcA0o12G?=
 =?us-ascii?Q?mC9/BLbZFVxRs9WjNqa5fD77teNjPSNY5pIZU4mTrmU9F7cH80/Yra9xcB2v?=
 =?us-ascii?Q?gx2xWqS/2pH13TVtvJttJ+mpIjh1BRyfo6QcrQ39Z+YmP9JrbyLuh4X8skQN?=
 =?us-ascii?Q?frbSgPmonPHVlYKnimlFn3yRKQiktPhU86UQ2NWnF1sKl32irn8p+htqcrZD?=
 =?us-ascii?Q?uU+wxjPWDC0qn/C0te0Cbr+LyeREJP6nurUGHK/wlEuApPnqAU+BUhlqVGPp?=
 =?us-ascii?Q?j2RszNAUia3Kv+TuOP81STyTBeCptjsm+DuzkQM6YLH84057s5Uw5j6SSHvZ?=
 =?us-ascii?Q?z1sge0cSYp5CZsLQPg5HWsmIdPMsLYP9OdZ0WUSqw6/3mFvcsaR7G1WJy8FD?=
 =?us-ascii?Q?GtwzOPdIXEHpD/IoAwQgYamZ+ChTo3jK34PU2JRR80+z+1ftnx0s3X+BCCze?=
 =?us-ascii?Q?46Lhe5W2R4A+C6bZe8LzylFNZwyEgBFlAGKI53Cuv9aizso5s5hJFqJexNMa?=
 =?us-ascii?Q?qpgrIqMSZwGc2F++EGnMzL14VONx+R8m8tMZng+/lDGE4yFLHFn8Abbr6rVF?=
 =?us-ascii?Q?/3mXKU2Uj0f3fS9sPRUsNKkQlsnhMWR7e4Zm7LOzp13+u1A6TCSWQe/HHxEB?=
 =?us-ascii?Q?qZzFHZBqNak6+qKeTY/V5AxiOAVNZE9iAUGKhLz5kSakksJ+H5oT7Kt0q76F?=
 =?us-ascii?Q?A6AzV5uZ+AhQOv7JJ163SjTIaWQE9eh6R/UtZe7wjBjY8oPIGxOsTdqpMjVA?=
 =?us-ascii?Q?XqddX7qEZXs3brGT1yTgHLlvo8O0B7o6ZzExpjXrRMKgFueWAqKz327pB0eB?=
 =?us-ascii?Q?WrOKdsgX1jFcX3XIrBoKmHsgLNNzgAUN7yK8XVJq61/s3gSt+5OxUIEESpkG?=
 =?us-ascii?Q?NephzLrzEcdP8k04zODNYU5napQhW7eoACq2OQpUxmSig2Od1BzcXwxAfEP7?=
 =?us-ascii?Q?omuvEgKo3zs3NATVdqEKdC9hYRcTyTubcyaEmAfR3mTEpznsHiPofzsX0iBG?=
 =?us-ascii?Q?TGgoqCJs/zWvsh6vh5fRB/TL2wv23Bi47jYsO37s+a+KKCM9UWndGWEYEmez?=
 =?us-ascii?Q?SLAAdnyARXAx4snUZZkeOk4ucLN7AJfOjX4J1SYa7/fL4FKvoFAzmnpJuV8W?=
 =?us-ascii?Q?hcczE2SbhWtcgyTYNtk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 21:12:34.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 198fcf42-23db-4604-290e-08de344302fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 21:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16866

meta-arago / na / 20251205205232.2471677-2-rs

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
- Patch Series: [meta-arago][master][PATCH] dbus: remove license selection =
override
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 5 Dec 2025 14:52:33 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ce7d02cab27793d2fa7e5e24bb0f30768=
660ab44

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 410e1081aaedc1c525825851a9df7748b49cb659

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




