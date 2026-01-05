Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F95ACD0420
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:43:04 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77518.1767652983100249176
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qbeF8o24;
 spf=pass (domain: list.ti.com, ip: 40.93.195.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAeBzsdildB5VWlNw+DfGIy0s5kRQVX6pHcu1tZ+oXKS8cl+MX+VjW4zik9BlHJkIZ0aZiDRcmSERHPGYcOCZoTPSzdzal954S9zUQUywzTbLvrrVa74fxib1b/A4GRjGyax7N8PRTQMoqTLc8Y4clGZJ6xOHkFIFywd6WaKjRKKd+elsZeRRPfLJ/YLx1jS748iUERYE34lxdN4Itx6FBQ5W9xGfe8cwgNJZRKpI8cR/SElaVpTcxMcxlilJsSDqHn04edpdCmzVGqUVxrnz6LFUc43Xm4CdVCuzv4j97G2wRXowjMsA0oJsNl7sN3YF1OvvvTaJ4/KnZxvGROOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s3PxG0rDsSduHmXIZV/HED0zlBZVsAZ1XqheGezBZ8=;
 b=oiFuM2MC8s0iSil+6OEZFtcnLEySGgr5dESYTBbubINnHIbkvbZpVHxlDvTaNR/e4ES+UZgqL+AhcpWrJ2qr7e9qd57qaVCK9yAO2lRNM0TGdrZDJT2iyJOKg/EETRK3dqGAAV1Myhsm/MZsTnGQPTqfw7XAIxU8mdJaE3EOVqT5X+M9FrtS32iT7ZTeuyqDHkGe61vVi5Cz7GVj0J0+svvLNVnWI0Uwn3aHzamEXyzTSZYg9JR+dDcXBTGGjTJXOVhP3v2Nx4XU8GHq9w5nDfGdSdJzdQLu7DirsGBhaa461/b6tM6OibuHMFPmvuFr/tjtIBp5C3jwLqtR0AvieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s3PxG0rDsSduHmXIZV/HED0zlBZVsAZ1XqheGezBZ8=;
 b=qbeF8o24ua4GrRaCTJF+CNhNdIvxPwUeKl5WtSb5KCZGezrofjPA6a31rliC//93aITAaiMdRS1jy82zehIBbUjAK4Zm9bDyv2MHm5RifL3MOC5rUam7Hi39Ih2aNShyjjJLHwa5V7VpLe656XRYnXvCkUZ4WW93HrX2z+P46Qd4Az4vwgFXkVNuUvypvmWxHi+z0Dx8kOHDo4WsPWA+8mBzyFRYuHdeXcdbl2f7eyFt9/vuI6UvIjp0mIj6PpBC1XpGYqDITUwjgzbVZ6uO2Qs8DST2561tkiY740fnR04J8CckFnpIZLwidL8HC7ivtREh9fKflIkmBeyzTWpXSA==
Received: from BYAPR08CA0021.namprd08.prod.outlook.com (2603:10b6:a03:100::34)
 by CO6PR10MB5604.namprd10.prod.outlook.com (2603:10b6:303:14b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:43:00 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::2e) by BYAPR08CA0021.outlook.office365.com
 (2603:10b6:a03:100::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:42:58 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:42:56 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:42:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:42:56 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MgudG2008822;
	Mon, 5 Jan 2026 16:42:56 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0B4AC9ACF4; Mon,  5 Jan 2026 16:42:56 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use core packagegroup to include valgrind
Date: Mon, 5 Jan 2026 16:42:56 -0600
Message-ID: <20260105224256.3745276-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105222205.2503660-1-afd@ti.com>
References: <20260105222205.2503660-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|CO6PR10MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 547f3c98-9cbd-42b3-f618-08de4cabc6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ynHLaU2FICjU/wU4lzy+9T7tKZiQ47waN+l1e530kM8MkDaYTtmyhBAV481D?=
 =?us-ascii?Q?kGbv4oBdtakVqssg/0DUUlvNO5haOHCu3YIGoiGM8LiFL20ynXCURBF8apbB?=
 =?us-ascii?Q?zEzdU0mdYS3lEdEC0yhAaZ5YqPhSkKlVexyp5l04gqovzckelhLWyTmffedd?=
 =?us-ascii?Q?fWahZvbSNVgfW4NjX85hVyI6o6jrqNvQQSgkTb7cn0IZJCQGbHvBIT+sSHzB?=
 =?us-ascii?Q?A83812EC0JOmWbHd0Nr7RdyY6fYBRFI+uMOtQa44OpcJkx5i33k9qRNtx6WR?=
 =?us-ascii?Q?WpTdIcT3e+vZ7hGOvh0hBTxAZOlaC1CsFoM5Tr5sUa159fL2NoKLZfyRH3hd?=
 =?us-ascii?Q?pz/0ORbRBxoY4OsU4cAYSMgB2AQAbByrIwoe1xwEDvXaTeCs4G0OuVRjBPNo?=
 =?us-ascii?Q?B2YbtzUGM5OJzweVcnT/Sz7GdvDsoEByKkWg+E9QHQotKhVW/TbhyInAXXMg?=
 =?us-ascii?Q?fvJClZvGKQIFFAY2H0K0iGB/lCzLExJV2t8b1Y9/+pZ+ZYVLWRAzWQYypsBJ?=
 =?us-ascii?Q?yno+6XA/U+U51oihmCeUy95HdAVMjl9/H05lsUf0KFRmfFP+i6pOnLu6q07X?=
 =?us-ascii?Q?WToFLcc5Ju1Zieh2TByjWEMb7lR617US/SCg+qv6RhiPd0pQGKtKoxgpmxtW?=
 =?us-ascii?Q?x61tZZ8W8ybKntKQw2uzJPSmZ5KdTQvRTaGRMLJ/vL5cMNYcY+KVWpx+N6/S?=
 =?us-ascii?Q?BKiW+gf5lonmk7qh5Rx3/bNlRclMf6H4Za5I4rjJelfzC1Z5d2JR0zkfzhuu?=
 =?us-ascii?Q?gocCZJ5PYsExV4JPOEhlOaEX5hWFEmbv5gjzhVduby5RhAx8z0x4G19rtuHg?=
 =?us-ascii?Q?VTUyqjsSWQORShh7JykMeSFcoZtQ8oo9HfH0wmdpKVHtwi7LfkdIiBRCgoi+?=
 =?us-ascii?Q?+xdH3pZxaxQVFnJhXrnBjZLkjd23Cdumr+YlddHtG6rmEje5vdgZOU2g03iF?=
 =?us-ascii?Q?QYLJDtYHtjqzSecGGyA6hwEubtx2AdLQzn6O/X4f1QCYmD2EO6LjmJWIUFaz?=
 =?us-ascii?Q?rOcvAxs5vRoerxL875oJ8li6/6ewTxwJvII+EGOABF5AHjaTfA3l6kc7R98o?=
 =?us-ascii?Q?NH3n8rKFANRIgLPiOc9d2rPrbvhm511JetjMt3CGHngfwP4d1hl+AjZCpRFG?=
 =?us-ascii?Q?rxTa/O2iHFUtkYngzS57icp97ebyL1t2DINwDrEzk+cd3ODXvg6cnoy+DtcL?=
 =?us-ascii?Q?puU0XhCXw5jaO3S4ZdyEOLwAwEbWBtEs1pGgG4s4KJFcYvIT1JKGaeyypthe?=
 =?us-ascii?Q?qVe9GBez9d+ZTXbNx5r4QgPc26dfUP0jQoDgBfdJ7OY9cIbuQAMntSzapjtM?=
 =?us-ascii?Q?wdVQOphH1Cx5/E+yBv7CJRKThbXG3uKdffHMR+D1ZHuKrwj7vdU6aSeXWeLn?=
 =?us-ascii?Q?0SvI1uHpJF1wMLyLqlML45Zg4/d73bFOm4Lo74JrInwAYiJ1rPBthaWas5AG?=
 =?us-ascii?Q?HgO3SBHHlP5WlIZOqQYkJ+EpYtioXhYE0h/OQSI9OeCpn9muBGgxye1l/8I8?=
 =?us-ascii?Q?yHU9dIxaitlSCnbnjdgl3FeXLvU8zOvbZYnjQYJC6gSp/C64uz2r8z/jaSTx?=
 =?us-ascii?Q?gBhM0CiPk8AIk2LnF34=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:42:58.8272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 547f3c98-9cbd-42b3-f618-08de4cabc6a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5604
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:43:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16928

meta-arago / na / 20260105222205.2503660-1-afd

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
- Patch Series: [meta-arago][master][PATCH 1/2] tisdk-default-image: Use co=
re packagegroup to include valgrind
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 5 Jan 2026 16:22:04 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 196cc6fcca1cccdac12fbed2302b1f8a2=
8db5b94

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
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




