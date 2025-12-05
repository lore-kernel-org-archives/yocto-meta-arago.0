Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E42D2CE18
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 03:31:52 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62158.1764905505934772673
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 19:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=dE4jFD6y;
 spf=pass (domain: list.ti.com, ip: 40.93.195.44, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9yWSH0429hDdUpu5gzhszd0VPpXs7eilduZhvHhk7jZf0KzMljZ88hclMi/nSoXXJwiG1I4IiPMxHnr9fRA5OSgyY52FDFzPA+IJfklCX+79RJt3HkdGsRjTNN1j9OUbM1c/rZsMOsLwVd9Gbo1SCxCALieynNL7vnT/48Wd2thlbH/p5wZRVIvWty0PcMG72mLstZ5/5vBtAhl/TBIjExK++ozxEoaalwxzKx10HeuLGq4kkZ8zMw4ntsD0RINV/dKlA53NvjlYNW3lkxO6dSsEHqdEaUFDDiPxr6odM7vjAs4BVDBaFZL6H3TB766tfw+CkslmQowVEFhsYvt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cutzTxOZCG3G9uJsE5j/sOpIyrhZWDYqHTwkzZnm0ps=;
 b=eWZcF2SCjkLquuc2ckeTbUv48qmdpQdSVR9l/lhS/LLQkTT01WFIAiEJoVduHd9ZmNi1Tt/38GgBCCA6zfkwoutKO9ut+kYfLtF4UlEVioJcG9GPd2N4bL6Vk1ElpxBqFd7TmHTzloRGO58/dz23W2l2ftquKv2dyjysN5jxV3aDuIa/FXPITz0AnCCWV8VS8Rd6lVLbOMTWACgTyxpVX32x4db9cvJR0tEwzXUzLbSLv5y1a8yGwBPoiYRedxmMqTViI6/vUMYtWZyW667vowN2S8WOPqjwB9YdDKOjayluqoZp7ESQWIGBVxGpEQtIeBE3KYtdTtY6aAHB/7CUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cutzTxOZCG3G9uJsE5j/sOpIyrhZWDYqHTwkzZnm0ps=;
 b=dE4jFD6yHbtp3YbvSIgkKZZviCsd6VDl+w9OYgOyQfBK8bR85Z3NWvGLrdx3K7gp7W84bwXESVtcy/cTLdDYH5J7AiZ5Bs9/DfFi41A6uO1cAlGxxMOFHvOmdKAvJM9KkBylOz6PX//tHJbtFCSo7gaTuE3RejbsrTsvaGQF895311fJFTVpNqXnMkEDxzG8jsOBt174x/EuWF8vq+9DkBDC/kFSZCHTpuLM7OGxrpjnU8fa+wp7Raf68pWD1SVz2kZE8YO+uHZh/B6UZ/EVV49JOC7M5qNZwW9G8fJHUITf5SO8qRvwUSHDrQzfykCObZJVBsKl3f4/sP1ynoXmOQ==
Received: from SJ0PR13CA0076.namprd13.prod.outlook.com (2603:10b6:a03:2c4::21)
 by LV8PR10MB7726.namprd10.prod.outlook.com (2603:10b6:408:1e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 03:31:43 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::a4) by SJ0PR13CA0076.outlook.office365.com
 (2603:10b6:a03:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Fri, 5
 Dec 2025 03:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 03:31:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:31:41 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:31:41 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 21:31:41 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B53VfTX2632494;
	Thu, 4 Dec 2025 21:31:41 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4CC8A136F37; Thu,  4 Dec 2025 21:31:41 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512041635
Date: Thu, 4 Dec 2025 21:31:41 -0600
Message-ID: <20251205033141.2914646-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251205030511.1803916-1-lcpdbld@list.ti.com>
References: <20251205030511.1803916-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|LV8PR10MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fe9d8e-7858-41e6-15ef-08de33aecf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MO6TFXnZJmc/DdT0lx9YM7gDur0N1Gw2eWkirei9KAknKExK014dnXr0yKGu?=
 =?us-ascii?Q?yzA1nPsY6nANuuD0gnv5UZFQztWveOzxGbE8DSfRZkv0rMPFklRQ67PBo0GM?=
 =?us-ascii?Q?+JXTTcu/5YS/EAv+523z1SHdTlTwJ6uxmrSQfRxyNJ6FV751IvtGRM2JBEQU?=
 =?us-ascii?Q?nrLC4R9yh0feGzTQvjQmIw8srAL6UGxmCC9P6g7Ih2OS3uQiDs6YqKNw/fJo?=
 =?us-ascii?Q?ZaMxXFLp/1KAvssTdslDlkODrvTmYmLCj9+Es23PEE/q8WzWo7qsR7IAleET?=
 =?us-ascii?Q?6lwpCRTSJg1Ksq+GHQk5VbJyw5xMZWxXvJxAT6VJBRMD+KlrkuhlqIzDzLVa?=
 =?us-ascii?Q?EMwDz6HVbBvHgH1dYgJVCznpwyzeiZACDkZdYzK9cKESTdGGy7mcF6bZrgRq?=
 =?us-ascii?Q?nutSftTGO+Wv2P0pAkQW1IMaqbNHgixiLR5oW6ujj/SKhwQuld7wzDoOl1E9?=
 =?us-ascii?Q?5Ny3fyJaTC039wffqVYhq70BR2Xrhx05leJrsbKRFFuL+sK+50dcf2m9tcoO?=
 =?us-ascii?Q?yOzX+UG7hsGQoPRsVwVAQL9PFTJFY/WcYDOS1YvnrCFI0l2BpG3/5S3MgRLJ?=
 =?us-ascii?Q?t/Kd1iOEuqs3NhNoAHgJQFluVVI0VqSIWNIJTjarYdWISAJ9yNs5Hc4X9wpv?=
 =?us-ascii?Q?P005DECFmDQ1QPEkdseI/Vfuf0LUCB2LhbDW5fq+X/0BoHQ+sl5vnxg3Au0z?=
 =?us-ascii?Q?EJgqyYhAow0rjGsVY4QN/xbUFBzVUIVDrVKtBtKfLQpTulT9Kf7mo43p52dO?=
 =?us-ascii?Q?2RaAB6sTUMawh0ogcQdYHSFEi15UbGa0haQyjwOkNz0MpT1WWSP/bebnXfwu?=
 =?us-ascii?Q?vBuTJjoVODlp4FtKI6INmJ2L7m+IESxcWfmCMVaiLV1T56V1LH7LlQUULog8?=
 =?us-ascii?Q?tTIiCW+bFNJ00RH+F/hCcEdGtlZBajod91x0Y9ZW3YIZO9J39aydiLhtIAHG?=
 =?us-ascii?Q?xPbEi4eFzhPf4a/k1tp3rv2/8bqUM2XJkK8E1k9CNsJZpzs6JbV+LXROBEU+?=
 =?us-ascii?Q?TZnyUPLYhzsRQM3vl8K5v3GyDDZ1wHbc67/4RsZHn0fhWJVpjqmHM5QBiiCW?=
 =?us-ascii?Q?l8VDQG7dia8/WPKGv5K/iptGXaetEU0qdv+7+lise8mmER6mzJarZPcbFbpl?=
 =?us-ascii?Q?iZYbh4LneLDeu5mq6/3oCbGXOyJRA4V+TSy4xbuPv4WJFu91c6f0hYVuEXnB?=
 =?us-ascii?Q?D+qyIP2FD4aHs9Kh1dOE16Zo4/vpNmBAzm3aHX5ZbwKly+O68lrRYpFKSmLl?=
 =?us-ascii?Q?HEDyRyqMusQqbyRYpAk2XzSkizXMQoENo5jEDPm4HbW3ZHngA8wM6llSuBga?=
 =?us-ascii?Q?2jM7zdXgy4Lj435JugZtZ5AlPX5DhMR42zqTpSQHKRTZqCnsbh+iDhaudx5C?=
 =?us-ascii?Q?0O1H7AbX2VndEjWz1Cz2GyWXD8LyYz9ITJ/nXMIfmGBjCl0cmNBDYgxR/gM6?=
 =?us-ascii?Q?mopG4Wu7TCqIFFkjiLAzmD6s85cSc/2tolzsBQWFXKNDGTG+9yseHKMp90W3?=
 =?us-ascii?Q?IWdtZTauvAmcvbMusdild6N7DWpeuK/7z9kjfBIlAXiQI4vo+zs6t/t/lukO?=
 =?us-ascii?Q?dIkfRyobK7ySjtMuFyc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:31:42.4583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fe9d8e-7858-41e6-15ef-08de33aecf26
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7726
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 03:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16862

meta-arago / na / 20251205030511.1803916-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202512041635
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 4 Dec 2025 21:05:11 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 69ce07f0703df7c927d1b549ef2004cda=
3ea2df7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: arago.conf: set preferred runtime provider for weston-ini=
t
- Commit SHA: b7b35635b6e6c588b52b21dd0150bfa11db3d0cf

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




