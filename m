Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F170D46952
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 12:54:59 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36423.1769086498211001015
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 04:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=TpxRuQF8;
 spf=pass (domain: list.ti.com, ip: 52.101.201.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mA2CSUQLWEBGv8UG3lL1s/33X11esJqCjDnkPPE6nyAKA6m5CpOHGuWmIv2jpIthyWHzHI4RMn/zGnC0RQg4UF8yMVxXAui8E3A4OZnkkg7RLyAoNbJfYLFHPbGGO6gdQQ0lehDMKVuf12ypEiIKQMzY+I7oc68HzxesQOmiGcQEoGUGsViRxjTHATXFAFEvzDpYayFqBjRTf00KvBIWE8m14N4l6kOGzCK/QN2yyjv5CNwIHl9IP96p55RDwGQKd6E3TUMn61hfHGM1amj1hWQ1fld3TImvSMVRAOZpqa8Fsth4KsSBo+K8lrOcJOPka/L0t6q+09Zx2q4VgUz8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hZ6Tr9zEiHBsXMRly7Rn7mBcIvj/LwJ7MmCP6vgA0c=;
 b=EQvo57bSo1E/vqSC213VHNkzjutjN41HccL7rxwTh5OFvyKaesBM+UvmNl/CpxgXs+7P9OttxMU0G5ANiv2cueOxlsh4bEj3xNiG4yjLy42CFuDk8OFsxbXnirvPfi+4NJCJnc/M1rOxUDuyfGdTqyRzTbbCW3xKzQhYlhnw4qxUbU0/ZzVgxbc1AsEHRIT2PiXbftoEhYReOkGO+b8i49dM7MbDwHntFjH5XLS/cjY1hTie5pV24NwJQEgC+bq5b91W85Q1n+fL9ygPsaUUuzqQLGlBlBxsc+IqKnTKO7PqEqWv8xEz3OrK5oU2KFampYZsyIKt77YB4QPs370lEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hZ6Tr9zEiHBsXMRly7Rn7mBcIvj/LwJ7MmCP6vgA0c=;
 b=TpxRuQF8UUzCOGcYxPymdtQF3BEhxKQWmlUq3F1xS4KcwE/7PIuTU5B2SStRRWy+eFg2VTLpWquL/SEDc2SU41/G9JWsUy9m6wTwRzRffvIQyYakaK6VzbrCDsbzGFuELQN/DFqeiZ39/964Jz//aYysCZFjoPf+sy9Ut2Jkr/NJsIoPUL/+oF1Y8/BdajdEFOtM0Cq1QfQD1GmKRPtjH3M8Q+AwcbIQJEpPAsiD/TNfw39NO2Olc7jkR+SKjVMrionYdSv6KQpZaJfUqtp5ChpoOC2bCYkI0t4/tahQfkbOVWmkXThJ/4qhV3N5385rMV5n2v2XRcqfUKVHgNCxcw==
Received: from BN9PR03CA0736.namprd03.prod.outlook.com (2603:10b6:408:110::21)
 by CY8PR10MB7243.namprd10.prod.outlook.com (2603:10b6:930:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 12:54:55 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::c3) by BN9PR03CA0736.outlook.office365.com
 (2603:10b6:408:110::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Thu,
 22 Jan 2026 12:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 12:54:54 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 06:54:53 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 06:54:52 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 06:54:52 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MCsq4H2905002;
	Thu, 22 Jan 2026 06:54:52 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B99F4138B69; Thu, 22 Jan 2026 06:54:52 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH v3 1/2] gstreamer1.0-plugins-good: Enable QT6 PACKAGECONFIG support
Date: Thu, 22 Jan 2026 06:54:52 -0600
Message-ID: <20260122125452.3649225-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260122123107.3001250-1-j-sahu@ti.com>
References: <20260122123107.3001250-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY8PR10MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: b2857df5-6065-4395-4e48-08de59b57080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2495MdGbJk3pdwhZGXWNdbB1uXf6CQYwUT24qNhdib0PVHI085qDzMtsvUGs?=
 =?us-ascii?Q?kjkNTsgbcY5h0S5d1bcADHSo8drslIKSq2godrPHxRdnvFM1fBhEs+kgMx6h?=
 =?us-ascii?Q?eb6tTP/v6qK3FEicfURqB3B8Dg243ZpMvuP6trGdUW9Vj4At4y8L25KjPBPA?=
 =?us-ascii?Q?jnMXdy7OSnjvYftHZH+/sSHGQhivNtADUZtsV4EBk3NJ42e55iCo63fr3hnS?=
 =?us-ascii?Q?ieUUP5P46WOux9guu8tIk/lm92WtdcGgGOLLgOGPI+ONLfnKKUWLeZTdy6kx?=
 =?us-ascii?Q?1SLdg2q8iihxBeuXes0WCvSsXkk61jkV73IBC9L9ZV3GtReeNPm75AJj8hZX?=
 =?us-ascii?Q?uxTyjr0AcA/RjHlVEfQwtii36dZxPnYH0J0JJ9UeX3hmEZLvHdykZBMtdFv5?=
 =?us-ascii?Q?vOSPKx6Wj7ba+wi1WFctEGnQZLL6xJw2vMIt2AUG3gbYcU+AY6XaVWDzSmAS?=
 =?us-ascii?Q?fqVh+XjqymdFsuyq3YcIWtvL/ioIT/Wl0eB4ATGJccpYqgqwfN4VPxW1zp2u?=
 =?us-ascii?Q?LJcE9wVN0ExbYnCb9f8L00IYxIPX3/Iw4VigQpBnOz+ucbIs7WAE4cZAHjK0?=
 =?us-ascii?Q?IFjSiLxrN4Hn+I9NRoU1Ln7SgmOWitFZQUesSblFsQ0zSwdMsLFjUF6FLcdh?=
 =?us-ascii?Q?c1mhDx6ZSGniaWF6eJQCu1R5uF6vFO42FMQ9IwM9BXxIQfJzgx+45GbVp5dA?=
 =?us-ascii?Q?mt2J/yhAkr1LYvxIJxBG3SmDfd81vobqcqZTDR2YK1hQzAGf/A3vkOTJZbNo?=
 =?us-ascii?Q?dhQas0GqM0SBquCC7OeNoALwJRHW04dhG2Qkym8hOd6/ZEoylDopir3HpMu0?=
 =?us-ascii?Q?Q5GEcnQ7dVzqcQUEm5X628NGBKiAWun/Az9MO70i4NDSPPefrrWkupOQJOJx?=
 =?us-ascii?Q?9zVAWY27ce6MhjbdfZ2OpthdyAc6/Y1CClO9zy76ANSudQXCvmlb4L2C+RK0?=
 =?us-ascii?Q?46hFHm/aoiALbHKMB2DMveFASn+0k/90IHMNGenrq/n0YEqJ6vQhlvWEG2a1?=
 =?us-ascii?Q?ucyVEcKzA3HhnKFMZc7lrB11DxWdzFbcUIRNwleSQYhxFNLMxaeQpGD6giPb?=
 =?us-ascii?Q?GwcZjYVGuH4CbX8JV8EKDQO7SJVg2JXLktvkNNbM9tsctNzn39S6G39iFHdd?=
 =?us-ascii?Q?9rPMKhYkBtsrw4xkYqU6yj/kEcO4kxssV4/3R4ulF1vHFkVaBb9J4hZSbTon?=
 =?us-ascii?Q?cHmgfb/8fLIVr780dkgsyLbfwixUk/7qrRv+elAzakHDehA8oiI+QOpwlpxr?=
 =?us-ascii?Q?yXJAD3Zah6ecvvI0tmrWR6ZJolhT3P18EXLh17bQStc6G3AIgO7bY6mxPfwH?=
 =?us-ascii?Q?oIYVVk88ciCWWshCl79ODSlnRMS3vUfiRDCKK2U5oJ0o2dLqHNB9AgOKwk6h?=
 =?us-ascii?Q?D7hjdTF0rsl0NQa9Vxqhzzv7qdzuoTEntuX2uvvGU4enbjnMtWei4MFkSx68?=
 =?us-ascii?Q?r47rK9UKFDSrEhMd/ykHninKItLm2NqRZAl7I/2Loe+eXnwDYEsRkXbbHQZC?=
 =?us-ascii?Q?Dc/ZknO7qe4YUBfDNaj59OcMYzio3epsEGJs0lSGNyD7Vz5oPJjhrdnaVlt8?=
 =?us-ascii?Q?Hz4/v9BX2w53HuwfcW/7QKv2wlWx2OIYjIrU9guBxEkCgd/2MGHgBaxpYoln?=
 =?us-ascii?Q?y6IVWetITauE700P2LNJsYbkvu7v0lMUF5P2TDoHpZ3D1K3ZvKOY983xTE5V?=
 =?us-ascii?Q?8hX08A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:54:54.3387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2857df5-6065-4395-4e48-08de59b57080
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7243
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 12:54:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17007

meta-arago / na / 20260122123107.3001250-1-j-sahu

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
WARN - [meta-arago][master][PATCH v3 2/2] meson: Add patch to fix Qt6 priva=
te header detection for cross-compilation
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH v3 1/2] gstreamer1.0-plugins-goo=
d: Enable QT6 PACKAGECONFIG support
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Thu, 22 Jan 2026 18:01:06 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: efbf32cf27397d9eac5ee7adcbc757e30=
3b1249b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: Upodate for v1.4
- Commit SHA: bf47628886392400787668c9b203334ce00e2e4d

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




