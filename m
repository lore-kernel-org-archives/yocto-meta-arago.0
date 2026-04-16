Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5F0F8D761
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 16:26:10 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18853.1776356761279409191
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 09:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=G0VqCbXO;
 spf=pass (domain: list.ti.com, ip: 52.101.48.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpQtF+n/KHlS7xwShCD/Eaucbb2mcqqVXzqRY9ojpBHWzHdOLc+Zs9ysah4VWjxTZHRE4L6PrAJApraOsi1VkRoJsq/vSakUZYIK4NwYYVFQT8bnjzTAQVsEkvZf00e71Ux5l1hTEBWCtXKsX1l6qu4ZulgtUTJUjAJ5x9YzrDzNPbAnDYp2E0rmdMZpMug+TAREdoVGBwmSMJdIha7XbG3wc5lF8xn33vXowuxXdczdKGC0wckibbtwyGC528mLUcp9zd9vKUa85UB3kqOVQfos62ma7nmnjIk1pyBMKamIVf25nuydortIDIBdXtS4TIfIj6VlcfglmiFXJB6CXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxSWrtk4GzxIqRch7IkvkHHL+3o1CaCLfhtyn5C6tyI=;
 b=UmrBfupJL/woqIc7xuYgEtcnb3z1UyGcvqrQw2+qiCm4htdI6jERpSoKuPtHbCIfW/DA/ae5E15aKgGQHa5Ph8oXGxR3VKlk/8ZE1TVqDmbS6+VSYj+mZKajjxPfyR8D+tnCQfy6S5pI+4W3QOMDaiqEgsiOgqEsE8vyPzU4CfRwPDqd32PMWq94L5h/Qjb0q3rXFBriJCagObOa59GRmRQVQ7nnPLejJwdtFWDrovNbHmwbNEooFs9jSef51Ao5w3LfZ8lmKigUDNv3y7r7FX6T1KqtrLQ6CvcG1U4ePo+A1DM+Hp7MtXACaf9cWz4DiymYxFyYt+Q5LWmZeAnh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxSWrtk4GzxIqRch7IkvkHHL+3o1CaCLfhtyn5C6tyI=;
 b=G0VqCbXOCTGVx4Wk9b61ylQN7PPu9mPswZIZQ+o7vCBwMofcKtvvQN+jR6+HvTjbrHxUriOY7Dtr0hcpbpvxbic4ARg4Mjj6EVH1LXvO9MAYC8SplOsfjjrD+rPMsSAosGAumA0E2WuDS84froTjf36Jd3EPhrQdy1AAvgS9F/TuyhiLHwCX3EhZi3rWws9G41mqTWLIlxB9rdYhxCYHr/8S4uBu/m0WKELnyAXmg5udqdXaT6TbJwW0OAluG5B7eOz/odCtPffaiwpTgKPVIbqbsyo73mh3LaCiRNOzsPJNCYvSZFhrOVYGtLMjtoem55A61SfIMA9E2xJzQwEM7w==
Received: from SJ0PR13CA0182.namprd13.prod.outlook.com (2603:10b6:a03:2c3::7)
 by BY5PR10MB4372.namprd10.prod.outlook.com (2603:10b6:a03:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 16:25:58 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::69) by SJ0PR13CA0182.outlook.office365.com
 (2603:10b6:a03:2c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 16:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 16:25:55 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 11:25:44 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 11:25:44 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 11:25:44 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GGPik72410972;
	Thu, 16 Apr 2026 11:25:44 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 677AF9ACF4; Thu, 16 Apr 2026 11:25:44 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] coremark: Replace recipe with upstream version
Date: Thu, 16 Apr 2026 11:25:44 -0500
Message-ID: <20260416162544.182385-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260416155923.2513376-1-reatmon@ti.com>
References: <20260416155923.2513376-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|BY5PR10MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7850bc15-e069-4c3c-debe-08de9bd4d5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	A/tvHUgb+DQnNeRzB3KwExovngCZPsFfOmhgZro3SxNYTtMpjO2ZW6XcsrlSBEBEWp0sjy5ZnryoC5y1pVWIBKKuhrJyF4TpgVXkX7+Ru5w9hZiRRjSt2Zy9RUQm6Rnj9WkitunjysDkpcXVp3D7AiWDNTa+8SUq2LG4sfGUAUe+E5Yh9xEaBkSnksPuUbyRyWKM2pNzOaXNLNJnlaS5AJkqaQteUOw3wT9ZOFEkdB84YC9h9ubKoksgj6nJmOmehUHEIgCFphP0GhV9JUXaL37dAK2uh1b+5VI0HHZ4Ub1nQCSwL8vzOazSSHS+uDdT8gz8v9Djb/pbN6xvaaQk/Soz58FQxbugxqBHGwYflhS8CPVMDY4aZXkSa/5Gb4qhbbWuBS+SVNVXtvowlpWK3vmEbJ7I7gzn2yUF2bs0B9GPrws6xl0HO9DE5hIACscRCsatPmqefVSdTV1gFI9DcBSsM8OM14G3LQp5FSQMQ931CAYxwgKwfI0FLhKZPpHOCTe4hLBpiOYgOrZ4uPFWbaCjYN5xZwAY8VACxjL1tPIRoNFUEc3D+nYYpCDKDTVnnlEZoJClEMalSmIbvxPCzNduU+3sv1cVTB8Nr9fFIAVKhBuBTtWR84VQKVmhkKT176ICO9uTGq4TIDw/VItScaceWvWdz7Uo8M8Pf052JYy09/QhIaiTy+/d6o3klkxTwTYQnSAZZldlJzzN3LCrqbm/4+jz4SQemGEyYisB6AShX15cmmpup5uTJBm1fu4UyGRWObJTaegPbjeGSrRnYA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+NIts3WSon+yp8gOpWdzJs+EHXvdRZa3ymB+3gvXMFSowz1p4hO7f3wru3+WeJsR2Nlge5pVFJyqQpjeTBCTpzcKTxmaVVyAjY5yB2Wj0xqAvbSgAY3tvJNbRwAxMMVkEY9596tJXxMTwhsiLoVStwEmBnkNbwQtBkTHuWBtaK5EzU+Pi5q8T26OEguIx7x4NfUzzWWPFOsEbU6k+MrVsIGXN6g6FDVD13HaWfNUwvjY18FUvsdfK82Kg6x8VhzPEQRaX0EFGnuu0/gU1KTQwJrriH6/PXLcYYEYRPWSKvlLDUAUdw2pYxg152ivRvMas3xm+yPO37GL4e5Ro05Z+f8lkQe5a2lwtWMTcNqia3+PKEVVHN5jrmacE4ZXu2TO/PamircR1Al/JKupbgUZSwqEHJZHjHaZoQxsqJvX2UgmV2Ev3DKCK7gdcYUZBXbJ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 16:25:55.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7850bc15-e069-4c3c-debe-08de9bd4d5e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4372
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Apr 2026 16:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17471

meta-arago / na / 20260416155923.2513376-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] coremark: Replace recipe with u=
pstream version
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 16 Apr 2026 10:59:21 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e5b6103a5cd7482a8440b99e04fd7008b=
32f57e2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202604160400
- Commit SHA: 7fbf03b97debbad20e981e81e50db01f3c6d0ec7

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

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




