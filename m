Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65579EF5877
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:12:38 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17190.1771348352084000614
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 09:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tMYypfk7;
 spf=pass (domain: list.ti.com, ip: 52.101.56.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHgh6dVeIkcIaQ344KKvxZuPlvj3yMSxlmnPW+MnUxGujwS3bqcTXaog5Bfab50SVwznjkro6pTPjjJwCC/HWkHUMS/24ugaKB1ETrgaT4DiZk5lzC5sYx0ivz4UcXuAM/PIgqX1thobJryDNh+qlxb5fOofJ5Q5I+WuVyGMgipMreIi0p8iECgu0UDlaabef3RGLdg1HKf8afs9j9kTfBV/Hhq/J+q5bxRbPBIPVHOBYyPYAdTn+rXk7s9kd4ZGleorG6H1Jc9BBQuPRc8Z6Gq0gx5fJhlonbIRf0p3CXd0frMSsgaqrbrcjRsAiLl2UADohjf/Svwk4tpxCM1bCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sRsK4TmuFfLFMuEIy2iLDZ0PWBDZlLYOPAtaNzKQkQ=;
 b=COwEQOOMjf1mEe/5r5MJQnYADQIP6380OCIctpf3RuIvPiFC3vQzomnep/glaOjopBJ0WNjhBsJ1gqQDTP5BMEu5mMTqRElMrKnwdg2tDIbgam3quuq/mxomU31kzC4YdPveR5lck9OQDmx0tymwWw8R/OTejxMtEokplnO/TfcZGDc38zUbhMC/nW+gLBTZl4plRVmXIP9bUef/Ur0vdW2oxt8+gtjjdKntWIk0LlXKRDLCxPRSDMrR72nhOvuwiW/6p6izv79yFNt2g3zfcGrqo72gZt5N5MOha0XyHrC9dafQZToVUuJfalijwPSbVkhyp2iBqO3fa0IKBvSW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sRsK4TmuFfLFMuEIy2iLDZ0PWBDZlLYOPAtaNzKQkQ=;
 b=tMYypfk7a3bZX5oiazgh2pA64xQDtbeL7SeFqq5gVloX9H4VgLH5WFJmUCBydXEMomjPSRjy9Cw8hgxGmIQF3aZn8TVrJ1WrmKFd2LAIzwQccqBSFwq9JWmlMI28y+z2dBuGBtixcY5DsLR+QjS0KP6JetiaLPCgZJ3Eg9OKZxpOs8Br8fH5FbFlGPQ6+NunJjeHJ1dxr6DfzzX/YYV+jsECz+bgQIJT/CwAxWtpvumAdHzr+onx0FhQ/oA9xEUf5AY9Cg4crAq9x1ooeg4UIgzGd3t6guZuDyV1oO/l4Yb0TIpMZrJSQl6o6DdTIP61RU71eorYeQGST5Qn8ZCn/Q==
Received: from DM5PR08CA0044.namprd08.prod.outlook.com (2603:10b6:4:60::33) by
 EAYPR10MB997804.namprd10.prod.outlook.com (2603:10b6:303:2be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:12:29 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::9f) by DM5PR08CA0044.outlook.office365.com
 (2603:10b6:4:60::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 17:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 17:12:27 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:12:21 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:12:21 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 11:12:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HHCLAw898274;
	Tue, 17 Feb 2026 11:12:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7AEAF9ACF4; Tue, 17 Feb 2026 11:12:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago.conf: Remove obsolete mirrors
Date: Tue, 17 Feb 2026 11:12:21 -0600
Message-ID: <20260217171221.2604811-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217165709.812321-1-reatmon@ti.com>
References: <20260217165709.812321-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|EAYPR10MB997804:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9ec9dd-7f69-4538-85df-08de6e47ba1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aWbUuH8P53h6xIsLZb9LoZ/3WHQ499py5b4iUrApSsqKJx5z5ZIa4fa8R0FC?=
 =?us-ascii?Q?JzpWQk+d5tfYJGClJFiDBg899kqERhEHkLsywTHO4oXVf9JhOpbmh+Sd3OQg?=
 =?us-ascii?Q?qMqG2Y65lE96MQVDT2V0UdkiY3eZAG7Wo/g0OjZ6YhAQw5ys44tvDUXCYWeN?=
 =?us-ascii?Q?92JI6kLBXq6Snm4CKBQqAPv4fZHfc7Xj8j1Ll6aDcHynAEibDQcg5B6o8G8C?=
 =?us-ascii?Q?/9bolSHOq44Dgv4JKHnteiqclY3MPQhVfn/sqKGnhNpnBUxhodJtnT6fI8cd?=
 =?us-ascii?Q?7ADQsso4NS08r5RS+HOIjFE7hq01L5T1b4u1TkUetrkVkbcZr6oG2OZLqIiV?=
 =?us-ascii?Q?v52oEjFZZbaDgwLDmHoIvjGff77JL+CvfJyVEoOBdUuJ80rzHbVePl8HwG/I?=
 =?us-ascii?Q?M9yxoW4MQCL4DF79cjPvK1f/oy8LVhVeFfkSVdH9WUF37Gl0Dv/OYseX+ltu?=
 =?us-ascii?Q?xPY+n0ABMO1HRtcXqjAL4kCcwltP1OmHZyKx1u0Mrkfu4v/aPF/jB+8LRauL?=
 =?us-ascii?Q?KLwN9Jv9COEKOyg8at/xmNw2BbOrspCk+d1b69WOvDcN99VhLb6fKoZjtQKg?=
 =?us-ascii?Q?PiFr809lkkwV0ycV8Sc8hsvXZX+bLpF9fcCiMB9+0jGxtYJKObGa4ys3m4Tm?=
 =?us-ascii?Q?AOZhTq5roVS4TFFJp3b0V1cfX5yfloQkGKWJgKJ4zHHVRvWraUBrqG3twEW5?=
 =?us-ascii?Q?6BmyYX4AFRkgmaPmefpfnrNBfNTbyrxWYN5CPUZgGUT35cw1UIIYhRwHelbR?=
 =?us-ascii?Q?e879NJDlI3gAcKMUtcIL3RMMtcK8lh2Sp1PO0AN/zJFDxOqNd6LprhIXDAxY?=
 =?us-ascii?Q?Hf6hxOqK7RiRA/U+nrmZS4erad23+JAfH1HrZk9ocxthUNmHfNrg5lKUeu5X?=
 =?us-ascii?Q?dy1CNEBNmcCFOVnQ8rwLypWfsLIr9mZjGA+gLgBaSgSn5cFtsrwqAmDclgKH?=
 =?us-ascii?Q?ScCKAgNk4JeiF5rvlmI3bpL/1V6Ljiks90LVy82PWtShton8AffpG+/i03jh?=
 =?us-ascii?Q?UO8aw+vjWQq9Ux2oJGIy0kgNuSz4+voRpdCH8KL45F2J2zN1yS6VQSkdX/zV?=
 =?us-ascii?Q?9Az9dtfYfTL8NgZp9AVE/QNN6An4xBwrbJ0d0MZtqiLmsP6fIjQnR0Ttlptl?=
 =?us-ascii?Q?7UhTHr3FaMk4HLwqrkxYQ1Y8Ou09+C+FF4gJRcMBn/2F/KWDwgPA76Q9bjux?=
 =?us-ascii?Q?/phyIIMaPZf9E3LB4Xkh0BPGRGZXlQ6T40+1WMOZyTFhaA/Aog3Lfz1Y3kws?=
 =?us-ascii?Q?y/NucItE5yhGtq66xky9JigOCiDI1+taVPe6xeY82H1iJ51teQ84X0pJzDDj?=
 =?us-ascii?Q?36lRCIrenR0gOOjw9uGHVYmPsxIHmmSug9w7ywMkyFZuk+cERSK8a0TSgabX?=
 =?us-ascii?Q?zpeuWQ+8A37z0Zr2X/BuzqAHlWGipDN1HUtOsdqENO1CjwHwawTJq1TACOOO?=
 =?us-ascii?Q?rPZFZUk484QTCU64nth5ef8X2SL30OpVWw9AYQdB26Kc7XpV1aKpjDjXh/MW?=
 =?us-ascii?Q?GqLw2UCluDs36orFMXjsoWsAj9rT8efe3XOca8Ly7N2tyXr6NjF6tTXkvvpg?=
 =?us-ascii?Q?tQaglXxZiwTTOOW9TyBjKvzYH2DtRTDmnRCe5slRg3QMkhuL3UlRUIliGKEw?=
 =?us-ascii?Q?6cCbz1r6rHt7+Vtpq+0nyrEfiY1TfZq+BrZw1rID5zBhiYYMZCOrSknUmQ8A?=
 =?us-ascii?Q?2yn7Dw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nkuh1wq7qmApg59bxXrTOpyliDzBYtmwUkYyFSV9TCVbSrQ4NO1DdXVyfOy92uiJhk1q1BVL0t4N4LJHfhYNBto3g3MSy9kWZ6Q3xI9cOcCNTo0iU8mVaZ5CZswrCwmdEPyO91g/xp1eodVqvb0yH6c5TdPA8IQ61DHN+jIExEpnWoSXSHivURDMKI+RhevJ3dRXQFC67ZYSTLe/D3rO2plHUGY4irf4yv8TOBoG1Fk6vVholUEqr7X1S9m2KxhQFQKASzr0RoN8Mi5vcmt51FNekuhSy48n/+KmqWzVHorP2NZ/ys2zXivz9lyYk38HyGDRxPwHM4dm0cf+787PrzgJcMryFohGuUYBRXbOPTth2IqmDZ0M7STksyluBPSn8X82GI+/93WZulubPTOy6Wmx/p35g8oDwzHzUaxzlWO/4pf3gld+rMHUPpiVLJ+w
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:12:27.6625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9ec9dd-7f69-4538-85df-08de6e47ba1f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997804
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 17:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17108

meta-arago / na / 20260217165709.812321-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago.conf: Remove obsolete mir=
rors
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 10:57:09 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 748cbc0906dcf441ba53853d9a62a67f8=
48b8f20

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 61171ba24123649fe6cd3ef567ca3e767d9a7d6a

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




