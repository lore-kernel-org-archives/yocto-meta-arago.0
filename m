Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FD3E81BDC
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 16:03:10 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50716.1770652988072276092
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 08:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Qb1C9S//;
 spf=pass (domain: list.ti.com, ip: 52.101.43.23, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo7ns1Srr9TPg37DLqXtnFKKk+6qYKluYb+deqb+5vQK3sIYBN5FD39TvF7pL9rgPimxHXRo1c68iAmlkyInObWBAjFQcNrnhK7FxxfH4I4jMeFhGzHnB4fb4NcmFdwfRsWdjgcMHBRPypyCTds5kpj/cup52q80n729+Of7sROclxT+LK//aSbm3yPcAjlLNaioMtYfdcdGGTdE7tSPRhzumnEaqNk0b+NJvK494sdh0X3bsHeKbCVYrAaHb5vc+Z/X5S2CQ37SsT0fkgXFfUCX6FFvP9RAXyK4SlzfO+9N1X7ZAh44ZV7qDpySgcWxNql183OBL+QkzKNR56soHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaOgsOYYndFDZtO0Dhl8mE7s8DVD9dGUjF7uMZ18+p8=;
 b=U+GICAYHoFXaNCl1iYr0S5gLFe/eKa//+nhIWXSOh9lMigohjEm+XS//z1Y0XTWgNxv6qUtJiOCK1jt89joj7TkT33baBmKXpuoUXLhpVl/hot/zt3mq2W6RHPV2J9dlzAxwpkYvLbroLS7/rE2I2n0c1HsKD98Z5YMF827o2kCfrpA3iZMqWeJ3lz/3FL/2QsiGawNil/o3IUQS1kt6kM2Q5V0CUMh+ykOUt8W5+As8JM/lsQNk/rQGPaspuP+kMdCfoAr907XiqP1AD0JI7irVpQJk0uwpRrZbdZfUYcn+JzILFbcEqw8RRG+/sZ14jhQqLWKQe2WNcOaHX243yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaOgsOYYndFDZtO0Dhl8mE7s8DVD9dGUjF7uMZ18+p8=;
 b=Qb1C9S//VH/gAdQW47h1AfggDxZiNm3QrDFdoo0BGl6aEd/tW++BPnsM9+oD9vEEhDls9q2gHbNh2FfLotGhfX9yXVhYnnLm8UtDAIaB61/GhS200wgLpEMa4l2Yn34HP9Wd2LuhdlfRI2u3TAkT7CYBH5nUK0fScf0CozRXqFJDJCfJk7Gpf5m22rsNoOOIPN6Bih/5Gr06fwAfdERskCiyQ+qdIL6lrE+0wvP9DBk0FrhcFEt8O5moIpBN1Gn7DQhwVtJ2KTtsO5VP756vCGkASAa3gqqtASTVzubrOJm6m+4FiaCnE0AapslPfJ6tfsSFYBi/+mGYZjDnexPuIQ==
Received: from BN0PR04CA0136.namprd04.prod.outlook.com (2603:10b6:408:ed::21)
 by MW4PR10MB5838.namprd10.prod.outlook.com (2603:10b6:303:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 16:03:04 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::c2) by BN0PR04CA0136.outlook.office365.com
 (2603:10b6:408:ed::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 16:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 16:03:03 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 10:02:19 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 10:02:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 10:02:18 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619G2Ih81845981;
	Mon, 9 Feb 2026 10:02:18 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id CB072142E2B; Mon,  9 Feb 2026 10:02:18 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] open62541: Remove backported patch
Date: Mon, 9 Feb 2026 10:02:18 -0600
Message-ID: <20260209160218.2642756-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260209154655.1263211-1-reatmon@ti.com>
References: <20260209154655.1263211-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|MW4PR10MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: a99bea83-2d88-485f-84bf-08de67f4b4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3BeyOZCF9CkDZ2XjdWGAhlCXXXQSwp373kuWv0Rs2UpZmZicltQfj2tzYUIq?=
 =?us-ascii?Q?HQcYbLJB454jp9Al2bYgRWagxWVvpS61wjdF7n0TEreYIwxBySV1ezZ8RHnM?=
 =?us-ascii?Q?ruSHB2JMWG0n7sqoAjNbl7nPtvXiouKTQ5hzMlBIEtv6PsH+JGpA3fNlVhpz?=
 =?us-ascii?Q?zUuvE8RKAg4tf+V8RJMzKbrHuN1iE5KP02IXvXyNh9pZjLiu6r8SU2mmjPoT?=
 =?us-ascii?Q?DHslOFisRZX38CaTmVD6fMrAe9UHuKv1mZc1EuFEigkT3bhU6A4rJHPgl7Kt?=
 =?us-ascii?Q?6W9J/YNnaCy6qzDx9uSH52ms10E70Ltm0gyV+ZrLhf5RtYD0WWeRGiuLeyVm?=
 =?us-ascii?Q?GlYCq3jKGsOGyD3YAsLbHjFls9ykQ3WEld7NnJ5qrg4QJltRqrauraKaiSTq?=
 =?us-ascii?Q?5erkEWE+pU2P6aC4A9vn9AxxLjGKlovo+4PrUuH57Nrz1/yrUFFWNpH1TYR8?=
 =?us-ascii?Q?9uOkhBTMuqnvVc1t1eFKZ0pVL47QljaT1Sp+VeuYhcUJzQej70sJENdl7hx0?=
 =?us-ascii?Q?KInZUnCGAGKedL9sVIspM0dAOy0qEc36xEGYEMXdUf1fXWuziuFtZNyE4WEt?=
 =?us-ascii?Q?iFMW9jc0t1f1iBwXLDjzzXVM2AoEIrwRvdlHr+GZ9LaJrAmuIvWtVUs3GFp/?=
 =?us-ascii?Q?pj+6K0rru5oYNwFpC1Gg7BWKQoSgQSZ//gY/vg2J6SSM5/4nSOMDwwMe5AjX?=
 =?us-ascii?Q?wHrRkVLt3DHnQYJ5LkXhQGhuiiWsUxRv6xixCLgu7yqdZNgInyy0FSS/SqO9?=
 =?us-ascii?Q?ONeNBKjnlYyQ6y3qAWeacwhujiNvR+/sae5HsGnSXUkvcWXpvvoGDHqKCEIc?=
 =?us-ascii?Q?EfpqDGVI/oIlZ2jPh5Gs7s2tpuMqt3oNY7cbiWQr5o//UgR5Lsrf/atLsY5G?=
 =?us-ascii?Q?6qlRfg5ZuwgQKQMmmqK3wvZ4kqrXiJFcDSm+w0SbY0o7uFeK8cmG7D6sohLt?=
 =?us-ascii?Q?taquWbivNMFS5gZM+CWlUgU/9WZUX1dxTIAudeqysv5VadoAYHEoEdWmtkaZ?=
 =?us-ascii?Q?ASzvtmQ4pJN/i855kngCjX3A6TgoVKd60SdqhumjlxUrUKlyjPaBmThi2Azy?=
 =?us-ascii?Q?NLt5gSU89dug/XdU5EflJavLPhZThnD3sfiHiMZKrNcVFs7iEqzXcOvyfCQ+?=
 =?us-ascii?Q?YoQKZ5ybfDnVDbZnxD6pd+RkNsuOWQJC/q/CCn6TDisLh5DZ1BC93ZZsqV9Z?=
 =?us-ascii?Q?ElfGsTvweEbgl7op9M+YgQlhu4xQcOVdNhIUowyiVD3XUu1atmHCBiMpOI6g?=
 =?us-ascii?Q?7pvi7d8eftoL05WuWIAE98wz21A6poa/716niBCkmEsKdMNnP71rPD+hvwlu?=
 =?us-ascii?Q?G5O/g1qW2WiKyKwfOda6IMpwGe8wWZFFVte8rIg8c3aB013tRfml/17QdznR?=
 =?us-ascii?Q?x/Hn3AbRsBV3gCiXoCfSe6f75U6ss4L0u/zpOSMcaxXHRZW+MPFJvSxjU+rd?=
 =?us-ascii?Q?aqOCQGH5BMHALen8aSnskQZtwXJvfsQu9UsmMp4U7yDTYJ5+cgL9ayBzWofs?=
 =?us-ascii?Q?YgSAFWsVEoht3P1Z6QLH8vYlZqpGwdxQBcJthMp32sf8HBGs6YHFPZfOFlHR?=
 =?us-ascii?Q?moiC5pHywibhJZW8umjTMikfdQpqyPqpL/v25l3NECm6DV9WqnaP0kXYd24b?=
 =?us-ascii?Q?AtioSQJQP3v/nAMphFRcp4kTWV5i/8dFgQSVOD5gGGq5?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gHZKWaoWBqDEKKx75NMpSrJ6nUOYXSAYkPwqZODAG0GkstL5V+6G9rnJYcHScpM+GuWWT6wy1zn0mgL4kEkMWLS7zIUjgaYe6x2GZWVUkgCfJA/2VAHs8d4IOWkrV+wgIp4WTSQ6VvICeUH6e9vj0V0L9FnucsQvX1GOjLtyDFJro3iZ6oA3Gg3ny0lPd//J3uR7/THtdzhG7w12wUI+4SwoYmI7O74E2HNINvWbpWauiNSMMTvyD6j879Au2PTWW5MpU/MmMK1psi8WYFNFkajziBLY0JOs58AVylySZekFuMYZ1c+c6R865jl85gHCbLrgZpoq0+KvCqkY+EX/bfcxvsR7uTnM+fx21MZSJYcxRKMVxv7FAO+XoWnCKtcOjttlH3mbTEp/ZK8q193xIh0Dxi1DylrEgxPX36MIaO9bWbKT6GJavcdD6+TqUZV1
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:03:03.3210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a99bea83-2d88-485f-84bf-08de67f4b4b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5838
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Feb 2026 16:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17094

meta-arago / na / 20260209154655.1263211-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] open62541: Remove backported pa=
tch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 9 Feb 2026 09:46:55 -0600
-Date: Fri, 16 Jan 2026 16:40:07 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3b61f7b3bb399f74d805f46c97ac94def=
5e36f1e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
- Commit SHA: 9dcf888bbe0d83aa2353c65832c67cbedce028c0

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
ERROR: Multiconfig dependency mc::vruntime-x86-64:vpdmn-initramfs-create:do=
_deploy depends on nonexistent multiconfig configuration named configuratio=
n vruntime-x86-64




