Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B3C9830C
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 23:29:29 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1419.1768606168269008446
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 15:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jfQ2+WGS;
 spf=pass (domain: list.ti.com, ip: 52.101.61.38, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/zt7tIW2kyWczmK4N512RMKBAbmRgL0U9D9tWe1ifxdQlTCzhZd12BwlGsdLNBb/gT02g/4CZ89nLAaElH6n/rMcgQUme/t7qWmjsKVJbGUuaijKgqnsuEhehxmSA9bpg6g2Gh6QIxJYaaptY13RX+JAxBQxkaf7CkOqvDP5AjH7nt5ODpEfgffTdWtYBLkBZysE0SKO4nGuKhFWHLR3aIU0FIeWUgeqasAJ3/OF/fWkqjfrqijkg7rtLlPg3MPwl69VhpGWpo5OsNPt+tlRJ0aISR1vt/+Wx7neXIOPeynLxSwXuNI4w+jI8h1eAM1MqZU8RB+g8kdjA867HGc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOIdMs0WblUoZciP9FSucD4aud/p2pJZKUuxepqNm2Q=;
 b=kwwihkbVZEqwQ6DCRqTlgi7p4KEq5nVbhVnt4hPMzC5TPZ6sQjoqSC9z5nsGc9GajhAphV1QmgJu5SuO8rBWjRXxV9E77ZpQLER0jtFrGZHz3uG1eLMGPwSOQfZLKg/GFIIx3XenZjtR7QwMPvcgtJ5Q36ZIlpUDBATHECUdB0ApKb5H/GZUVvIB76O4hqzXlkSEK5IxfUH64YCG23MZsCctn06QwGkFVpYhy02yOYyG2qv0YdnS2O940ZwcXc2q0XQBFJvSQov2IJuqy9iWoHppD5fFqXyuwUiOVt+EzdkXbkgLJJjhqmO3vEVRw03YwUcCSQ+GJOdQYrcK+qVvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOIdMs0WblUoZciP9FSucD4aud/p2pJZKUuxepqNm2Q=;
 b=jfQ2+WGSprDphC8yxvzWCTNNN69G47nIxZWrbvT+bQyE70C+0JXi/4xOlzGdJRyDMFFehovwycsZtVEqq0innpysJDZdVCeHIDSr06WgZdDhhXX8e5j2/MdX+eFC3nm4J633NeVHHd2Gaeng9XhwlQYzFs/qtJghkt8vfq4j/g/u/vUOmtJHcQT9LPmVorz+K1M5No7Sof+C6JQV3vXFTrpPLR2UVGjz0P4qVY1Sz+xIdTy3tZb2h4xjMS5XzeaVVuAhi6oDgFmRGTXFHebnmw8r7NaCYlRPs5QCze+MTWfwbCtXRuXH/KOqXorkRKuZAI7fBd8IzGOekrCkmmMquA==
Received: from MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::8) by
 MW4PR10MB6464.namprd10.prod.outlook.com (2603:10b6:303:222::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Fri, 16 Jan 2026 23:29:24 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::4f) by MW4P223CA0003.outlook.office365.com
 (2603:10b6:303:80::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 23:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 23:29:23 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 17:29:22 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 17:29:22 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 17:29:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GNTMOY1277974;
	Fri, 16 Jan 2026 17:29:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9896C2A5A; Fri, 16 Jan 2026 17:29:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] open62541: Upodate for v1.4
Date: Fri, 16 Jan 2026 17:29:22 -0600
Message-ID: <20260116232922.1640688-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116230225.107700-1-reatmon@ti.com>
References: <20260116230225.107700-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|MW4PR10MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: b045e23e-5825-4901-369a-08de55571501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EdCB/qVPTciEoTUVxjl9cbxfvubZ4LM1DH2DlzVO8zdHx70GPSMYH+4RjZ2k?=
 =?us-ascii?Q?EiqEoe4qc9tNixepoB0do930j8RwMNYisfaAr4dh7R9u0k793dzUNByEdCGz?=
 =?us-ascii?Q?6HsA/YqsWajsXohzkBPjLoRlHRdfJz8R1VIifIEj/LUCL02ryjOqkO4IJ80S?=
 =?us-ascii?Q?evZRNmU2yLblW9XLn1wSBk59BIoNqJ1F1mBehHEdV2iVYr0/pybK1FKM4jXv?=
 =?us-ascii?Q?cpFiN9jue1ZmXBuqEReHfEbPLCaK262h1vuJ989Fdl0YcA3ZHD2+cskGS7Zt?=
 =?us-ascii?Q?DPUBZekpA1UkB3m9EVN44pfCFx/vo4UqAx4Zp5AsJZ/BtIEB/jaXDbpFWFUV?=
 =?us-ascii?Q?1+r2CCVJKBSg5pGZMJQtPovtQA4o166hp5ko2c7n0G9hZYQjgECPjm2T0pn3?=
 =?us-ascii?Q?VuOiLZDmnQj12ZC5Phsth9lhE2ANh7bqDsmsti5ZOh+ue/ktacrfaby7RnWq?=
 =?us-ascii?Q?+Az3p1524XVWPWkM6qr3tQ1yuedBfhkLkqYVDDOVvfab+S/jJ6Nizgw2TVak?=
 =?us-ascii?Q?CYvbQDW82LFqn77qH/2BghWHpFyAy+Y6f3UKg0cdUlIthi4hwM+JDD9+A8Yv?=
 =?us-ascii?Q?/LCzy1PXc7CBTuxYecswGcXf+ow4IgO0+fy2OUFrd8pV4lhQaYilMPO2GIFm?=
 =?us-ascii?Q?OZvaWyAxqg/crUSJdfsMGBSkMeyF9cmzVbxB14OLJ25nxJS+bDiN2Yn5Koxa?=
 =?us-ascii?Q?1b43kVw1pT0iR4RTyJ/bkxgHUrFakNg+xLj68sOI5UWTwVZ/KN+sXImASMEt?=
 =?us-ascii?Q?H8E1biFlcFO+pDnt3xYBVBI6rkT0WoymLnjJxwaU/AthX7PNbz7UeamIrmUZ?=
 =?us-ascii?Q?Ea/dh+Itr7Zn3bl+iNdm5b2TWD8FYSboFaNlI0jDrrCWkZAtG34zgOMySQbt?=
 =?us-ascii?Q?TCnSH2Uzc8lxnNg4yCTf1mPwhlNCQGb/KP4Z/0F2cmb5fU/VkYtVSg1g1j4x?=
 =?us-ascii?Q?clRdTpudxDeDRFSc2zzdGIulh0kG3q+3nzJapowMnoWBZtQqAPmntShF7vov?=
 =?us-ascii?Q?YJqCiZgH+2vcpHkOTJSRgqJ1uEXPksK9OYhxzhpXlpmr5YRLqVS64mTFJLa/?=
 =?us-ascii?Q?JfB2txDBVYKmxFEUQBMz0ZzUTV6Uca7QlqJxEhC1JafmJucBCcr/mSXbUox+?=
 =?us-ascii?Q?rnkRimJ/OtZ208hDan6H1kmIPhGRP9wSohrtddo074EuZyL3T7l4OdFZ3cRo?=
 =?us-ascii?Q?DlhYTynGWPVJAyV+9ehkkE5LBvwPl2Y7daZa2+rD9pZ3lYlrSqXgbKAKZ+tH?=
 =?us-ascii?Q?hnyb1wSe0eQ4i4GWz3bX4y90RL6R9aGDVM/gvQRqly6iHSZKqlvu86kNx6Kb?=
 =?us-ascii?Q?f8e4GC7WcN7NVkK4v1eEb5s+NbZGVz3HqDLjAG8d1Zsw1wfIQGELgxbgxMgI?=
 =?us-ascii?Q?+PWI4zd7WQKqmLUyY+ygeI+33Yp92KItcNk1g68DaIhDG2RTLazMW3yqgPsj?=
 =?us-ascii?Q?m+wY2tEfgAThuxZVryIrmS4cBf2YNlnGWglhY951gJcG30z7TZTZVlCXf619?=
 =?us-ascii?Q?2fgcM97PuRJYG6I/pRthdBbkAife48SezHJc2+zRgjtSSNzDrHG1lDjUg2xT?=
 =?us-ascii?Q?Fl8QBRhiXZZJdXSRqL3dcOCkbRSnOO8QiIVGhahtqbYRwpPdGg3ENp/48jJc?=
 =?us-ascii?Q?J7+sp/ZVwr0B78hKFWCRGMjzfH/KM5Uy9rGT3FzMk5YF?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:29:23.4749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b045e23e-5825-4901-369a-08de55571501
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6464
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 23:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16982

meta-arago / na / 20260116230225.107700-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] open62541: Upodate for v1.4
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Jacob Stiffler <j-stiffler@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
-From: Jacob Stiffler <j-stiffler@ti.com>
- Date: Date: Fri, 16 Jan 2026 17:02:25 -0600
-Date: Thu, 19 Mar 2020 07:40:42 -0400
-Date: Thu, 29 Jun 2023 11:14:50 -0500
+Date: Fri, 16 Jan 2026 16:40:07 -0600
-Date: Wed, 9 Jan 2019 08:31:27 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3d0a64f853ced5c66d0020718bdfd2e47=
5353e9d

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Version bump to 20250930
- Commit SHA: bbe645abaccd1ecfeb0d577ad8b5bfcfb4a1bc93

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




