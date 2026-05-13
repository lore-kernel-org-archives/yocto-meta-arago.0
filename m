Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5BBCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 23:08:21 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.618.1778713692659389875
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 May 2026 16:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sI7svY1m;
 spf=pass (domain: list.ti.com, ip: 52.101.56.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctyHapJ9A0GaO9kvb7+xBl+tJeWA+MExXSIg1A41qTwEG42gnfEj4XM/ubUzLLEvbiyCn2Pnf1hf39VlDONNZnXvAwDLZRv3+gvW9hSMCfbbd7YufOd816qFcPrrvxjIYpgRjrBOhmMOt3YOJiMEt3Efa4twhfKE/1cGJxMmf8iwhtHcHbA0QA+TYEwACeCt5VbcVI9mG+u2gGT7iCNUAQKZWaFPmfecfhQzWHWshfB0fdbRETjlRoKIXE9Yyz1BfwG8mg6WlawdeQftuY3mlWfIEPtxfdv191FBcAgGEgKK+EHdOReAjQ1CAVhiGB81Crkjp+a3+dYiuRJ6CoW57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j162KEG3SNw/f+40KeB+e3lJCIgOnibKAMhgPyAq630=;
 b=NxRZnO34vb6a8MVlIWOLxsPRqmxiLIToThy69S0hS17x9I3ha95J6F+G6QdlHvFFotc+NeHv/vvoiBke8xtJHl6CAL6NscVyQQKbTiq2yhPCKHGsvxVr9yTUhANByHg+wl7ztcfcbn1ub2bTG6m3u7KU9HrCv22D7cxABX0hR+CP/c7N5jE04CIDhRkdUMXxF5ej7l2vekt/OtdwXRYJRFpDt2nfydOGTiEGEUIPu0poftSfybQQSdfFXt/SohUCuL576kY9/0e2Jw1e20Pyp8BgZlEs1IhIyMNl4KN7fXBBrz2kET9usM9WgB70V0ZupLYd/kVGSCBTCRnhyuAsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j162KEG3SNw/f+40KeB+e3lJCIgOnibKAMhgPyAq630=;
 b=sI7svY1mDNGwBtD2w6gmoQVLOADWCoic1rHTSDyQ0pDCAU6K4Q9Mz8UJVi0KMfZPC0s7nW5veQy1GOhUP7ovtLdN6JGkiEIIgs0+YGvGuIN5NANO9qvve7zxCx3TEabPevcMlDYwZ++XVE5YMcoeF+f+Fz53PVNquGzaMPeScb+tlgSk+RisTXyBfdCqTwMa9TBKOvw0YNvN/l+2CeW5B3BhKZjlTHDPWknD+qEknDWA4SZw4UwIb1nR83JNFtM9QT/O+/UC4nK3NSo1cs103JOnzb4bsVMJ1itycFZkPhmwdREIbJobR0nyIpA0Dhz8QjZgfa2arS3U7oGfB2fd4Q==
Received: from PH3PEPF000040B0.namprd05.prod.outlook.com (2603:10b6:518:1::5c)
 by CH0PR10MB7534.namprd10.prod.outlook.com (2603:10b6:610:190::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 23:08:09 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2a01:111:f403:f90e::4) by PH3PEPF000040B0.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 23:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:08:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:08:07 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:08:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:08:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DN86o5818172;
	Wed, 13 May 2026 18:08:06 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B0BDE9ACF4; Wed, 13 May 2026 18:08:06 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] open62541: Update for v1.5.4
Date: Wed, 13 May 2026 18:08:06 -0500
Message-ID: <20260513230806.3572902-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260513224759.358257-1-t-lannynd@ti.com>
References: <20260513224759.358257-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|CH0PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8b9fee-1ca6-4e3a-dc01-08deb1447f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	l2yCf13TmKlQz8F3+Twa5th1nESZ1UEcN/raH9JEZfXcCWl3+SL9mp49iMBM2o82mWmvXy/sDGm0KOl87XrrcFho/CLq52QZ49eomVPvCvLpHQQ3mhe13CrQKy7Tc5hiN6v2wi8Y7YeiF/YCu1c3BvAiW8XM7sYB6Zy+dw5XHi117vzepRLgj7SCOZUjtbqA7GwYJjo0QMc4q/LDYSZjfArkyUviY2tmy3DycN/dnb31wVORcKc3I0pQWdltL5yMELqEk247ZAAavw+I2D0WjVV0Lf9QaGyeKwFsL63q9nRbM2H51gjm3J5jkBxFFgJpoJaPp7gj+g5E+vk29pv6IBNVJEhe1KpxP4HkZ9PvlOArSd9ovPgaUcaREzDK2ZqSqDXpew2kmOahpYxT9BDwM+INY8b5Fb7c6lqMLJqsBM9vAZwue+B32uNjf1NKzDngHp4iL3/xe5h50G0hHWIyXIFr/OwssDMnE8AXBJ67XEFS1Tcfg+c9Sq/dYWdEXUON9ET//e1VmoNhw28yL+BqJnLpCiXB746z+L/64yuEHFwtnET20AI3AOE0VZ7dJLluMw53RipgKw5R492mBa8j8/LGyh2aTCZUxtHazaNh/B0L6DbNMsoFQOHRJyYhzpwxHq5W/jEtg5OCDqi+OAMtZCQHx2yKbhybUutRhk8w3xK/Z/gej+Rmt7ftytv5+JGTCZophsPvt1FNhYFpbghwu67y+aHgoIhqQqdFyAIw3p4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bBcEfH/W/QXe+yC1onp4Rm2NiLTAygcXLU/9uShqzv8c7RMH5BIsAQEjPsR6rqc6+zErLirpqjZCHVYBDqB6QJkkCjrwaR/MCpgy3Kv9mzDQwEkbQnieat8rxhJNjzisA2tQSqg2Nu4fou4wuAT3qH6lxn8ICtnggVcFI2U/zS+AIG3KyKxQqOpNdSltMhS/LsxnvCpMhs+2pJAyPY206p3rYQmNDGlBTLCZNI3DtiwRHQa9GcuzUPDQgpLyyGwLmyrBRtmnt4Re3fnCuAFoPycMK+16Uc97oMTFnBxjvaLWjPQbAdYFn9fXyReD/wEcw+mJkBCJSuiPvyBvHYSZvWOsu3PDXvWr2yulbVNDhJLAnW3DcLOhlRThWdcPC6nz/PUiUthHO6R/R6pdWBBtmTpN/hwF5k94+pAwXJOfvqRGJBIwFO7nyzR+oiLC5kqj
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:08:08.0113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8b9fee-1ca6-4e3a-dc01-08deb1447f0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7534
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 May 2026 23:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17519

meta-arago / na / 20260513224759.358257-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] open62541: Update for v1.5.4
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 13 May 2026 17:47:59 -0500
+Date: Wed, 13 May 2026 14:54:39 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d35d22f5e2db4ff16b68cf6c8c2af4100=
713a34b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meta-arago-test: Moved to meta-ti/meta-ti-test
- Commit SHA: e9bf10c0e71b08fe827200af575f9c9749be7bc2

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




