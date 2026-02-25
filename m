Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ED5F55441
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:39:08 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37351.1771987143283623435
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=QXCtfOdE;
 spf=pass (domain: list.ti.com, ip: 52.101.193.0, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dptjyjEGOqKi5jkhEHmry9q1q69/5qa2u2EiEkpAvjVKRGlCB2sh66lM7d7U8ta5jRp1/wCps9rQXl/KsYpRXDQGCeBmwsZtxbeJ2LXNLkKPLdck4MRUurmiXTVuoGqNRy1KTRv3eoTlBt+zg/h8wZagYkFon4T5hjhKs95Dp0X8GLV84HSrMG9cA9gOQXYuSYPz7kCRkDohiqqeoMq8KBWID0SJvfAMt+1UXWNkWS8UbytmHJs4fAi3U0gqrdhAkHGkCbNQ/kveKxm+aV24ckpUYu1GVg8StjIoFnvhAonFFx4RJyNAtD3IVohOzMlPV4D6UnhXcwNfdIW5ia9DpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqi0OxvJeKW9mUX+TCcWdzhjKAuUMZdEHtUl4i/sKUc=;
 b=vZSbqgSNPP5w6vY2oQhTM/Zbe6hdBXWTjE8dPhW81PAmSyaBLqvocg91SYeZlwXUl6S1aE8ACp75YG82fHqams+Rl4Kx+YrZ5M0iiszXpNl68uqIsAFdaeGA+xergEg3r6FlBMz49GPlPUvsCmUvUlEI9HpoqlTYTe8xmdTO/dI8coeLiZPSqb6Ws9avKf6pUADLVvA2shmBH4pTsfParOqA/J4HoiyUOMMlbWQo+dQhK4yXZho+AqLeYPqkGkJtYCT5bgCMUGN9vKo4qQF6X+z9+5qYfBBqK/4RbNQqmb6wwF2MEkS85fGdyTogNIxKoeuMWwKt5pOwNqKs6twfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqi0OxvJeKW9mUX+TCcWdzhjKAuUMZdEHtUl4i/sKUc=;
 b=QXCtfOdEUk5V0Z4UyfMx54DYp/vXKd78NqEjamuI0UlbOACNmeNnaMaESX8m0qcy5V+CdEg9fgGwPWJqPMs6swnsgBwkPSwVFcLIrTuZUd1Xy4+bdl4pPC1IxxhlQ0MIT0cwN4LgReIHvCwwHfnRFcgmuHf2FJmOQvJWVV2pIS82cQjFicW5askL6F2LLmc9HiR5ckK9sVb9tq1isBSQEy/kTk1RHDjG6CSVT3PaA1vuJazF+8lcACto8Q5MySLHb3oE7WDnJh/fcuDXLM6IYudzRNwjjca16Q0bV7wYFVoSQ5ZxJ72YpK9qTPzY1CRybLsHDeR6G/dt0sBk2NqecA==
Received: from BLAPR03CA0125.namprd03.prod.outlook.com (2603:10b6:208:32e::10)
 by IA0PR10MB7182.namprd10.prod.outlook.com (2603:10b6:208:403::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:39:00 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::fd) by BLAPR03CA0125.outlook.office365.com
 (2603:10b6:208:32e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:38:58 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:38:45 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:38:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:38:45 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2cjsx3335707;
	Tue, 24 Feb 2026 20:38:45 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 635202A5B; Tue, 24 Feb 2026 20:38:45 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago.conf: Tweak a couple of settings following oe-core changes
Date: Tue, 24 Feb 2026 20:38:45 -0600
Message-ID: <20260225023845.2204913-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225021057.2555571-1-reatmon@ti.com>
References: <20260225021057.2555571-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|IA0PR10MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: aeacff41-4fbd-442f-0cf0-08de74170734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|34070700014|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qG3wUhljAy21A/uWBLGrmJofjyPE5zGVqeqJu3kYt1utAgIhUCGCwlWIivgj?=
 =?us-ascii?Q?BMyfWjK/9RJ4A8T25NHQoqjAdB4F9ZLdv6z7fOtF0Nh9eyHCcontksqf+4VB?=
 =?us-ascii?Q?1Fh5EC2l4WJf+gd47UjN0tqt0IUTJIqFas0qLAaXVOlGxnJ1kucFE+2k8mUx?=
 =?us-ascii?Q?gPbzUeRMv7ncBTok+p5M0+Bbxxc4lMMjWVeBDn8Ewj+ztQIA6eaRaBrBAgXU?=
 =?us-ascii?Q?cr+eQZtspv04W2jlG6yEgdHx7+af7hZxAZ/lfi7Fm2jZJHhxuplp4qiku24p?=
 =?us-ascii?Q?O0j+RmLjVv6okEQy94GfgSKSJi3qwFgIcyk+B1ZdjYmid00COIPb1Ga/Awrw?=
 =?us-ascii?Q?3aP7lVtuXf5C06stGvse+qcit69pBaN4ZmvkaRBFsOUWoltaXL0xnp+1X+lH?=
 =?us-ascii?Q?WmbVFO0CM8Y4u57VrRb/6ELZyMdwbWF0j+QjtBzDDoe3YD8qQLhj4BPmPPPr?=
 =?us-ascii?Q?zMJ0PXrlLco20VllBGVbYlXzUGPys0R2kPppLJQ3pF14Xc4nOITF7QHh+fug?=
 =?us-ascii?Q?QdiyzM6gwW3lJFhx/9rMCEwi736eDlqTdQhwf4HpdjnPoUdzh83otS0AEOg3?=
 =?us-ascii?Q?pWGNt1OUeiwPwIiyUAnSsQQmr2hcX46WMHpzZ+VnMLX5tiq1G+OUG+VGBBzS?=
 =?us-ascii?Q?jt8ueSVTA13Ge7pjS5CRIunHG6oCyW5gk2fYl3NFJGkn3SGsgqkRQ6ST9Hql?=
 =?us-ascii?Q?uUYV4cBK0MhGStwrYPpybTf5tUrKDzREbd6yq/OXMC8a3XtxoLEAaDyQAI/m?=
 =?us-ascii?Q?uu2sZyjDVd4Bks3lsxTOn9NHOMoRaiCLVYmTCumYA03W1kD7tu2Kta9bren1?=
 =?us-ascii?Q?ZtD/fHvOt1okizP3Y4bPXOPS30EouGck4wxN0ojM1Y7WHOjyLzTNMvrO3OyG?=
 =?us-ascii?Q?uI/lVjnfYc7/gBrHswm/8RkCHvGn73445tz41V3BwNgmALKfNSAfjSCJ1A5B?=
 =?us-ascii?Q?2tbBnIEYGXvPAxnALDPNjKcjQndR11BPQsj27rkfAL7NMBwv4/m1Ucu60xHN?=
 =?us-ascii?Q?WHB1rWRsG5NXKM2/dnXL4pBa30bcRAcSudA8Kzha5XOKLYsMzGoK1e4QAVSr?=
 =?us-ascii?Q?7ahrsGz2rthB4pnvmOZZUCrNF2KZs5wYuyc2RCQ+dEk24llis176tqlsj7oY?=
 =?us-ascii?Q?QBlRApRiaYqBNLdLjyPsFbQ1pRF+NMsfPE06rrlxD7A18YnNXoGdEBi+aX66?=
 =?us-ascii?Q?dU0LkyMTke5DNOoC3HqttwBa5BT8uslQUYqa7DYo1+jIZerYvDVwtbCR5Bo5?=
 =?us-ascii?Q?0mhIxFXlGC0x52BVFFOGPFJB94+rNfDUV6jl8X1oNX2iypm5XbXDQpU+S4dJ?=
 =?us-ascii?Q?rLfQ5ZrBlIAm67hC4m3Xms+Bia3mFq6GOpejFmOi5Gbu84I4kmC7C2HU0+Pe?=
 =?us-ascii?Q?KfgaYVi0Gtq3WXj/O246uSvQDx6B6fXh3O4eWEQWs8cBLPMtShxDDMGYrQk5?=
 =?us-ascii?Q?v9N4j/7xGO6IQFAamCQnX+bidXgwYNeJX5+d1qfGq5ms6RVnGHO6ZZTlvche?=
 =?us-ascii?Q?hYiQ8C6/7it4PDn/3Q5u5pXc9wAAc7MSHxt/B6hs+Iqo+g/8y+TWCp9dmy9Y?=
 =?us-ascii?Q?CELqZBvFjON6YdUikjqwCLw/VqmjlopHyLvvvfl8Zv5B/5h6PYrry6o10+NV?=
 =?us-ascii?Q?CquAyuAB5DYUYkxj1wVoTmPIDafx4CEzqaztzqZLZZcCElA9X/pvs5Tky8cg?=
 =?us-ascii?Q?vVPG3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34070700014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	whh2BfdmnYplPxXKk+EO9Xoait0zOtSnQcG69P/w6Zghuq7SsQSl98/tGKapNGOIQmcU+4Uv7Q+gUmJbVQ2M7F0whEMfrkija6tMM8ukEbL4mnY+K7/zuqjGF7wgwI0iWg8bY/O8MJ0YA0BugkNFPtmEYSjmH83/eI1BWdiF5WC5Ko3wOD4KeDED2GuJvSAgRnxsSlE8jo7jB3SEfAVsitC/N3zNMZFCA8G7CtPZKDqLxyNdjZy3jD6hS7U7kEbULaRWG11N2TjTICWAdfMJthqFTJ1z+ix8pI4yAFg8AlSGt4AQfcxyFmLf6FZ1PNoHGsK95SKGJNEbLZCws/EgxgqkIBBIJ/Y2s/LJhxtVR3DGBmq103NrHvDwgnII7q1/UO0geNnAYx693E7XRvboqMl5w6nt20CqCUDykhYZlUUeL46gv0rl4qi8QHxfYyKY
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:38:58.5940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeacff41-4fbd-442f-0cf0-08de74170734
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7182
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17144

meta-arago / na / 20260225021057.2555571-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago.conf: Tweak a couple of s=
ettings following oe-core changes
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 24 Feb 2026 20:10:57 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7881857ae8402518af328604ffcad678d=
38753f4

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
   container-registry-populate:do_populate_registry: ab6659ef5e1dd920f1583b=
2436db4d7d8cacedfb0128d795aac80c086f04d766 -> 57f7e23ef5ff9bdb44e7a7026547c=
b94d1ffd261b5a3114e89bbfe722179ebc7
      bitbake-diffsigs --task container-registry-populate do_populate_regis=
try --signature ab6659ef5e1dd920f1583b2436db4d7d8cacedfb0128d795aac80c086f0=
4d766 57f7e23ef5ff9bdb44e7a7026547cb94d1ffd261b5a3114e89bbfe722179ebc7
      NOTE: Reconnecting to bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):eb31b7=
0d-dc29-4ca7-b1de-b3132a1ec693 to nostamp(uuid4):c33400ac-be5b-4389-bf82-4a=
f15ac4e559




