Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3FFCD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 18:56:14 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137086.1781549767174245357
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 11:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XAGQpM+F;
 spf=pass (domain: list.ti.com, ip: 52.101.61.5, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8DIvHuBZsGKStMAmo/B/veyhcLQrFKimojc1KSj7jhlBFb7T6qtui2cUBFCChW1taAD2+OIjBwDU5mFTRb0LYBjc226pgKjiQ/B7pxbCkIWSgQPKxjU7IKzXyRnjjLh+ollyyaeDVLNnJ9WVkHiz4ETqsCkgSVwpSIcFpMycTx5me1txmv4K1uvBZ+4vq4oOkO4JxCTG1taa/q+ljBvYnKnWC2n6eooSbW2XJKGvyyyb9I3V1zWQqnzKL2TyinpLL+TvOQ7OJedMhIN4fFh4cvq98pi1dzjtUOa0MPECLXiXs3GrOLzCMxgfXYPvbPvpxSMX5yvDlQswLPCDkIatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9bUvhmN5MXbRlgtlsd7QdVuPHzoWYG2A+/6JyE6jSg=;
 b=vKKYi8rdTJ7+D4sZ+xblMau0jFRXc4ya+oCAQI7SM+bfvuozos2NnGyggr2Ar2dwJwD6I5ZIN1/CcITVEWB08OQsF54l0jK3JCESEnO945+jRvJ4HEYcWl99jfUmSHI4gknHaVCvc7Q5OZpmg87I7tiTQ7aC1L10AMkLuTmJeaMXWETxhXiq616cijlcN2SU3r1apOt+OCCWHk/zEP+MyZKhNThpKzBRhfYFytEfgOQX/70yUMIwuyZOJKyGGjkQ3J9I5zBjGiBIzTpsfUSLOHRmIYjT3fh7DUysha0N1K3cT80uiFKWPmal4/DOE8oAlT6/w6QHbbIdO/OjyxBU+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9bUvhmN5MXbRlgtlsd7QdVuPHzoWYG2A+/6JyE6jSg=;
 b=XAGQpM+Fvpbe4+rtNQJ/TmZgGeNIbpTMwWzYyTtcUzxI6Ac2Ag7pbo8Cz21Auy6kOCiVAS+8NwTXamtPensd/3f+fpTcq385jQ5lbmfjtLRAwfVwnFlXaRMPXTLfi2NXxTiswpikFZ0IY5d5BYLeG71mzVnj8Yuinsn5aZ5AcSlN0TNMIQjiXYtxEYiDi3db1Jujw9Napk1dg/hEjsAD6+po1Nrd1qPSda+/XKGpzgp11WR2iu5+Pxa00WzHTTcqOuHKDd5NwDit9qSIa9xk4+yVRK0fVO9LAOQSh24e7HEq/nby/GtWX7VuGeyI+ONGipXF0WnQMvHY/aIDaXV3lA==
Received: from SA0PR11CA0085.namprd11.prod.outlook.com (2603:10b6:806:d2::30)
 by CYXPR10MB7900.namprd10.prod.outlook.com (2603:10b6:930:d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Mon, 15 Jun
 2026 18:56:01 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::4) by SA0PR11CA0085.outlook.office365.com
 (2603:10b6:806:d2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 18:56:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 18:56:00 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:55:55 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:55:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 13:55:54 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FIts4H1943404;
	Mon, 15 Jun 2026 13:55:54 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DECBA9ACF4; Mon, 15 Jun 2026 13:55:54 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202606151035
Date: Mon, 15 Jun 2026 13:55:54 -0500
Message-ID: <20260615185554.566845-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260615185347.3206632-1-lcpdbld@list.ti.com>
References: <20260615185347.3206632-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CYXPR10MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f0c477-f77a-4881-fd40-08decb0fbdd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ry87MLKEU3PHg7Hdhktl9SYFnM0zFldRR4lhthsfVhLGV4SQXpZ4cWhWagTvcAq/PdSywO3r40IHQd26VespAgrb0QKAY7cvmBca/qD/0kTy0/6EhH19/TWTgfsxd6caPWXu01N7yZOzwQ3bONq8ehae7b1N4qjHaygfDr0FyiX22BCW5wFMx5/ju4omqZP66q5NvAi4D6vi/uDNFbN8TtviIAxdk9V8h6ZHBSKnQTcQbBBV0wnQKyhUKEIX+COuOSSNBCYy9SHqU6SH/QNDwocoOb+tDYeBrgcBKGJodg5fxfpeub0YWXeYFLGuIf4ypoWvah0q177Qa93KxyFiUofyqjyZ+9+wO6PlPD1Ftknb8xeENdQjzBO3TqvxAg8QYhRidmweYNFtr7AiGb266pRJEuigTrBtwhvf4hH5ypyHYDoG6lL/GND3P9hrXA/Vkma6mVijwjzWnfQ6Kw0giSUqiO/tB9rc/SSdOQKF13pn1hYz/gMGEmV8PlTunat5PNNW3EMgWKXNDq5+btRZyRIDVLo0/sROuwZ3UjtiPqGb8OSymPbsISASwK5QZCgeIZnvljdZvV+MrJMcE0j2KnpH6QyHldKTebMvinpG3tC1axD8IBby9xiUrK9U6s06PRJlptLlM3wWbtQ6QnPNyMSQy9+yX68f/zahYUvuBeRy3xRHeMpIVWmNxCLRZnrMcqjSLnxHj4nWqZlBL/0HJJpkSOGQ4YuO3sZWVeFIELM=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B8hKGpIsljCVOPT4pUq7Ia/5ii+L97IHDCPJ9/8zPq1Q0wRmK1LHjP50t4yijkiclLDyNs4I/e0h7VmlkqTyHe4++OaWRu+wZRvz7zVASIlVgRQ+5KOaEja5Mb1RZSPN01sNV42nVz/ISvZZ9Dr4JWZfwgu66ocBXWPRm1U60NOrf+6Cmg7WTnbsOdPXld6DMDPhClrTri2IYMXwYzzLiyIK6OizkaOhx/C40KZYXkwN7zt2lP8pH6ZmsLk1rS5pzlSJcg86rhCGL5z6VQX3CqyGYt/0EIwBlKKn3S3UzvYnPiJnInVlvJ+HhJPA5Ho5JWZDaR8ONKLGafwt0cLh5K+0RmlEr0D1S/9xEpaBWpRl96he3Z2FaWFBbM4j4r9D2KQtWT8xxLIbrm+HgBXkxKPf5h0H3ctQAu76Zg2YyJaFQiBoXaIeI5WM0Z6gXp5B
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:56:00.2509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f0c477-f77a-4881-fd40-08decb0fbdd7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7900
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Jun 2026 18:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17569

meta-arago / na / 20260615185347.3206632-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202606151035
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 15 Jun 2026 13:53:47 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b43e3a60c230aabe288cf87752f071a54=
d7963ba

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Change branch to ti-ltp-ddt_20260212
- Commit SHA: efba4adb406b9675641ee85ea3bce1c375ef5963

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/=
0001-hostapd-change-conf-file-for-better-oob-startup.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMa=
keLists-do-not-install-git-directories.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tes=
ts-fix-typing-of-size_t-in-printf.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-=
always-use-asm-sgidefs.h.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remov=
e-maes-option-from-cross-compilation.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remov=
e-neon-option-from-cross-compilation.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




