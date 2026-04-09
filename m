Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EACF364A6
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 17:05:18 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.137745.1775754306793715896
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 10:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fFSbloQg;
 spf=pass (domain: list.ti.com, ip: 52.101.46.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwTYGIyA4O7l4J0y5FP+qtHtbu8bFX9EyeKTyHd58ZQgafkM24R/jTAVROFeDT5fhkMFJpjPt1f1r8yiBCXIx9fcLtE5AOmyjIUPMrbxa2H7iSUG1vsJem2K+MB8oWk2w7aKPPILwRYje7B4RRG4wdeD/C5zNd0gcn//hQ6th0lDWTTMgQclapqOggtxEYsktR1C8Bvx9F6EuwACp3XG1YLFzn8UpNPZWwY2Lw0hIH4fbEggtbtGLXdYtTK2d08LF/pyslwLqgqQ4WqejWvwK+OYOKkTw0HWQVO0FNp7ClifhrHW45bW87pnPLznHyCNry6NLjZj3khTDo2ecmv7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkGq5FH1913hWfxgq4iSN9TzexqvPapl+3pgJQKxRI4=;
 b=J4d25Mz9lz7iP6YbLtWCmjKXj0e+X9ZDnEquMFCHOI8bAHt2muFGA6QbZotbJ/u9rcma0iiM+BEyZWYd8cPCmPxSlOTv25mLEvEKx2dWdL5JqDTDvQSD6vLv7h6Jwp5xUkvWe3PSO1XW9a3PgNKs+RpJ/V90lTVAMg2ULzjHwbWPeyVz48kZCLngkwGfQW0qnTLhXLJd3kV5aH5UGKkp7QhIXF7/vQIwCOx9E1HPy8hfyMcv76YqUHAaW8A4b9wIQkriWg0JXJGr3TXJj7QW6PGSxpBuC9XF94+GLid+0j9UbOcZoJ/tfIomB/OYUvDH8lY/G+yrwSDisZtyPsyGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkGq5FH1913hWfxgq4iSN9TzexqvPapl+3pgJQKxRI4=;
 b=fFSbloQgYH93WOnul++yeLbo+RCEhnTqd/WvAg3Pb1irE6M16Yw+/4e5mf2DefOoMDKbDc1xhHW0ZlOVo+Zx7txxdpjFLSvCAGVj7rWJWAMI2XRtocq2gaVmUHw2U3A4QFl5/cUuMW7Z/mXN9qRimP4lwFl6bx+jpC0z/Yum/xkgG5aFE6ULgifkZDHTYHwKBzggfRC0h1jokB71cBrDMhuZjBafcrQNmpehQHWl08B5qJLtVVw9ppWRjpjsdPU6HVhfEdV6FPuyf2iCX316zWT7MoPim88ypN1f7DnyPBIqu539fVB6Dr1FwOiPu5yBpWCvHkTwxNVxjBg7T3tq0Q==
Received: from DS7PR03CA0063.namprd03.prod.outlook.com (2603:10b6:5:3bb::8) by
 CY8PR10MB6659.namprd10.prod.outlook.com (2603:10b6:930:53::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Thu, 9 Apr 2026 17:05:00 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::34) by DS7PR03CA0063.outlook.office365.com
 (2603:10b6:5:3bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 17:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 17:04:59 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 12:04:59 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 12:04:58 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 12:04:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639H4wCE2353946;
	Thu, 9 Apr 2026 12:04:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9DAED9ACF4; Thu,  9 Apr 2026 12:04:58 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: Backport kirk addition for ltp
Date: Thu, 9 Apr 2026 12:04:58 -0500
Message-ID: <20260409170458.3460852-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260409143839.1397939-1-reatmon@ti.com>
References: <20260409143839.1397939-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CY8PR10MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: bf21e772-879d-4479-848b-08de965a2213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MhBF9YBKNRIvl1+2/n7D9bHiH23QFnj6rHqQ6dIMckyRpwMBWjYREoGdukq0BXF9HL/F6zSGKlVWt1/Zy8FoR7xY+DIbAlyTZKFNvDvcCitMfT4GS6BN7H1F7xM6nhEx2+BzlOufrC5JoWYoir7nw4SDUuyXfNfVODlKzxd2ixnwJkYWi8fOYCABpOYThYi3sHsW0xnMkP5acnua+XCnLJTBNpYx5Evxqx3lf1hs72+D7ip4vWsVy73+vGXE8DXLERMUEiR0F4dHsIlONS/3t5wDB3p6X2s2ssjPTYXf3G+6Z1oP2809chlB7S8IRJi49UC3Zee29BlwkS/lgFQb1igrcuEClO9vjQ20CDrTHPE/yyisxjvxzNzfl90UyLILmbzsFQNsp5xghtvhCuU8Ev6ZreECIcwGJ+pmUGQ7lPKgMed19XackXMaxqDX3oixLsGT0XQprUtknC+URRfIviLE4RfsnRFFarCHsXsDiOL01SK8UMc0CVvyfXHHfKlXc23gulgjV/dz1HeZgO5C1wAdwa0dnD2v5cOzOpNxweScMBjOkOrgahSJw+h+HX2VqKBgvdehht0z1wqnqB+PXUvp0zL1yrNOCdflrRa4EW+I24SLWflUiNnuziOVaDaLQaG2CXJDrKUAN5jpIG/Cu7bl6Yv0wviDPaPeMBoZF1OEucSytdzMDkYOAIXEkQRsXMi8MEz3VJvtwNP04asSq75ngRpQQWPUzRqChJY7FhR30GQFTkIRgXyJQsqU8xVEKiPtryE4Tjjwok+1rgrx1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+rjCShRxDE0QE9kt3LOFcGGQ+rNILfqgBUKgrk/tdAM8XrxPauKqdsNEcmUo4klRTSPE1wxdjrHWpRDXB8S0N7vbv/JdsBA85HxcGt2BYI7QD/W4i70/wiVHnerLpOBiqgxKWGvOmTqhAnEo9C2Gdco3sYlbWtM99qEDGAmVrR3UYdVKVFWY3kT7Ee49Bzntd5ZKngFrltw541m0wsVzCIYbAysxCCAwRCLgUAZxA4fSUj4t86iDZqkcqZMC6uTFizc8l6vEQ+amklUbH/tGw2uBQ97HlyYeaKbEZbPZ3z2itO824vOa3K+TFoecODrdAphIJJnfStJ/cDXVk3Kiamz/mdvI3saoZqBmcTpOtatkYF1HJR8jwN3Y+PR1m/yKfJVZNSMhyGsnqIdLn0j1rufLazqaOLWEfVVhu/s9uDWn8zQy3ztzw7mH72yVbxm6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 17:04:59.5180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf21e772-879d-4479-848b-08de965a2213
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6659
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Apr 2026 17:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17457

meta-arago / na / 20260409143839.1397939-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: Backport kirk addition=
 for ltp
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 9 Apr 2026 09:38:39 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 95bea2291ef8936b1125b5369beed9505=
217a6a7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer: Upgrade from 1.26.* to 1.28
- Commit SHA: c923bf7b5b67b7261583f330dbe9ba22a2076b6f

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




