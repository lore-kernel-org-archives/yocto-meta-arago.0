Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8179FCF58FF
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:19:11 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18107.1763587144051491319
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=bKe9KgPm;
 spf=pass (domain: list.ti.com, ip: 40.107.200.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSOfjpZ1bfbTRs/y/Pr/E2BGVKsAUOKTUfk8ZgquUTGx9ol3wuS19sfgpM5ISLOv2OdSDUaVFDKUQEg7hE7KoenvxXHZ5mtJ+IFXhDjKQBToAiRz+tVHL71UBmlxeNB0jLCLwbrSF6eV+UxozJaQXm51mj/Fj1Bep/BFYC+m6lfJoV8pSet5/g98QJCbYkQZISg2RPizI6Y8dmRzQWw26Iu07KkvhatrT54MQC9lGFJE2sDbIPTJ70onMLPgQ575aWao2rwv9Vtq+fcSSskStJJMlLZ16peoHoTnB08VpivjiBO9eNIq12IBTayrSDT5axTGH8XsdaHobj8t0RQ1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YewW+QTPepuiFyMlP0ASQBCmAtkyFz6AIFk9jdCSxQ=;
 b=nae8vRa8LKRy3vDN5+Ca5HNI2+PWAC6E5AmkM4B5J2MjG7deGG1C6V0lzijZwJ0YbqyoArM8Ouxcp7m1CPN2xtCHCsNI/sfaGKg9tbEcPam/yIv/vdOjOfxkvPfvrenMYV7bBeL4CzlZksvu7SnVvp34qyw1dqV5L5TlLBRGA5Jid5Nvrb+yUhhRGourE5Gsi/TiEJLxv6rmUYtpCspstMUl45lTMVZL6CT8DM1gX1MlxoJjA6sxdRDDKpHLeqgqcTLrG2ZmMOLnble1uOGC5j+Uk8dl//q9bbFLaDq2rCEcSlsvLMJqMXhjDIerNQEMh6DEO48l2s6vkosjw7o0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YewW+QTPepuiFyMlP0ASQBCmAtkyFz6AIFk9jdCSxQ=;
 b=bKe9KgPmg4zstG0Ky/xxjJXyg84Sc4eEwmv/u3KmfDs279mBiXp2L+Iq+Y1GAzcVKjDMvD9SujY+RxVA6/N7/1c31KueOWw9oKOddoLSWpJHv1WhW2Vlz/20zEyMDsZuReedJ4MuE1S+6wbGdyH9tuHXQU1+SDlkRkc45aoAVSVGxP1suPZKcyUCmGACdTCjUMOh2iRJt5KfAnD7TI+zX6FQ1G5pIdVXeT6F2fOCl/WETCF/3r5t80ut0piIoJDObQd/Oe1ZJI3rlcOzsmgOifktz3lVqG/r2p0gCH5FXqYQVeaHWgkGqfOypttDdQwTlyxB27BLXJw2HkQAwWWxbg==
Received: from MW4PR03CA0236.namprd03.prod.outlook.com (2603:10b6:303:b9::31)
 by BLAPR10MB4932.namprd10.prod.outlook.com (2603:10b6:208:325::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:18:48 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::a7) by MW4PR03CA0236.outlook.office365.com
 (2603:10b6:303:b9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:18:46 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:18:42 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:18:42 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:18:42 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJLIgdt1981928;
	Wed, 19 Nov 2025 15:18:42 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 3D3C2142E21; Wed, 19 Nov 2025 15:18:42 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 15:18:42 -0600
Message-ID: <20251119211842.2359620-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119205618.81958-1-reatmon@ti.com>
References: <20251119205618.81958-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|BLAPR10MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d9eb72-af8c-4f9a-c5ef-08de27b139ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9n93qfRLeAsIaIPHC033ofs7f+GyUtdbGp20zdfKo8+F1SeaZOgI8VcUVQn6?=
 =?us-ascii?Q?qheKTApiVoVISY/wHDHPKqGyt6sV6t6ommBa2Dqntdp/sYHzZWuK3WQf36H4?=
 =?us-ascii?Q?JTfL59ZS4bh7J6WXzRNOpBmVH7WAHydNBsy5FHPU7hTVx9wD3HnEzMWf7IX+?=
 =?us-ascii?Q?7D7/anj5F9C7Jksl7bmk7ZDEhxIZ/T2P7sDYjCGO6qs9/uuej53Irhpn2BSi?=
 =?us-ascii?Q?11KBLhC2p9cC0tVsUqwRE8S47PziNS9xS+ClXsjA6dbyx/4GCFOdyYN43zk7?=
 =?us-ascii?Q?FwU1SGTAMdovBd+SqaVKYoXlKIvclK2AjZu9T74oQ26seyNfx9U3TvgH/tce?=
 =?us-ascii?Q?VjUi8N9A2mp8jp8DsnSxHvz4phmfwaV358nd4uUWQ8HYAaGYL781oUUvUMWh?=
 =?us-ascii?Q?oxbq24YiZZG028lDZC1X7m/1nOt7rWp4dk3cLxdj+aJzBWH6Jdo1bs1inQOp?=
 =?us-ascii?Q?AOOuqQHOeT6c9fhz68y1VZivfM3JVgdeDQyeSE6YJpwMFPLvYqp3gvlwWo/P?=
 =?us-ascii?Q?R3UludDPUnDZ4pkOnQocr0WrYlMRwDXoi7l7OeKIveRnNZ2Cw+5irQancj97?=
 =?us-ascii?Q?8W1c0rbcV8cYL4p50Rwb3CHV9UlAWIynOToU27O7Xb175i8mKFqlxPgPE2D9?=
 =?us-ascii?Q?wVfxsLzmR3q1ldid6+d62pbZbKMZCmyKsXR4tOYsiJoWcszaz7bFlRMqdjgT?=
 =?us-ascii?Q?XorOTqDNW7YYNuILrFVdh92ZdmbWvcCOQnl+2Xx7V+01QOtRx06Q0q4Bm5SW?=
 =?us-ascii?Q?nLEgfdTL6EX7whX4O2Oy4lJP074JU8DlBsGOoJz/XWXQDYAHattH0KhkcWVa?=
 =?us-ascii?Q?rKVXPzwkTtao8egC/wqz+XiDygaRit9hcfH1Ypszmhan3i6xAaBliWsndXSh?=
 =?us-ascii?Q?JtnnolPdwXDj0BkFRGcCurXT6mul2kLF3EPWeK6RiIhKVRnbQZGm2SVzUaBe?=
 =?us-ascii?Q?U5R62dqfytUGB7j6gCl4jnm3hr3eMYXTCXYL3VSlQ5Zep3IXNtNOpj0vOest?=
 =?us-ascii?Q?V5xpBa/jnhK7AplKoKWuytNSAirE4fwsl/jMQr6TD59CVIk8ANnIXI7dsXk2?=
 =?us-ascii?Q?0T3cSFiw2SrOp+6CvWgFYMEDBgW/BhL/QBTeXBSUafkh/RXRx4zHfjJNlxsa?=
 =?us-ascii?Q?ztWyl7NcgiGzSWZX5fRhI/aUguK87Uwp6pjuDdTpxfw6FeUyyliQ+olT6jg4?=
 =?us-ascii?Q?9TV28QlGNEg3dPnceVOydl5MPDBNBvk79Rh5Mukxy2LQqbN+DVtWQjckcOAB?=
 =?us-ascii?Q?B1oM6VWDWOC1qJSr/Tem6UpQBaxNBRA0vkYzNXXucSXXn2BpMVoXOwVu01+v?=
 =?us-ascii?Q?n2ZHhNGt1HLWlP8y6+NPIDxJ4ueXj5YGL50ASJMMhRPXCKzrls9Pd9N9nLHE?=
 =?us-ascii?Q?hhTgkixBbgH9I9QyRrsZv3d6ieVo5nncytcyo6nFuO4Vsy48fy/lGaR+ozgv?=
 =?us-ascii?Q?CkKN7zSufBoAShjSwses5hks+YBdsaaySo2/xaHPFqsvWtgdTx+PGSOAY+m2?=
 =?us-ascii?Q?AWjxcG/Alanjxqe00uZIIVYEDCwcBhf5TKsuPPrfrjyJIG3LBL4IyHcAAUG8?=
 =?us-ascii?Q?9aEHxCHoZyNViLEaJgQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:18:46.7091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d9eb72-af8c-4f9a-c5ef-08de27b139ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4932
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16809

meta-arago / na / 20251119205618.81958-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] check_yocto_rules: Add new PV-1=
 entries
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 19 Nov 2025 14:56:18 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ee32126a98d4d525bbceb8bcdfdb54fc4=
934a4c7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511180100
- Commit SHA: 82a437373896b01cd89d456dcc9cb28521b64ac7

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




