Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D817DCE8D5B
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 16:55:45 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3024.1763139336687085677
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 08:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GaLsArkJ;
 spf=pass (domain: list.ti.com, ip: 52.101.61.17, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOlyJCusf0OPDsAnWvi29WOlEum29F4caPuOAi1YbJnl6L6BaRsboXPmd16/qf0cVoP4I5u8RBr8zLH4lNiIOoON+wfzo5z95QYu/FibzYUU7t3ExYIAZr2T3P60nZza1JmVKfetylfbH+kelrjGoVcgynMRO2Go5iOmZRFDAl3CUiyz9G0ORfuFVbt4OrzXd/qU6AReXw5qQWlRjvIKX6zywyD+d5LnEwcHiZPmdyHl+UESWNML7UfAXla/NubHW8TsThBHZ29NFS5VDV5oEZz6855N8BSvWbrqXAYJJtU3hGPhkiZgozRcm0z9E+9yoJ3xFRryIO5SrXaqBDX7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O3rlmOjjVV9MekttJsjD1C5Ouc/MkMI8tZvg0zd5fI=;
 b=jjZoVy3UpQNdAWYReIp2aAOC6g31xBxTomvN7mxRlYrPnoAZOSnbaQhEE4fzxucbg3ek5mVHexOF/IdE08KqpAK0R0iFKV2tjCyguXG9Vvr7NpLYM6KZcHBD/7efluX6PlZMPl7l9MtXBbTaXbNj9l9QR9+zpMNn7Jb94qetXHVmm1MGRUW7EUvD/rxVwfdAHZoDwyTXe98PLDoHyao+7HCk7qCgYCcGBlAQoPyoW8UVFsU1NZR/kfJF/3oVN3Gitx6+bSVWIf60glV6ZRGvwBN8hV9L7oPYKL/298VAug1Sj6UdgGWjWh2/8QTfEjsfi2mnXp0JZi15kbw7mKjG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O3rlmOjjVV9MekttJsjD1C5Ouc/MkMI8tZvg0zd5fI=;
 b=GaLsArkJyQdXl94kBaZVTdtR4PGNWEiVh+R7F68u/MnmSiqH7d41FBpAmIuw9uXZJpAMvSaMykSn7cjkrutgTFKXkzmtFI7hzcT6Nx8qBygh6xb0LjKdS4lJn7yH0jpDW045Vbes/FgPcrchCMzQbo1K7iNWSuKm/g3HP2xRedhpBDHFXHlY64x7DUMqopdk6S4E0wP2QHXVTTWRGITaOAGRJQMwHKykEjHhfhwBwuDbXTUJW5gnNhATrY8blqaVobUDNBHr4+OoSoj23VdoKLmhwpxEq8fS6W6nEubJ54lTXKavC6S67r7Qiw4kqimmwAN3vc1SfhFbhnuUg0SAiw==
Received: from CH2PR18CA0015.namprd18.prod.outlook.com (2603:10b6:610:4f::25)
 by MN2PR10MB4285.namprd10.prod.outlook.com (2603:10b6:208:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:55:33 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::e8) by CH2PR18CA0015.outlook.office365.com
 (2603:10b6:610:4f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:55:32 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:55:27 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:55:27 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 10:55:27 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEGtRjC936726;
	Fri, 14 Nov 2025 10:55:27 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 677CD9ACF4; Fri, 14 Nov 2025 10:55:27 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511140456
Date: Fri, 14 Nov 2025 10:55:27 -0600
Message-ID: <20251114165527.3708760-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251114165028.2048629-1-lcpdbld@list.ti.com>
References: <20251114165028.2048629-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|MN2PR10MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: e741ea6a-9a36-4a3a-cc86-08de239e9ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XX96Fbs/2/utLW5nCcVPke9dEOR9pc5EIPSBIxF2FCzeq3TYc1cCukZ2j5U6?=
 =?us-ascii?Q?OXWTnWtilzaiF6TYiRRAdB1qdAnNwKOue4l/U7gcI33OC4FDrnTlQ6Rn53n9?=
 =?us-ascii?Q?MgGeNvJwv8TOHqNs0IhCgHeKsslJnj/oh0PkjMieZqbforUShQmJQr9JScKi?=
 =?us-ascii?Q?s2DKj87lQSUkyt2Mwi8PLd2s7gMt5fFrROWhYhxTCPfOVj6fT7biCnvB1Nb6?=
 =?us-ascii?Q?ep4B1FMOh+Sofa71jtSJQW0LScTli4jh26nRPxXMZv8i17pSU3wfORms0lBW?=
 =?us-ascii?Q?aYBqXDmcTNNEYNKWlIfh0VgPuMgyhWpTWxBG+k6SfEFsp/cpvgWUKQYV51pM?=
 =?us-ascii?Q?JCjE5oi+L/HDWfax96RVJcJbo4Bi2JzJ5YQ+JKFId6PPrE7soO9/VcTV+uQ+?=
 =?us-ascii?Q?oP3sgd0cTvHfmTPlbxjvMTjuFw2D6rim9D7aIvgOyO1WPkDl8Xgd0MeiJgj5?=
 =?us-ascii?Q?3b1Q8XkwFB+JWMCa8D11tdGIgSmVVlDTNiKThZqMRQJ5tZ8zaubKaGUog4X8?=
 =?us-ascii?Q?PfNyUqkxR0VtmA5tqPuoTUfcEv4gJBI+4+C5H9SWOE55rT4q/tPSDJa7Xott?=
 =?us-ascii?Q?4Irawchu2lqQMRob/qoOF7x7Ge9o812MCEfm7Lb3+bDq+0AC5a6QlFNBQmjD?=
 =?us-ascii?Q?cCWHgmAUOVYgm5VL4xldlBQvve9EM94hzphI9FUNtEfR436y4dBn/u9xO31G?=
 =?us-ascii?Q?YME9kFs31zDi7jHcBGRRGdSQPazfL6wPF4uAbAXmKCqzzU22Acl2KvTQaBNJ?=
 =?us-ascii?Q?/3gJK5FW4N2JpBBqy+7Ym60qMzOYl+5DqjD1oI1MU/RCHi9J5YiUWIn3VndS?=
 =?us-ascii?Q?a5mrwmGubSFbup+B5Hdgirx7y6lK4DjtY1/Aoy4aihMVX7oV8IHRqkintfb9?=
 =?us-ascii?Q?rozg9xgozjb1SI7MMwUkr7CQBbquDXDBH0Mns47e0t/y75mMfbMA5rSxaWVr?=
 =?us-ascii?Q?7KSt6Wj9P+xFhHbLFIaLgyRlOVb4R73TBp3EktKFrI15ndZzs85nChg/rAig?=
 =?us-ascii?Q?XwhzirZ2X+NbyvXiJyF/ZudCVuHlVjcA43d2gro98lVB3c64sSkI/3eZECY+?=
 =?us-ascii?Q?7LP6D3T4kEF0OJKWkOG1f6OvuFycvNiZ6NOu11xx2jfNRbQvoEqaLvEojp4x?=
 =?us-ascii?Q?fZZMwj2w7f1Re6TGr1Yos5pWdesE5LSZATw8a55CKouzn3TP2y/cS36j+FyQ?=
 =?us-ascii?Q?CrIwzfhNWbT0dnHo16TjBqJwYsP0LnoGfJWsVE534Z74Hu8DWnQbuAIq5f9O?=
 =?us-ascii?Q?5WlOU6+FKQ8LL3WTup7IhyjsvQC32D0nRaCYLSqmO52apn3xU9ddwZiEifOm?=
 =?us-ascii?Q?8lnRLBeRyF0+HbNbn+Ze73/R5W36QbbTgC2tGulmYlIHvWY2wD6fzb/mlHc6?=
 =?us-ascii?Q?/OBD5fjQTM/M9s2QjgYxfCmSSBnaD/C6kEDopf6rId13x4zX10TC9GUniK4e?=
 =?us-ascii?Q?ubmwfGpx+XhZhEr2kp/K5GhlqjIRDYU0k3JxqfpuGLuDJF1q34ZiST8X6vPv?=
 =?us-ascii?Q?H06pgQsePPZAjNJSn/2fWn/Mrqm93Z2TY0OfqIqG1SGgi+3kze17l1vmWA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:55:32.7529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e741ea6a-9a36-4a3a-cc86-08de239e9ff3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4285
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Nov 2025 16:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16769

meta-arago / na / 20251114165028.2048629-1-lcpdbld

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
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202=
511140456
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202511140456. (COMMIT-MESSAGE-2)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202511140456
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 14 Nov 2025 10:50:28 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b578069d9a0cf362b00075a96584479b1=
6dd147c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: ed74d4cd6d3635156ebdea91b3fdc31d2f3e93a7

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




