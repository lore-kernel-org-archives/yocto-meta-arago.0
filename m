Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E48FD45E2
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:16:55 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53456.1772047009535958068
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 11:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=snfXtXi4;
 spf=pass (domain: list.ti.com, ip: 52.101.43.18, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx1Vk7N1kFHYrODldr5jNmDMIzGVaGCq+p1qRDpbrKF8rrs3y+MOGtH3kqQQEvGvGqiPow/q3gMEZVRF+wmpNvDJ/5ZKGy1FUyk4A4fy+3RwKKQuH7cNp2kIQ7lq9u2tAbr3dp9tO92NaOKXIsZEU+4G8Tf4VPXRFkz1LLrMJBZPcuOvUKC3sYiICuR5XusrghPIkjSGa+Gv0fmcXBHmePPerwvquis+XZ5yxXZZNxxF7LIzVY+Yg2TTZTuWZYVvBxuVxGIRoJFvVegUWaZcHjvlB6ttAJi29mJW0UMY7H/U62wDbfeY1fU5U6i9f9k5pStJY40HRiL1KKnj6KVS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUpS1vwjVyJTen6TPhlcajNoSWlZBa3f21W1NkvuJDc=;
 b=T9MIkobQdEu72fFNPv3biaXz9Oj1zrynV+L2+nX9KlxEagZEaEVLlqY1qNcTi/Q0y0acO3BJsx1SIkoaoBD2ybbJDXhEEI+tkv4fBn19sRRE6E86MEDLZWSvTvmIufCd7/xS8Kq46g9FbkY5i59B5bVeg1xTyWWcniMYGmbEESYJtIvrbiaYAGKBtV1MDH6AerR/MthxZxCdSVrFkTByvibE9O9fvlYTiXnlbYwJHw4aUU0Nd8jnT++cEX8VzJJwwQaBdXHL9CMHZ5MExyiamtAI/C7rz7dcsdxLaHPQgp0LnXgjJqi7ha9RhKmKgWspYR7rfcKPoqzqtjSGy2BOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUpS1vwjVyJTen6TPhlcajNoSWlZBa3f21W1NkvuJDc=;
 b=snfXtXi4PJnqTIjy/XOhIlhz41uaFNOBgDYpNSi1+MKK6BbJLAUthOGfbPiq756gzjWzkIpZEmqLq0A27jt9Sar/lt15Vycr4xG7kb5ic//+PN1lQvHfFb35odVgx0lUBCK+uP2Jrgv/1sCCkk6nFdvjNxKShfMinP62A7YBvuKqFCnRebHsx+IsNEiXAri61kzqlx9vJCLqGkWdeF0i6hFZFTD6grOpOlfqovd7vQVusg+iat/DxRQKBMcNfchWqwHaYHaz77f2ms7SrVZsAoOcrOy87VHz643BjOu0Q+rRKycuJwD1J5t8F4abfOg5I+RYR17OFWupmQXLnEi8AQ==
Received: from SA9PR13CA0073.namprd13.prod.outlook.com (2603:10b6:806:23::18)
 by MW4PR10MB6395.namprd10.prod.outlook.com (2603:10b6:303:1ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 19:16:47 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::e9) by SA9PR13CA0073.outlook.office365.com
 (2603:10b6:806:23::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Wed,
 25 Feb 2026 19:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:16:46 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 13:16:45 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 13:16:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 13:16:45 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PJGjaL992404;
	Wed, 25 Feb 2026 13:16:45 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 631BA142E2C; Wed, 25 Feb 2026 13:16:45 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>
Subject: Re: [meta-arago][master][PATCH] ti-test: Add Required Multimedia Packages to ti-test
Date: Wed, 25 Feb 2026 13:16:45 -0600
Message-ID: <20260225191645.3441271-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225190339.3295692-1-b-brnich@ti.com>
References: <20260225190339.3295692-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|MW4PR10MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b2d5c8-e479-489c-d36b-08de74a26b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|34070700014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	LK1k+ypqoywfvI6hTK5JR1WaXa7t3sgNjx+VsjLpMq9+eRATavGuiTv1dbU6SO3wAAt1TWElra6f1Nzz4kHaVpu2gzTu30rBXgLlRB+F/0H1/TueMFbA4KMtVSI8i7muJyE6uhMyQEm05dr/s97RDVu3KA+erCiUETVNm4RV83Uavf6R3MlmHnbSbxTiqnomPlH8KTEUdVLviCDEwnu2fdJqbWn6dFTL/dWxJbJz+RrX3eweC9wOsG8D8AoMhcg4/YUbKPiGvGc7MJyAvWMoM05oYhXNE98fBnzNwqCoVTtsXe96fsW/M1bdBmszoiV2jq7JsWCJnCmEIF/jHkSjxx8BAHKepmrw67a7fzVT3Is7z7ZVmmwg1YVWFc6u4rvZwsbr0wGq7uI2rUIBZjOtLBULb3G8NWQJkWlCOiE0mDnJJkke4N2dEjgJbqUrDPVT0QuFrjlAbr0O+Qe+V2Kw2ljJA02njspYPn+dLBQqxqjurOGOFwarD+mt1/KGAOTXQTAWD4VexFZG0YMrgA+aD97oaQnT5mkZngI8g1jQTWMUSmtaHbn7Hw88NoHDdpxPbidv4+D/MzYumIflw32UuiTjQZsF6KdmBqPyonl5EwkoseuLnjVjj5EmAgRjiZ51hpHvwpQYXwcgnReFSCPD6WNV2o3zZG9wJLFirD4mPt1TjZD7iTvKDihS6Sg5AWNDxlkau629j0m0C6m2Q6PzaDKZVWbN1tepeUCBi5KONjI4diHE50e0rAKAH29RLnw5wjj3wIjmcPkLXHkkaqZW+nZBmNCG+kzberaDTYeY9paOjavKuIPquLgdrs1KRbXKcim7ExK2ouRbcyPwrv+68g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34070700014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zgsvrOZa11mx5eO+KahoVGMDh6qaxLRi7AshMMty2yxbvxaY0XzkdOx2Ie8WTGpHuZ8eR0UVfKF7YxN0GWA3OxDao773mn+yFTF/SzTGG+RC/hEb0SxJJ+0PoGLgygyO0+4aUC+hPkIpwp+PA8fHafkKXWHMmQyKDEbv44yhf1z9KwQbav3nnPjY4c2Yba07IarbMYSajrrFri5RX6EfG4rImE2Wp0j/9iYEWaQ2EVdzasl2MvIvs44f+u4UaLu9VyFg8QitFQ72e5KQjK4v5IfTFQd7kBcpzba4Ee8Xr/afmAdyk0/Ae22Ltcy7OQznaWSuX6+gAISU7rYsqMXvfnxqSbRrrxE+BYxWuCO0J80b8ELAbCNC3oP32e8gVNJNW1qatc4oGh48jCd0DMRlMsoDAGwgGMweTGLEkGeD6csY+aiGHwiqL+d2EOtAwa0z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:16:46.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b2d5c8-e479-489c-d36b-08de74a26b37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6395
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 19:16:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17146

meta-arago / na / 20260225190339.3295692-1-b-brnich

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
- Patch Series: [meta-arago][master][PATCH] ti-test: Add Required Multimedi=
a Packages to ti-test
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Wed, 25 Feb 2026 13:03:39 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4fe33ef16607e8b6e93423d85c1b95b25=
0df14e4

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove duplicate include for yocto-space-opti=
mize.inc
- Commit SHA: a69841493f652f427ee322e394fb3a040b873193

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
ERROR: Nothing RPROVIDES 'ffmpeg' (but <build-dir>/sources/meta-arago/meta-=
arago-test/recipes-core/packagegroups/ti-test.bb RDEPENDS on or otherwise r=
equires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




