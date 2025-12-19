Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF4E668A6
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 23:01:43 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28415.1766185295475227989
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 15:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ayxYPzh4;
 spf=pass (domain: list.ti.com, ip: 52.101.43.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqsKQ9pfP7TCwfufjalId79uSTC4sidrMxXxOs9P2dtuR4O+5tcx+R36ci4h1X0NOmf7gjDY/lwxVc+p8XvAUURG1Sc5tCssqGYIsNEkCZ3f4EDz6j8F8xXizMwhAPb5vnshpRhfM9wxP5U7hZ9xM5xep9mlOCumgCGz/qocUTUe8/6DdM7ZTDctoTyARIBbsR8U/1wiMbnuPRbLtRKh/FW+Q6sVp1xkCsXHQhN3U27tZhHwvPpbzFeA3GfCf2KcVY7dINC3on035QrSKC3cY42a7exPsXxMdWu45KLuoUakI+ztJFMLe14UWLZ2Yg1MweZUwZvt/bULkTLvQbtnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wr/ktzCDdLGx7GuWyUevNLlp7CJxfOi3AyY/v5jEnk=;
 b=IiiRe6YIpVSrYm5PEUs6OW+b7Ra9Kbue4B6iH4VmcR7+8wYu3+yjV0ddcwuJadxxgrZqYG2c/LN+KybK2DcZaAch5SvnXCRXwZu8AyxGIgcXJLVTg8iuUELzH883pfCJfKZLa4YmcoNhT+MMHPTRnd2qr3x1qnEgFwTdjDTNR6xzaTKNW+FgD6CCfr6M7MBel1N0mF9kEme6ruM7RY9kCjjFdVQcAWhWvAdNhX+nUNVh4sUBhpgCzB64aNilEk2I3dMjvT1WT5U/RO5c6Odr8tC3D7iJJhC1uJ2cYLPu6gVlKPdE03TUkhqlXML+HOHQCBih2L2KrPc45yF7g6143w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wr/ktzCDdLGx7GuWyUevNLlp7CJxfOi3AyY/v5jEnk=;
 b=ayxYPzh4cPFAgnnwHsaDE6tre49o/aRZDSNEjpfej+sriaBBonBEsvnNSOQT3s4zoh20iEsuP59Ew6hgPIkbJxIqu7/TbLOIwVtE9+mPF1l3ZkN0lt6a+k34CFTPBPSHJ6qIMYRS5QBiLU8Kqi1bXCAytxumkQt/kJ0TdFVotoRxmol3KaTwFw7H4oO/g6yLN/lAzD4QsgVu4g7ElMHmq+vpUW/0LRduqHnSQ6vSzTweiDBk+4lxz6TcBlRhyF4Q22w5+m8rxVHtYJWLNbb+PX9v83H0C30NJEL5RBzDoCwKtCellzGvtxS+K4s2lypftOnADjGDOw4gFK9+2MU7EQ==
Received: from BL1PR13CA0185.namprd13.prod.outlook.com (2603:10b6:208:2be::10)
 by CH3PR10MB7576.namprd10.prod.outlook.com (2603:10b6:610:17d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 23:01:30 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::e6) by BL1PR13CA0185.outlook.office365.com
 (2603:10b6:208:2be::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.5 via Frontend Transport; Fri,
 19 Dec 2025 23:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 19 Dec 2025 23:01:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 17:01:23 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 17:01:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 17:01:23 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJN1Nhc1646944;
	Fri, 19 Dec 2025 17:01:23 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3C2D49ACF4; Fri, 19 Dec 2025 17:01:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.202512191404
Date: Fri, 19 Dec 2025 17:01:23 -0600
Message-ID: <20251219230123.475630-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219224258.3145180-1-lcpdbld@list.ti.com>
References: <20251219224258.3145180-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|CH3PR10MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 489a3c2b-1418-4b83-df54-08de3f528a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CPXs2LpwAz+WjUVzn29pQG5k1ArdoPmvkRubhKjP2XwrHmgBfa4+O7dw9xLJ?=
 =?us-ascii?Q?qqb0cTOZGkr7fegdlGPCj1B8oUekqGWRbqK+aMbOK9Rh8Vlouf3LKzk72sJc?=
 =?us-ascii?Q?5KwK5g3iW97CNc+O2YITJxdxHPAtKsCMJN2+UOd7qnj3OD8IFsB4tb9n972z?=
 =?us-ascii?Q?Bh3UJZIJpWfr27lmQTxKb+1fVvDbCSwOpwWUBRIyCDhpfNsqQpn0dVfdg9HR?=
 =?us-ascii?Q?dO4/KsFahtsnLKz+B+nW9gP+36R4ZEoacPNYnXeVtmAwJNTI7sa3pKUCxlGu?=
 =?us-ascii?Q?bf0O78joeBs/QM9LoD7yTF7kbLJpN9iOk088kaagpF/jMZXIS3y67meERIYk?=
 =?us-ascii?Q?9rx+Er9xWRVO+y4qPons9U/Ys0dMC73zlvXcly5O42ytVDOg1b54otrbdUs+?=
 =?us-ascii?Q?wR7dUHm3APrQ2G6LirTlWicrGzr2UbbN9uY3Myek8wlU9nz1knfld3aHVvKU?=
 =?us-ascii?Q?wY0C6CJjLfwkP7sJzqo3Bh+S+QnwtapU3GWt+nhp80qSfEPg1MwgQEU43KWO?=
 =?us-ascii?Q?MJG/FVwF9KEKpm5RspFGL4mXdFZLZjfpuFcxWvW1XMYkWiUBf1jHWKe+D1PS?=
 =?us-ascii?Q?/PhCrXrHVjivY9NpqFBBb72cTctTbaPh3Q4TBdYNdchlnXSiGLASgi3qTmYq?=
 =?us-ascii?Q?gOs5gAQyUJiFnUbSOCDs2gbsFQKf/p9/FzYXU/TDPDqcyhpPxkpyjGeIrQPR?=
 =?us-ascii?Q?yx0H8W2YXjVDryphdFMl4fg4N/5WL+X6Q3AAUua+hjtooLkXDIu/Iw4XdOPh?=
 =?us-ascii?Q?zk60BeiJEWgtPm43ArYB/9Ps5dRX6k8sefmq4R+OZEQWdaXEosOfEh6OckwF?=
 =?us-ascii?Q?sDA893jOP96uQOFKxD30KwtiW7PyEXvbixU1g2BB6t3xaQaON+f34Z4yP/LH?=
 =?us-ascii?Q?rdB2r/FCnGGEXeTz1a8MHZ95Z2FcVQP6PolGVW4IthQZmSf5VvadO8Og5XpZ?=
 =?us-ascii?Q?xJRs6zjO97/PX0HawhSHJC0mIiVHVrZAqInI804purCVJWPAjVd9bpFSpi40?=
 =?us-ascii?Q?ylF2cAkOwG+/BBVXPalViftIRTtYFjvhzIV0z0dBdlarHPTo05uXo6h452ap?=
 =?us-ascii?Q?zavAd0GiqBI3L4s3LyGc6x3HOFqOYxHK0BAEAnYk7a30TUOaHn/UtKRNlLwY?=
 =?us-ascii?Q?3BlHAE4UmJL7rQJnMIS+gzGlGcUFZyZ5ZJpfiZGEnzNT2pVSyVhICZKh7F/j?=
 =?us-ascii?Q?6C/5vI4RGdI7kc25NVOvj/VBCIO0NnS9m0XJ3dkHNmec7Z/+Rfg9XCethc6J?=
 =?us-ascii?Q?iJxAS7qjWpIzDr9vAnbMnuY2SrvwcLt9cbIumw7NkrCvP742urPb/8T2fHeO?=
 =?us-ascii?Q?HXT3fGNDZOdovQYAethsOKQM2DwSsSsSuX2V0/xfMB0uO2FDuQnySTub748M?=
 =?us-ascii?Q?EQ0JtALtb6+rJXlE2PkkVZf9aUAswWx1MXSrk0wMJKBkVvzotjnHQcehhr+f?=
 =?us-ascii?Q?gb5u5T/1H+pHlOlI9x5B5ped+u8dvenejX6NfckkCCIAo1BPGzaLostQ1IIb?=
 =?us-ascii?Q?FH631IoCvSVTCTrZolMaB3PAvyhZyHt66bJBwmLPVPzTE1xj8Jp3dOjyrlmk?=
 =?us-ascii?Q?3kSTcSwBPJvzX86BVEM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 23:01:26.8429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489a3c2b-1418-4b83-df54-08de3f528a12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7576
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 23:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16902

meta-arago / na / 20251219224258.3145180-1-lcpdbld

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
- Patch Series: [meta-arago][master][PATCH] CI/CD Auto-Merger: cicd.master.=
202512191404
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 19 Dec 2025 16:42:58 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4708f537b9a4151c33058e564b6a1ee3f=
62cf43e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: tisdk-core-bundle: Update trusted-firmware-a locations
- Commit SHA: 5a325ad4d3b0445b6e14e8daf02dd7f60c5e1c19

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
ERROR: Nothing RPROVIDES 'libxml2-python' (but <build-dir>/sources/meta-vir=
tualization/recipes-extended/virt-manager/virt-manager_git.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




