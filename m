Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2717ECD9B0
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:56:23 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33650.1770332172115101228
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 14:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Tyb9K4nh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.68, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVNX7DJ9n8/xlWMiy1MNPZQLtwS+w0LfYKpUwF0ncA2jQMOgyjeD7g0f1vRKH+n8bPqKiPd3z/Ty5Oob9kN8+IGHVcSQSpI5o+DzK7kLbrlAdDj4gLqwtGJEQXOb98FCrXzT1hxDVDQrL3OoIJn4BfnzqUmZyD5I9WMqk77tff/Rm/OENdvQrJgAC34HAJWMin6VV5A7zzTK/nT/Ko9zYLpDEVplqdf0DAQXpsHlJYJMCHufC9CZiA93GmivslU5wxKuIwDkpVEJDDZymkz6OXM81Dt13FUuwOyrDwmEvAgt0UGYxSfM3X6E94S16qWUGKIxxcnPZLyaY2b/qwVBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVsX2KqQYBLiCS6kmiu39LuGiTectHie73P1J+MckuI=;
 b=Ka8oIPKPv5tOw/5ciG2s6BHzR+cEUizRHHBD56p3hm1fAnS9myUEhAhjEEh+Ouxdr0zpkH0tOHaGTjKsey8b0t1LdIt8cBHGu8ZXarPX6EZNrXTSbW+j08KGIgH6Fjb+acjJMouA863TaHlUd7MPYHD83mWq/t0cAPfnHuSCU7PIXTuw5uMtx8CmrUFkG5v6rPpTdZ7ReTtEiWW9m44jLqFb7qYYmKtM1MFL/b9XkPt66Ulkh4lsOE8MrTW8su/z4e3IjHMWdzRBNKUkvpUSvzVGIsNfWN2WLwsPekQoYuaqdshkrDw4PfSkCBSW6SuSJ4YJHymWPydrxBmYXIsGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVsX2KqQYBLiCS6kmiu39LuGiTectHie73P1J+MckuI=;
 b=Tyb9K4nhhC+hGCmQ3qo2kxqcqBB0gYyD+QXJvfweBh6yMU8kUlbAxefX7gzKg8ztT22+x914hXs80Vab3iEtOEmzWKBhWpUuYAhzmJ+4YeE+E5nn544GvOSTwHMUrJ1b2y6TF62HWSjL44CWfqu3iLyiCYoQ6kE/nCouEX3qZ7Q=
Received: from BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::15)
 by CYYPR10MB7651.namprd10.prod.outlook.com (2603:10b6:930:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 22:56:10 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::97) by BY1P220CA0004.outlook.office365.com
 (2603:10b6:a03:59d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 22:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 22:56:08 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 16:56:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615Mu7v3034061;
	Thu, 5 Feb 2026 16:56:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH 0/5] oe-layertool-setup: general clean up and bugfix
Date: Thu, 5 Feb 2026 16:55:24 -0600
Message-ID: <20260205225528.92769-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CYYPR10MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ab0605-2856-4fbd-3290-08de6509c02d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jfaRPqwAQC1BerXn2FnTbXFRdF8htDUGjg1lo7esce0vCw0kvtKdAeQPGevT?=
 =?us-ascii?Q?AR1XZLlM9Lxz+22oP3fDytpwjhE/AOsHhbChFk72Lw2Q9OdLjRmtmXzppFb1?=
 =?us-ascii?Q?vDuf81z0LM0eT6RqPI+U4XwDCFpJf/1VFB+qpItbVhxyEholj7FB9BTx74LM?=
 =?us-ascii?Q?+2ZBRJV26OUU65K0V9bC4WEDBqeR82c6/TMcKUlMMx0TC4kF9kZJBwtsYyGR?=
 =?us-ascii?Q?1yCJ2CyFJvdZE2reB5auN30cc4b+Gt689bOOmxC6/chIDb4Pso9DTWsLcEvo?=
 =?us-ascii?Q?+vmP3jdwsD3cAhMjpj6rKmyTKXyFuDMhC+OD7Jaqr07bMulzc60qVG+n23+F?=
 =?us-ascii?Q?uWM949I16VUGXiKCgMlxdY+bGwrcPfKNVonwPv05DHFAvtBN/ZAGX+WzO9CB?=
 =?us-ascii?Q?UEvAfbXwoaAwFzI5vXBqH1dlQEf6N94kB3lHNkgYl/gEyBtyi/YHfxacJctY?=
 =?us-ascii?Q?2cYVn3saqE5tqFozbMWqcpytt81tU/+dvi8VHLnKJXm0fT42io/5QJYiMCjz?=
 =?us-ascii?Q?OZWpibiG9tD6iFFR/lhXEazy6VgLkoyuzraJhQB4CfdQdRQtEC1hNzKhaCi5?=
 =?us-ascii?Q?VP222IxwTqlG0zN7Nmh5W9g7gQcijRiCR06TWph/TiqUGJZGbjcELlvtxKoD?=
 =?us-ascii?Q?WrU9bKVxsIL1g+tC6vuhfWiE83HZk5LiC/00x5qiyQ0Uum4bv4VvuEGUakL9?=
 =?us-ascii?Q?Sn1oG3y3Rofwq6tlvmn2zu7eurJ8xtiJLnIZOGYPWsN1w5EVtPZ0LGbNZzYz?=
 =?us-ascii?Q?JSqqx4Qn21lwxvLi0ZFCeO6Dx9eSwk6WHWZ8Ytv5RiMcSMKgZkBiT/r9/aiN?=
 =?us-ascii?Q?GsCJ2dt0GOZFoMAvPiHfk3zQ36Zgw5YA5PwCQFWqsytrKw+pMmQynieFuMzb?=
 =?us-ascii?Q?DXh0rw8+hez874InPlokC7ftjvXMSt/uM2ZfTJ7EyAUIcZzI/Xe4yuhbPcbY?=
 =?us-ascii?Q?zm5Q1JVw8V3W1G4NkoEHfqyL6y+VEjqETSTxvN8DUmB/i3kq0I6VsIVol+5V?=
 =?us-ascii?Q?ADeSlbVzDzRlGxbpf93L3KtNJKR3lvPTSNhObFHe/RZI/KhI8Z5dp6tIVdew?=
 =?us-ascii?Q?65Pqwd4bXFpM0WvIzpG5LIozgkrmxplfDxzpmdMgVqT8Xkn7McY8xKPPvuo8?=
 =?us-ascii?Q?fhBOooipqu5gL3oDOObvhoeB3rbqmX+zSw9IYOmJwbpM9EbcTdJaE3SKMzWv?=
 =?us-ascii?Q?ukzjPDDHigEdECX39c16OoQt3vQzYHvLQ1o/gqZR8g2CqOKbqNqfxliuo+du?=
 =?us-ascii?Q?seJdFPwiMwLGSqkX7GWNFpD0Jg8gfpsTaT1OFwSKOSxa3r9OZt0NyXwJqcyy?=
 =?us-ascii?Q?QLsFut4udhM4uHNTaMtpwzcSXCc/qwjM3qBOxvKxGnBYFRf71QJf4yQBAc+9?=
 =?us-ascii?Q?IFYYLjLm7pDN3Qi8yYKoAsnsIDuvWRlqtsNSKGb5P3RUjYGKz5aHZUG1Ks3R?=
 =?us-ascii?Q?4vUk/cdoH29X9INgtkzjDdnPAp0b37q+OiI4w6ThIc4SxTe9sWaBwdSut6Yd?=
 =?us-ascii?Q?LQ8/BdI6WDUY7YwABgCWC1uTihoWiXujw8eUTmXRHet1Cb+JVn0tEHkjk1YO?=
 =?us-ascii?Q?QpMi3gwl2RECEIz1iFnUkwIyTWKgAsjRY3+rRICQ3NpJHmm7OASGQG1H4HZj?=
 =?us-ascii?Q?ShamWGyvzVimxqT07Rnuo5QsY0hfq0z3sYTIp6esjQeOKq3zDxI3829BggvL?=
 =?us-ascii?Q?h+T1AA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a/meGFctA+/qq2+5379g97/63QLgqpl2NVaLLguMICfFP8eMpi++k130yehuUUGL8GtgVBUJSrpJs1Ltk4tsUfPfIKGe2K4vnvb3wSvvfj/ASUcdahF3GAgwsazMU0VDrWKzwplq+vsFfQj1wuZ5IMWWv81YPPithjiinmrbOmJZnpUWQSIH3j1BvWWbHq1ifSZRrcAgozxyqanEzBj5oWzGJjE2gGylLLT0zjjdGg0LoUMI67V3BO4H0j85/uaZ1S9qD80VtOUvn6m8aoQsvoV1wxRXQN+uuoUBjcAC9zU2l/zVkHruMX32C8Jz37pBz15N1j3vmb2uRFqCSVZpZFNDPlHJbd9erBx3zDy6E7YVgbnBDguRmyB0c+Ny/crSqAEq66+la1xPzaMYlXx3DxDV1bFFF1LRr7H15TKr3bpuYMlFayyAKIiL227VjYhc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:56:08.5164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ab0605-2856-4fbd-3290-08de6509c02d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7651
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 22:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17088

From: Randolph Sapp <rs@ti.com>

Fix a previously reported bug with checking out local branches that already
exist. Prevent infinite input loops when no config templates are provided. =
Add
an editorconfig to prevent erroneous whitespace changes. Use git to trim re=
f
parts instead of external sed logic.

Sorry this took so long Jon. Completely forgot about it.

Randolph Sapp (5):
  editorconfig: add a shared editor configuration
  oe-layertool-setup: trim trailing whitespace
  oe-layertool-setup: fix config template parsing
  oe-layertool-setup: fix bug with branch checkout
  oe-layertool-setup: use git to trim ref parts

 .editorconfig         | 15 +++++++++++++++
 oe-layertool-setup.sh | 30 ++++++++++++++++++------------
 2 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 .editorconfig

--
2.52.0


