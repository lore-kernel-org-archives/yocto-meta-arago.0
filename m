Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2180D78793
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 15:47:20 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19661.1766159238926188366
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 07:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HqwlYcD6;
 spf=pass (domain: list.ti.com, ip: 40.107.208.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOFA0x5wf/fYfC/yCPoSzxEOB4UB2VaEpPqymQtOqdN9T2ILgGxWUJ6nP4ZV3LVDjhuD7J45C7V9L6GfRHFKFriz6ORLgiEQaSkPh4aXyt0h4U0k6yO/UPTgr3oGVN2KOpePnVC/kSv3afCf3i0icl+epDCS5+fdw0ZkOPvzmLD9Idd0SMO3j9iG7Ak+JKueyaTCVW7oqQzqJakDfzbtb6uR3wpj6MZIOIsKFqJxMQeCx8573t4vSlhul0fZqYjM2NwXAi20fSM+SxqDXuuerI5KPNw0MF6NW10Mlg7CTBXXPF0av1gOkTSjki1QLYCgbDG9Izxo2sN4STDKMu2NMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AEo/1PDPah+4eTv1oUQYAZoOZ5ifFBsTmWfwCUM00E=;
 b=NrvN5JV8hBdPlre9po5JmsU8ViI5ONTt4UQVKc6ErGgdzBRzM6L+i97D6PXCGlzvuEv3DrGDg+cRbxNd9N3Vi8ZShCHED7rIT6pFgFETHshmCOzzTm9UBTtZueCB9XKm55Pm0dAwwVI93FUnWzLj7CgziPIhb45lIYo985IkiLIPsl2Y0AjooR7EtRstTw1wkMFzZprNqeJKP0uvKlvKWAD2oilb6f0h46avhRt3liwTUJeoZmKs7fqdVH2P8+FfLCDvUrj6YWVfAjkt2zshxwb5+RjMkdXUTO6HMDlEIEx+CJl8y+YHXRsFYlAU2+O9i5moNAD0IrgTNsxSi6riaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AEo/1PDPah+4eTv1oUQYAZoOZ5ifFBsTmWfwCUM00E=;
 b=HqwlYcD6p2JFWb/55GxsGd6IvHa6nlKqrh2+IilFnHJnaAENddiDHRJMoUvZF2ne90HP++uLnM6I4zNhFNMPSfoL1c9H3EqQQPZ420/yiJk+SXuu3pzpYKu2w1PEXfsvbbE0IbZo2XZnsDoG5NfRRNIA9Q8UBVZxY691t29wuYNutxMPW/0e99t5JN/jzHX+93kgNFZJRwvvTwEt9WwTecEguFqXwYMxHPqKsgvoA5lmeh/RcquobeDeJEHuhPBuZNqm+bAKG4dybeuVBdj1qCZD+hVsTyu21lJsL/p+s+M/WfLCv8ltOg5NNtptifou9m8oMRfRpGKd0bGRAquPSA==
Received: from MN2PR10CA0012.namprd10.prod.outlook.com (2603:10b6:208:120::25)
 by BN0PR10MB4935.namprd10.prod.outlook.com (2603:10b6:408:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 15:47:16 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::44) by MN2PR10CA0012.outlook.office365.com
 (2603:10b6:208:120::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:47:15 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 09:47:13 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 09:47:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 09:47:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJFlDk21079928;
	Fri, 19 Dec 2025 09:47:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E867B9ACF4; Fri, 19 Dec 2025 09:47:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] tisdk-core-bundle: Update trusted-firmware-a locations
Date: Fri, 19 Dec 2025 09:47:12 -0600
Message-ID: <20251219154712.1781151-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219153042.122828-1-reatmon@ti.com>
References: <20251219153042.122828-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|BN0PR10MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f502126-0214-476b-94ab-08de3f15e248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g4VrcR5iLVKWXvEYMeLWoKLA6mwwjQjcrAUDIcfCDlNP0EUUduRsB2wdRCJF?=
 =?us-ascii?Q?4/9iqCHpLTjV198wcmvdmnRdPHJPrc0I2SdbGpTch1XIXHN4evF2utluh9kl?=
 =?us-ascii?Q?zYuwF26k0bwDrXHSqql5y7p0NI4ozT4IL3SA2UaIucqCmbNu9/4spnh3S4r4?=
 =?us-ascii?Q?+KVYS95nCTWAZePjVroEXQBkTNlOQLjODWCdyLeaGV3ifS6g6GqRhrfY7oa+?=
 =?us-ascii?Q?L9ZQjBkXzlevqvCYmPZWLzdMNsmdA24mhqTQFMcnkl4kMZbibZt6kU7Jn7H7?=
 =?us-ascii?Q?392l75WRdN5GfFeZCO2uk1XqP5h4CE6Uugg5+MTEsjXeO5fancKPXSubhpqn?=
 =?us-ascii?Q?GzL5VTi8K+MH0igVhB4pZfMsiCtxEwSzJIbHV9/YCTNrScRWGN3VTyDWaHsR?=
 =?us-ascii?Q?Tp6ieHlQZWi7Q/YxP6mJMU4TuA32kGDaQAus2vwsqew3O+S2usutsrIIOF3H?=
 =?us-ascii?Q?j9d4QrvXGILnIMj8aO562oTHy4XBMWk4GbQIUqOhIf8rb/0jqaqXSC37Cc3B?=
 =?us-ascii?Q?n2XOTZwh85HWBby2ju1xdL7ZtSumGFG8SWFtavKDdcUJsPXogSpxYTHtHQjW?=
 =?us-ascii?Q?74CzwZJGAQKjuaRDemtB0skVDHs648ISyvPipXM7WM17RxCuV44vIF1xPDBy?=
 =?us-ascii?Q?1uTPwEDSVbpPX/b6eyAoLhM7PKYHWU+0PnX3xQCqAEXaknGC7+T5l4yI+NFd?=
 =?us-ascii?Q?xLhPV+aHWlWHIJKc8pi223sfMXLh4VIpp3vzGvRNeKdUACu77ldyaouS3vZV?=
 =?us-ascii?Q?FexmWLodxJwFuKYNDFWPIPxOYvyIbnw+FvzYxD+/2se39jp5w48+JwUNkGU9?=
 =?us-ascii?Q?e9PYkN7nvnm/N7bnahpnsANy9oXVQVkl+AiBD/1gY+lWps2p6Un1YGyLeaDU?=
 =?us-ascii?Q?RCYRY5g0HCxz7cO4Dmvs7nySUoetOMmJb5bTKH1H6Ggej1Xd/rj5LTjRfr8Q?=
 =?us-ascii?Q?JvSNslMdHdAkg78xka/r67TdyLgwwgBvebo4wXb+GGDIWsSONV+4RPkIYXSW?=
 =?us-ascii?Q?h4VR9Cl0wlqTq3TvxUA61/zdvhdIOPAiOffW83dJKJx9VndcsWVNOX4tXmZs?=
 =?us-ascii?Q?VMxL8rJ5fYBTXCGS/Dag9mEB8b7AHKmaL0YNjhzaSwtzJb0TIhW6T3ZrCfcF?=
 =?us-ascii?Q?CZpToNMO5ipdjnzoq94p+Bb5ckTwM0KOVbjSgFhcVBwP8qg8BtqLqS49SnbR?=
 =?us-ascii?Q?LD5fsJje8jhuGiqh3Leurm9xD9LiJkF7RFHw1D57vm4NYHWvSh02SdXLSuUu?=
 =?us-ascii?Q?SgA/62Liq5uRLtnOx3ohmy/AljiMvIx9TYMVDRpxDcr8uDXun3oVGMAaGctN?=
 =?us-ascii?Q?dww2KKn7uQWoNRJT3vOiVfq/rP0Pz4KqsCJGzh3WFF5HLG355oxpPUYYz4Dt?=
 =?us-ascii?Q?iRtJod5VsrxDswnsA086oEEHUIdroHzVBtkKdOxeq7H3pteF2Km4iOrPnwas?=
 =?us-ascii?Q?1x330SNMunQvmgENBcNiNBBuXA+wmo1vl8FjZmKo0VcUAGwiBNfv2fbmc8vQ?=
 =?us-ascii?Q?QbX6/l2tuhCHUPq2Zj8jHWgLQXAK5FR65m2Vzp5Uh/0CM7og02PNfrF04xov?=
 =?us-ascii?Q?xSZGeSlQx1Loit7cC5E=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:47:15.5302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f502126-0214-476b-94ab-08de3f15e248
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4935
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 15:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16898

meta-arago / na / 20251219153042.122828-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] tisdk-core-bundle: Update trust=
ed-firmware-a locations
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 19 Dec 2025 09:30:42 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b1c002e97ca94c02a41b00e4e4d0b7b4c=
6a1ad61

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512190100
- Commit SHA: d0e57d6fe1c6fcb639accb27c2f00a667cdd8dcc

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




