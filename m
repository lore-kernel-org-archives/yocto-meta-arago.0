Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF297CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 19:00:40 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25302.1762887633199824837
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 11:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=v6skaJdW;
 spf=pass (domain: list.ti.com, ip: 52.101.52.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzxH2b1/nNf+UvK5kFyrmgmmfkkvF+VU4wBDwSsXKiq1WGk/Yy6lqoHyHUR4EtexrXpuMp12A26n4+zpeicAgaQInYUm4cnZfwCAQRLpXOZ8kNLzsvsAcUUNMRbKARm/S45F30gBTOD5yvxctlgeO0wFEj8osBMuisivRPE2ox18muzPKoPh/xOQP/Wdvcl3ve0u6NMUPujSPjvRz/yg8vHfssg2wJdFLnnzii72dcw3iJXLNWNQGSaLDJiHEGl63GwbwtpcP4NzApMlwKKwRWC1H9E2ulUcPktRqd61T9fUD0r6hsrhS6l98zLV5nV9nHnluHtN5GLbQwkOy0/47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By5c90gAujng4J9im4eYEyZtBFS4eEGEGDrq+9jULls=;
 b=uTcoq4yhZxrfLPpc5985nrpmYyQgw7DIvA4a+4o/PwAMyDMcCOr5yTNqQ0SdJmiMc7ogObYtrosF9mFhvq76Gfud74Ltst5zpK6z1E3UZ3QiMtecuacojsOQa7BRtxwl/GRq0l0IkUrt+8LFFulKiJXR2c6Nv0CHcr7cZesAoX04h8AeqkkyMIQ6WhGSJrrcahd0hFGRQnSsGVljwn/ZfAfY+VJVFpElY9ZHS+IB3PZ9uo7KfnKGFv4TjJItxi7gOQhJz7Thb8hnqBEYsQzrobVHe4a3bS15ve09tuxA2InUiZ49tLHrAkNQOkelBzGdT0HTEL3cir5p+DF7ONu2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By5c90gAujng4J9im4eYEyZtBFS4eEGEGDrq+9jULls=;
 b=v6skaJdWDX5iwuyZkLTWI5wH7y1DkRqVCxlzhqv6AJJ+iwhKRdkeB/eVLh/5Xg4eXadEfG6QaPH9/B85P1KtKC+NR75Pu6eZ5DEPX/RI9grjZvk5D/Ji/3y3RJHCj0caGxMf0g5/cxFSgeRFsi9dpsgbU2tIDXpBjUNa6Y14w7zmazQITJv9LT6K2yMMO+W4gmMoxuEPEvk0hiwyQWA5rJlmQhV+20ZPXw4noO3PuaBydjlyugi3njiXMGUV6HYD6aMz40Ppj6MRNRpx37+KHe5GOJsLw5z+7T4TCk3FGWQZuwI6JmQQ+28xZaCY0q4trde4wDhrA9vYzhqJVlomrg==
Received: from CH2PR14CA0054.namprd14.prod.outlook.com (2603:10b6:610:56::34)
 by SJ5PPF7BC0D55AF.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 19:00:26 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::28) by CH2PR14CA0054.outlook.office365.com
 (2603:10b6:610:56::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 19:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 19:00:26 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 13:00:21 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 13:00:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 13:00:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABJ0Loc1388509;
	Tue, 11 Nov 2025 13:00:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 05F0A9ACF4; Tue, 11 Nov 2025 13:00:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] init-ifupdown: Remove legacy network scripts
Date: Tue, 11 Nov 2025 13:00:20 -0600
Message-ID: <20251111190021.1593537-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251111185802.2351715-1-afd@ti.com>
References: <20251111185802.2351715-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SJ5PPF7BC0D55AF:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a569e8b-c093-42e1-00f2-08de2154931d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9/qqbaDxOAFHLIbDxG/xIh/3loHOfGAEs0vRXFRVbSrJrFyebeCxJpT2L5BL?=
 =?us-ascii?Q?RGHf7mgB84j+2+0VuYzd4EXdNGB1hMU8zncPfQDOQ0nGAjbtyhJwXUl55yBj?=
 =?us-ascii?Q?l3TH0hhBErzO1ml/kjpMqUk1NuscXpn7dqjBEchv/mB8ISBvsRjfaM3+vFy7?=
 =?us-ascii?Q?LYQBOpWgEaTj2s26KIyBV089NSmWzv+YcIV9tFKX8xmcRMwqU20B9k7IO1/c?=
 =?us-ascii?Q?Z5miARHjaLiSH8Sw7sNkb4L19VwEEQyWbHblTsi5/4ihHjIrJSpk5wtDMsil?=
 =?us-ascii?Q?TUz/a/9fWiNWNbZmOdL20sbswgnUENh4ZbNiYYDkf8yeQasMFnsNTjboGDqU?=
 =?us-ascii?Q?EnA35LWVUqmyM6RIB68g7O55o/yMDVd3OFcox6PziieqB6MlR9wdIPUqlggy?=
 =?us-ascii?Q?2Q8ySQAANGPUazlDHDH33Y6ErD796qiFQBO7liAFjGXUIReG7P7hc0fdlf2W?=
 =?us-ascii?Q?y3BE+j0yQ+QBs7D12rFUVjQd6S3uDEWUVvIp79I4YfdkZNCahCmJ+k4Tz4Wq?=
 =?us-ascii?Q?+pvHjY3RAU9fGk6qGZ8xuOacdyKnDfbwncrAENjm+VriwcEfhyTlfez1c4AN?=
 =?us-ascii?Q?Sf511YvLkuA7BS0dSNsp7/2wNb1uJ24IvMvc735iQ7n9BGe3YDxrJsaf1aL/?=
 =?us-ascii?Q?FsItozfu5YDTjHVxEFpF+rnxWM+3fyxtXZ4NyulrC2v3jNvCkupu80YbYJR3?=
 =?us-ascii?Q?4JPWqwmnd5SZXQl6A/BDMzmeQtVeWkUyQMH35LU10I/queDdz7eJz5aCVoj0?=
 =?us-ascii?Q?+ixH1I6TacRCWjVc78h3AoC+GqXq7WM/M18krJ2Vbz3gx/sHdO8H+vDbvSOg?=
 =?us-ascii?Q?HuViN1jlj1qRCDwMt5nn5FTUgOimITAo8ZMXtLRFqx88E150IwIWC/lFkpC+?=
 =?us-ascii?Q?nJ/bZs8CP0TYYVYSlk3hWIuvFQJpkFdZnuw6Vn9c03f/OynWScbP6Yd9NKBG?=
 =?us-ascii?Q?5LoLnO69ENRUfEw2M6JpEq2IPqv4tQxP6T0X3Gb7McgodzSlYONIHwWMHUlE?=
 =?us-ascii?Q?qm3Ce9DBdwziYSRMlMsNO17uI+r9k4L8rJGM+ZSPlhhkw3EM9GdRnciO9zGt?=
 =?us-ascii?Q?IuFqjYr+BF/Eg470esYoSXYQxQb0XYISXB0qPfinqoBwP5LAPdlGfm7Zk2la?=
 =?us-ascii?Q?0DwIZFiHCk24k/fI03sRNb8DIJ01Nou09nYw0oPcgMG6offYIVlVjveH8WUe?=
 =?us-ascii?Q?GWuMz3rK25gapRoy6DPwGk8oc/A88yoadsdjIVKbs/2H4rhOVif+QuhhPj6z?=
 =?us-ascii?Q?rcDKKtuHthtO4hdRhUlNizvYG9bkdS7jmoNmWQSg+x0OjvUEPxDeZq8fu3D3?=
 =?us-ascii?Q?xc9huXZI0ZxMCY8sX6ucCDLidDp1GdINszhvpYnwZ9zSIUTUZCP+vAn+x8c4?=
 =?us-ascii?Q?2KDq7nSUrAs8lWklmNaVcda8RCOhkK2kJDisIIOPw7m/dcBMVYWRxmu9f9p0?=
 =?us-ascii?Q?YRY+bE67e0GNI8HLwZuHeZvMjGN+xu1C0lVjZy7vzgQ1HjgTU/3PCkn6eQXn?=
 =?us-ascii?Q?pxqXmAn4dTpvyf6Hgn4IlcKXOlzEeabatm4O+fq0BrGlV9gHbTOzplWOgnIw?=
 =?us-ascii?Q?Yt6rRvM0u09H/8I3/yw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 19:00:26.1851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a569e8b-c093-42e1-00f2-08de2154931d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7BC0D55AF
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Nov 2025 19:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16745

meta-arago / na / 20251111185802.2351715-1-afd

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
- Patch Series: [meta-arago][master][PATCH] init-ifupdown: Remove legacy ne=
twork scripts
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Tue, 11 Nov 2025 12:58:02 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 23aed2bf168e05839e26d94bff5d0a1a8=
93546d0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511110100
- Commit SHA: 260cfe5d29feca96d784fc914a546677242fe2dd

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




