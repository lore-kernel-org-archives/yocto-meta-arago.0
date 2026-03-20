Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182E11099B4A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:32:53 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1290.1774045970571663139
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iNHbofaH;
 spf=pass (domain: list.ti.com, ip: 52.101.52.50, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E759xnKWMr03CiQYi5UigAwddCgPzVmloIPjMskPaYOqWJd+bbbzrRuVyqx9upaBE3GcDqLMBIo6jblYBESSvdvmj1boh4fLb7eitKacZLsylQ3J34F3gLLhxcAVM0xH1FBb69k1X9w/zXYMyc3e6U0gxFBIbMwXso9yy3h5Sr2RAGHhMUyqKdtw1Z20Lp8syce2dpKDvzJZ8GJHQAyZ3yJcHLYo42eb30rP0qAn05+FpyhZK10DJ7n9saZ0cGIPXiFJ7Dah5ozd3nLNmfTwxtdgrEsgGNsly+pkFmgVr1W/rLxYmGFMdgazoPtFZ+C938u6eNoOGN1q/J9heu77/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu0iy1aMxZbf9zHcvb1e/8bBZ7hVzvlgvV1wW/binrw=;
 b=soghGv4itX10Z+fs3yOjSXVx6MJs3p46or9YaU3fr0EweggJULzg+Ke2gJRhaW3wOMEJ1A7DcTwfj/AMkXsSOCSdWHyQXjdfArRIZ1miACleHHPvg7R9339juqPXxHp/wiO+/HnXUdZ5vPQ95kGNAupu+1BZlTJaMO84U1UBHrqfY1j/PcleGDgj/GxzFaNi44PPzHMOcgnZY4gVVC1hkJjOnU5C07GfMExi17JjlgDIBYphZS6RiD8sw7XEWgsC6Txn7fVWY2ppoce0odPG8TtSfSd0yfu4UYcyl0w6V0fqZSM03w/MurbvA+XmzsuQQEgbNk8wTycHEKwrs0P5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu0iy1aMxZbf9zHcvb1e/8bBZ7hVzvlgvV1wW/binrw=;
 b=iNHbofaHVrrtNRmjKJnfotFW3gHkOZvXkE+jpJHHEIqify4xlugVSshWHEWIuox+rUNN884h2zWBEirntV/j2QaitymPfCsCk3RKwlrb0+hmdjsuQV6VlidNM2+Pm+V7PtVsYzs5ipi0mIRcg/yGbU8EDfGVRkGcdUaXVA+h3rK5fDvGWFFDoCWGKh8mqxF+O3FwJE1qK8bvYV7OHcc/gVMvLswa44TyqkwqdoO8kmK3j/env6AQ84+/GpfDVEcfdPxkeKHt3LxyG3aSBfD06hI9PEaY85lLm0ynG2faNoW5J6GOzeKIYpLYc+9ZZxqPFjjUKkPhfVUBRGEDNZZEGw==
Received: from PH7P220CA0142.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::12)
 by CH3PR10MB6812.namprd10.prod.outlook.com (2603:10b6:610:14b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 22:32:44 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::a3) by PH7P220CA0142.outlook.office365.com
 (2603:10b6:510:327::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Fri,
 20 Mar 2026 22:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:32:41 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:32:41 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:32:40 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:32:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KMWeqa2041232;
	Fri, 20 Mar 2026 17:32:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DB8829ACF4; Fri, 20 Mar 2026 17:32:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/4] ti-test: Move libsdl2-tests inclusion behind guard
Date: Fri, 20 Mar 2026 17:32:40 -0500
Message-ID: <20260320223240.3661272-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260320221404.3991734-1-reatmon@ti.com>
References: <20260320221404.3991734-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CH3PR10MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5cad17-6c49-402e-2659-08de86d0994c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	9hib5qc/vMTwWuw/6UZeDRKPKmCD8UAdN4oy4db8USkIfYN32RzFw491VOQCzk0xNwsMsr43MYboA+Ry2DLQ4qVL2ly7gtaZRPseGksggL6XL0tJ5TgzfefBeUe7Qm2F64JLazfojDV4AbbL81XPoLjmFtcKGsP5h9Rx58Ly0sd2Zed08lFkfSwzFknfR/kwnuS5xpYhjWJ61dBAqTmnPkPwWd/b18umeqI22g2Ci5bVyjhX+T3eRlNZYijs7hvVH7geNRI4alxXSweB7ZcF5q5GaStqWqiz3XFKLiHmsnetcp+vwNyENvQGTsZksh/nqi04GKucX6dbBnnF8pUROVfdZWTZNSI4KjJiU6SMK3/Klkh3r0DvwD2+RgNmAyReyeB+EhLHsfX4rSEPbVYtAEqA1IrFga7W2VbgNtnCGpeo1NCcHE8C/UYJrJeoE8ck14uLfs9kb9Q4vL/ONM41nAHKb4n0uu4E+1qr+q7j+/4rRLBl4FTbstygN1Mqi9WRWj4l82hzMcITrnf9bWLcKob8VTDh/xdr8c0qnqsTVaNp6XUq7bL5nE52QGqxCuRFCTqhmaOPnoBnClFbROyvYpGqc/+ueiyiBkp7vNXFj7zphL333LzafH5JjMfC+svpCkm06CQt4dIOssYIb/wanrIbY5f1cCkeT0hS3sKhWdws+BvSXkYUE+SslGzi8U/AHukRKfo50+6Uy7Cu3/Iy9bVrR2TgpGg0XrYonHQtC5PdpH1U1UMsT4/4VQHw3xpthDXaZLfhi7GY8WqbRnokfA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DrUfYC6p1OFjlQubAstWY0yAJa+z0InHCv+OMpY40b0f9kw69zQlqT1zKW60meAxEyq2f8hzukDlYqHUPl2b/zwm1x4AobkJiItjtOxXyPp4dcjQ+LDBkdcgB6wo1JtSmJugOqO1VWuGArtycv+4ZQh+yVNkDStqmasGjz1wKkMZq0ZtNr5WPybi7FoJzGUOO2+egGaTR7mF8rQ+83LyvyxC6pFQ1uM03adXTXJKIWb9tViWc+vB6PwZitEH/a7NjPd6mcVAIlZLtRBTCozRm/J05DWX5p1XHV92DecSxQpmxNoVYxdtZj0JEaxKdAlGQ0lVkEPF1JsOiP9Pl/MNOfegqGo4Y9IMg6lzoVhmBkraNEncZVmZLU3zHN/r+as7n3LiVkkaH/fVU8QYOImD/k9I5pdFCc5QwWihDTH9G1D/7ojMMZqU9llEHyOd/+CG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:32:41.5554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5cad17-6c49-402e-2659-08de86d0994c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6812
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17413

meta-arago / na / 20260320221404.3991734-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH 1/4] ti-test: Move libsdl2-tests=
 inclusion behind guard
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 Mar 2026 17:14:01 -0500
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: ca4fd7dfb49c28b1b4acb7e9b04b95ff7=
2e00531

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-arago-graphics: Add mesa-demos
- Commit SHA: ab710072a9e00c5869fac1c6a42eaac579f078c0

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




