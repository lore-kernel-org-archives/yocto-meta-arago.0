Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF278C982E6
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:04:56 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3611.1768586686554221485
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 10:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HoVvPFeV;
 spf=pass (domain: list.ti.com, ip: 40.93.198.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9E8e17wKxGqO9XFldizyQyvDvgPQHEbh6t9d7nHX805z42xBdT8xgNwmN6jbA+IKgmZlt7EcTjx4M99IcsRVUvK5FJUZyeML//dFY9/YmKWhC6w3R7ca0F6Hk8tOb9H6RTYqUIp0IQ8BxbdOcgn2bypwY0F4HsA3HwpkDNP1qRsyc1pERFxMl+iJeHm4C8fWytutO4EhIDSEd5O4j+suVhV3Hze+5SBfsS9AIvu/QVaqiDa4pvAbc207MHzkqUvavITjWCId3wvXppJbkVfrvCXCPywr3cc8F7Ldg2TkTWpvMr0OEBNytbOiI52oEZpvmdE6Rh6aNu+daWd9wcwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwLt+S5u3a9PsJizisVPyq72ntWMKXQqU1acNxMHbNU=;
 b=xO7Vk0Gvat3sAgwg56OIYzPdOZ3qDffsU+WBrkSTSIvIwK0zemZL8lSlPv9IPGig0Prn279PL3vsQd7fqsGBEHWRvaorDYD//HL7qLiojaRS5gXCiczXgd0blpgAjQDr3zv0/MThMCyegMzg3skNG/lKP2+XEiP0rlj4p2sPSGPjlP0FNf9UinE/S0/ExbfClGijPyCKJT4gbuARBeEOco1bSjmIzmWekah/XUCEj/4ooVr40HT49sDgDowTFhkWr9h9aXxsXOCnVussnF4PPQnmQ2248i4SJsa5EMXeA6AhHBDGEoAIaNz4g93rZyM4zbbX1SUOJV5jeRajfrTZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwLt+S5u3a9PsJizisVPyq72ntWMKXQqU1acNxMHbNU=;
 b=HoVvPFeVuZ6T8n8Wjv4mjAYy1FUGBT683O0z6SAojt3AVGKATOnNwaqKqyXrHULU5v7sGzkrf5Jxn3wytpZQxa3zT5xnPe9e7zb50HEBDWHK/pl2kjcjb+UvKFcnwa7rVRNJCRHNDGQjHasgX/S1PmiGyk1KmaOaRBWxjI23WeQk12wmlFB1j5O1RNtlRMRKrrlgd2DvA5lgl6bREBWTRoi/iptQctY2J4hJvicwnkYUgisgJg4QVdO0nuqAxtoCkVBjXN+smXxGIi8KrCYmsCYngZq1LGiJykU1O/qKZwonx97YlybM0qQ/nua97mePK7349AeO9RQP8OSJRmdCkg==
Received: from SN7PR04CA0183.namprd04.prod.outlook.com (2603:10b6:806:126::8)
 by MW4PR10MB6348.namprd10.prod.outlook.com (2603:10b6:303:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:04:44 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::1c) by SN7PR04CA0183.outlook.office365.com
 (2603:10b6:806:126::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 18:04:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:04:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:04:41 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 12:04:41 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 12:04:41 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GI4fPf3675104;
	Fri, 16 Jan 2026 12:04:41 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F19DE9ACF4; Fri, 16 Jan 2026 12:04:40 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v4] packagegroup-arago-console: Fix package names for alsa-utils-*
Date: Fri, 16 Jan 2026 12:04:40 -0600
Message-ID: <20260116180440.406089-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116173605.1565859-1-reatmon@ti.com>
References: <20260116173605.1565859-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MW4PR10MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: f964186a-9ef9-4252-b3b8-08de5529b9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rP9Hj3RQQ5EEiB5Pqudr2O0gZZ1cOcywPiWfTYWIPddUTf40Hr4ttaSAFIRJ?=
 =?us-ascii?Q?4OZphR5Gju+FDeX72QJsP6EJ4HKFA38E7tKWKRx/bL0TDCcA6AvymidjDPs9?=
 =?us-ascii?Q?Qk+70XYSHs86xbExTKH8iGiAv77wQgGf/PfJ0ODn14s04+Zv+7k33q2g9uRd?=
 =?us-ascii?Q?X0YJplwyjDWGu1tkJeaqaYVICklkmx41cX//ZlWPnVN28pOlAREzK6tDrqHW?=
 =?us-ascii?Q?rqfsolVPimqEXwAO+6x34j9EVhlX+ut+oAla8Bsb3ilwVOqLhcKrSVsVhKi5?=
 =?us-ascii?Q?G7+gTnFJfJ75vP1icfnipw9mLA+eSjx3BQiR6gTIeHVZEAGAwvA+a29rHVea?=
 =?us-ascii?Q?w7uVgtUDbwM1KtzGweW7HoFAKq+wVNS2qW9NI8zMfdRSTcgxJ54XTNN7pWjZ?=
 =?us-ascii?Q?uyGUyCQZp8OBEEeh31Fwx0hqvoZjsU7WQJ0Etafc5aVv3K/HGZadA0+ClZbo?=
 =?us-ascii?Q?R/LPaplUWc8zu9wQkmGwVA5LDcvPDYLi0/hDWwMeSjR8f+tY8CDhCuNkaoes?=
 =?us-ascii?Q?FKf9XKx89vxikb7uoz83QGQPzzgT9bhs7hxEOxEbuARebB/2MRhbNmnVe+oe?=
 =?us-ascii?Q?d+irrsDUWxukwXSouVgGCeekdAb2D7sPRjFwYFWmOdZ1TUf26Hmvbjs5uhVK?=
 =?us-ascii?Q?Q4GjQHattqC1K/RgcAsH4A2+X73fopA0afukLkeDjlfUpkxidnkezj4tNRP2?=
 =?us-ascii?Q?s8/f8T4F772BpXtVm3KSPsoKVfPk99IklJQewwMNzi5y5YyhrIh6BkskfHZD?=
 =?us-ascii?Q?xVCLTqtNWvaWmk3BWmJlU2kVDF+yBwFRCnWuMMgEV4dU0ruqrw3xW4/ojecn?=
 =?us-ascii?Q?IcT4d5aahkH2v1NXbsYYx1qU5sVaIHerh4O+C0msucavEGBh1+bvr74JYnKS?=
 =?us-ascii?Q?4LX4Yw2tW0dakSdau8OP0atNckBRZKHYbnttTG1Fr2lePzPvtQVXK42ORBlV?=
 =?us-ascii?Q?Lgpl7fOkQ1Fwgc8oFat2NFnhOXdlGEhxgJGr0EUb8JQV1rEwiMCznGtoZTvU?=
 =?us-ascii?Q?dIQQWWlkIMBZL1istjoj0ZXv+aXTVM8o+3azpSZDP1mL5Lm9eotGbIZrvLuT?=
 =?us-ascii?Q?/o49SD3BK9IUSWSj7+8LCW8A418rm4BiiJEMYSF+s+0AC6EIKtvJ2N+wXjoe?=
 =?us-ascii?Q?CXq7weOEm/CTSuGSKRnuiKtU0UxD2KRKl8noJ8zvNneGuz58NaiJxIGXWDXA?=
 =?us-ascii?Q?bu8tCsg7IkHX3YnHBj6nZNdNyxFRjiD5U+2s2HhVV9O/adMsfs7+qUbUIP12?=
 =?us-ascii?Q?ZDp5jULWDPfgX5iiMyD2GIp92rHFY9HymzShPCswegMHCuQ5E0vfCIsNaaiI?=
 =?us-ascii?Q?a4UqTBvOL20MDLoUaRBejn4/muPiBezm5ua3SMtzxymRArySJZ1VjN+xKYAs?=
 =?us-ascii?Q?WEh+5O4nHC+xrMtrH9jJzMqtdRExCn3cavOO+PMJxBn2NhD9N2Ymp0GvdCI3?=
 =?us-ascii?Q?Uba199RncxPaem7go/5W3TiiAIjy2aYncZURfHO3cP71CFNnhE0XKsVYnYa3?=
 =?us-ascii?Q?+K3LyU1vQFxEKh2lYVBPsN1c+DQN+up6VPqT7eb7ZSZWipY1EDv8YmD5fjTx?=
 =?us-ascii?Q?5ErQnYmAx4aw/p8OrC8pfaEPl+FXqqXnYHzZfDw7bP6W15vKBBUJ8K69hUuh?=
 =?us-ascii?Q?+vt7uM3fDaZ2G4jquN5bUYlzdkzNFFU4L6Av6FiTrYtQ?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:04:43.4477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f964186a-9ef9-4252-b3b8-08de5529b9f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6348
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 18:04:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16974

meta-arago / na / 20260116173605.1565859-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v4] packagegroup-arago-console: =
Fix package names for alsa-utils-*
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 16 Jan 2026 11:36:05 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5dee8ae14019ee1f34a0d2d1273e376f4=
444ff2e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

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




