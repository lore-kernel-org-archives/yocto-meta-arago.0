Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ED1FF6E97
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:41:13 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1760.1773787269352683365
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Xa21JA2I;
 spf=pass (domain: list.ti.com, ip: 52.101.62.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeLt5+3z4Lfr2WHfXbK4i28gOW9BoUYXnlAX+YReIZEYpHKXPcibH+zok5Pqk+OQrGYqqbXsYfba7Fn7PgY3R9jzSIaxXY6CrEr658T+OxEqPfOOd984TCCwSEOzYxLeYQAOzrXfLyPM4GSF+SoQseZP1fYCd/XOzm3uO3r/rzyGTdLzcXFlx16YTDLn9pgHDFm+Iy71mig3p/g7Jh9EV2Wcy5Yrd/ddKsoJMqtrz3cVUMq0B4S0622OS2nSpW3w/BRsmYSh4mXut4iVoTXcklq2corYPH7IDemU7YeRHQUWS6bjm+603LmuAvoNyeBsWr+VHGEmpNNksyis8KvOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6lElonSiZo/TIIZJfDvuitLT4D1ILEIo385PUP3Q0s=;
 b=rJtoyRaTdVMjuIoUz9Y7TRy6ab1Ym3lB3dXaaAp4AHPQ7Vm9lVGCkBIuiWlGo8TtFQn4xEsfnC07YAsCVotkNmA51fBWfjrYAucREuXccYS62nVJpdURpT5T/ZcLI9V5vsUW00RDbfPmnMWvPKV66L0lQr3CHqb6k/chf5jrkt0GJxV3G9ERE2EgbTw+0VWlBE+rjRBWPwwF5xGbj3xeavK1G/9/LYwRrWMtpLPMhoLuRGwVHwLHHJC5IqjIA34/I2V47S9hJDfCD0BFKiIjpkbWBlvZTa1SloCT3cMI1N8OrBji/4/u6432f68gSYJTFK3Nyd49MgSVD8r6NcCuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6lElonSiZo/TIIZJfDvuitLT4D1ILEIo385PUP3Q0s=;
 b=Xa21JA2IpBTMh9B0weaHUbyUIO+ehWhPd6EM+j1on+hnaCAt/q4HaSeBorfYQMuEcVrqip2Prrqyt7Qx9XoPpXtyqT5chPEOCglproPxSwYPzJSdQEnnHE1UKjYFBASPKkfHUyfD8v3tHCDmnOiqphKg1mBpy4fPCbG2MDQUSOWifCumWhDDWY7iT5XYXgF7A4uoe9CBKzjFw6l7hy5xnjrG9wO3ILnHUsnNmHyxVNWNpUqFXXuSaL4ELyX7RhYpI+M1SZ7ZepqclJoMxkYCygSdC8WJw0XK5D/QFFUF6eNqbfVDIGtP97GtO7clqhI/fCZwhtv6VmSIp0hnl8rrkw==
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by SJ2PR10MB7828.namprd10.prod.outlook.com (2603:10b6:a03:56c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 22:41:07 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::82) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 22:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:41:05 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:41:04 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:41:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:41:04 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMf4Vf3955015;
	Tue, 17 Mar 2026 17:41:04 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 917A39ACF4; Tue, 17 Mar 2026 17:41:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] layer.conf: Update the layers to support wrynose
Date: Tue, 17 Mar 2026 17:41:04 -0500
Message-ID: <20260317224104.3892776-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317223557.1973923-1-reatmon@ti.com>
References: <20260317223557.1973923-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SJ2PR10MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: a19d3567-f7cd-464b-b0e7-08de84764659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	mfGJj+mlr5qmYJ/FoR24x8yE/i5OaTVdODGl1/0OUL5z/HQ01AG3M7kDwdvnq1fEsF/zXPfwd2ZtPMLuHMoG6XXYZwxB7bsOGHV43vI6HFkv8COcfrH+0g9pCgLR/ea2UUMWQ+ozzMPne44IZasGaOzd6VCkhj1zVp7SYFEjZyReD7YSa85OL5sndwSSo5nMBnuu7Vvh0njLC2Q5fTmB1YdR6b2mU63IUIwFjU4usuJiL+ois6ETnmper8odgsymIZVMi34c9WgSn8ldvY87tuGQ5b92CcPr69GmNOeaRuWm/01oAKcaH4Ojbh9AGiLiIUqkscODubeF+pW4R4dyghxpuUIowUtOh78JZtJjpia2P24IA5hLqjMCwfVwKPu3lZ1yYKvjO+vnlsY13xCPDSJrohrZUb64A79xCAsOtDEPjjIFnEqgEihSdaAYfo5uhGbAbhQUtoEMhCmR1mM3r/hYGhX93fgVwp2Y6JQEzuP+3LXBNBroH7Tn0ggCgrnulA4SzA+C1NhIwQQgHSh76sg4MUbXdcrK8DXex8Pq1RX6eOx7+JeK7ygskK6PG5/OoEfBi22QxqgypTE+byPBfaOvD19mVZMwr10N8IEZyJlxKkWTZj++W2Zr7+gjOAGia338UIkGVKUJq/KD17vHS+AqK3wdvvzwblNQmAGNuTgBkgUJX5H023vTSn9lLTkn4JG47V/NnE0H413QTBYu9PngU35qK8hw+cf9H9x6sxWk0UMceq8c/jHRSEjW1oMtINTZF46CV8VsbdwRy07iyg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yoxGfVBav+Xwf8IE1MCiwqtVAEqgJSxvqiQhuhONJR+TwU8H6VUX2r1qM7bGKGVY+HF1evzrXVHxA8dO1DyxCkZoI85b74ZkS/FbO2OFwlGApcRsbpCgsJCVz0uFo+dyP/vfsx5XRKfEkl1FUPBHsxQjgYhpYd/RJ57Ars1RxnmFzaGz1hXlrVVLwRcW4bn1ia4sHB/aNW5SU7uciIGycfFD5cLVycJoC5/lK53XhCn5tOuy6Y317/MOxH5y2jfTOULLero5xLlZdsRwREo1z4RpiYc9kPTwtm+V6uWgJkTDBMen60Dd8/DfQu+xvCjqs2r5vXk/cVzGSlox/q5q0gN1dCCx9pakNyQ7/SRSt4XvX/iK4m2xvfpYCr2qMjn9Mc38f99++wlx6ubsRp54G7g6DC3cc6CUrcWJbDt5jwnMb++GZRQxV2u+smHgh0Bb
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:41:05.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19d3567-f7cd-464b-b0e7-08de84764659
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7828
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:41:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17392

meta-arago / na / 20260317223557.1973923-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] layer.conf: Update the layers t=
o support wrynose
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Mar 2026 17:35:57 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4b6c354d8703a148d2f2ecdb63648422c=
22a1091

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: layer.conf: Update the layers to support wrynose
- Commit SHA: 6c1b6583a429ecb532305cfae5c73bad9e913807

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
ERROR: Layer meta-arm is not compatible with the core layer which only supp=
orts these series: wrynose (layer is compatible with whinlatter)




