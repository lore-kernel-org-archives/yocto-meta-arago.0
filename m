Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14244F55421
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 22:54:57 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33370.1771973693400487106
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 14:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=StGrTKE0;
 spf=pass (domain: list.ti.com, ip: 52.101.46.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R03LQfzseeVadCg16CwSz/rXq8R0+AslTq/tvaqPb4MKEaWX7zGIywijTHL1k9xOmxu1lMXmrzvePwLcpRwkgispFVMJGtSRpE1lsdQctn5B9OUip4Q2rhgSwjcCB1ZhRn5BSbQMKI37GJF2E7VvLco2vKETPOgVlRWPILjQkbx4qCWtjOAOqr9MjH0LzoWexlm/zpWzfD/h/9If5XAo07RaUgPcJULirEvU1/g9/cy483b4tzZLEC0wIpMcCH5KmA3OJv9OszQ2XZAWl5v17TFXnfPDReI4jk73I6veunlZYzDk83/zTmXwrtvbbYmaEOfQ0xcX59YFERLuGkYdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRMneEavUXNhD/BXrjbIzJbKOcMiXiVs3S9Qjb+k1VY=;
 b=rqo/iZBA+sg/1uxmr2bjEeuCBL3FtLZrVU1urSLyZk0CeCeLs6X6Ep6N/R9PNKHOHxx/vlQNuTHFjthAchVEBcuebVOyg1kMWCyhhUxnpKc5X9+mCbFvwmN0iEmvL+eeF0421WS3m+TnH5Jeq5KvKfAS5u6AHXk9/g5iILOaVS8dE7uFZOaDtPn0DJvhJE8tE2B7utYowhRyKDMkM3CqQXAwpqlMlwQKFJnIk9buVlY179QrT7MlLxOwRqkt+INsqVO8FB/g2gTNn9GLd8WNhkE/jukMaS449FWrTbzLCg3+MlBFdBGhHh48RaLBFxneEFb8d2xwqBjLbP7TI4v97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRMneEavUXNhD/BXrjbIzJbKOcMiXiVs3S9Qjb+k1VY=;
 b=StGrTKE0TzWo4OkPKakvT9iEUble1Mz6wtqqHtxYTo2rA1LkYWAqWeV6U5HCaUr0lfWcRpTMnoFx5SDx3y/5j28bJKqht72txqbkIEalLAQ/q/OL7CcvWy5Fgu/80XS6eCRD3zE5G3PGqXsIriUOUMITJOrXbx46JW5FtqMUjVpEXkt//yNkQ8ucNU5U/Bq8uMvsIkObRRCkYmArgGuaxQYrVvDYIm5uUfTNo1uV53COJf4DTOAtj6sUJd/HDK78wnB+C2PSr4WE8no3a/pTgFDn3PIxav/LBkPJYKyjQNyJCJiDx/SbB369V/y9hBRISmmGRrcNvqlup2b969g9hw==
Received: from DS7PR07CA0017.namprd07.prod.outlook.com (2603:10b6:5:3af::14)
 by IA1PR10MB7335.namprd10.prod.outlook.com (2603:10b6:208:3d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:54:47 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::6a) by DS7PR07CA0017.outlook.office365.com
 (2603:10b6:5:3af::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 22:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 22:54:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:54:46 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:54:45 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 16:54:45 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OMsjHG458118;
	Tue, 24 Feb 2026 16:54:45 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B7AC92A5C; Tue, 24 Feb 2026 16:54:45 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago.conf: Remove duplicate include for yocto-space-optimize.inc
Date: Tue, 24 Feb 2026 16:54:45 -0600
Message-ID: <20260224225445.4089054-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260224223148.1564416-1-reatmon@ti.com>
References: <20260224223148.1564416-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|IA1PR10MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: c06579dc-923d-4c69-408a-08de73f7b50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|34070700014|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iwxbuCH2OcGMlTViYyYm4Bazk2Ut9MFJGbX1EBBmflj/q9x2YiDMp2VkEuS5?=
 =?us-ascii?Q?aeSRxL2iaEgr6V/SuwxhbLgdW5fMEpLed4GgjmTNRGRn6wBMN9VPc6FOBO+p?=
 =?us-ascii?Q?INrVyVLLlT+jARu47ISO6XnwgllBfzi3MxkOBst/n071YDE9mBfIfPuVjBYL?=
 =?us-ascii?Q?Cy8pLUEWJXRnd3NWHpDdffLTErGP/OMwlogbmhPne38xZ/dZBhjihbdFhDtT?=
 =?us-ascii?Q?8K1y6UUDyvJvpGQyeJvuafdRnEBaUFWwHZBgdhEnadlQJwCQT2OlSrdRNKbL?=
 =?us-ascii?Q?6Kkp1AN5zFLXmBApWil21EWakDgqTgJMsM1swaoyzQlyvoc5BR7ilN13Qd77?=
 =?us-ascii?Q?B9z0Ucmv6BBlTkzGnabPQKuWvrlCslwRJ7I8TUH5tRoSTHzfH/JLjboanznB?=
 =?us-ascii?Q?i0Dk7u+RrTPr7B73EyBek9sJnO6KvjGgRsM3o4n23/Ch6Uby23RXT1eR3Wqp?=
 =?us-ascii?Q?13R4CuJOSS5bVHj/zTlH8S5VWpr+AlpZso+9SqAPWOKV+PeHxedg40xj9+J0?=
 =?us-ascii?Q?yaXdEkk78GbfiU36/MGA0dnyGGkOwpy9KGySjx4Lnh8WBgRdG9b43U09xkMQ?=
 =?us-ascii?Q?VsbX+aPKVkW2zebfAdDeBNWk5uFmu8C5+q37hF9JE4rXB/dXqd9+TIxJahRN?=
 =?us-ascii?Q?wtWhi0laFPuBEm5mNTpkpsAsb6c+SX/6H5ZGhLU4Y/654FLsxSpqdOXARkaS?=
 =?us-ascii?Q?IdwmaXponUgctRnj2yR7ipUjGKxmgCuPKFPcfKadumwxwV/9bMG4XP9uQ+ub?=
 =?us-ascii?Q?bC1wacWWYNad831+fSgu7qn5CC979bE/0ZOlm2dT2f7Vs+fFZa4hDtnfhC4e?=
 =?us-ascii?Q?079Tyb0o8CaCPPCKCzmjeIx11V+Ke6FlGI9z8CELSGbZIWffZ/z8EFNuq3he?=
 =?us-ascii?Q?bq9zWpoVFILS31SlFoSMIJpx3hJ60TXiTO8qulq7MCkDa9np9QcD6V/12SKx?=
 =?us-ascii?Q?a1LMY01j+/q3Kn7h6dJoBDdOqr1cZRrvGAcPSTkXVrb3r555c7Iw7qL05FYN?=
 =?us-ascii?Q?6rx7849gDAHvc5Xn8xbJVEO8V4Kw2efZT3erY7NVMyp7Cip7L1JdQgeHO75j?=
 =?us-ascii?Q?4SwFyGER1hLWk22ZvemmsjRrV43ZK3qcLE0CMGD+6c44Ez9/r8ZL7h3tA7sm?=
 =?us-ascii?Q?mYrNzRU2IDS6ypiWEVY9D1NOPf5qIvzcV51ZbqHa3W0ln5jekvNeDoOeUzyj?=
 =?us-ascii?Q?kf614x+dGshy0zpQL6q24TlkFjtf61wNRt6K4XRovrSee1Fp/wEoGs74bhvp?=
 =?us-ascii?Q?uiRDz2n9OcG1yTfAsORzEBob0AX0nsG+VLslL6mWB+0lTwIGGrOyMU51erZ8?=
 =?us-ascii?Q?Dt5DGh8Tlif4lgBkx/wFJVn1vfiWg13TJTzcSCme05J6JLWNTBKvsLECz1oy?=
 =?us-ascii?Q?kEgvdywlEtQk8KrsjCfIlYdjvqSDt5aGEq1KOAQ+cZssV6xqZDmz5TUeI9bb?=
 =?us-ascii?Q?JUrpnLy1KGKk+Il714E0u7UjAru9mfIjvrAMEHWsvGjoZWbj0Fm08Z0JzjYL?=
 =?us-ascii?Q?1kaQK9qqv/5qwjbUsrLJ/1bOlRoEFQJvFIB8jOzg+t1j9RpdlyKbiF2yPfxs?=
 =?us-ascii?Q?owSlkezb193HYzDcs+EAUXMNUrvJhm+gcTAonCUlV0qTlR8/BAoXSXS1tokg?=
 =?us-ascii?Q?iWZ9wwko3ltG/AxU2piFqpEuqoj+ySgOjrTXUkRy67LK?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34070700014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UnNsdEQzgIlWQu8N1QM8xZQGgUhB+PkCxpVQNOE2HmajpNOkULVfqfHPEawdsSKTM9G7ZoMUvlAksPsL/4CWTidPHOZX+DOgm5HUT666KwqU9gSPhV09nCU7cuW33U62ua2rFYywNdYZp34M/XbULx6IFraLgujg0/gZoPZOS3kuwX9vYKkUfEgJFu51+YaezQkeX4TgcXqS3RjFqfUZvBiw23Pwk37LLObgQJOTuHjYQOwA0IRrlaXhgPhE6rJcRQuUAWc4+HtGiUTntboxbyzrGxmZAfZh70uc6IVSTotk3PrU5t13BIj8zYO0W7GGQNTe1nyJErqnjdh8QXJfa4XF9R9oUgsEuypZE7zrkfT2HJJXsaOPZG9Bobfb2iRQMq/IPXffZEhON3saOSwfIcBZCY3hLZVRNfqZPQtYT2n1sCAUkEw5oTPQW5S0FnzK
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:46.3939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c06579dc-923d-4c69-408a-08de73f7b50f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7335
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Feb 2026 22:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17141

meta-arago / na / 20260224223148.1564416-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago.conf: Remove duplicate in=
clude for yocto-space-optimize.inc
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 24 Feb 2026 16:31:47 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5ef2099431c5b3a317ea4d1075ae4baf7=
623f548

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: *: Remove unused patches
- Commit SHA: 8e69cf705bbec79cd7380d8ad829417918bf7253

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
ERROR: <build-dir>/sources/meta-virtualization/recipes-containers/container=
-registry/container-registry-populate.bb: QA Issue: task do_populate_regist=
ry has network enabled

ERROR: Signature change for container-registry-populate
   container-registry-populate:do_populate_registry: 1017ab9ec865bb23ed0f2e=
168d945710db8534114212405eb49da3f1b4bbf035 -> 2ee9e0d919c72a5ca495f43238216=
238583cb67182ec5e210a274a371d048261
      bitbake-diffsigs --task container-registry-populate do_populate_regis=
try --signature 1017ab9ec865bb23ed0f2e168d945710db8534114212405eb49da3f1b4b=
bf035 2ee9e0d919c72a5ca495f43238216238583cb67182ec5e210a274a371d048261
      NOTE: Reconnecting to bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):fc1c88=
31-520d-4ece-bf55-72217c3130bb to nostamp(uuid4):64207515-6e86-4625-b108-da=
e5ef703cb5




