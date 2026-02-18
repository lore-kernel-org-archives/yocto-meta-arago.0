Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFC7E9A04D
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 22:03:30 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1082.1771452205424716911
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 14:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=igEGCl6k;
 spf=pass (domain: list.ti.com, ip: 52.101.53.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiN+TYwS8vYYhdhdw9FdJZ+6ChiYiYs+PteMMgHgxET38xUAxWQzaLednCs33NJwXc1bqFWOxlHZbH9jK3sUxF+jWogPenFfGjyO9qTwaVVa3NROR6sBmlOmDqxJB9smDOGwnLvZtgTIr2N3KZprAXIMBE4ai4IS7LMZKYGncnY/kC+zsl3JDIMK1jiMX+SrkID3t6WEcM9edqCI7VFtkHusVQzxw7G0v2G2/2ksnFDm+2OvOEJi52EL09LPRtiKx+/zBJBhiSH7BiYXzLMmeeQ6webuIx+7oCvt7UV3lRyRq68JcnEP992wsX6W7wIzL2j5ItZXgIC79nckykh6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ1PA73yyIjQN7bXcOrSKyvuVNwiMDfVLNsWS+FJWBU=;
 b=T57GBAXPKI7szTBZ34oTNYP4C2mq/KjUwWqwNDLXYuIDODfQptYQo0sYlt2CDn1tc/ju9741urnEzCXh1GM/LdIO4c2Rm6ipyJ5pHPCHq9+NuYtEUBUWnnC6X7G+/kuY+ov3s6uplQjmF+sbx0QI6Ty8kmnTCLfh2oP5dOgklUDuiyLPKjE9kX1ip0NSWHioM2toTbc77N2tR8ehXHyNnUQhN3CXXQGhqFhMO6uCKQt8q8hOiK0gV4FNfcYVP+VELg8YtiXUgkaAE583S7iIXRjY+fSj5SEtcvAO667IVhPJAhOhZUwuxGo4iWgyotrgJ/HWYWirxGtw1iZB3azSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ1PA73yyIjQN7bXcOrSKyvuVNwiMDfVLNsWS+FJWBU=;
 b=igEGCl6kGaE4+6ak2D8ARP3IDZ5QzTNa3hTuH0kPds+c8p5tXvCHMWfhLzMiY6dmMTecpPcJA3hzoopMY2Kue2abQetmzyWQgzUgig017nILFXJi4IgF6J1fvcsQFGyV9b8/t23go4TpBW+00Sfo5uGIibnKfFXLHtaoMkaSeE7fjKlqKdZd+6S5iu6PjJOIWMWGmXMCFaRtGzPxLNYnd6GSS5ab/oUbKKx2zsecgkm1sgizioM0SagCanDUPYy2BM/Ch9CZcgCdOg+6osZ1N8jlGGn5ojEJn4lDJYOlRprrzApajGcmg7D1ajccy/NzHrY5jktMhuSfCBU1Cv1vJg==
Received: from DM6PR02CA0167.namprd02.prod.outlook.com (2603:10b6:5:332::34)
 by CH3PR10MB7120.namprd10.prod.outlook.com (2603:10b6:610:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 22:03:21 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::4) by DM6PR02CA0167.outlook.office365.com
 (2603:10b6:5:332::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 22:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 22:03:20 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 16:03:19 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 16:03:19 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 16:03:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IM3Jog2253371;
	Wed, 18 Feb 2026 16:03:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A86A99ACF4; Wed, 18 Feb 2026 16:03:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] ltp-ddt: update 20250930 -> 20260130
Date: Wed, 18 Feb 2026 16:03:19 -0600
Message-ID: <20260218220319.3408035-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260218214917.3277856-1-reatmon@ti.com>
References: <20260218214917.3277856-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CH3PR10MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: c77458c5-cc7b-4a0d-023f-08de6f398720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xigbZ5r/4FvPMevXwNCdbp99yM/7wuC4HaoYD/+LhEDt3EIarveQZ/lY1Ix7?=
 =?us-ascii?Q?TfeWb6tGHbnBb1g+74T2wWREdrWjMqeBmnL+LShhBAgwQBUrXORhXniTA5Ac?=
 =?us-ascii?Q?oSdJt5LR6JBzO1Z3xnrGzn/+VDPmCGJkKqcWlyB6Vs+/yb/gmOOzzaJTv1q/?=
 =?us-ascii?Q?mMSCmq4mgOUj3j6oLWU3NR0s+spBdn8vMyJ8R7v1RdC4LhbGkKJ5yCHRhsUa?=
 =?us-ascii?Q?VaQoPhOLo/sA63G/YA7fcvVipjDuCQFqG446NIk8EWFCzsC6p3M4KXzwv5Ez?=
 =?us-ascii?Q?y5bun9vuVbsVd/ytWj9LGGRX5j4qjfxPZPH1PydwjMDwKU4nccEaMzKRubuF?=
 =?us-ascii?Q?myLLF668U7HNSznv3lw7unG+DSdow6mK8cI8aqf+mViBqa3hP+CgnF4pJlcS?=
 =?us-ascii?Q?BwhJYFQuEeDHZ7xg0NEvd8j95jxRwer6tkqNDBw3K0YQrEBDpDvEUrkOVamS?=
 =?us-ascii?Q?iyBYzrSK1NTC9eM3zuJnf3jexohEPvUyEIpq2E3aeKHe8o2j4KV2vUYzIGta?=
 =?us-ascii?Q?PffePjWLIYcJrR/kgDxQB7fcl997ifmDhKQPSeFIGmgn/4WhLFyBe6H8F1o3?=
 =?us-ascii?Q?qbIdX/mMkIqvQUHp6I6Fa5pDaFjRLRI5v4LRyLJfccge3JyTogD4lVIAm1GG?=
 =?us-ascii?Q?0gkBbwTW5AJSp33/glDfrmvoBWydzC3OlW8WVkI+1sTz1qWVqhioViURJqlb?=
 =?us-ascii?Q?XX+rcNWL9YxJXi/+Dun4wnub6KWGmswqLC1FZQOoWESMWH/zWDNJmw4Z5kco?=
 =?us-ascii?Q?0suzIvvWx9dI2OJq/DWbRL4DTms9n3oU/sIapRx9TUhDhXrhOkqiO+o6VNVp?=
 =?us-ascii?Q?UkjkPdWif3gXyDrxWzBnnX5m4DXhrCBMJosxjotnDFEWwF9G1pzqMDWxQ7Bp?=
 =?us-ascii?Q?bwFBEsLFLGXmlTrFsJHC+FE/CaqZt9lBHxzmvb7httUDBJsDjZHQ+VrR3aIP?=
 =?us-ascii?Q?t7oHn48juhK6l09pNFBe1s/ASYk3GnwEE5S2EpjXmyLFPPCQxPdRT9/i1HEG?=
 =?us-ascii?Q?N2iEjDf4Kx75Ge3eBVE6Vfd2mw/7Y338HETu0WDncnHhmtZyG3PBeLle/1i1?=
 =?us-ascii?Q?L7PU6AGPkn0f6/WIeK+/klEKlyUzv8LGLKN68FhJRqomKSs67EfznH+AMu4T?=
 =?us-ascii?Q?rm/Gn27/hgHwNa5YXOqsVa438ZZH+LS+rkSOBOeEkr/UpH0xANc4ZyMESOBk?=
 =?us-ascii?Q?uAfkntrRd6JB0WkFdfVBgEb+fpEdaP8+8hdBdliTXFsUWtq4kPWFQg3/ipJU?=
 =?us-ascii?Q?0OmxG0+S29fE2LRUcx8kSKQhQpn4w8GjFUXHJfTXhyuH9+mEWhbkotr6vq6w?=
 =?us-ascii?Q?2YuTqp+jU/kmFU3eH90YCnwkoiJAaXdmbx+xuC/EKXwK7KkHXkfte4APmIjR?=
 =?us-ascii?Q?FUTAhSJo+oxAnp/Y5m+RZ0/ztZAAK25lq2+X7mOYjCU5J8Al4d+b2jcZOHj7?=
 =?us-ascii?Q?kD1fJJDOxmJa+KJVk9rFwpRFX1zuShQYjkwy0VyqJWsfxVeKkKN8LPltHj4v?=
 =?us-ascii?Q?vpMSeXQFPDlihDyUBvmxpe+5uKkdnJ/lEzj3AK0ZLd0ve7rBK/D7AO46QH0i?=
 =?us-ascii?Q?3UYeSICzPoRKUbj1/LTmEEooydbuH8Za833g+NgATN7+kV4HYQvytu14Sn6p?=
 =?us-ascii?Q?YlOqJCYb5iUaaV0QQPYNT6CsN0DLgqwEKtvmkCK6eF83Z1uGQZ3ZXCYyYgzG?=
 =?us-ascii?Q?E/ktLA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eq80vJSPa5/TKqkVSX9gk2BKjGda49THJSn3y7jRJMop4Z67k9Y2IXnohJkL4j+xZ1YbEB+BO4H5QfbZ2cXmQW7/db2VwWY0ialRgYVpzdZsgGCJF3OOQ3XpXmvDaNZq8YcSN/DqTwmNi247mHegntiAhKD7Zq8SAPRguoDx4kl7EbZEd4fsc3w9ZzFUGbTtQbceF3h23QR1n8qg3q6Qa9geT8O57VexBzyWNjDx/K5IBip30Cmh0H1+XYrxJn4XdsY9FYGMERopyQt+1II6kW9RvTy73XT6VPp5UCKwsfdWwPvGlScIx4I10kWJBQpQoA9bJOIZVQ/HJ2i1RMh1i9E4/cDCAC7C1e/RyemUtlqWdH9yXEzwsTjUGBN7ylIxIBCGRBbqDgEAttgojeqga5B6Ul947USy5smCArlCfMiM3R7UmgWyEru5VWpTLh6u
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:03:20.3005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77458c5-cc7b-4a0d-023f-08de6f398720
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7120
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 22:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17123

meta-arago / na / 20260218214917.3277856-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] ltp-ddt: update 20250930 -> 202=
60130
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 18 Feb 2026 15:49:17 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 87b4617cdeb21acb017221b8fad0812cf=
2ddae4f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: xdp-tools-arago: upgrade 1.5.4 -> 1.6.1
- Commit SHA: 4b03497bfdf846e6f71a4d222849e2a1e7d6d618

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
ERROR: Nothing RPROVIDES 'systemd' (but <build-dir>/sources/meta-virtualiza=
tion/recipes-core/packagegroups/packagegroup-yocto-builder.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




